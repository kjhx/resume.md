const puppeteer = require('puppeteer');

var file = process.argv[2];
var file_fullpath = __dirname;
file_fullpath = file_fullpath.substring(0, file_fullpath.length - 4) + '/out/html/' + file;

var out_file = process.argv[3];

console.log(file_fullpath + ' -> ' + out_file);

(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    await page.setCacheEnabled(false);

    await page.setViewport({
        width: 1280,
        height: 600
    })

    try {
        await page.goto('file://' + file_fullpath, { waitUntil: 'networkidle0' });
    } catch (exception) {
        console.log(exception + '\nPlease report this error at https://github.com/kjhx/resume.md/issues.');
    }

    await page.emulateMedia('screen');
    await page.pdf({
        path: out_file,
        format: 'Letter',
        margin: {
            top: "0px",
            left: "0px",
            right: "0px",
            bottom: "0px"
        },
        printBackground: true,
        preferCSSPageSize: true
    });

    await browser.close();
})();