Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2171017CF77
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 18:35:01 +0100 (CET)
Received: from localhost ([::1]:51164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAdLo-00005i-71
	for lists+qemu-devel@lfdr.de; Sat, 07 Mar 2020 12:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAdL4-00084e-GF
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:34:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAdL2-0004qU-Cg
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:34:13 -0500
Received: from smtp.lg.ehu.es ([158.227.0.66]:54751 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jAdL2-0004pT-1H
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:34:12 -0500
Received: from imsva1.lgp.ehu.es (imsva1.lgp.ehu.es [10.0.3.245])
 by postfix.smtp1.imsva1 (Postfix) with ESMTPS id 9765835F1E;
 Sat,  7 Mar 2020 18:34:10 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F30D11004A;
 Sat,  7 Mar 2020 18:34:10 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53501110045;
 Sat,  7 Mar 2020 18:34:10 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.73])
 by imsva1.lgp.ehu.es (Postfix) with ESMTPS;
 Sat,  7 Mar 2020 18:34:10 +0100 (CET)
Received: from afee69d503a7 (unknown [81.0.0.187])
 by smtp1 (Postfix) with ESMTPSA id 0F4D735F1E;
 Sat,  7 Mar 2020 18:34:10 +0100 (CET)
Date: Sat, 7 Mar 2020 17:34:09 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 5/9] qemu-binfmt-conf.sh: remove 'qemu' prefix from cli
 options
Message-ID: <20200307173409.GE9@afee69d503a7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: ACL 184 matched, not delayed by milter-greylist-4.6.2 (smtp1
 [10.0.100.73]); Sat, 07 Mar 2020 18:34:10 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25276.001
X-TM-AS-Result: No-0.609-7.0-31-10
X-imss-scan-details: No-0.609-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25276.001
X-TMASE-Result: 10-0.609300-10.000000
X-TMASE-MatchedRID: mafpUJSAc1A8mRT0SYY6fqS9pC14MC3CUHV7v8X++rndQ2cXpbDqBU/O
 fkh/+AL4f9zrAY3MatNqAxBaFFZ85HTKrg3nLjv1If0TE1VduNsmOLJFRlRlklezEE205dNv5sc
 /I6vXY93xhWafZnqM5YhJUX5c5pgUkJIJE4kX5BSK2+RZ4/fWSVJtXEGMtLPHlwV2iaAfSWf+xO
 hjarOnHl67qWU6gzsGecNBGrkKJkf3FLeZXNZS4IzHo47z5Aa+gJvqVR3z499a6iv/OQVyBg6Nc
 S54sl2E0KaT92v5dkgc65uI/oOh8X18wnYDXeXioLRvhTZkSBeFkTLqA1tMMYopQVbJ8EMLCehC
 vRokedzR6A9/75PVP9h1s6Q8V93dpazx64v3JfnDyDYcE1wXmQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp1.imsva1 [10.0.100.73]);
 Sat, 07 Mar 2020 18:34:10 +0100 (CET)
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

This breaks backward compatibility.

Options 'qemu-path' and 'qemu-suffix' have the 'qemu-' prefix, which is
not present in other option names ('debian', 'systemd', 'persistent',
'credential'...). In order to keep consistency, the prefix is removed.

Signed-off-by: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 251a78a2ce..2a035394e0 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -171,6 +171,7 @@ qemu_get_family() {
 
 usage() {
     cat <<EOF
+
 Usage: qemu-binfmt-conf.sh [options]
 
 Configure binfmt_misc to use qemu interpreter
@@ -179,8 +180,8 @@ Options and associated environment variables:
 
 Argument             Env-variable     Description
 -h|--help                             display this usage
--Q|--qemu-path PATH  QEMU_PATH        set path to qemu interpreter
--F|--qemu-suffix SUFFIX               add a suffix to the default interpreter name
+-Q|--path PATH       QEMU_PATH        set path to qemu interpreter(s)
+-F|--suffix SUFFIX                    add a suffix to the default interpreter name
 -p|--persistent      QEMU_PERSISTENT  (yes) load the interpreter and keep it in memory; all future
                                       uses are cloned from the open file.
 -c|--credential      QEMU_CREDENTIAL  (yes) credential and security tokens are calculated according
@@ -333,7 +334,7 @@ QEMU_CREDENTIAL="${QEMU_CREDENTIAL:-no}"
 
 QEMU_SUFFIX=""
 
-options=$(getopt -o ds:Q:S:e:hcp -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential,persistent -- "$@")
+options=$(getopt -o ds:Q:S:e:hcp -l debian,systemd:,path:,suffix:,exportdir:,help,credential,persistent -- "$@")
 eval set -- "$options"
 
 while true ; do
@@ -365,11 +366,11 @@ while true ; do
             fi
         fi
         ;;
-    -Q|--qemu-path)
+    -Q|--path)
         shift
         QEMU_PATH="$1"
         ;;
-    -F|--qemu-suffix)
+    -F|--suffix)
         shift
         QEMU_SUFFIX="$1"
         ;;
-- 
2.25.1



