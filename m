Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DDB17CF7D
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 18:36:32 +0100 (CET)
Received: from localhost ([::1]:51184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAdNG-00015i-1w
	for lists+qemu-devel@lfdr.de; Sat, 07 Mar 2020 12:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAdMR-0000f3-VC
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:35:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAdMQ-0006lw-Sh
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:35:39 -0500
Received: from smtp.lg.ehu.es ([158.227.0.66]:6424 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jAdMQ-0006h1-GH
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 12:35:38 -0500
Received: from imsva1.lgp.ehu.es (imsva1.lgp.ehu.es [10.0.3.245])
 by postfix.smtp1.imsva1 (Postfix) with ESMTPS id 1B3042CF6A;
 Sat,  7 Mar 2020 18:35:37 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7A6111004A;
 Sat,  7 Mar 2020 18:35:36 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBDCE110045;
 Sat,  7 Mar 2020 18:35:36 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.73])
 by imsva1.lgp.ehu.es (Postfix) with ESMTPS;
 Sat,  7 Mar 2020 18:35:36 +0100 (CET)
Received: from afee69d503a7 (unknown [81.0.0.187])
 by smtp1 (Postfix) with ESMTPSA id 67FEE2CF6A;
 Sat,  7 Mar 2020 18:35:36 +0100 (CET)
Date: Sat, 7 Mar 2020 17:35:35 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] qemu-binfmt-conf.sh: honour QEMU_PATH and/or QEMU_SUFFIX
Message-ID: <20200307173535.GF9@afee69d503a7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Greylist: ACL 184 matched, not delayed by milter-greylist-4.6.2 (smtp1
 [10.0.100.73]); Sat, 07 Mar 2020 18:35:36 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25276.001
X-TM-AS-Result: No-1.584-7.0-31-10
X-imss-scan-details: No-1.584-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25276.001
X-TMASE-Result: 10-1.583800-10.000000
X-TMASE-MatchedRID: GnNqJBi8oAc8mRT0SYY6fo6MisxJraxHnVQTrXdqB1rGkE1bT11zTEAc
 6DyoS2rIKnoLoDc7CX1BeUNELByi+Zuzp0H1hWRJKrDHzH6zmUVMhH/KpYxyu2i2BhDPfjxnlMa
 9Q0Vx5vSl0s9gTN4+NVzc1M3vHBo4o8WMkQWv6iXpKNrfYIUgLIcyJo642SRt3QfwsVk0Ubswam
 AE0joFo3v7tGjo/RCgb27SfOf4chGXqLgVQe62XbcuIVRx+i5Y8+54JDPVpgFglVq98kHkwPOk6
 4IdZi+jGkBNuNp9w/i1B3ioICg1fxuJyuskHg4AzM2FBO7i4hJRYW5hfzhEW0CLmZDDvMfd0hli
 /KDwoy1+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp1.imsva1 [10.0.100.73]);
 Sat, 07 Mar 2020 18:35:37 +0100 (CET)
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

Allow to set 'path' or 'suffix' through environment variables,
consistently with 'persistent' and 'credential'.

Signed-off-by: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 2a035394e0..80ec164eab 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -181,7 +181,7 @@ Options and associated environment variables:
 Argument             Env-variable     Description
 -h|--help                             display this usage
 -Q|--path PATH       QEMU_PATH        set path to qemu interpreter(s)
--F|--suffix SUFFIX                    add a suffix to the default interpreter name
+-F|--suffix SUFFIX   QEMU_SUFFIX      add a suffix to the default interpreter name
 -p|--persistent      QEMU_PERSISTENT  (yes) load the interpreter and keep it in memory; all future
                                       uses are cloned from the open file.
 -c|--credential      QEMU_CREDENTIAL  (yes) credential and security tokens are calculated according
@@ -195,6 +195,7 @@ Argument             Env-variable     Description
 
 Defaults:
 QEMU_PATH=$QEMU_PATH
+QEMU_SUFFIX=$QEMU_SUFFIX
 QEMU_PERSISTENT=$QEMU_PERSISTENT
 QEMU_CREDENTIAL=$QEMU_CREDENTIAL
 
@@ -327,13 +328,11 @@ BINFMT_SET=qemu_register_interpreter
 SYSTEMDDIR="/etc/binfmt.d"
 DEBIANDIR="/usr/share/binfmts"
 
-QEMU_PATH=/usr/local/bin
-
+QEMU_PATH="${QEMU_PATH:-/usr/local/bin}"
+QEMU_SUFFIX="${QEMU_SUFFIX:-}"
 QEMU_PERSISTENT="${QEMU_PERSISTENT:-no}"
 QEMU_CREDENTIAL="${QEMU_CREDENTIAL:-no}"
 
-QEMU_SUFFIX=""
-
 options=$(getopt -o ds:Q:S:e:hcp -l debian,systemd:,path:,suffix:,exportdir:,help,credential,persistent -- "$@")
 eval set -- "$options"
 
-- 
2.25.1



