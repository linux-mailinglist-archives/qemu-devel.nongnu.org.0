Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3D2DDE61
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:05:14 +0100 (CET)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8t7-0008VE-2C
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pT-0004x8-BF
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:27 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pR-0002G4-45
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271593; x=1639807593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4DqVWHG2CL9Tq/jnAl6ehZQQIm8THsqB0BTRXb01ido=;
 b=gLlcDP6Q2k4SItRCrwLt1BvFbwVSX5APab/Y4Davi2MzHJgB49+1a0uT
 ngUTzW3Y2Z1bsk8d9RrTwpFFAGNfpHhT70bRHUeyP0yrHdUno/SvRCBCd
 maa1/IzOj/6nDYk4ZKzIzzMQhq67/Y6EZFn2VtH7dkxBenzJs1quaqmzp
 XVd91Gg+E+33Y9BRYuCSIoU5En9t+LxdyiqBsT2i88kOLT/6IkE+cmZi1
 /0/XW6bI2HsgzK6FkLIkCe3ibKJgWoZKFikaWJ5YYgW/QM2Af6GNOeSUG
 fS/bYRT7OyhYJE4kGGgNWHf2UD+4SvMZeEPSpscczp0v4J325mQShZmJL g==;
IronPort-SDR: jLV4gbG5z19k9JekO9+QKSvPFdOQn5I1grDPVm4Oq8tZ5Y/m7R/FwoRivIqd0SfleHuCxsp2EJ
 nkJ/6fIDgNONWXxiU0PQ9QY8HDFi+pQEGWoZSJgFfsAylb9/1NZ6gbbrmtLX91nMC8a7kS8PLg
 NlpldfLOtYuM6gPE+M13jFWRWgBDdoMrWrThUytzTLTg42W+p38EmBQGBIkXc1+10GFfdclE2F
 WgpWLBCVU4aiWDdHwHrI9LXHQjDpIr/QqNfdzSLQy67v8bnPv5nGjFJF+AyAw6t2drXVpVzrwZ
 4hc=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237039"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:24 +0800
IronPort-SDR: eQyuyhsvUfxIBtKG0Azh2ch66xm2KIGBvjplRg/5WD/7j/Nq8XWK46lqX6WH9p85kYfJtSCU/m
 oifIR0G3+q+2ZZjr1PzsvlwBikUPvml1gChH9Tryh2I3iEdDvbjTZkWQs7rIFPeGdnJ8S6x0qT
 KKOmfTvHldMu6IU5ngtZlU2zcWpJFrtqrsjCn18a/1Gpft02+WQTd4XQRbu5OPhJuNgs/LiKfq
 WKUUl5QsV3Iy54R9YibCEltbNwKlhlfBH8SOrs4vkrCVsa/kBEZg+8Pw8+KhBQLk0tIer+ajbf
 W990kCYLQBrFDZHS+IRmUcnj
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:34 -0800
IronPort-SDR: PeJox9snU3WXRoLaNovfBzcWmydUi1m/4Ce7gmHsKCNL2+yH1gjDoASbuYX4QXWCjbG0nKCwki
 pk8fQSn/03ZfOgqjsDfIS1mHS1/wLxb8XzOQxUZqc3GfXfxr4bRd1H3+SYMvXDdkkOUYQb9C8I
 mu553vQyefqoKSYGqiQ6dfgSAR0RbYDRWI5LjV/NoW5vQZkY7ZbuQ0l8kxKa3YPXjn6ik70eUJ
 qsxSuukxRapV1/dwqPaUxNH9J2epJtOmJ9pZFdyaGPtifFtb6GJ+qqWYSChFlp740YgYEin1Ej
 Aww=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:18 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 03/23] hw/core/register.c: Don't use '#' flag of printf format
Date: Thu, 17 Dec 2020 22:00:54 -0800
Message-Id: <20201218060114.3591217-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: alistair23@gmail.com, Kai Deng <dengkai1@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Xinhao Zhang <zhangxinhao1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xinhao Zhang <zhangxinhao1@huawei.com>

Fix code style. Don't use '#' flag of printf format ('%#') in
format strings, use '0x' prefix instead

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20201116140148.2850128-1-zhangxinhao1@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/core/register.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 3600ef5bde..d6f8c20816 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -80,7 +80,7 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
 
     if (!ac || !ac->name) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: write to undefined device state "
-                      "(written value: %#" PRIx64 ")\n", prefix, val);
+                      "(written value: 0x%" PRIx64 ")\n", prefix, val);
         return;
     }
 
@@ -89,14 +89,14 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
     test = (old_val ^ val) & ac->rsvd;
     if (test) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: change of value in reserved bit"
-                      "fields: %#" PRIx64 ")\n", prefix, test);
+                      "fields: 0x%" PRIx64 ")\n", prefix, test);
     }
 
     test = val & ac->unimp;
     if (test) {
         qemu_log_mask(LOG_UNIMP,
-                      "%s:%s writing %#" PRIx64 " to unimplemented bits:" \
-                      " %#" PRIx64 "\n",
+                      "%s:%s writing 0x%" PRIx64 " to unimplemented bits:" \
+                      " 0x%" PRIx64 "\n",
                       prefix, reg->access->name, val, ac->unimp);
     }
 
@@ -112,7 +112,7 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
     }
 
     if (debug) {
-        qemu_log("%s:%s: write of value %#" PRIx64 "\n", prefix, ac->name,
+        qemu_log("%s:%s: write of value 0x%" PRIx64 "\n", prefix, ac->name,
                  new_val);
     }
 
@@ -150,7 +150,7 @@ uint64_t register_read(RegisterInfo *reg, uint64_t re, const char* prefix,
     }
 
     if (debug) {
-        qemu_log("%s:%s: read of value %#" PRIx64 "\n", prefix,
+        qemu_log("%s:%s: read of value 0x%" PRIx64 "\n", prefix,
                  ac->name, ret);
     }
 
@@ -193,7 +193,7 @@ void register_write_memory(void *opaque, hwaddr addr,
 
     if (!reg) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: write to unimplemented register " \
-                      "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
+                      "at address: 0x%" PRIx64 "\n", reg_array->prefix, addr);
         return;
     }
 
@@ -222,7 +222,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
 
     if (!reg) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s:  read to unimplemented register " \
-                      "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
+                      "at address: 0x%" PRIx64 "\n", reg_array->prefix, addr);
         return 0;
     }
 
-- 
2.29.2


