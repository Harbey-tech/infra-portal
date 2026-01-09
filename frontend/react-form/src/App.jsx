import { useState } from "react";

function App() {
  const [projectName, setProjectName] = useState("");
  const [region, setRegion] = useState("us-east-1");
  const [instanceType, setInstanceType] = useState("t3.micro");

  const handleSubmit = (e) => {
    e.preventDefault();

    const yaml = `project_name: ${projectName}
region: ${region}
instance_type: ${instanceType}
`;

    console.log("Generated YAML:\n", yaml);
    alert("YAML generated. Check console.");
  };

  return (
    <div style={{ padding: "2rem" }}>
      <h2>Terraform Config Generator</h2>

      <form onSubmit={handleSubmit}>
        <input
          placeholder="Project Name"
          value={projectName}
          onChange={(e) => setProjectName(e.target.value)}
        />
        <br /><br />

        <select value={region} onChange={(e) => setRegion(e.target.value)}>
          <option value="us-east-1">us-east-1</option>
          <option value="us-west-2">us-west-2</option>
        </select>
        <br /><br />

        <select value={instanceType} onChange={(e) => setInstanceType(e.target.value)}>
          <option value="t3.micro">t3.micro</option>
          <option value="t3.small">t3.small</option>
        </select>
        <br /><br />

        <button type="submit">Generate</button>
      </form>
    </div>
  );
}

export default App;
