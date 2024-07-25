const utils = require("./sort_keys");
const modList = utils.getModsList();
const modListString = `${modList.join(";")};`;

console.log(modListString);
