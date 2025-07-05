import { SideBarWindow } from './control-center/config.js';
import { Bar } from './simple-bar/config.js'
App.config({
    style: "./style.css",
    windows: [
        SideBarWindow,
        // Bar(0),
        Bar(1)

        // you can call it, for each monitor
        // Bar(0),
        // Bar(1)
    ],
})
