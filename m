Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7617CF9B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Mar 2020 19:39:12 +0100 (CET)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jAeLu-0003Tr-Ts
	for lists+qemu-devel@lfdr.de; Sat, 07 Mar 2020 13:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAeL0-00034B-8L
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 13:38:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jAeKx-0006ER-N3
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 13:38:12 -0500
Received: from smtp.lg.ehu.es ([158.227.0.66]:13235 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jAeKx-0006DS-BN
 for qemu-devel@nongnu.org; Sat, 07 Mar 2020 13:38:11 -0500
Received: from imsva1.lgp.ehu.es (imsva1.lgp.ehu.es [10.0.3.245])
 by postfix.smtp1.imsva1 (Postfix) with ESMTPS id 75A322D904;
 Sat,  7 Mar 2020 19:38:09 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32782110050;
 Sat,  7 Mar 2020 19:38:09 +0100 (CET)
Received: from imsva1.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2589A11004D;
 Sat,  7 Mar 2020 19:38:09 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.73])
 by imsva1.lgp.ehu.es (Postfix) with ESMTPS;
 Sat,  7 Mar 2020 19:38:09 +0100 (CET)
Received: from afee69d503a7 (unknown [81.0.0.187])
 by smtp1 (Postfix) with ESMTPSA id D1BD736F95;
 Sat,  7 Mar 2020 19:38:08 +0100 (CET)
Date: Sat, 7 Mar 2020 18:38:03 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 1/9] qemu-binfmt-conf.sh: enforce safe style consistency
Message-ID: <20200307183803.GA29@afee69d503a7>
References: <20200307170251.GA7@dd5f6ec33fb0>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200307170251.GA7@dd5f6ec33fb0>
X-Greylist: ACL 184 matched, not delayed by milter-greylist-4.6.2 (smtp1
 [10.0.100.73]); Sat, 07 Mar 2020 19:38:09 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25276.002
X-TM-AS-Result: No-0.108-7.0-31-10
X-imss-scan-details: No-0.108-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25276.002
X-TMASE-Result: 10-0.108400-10.000000
X-TMASE-MatchedRID: AvuQOGDihJo8mRT0SYY6frBZAi3nrnzbopGQY5bbP3KQsRqSXMRkV//v
 RwcN6CxcWk3vlkEkcgdqAxBaFFZ85HTKrg3nLjv1A9lly13c/gEEa8g1x8eqFzL/GHoao0dVgm7
 WCykPm9Q9E3MQ72s42pG96/hbJzFNSulibHZJx6EvLP1C8DIeOuuLFZZYlisfQ6tklRJO9ij9bM
 g3kSk56LG0WsdjH6wrKrauXd3MZDX371moSn0VOMz/CtjUqsbyxz9rP9TWxuBvW+kI3v1nLJi+R
 f9itKUQlDqYxZzV3eDCaeyUt/P3/ctZSdlP7Xii9SPW45P4yzatXkfeF49j3hKGdgr8x4f4BBSv
 +oarUQsKtuXWKSlXVpNHmClQkxEB+rL5VW+ofZc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp1.imsva1 [10.0.100.73]);
 Sat, 07 Mar 2020 19:38:09 +0100 (CET)
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

Spaces are added before '; then', for consistency.

All the tests are prefixed with 'x', in order to avoid risky comparisons
(i.e. a user deliberately trying to provoke a syntax error).

Signed-off-by: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 9f1580a91c..672ce716b6 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -223,12 +223,12 @@ qemu_check_access() {
 
 qemu_check_bintfmt_misc() {
     # load the binfmt_misc module
-    if [ ! -d /proc/sys/fs/binfmt_misc ]; then
+    if [ ! -d /proc/sys/fs/binfmt_misc ] ; then
       if ! /sbin/modprobe binfmt_misc ; then
           exit 1
       fi
     fi
-    if [ ! -f /proc/sys/fs/binfmt_misc/register ]; then
+    if [ ! -f /proc/sys/fs/binfmt_misc/register ] ; then
       if ! mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc ; then
           exit 1
       fi
@@ -259,10 +259,10 @@ qemu_check_systemd() {
 
 qemu_generate_register() {
     flags=""
-    if [ "$CREDENTIAL" = "yes" ] ; then
+    if [ "x$CREDENTIAL" = "xyes" ] ; then
         flags="OC"
     fi
-    if [ "$PERSISTENT" = "yes" ] ; then
+    if [ "x$PERSISTENT" = "xyes" ] ; then
         flags="${flags}F"
     fi
 
@@ -300,18 +300,18 @@ qemu_set_binfmts() {
         mask=$(eval echo \$${cpu}_mask)
         family=$(eval echo \$${cpu}_family)
 
-        if [ "$magic" = "" ] || [ "$mask" = "" ] || [ "$family" = "" ] ; then
+        if [ "x$magic" = "x" ] || [ "x$mask" = "x" ] || [ "x$family" = "x" ] ; then
             echo "INTERNAL ERROR: unknown cpu $cpu" 1>&2
             continue
         fi
 
         qemu="$QEMU_PATH/qemu-$cpu"
-        if [ "$cpu" = "i486" ] ; then
+        if [ "x$cpu" = "xi486" ] ; then
             qemu="$QEMU_PATH/qemu-i386"
         fi
 
         qemu="$qemu$QEMU_SUFFIX"
-        if [ "$host_family" != "$family" ] ; then
+        if [ "x$host_family" != "x$family" ] ; then
             $BINFMT_SET
         fi
     done
-- 
2.25.1



