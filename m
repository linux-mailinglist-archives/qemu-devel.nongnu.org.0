Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59550981B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:02:23 +0200 (CEST)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQpa-00017e-M0
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSM-0005py-P1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:22 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSL-0007xw-0K
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523100; x=1682059100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8mhuYUPW9ubp8b714MlCocfN5p7aZHrweYlFCZCpOpg=;
 b=m1Su9TmQAxA4U6mvJPhYoEV9LXgCwHbNYXdX3V2LekBQU7sAdEU5LFsC
 Ii1Uds+XDOh00BqRsDHYnLhedYK1DqVGPKOViimwZVR/SYT7UxZpD8jAu
 syEzjWZapXajLedvcfpNS3hkAwJDCacwhFqJSZ0gsjf8npIyqdKttd05U
 SqVhFEaYWPqteGz8MywVc+11m+SDDKRO42FQk1XhfjcQDEfU167xxzdl6
 wyw2BxW/wXavOa5BXIm8V4WRaOJ3TyfxVVkr4R/Z8zFmExANBsiXvk3qa
 qNwgvqEnRw2Mchw/580HggIqpE+G40/Bir4LHk3q08W28J3M2h4heK7Jb g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640014"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:53 +0800
IronPort-SDR: 2D1o6X2H35pvOo1PdH59ahoGnlaQ+kJSGNIOxFFsphM/qaS3DEauwUyYg1t6KXZbKE5VXt4S1M
 5tWGQTIPdfdlxGbxvIKVlhV1ToZP9pnqq1w4genmrQ5scqGgOTnM4lHCAiL2OIbfTbMT3nOzzY
 rcD6uzzExv2Gvg0tcwUErQjp4v6xeiLvTS3g+ziWT8TnSGbpHdk19i8jUEctRwMV6rsQ8qqRaw
 eRIjsXecHSCRxjur9V0wuEpsUzDJfXzOJWy+V52WKejarqIoQpAL6dpVfc+cQvunc3FP5PLCAw
 pHHGE5dyr+Wfe44MUs7P0Uu/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:56 -0700
IronPort-SDR: 3Dw0GP03DHppayA5sDBpIP1VELH7LkDO9pF9r33OUylKt5FwwOdNtUjymjdRzhzgbCwlncVQvk
 FvaV0Q+y6K8kJBbquutojLo+3yr4KXwG+JcsJIlEB9xZ+jlEfRPG/pmplKWMgx75uKac3LBEuW
 tleIaJVwO6Hf28WmR3S+mYl7dNs4i7mm/1nqaNHyGS0/p/3hcb0ikAgQopgIptl4tSEoMSKvYc
 CzPHpVb1ZxnDDYj9YpukQPfUOce45WvKTxQuIFBl2dFS4c4Ypyr2QeiCIjRkL4eowfK4tkVSFQ
 6YE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXK3XM9z1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523073; x=1653115074; bh=8mhuYUPW9ubp8b714M
 lCocfN5p7aZHrweYlFCZCpOpg=; b=G9TIwq1u4JSY/VtTU6PXtHsb1hvoMjg/eK
 8PJ1eiQBq7FdqA1/5XTpljZ/pHcWV3xtbehNyVjQD7C4jDkmZLGfgtsyOyzZ+bC0
 kiIiEX1QurSYM2+ZjsVECZZizYf/L9QZXB216QftTOFr4lfP9hhoIwvt7yaOU+cE
 F+iibBHKJU3zPBOXA9YsaZi4wTfQz8avju9lVfqHZ4o41Ahf/kTvcyjt3ty3gOes
 1WFofFhwyxYLT2bJMTaRrWpSRUVjUuGKvXIZkZdO1DOISZa4eN340pLjpijCYpe6
 OmIXEKXrYjbGFdEoU+f1bXq5Kt5S9SwPXnjn2mq44v9/87fY4QwA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IKIKpvaamRF0 for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:53 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXG69t4z1Rvlx;
 Wed, 20 Apr 2022 23:37:50 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PULL 22/31] hw/intc: Support 32/64-bit mtimecmp and mtime accesses
 in RISC-V ACLINT
Date: Thu, 21 Apr 2022 16:36:21 +1000
Message-Id: <20220421063630.1033608-23-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

RISC-V privilege spec defines that:

* In RV32, memory-mapped writes to mtimecmp modify only one 32-bit part
  of the register.
* For RV64, naturally aligned 64-bit memory accesses to the mtime and
  mtimecmp registers are additionally supported and are atomic.

It's possible to perform both 32/64-bit read/write accesses to both
mtimecmp and mtime registers.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Message-Id: <20220420080901.14655-3-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c | 42 +++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index 37e9ace801..ff082090fe 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -126,9 +126,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque=
, hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) =3D=3D 0) {
-            /* timecmp_lo */
+            /* timecmp_lo for RV32/RV64 or timecmp for RV64 */
             uint64_t timecmp =3D env->timecmp;
-            return timecmp & 0xFFFFFFFF;
+            return (size =3D=3D 4) ? (timecmp & 0xFFFFFFFF) : timecmp;
         } else if ((addr & 0x7) =3D=3D 4) {
             /* timecmp_hi */
             uint64_t timecmp =3D env->timecmp;
@@ -139,8 +139,9 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque=
, hwaddr addr,
             return 0;
         }
     } else if (addr =3D=3D mtimer->time_base) {
-        /* time_lo */
-        return cpu_riscv_read_rtc(mtimer->timebase_freq) & 0xFFFFFFFF;
+        /* time_lo for RV32/RV64 or timecmp for RV64 */
+        uint64_t rtc =3D cpu_riscv_read_rtc(mtimer->timebase_freq);
+        return (size =3D=3D 4) ? (rtc & 0xFFFFFFFF) : rtc;
     } else if (addr =3D=3D mtimer->time_base + 4) {
         /* time_hi */
         return (cpu_riscv_read_rtc(mtimer->timebase_freq) >> 32) & 0xFFF=
FFFFF;
@@ -167,18 +168,29 @@ static void riscv_aclint_mtimer_write(void *opaque,=
 hwaddr addr,
             qemu_log_mask(LOG_GUEST_ERROR,
                           "aclint-mtimer: invalid hartid: %zu", hartid);
         } else if ((addr & 0x7) =3D=3D 0) {
-            /* timecmp_lo */
-            uint64_t timecmp_hi =3D env->timecmp >> 32;
-            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), ha=
rtid,
-                timecmp_hi << 32 | (value & 0xFFFFFFFF),
-                mtimer->timebase_freq);
-            return;
+            if (size =3D=3D 4) {
+                /* timecmp_lo for RV32/RV64 */
+                uint64_t timecmp_hi =3D env->timecmp >> 32;
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu)=
, hartid,
+                    timecmp_hi << 32 | (value & 0xFFFFFFFF),
+                    mtimer->timebase_freq);
+            } else {
+                /* timecmp for RV64 */
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu)=
, hartid,
+                                                  value, mtimer->timebas=
e_freq);
+            }
         } else if ((addr & 0x7) =3D=3D 4) {
-            /* timecmp_hi */
-            uint64_t timecmp_lo =3D env->timecmp;
-            riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu), ha=
rtid,
-                value << 32 | (timecmp_lo & 0xFFFFFFFF),
-                mtimer->timebase_freq);
+            if (size =3D=3D 4) {
+                /* timecmp_hi for RV32/RV64 */
+                uint64_t timecmp_lo =3D env->timecmp;
+                riscv_aclint_mtimer_write_timecmp(mtimer, RISCV_CPU(cpu)=
, hartid,
+                    value << 32 | (timecmp_lo & 0xFFFFFFFF),
+                    mtimer->timebase_freq);
+            } else {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "aclint-mtimer: invalid timecmp_hi write: =
%08x",
+                              (uint32_t)addr);
+            }
         } else {
             qemu_log_mask(LOG_UNIMP,
                           "aclint-mtimer: invalid timecmp write: %08x",
--=20
2.35.1


