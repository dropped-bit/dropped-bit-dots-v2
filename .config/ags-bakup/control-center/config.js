
import GLib from "gi://GLib?version=2.0"

// CONTROL CENTER
import { BatteryLabel, Volume } from '../simple-bar/config.js';

// Set images
App.addIcons(`${App.configDir}assets`)

// Get current username to generate absolute paths
const username = GLib.get_user_name()
const divide = ([total, free]) => free / total

// Get current time
const date = Variable("", {
    poll: [1000, 'date "+%H:%M:%S %b %e."'],
})

// Get CPU information
const cpu = Variable(0, {
    poll: [2000, 'top -b -n 1', out => divide([100, out.split('\n')
        .find(line => line.includes('Cpu(s)'))
        .split(/\s+/)[1]
        .replace(',', '.')])],
})

const cpuval = Variable(0, {
    poll: [2000, 'top -b -n 1', out => Math.round(divide([100, out.split('\n')
        .find(line => line.includes('Cpu(s)'))
        .split(/\s+/)[1]
        .replace(',', '.')])*100).toString() + "%"],
})

// Get RAM information
const ram = Variable(0, {
    poll: [2000, 'free', out => divide(out.split('\n')
        .find(line => line.includes('Mem:'))
        .split(/\s+/)
        .splice(1, 2))],
})

const ramval = Variable(0, {
    poll: [2000, 'free', out => Math.round(divide(out.split('\n')
        .find(line => line.includes('Mem:'))
        .split(/\s+/)
        .splice(1, 2))*100).toString() + "%"],
})
// CPU Widget
const cpuProgress = Widget.CircularProgress({
    className: "circularprocess",
    value: cpu.bind(),
    child: Widget.Label({
        label:cpuval.bind()
    })
})

const cpuProgressBox = Widget.Box({
    vertical: true,
    children: [
        cpuProgress,
        Widget.Label({
            className: "circularlabel",
            label: "CPU"
        })
    ]
})

// RAM Widget
const ramProgress = Widget.CircularProgress({
    className: "circularprocess",
    value: ram.bind(),
    child: Widget.Label({
        label:ramval.bind()
    })
})

const ramProgressBox = Widget.Box({
    vertical: true,
    children: [
        ramProgress,
        Widget.Label({
            className: "circularlabel",
            label: "RAM"
        })
    ]
})

// Battery
const battery = await Service.import('battery')

const battery_time = battery.bind('time-remaining').as(value => {
    if (value !== null && value >= 0) {
        const hours = Math.floor(value / 3600); // Calculate hours
        const minutes = Math.floor((value % 3600) / 60); // Calculate remaining minutes
        return `BAT: ${hours}h ${minutes}m`; // Return formatted string
    } else {
        return 'Calculating...'; // In case value is not available yet
    }
});

child: Widget.Label({
    label: battery_time
})
//
// const battery_time = battery.bind('time-remaining').as(value => value.toString())
const batteryProgress = Widget.CircularProgress({
    child: Widget.Label({
        label: battery.bind('percent').as(value => value.toString() + "%") 
    }),
    visible: battery.bind('available'),
    value: battery.bind('percent').as(p => p > 0 ? p / 100 : 0),
    className: "circularprocess",
})
const batteryProgressBox = Widget.Box({
    vertical: true,
    children: [
        batteryProgress,
        Widget.Label({
            className: "circularlabel",
            label: battery_time,
        })
    ]
})
// labels

const os = Widget.Label ({
    className: "os",
    label: "󰣇"
})
const greeting_label = Widget.Label({
    className: "greeting",
    label: "dropped-arch"
})

const os_greeting = Widget.Box({
    className: "greeting_box",
    vertical: false,
    children: [
        os,
    ]
})
const greeting_greeting = Widget.Box({
    className: "greeting_box_label",
    vertical: false,
    children: [
        greeting_label
    ]
})

const battery_indicator = Widget.Box({
    vertical: false,
    children: [
        Widget.Label({
            label: "test"
        }),
    ]
})

// test image
// const greeting = Widget.Box({
//     vertical: true,
//     children: [
//         Widget.Button({
//             className:"welcome",
//             onClicked: () => {
//                     print(':: Hello')
//                 }
//             label
//         })
//     ]
// })

// Sidebar Box
const Sidebar = Widget.Box({
    spacing: 16,
    vertical: true,
    className: "sidebar",
    children: [
        // Widget.Box({
        //     className: "group",
        //     homogeneous: false,
        //     children:[
        //         os_greeting,
        //         greeting_greeting]
        // }),
        Widget.Box({
            className: "group",
            vertical: true,
            homogeneous: true,
            children:[
                // BatteryLabel(),
                Volume()
            ]
        }),
        Widget.Box({
            className: "group",
            homogeneous: true,
            children:[cpuProgressBox, ramProgressBox]
        }),
        Widget.Box({
            className: "group",
            homogeneous: true,
            children:[batteryProgressBox]
        }),
    ]
})

// Sidebar Window
export const SideBarWindow = Widget.Window({
    name: 'sidebar',
    className:"sidebar_window",
    anchor: ['top', 'right'],
    // Start with hidden window, toggle with ags -t sidebar
    // visible: true,
    visible: false,
    child: Widget.Box({
        css: 'padding: 1px;',
        child: Sidebar,
    })
})
