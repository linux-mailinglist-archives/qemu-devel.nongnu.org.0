Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED9017E76F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 19:46:22 +0100 (CET)
Received: from localhost ([::1]:48068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBNPw-0008KV-IO
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 14:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jBNLh-00025e-BB
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jBNLg-0005k8-58
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:41:57 -0400
Received: from smtp.lg.ehu.es ([158.227.0.66]:4074 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jBNLf-0005jk-PO
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:41:56 -0400
Received: from imsva2.lgp.ehu.es (imsva2.lgp.ehu.es [10.0.3.246])
 by postfix.smtp2.imsva2 (Postfix) with ESMTPS id BB9A861E1;
 Mon,  9 Mar 2020 19:41:54 +0100 (CET)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84B285A04F;
 Mon,  9 Mar 2020 19:41:54 +0100 (CET)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 795655A045;
 Mon,  9 Mar 2020 19:41:54 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.76])
 by imsva2.lgp.ehu.es (Postfix) with ESMTPS;
 Mon,  9 Mar 2020 19:41:54 +0100 (CET)
Received: from 669c1c222ef4 (static.187.0.0.81.ibercom.com [81.0.0.187])
 by smtp2 (Postfix) with ESMTPSA id 3778464BB;
 Mon,  9 Mar 2020 19:41:54 +0100 (CET)
Date: Mon, 9 Mar 2020 18:41:53 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 9/9] qemu-binfmt-conf.sh: add --test
Message-ID: <20200309184153.GI14@669c1c222ef4>
References: <20200309183521.GA9@669c1c222ef4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309183521.GA9@669c1c222ef4>
X-Greylist: ACL 191 matched, not delayed by milter-greylist-4.6.2 (smtp2
 [10.0.100.76]); Mon, 09 Mar 2020 19:41:54 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25280.001
X-TM-AS-Result: No--2.997-7.0-31-10
X-imss-scan-details: No--2.997-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25280.001
X-TMASE-Result: 10--2.997200-10.000000
X-TMASE-MatchedRID: C2Ox2wkr63hnuEpLNqEJsi2416nc3bQlcZ9gNqdc/asHZBaLwEXlKGb6
 PphVtfZgqZ4KncYE2LNLKA6O53vFEgcVh2A5MTJF6OX7GFz9H1DnaaW2UTafyBpW65Njg4aDrr5
 TE4GLzk3aw+TzluSPBbpxDH0YWH+IrjwZVDJcDJ81VHP4fCovgg4fD/I06RGBn7jOJQ+rgvE6dE
 UNf2ygXDTG16mgO0fW4dBoWJ2sWPf83RazFYjhB8zSKGx9g8xhZlQDEANheHGbKItl61J/yX2PY
 bDNMTe9KrauXd3MZDVXdESAFhjsvKGsykM7wjSj7n4g7rh/SbFraIOpF3W1qoRBvsjJDU2Dg6RB
 ZjtwN4DldfJG5GZZuA1MDj3rRxcUYAg4cU+zyHqXQcmMSwV+f1i7FP9SiiauF1qISuK4qVqjyqn
 hL+I3r7JQSBWmvqaR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp2.imsva2 [10.0.100.76]);
 Mon, 09 Mar 2020 19:41:54 +0100 (CET)
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

Signed-off-by: umarcor <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 55224a68e1..21c8f63916 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -201,8 +201,7 @@ Options and associated environment variables:
 
 Argument             Env-variable     Description
 TARGETS              QEMU_TARGETS     A single arch name or a list of them (see all names below);
-                                      if empty, configure/clear all known targets;
-                                      if 'NONE', no interpreter is configured.
+                                      if empty, configure/clear all known targets.
 -h|--help                             display this usage
 -Q|--path PATH       QEMU_PATH        set path to qemu interpreter(s)
 -F|--suffix SUFFIX   QEMU_SUFFIX      add a suffix to the default interpreter name
@@ -212,6 +211,8 @@ TARGETS              QEMU_TARGETS     A single arch name or a list of them (see
                                       to the binary to interpret
 -r|--clear           QEMU_CLEAR       (yes) remove registered interpreters for target TARGETS;
                                       then exit.
+-t|--test            QEMU_TEST        (yes) test the setup with the provided arguments, but do not
+                                      configure any of the interpreters.
 -e|--exportdir PATH                   define where to write configuration files
                                       (default: $SYSTEMDDIR or $DEBIANDIR)
 -s|--systemd                          don't write into /proc, generate file(s) for
@@ -225,6 +226,7 @@ QEMU_SUFFIX=$QEMU_SUFFIX
 QEMU_PERSISTENT=$QEMU_PERSISTENT
 QEMU_CREDENTIAL=$QEMU_CREDENTIAL
 QEMU_CLEAR=$QEMU_CLEAR
+QEMU_TEST=$QEMU_TEST
 
 To import templates with update-binfmts, use :
 
@@ -323,9 +325,6 @@ qemu_set_binfmts() {
 
     # reduce the list of target interpreters to those given in the CLI
     targets=${@:-$QEMU_TARGET}
-    if [ "x$targets" = "xNONE" ]; then
-      return
-    fi
     qemu_check_target_list $targets
 
     # register the interpreter for each target except for the native one
@@ -377,12 +376,16 @@ QEMU_SUFFIX="${QEMU_SUFFIX:-}"
 QEMU_PERSISTENT="${QEMU_PERSISTENT:-no}"
 QEMU_CREDENTIAL="${QEMU_CREDENTIAL:-no}"
 QEMU_CLEAR="${QEMU_CLEAR:-no}"
+QEMU_TEST="${QEMU_TEST:-no}"
 
-options=$(getopt -o rdsQ:S:e:hcp -l clear,debian,systemd,path:,suffix:,exportdir:,help,credential,persistent -- "$@")
+options=$(getopt -o trdsQ:S:e:hcp -l test,clear,debian,systemd,path:,suffix:,exportdir:,help,credential,persistent -- "$@")
 eval set -- "$options"
 
 while true; do
     case "$1" in
+    -t|--test)
+        QEMU_TEST="yes"
+        ;;
     -r|--clear)
         QEMU_CLEAR="yes"
         ;;
@@ -431,6 +434,11 @@ shift
 
 $CHECK
 
+if [ "x$QEMU_TEST" = "xyes" ]; then
+    BINFMT_SET=:
+    BINFMT_CLEAR=:
+fi
+
 if [ "x$QEMU_CLEAR" = "xyes" ]; then
     qemu_check_target_list "$@"
     for t in $checked_target_list; do
-- 
2.25.1



