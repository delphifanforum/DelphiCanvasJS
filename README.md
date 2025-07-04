# Delphi + CanvasJS Chart Example

This project demonstrates how to integrate [CanvasJS](https://canvasjs.com/) interactive charts into a **Delphi VCL** application using the built-in `TWebBrowser`.

## 📸 Preview

![chart-example](https://i.ibb.co/nNCSrQRq/chart.png)

## ✅ Features

- Local HTML chart rendered in `TWebBrowser`
- CanvasJS `column` chart
- Chart data passed dynamically from Delphi variables
- Reload chart with new data using a button click

## 📁 Files

- `Unit1.pas` / `Unit1.dfm` — Delphi form and code
- `canvasjs.min.js` — Local copy of the CanvasJS library
- `CanvasJS_Chart.dpr` — Project file
- `README.md` — This file

## 🚀 Getting Started

1. Open `CanvasJS_Chart.dproj` in Delphi
2. Make sure `canvasjs.min.js` is in the same folder as the EXE
3. Run the project
4. Click the button to reload the chart with new data

## 🧩 Compatibility

- Tested with **Delphi 10+**
- Works with **TWebBrowser (Internet Explorer engine)**

## 📌 Notes

- The WebBrowser control uses **IE7 mode** by default. To enable full HTML5 & JavaScript support, the app sets the IE emulation mode to **IE11** using the Windows registry.
- You can switch to **TWebView2 (Edge)** for better modern HTML/JS support.

## 📜 License

This project uses [CanvasJS](https://canvasjs.com/) under its **free non-commercial license**. For commercial usage, please [get a license](https://canvasjs.com/license/).

---

Made with ❤️ using Delphi and CanvasJS.
