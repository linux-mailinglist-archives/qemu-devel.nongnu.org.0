Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5BB17E858
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 20:26:58 +0100 (CET)
Received: from localhost ([::1]:48506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBO3G-0000FM-1s
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 15:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jBNzp-0004Xg-Uz
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:23:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jBNzo-0002Ju-Fv
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:23:25 -0400
Received: from smtp.lg.ehu.es ([158.227.0.66]:37639 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jBNzo-0002Ho-43
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:23:24 -0400
Received: from imsva2.lgp.ehu.es (imsva2.lgp.ehu.es [10.0.3.246])
 by postfix.smtp2.imsva2 (Postfix) with ESMTPS id F0C0E5F6F;
 Mon,  9 Mar 2020 20:23:22 +0100 (CET)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D41F15A04F;
 Mon,  9 Mar 2020 20:23:22 +0100 (CET)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C869D5A045;
 Mon,  9 Mar 2020 20:23:22 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.76])
 by imsva2.lgp.ehu.es (Postfix) with ESMTPS;
 Mon,  9 Mar 2020 20:23:22 +0100 (CET)
Received: from 669c1c222ef4 (static.187.0.0.81.ibercom.com [81.0.0.187])
 by smtp2 (Postfix) with ESMTPSA id 833D16311;
 Mon,  9 Mar 2020 20:23:22 +0100 (CET)
Date: Mon, 9 Mar 2020 19:23:21 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 08/10] qemu-binfmt-conf.sh: generalize <CPU> to
 positional [TARGETS]
Message-ID: <20200309192321.GH65@669c1c222ef4>
References: <20200309191200.GA60@669c1c222ef4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309191200.GA60@669c1c222ef4>
X-Greylist: ACL 191 matched, not delayed by milter-greylist-4.6.2 (smtp2
 [10.0.100.76]); Mon, 09 Mar 2020 20:23:22 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25280.002
X-TM-AS-Result: No--6.998-7.0-31-10
X-imss-scan-details: No--6.998-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25280.002
X-TMASE-Result: 10--6.998000-10.000000
X-TMASE-MatchedRID: YJG9ytXm/s6u1FVcbKqeS31zro62qhdCM0wEwxpnA/6+fWK8N2kAhz7s
 j+R9FMn6w9YhgVtZ5FSWFZNqBtigagJ5EJtQroRi/Tc2iq45CnupZoxavGZhju9FCyScBaYaxM9
 DM4OIRzZQ6yZ033EzWvVjmIj0I4/bgbzQvVJsmAc/ApMPW/xhXlQQ0EgzIoPR33Nl3elSfsq6o5
 pOE3X0ptg9dKgWHMAdkb3r+FsnMU10J8anK3Imuujl+xhc/R9QK1PH96GPPGAN+F513KGyq4eEz
 yqa7HdJl+J1cqvNn071m0jxLTibTlsMX+cJfRDxxi///JpaHQM/pOSL72dTf6tNdpFrZXd82VC1
 QWKKKPprZ54ynQshcEC9kO2OSfgdwL+8p4iyg3yeAiCmPx4NwNivpTdmVCR2xEHRux+uk8h+ICq
 uNi0WJPbpG7TUKe4pjfqqGpq3uSh1s5cd1+UUt5kz/63nPp1bftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp2.imsva2 [10.0.100.76]);
 Mon, 09 Mar 2020 20:23:22 +0100 (CET)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 158.227.0.66
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
Cc: riku.voipio@iki.fi, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This breaks brackward compatibility.

Option '--systemd CPU' allows to register binfmt interpreters for a
single target architecture or for 'ALL' (of them). This patch
generalizes the approach to support it in any mode (default, '--debian'
or '--systemd'). To do so, option 'systemd' is changed to be boolean
(no args). Then, all the positional arguments are considered to be a
list of target architectures.

If no positional arguments are provided, all of the architectures in
qemu_target_list are registered. Conversely, argument value 'NONE'
allows to make a 'dry run' of the script. I.e., checks are executed
according to the mode, but no interpreter is registered.

Support QEMU_TARGETS environment variable, consistently with 'path',
'suffix', 'persistent' and 'credential', The supported formats are
the same as for positional arguments, which have priority. If both
the variable and the list of positional arguments are empty, defaults
to qemu_target_list.

Signed-off-by: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 80 +++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index b1a54aa470..538ef4aec0 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -6,6 +6,28 @@ ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
 sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensaeb \
 microblaze microblazeel or1k x86_64"
 
+# check if given TARGETS is/are in the supported target list
+qemu_check_target_list() {
+    if [ $# -eq 0 ]; then
+      checked_target_list="$qemu_target_list"
+      return
+    fi
+    unset checked_target_list
+    for target; do
+        for cpu in $qemu_target_list; do
+            if [ "x$cpu" = "x$target" ]; then
+                checked_target_list="$checked_target_list $target"
+                break
+            fi
+        done
+        if [ "x$cpu" != "x$target" ]; then
+            echo "ERROR: unknown CPU \"$target\"" 1>&2
+            usage
+            exit 1
+        fi
+    done
+}
+
 i386_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'
 i386_mask='\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
 i386_family=i386
@@ -171,14 +193,16 @@ qemu_get_family() {
 
 usage() {
     cat <<EOF
+Usage: qemu-binfmt-conf.sh [options] [TARGETS]
 
-Usage: qemu-binfmt-conf.sh [options]
-
-Configure binfmt_misc to use qemu interpreter
+Configure binfmt_misc to use qemu interpreter for the given TARGETS.
 
 Options and associated environment variables:
 
 Argument             Env-variable     Description
+TARGETS              QEMU_TARGETS     A single arch name or a list of them (see all names below);
+                                      if empty, configure all known targets;
+                                      if 'NONE', no interpreter is configured.
 -h|--help                             display this usage
 -Q|--path PATH       QEMU_PATH        set path to qemu interpreter(s)
 -F|--suffix SUFFIX   QEMU_SUFFIX      add a suffix to the default interpreter name
@@ -188,12 +212,12 @@ Argument             Env-variable     Description
                                       to the binary to interpret
 -e|--exportdir PATH                   define where to write configuration files
                                       (default: $SYSTEMDDIR or $DEBIANDIR)
--s|--systemd CPU                      don't write into /proc, generate file for
-                                      systemd-binfmt.service for the given CPU; if CPU is "ALL",
-                                      generate a file for all known cpus.
+-s|--systemd                          don't write into /proc, generate file(s) for
+                                      systemd-binfmt.service;
 -d|--debian                           don't write into /proc, generate update-binfmts templates
 
 Defaults:
+QEMU_TARGETS=$QEMU_TARGETS
 QEMU_PATH=$QEMU_PATH
 QEMU_SUFFIX=$QEMU_SUFFIX
 QEMU_PERSISTENT=$QEMU_PERSISTENT
@@ -207,14 +231,10 @@ To remove interpreter, use :
 
     sudo update-binfmts --package qemu-CPU --remove qemu-CPU $QEMU_PATH
 
-With systemd, binfmt files are loaded by systemd-binfmt.service
+The environment variable HOST_ARCH allows to override 'uname' to generate configuration files for
+a different architecture than the current one.
 
-The environment variable HOST_ARCH allows to override 'uname' to generate configuration files for a
-different architecture than the current one.
-
-where CPU is one of:
-
-    $qemu_target_list
+QEMU target list: $qemu_target_list
 
 EOF
 }
@@ -298,9 +318,15 @@ qemu_set_binfmts() {
     # probe cpu type
     host_family=$(qemu_get_family)
 
-    # register the interpreter for each cpu except for the native one
+    # reduce the list of target interpreters to those given in the CLI
+    targets=${@:-$QEMU_TARGET}
+    if [ "x$targets" = "xNONE" ]; then
+      return
+    fi
+    qemu_check_target_list $targets
 
-    for cpu in ${qemu_target_list}; do
+    # register the interpreter for each target except for the native one
+    for cpu in $checked_target_list; do
         magic=$(eval echo \$${cpu}_magic)
         mask=$(eval echo \$${cpu}_mask)
         family=$(eval echo \$${cpu}_family)
@@ -328,12 +354,13 @@ BINFMT_SET=qemu_register_interpreter
 SYSTEMDDIR="/etc/binfmt.d"
 DEBIANDIR="/usr/share/binfmts"
 
+QEMU_TARGETS="${QEMU_TARGETS:-}"
 QEMU_PATH="${QEMU_PATH:-/usr/local/bin}"
 QEMU_SUFFIX="${QEMU_SUFFIX:-}"
 QEMU_PERSISTENT="${QEMU_PERSISTENT:-no}"
 QEMU_CREDENTIAL="${QEMU_CREDENTIAL:-no}"
 
-options=$(getopt -o ds:Q:S:e:hcp -l debian,systemd:,path:,suffix:,exportdir:,help,credential,persistent -- "$@")
+options=$(getopt -o dsQ:S:e:hcp -l debian,systemd,path:,suffix:,exportdir:,help,credential,persistent -- "$@")
 eval set -- "$options"
 
 while true; do
@@ -347,23 +374,6 @@ while true; do
         CHECK=qemu_check_systemd
         BINFMT_SET=qemu_generate_systemd
         EXPORTDIR=${EXPORTDIR:-$SYSTEMDDIR}
-        shift
-        # check given cpu is in the supported CPU list
-        if [ "$1" != "ALL" ]; then
-            for cpu in ${qemu_target_list}; do
-                if [ "$cpu" = "$1" ]; then
-                    break
-                fi
-            done
-
-            if [ "$cpu" = "$1" ]; then
-                qemu_target_list="$1"
-            else
-                echo "ERROR: unknown CPU \"$1\"" 1>&2
-                usage
-                exit 1
-            fi
-        fi
         ;;
     -Q|--path)
         shift
@@ -394,5 +404,7 @@ while true; do
     shift
 done
 
+shift
+
 $CHECK
-qemu_set_binfmts
+qemu_set_binfmts "$@"
-- 
2.25.1



