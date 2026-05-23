# JSON Validation against Schematron

- The Schematron file (*library.sch*) defines rules and assertions to check the structure and content of a books inventory file (*library.json*).
The schema includes two phases for multi-step validation, the rules covering aspects like the "genre" and "author" properties, but also a "short_bio" and "short_desc" properties.

- Oxygen supports JSON validation against Schematron, allowing to make further assertions about patterns found in JSON documents. 
Schematron validation rules also provide the ability to specify custom, precise, and helpful messages if errors are encountered.

- Oxygen includes a built-in JSON Schematron Validator engine to validate JSON documents against a Schematron schema specified in a custom validation scenario.
You just need to configure a validation scenario, choose the JSON Schematron Validator engine, and specify the Schematron schema. You can also specify a Schematron schema using the Validate with action.