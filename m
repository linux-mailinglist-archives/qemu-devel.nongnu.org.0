Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423E017CF75
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 18:31:19 +0100 (CET)
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAdIE-0005rJ-BR
	for lists+qemu-devel@lfdr.de; Sat, 07 Mar 2020 12:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAdH5-0005M5-AL
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:30:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAdH4-0008Mq-7r
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:30:07 -0500
Received: from smtp.lg.ehu.es ([158.227.0.66]:13792 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jAdH3-0008Km-Si
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:30:06 -0500
Received: from imsva1.lgp.ehu.es (imsva1.lgp.ehu.es [10.0.3.245])
 by postfix.smtp1.imsva1 (Postfix) with ESMTPS id 66B8A3825B;
 Sat,  7 Mar 2020 18:30:04 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27F6E11004D;
 Sat,  7 Mar 2020 18:30:04 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25171110045;
 Sat,  7 Mar 2020 18:30:04 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.73])
 by imsva1.lgp.ehu.es (Postfix) with ESMTPS;
 Sat,  7 Mar 2020 18:30:04 +0100 (CET)
Received: from afee69d503a7 (unknown [81.0.0.187])
 by smtp1 (Postfix) with ESMTPSA id CD7C23760E;
 Sat,  7 Mar 2020 18:30:03 +0100 (CET)
Date: Sat, 7 Mar 2020 17:30:02 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 3/9] qemu-binfmt-conf.sh: add QEMU_CREDENTIAL and
 QEMU_PERSISTENT
Message-ID: <20200307173002.GC9@afee69d503a7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: ACL 184 matched, not delayed by milter-greylist-4.6.2 (smtp1
 [10.0.100.73]); Sat, 07 Mar 2020 18:30:04 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25276.001
X-TM-AS-Result: No-1.919-7.0-31-10
X-imss-scan-details: No-1.919-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25276.001
X-TMASE-Result: 10-1.919100-10.000000
X-TMASE-MatchedRID: ehvrJQ9m4PA8mRT0SYY6fo6MisxJraxH9e5am3m57X1irg8tJChsdOp9
 RpeIFYR4f+3yqvQrlggtpxclXgLOJWJZXQNDzktSKrDHzH6zmUVzHsCOuSqn1gNZ45IRIZKg9WX
 m+yhJKyifvlup6aJGjuGJ0uaQ7XfxDvX2Sk47fs+VyEX4i+SWU+wlOGZoQVV0DpCUEeEFm7A8HP
 DFMN8fIiE3155ICPJPmyiLZetSf8mfYwIIcLjjbeGANVBCTxXNC24oEZ6SpSk6XEE7Yhw4FjYhL
 YVN7agli63pxu/S4xQSFXeoRq3xmaeqmMHxXeINQHHENQU9/NzPbq/ALUNTOmZgCXkOZpTlzpuq
 aZzc8oIUzt6CYykYPCtxJPipEDOM5s49x043aLlHPwBafde3Eazr0/cAC14wuP7sWlKY/sdnIxZ
 yJs78kg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp1.imsva1 [10.0.100.73]);
 Sat, 07 Mar 2020 18:30:04 +0100 (CET)
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

Allow to set options '--persistent' and/or '--credential' through
environment variables. If not defined, defaults are used ('no').
Anyway, command-line arguments have priority over environment variables.

Signed-off-by: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 75eb19c3bf..347cddf698 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -190,9 +190,11 @@ Usage: qemu-binfmt-conf.sh [--qemu-path PATH][--debian][--systemd CPU]
                       (default: $SYSTEMDDIR or $DEBIANDIR)
        --credential:  if present, credential and security tokens are
                       calculated according to the binary to interpret
+                      (QEMU_CREDENTIAL=yes)
        --persistent:  if present, the interpreter is loaded when binfmt is
                       configured and remains in memory. All future uses
                       are cloned from the open file.
+                      (QEMU_PERSISTENT=yes)
 
     To import templates with update-binfmts, use :
 
@@ -259,10 +261,10 @@ qemu_check_systemd() {
 
 qemu_generate_register() {
     flags=""
-    if [ "x$CREDENTIAL" = "xyes" ] ; then
+    if [ "x$QEMU_CREDENTIAL" = "xyes" ] ; then
         flags="OC"
     fi
-    if [ "x$PERSISTENT" = "xyes" ] ; then
+    if [ "x$QEMU_PERSISTENT" = "xyes" ] ; then
         flags="${flags}F"
     fi
 
@@ -285,7 +287,7 @@ package qemu-$cpu
 interpreter $qemu
 magic $magic
 mask $mask
-credential $CREDENTIAL
+credential $QEMU_CREDENTIAL
 EOF
 }
 
@@ -324,8 +326,10 @@ SYSTEMDDIR="/etc/binfmt.d"
 DEBIANDIR="/usr/share/binfmts"
 
 QEMU_PATH=/usr/local/bin
-CREDENTIAL=no
-PERSISTENT=no
+
+QEMU_PERSISTENT="${QEMU_PERSISTENT:-no}"
+QEMU_CREDENTIAL="${QEMU_CREDENTIAL:-no}"
+
 QEMU_SUFFIX=""
 
 options=$(getopt -o ds:Q:S:e:hcp -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential,persistent -- "$@")
@@ -377,10 +381,10 @@ while true ; do
         exit 1
         ;;
     -c|--credential)
-        CREDENTIAL="yes"
+        QEMU_CREDENTIAL="yes"
         ;;
     -p|--persistent)
-        PERSISTENT="yes"
+        QEMU_PERSISTENT="yes"
         ;;
     *)
         break
-- 
2.25.1



