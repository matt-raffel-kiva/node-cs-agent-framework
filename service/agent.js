"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var edge_js_1 = __importDefault(require("edge-js"));
var Agent = /** @class */ (function () {
    function Agent() {
        this.createAgent = edge_js_1.default.func({
            assemblyFile: '../lib/bin/Debug/netstandard2.0/Protocol.Aries.dll',
            typeName: 'Protocol.Aries.AgentNodeInterOp',
            methodName: 'CreateAgent'
        });
    }
    Agent.prototype.get = function () {
        var result = this.createAgent({}, true);
        console.log("Agent.get() result " + result);
    };
    return Agent;
}());
exports.Agent = Agent;
