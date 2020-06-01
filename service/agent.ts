import edge from 'edge-js';

export class Agent {
    private createAgent = edge.func({
        assemblyFile: '../lib/bin/Debug/netstandard2.0/Protocol.Aries.dll',
        typeName: 'Protocol.Aries.AgentNodeInterOp',
        methodName: 'CreateAgent'
    });

    public get(): void {
        const result = this.createAgent({}, true);
        console.log(`Agent.get() result ${result}`);
    }
}
