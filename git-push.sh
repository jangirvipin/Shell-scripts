#!/bin/bash

BRANCH_NAME=""
COMMIT_MESSAGE=""

while getopts b:m: flag
do
    case "${flag}" in
        b) BRANCH_NAME=${OPTARG};;
        m) COMMIT_MESSAGE=${OPTARG};;
      *)
        echo "Usage: ./git-push.sh -b <branch-name> -m <commit-message>"
        exit 1;;
    esac
done

if [[ -z "$BRANCH_NAME" || -z "$COMMIT_MESSAGE" ]]; then
    echo "Branch name and commit is required"
    exit 1
fi

if git show-ref --verify --quiet refs/heads/"$BRANCH_NAME"; then
    echo "Branch '$BRANCH_NAME' already exists locally. Exiting"
    echo "Use a different branch name or delete the existing branch if needed."
    exit 1
else
    echo "Creating new branch..."
    git switch -c "$BRANCH_NAME"
fi

git add .

git commit -m "$COMMIT_MESSAGE"

git push origin "$BRANCH_NAME" \
    && echo "Branch '$BRANCH_NAME' pushed successfully." \
    || { echo "Failed to push branch '$BRANCH_NAME'."; exit 1; }

