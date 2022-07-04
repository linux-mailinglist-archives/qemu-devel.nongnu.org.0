Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9C15659BA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:26:26 +0200 (CEST)
Received: from localhost ([::1]:40122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Nxx-0000tA-JY
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nut-0004yN-Ig
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8Nuq-0002Lt-Uy
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9YB6pphpSEN+DtosPIE336biqCnZmIn9fghJmwhRPU=;
 b=SBMwRhTnv4hk73WAne48w/YFpJL4HcP/vUgnLLXE3jZDFMWuKkDJ4jVK4eVM7YezCciPC8
 d2JNn9woNba7/Oy1J3sWOq6ysA+XaA8M6l/2UVzta90Qj8Y8Ay4ZHTOBH6uVxvFn8Wmk6I
 Zku1fFsbuKZkR55+GCt06ikcuGlw10o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-kW0ltrfpPXOBGdTi5m_50A-1; Mon, 04 Jul 2022 11:23:09 -0400
X-MC-Unique: kW0ltrfpPXOBGdTi5m_50A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2362185A7A4;
 Mon,  4 Jul 2022 15:23:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6783FC28100;
 Mon,  4 Jul 2022 15:23:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 1/7] tests: introduce tree-wide code style checking
Date: Mon,  4 Jul 2022 16:22:57 +0100
Message-Id: <20220704152303.760983-2-berrange@redhat.com>
In-Reply-To: <20220704152303.760983-1-berrange@redhat.com>
References: <20220704152303.760983-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This commit aims to give us a better approach to checking many types
of code style problems by introducing a flexible way to define whole
tree style checks.

The logic is essentially an import of the 'top/maint.mk' file from
GNULIB, with the following changes applied

 - Logic unrelated to the GNULIB syntax-check functionality
   is removed.

 - sc_excl is redefined, so that whitespace is turned into
   an '|' condition. This allows filename exclusion lists
   to span multiple lines making it more readable.

 - VC_LIST is changed to directly invoke git instead of
   indirectly via the vc-list script, since QEMU does not
   need portaility across many source control systems.

 - .DEFAULT_GOAL is set to 'syntax-check' since this is being
   used in a self-contained manner and thus doesn't need to
   play nice with our makefile rules QEMU has

This commit does the bare minimum introducing the basic infra:

 - tests/style-infra.mak - the cut down import of maint.mk
 - tests/style-excludes.mak - where the list of filename
   exclusions per test will be maintained (empty)
 - tests/style.mak - where the interesting tests live (empty)

As a general rule new checks can be implemented by merely defining
a regex matching the code pattern that should be blocked.

For example, consider we want to stop people using the 'bool' type
entirely. A rule starting with the prefix 'sc_' is defined in the
style.mak file:

  sc_prohibit_bool:
	prohibit='\<bool\>' \
	halt='do not use the bool type' \
	$(_sc_search_regexp)

Where '$(_sc_search_regexp)' (acquired from style-infra.mak)
contains all the magic to perform the tree-wide search for the
offending code pattern, reporting '$(halt)' as the error message
if violations are found.

If certain files need to be skipped for certain tests this can
be achieved by defining a variable with 'exclude_file_name_regexp--'
followed by the name of the check

  exclude_file_name_regexp--sc_prohibit_bool = \
        i-am-allowed-to-use-bool.c \
	and-so-am-i.c

Some checks can't be easily implemented by a simple per-line matching
regex. Since the checks are just implemented in make/shell, custom
rules can run essentially arbitrary logic.

Note that the checks require the use of 'git' to detect the list of
source files to search. Thus the check is skipped when not running
from a git repository.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build              |   3 +
 tests/Makefile.include   |   3 +-
 tests/meson.build        |  19 +++
 tests/style-excludes.mak |   4 +
 tests/style-infra.mak    | 265 +++++++++++++++++++++++++++++++++++++++
 tests/style.mak          |  24 ++++
 6 files changed, 317 insertions(+), 1 deletion(-)
 create mode 100644 tests/style-excludes.mak
 create mode 100644 tests/style-infra.mak
 create mode 100644 tests/style.mak

diff --git a/meson.build b/meson.build
index 65a885ea69..420102353e 100644
--- a/meson.build
+++ b/meson.build
@@ -18,6 +18,9 @@ config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
 enable_modules = 'CONFIG_MODULES' in config_host
 enable_static = 'CONFIG_STATIC' in config_host
 
+make = find_program(config_host['MAKE'])
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
index 8e318ec513..e26cadbc8a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -89,6 +89,25 @@ if get_option('tcg').allowed()
   endif
 endif
 
+if in_gitrepo
+  rc = run_command(
+    'sed', '-n',
+    's/^sc_\\([a-zA-Z0-9_-]*\\):.*/\\1/p',
+    meson.current_source_dir() / 'style.mak',
+    check: true,
+  )
+
+  sc_tests = rc.stdout().strip().split()
+
+  foreach check: sc_tests
+     test(check,
+          make,
+          args: [ '-f', files('style.mak'), 'sc_' + check ],
+          workdir: meson.project_source_root(),
+          suite: 'style')
+  endforeach
+endif
+
 subdir('unit')
 subdir('qapi-schema')
 subdir('qtest')
diff --git a/tests/style-excludes.mak b/tests/style-excludes.mak
new file mode 100644
index 0000000000..32c0e9c328
--- /dev/null
+++ b/tests/style-excludes.mak
@@ -0,0 +1,4 @@
+# -*- makefile -*-
+#
+# Filenames that should be excluded from specific
+# style checks performed by style.mak
diff --git a/tests/style-infra.mak b/tests/style-infra.mak
new file mode 100644
index 0000000000..99229f0c3f
--- /dev/null
+++ b/tests/style-infra.mak
@@ -0,0 +1,265 @@
+# -*- makefile -*-
+#
+# Rules for simple code style checks applying across the
+# whole tree. Partially derived from GNULIB's 'maint.mk'
+#
+# Copyright (C) 2008-2019 Red Hat, Inc.
+# Copyright (C) 2003-2019 Free Software Foundation, Inc.
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see
+# <http://www.gnu.org/licenses/>.
+
+ME := tests/style.mak
+
+srcdir = .
+
+AWK ?= awk
+GREP ?= grep
+SED ?= sed
+
+# Helper variables.
+_empty =
+_sp = $(_empty) $(_empty)
+
+VC_LIST = (cd $(srcdir) && git ls-tree -r 'HEAD:' | \
+	sed -n "s|^100[^	]*.||p" )
+
+# You can override this variable in cfg.mk if your gnulib submodule lives
+# in a different location.
+gnulib_dir ?= $(shell if test -f $(srcdir)/gnulib/gnulib-tool; then \
+			echo $(srcdir)/gnulib; \
+		else \
+			echo ${GNULIB_SRCDIR}; \
+		fi)
+
+# You can override this variable in cfg.mk to set your own regexp
+# matching files to ignore.
+VC_LIST_ALWAYS_EXCLUDE_REGEX ?= ^$$
+
+# This is to preprocess robustly the output of $(VC_LIST), so that even
+# when $(srcdir) is a pathological name like "....", the leading sed command
+# removes only the intended prefix.
+_dot_escaped_srcdir = $(subst .,\.,$(srcdir))
+
+# Post-process $(VC_LIST) output, prepending $(srcdir)/, but only
+# when $(srcdir) is not ".".
+ifeq ($(srcdir),.)
+  _prepend_srcdir_prefix =
+else
+  _prepend_srcdir_prefix = | $(SED) 's|^|$(srcdir)/|'
+endif
+
+# In order to be able to consistently filter "."-relative names,
+# (i.e., with no $(srcdir) prefix), this definition is careful to
+# remove any $(srcdir) prefix, and to restore what it removes.
+_sc_excl = \
+  $(or $(subst $(_sp),|,$(exclude_file_name_regexp--$@)),^$$)
+
+VC_LIST_EXCEPT = \
+  $(VC_LIST) | $(SED) 's|^$(_dot_escaped_srcdir)/||' \
+	| if test -f $(srcdir)/.x-$@; then $(GREP) -vEf $(srcdir)/.x-$@; \
+	  else $(GREP) -Ev -e "$${VC_LIST_EXCEPT_DEFAULT-ChangeLog}"; fi \
+	| $(GREP) -Ev -e '($(VC_LIST_ALWAYS_EXCLUDE_REGEX)|$(_sc_excl))' \
+	$(_prepend_srcdir_prefix)
+
+
+# Prevent programs like 'sort' from considering distinct strings to be equal.
+# Doing it here saves us from having to set LC_ALL elsewhere in this file.
+export LC_ALL = C
+
+# Collect the names of rules starting with 'sc_'.
+syntax-check-rules := $(sort $(shell env LC_ALL=C $(SED) -n \
+   's/^\(sc_[a-zA-Z0-9_-]*\):.*/\1/p' $(srcdir)/$(ME)))
+.PHONY: $(syntax-check-rules)
+
+ifeq ($(shell $(VC_LIST) >/dev/null 2>&1; echo $$?),0)
+  local-checks-available += $(syntax-check-rules)
+else
+  local-checks-available += no-vc-detected
+no-vc-detected:
+	@echo "No version control files detected; skipping syntax check"
+endif
+.PHONY: $(local-checks-available)
+
+# Arrange to print the name of each syntax-checking rule just before running it.
+$(syntax-check-rules): %: %.m
+sc_m_rules_ = $(patsubst %, %.m, $(syntax-check-rules))
+.PHONY: $(sc_m_rules_)
+$(sc_m_rules_):
+	@echo $(patsubst sc_%.m, %, $@)
+	@date +%s.%N > .sc-start-$(basename $@)
+
+# Compute and print the elapsed time for each syntax-check rule.
+sc_z_rules_ = $(patsubst %, %.z, $(syntax-check-rules))
+.PHONY: $(sc_z_rules_)
+$(sc_z_rules_): %.z: %
+	@end=$$(date +%s.%N);						\
+	start=$$(cat .sc-start-$*);					\
+	rm -f .sc-start-$*;						\
+	$(AWK) -v s=$$start -v e=$$end					\
+	  'END {printf "%.2f $(patsubst sc_%,%,$*)\n", e - s}' < /dev/null
+
+# The patsubst here is to replace each sc_% rule with its sc_%.z wrapper
+# that computes and prints elapsed time.
+local-check :=								\
+  $(patsubst sc_%, sc_%.z,						\
+    $(filter-out $(local-checks-to-skip), $(local-checks-available)))
+
+syntax-check: $(local-check)
+
+.DEFAULT_GOAL := syntax-check
+
+# _sc_search_regexp
+#
+# This macro searches for a given construct in the selected files and
+# then takes some action.
+#
+# Parameters (shell variables):
+#
+#  prohibit | require
+#
+#     Regular expression (ERE) denoting either a forbidden construct
+#     or a required construct.  Those arguments are exclusive.
+#
+#  exclude
+#
+#     Regular expression (ERE) denoting lines to ignore that matched
+#     a prohibit construct.  For example, this can be used to exclude
+#     comments that mention why the nearby code uses an alternative
+#     construct instead of the simpler prohibited construct.
+#
+#  in_vc_files | in_files
+#
+#     grep-E-style regexp selecting the files to check.  For in_vc_files,
+#     the regexp is used to select matching files from the list of all
+#     version-controlled files; for in_files, it's from the names printed
+#     by "find $(srcdir)".  When neither is specified, use all files that
+#     are under version control.
+#
+#  containing | non_containing
+#
+#     Select the files (non) containing strings matching this regexp.
+#     If both arguments are specified then CONTAINING takes
+#     precedence.
+#
+#  with_grep_options
+#
+#     Extra options for grep.
+#
+#  ignore_case
+#
+#     Ignore case.
+#
+#  halt
+#
+#     Message to display before to halting execution.
+#
+# Finally, you may exempt files based on an ERE matching file names.
+# For example, to exempt from the sc_space_tab check all files with the
+# .diff suffix, set this Make variable:
+#
+# exclude_file_name_regexp--sc_space_tab = \.diff$
+#
+# Note that while this functionality is mostly inherited via VC_LIST_EXCEPT,
+# when filtering by name via in_files, we explicitly filter out matching
+# names here as well.
+
+# Initialize each, so that envvar settings cannot interfere.
+export require =
+export prohibit =
+export exclude =
+export in_vc_files =
+export in_files =
+export containing =
+export non_containing =
+export halt =
+export with_grep_options =
+
+# By default, _sc_search_regexp does not ignore case.
+export ignore_case =
+_ignore_case = $$(test -n "$$ignore_case" && printf %s -i || :)
+
+define _sc_say_and_exit
+   dummy=; : so we do not need a semicolon before each use;		\
+   { printf '%s\n' "$(ME): $$msg" 1>&2; exit 1; };
+endef
+
+define _sc_search_regexp
+   dummy=; : so we do not need a semicolon before each use;		\
+									\
+   : Check arguments;							\
+   test -n "$$prohibit" && test -n "$$require"				\
+     && { msg='Cannot specify both prohibit and require'		\
+          $(_sc_say_and_exit) } || :;					\
+   test -z "$$prohibit" && test -z "$$require"				\
+     && { msg='Should specify either prohibit or require'		\
+          $(_sc_say_and_exit) } || :;					\
+   test -z "$$prohibit" && test -n "$$exclude"				\
+     && { msg='Use of exclude requires a prohibit pattern'		\
+          $(_sc_say_and_exit) } || :;					\
+   test -n "$$in_vc_files" && test -n "$$in_files"			\
+     && { msg='Cannot specify both in_vc_files and in_files'		\
+          $(_sc_say_and_exit) } || :;					\
+   test "x$$halt" != x							\
+     || { msg='halt not defined' $(_sc_say_and_exit) };			\
+									\
+   : Filter by file name;						\
+   if test -n "$$in_files"; then					\
+     files=$$(find $(srcdir) | $(GREP) -E "$$in_files"			\
+              | $(GREP) -Ev '$(_sc_excl)');				\
+   else									\
+     files=$$($(VC_LIST_EXCEPT));					\
+     if test -n "$$in_vc_files"; then					\
+       files=$$(echo "$$files" | $(GREP) -E "$$in_vc_files");		\
+     fi;								\
+   fi;									\
+									\
+   : Filter by content;							\
+   test -n "$$files"							\
+     && test -n "$$containing"						\
+     && { files=$$(echo "$$files" | xargs $(GREP) -l "$$containing"); }	\
+     || :;								\
+   test -n "$$files"							\
+     && test -n "$$non_containing"					\
+     && { files=$$(echo "$$files" | xargs $(GREP) -vl "$$non_containing"); } \
+     || :;								\
+									\
+   : Check for the construct;						\
+   if test -n "$$files"; then						\
+     if test -n "$$prohibit"; then					\
+       echo "$$files"							\
+         | xargs $(GREP) $$with_grep_options $(_ignore_case) -nE	\
+		"$$prohibit" /dev/null					\
+         | $(GREP) -vE "$${exclude:-^$$}"				\
+         && { msg="$$halt" $(_sc_say_and_exit) }			\
+         || :;								\
+     else								\
+       echo "$$files"							\
+         | xargs							\
+             $(GREP) $$with_grep_options $(_ignore_case) -LE "$$require" \
+         | $(GREP) .							\
+         && { msg="$$halt" $(_sc_say_and_exit) }			\
+         || :;								\
+     fi									\
+   else :;								\
+   fi || :;
+endef
+
+# Perl block to convert a match to FILE_NAME:LINENO:TEST
+perl_filename_lineno_text_ =						\
+    -e '  {'								\
+    -e '    $$n = ($$` =~ tr/\n/\n/ + 1);'				\
+    -e '    ($$v = $$&) =~ s/\n/\\n/g;'					\
+    -e '    print "$$ARGV:$$n:$$v\n";'					\
+    -e '  }'
diff --git a/tests/style.mak b/tests/style.mak
new file mode 100644
index 0000000000..32c7e706ba
--- /dev/null
+++ b/tests/style.mak
@@ -0,0 +1,24 @@
+# -*- makefile -*-
+#
+# Rules for simple code style checks applying across the
+# whole tree. Partially derived from GNULIB's 'maint.mk'
+#
+# Copyright (C) 2008-2019 Red Hat, Inc.
+# Copyright (C) 2003-2019 Free Software Foundation, Inc.
+#
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see
+# <http://www.gnu.org/licenses/>.
+
+include tests/style-infra.mak
+include tests/style-excludes.mak
-- 
2.36.1


