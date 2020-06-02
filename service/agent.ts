import edge from 'edge-js';

const lib_path = '../lib/bin/Debug/netcoreapp1.1/Protocol.Aries.dll';

console.log(`lib_path: ${lib_path}`);

const createAgent = edge.func({
    assemblyFile: lib_path,
    typeName: 'Protocol.Aries.AgentNodeInterOp',
    methodName: 'CreateAgent'
});

export class Agent {

    public get(): void {
        const result = createAgent({}, true);
        console.log(`Agent.get() result ${result}`);
    }
}
