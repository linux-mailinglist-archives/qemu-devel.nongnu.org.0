Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C602FBDE0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:40:11 +0100 (CET)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uzC-0006id-Lt
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddstreet@canonical.com>)
 id 1l1uhT-0002D1-6Y
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:21:56 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <ddstreet@canonical.com>)
 id 1l1uhQ-0007DB-OM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:21:50 -0500
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <ddstreet@canonical.com>) id 1l1uhN-0000Y7-LY
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:21:45 +0000
Received: by mail-qt1-f199.google.com with SMTP id k12so18794627qth.23
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b2clO5elnTdTyASo00/lqpuN7HAZLZcrc0a6ykHiyVU=;
 b=TqO7qmAAK4MgQ9VmqAQ3AW1HuZpJacGlkFkbsmGYZajzBLIfi09IFqCZ43sqweRl3z
 bIjBk0HQF5naFi1S6tBlElQ4yRPORAUg76trYtcmul8nrvHvwqlykNYKBt9MZzVJCemf
 gmmhP1UaisqCTofEwnTxtqsXMcB4ItYEcY/KcPKAq82v9rQYU+sEmsdMoLF1VGUKmP5x
 e5tg0BzkhfeiKSDY6s0v6W1O5BEwsABDWATaLffVZ9v4ZZZfuudEj4vGOl0hTmE2tdDn
 IIJRLZu36FV7hnQM2ZNFRpwcwCCPq0KjwD4NT+AbPONesXZdE3RDZWtnKrE6luhgiYdJ
 p9Eg==
X-Gm-Message-State: AOAM530yvRQyNAR67PCIUnVb6qN3K917wAy2vLE+yERPWPnMl/VsW++t
 hQ6ixmdFoAUiIaF8WSQtkF3v+4wZi3muqMmC+b9D7gNeCpidqkxlEJTxKxmxTHolPMJUW8uK59n
 ao5vMs713WeedbQQlLPLtZm+fANZ85e0T
X-Received: by 2002:ae9:ebd5:: with SMTP id b204mr5314177qkg.195.1611076904221; 
 Tue, 19 Jan 2021 09:21:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbLoCWXNMKMfjjxbiQ/ZzFbSSgbhq3SMFx8vGVmN2ad2Dsh8fjBK6z4DMxq3ubt4RUzhHObQ==
X-Received: by 2002:ae9:ebd5:: with SMTP id b204mr5314137qkg.195.1611076903758; 
 Tue, 19 Jan 2021 09:21:43 -0800 (PST)
Received: from thorin.shire (45-27-90-188.lightspeed.rlghnc.sbcglobal.net.
 [45.27.90.188])
 by smtp.gmail.com with ESMTPSA id x3sm12404344qtd.56.2021.01.19.09.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:21:42 -0800 (PST)
From: Dan Streetman <ddstreet@canonical.com>
To: qemu-devel@nongnu.org
Subject: [PATCHv2] configure: replace --enable/disable-git-update with
 --with-git-submodules
Date: Tue, 19 Jan 2021 12:20:46 -0500
Message-Id: <20210119172046.43869-1-ddstreet@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=ddstreet@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Dan Streetman <ddstreet@canonical.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Rafael David Tinoco <rafael.tinoco@canonical.com>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace the --enable-git-update and --disable-git-update configure params
with the param --with-git-submodules=(update|validate|ignore) to
allow 3 options for building from a git repo.

This is needed because downstream packagers, e.g. Debian, Ubuntu, etc,
also keep the source code in git, but do not want to enable the
'git_update' mode; with the current code, that's not possible even
if the downstream package specifies --disable-git-update.

The previous parameters are deprecated but still available; the
--enable-git-update parameter maps to --with-git-submodules=update and
--disable-git-update parameter maps to --with-git-submodules=validate.

The configure script behavior is slightly modified, where previously
the dtc, capstone, and slirp submodules were not validated when
--disable-git-update was specified (but were updated with git-update
enabled), now they are validated when using --with-git-submodules=validate
and are only ignored when using --with-git-submodules=ignore.

Signed-off-by: Dan Streetman <ddstreet@canonical.com>
---
v1: https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg04799.html
changes since v1:
 - add --help output explaining --with-git-submodules valid values
 - validate dtc, capstone, slirp submodules also
 - update commit description text

 Makefile                 | 24 ++-----------------
 configure                | 51 ++++++++++++++++++++++++++++++----------
 scripts/git-submodule.sh | 34 ++++++++++++++++++++-------
 3 files changed, 66 insertions(+), 43 deletions(-)

diff --git a/Makefile b/Makefile
index 2a926aaeb0c..f2557f37bba 100644
--- a/Makefile
+++ b/Makefile
@@ -47,30 +47,10 @@ git-submodule-update:
 Makefile: .git-submodule-status
 
 .PHONY: git-submodule-update
-
-git_module_status := $(shell \
-  cd '$(SRC_PATH)' && \
-  GIT="$(GIT)" ./scripts/git-submodule.sh status $(GIT_SUBMODULES); \
-  echo $$?; \
-)
-
-ifeq (1,$(git_module_status))
-ifeq (no,$(GIT_UPDATE))
 git-submodule-update:
 	$(call quiet-command, \
-            echo && \
-            echo "GIT submodule checkout is out of date. Please run" && \
-            echo "  scripts/git-submodule.sh update $(GIT_SUBMODULES)" && \
-            echo "from the source directory checkout $(SRC_PATH)" && \
-            echo && \
-            exit 1)
-else
-git-submodule-update:
-	$(call quiet-command, \
-          (cd $(SRC_PATH) && GIT="$(GIT)" ./scripts/git-submodule.sh update $(GIT_SUBMODULES)), \
-          "GIT","$(GIT_SUBMODULES)")
-endif
-endif
+		(GIT="$(GIT)" "$(SRC_PATH)/scripts/git-submodule.sh" $(GIT_SUBMODULES_ACTION) $(GIT_SUBMODULES)), \
+		"GIT","$(GIT_SUBMODULES)")
 
 # 0. ensure the build tree is okay
 
diff --git a/configure b/configure
index 9f016b06b54..725d19e4d91 100755
--- a/configure
+++ b/configure
@@ -254,12 +254,12 @@ gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 
 if test -e "$source_path/.git"
 then
-    git_update=yes
+    git_submodules_action="update"
     git_submodules="ui/keycodemapdb"
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 else
-    git_update=no
+    git_submodules_action="ignore"
     git_submodules=""
 
     if ! test -f "$source_path/ui/keycodemapdb/README"
@@ -1508,9 +1508,16 @@ for opt do
   ;;
   --with-git=*) git="$optarg"
   ;;
-  --enable-git-update) git_update=yes
+  --enable-git-update)
+      git_submodules_action="update"
+      echo "--enable-git-update deprecated, use --with-git-submodules=update"
   ;;
-  --disable-git-update) git_update=no
+  --disable-git-update)
+      git_submodules_action="validate"
+      echo "--disable-git-update deprecated, use --with-git-submodules=validate"
+  ;;
+  --with-git-submodules=*)
+      git_submodules_action="$optarg"
   ;;
   --enable-debug-mutex) debug_mutex=yes
   ;;
@@ -1566,6 +1573,21 @@ for opt do
   esac
 done
 
+case $git_submodules_action in
+    update|validate)
+        if test ! -e "$source_path/.git"; then
+            echo "ERROR: cannot $git_submodules_action git submodules without .git"
+            exit 1
+        fi
+    ;;
+    ignore)
+    ;;
+    *)
+        echo "ERROR: invalid --with-git-submodules= value '$git_submodules_action'"
+        exit 1
+    ;;
+esac
+
 libdir="${libdir:-$prefix/lib}"
 libexecdir="${libexecdir:-$prefix/libexec}"
 includedir="${includedir:-$prefix/include}"
@@ -1715,6 +1737,9 @@ Advanced options (experts only):
   --ninja=NINJA            use specified ninja [$ninja]
   --smbd=SMBD              use specified smbd [$smbd]
   --with-git=GIT           use specified git [$git]
+  --with-git-submodules=update   update git submodules (default if .git dir exists)
+  --with-git-submodules=validate fail if git submodules are not up to date
+  --with-git-submodules=ignore   do not update or check git submodules (default if no .git dir)
   --static                 enable static build [$static]
   --mandir=PATH            install man pages in PATH
   --datadir=PATH           install firmware in PATH/$qemu_suffix
@@ -1931,7 +1956,7 @@ python="$python -B"
 if test -z "$meson"; then
     if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.3; then
         meson=meson
-    elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    elif test $git_submodules_action != 'ignore' ; then
         meson=git
     elif test -e "${source_path}/meson/meson.py" ; then
         meson=internal
@@ -1999,7 +2024,7 @@ fi
 # Consult white-list to determine whether to enable werror
 # by default.  Only enable by default for git builds
 if test -z "$werror" ; then
-    if test -e "$source_path/.git" && \
+    if test "$git_submodules_action" != "ignore" && \
         { test "$linux" = "yes" || test "$mingw32" = "yes"; }; then
         werror="yes"
     else
@@ -3559,7 +3584,7 @@ fi
 case "$fdt" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    if test "$git_submodules_action" != "ignore"; then
       git_submodules="${git_submodules} dtc"
     fi
     ;;
@@ -4294,7 +4319,7 @@ fi
 case "$capstone" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    if test "$git_submodules_action" != "ignore"; then
       git_submodules="${git_submodules} capstone"
     fi
     ;;
@@ -5241,7 +5266,7 @@ fi
 case "$slirp" in
   auto | enabled | internal)
     # Simpler to always update submodule, even if not needed.
-    if test -e "${source_path}/.git" && test $git_update = 'yes' ; then
+    if test "$git_submodules_action" != "ignore"; then
       git_submodules="${git_submodules} slirp"
     fi
     ;;
@@ -5458,7 +5483,7 @@ if test "$cpu" = "s390x" ; then
     roms="$roms s390-ccw"
     # SLOF is required for building the s390-ccw firmware on s390x,
     # since it is using the libnet code from SLOF for network booting.
-    if test -e "${source_path}/.git" ; then
+    if test "$git_submodules_action" != "ignore"; then
       git_submodules="${git_submodules} roms/SLOF"
     fi
   fi
@@ -5496,8 +5521,8 @@ else
     cxx=
 fi
 
-if test $git_update = 'yes' ; then
-    (cd "${source_path}" && GIT="$git" "./scripts/git-submodule.sh" update "$git_submodules")
+if !(GIT="$git" "$source_path/scripts/git-submodule.sh" "$git_submodules_action" "$git_submodules"); then
+    exit 1
 fi
 
 config_host_mak="config-host.mak"
@@ -5508,7 +5533,7 @@ echo >> $config_host_mak
 echo all: >> $config_host_mak
 echo "GIT=$git" >> $config_host_mak
 echo "GIT_SUBMODULES=$git_submodules" >> $config_host_mak
-echo "GIT_UPDATE=$git_update" >> $config_host_mak
+echo "GIT_SUBMODULES_ACTION=$git_submodules_action" >> $config_host_mak
 
 echo "ARCH=$ARCH" >> $config_host_mak
 
diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
index 65ed877aefd..e225d3a9634 100755
--- a/scripts/git-submodule.sh
+++ b/scripts/git-submodule.sh
@@ -9,9 +9,14 @@ command=$1
 shift
 maybe_modules="$@"
 
+# if --with-git-submodules=ignore, do nothing
+test "$command" = "ignore" && exit 0
+
 test -z "$GIT" && GIT=git
 
-error() {
+cd "$(dirname "$0")/.."
+
+update_error() {
     echo "$0: $*"
     echo
     echo "Unable to automatically checkout GIT submodules '$modules'."
@@ -24,7 +29,7 @@ error() {
     echo "Alternatively you may disable automatic GIT submodule checkout"
     echo "with:"
     echo
-    echo " $ ./configure --disable-git-update"
+    echo " $ ./configure --with-git-submodules=validate"
     echo
     echo "and then manually update submodules prior to running make, with:"
     echo
@@ -33,6 +38,19 @@ error() {
     exit 1
 }
 
+validate_error() {
+    if test "$1" = "validate"; then
+        echo "GIT submodules checkout is out of date, and submodules"
+        echo "configured for validate only. Please run"
+        echo "  scripts/git-submodule.sh update $maybe_modules"
+        echo "from the source directory or call configure with"
+        echo "  --with-git-submodules=update"
+        echo "To disable GIT submodules validation, use"
+        echo "  --with-git-submodules=ignore"
+    fi
+    exit 1
+}
+
 modules=""
 for m in $maybe_modules
 do
@@ -52,18 +70,18 @@ then
 fi
 
 case "$command" in
-status)
+status|validate)
     if test -z "$maybe_modules"
     then
-         test -s ${substat} && exit 1 || exit 0
+         test -s ${substat} && validate_error "$command" || exit 0
     fi
 
-    test -f "$substat" || exit 1
+    test -f "$substat" || validate_error "$command"
     for module in $modules; do
         CURSTATUS=$($GIT submodule status $module)
         OLDSTATUS=$(cat $substat | grep $module)
         if test "$CURSTATUS" != "$OLDSTATUS"; then
-            exit 1
+            validate_error "$command"
         fi
     done
     exit 0
@@ -76,10 +94,10 @@ update)
     fi
 
     $GIT submodule update --init $modules 1>/dev/null
-    test $? -ne 0 && error "failed to update modules"
+    test $? -ne 0 && update_error "failed to update modules"
 
     $GIT submodule status $modules > "${substat}"
-    test $? -ne 0 && error "failed to save git submodule status" >&2
+    test $? -ne 0 && update_error "failed to save git submodule status" >&2
     ;;
 esac
 
-- 
2.25.1


