Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630517E835
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 20:22:05 +0100 (CET)
Received: from localhost ([::1]:48420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBNyW-0001dK-Lf
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 15:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49512)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jBNwV-0006cm-Em
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <unai.martinezcorral@ehu.eus>) id 1jBNwT-00080l-83
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:19:59 -0400
Received: from smtp.lg.ehu.es ([158.227.0.66]:40114 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1jBNwS-00080H-SY
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:19:57 -0400
Received: from imsva2.lgp.ehu.es (imsva2.lgp.ehu.es [10.0.3.246])
 by postfix.smtp2.imsva2 (Postfix) with ESMTPS id 8B7A55F6F;
 Mon,  9 Mar 2020 20:19:54 +0100 (CET)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58D8C5A04F;
 Mon,  9 Mar 2020 20:19:54 +0100 (CET)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DC165A045;
 Mon,  9 Mar 2020 20:19:54 +0100 (CET)
Received: from smtp.ehu.eus (unknown [10.0.100.76])
 by imsva2.lgp.ehu.es (Postfix) with ESMTPS;
 Mon,  9 Mar 2020 20:19:54 +0100 (CET)
Received: from 669c1c222ef4 (static.187.0.0.81.ibercom.com [81.0.0.187])
 by smtp2 (Postfix) with ESMTPSA id 0CC3E5F6F;
 Mon,  9 Mar 2020 20:19:54 +0100 (CET)
Date: Mon, 9 Mar 2020 19:19:52 +0000
From: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 03/10] qemu-binfmt-conf.sh: make opts -p and -c boolean
Message-ID: <20200309191952.GC65@669c1c222ef4>
References: <20200309191200.GA60@669c1c222ef4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309191200.GA60@669c1c222ef4>
X-Greylist: ACL 191 matched, not delayed by milter-greylist-4.6.2 (smtp2
 [10.0.100.76]); Mon, 09 Mar 2020 20:19:54 +0100 (CET)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.5.0.1020-25280.002
X-TM-AS-Result: No--0.283-7.0-31-10
X-imss-scan-details: No--0.283-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.5.1020-25280.002
X-TMASE-Result: 10--0.282600-10.000000
X-TMASE-MatchedRID: 5MYN72agt7osSx1KHZomlKS9pC14MC3C6qG5M9QNAO1CannV/b7f2cEI
 kNzFiDxLvdz+hjQlBqVqAxBaFFZ85HTKrg3nLjv1A9lly13c/gGOz/LLJUcaHoXfDl+KHKjY2NR
 c0Z/xVW0vrwXOPzQMJ1WGfFaWlqBcrSKKfw/QqNWK2+RZ4/fWST8ZO44VTPmzabJxhiIFjJnUA8
 lgylnZvvJAhJwgr+u9bOUsBbIsdlNDq2SVEk72KAtuKBGekqUpnH7sbImOEBTvbOtfMFISHEyhV
 JJbcQD9rGssu6wFGXlfwkikVgb9JUKEnWIqoXRFRprNGNVrK9X+pmStTY4u3qozBIzI0vGSNm++
 YGJlAxNKU2XuQZXDAUznMHeShSu0p/GSAIsG8Of0jt4HSLaYh18I4oUq5Vga
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp2.imsva2 [10.0.100.76]);
 Mon, 09 Mar 2020 20:19:54 +0100 (CET)
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

This patch breaks backward compatibility.

Both '--persistent' and '--credential' default to 'no'. Hence, '-p no'
or '-c no' are redundant. Overall, accepting an argument might be
misleading because options are, indeed, boolean. This patch makes both
options boolean in getopt, so if any of them is provided the corresponding
variable is set to true.

Signed-off-by: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu-binfmt-conf.sh | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index 98401f4e7c..285ce528d1 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -172,8 +172,8 @@ qemu_get_family() {
 usage() {
     cat <<EOF
 Usage: qemu-binfmt-conf.sh [--qemu-path PATH][--debian][--systemd CPU]
-                           [--help][--credential yes|no][--exportdir PATH]
-                           [--persistent yes|no][--qemu-suffix SUFFIX]
+                           [--help][--credential][--exportdir PATH]
+                           [--persistent][--qemu-suffix SUFFIX]
 
        Configure binfmt_misc to use qemu interpreter
 
@@ -188,9 +188,9 @@ Usage: qemu-binfmt-conf.sh [--qemu-path PATH][--debian][--systemd CPU]
                       file for all known cpus
        --exportdir:   define where to write configuration files
                       (default: $SYSTEMDDIR or $DEBIANDIR)
-       --credential:  if yes, credential and security tokens are
+       --credential:  if present, credential and security tokens are
                       calculated according to the binary to interpret
-       --persistent:  if yes, the interpreter is loaded when binfmt is
+       --persistent:  if present, the interpreter is loaded when binfmt is
                       configured and remains in memory. All future uses
                       are cloned from the open file.
 
@@ -328,7 +328,7 @@ CREDENTIAL=no
 PERSISTENT=no
 QEMU_SUFFIX=""
 
-options=$(getopt -o ds:Q:S:e:hc:p: -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential:,persistent: -- "$@")
+options=$(getopt -o ds:Q:S:e:hcp -l debian,systemd:,qemu-path:,qemu-suffix:,exportdir:,help,credential,persistent -- "$@")
 eval set -- "$options"
 
 while true; do
@@ -377,12 +377,10 @@ while true; do
         exit 1
         ;;
     -c|--credential)
-        shift
-        CREDENTIAL="$1"
+        CREDENTIAL="yes"
         ;;
     -p|--persistent)
-        shift
-        PERSISTENT="$1"
+        PERSISTENT="yes"
         ;;
     *)
         break
-- 
2.25.1



