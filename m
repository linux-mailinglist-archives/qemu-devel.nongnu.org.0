Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE501BF150
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 09:26:48 +0200 (CEST)
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU3ap-0001Vi-AV
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 03:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3XX-0004ay-Nv
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 03:23:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jU3W7-0006YI-Ff
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 03:23:23 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jU3W6-0006Wb-OX; Thu, 30 Apr 2020 03:21:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1275953|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0499706-0.00109699-0.948932; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03299; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.HQfovas_1588231302; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HQfovas_1588231302) by smtp.aliyun-inc.com(10.147.40.7);
 Thu, 30 Apr 2020 15:21:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: peter.maydell@linaro.org
Subject: [RFC PATCH 6/8] riscv: Add configure script
Date: Thu, 30 Apr 2020 15:21:37 +0800
Message-Id: <20200430072139.4602-7-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 03:21:44
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: qemu-riscv@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com, palmer@dabbelt.com,
 alistair23@gmail.com, alex.bennee@linaro.org,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For RV64 risu, make CFLAGS="-march=rv64g"

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index ca2d7db..5c9e967 100755
--- a/configure
+++ b/configure
@@ -58,6 +58,8 @@ guess_arch() {
         ARCH="m68k"
     elif check_define __powerpc64__ ; then
         ARCH="ppc64"
+    elif check_define __riscv ; then
+        ARCH="riscv64"
     else
         echo "This cpu is not supported by risu. Try -h. " >&2
         exit 1
@@ -139,7 +141,7 @@ Some influential environment variables:
                prefixed with the given string.
 
   ARCH         force target architecture instead of trying to detect it.
-               Valid values=[arm|aarch64|ppc64|ppc64le|m68k]
+               Valid values=[arm|aarch64|ppc64|ppc64le|m68k|riscv64]
 
   CC           C compiler command
   CFLAGS       C compiler flags
-- 
2.23.0


