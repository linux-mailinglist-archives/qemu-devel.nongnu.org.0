Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A5850AD0D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:07:14 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhlR-00028Z-1A
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJq-0007wu-SI
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:42 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJh-0005W4-Vk
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587913; x=1682123913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8mhuYUPW9ubp8b714MlCocfN5p7aZHrweYlFCZCpOpg=;
 b=XxZCYhP/e2k4wSvpMvgQOF8TP07WZlmwxQhNLCVQvlj1N1hMXHgi2Nz9
 PtPtY23pWLGwfh3wibJppa2tDL46bILD2OtxpS936XQnAJRY/jTD4aej/
 nRuzJM2FhkDRMMMEeeQ5mBOH5eSDjlWpbof8MRQyoXQQrs9QHbxPBUWC+
 8SGG6DVChjyaBzl52707IPOMAaoZZQUJDwv7bm6GIeuvPvfJXeg09KWq3
 N/OZO5Wjm3r9Ze2RXg9tGj1dkzAS6I+l8K2MzM85UbEvkeKFAM+i89IIy
 B9P82je6FxBwmnF8hZank5qExJ7OMxa7GfRJvO8Gzw7QA0hyzYQkSLUGF Q==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483429"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:24 +0800
IronPort-SDR: q5qTbeQwNcvDV5EJLKiHNMEoXy+mUdzTOyIsiYk6Al9VOVEksXJE5CKpb4ZtYcCaQO4F4PtSkZ
 JrUPdNT1Szpz3BHSPdIFyr7DVneIJTqrKns82/bYsY3PMGYtVcAJJMn96L4e8gNaV7EDpeTE4o
 r6pvGeBP97hMkbTR5L795SfWV1Pw0Qi+D8K4G6yUbdFq0/0mWOHwZeDSfD3QO38CXP0NN6I12O
 pso0zHiMr30P1oM0LOqCsRSVUE45woVqqzdKmF5UHxYYbF56vuOqsdTHwYfrmNP5rGxMHQvJx3
 hWehZSYFGCEo47PO71appbnt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:40 -0700
IronPort-SDR: oZvF8w5nf72Gkn6b5Na1OsraQ0X8mchsA9+Q9nqWUeidtEC/OyXyKZaKLoLG9brOWgzhPm+pWJ
 6Z8ISXrlfUtrmHCdEh5UgXv2bSesM5rnQw/HUeNDIV70BiTRcCfgY31gc2VRqv5UPvS+yjiU6k
 IGjDrgo1XdadfFvqGbEQd3YTXK9hiqKNS3NfJqLv51X65FF2xEJlPesBbYVxPKE/Y0tiLDfA1e
 7R7Y5R96FNvwyJyffHY+UbmDDWUV6BTZWY98AJigJYF06x2cxS7Z8KI+rhjXk6AbMPgvlaQSTx
 xEo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwW35hLwz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587903; x=1653179904; bh=8mhuYUPW9ubp8b714M
 lCocfN5p7aZHrweYlFCZCpOpg=; b=jAIEnapQGHOLxMZLu3Jo2swR9ux87Yarwg
 rQDaN2QHDI7b+iFIzWMxiAGe8bNZdzhv99kIji1aqHx5DRyDhFbW471fye21bfXW
 IOSYQ4HAWFJ00wgK2Tp5MDhgDnbgutfySh27DdLexJWJMk4JI+8gfI5cBEs7C/di
 +qLgUui1jR+LjytP+mdXqenmwecjRpPXRMs6mtLT1NFFCY7zhcEsoQlIBY5zpP5+
 4q6LZmSM1KosotBdjb+AkwPOpFpWJ5cN95gvciZXcAt3m8R3OnR2Pz3zES8iRATj
 vNO9YUlhBAWY5zggZ9j1DBEbOJV6XQ/OOCkz1JMlggzaSicgztMw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pIy1eQCHQQO2 for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwW10mh3z1Rvlx;
 Thu, 21 Apr 2022 17:38:20 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PULL v2 22/31] hw/intc: Support 32/64-bit mtimecmp and mtime
 accesses in RISC-V ACLINT
Date: Fri, 22 Apr 2022 10:36:47 +1000
Message-Id: <20220422003656.1648121-23-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


