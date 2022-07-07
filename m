Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FDA56A876
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 18:43:06 +0200 (CEST)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Uan-00031k-Qe
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 12:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVv-0008R8-D7
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9UVd-0006mw-BX
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 12:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657211864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REOeu0JYcGJ3o0Um/tFxTMzk2rEnBZmjsx4mEK39gZs=;
 b=HpTwAE5y+8llnjsrcMYPxH3+M/ptjnrL9Yz9tyqlPK63abr48nNfRKBiphx4dRPPj/nrNN
 sMMp5L6tL8SYwi09ghMQNjuUcc4VONJzJ7Q+25gh1DAgqW4iEM00msiK/bqJtQL0kgA1uJ
 KE77R//NXcqPdGJXWp8usaXiFWR4LrQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-pFTYQ3gQNtCzM6ASXaZs5Q-1; Thu, 07 Jul 2022 12:37:41 -0400
X-MC-Unique: pFTYQ3gQNtCzM6ASXaZs5Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F8AC8C59AB;
 Thu,  7 Jul 2022 16:37:25 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBAAF40315C;
 Thu,  7 Jul 2022 16:37:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 1/9] tests: introduce tree-wide code style checking
Date: Thu,  7 Jul 2022 17:37:12 +0100
Message-Id: <20220707163720.1421716-2-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-1-berrange@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Historically QEMU has used the 'scripts/checkpatch.pl' script to
validate various style rules but there are a number of issues:

 - Contributors / maintainers are reluctant to add new
   tests to it, nor fix existint rules, because the Perl
   code is much too hard to understand for most people.

 - It requires the contributor to remember to run it as it
   is not wired into 'make check'

 - While it can be told to check whole files, in practice
   it is usually only used to check patch diffs, because the
   former would flag up pages of pre-existing violations that
   have never been fixed

 - It is said to be OK to ignore some things reported by the
   script, but don't record these exceptional cases anywere.
   Thus contributors looking at existing violations in tree
   are never sure whether they are intentional or historical
   unfixed technical debt.

 - There is no distinct reporting for each type of check
   performed and as a consequence there is also no way to
   mark particular files to be skipped for particular checks

This commit aims to give us a better approach to checking many
types of code style problems by introducing a flexible and simple
way to define whole tree style checks.

The logic provide is inspired by the GNULIB 'top/maint.mk' file,
but has been re-implemented in a simple Python script, using a
YAML config file, in an attempt to make it easier to understand
than the make rules.

This commit does the bare minimum introducing the basic infra:

 - tests/style.py - the script for evaluating coding style rules
 - tests/style.yml - the config defining the coding style rules

The concept behind the style checking is to perform simple regular
expression matches across the source file content.

The key benefit of regular expression matching is that it is very
fast, and can match against all types of source file in the repository,
regardless of whether it is used in the current build, or the language
the source is written in.

The downside, compared to a compiler based approach (eg libclang) is
that it does not have semantic understanding of the code, which makes
some checks difficult to implement.

As such this style matching framework is not proposed as a solution for
all possible coding style rules. It is general enough that it can
accomplish many useful checks, and is intended to be complimentary to
any style checkers with semantic knowledge of the code like libclang,
or pylint/flake8.

It would be possible to use Python's regular expression engine to
perform this matching directly, it instead calls out to 'grep' (for
single line matches) and 'perl' (for multiline matches). These are
highly optimized regex engines, so should maximise performance. They
also avoid problems with python's charset encoding causing it to
throw exceptions when encountering invalid utf8, rather than continue
on a best effort basis.

In terms of defining checks, a short bit of yaml is all that is
required. For example, consider we want to stop people using the
'bool' type entirely in C source files. A rule in tests/style.yml
would say

  prohibit_bool:
	files: \.c$
	prohibit: \bbool\b
	message: do not use the bool type

The 'prohibit' rule is matched line-wise across every .c source
file. If any violation is found, the contents of that line are
printed, and 'message' is shown as a error message.

There are many more advanced options, which are documented in
comments in the style.yml file in this commit.

The tool can be invoked directly

   ./tests/style.py --config test/style.yml check

Or for individual checks

   ./tests/style.py --config test/style.yml check --rule prohibit_bool

If a file is known to intentionally violate a style check rule
this can be recorded in the style.yml and will result in it being
ignored.  The '--ignored' flag can be used to see ignored failures.

This is all wired up into meson, such that a 'style' test suite is
defined and each individual style check is exposed as a test case.

This results in creation of a 'make check-style' target that is
triggerd by 'make check' by default.

Note that the checks require the use of 'git' to detect the list of
source files to search. Thus the check is skipped when not running
from a git repository.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build            |   2 +
 tests/Makefile.include |   3 +-
 tests/meson.build      |  17 ++++
 tests/style.py         | 218 +++++++++++++++++++++++++++++++++++++++++
 tests/style.yml        |  88 +++++++++++++++++
 5 files changed, 327 insertions(+), 1 deletion(-)
 create mode 100755 tests/style.py
 create mode 100644 tests/style.yml

diff --git a/meson.build b/meson.build
index 65a885ea69..d8ef24bacb 100644
--- a/meson.build
+++ b/meson.build
@@ -18,6 +18,8 @@ config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
 enable_modules = 'CONFIG_MODULES' in config_host
 enable_static = 'CONFIG_STATIC' in config_host
 
+in_gitrepo = run_command('test', '-d', '.git', check: false).returncode() == 0
+
 # Allow both shared and static libraries unless --enable-static
 static_kwargs = enable_static ? {'static': true} : {}
 
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3accb83b13..f7c1d2644e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -3,12 +3,13 @@
 .PHONY: check-help
 check-help:
 	@echo "Regression testing targets:"
-	@echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
+	@echo " $(MAKE) check                  Run block, qapi-schema, unit, style, softfloat, qtest and decodetree tests"
 	@echo " $(MAKE) bench                  Run speed tests"
 	@echo
 	@echo "Individual test suites:"
 	@echo " $(MAKE) check-qtest-TARGET     Run qtest tests for given target"
 	@echo " $(MAKE) check-qtest            Run qtest tests"
+	@echo " $(MAKE) check-style            Run style checks"
 	@echo " $(MAKE) check-unit             Run qobject tests"
 	@echo " $(MAKE) check-qapi-schema      Run QAPI schema tests"
 	@echo " $(MAKE) check-block            Run block tests"
diff --git a/tests/meson.build b/tests/meson.build
index 8e318ec513..f3140428c3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -89,6 +89,23 @@ if get_option('tcg').allowed()
   endif
 endif
 
+if in_gitrepo
+  stylecmd = files('style.py')
+  stylecfg = files('style.yml')
+
+  checks = run_command(
+      stylecmd, '--config', stylecfg, 'list',
+      check: true)
+
+  foreach check: checks.stdout().strip().split()
+     test(check,
+          stylecmd,
+          args: [ '--config', stylecfg, 'check', '--rule', check ],
+          workdir: meson.project_source_root(),
+          suite: 'style')
+  endforeach
+endif
+
 subdir('unit')
 subdir('qapi-schema')
 subdir('qtest')
diff --git a/tests/style.py b/tests/style.py
new file mode 100755
index 0000000000..a6c05bbb32
--- /dev/null
+++ b/tests/style.py
@@ -0,0 +1,218 @@
+#!/usr/bin/python
+
+import argparse
+import re
+import subprocess
+import sys
+import time
+import yaml
+
+
+def source_files():
+    src = subprocess.check_output(
+        ["git", "ls-tree", "--name-only", "-r", "HEAD:"])
+
+    return src.decode("utf8").strip().split("\n")
+
+
+# Expand a regular expression from the config file which
+# can be in several formats
+#
+#  - a plain string - used as-is as a regular expression
+#  - a list of strings - each element is joined with '|'
+#  - a dict containing
+#      - 'terms' - interpreted as a string / list of strings
+#      - 'prefix' - added to the front of the regular
+#      - 'prefix' - added to the end of the regular
+#
+# Returns: a regulare expression string
+def expand_re(restr):
+    if restr is None:
+        return None
+
+    if type(restr) == list:
+        return "|".join(restr)
+
+    if type(restr) == dict:
+        terms = "(?:" + expand_re(restr["terms"]) + ")"
+
+        return restr.get("prefix", "") + terms + restr.get("suffix", "")
+
+    return restr
+
+
+# Expand the regular expression and then compile it
+#
+# Returns: a compiled regular expresison object for matching
+def compile_re(restr):
+    if restr is None:
+        return None
+
+    return re.compile(expand_re(restr))
+
+
+# Take a list of source files and filter it returning a subset
+#
+# If @match is non-NULL, it is expanded as a regular expression
+# and the source file name is included if-and-only-if it matches
+# the regex.
+#
+# If @nonmatch is non-NULL, it is expanded as a regular expression
+# and the source file name is excluded if-and-only-if it matches
+# the regex.
+#
+# Returns: the filtered list of soruces
+def filtered_sources(sources, match, nonmatch):
+    matchre = compile_re(match)
+    nonmatchre = compile_re(nonmatch)
+
+    filtered = []
+    for name in sources:
+        if ((matchre is None or matchre.search(name)) and
+            (nonmatchre is None or not nonmatchre.search(name))):
+            filtered.append(name)
+    return filtered
+
+
+# Sanity check the configuration of a rule
+#
+# Returns: true if the rule is valid
+def validate(name, rule):
+    if "prohibit" not in rule and "require" not in rule:
+        raise Exception("Either 'prohibit' or 'require' regex is needed")
+
+    if "prohibit" in rule and "require" in rule:
+        raise Exception("Only one of 'prohibit' or 'require' regex is needed")
+
+
+# Evalate the rule against the designated sources
+#
+# Returns: 1 if the rule failed against one or more sources, 0 otherwise
+def evaluate(sources, name, rule, ignored=False):
+    if not rule.get("enabled", True):
+        return
+
+    validate(name, rule)
+
+    ignorere = None
+    if not ignored:
+        ignorere = rule.get("ignore")
+
+    print("CHECK: %s: " % name, end='')
+    sources = filtered_sources(sources,
+                               rule.get("files"),
+                               ignorere)
+
+    input = "\n".join(sources)
+
+    then = time.time()
+
+    # For single line matching, 'grep' is most efficient,
+    # but it can't do the required multi-line matching
+    # so for the latter we turn to 'perl'
+    if not rule.get("multiline", False):
+        if "prohibit" in rule:
+            # The output is the list of lines that have invalid content
+            proc = subprocess.run(["xargs", "grep", "-nE",
+                                   expand_re(rule["prohibit"])],
+                                  input=input, capture_output=True,
+                                  encoding='utf8')
+        elif "require" in rule:
+            # The output is the list of filenames which don't have
+            # the required content
+            proc = subprocess.run(["xargs", "grep", "-LE",
+                                   expand_re(rule["require"])],
+                                  input=input, capture_output=True,
+                                  encoding='utf8')
+        else:
+            raise Exception("Unexpected rule config")
+    else:
+        if "prohibit" in rule:
+            # The output is the list of lines that have invalid content
+            proc = subprocess.run(["xargs", "perl", "-0777", "-ne",
+                                   (r'while (m,%s,gs) {' + \
+                                    r'    $n = ($` =~ tr/\n/\n/ + 1);' + \
+                                    r'    ($v = $&) =~ s/\n/\\n/g;' + \
+                                    r'    print "$ARGV:$n:$v\n";' +\
+                                    r'}') % expand_re(rule["prohibit"])],
+                                  input=input, capture_output=True,
+                                  encoding='utf8')
+        elif "require" in rule:
+            # The output is the list of filenames which don't have
+            # the required content
+            proc = subprocess.run(["xargs", "perl", "-0777", "-ne",
+                                   ("unless (m,%s,s) {" + \
+                                    "    print \"$ARGV\n\";" + \
+                                    "}") % expand_re(rule["require"])],
+                                  input=input, capture_output=True,
+                                  encoding='utf8')
+        else:
+            raise Exception("Unexpected rule config")
+
+        if proc.returncode != 0:
+            raise Exception(proc.stderr)
+
+    now = time.time()
+    delta = now - then
+
+    if len(proc.stdout) > 0:
+        print("\033[31;1mFAIL\033[0m ❌ (%0.2f secs)" % delta)
+        print(proc.stdout.strip())
+        print("\033[31;1mERROR\033[0m: %s: %s ❌" % (name, rule["message"]))
+        return 1
+    else:
+        print("\033[32;1mPASS\033[0m ✅ (%0.2f secs)" % delta)
+        return 0
+
+
+def parse_args():
+    parser = argparse.ArgumentParser("Code style checker")
+    parser.add_argument("--config",
+                        default="tests/style.yml",
+                        help="Path to style rules file")
+
+    subparsers = parser.add_subparsers(dest="command")
+    subparsers.required = True
+
+    list = subparsers.add_parser("list", help="list rules")
+
+    check = subparsers.add_parser("check", help="check rules")
+    check.add_argument("--rule",
+                       help="Name of rule to check")
+    check.add_argument("--ignored",
+                       action="store_true",
+                       help="Show intentionally ignored violations")
+
+    return parser.parse_args()
+
+
+def main():
+    args = parse_args()
+
+    sources = source_files()
+
+    with open(args.config, "r") as fh:
+        rules = yaml.safe_load(fh)
+        if rules is None:
+            rules = {}
+
+    if args.command == "list":
+        for name, rule in rules.items():
+            if rule.get("enabled", True):
+                print(name)
+    elif args.command == "check":
+        errs = 0
+        for name, rule in rules.items():
+            if args.rule == None or args.rule == name:
+                errs += evaluate(sources, name, rule, args.ignored)
+        if errs:
+            return 1
+    else:
+        raise Exception("unknown command '%s'" % args.command)
+    return 0
+
+try:
+    sys.exit(main())
+except Exception as e:
+    print("ERROR: %s: %s" % (sys.argv[0], str(e)))
+    sys.exit(2)
diff --git a/tests/style.yml b/tests/style.yml
new file mode 100644
index 0000000000..b4e7c6111f
--- /dev/null
+++ b/tests/style.yml
@@ -0,0 +1,88 @@
+# Source code style checking rules
+#
+# Each top level key defines a new check, that is
+# exposed as a test case in the meson 'style' test
+# suite.
+#
+# Within each check, the following keys are valid
+#
+#  * files
+#
+#    A regular expression matching filenames that
+#    are to be checked. Typically used to filter
+#    based on file extension. If omitted all files
+#    managed by git will be checked.
+#
+#  * prohibit
+#
+#    A regular expression matching content that is
+#    not allowed to be present in source files. Matches
+#    against single lines of text, unless 'multiline'
+#    option overrides. Either this option or 'require'
+#    must be present
+#
+#  * require
+#
+#    A regular expression matching content that must
+#    always be present in source files. Matches against
+#    single lines of text, unless 'multiline' option
+#    overrides. Either this option of 'prohibit' must
+#    be present
+#
+#  * multiline
+#
+#    A boolean controlling whether 'prohibit' and 'require'
+#    regular expressions match single lines or the entire
+#    file contents. Defaults to 'false', matching single
+#    lines at a time.
+#
+#  * ignore
+#
+#    A regular expression matching files to exclude from
+#    the check. This is typically used when certain files
+#    otherwise checked have known acceptable violations
+#    of the test.
+#
+#  * message
+#
+#    A string providing a message to emit when the test
+#    condition fails. Must be present
+#
+#  * enabled
+#
+#    A boolean providing a way to temporarily disable
+#    a check. Defaults to 'true' if omitted.
+#
+# For all the keys above which accept a regular expression,
+# one of three syntaxes are permitted
+#
+#  * string
+#
+#    The full regular expression to match
+#
+#  * list of strings
+#
+#    Each element of the list will be combined with '|'
+#    to form the final regular expression. This is typically
+#    useful to keep line length short when specifying matches
+#    across many filenames
+#
+#  * dict
+#
+#    Contains the keys:
+#
+#      * terms
+#
+#        Either a string or list of strings interpreted as above
+#
+#      * prefix
+#
+#        A match added to the front of the regex. Useful when
+#        'terms' is a list of strings and a common prefix is
+#        desired
+#
+#      * suffix
+#
+#        A match added to the front of the regex. Useful when
+#        'terms' is a list of strings and a common prefix is
+#        desired
-- 
2.36.1


