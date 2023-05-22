const http = require("http");
const child_process = require("child_process")
http
  .createServer((req, res) => {
    let proc = child_process.exec("./deploy.sh",() => {})
    proc.stdout.pipe(process.stdout)
    proc.stderr.pipe(process.stderr)
    res.end(`i am ready!!!`);
  })
  .listen(9000, () => {
    console.log("deploy server start");
  });
