Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5793325D81E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:56:05 +0200 (CEST)
Received: from localhost ([::1]:40178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEAK4-0001uH-C4
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6s-00010m-8K
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6o-0005Hn-6o
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599219740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wr+70emkPtYM+pu1zb77kN9Q/H0rLPD/i/wpC5YdNfg=;
 b=EbENFMnclhngLqrD3RmBjN+h4UEIRUumCBFPN0WEptcza9eL+Sg07svrwd+0QbGSMDqNfq
 k0vnvZnzf5C+tFWFkv3afte1TIvE3WM1wBnABX5AZDp3Y+zYxXIj80A1bth/PM45M0rKUg
 MzkS4CuJyeb/u33MVtdSLHaswvxjZl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-qbvNSszvNaGaByR8hF3OZA-1; Fri, 04 Sep 2020 07:42:14 -0400
X-MC-Unique: qbvNSszvNaGaByR8hF3OZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E24B31931D4A
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3ABF805DD
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/46] Makefile: inline the relevant parts of rules.mak
Date: Fri,  4 Sep 2020 07:41:06 -0400
Message-Id: <20200904114122.31307-31-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 07:42:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Most of rules.mak is not used anymore, just inline what's needed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile                      |  38 ++++----
 docs/devel/build-system.rst   |   4 -
 rules.mak                     | 158 ----------------------------------
 tests/docker/Makefile.include |   4 +
 tests/tcg/Makefile.qemu       |   2 -
 5 files changed, 26 insertions(+), 180 deletions(-)
 delete mode 100644 rules.mak

diff --git a/Makefile b/Makefile
index 9bdf5fc072..678e76d6f2 100644
--- a/Makefile
+++ b/Makefile
@@ -10,6 +10,20 @@ BUILD_DIR=$(CURDIR)
 # Before including a proper config-host.mak, assume we are in the source tree
 SRC_PATH=.
 
+# Don't use implicit rules or variables
+# we have explicit rules for everything
+MAKEFLAGS += -rR
+
+# Usage: $(call quiet-command,command and args,"NAME","args to print")
+# This will run "command and args", and either:
+#  if V=1 just print the whole command and args
+#  otherwise print the 'quiet' output in the format "  NAME     args to print"
+# NAME should be a short name of the command, 7 letters or fewer.
+# If called with only a single argument, will print nothing in quiet mode.
+quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
+quiet-@ = $(if $(V),,@)
+quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
+
 UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
     help check-help print-% \
     docker docker-% vm-help vm-test vm-build-%
@@ -68,6 +82,7 @@ Makefile.mtest: build.ninja scripts/mtest2make.py
 -include Makefile.mtest
 endif
 
+Makefile: .git-submodule-status
 .git-submodule-status: git-submodule-update config-host.mak
 
 # Check that we're not trying to do an out-of-tree build from
@@ -108,10 +123,6 @@ ninja-clean::
 ninja-distclean::
 build.ninja: config-host.mak
 
-include $(SRC_PATH)/rules.mak
-
-generated-files-y += .git-submodule-status
-
 # Don't try to regenerate Makefile or configure
 # We don't generate any of them
 Makefile: ;
@@ -120,9 +131,7 @@ configure: ;
 .PHONY: all clean cscope distclean install \
 	recurse-all dist msi FORCE
 
-$(call set-vpath, $(SRC_PATH))
-
-SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet) BUILD_DIR=$(BUILD_DIR)
+SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory --quiet)
 
 include $(SRC_PATH)/tests/Makefile.include
 
@@ -189,7 +198,6 @@ clean: recurse-clean ninja-clean clean-ctlist
 		-exec rm {} +
 	rm -f TAGS cscope.* *.pod *~ */*~
 	rm -f fsdev/*.pod scsi/*.pod
-	rm -f $(foreach f,$(generated-files-y),$(f) $(f)-timestamp)
 
 VERSION = $(shell cat $(SRC_PATH)/VERSION)
 
@@ -232,14 +240,6 @@ cscope:
 # Needed by "meson install"
 export DESTDIR
 
-# Add a dependency on the generated files, so that they are always
-# rebuilt before other object files
-ifneq ($(wildcard config-host.mak),)
-ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
-Makefile: $(generated-files-y)
-endif
-endif
-
 include $(SRC_PATH)/tests/docker/Makefile.include
 include $(SRC_PATH)/tests/vm/Makefile.include
 
@@ -280,3 +280,9 @@ endif
 endif
 	$(call print-help,$(MAKE) [targets],(quiet build, default))
 	$(call print-help,$(MAKE) V=1 [targets],(verbose build))
+
+# will delete the target of a rule if commands exit with a nonzero exit status
+.DELETE_ON_ERROR:
+
+print-%:
+	@echo '$*=$($*)'
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 0c09fb9a54..55f0576c07 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -401,10 +401,6 @@ number of dynamically created files listed later.
   executables.  Build rules for various subdirectories are included in
   other meson.build files spread throughout the QEMU source tree.
 
-`rules.mak`
-  This file provides the generic helper rules for invoking build tools, in
-  particular the compiler and linker.
-
 `tests/Makefile.include`
   Rules for building the unit tests. This file is included directly by the
   top level Makefile, so anything defined in this file will influence the
diff --git a/rules.mak b/rules.mak
deleted file mode 100644
index c66c8218f0..0000000000
--- a/rules.mak
+++ /dev/null
@@ -1,158 +0,0 @@
-
-# These are used when we want to do substitutions without confusing Make
-NULL  :=
-SPACE := $(NULL) #
-COMMA := ,
-
-# Don't use implicit rules or variables
-# we have explicit rules for everything
-MAKEFLAGS += -rR
-
-# Files with this suffixes are final, don't try to generate them
-# using implicit rules
-%/trace-events:
-%.hx:
-%.py:
-%.objs:
-%.d:
-%.h:
-%.c:
-%.cc:
-%.cpp:
-%.m:
-%.mak:
-
-# Flags for dependency generation
-QEMU_DGFLAGS += -MMD -MP -MT $@ -MF $(@D)/$(*F).d
-
-# Compiler searches the source file dir first, but in vpath builds
-# we need to make it search the build dir too, before any other
-# explicit search paths. There are two search locations in the build
-# dir, one absolute and the other relative to the compiler working
-# directory. These are the same for target-independent files, but
-# different for target-dependent ones.
-QEMU_LOCAL_INCLUDES = -iquote $(BUILD_DIR) -iquote $(BUILD_DIR)/$(@D) -iquote $(@D)
-
-WL := -Wl,
-ifdef CONFIG_DARWIN
-whole-archive = $(WL)-force_load,$1
-else
-whole-archive = $(WL)--whole-archive $1 $(WL)--no-whole-archive
-endif
-
-extract-libs = $(strip $(foreach o,$1,$($o-libs)))
-
-%.o: %.c
-	@mkdir -p $(dir $@)
-	$(call quiet-command,$(CC) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
-	       $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) $($@-cflags) \
-	       -c -o $@ $<,"CC","$(TARGET_DIR)$@")
-
-# If we have a CXX we might have some C++ objects, in which case we
-# must link with the C++ compiler, not the plain C compiler.
-LINKPROG = $(or $(CXX),$(CC))
-
-LINK = $(call quiet-command, $(LINKPROG) $(CFLAGS) $(QEMU_LDFLAGS) -o $@ \
-       $(filter-out %.a %.fa,$1) \
-       $(foreach l,$(filter %.fa,$1),$(call whole-archive,$l)) \
-       $(filter %.a,$1) \
-       $(call extract-libs,$1) $(LIBS),"LINK","$(TARGET_DIR)$@")
-
-%.o: %.S
-	$(call quiet-command,$(CCAS) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
-	       $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) \
-	       -c -o $@ $<,"CCAS","$(TARGET_DIR)$@")
-
-%.o: %.cc
-	$(call quiet-command,$(CXX) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
-	       $(QEMU_CXXFLAGS) $(QEMU_DGFLAGS) $(CXXFLAGS) $($@-cflags) \
-	       -c -o $@ $<,"CXX","$(TARGET_DIR)$@")
-
-%.o: %.cpp
-	$(call quiet-command,$(CXX) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
-	       $(QEMU_CXXFLAGS) $(QEMU_DGFLAGS) $(CXXFLAGS) $($@-cflags) \
-	       -c -o $@ $<,"CXX","$(TARGET_DIR)$@")
-
-%.o: %.m
-	$(call quiet-command,$(OBJCC) $(QEMU_LOCAL_INCLUDES) $(QEMU_INCLUDES) \
-	       $(QEMU_CFLAGS) $(QEMU_DGFLAGS) $(CFLAGS) $($@-cflags) \
-	       -c -o $@ $<,"OBJC","$(TARGET_DIR)$@")
-
-%.o: %.dtrace
-	$(call quiet-command,dtrace -o $@ -G -s $<,"GEN","$(TARGET_DIR)$@")
-
-.PHONY: modules
-modules:
-
-%$(EXESUF): %.o
-	$(call LINK,$(filter %.o %.a %.fa, $^))
-
-%.a:
-	$(call quiet-command,rm -f $@ && $(AR) rcs $@ $^,"AR","$(TARGET_DIR)$@")
-
-# Usage: $(call quiet-command,command and args,"NAME","args to print")
-# This will run "command and args", and either:
-#  if V=1 just print the whole command and args
-#  otherwise print the 'quiet' output in the format "  NAME     args to print"
-# NAME should be a short name of the command, 7 letters or fewer.
-# If called with only a single argument, will print nothing in quiet mode.
-quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
-quiet-@ = $(if $(V),,@)
-quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
-
-# cc-option
-# Usage: CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
-
-cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
-              >/dev/null 2>&1 && echo OK), $2, $3)
-cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
-                >/dev/null 2>&1 && echo OK), $2, $3)
-
-VPATH_SUFFIXES = %.c %.h %.S %.cc %.cpp %.m %.mak %.texi %.sh %.rc Kconfig% %.json.in
-set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
-
-# install-prog list, dir
-define install-prog
-	$(INSTALL_DIR) "$2"
-	$(INSTALL_PROG) $1 "$2"
-	$(if $(STRIP),$(STRIP) $(foreach T,$1,"$2/$(notdir $T)"),)
-endef
-
-# Logical functions (for operating on y/n values like CONFIG_FOO vars)
-# Inputs to these must be either "y" (true) or "n" or "" (both false)
-# Output is always either "y" or "n".
-# Usage: $(call land,$(CONFIG_FOO),$(CONFIG_BAR))
-# Logical NOT
-lnot = $(if $(subst n,,$1),n,y)
-# Logical AND
-land = $(if $(findstring yy,$1$2),y,n)
-# Logical OR
-lor = $(if $(findstring y,$1$2),y,n)
-# Logical XOR (note that this is the inverse of leqv)
-lxor = $(if $(filter $(call lnot,$1),$(call lnot,$2)),n,y)
-# Logical equivalence (note that leqv "","n" is true)
-leqv = $(if $(filter $(call lnot,$1),$(call lnot,$2)),y,n)
-# Logical if: like make's $(if) but with an leqv-like test
-lif = $(if $(subst n,,$1),$2,$3)
-
-# String testing functions: inputs to these can be any string;
-# the output is always either "y" or "n". Leading and trailing whitespace
-# is ignored when comparing strings.
-# String equality
-eq = $(if $(subst $2,,$1)$(subst $1,,$2),n,y)
-# String inequality
-ne = $(if $(subst $2,,$1)$(subst $1,,$2),y,n)
-# Emptiness/non-emptiness tests:
-isempty = $(if $1,n,y)
-notempty = $(if $1,y,n)
-
-.PHONY: clean-timestamp
-clean-timestamp:
-	rm -f *.timestamp
-clean: clean-timestamp
-
-# will delete the target of a rule if commands exit with a nonzero exit status
-.DELETE_ON_ERROR:
-
-print-%:
-	@echo '$*=$($*)'
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9119dff97d..3daabaa2fd 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -2,6 +2,10 @@
 
 .PHONY: docker docker-test docker-clean docker-image docker-qemu-src
 
+NULL :=
+SPACE := $(NULL) #
+COMMA := ,
+
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 
 DOCKER_SUFFIX := .docker
diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index f8ad4c47be..0332bad10f 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -8,8 +8,6 @@
 # to do it for us.
 #
 
-include $(SRC_PATH)/rules.mak
-
 # The configure script fills in extra information about
 # useful docker images or alternative compiler flags.
 
-- 
2.26.2



