Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD717CFA6
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 19:52:14 +0100 (CET)
Received: from localhost ([::1]:51804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAeYW-0001OB-UB
	for lists+qemu-devel@lfdr.de; Sat, 07 Mar 2020 13:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAeXn-0000xg-UB
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 13:51:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAeXk-0000yY-Un
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 13:51:26 -0500
Received: from smtp.lg.ehu.es ([158.227.0.66]:53920 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jAeXk-0000vP-Jj
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 13:51:24 -0500
Received: from imsva1.lgp.ehu.es (imsva1.lgp.ehu.es [10.0.3.245])
 by postfix.smtp1.imsva1 (Postfix) with ESMTPS id 5B73C35A74;
 Sat,  7 Mar 2020 19:51:22 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 241F911004A;
 Sat,  7 Mar 2020 19:51:22 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1825C110045;
 Sat,  7 Mar 2020 19:51:22 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.73])
 by imsva1.lgp.ehu.es (Postfix) with ESMTPS;
 Sat,  7 Mar 2020 19:51:22 +0100 (CET)
Received: from afee69d503a7 (unknown [81.0.0.187])
 by smtp1 (Postfix) with ESMTPSA id B9C8635A74;
 Sat,  7 Mar 2020 19:51:21 +0100 (CET)
Date: Sat, 7 Mar 2020 18:51:12 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/9] qemu-binfmt-conf.sh: use the same presentation format
 as for qemu-*
Message-ID: <20200307185102.GA45@afee69d503a7>
References: <20200307170251.GA7@dd5f6ec33fb0>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200307170251.GA7@dd5f6ec33fb0>
X-Greylist: ACL 184 matched, not delayed by milter-greylist-4.6.2 (smtp1
 [10.0.100.73]); Sat, 07 Mar 2020 19:51:22 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25276.002
X-TM-AS-Result: No--0.153-7.0-31-10
X-imss-scan-details: No--0.153-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25276.002
X-TMASE-Result: 10--0.153400-10.000000
X-TMASE-MatchedRID: mZljRXDwq+48mRT0SYY6fi2416nc3bQlcZ9gNqdc/asHZBaLwEXlKICu
 qghmtWfX+r4YfSxMB0mGCVFYpEZ7FAkGWAZ8v6JzKrDHzH6zmUWnZS/aYgjrzgv1OPvvDLzsOnR
 FDX9soFzPtGnU3UildrOtkFKj8cABpkvVukmlwd0TF1LtYW9la0yEf8qljHK7XZgp9Jjp/MxwVH
 Awn53NJxZ2QD7FoT3F+KEI6rMuUUejxYyRBa/qJeko2t9ghSAshzImjrjZJG3dB/CxWTRRuzBqY
 ATSOgWjXp68uB9g9w5Ak2OXbmWy8vRKUOTQ6F24JTDiHyftODLmtAxcgxB46nazG8o2/SGPePyn
 A/gwmid2V2KfpNeookiaomPdRb00G4nK6yQeDgDMzYUE7uLiElFhbmF/OERbQIuZkMO8x92xAqs
 tPEP3B37cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp1.imsva1 [10.0.100.73]);
 Sat, 07 Mar 2020 19:51:22 +0100 (CET)
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

Signed-off-by: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 63 +++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 347cddf698..251a78a2ce 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -171,47 +171,48 @@ qemu_get_family() {
 
 usage() {
     cat <<EOF
-Usage: qemu-binfmt-conf.sh [--qemu-path PATH][--debian][--systemd CPU]
-                           [--help][--credential][--exportdir PATH]
-                           [--persistent][--qemu-suffix SUFFIX]
+Usage: qemu-binfmt-conf.sh [options]
 
-       Configure binfmt_misc to use qemu interpreter
+Configure binfmt_misc to use qemu interpreter
 
-       --help:        display this usage
-       --qemu-path:   set path to qemu interpreter ($QEMU_PATH)
-       --qemu-suffix: add a suffix to the default interpreter name
-       --debian:      don't write into /proc,
-                      instead generate update-binfmts templates
-       --systemd:     don't write into /proc,
-                      instead generate file for systemd-binfmt.service
-                      for the given CPU. If CPU is "ALL", generate a
-                      file for all known cpus
-       --exportdir:   define where to write configuration files
-                      (default: $SYSTEMDDIR or $DEBIANDIR)
-       --credential:  if present, credential and security tokens are
-                      calculated according to the binary to interpret
-                      (QEMU_CREDENTIAL=yes)
-       --persistent:  if present, the interpreter is loaded when binfmt is
-                      configured and remains in memory. All future uses
-                      are cloned from the open file.
-                      (QEMU_PERSISTENT=yes)
+Options and associated environment variables:
 
-    To import templates with update-binfmts, use :
+Argument             Env-variable     Description
+-h|--help                             display this usage
+-Q|--qemu-path PATH  QEMU_PATH        set path to qemu interpreter
+-F|--qemu-suffix SUFFIX               add a suffix to the default interpreter name
+-p|--persistent      QEMU_PERSISTENT  (yes) load the interpreter and keep it in memory; all future
+                                      uses are cloned from the open file.
+-c|--credential      QEMU_CREDENTIAL  (yes) credential and security tokens are calculated according
+                                      to the binary to interpret
+-e|--exportdir PATH                   define where to write configuration files
+                                      (default: $SYSTEMDDIR or $DEBIANDIR)
+-s|--systemd CPU                      don't write into /proc, generate file for
+                                      systemd-binfmt.service for the given CPU; if CPU is "ALL",
+                                      generate a file for all known cpus.
+-d|--debian                           don't write into /proc, generate update-binfmts templates
 
-        sudo update-binfmts --importdir ${EXPORTDIR:-$DEBIANDIR} --import qemu-CPU
+Defaults:
+QEMU_PATH=$QEMU_PATH
+QEMU_PERSISTENT=$QEMU_PERSISTENT
+QEMU_CREDENTIAL=$QEMU_CREDENTIAL
 
-    To remove interpreter, use :
+To import templates with update-binfmts, use :
 
-        sudo update-binfmts --package qemu-CPU --remove qemu-CPU $QEMU_PATH
+    sudo update-binfmts --importdir ${EXPORTDIR:-$DEBIANDIR} --import qemu-CPU
 
-    With systemd, binfmt files are loaded by systemd-binfmt.service
+To remove interpreter, use :
 
-    The environment variable HOST_ARCH allows to override 'uname' to generate
-    configuration files for a different architecture than the current one.
+    sudo update-binfmts --package qemu-CPU --remove qemu-CPU $QEMU_PATH
 
-    where CPU is one of:
+With systemd, binfmt files are loaded by systemd-binfmt.service
 
-        $qemu_target_list
+The environment variable HOST_ARCH allows to override 'uname' to generate configuration files for a
+different architecture than the current one.
+
+where CPU is one of:
+
+    $qemu_target_list
 
 EOF
 }
-- 
2.25.1



