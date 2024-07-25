const fs = require("fs");

// 读取文件内容
fs.readFile("types copy.xml", "utf8", (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  // 使用正则表达式替换匹配到的数字并翻倍
  const modifiedData = data.replace(/<nominal>(\d+)<\/nominal>/g, (match, number) => {
    if (number < 2) return `<nominal>${number}</nominal>`;
    const doubledNumber = ~~(parseInt(number, 10) / 2);
    return `<nominal>${doubledNumber}</nominal>`;
  });

  // 将修改后的内容写入文件
  fs.writeFile("output.xml", modifiedData, "utf8", (err) => {
    if (err) {
      console.error(err);
      return;
    }
    console.log("文件已成功修改并保存为 output.xml");
  });
});
