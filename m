Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A644017E76C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 19:44:25 +0100 (CET)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBNO4-0005o9-MK
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 14:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jBNLH-0001G3-Ek
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:41:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jBNLG-0005av-1F
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:41:31 -0400
Received: from smtp.lg.ehu.es ([158.227.0.66]:63012 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jBNLF-0005aR-LM
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:41:29 -0400
Received: from imsva2.lgp.ehu.es (imsva2.lgp.ehu.es [10.0.3.246])
 by postfix.smtp2.imsva2 (Postfix) with ESMTPS id 913DA61E1;
 Mon,  9 Mar 2020 19:41:28 +0100 (CET)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57BBD5A053;
 Mon,  9 Mar 2020 19:41:28 +0100 (CET)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C8BC5A050;
 Mon,  9 Mar 2020 19:41:28 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.76])
 by imsva2.lgp.ehu.es (Postfix) with ESMTPS;
 Mon,  9 Mar 2020 19:41:28 +0100 (CET)
Received: from 669c1c222ef4 (static.187.0.0.81.ibercom.com [81.0.0.187])
 by smtp2 (Postfix) with ESMTPSA id 0A39764BB;
 Mon,  9 Mar 2020 19:41:28 +0100 (CET)
Date: Mon, 9 Mar 2020 18:41:26 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 8/9] qemu-binfmt-conf.sh: add option --clear
Message-ID: <20200309184126.GH14@669c1c222ef4>
References: <20200309183521.GA9@669c1c222ef4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309183521.GA9@669c1c222ef4>
X-Greylist: ACL 191 matched, not delayed by milter-greylist-4.6.2 (smtp2
 [10.0.100.76]); Mon, 09 Mar 2020 19:41:28 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25280.001
X-TM-AS-Result: No-1.776-7.0-31-10
X-imss-scan-details: No-1.776-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25280.001
X-TMASE-Result: 10-1.775800-10.000000
X-TMASE-MatchedRID: YJG9ytXm/s5nuEpLNqEJsme0F1HB9i2hMVx/3ZYby796pt1oU+C/pOwX
 ofcWCzMeR5VEg2WHb7e6w0blN6o1l/MNTbjUKZM+20204SCJw/rLvfc3C6SWwnO0TctWrlA9dfu
 huqa4A1AZw5ucm3NLWhvYV6pkN/jgOLzSBOk91M5bF+jvJlkOptxs0lj1L8rvaUoLEaPNsPSl+9
 Tl6lXp3K3aC25avUuauxliYAiybD/AHXRKkXCmPIIK2tjTqNotp1Pjcaldww0aVuuTY4OGgweWZ
 DV/J9uBGHD/KNtC9kNVhnxWlpagXK0iin8P0KjVKrDHzH6zmUXf+zJsO3bf/t9zZd3pUn7KlMa9
 Q0Vx5vSl0s9gTN4+NZpBpHnW+wt+Wb1kI9uGZd+eAiCmPx4NwNivpTdmVCR2xEHRux+uk8ifEzJ
 5hPndGXxqZoGIPX8Y+Lg+FkJw5Mx6KDeJ828D58CmQW6Xs5JoX8ngXjbQD/6R6RBq0m416KjYwA
 elybSOx9GG6tJ5RTDW65fiNexYGwnoQr0aJHnc0egPf++T1T/YdbOkPFfd3aWs8euL9yX5w8g2H
 BNcF5k=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp2.imsva2 [10.0.100.76]);
 Mon, 09 Mar 2020 19:41:28 +0100 (CET)
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

This is a partial implementation.

Allows to remove a single or a list of already registered binfmt
interpreters. Valid values are those in qemu_target_list.
If TARGETS is empty, all the existing 'qemu-*' interpreters are
removed.

This is partial because 'debian' and 'systemd' configurations are not
supported. The script will exit with error 'option clear not
implemented for this mode yet'.

Removal is done by printing '-1' as explained at:
https://www.kernel.org/doc/Documentation/admin-guide/binfmt-misc.rst

Signed-off-by: umarcor <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 538ef4aec0..55224a68e1 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -201,7 +201,7 @@ Options and associated environment variables:
 
 Argument             Env-variable     Description
 TARGETS              QEMU_TARGETS     A single arch name or a list of them (see all names below);
-                                      if empty, configure all known targets;
+                                      if empty, configure/clear all known targets;
                                       if 'NONE', no interpreter is configured.
 -h|--help                             display this usage
 -Q|--path PATH       QEMU_PATH        set path to qemu interpreter(s)
@@ -210,6 +210,8 @@ TARGETS              QEMU_TARGETS     A single arch name or a list of them (see
                                       uses are cloned from the open file.
 -c|--credential      QEMU_CREDENTIAL  (yes) credential and security tokens are calculated according
                                       to the binary to interpret
+-r|--clear           QEMU_CLEAR       (yes) remove registered interpreters for target TARGETS;
+                                      then exit.
 -e|--exportdir PATH                   define where to write configuration files
                                       (default: $SYSTEMDDIR or $DEBIANDIR)
 -s|--systemd                          don't write into /proc, generate file(s) for
@@ -222,6 +224,7 @@ QEMU_PATH=$QEMU_PATH
 QEMU_SUFFIX=$QEMU_SUFFIX
 QEMU_PERSISTENT=$QEMU_PERSISTENT
 QEMU_CREDENTIAL=$QEMU_CREDENTIAL
+QEMU_CLEAR=$QEMU_CLEAR
 
 To import templates with update-binfmts, use :
 
@@ -348,8 +351,22 @@ qemu_set_binfmts() {
     done
 }
 
+qemu_clear_notimplemented() {
+    echo "ERROR: option clear not implemented for this mode yet" 1>&2
+    usage
+    exit 1
+}
+
+qemu_clear_interpreter() {
+    p="/proc/sys/fs/binfmt_misc/$1"
+    if [ -f "$p" ]; then
+      printf %s -1 > "$p"
+    fi
+}
+
 CHECK=qemu_check_bintfmt_misc
 BINFMT_SET=qemu_register_interpreter
+BINFMT_CLEAR=qemu_clear_interpreter
 
 SYSTEMDDIR="/etc/binfmt.d"
 DEBIANDIR="/usr/share/binfmts"
@@ -359,20 +376,26 @@ QEMU_PATH="${QEMU_PATH:-/usr/local/bin}"
 QEMU_SUFFIX="${QEMU_SUFFIX:-}"
 QEMU_PERSISTENT="${QEMU_PERSISTENT:-no}"
 QEMU_CREDENTIAL="${QEMU_CREDENTIAL:-no}"
+QEMU_CLEAR="${QEMU_CLEAR:-no}"
 
-options=$(getopt -o dsQ:S:e:hcp -l debian,systemd,path:,suffix:,exportdir:,help,credential,persistent -- "$@")
+options=$(getopt -o rdsQ:S:e:hcp -l clear,debian,systemd,path:,suffix:,exportdir:,help,credential,persistent -- "$@")
 eval set -- "$options"
 
 while true; do
     case "$1" in
+    -r|--clear)
+        QEMU_CLEAR="yes"
+        ;;
     -d|--debian)
         CHECK=qemu_check_debian
         BINFMT_SET=qemu_generate_debian
+        BINFMT_CLEAR=qemu_clear_notimplemented
         EXPORTDIR=${EXPORTDIR:-$DEBIANDIR}
         ;;
     -s|--systemd)
         CHECK=qemu_check_systemd
         BINFMT_SET=qemu_generate_systemd
+        BINFMT_CLEAR=qemu_clear_notimplemented
         EXPORTDIR=${EXPORTDIR:-$SYSTEMDDIR}
         ;;
     -Q|--path)
@@ -407,4 +430,13 @@ done
 shift
 
 $CHECK
+
+if [ "x$QEMU_CLEAR" = "xyes" ]; then
+    qemu_check_target_list "$@"
+    for t in $checked_target_list; do
+        $BINFMT_CLEAR "qemu-$t"
+    done
+    exit
+fi
+
 qemu_set_binfmts "$@"
-- 
2.25.1



