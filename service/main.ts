import { Agent } from './agent';

try {
    console.log(`creating an agent`);
    const agent = new Agent();
    agent.get();
} catch (e) {
    console.log(`exception ${JSON.stringify(e)}`);
}
