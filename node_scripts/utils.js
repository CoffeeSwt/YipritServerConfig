const path = require("path");
const fs = require("fs");

const ROOTPATH = "../";
const KEYPATH = "../keys";

const getModsList = () => {
  const items = fs.readdirSync(ROOTPATH);
  const modRegx = /@+/;
  return items.filter((i) => modRegx.test(i)).map((i) => i);
};

const getModListString = () => `${getModsList().join(";")};`;

const mergeBatScript = (name) => {
  if (!name) return;
  try {
    // 使用 fs.readFileSync 读取文件内容
    const data = fs.readFileSync(path.resolve(ROOTPATH, name), "utf8");
    data.replace(/(-mod=)[^,]*/, `$1${getModListString()}`);
    fs.writeFileSync(path.resolve(ROOTPATH, name), data, "utf8");
  } catch (err) {
    // 处理错误
    console.error("Error merging file:", err);
  }
};

const getKeyPath = (modPath) => {
  const KeyPath1 = path.resolve(modPath, "keys");
  if (fs.existsSync(KeyPath1)) return KeyPath1;
  const keyPath2 = path.resolve(modPath, "Keys");
  if (fs.existsSync(keyPath2)) return keyPath2;
  const keyPath3 = path.resolve(modPath, "Key");
  if (fs.existsSync(keyPath3)) return keyPath3;
  const keyPath4 = path.resolve(modPath, "key");
  if (fs.existsSync(keyPath4)) return keyPath4;
  return null;
};

const getKeysNameAndPathList = () => {
  const modsList = getModsList();
  return modsList.map((mod) => {
    const modPath = path.resolve(ROOTPATH, mod);
    const keyFolderPath = getKeyPath(modPath);
    if (!keyFolderPath) return;
    const keyName = fs.readdirSync(keyFolderPath)[0];
    const keyPath = path.resolve(keyFolderPath, keyName);
    return {
      name: keyName,
      path: keyPath,
    };
  });
};

const getExistKeys = () => {
  const keys = fs.readdirSync(KEYPATH);
  return keys;
};

const diffCheck = () => {
  const existKeys = getExistKeys();
  const currentKeys = getKeysNameAndPathList();
  const needAdd = currentKeys.filter((key) => !existKeys.includes(key.name));
  const redundantKeys = existKeys.filter((keyName) => {
    if (keyName == "dayz.bikey") return false;
    return !currentKeys.map((i) => i.name).includes(keyName);
  });
  return {
    needAdd,
    redundantKeys,
  };
};

const mergeKeyFile = () => {
  const diff = diffCheck();

  //add notExist
  diff.needAdd.forEach((key) => {
    const sourcePath = key.path;
    const destinationPath = path.resolve(KEYPATH, key.name);
    fs.copyFile(sourcePath, destinationPath, function (err) {
      if (err) console.log("something wrong was happened");
      else console.log("copy file succeed");
    });
  });
  //cleanRedundant
  diff.redundantKeys.forEach((keyName) => {
    const keyPath = path.resolve(KEYPATH, keyName);
    fs.rm(keyPath, function (err) {
      if (err) console.log("something wrong was happened");
      else console.log("delete file succeed");
    });
  });
};

module.exports = { mergeKeyFile, mergeBatScript };
