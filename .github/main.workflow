workflow "Continuous Integration" {
  on = "push"
  resolves = ["GitHub Action for Docker"]
}

action "Check" {
  uses = "./.github/action-check"
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Check"]
  args = "build ."
}
