#!/usr/bin/awk -f
#from http://stackoverflow.com/questions/29109673/is-there-a-way-to-get-the-latest-tag-of-a-given-repo-using-github-api-v3
#Usage: ./get-tag.awk <location>

BEGIN {
  if (ARGC != 2) {
    print "git-describe-remote.awk https://github.com/stedolan/jq"
    exit
  }
  FS = "[ /^]+"
  while ("git ls-remote " ARGV[1] "| sort -Vk2" | getline) {
    if (!sha)
      sha = substr($0, 1, 7)
    tag = $3
  }
  while ("curl -s " ARGV[1] "/releases/tag/" tag | getline)
    if ($3 ~ "commits")
      com = $2
  printf com ? "%s-%s-g%s\n" : "%s\n", tag, com, sha
}
