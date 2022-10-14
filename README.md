
## 🚀 Usage

Create a file named `remove-branch.yml` inside the `.github/workflows` directory and paste:

```yml
name: Remove branch

on:
  create

jobs:
  remove-branch:
    runs-on: ubuntu-latest
    steps:
      - uses: mn185177/delete-branch@v1
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

