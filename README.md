# Model Code Generator for Flutter

Model Code Generator is a simple command for make a model in flutter. it's very easy to use.

## What It does?

- [x] Create a model file based on your json.
- [x] Include fromJson and toJson function.
- [x] No internet connection needed.

## How to Use?

Add Model Code Generator to your `pubspec.yaml` in `dev_dependencies:` section.

```yaml
dev_dependencies:
  model_code_generator: ^1.0.0
```

Update dependencies

```
flutter pub get
```

Run this command to create model file.

```
flutter pub run model_code_generator <yourclassname>

Example:
flutter pub run model_code_generator user
```

Then insert/paste the json
Example JSON:

```
{
  "name" : "John Doe",
  "Age" : 25,
  "isHandsome" : true
}
```

Where `<yourclassname>` is the class and file name that you want for your model. replace it with any name you want.

## Contact

- Email : [dyakuza893@gmail.com](mailto:dyakuza893@gmail.com)
- LinkedIn : [Doni Nugroho](https://www.linkedin.com/in/doni-satrio-nugroho)
