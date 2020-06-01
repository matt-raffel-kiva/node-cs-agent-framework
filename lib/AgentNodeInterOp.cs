using System;
using System.Threading.Tasks;

namespace Protocol.Aries
{
    /// <summary>
    /// This class is the go-between for javascript to dotnet and vice versa
    /// The expectation is that nodejs app is using edge-js to bridge to
    /// dotnet so the function signatures have to match its requirements
    /// </summary>
    public class AgentNodeInterOp
    {
        public AgentNodeInterOp() { }

        public async Task<object> CreateAgent(object data)
        {
            return true;
        }
    }
}
