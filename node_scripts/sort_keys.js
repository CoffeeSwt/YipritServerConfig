const path = require("path");
const fs = require("fs");

const ROOTPATH = "../";
const KEYPATH = "../keys";

const getModsList = () => {
  const items = fs.readdirSync(ROOTPATH);
  const modRegx = /@+/;
  return items.filter((i) => modRegx.test(i)).map((i) => i);
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
  return getKeysNameAndPathList().filter(
    (key) => !existKeys.includes(key.name)
  );
};

const mergeKeyFile = () => {
  const notExistKeys = diffCheck();
  notExistKeys.forEach((key) => {
    const sourcePath = key.path;
    const destinationPath = path.resolve(KEYPATH, key.name);
    fs.copyFile(sourcePath, destinationPath, function (err) {
      if (err) console.log("something wrong was happened");
      else console.log("copy file succeed");
    });
  });
};
mergeKeyFile();
