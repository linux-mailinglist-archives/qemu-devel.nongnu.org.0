Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DECC485B73
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:14:30 +0100 (CET)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EY9-0001TN-6e
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:14:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQu-0007iG-I0
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:07:00 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQs-0007tB-M9
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420418; x=1672956418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P58rSH9FYVGMWJye9pB0DBdQcbydJZIVFxFrCQLsVdI=;
 b=LpHKC5uiHgbNOI+3l/qGu1XonuS/7CiiC8zeAWGCBVaueWb/MZKB+188
 vJxVs7HbJw58pJggCwwX643JS5BHckw4BP3LEXgKYQ6A1eQ/H6VhmM0XI
 rDwnu3Nu7rY9Y4jpPBr3TgUI6Yg1kKlfWfOVCRgD15tSTj1jt/W7HlOXp
 XaiAzQYVaFE0s4NDbjYc0JjDMjJEXxMnTFrZ3V6+0+4tC2a/Vy4dDwb+P
 lWjvtpB90oHsBEO81wux+LshF519M3Hg8ndldLScOsJ6qaWH9DBW5F/8j
 zqEY83X7o8LpPKtJLakOq43iljKjfQKOmRaGKXf6dWxKBl5V17rAIw1Wb w==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="188746549"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:40:01 +0800
IronPort-SDR: 7aG/xxt2oPVqzZjIxoVzi73LmKmUx4azRoRPQHfHnZpJwrq4hvUcmsl4miKuxsblHkEkRRqTRb
 MvC3Blv0eSBhH6D2Yt74xUbF3PVqfBhj8pSA1+2wlOXEpp41PLIuNYnA9aJZCgmjwECKabXhbx
 r9z3rSMwr2CTEiWd7Y/9CPqy352G8l6jgKT0UDYWXtvZp6X/A/Sc2RIKuR9R0aHBy0aCNkVXiX
 b89DS0A+6VVeX4d91+/xRsMYE1vGHQ6fMd0mjYHoJfE+OsD1zn3D02pyV+VxVqSV+PlviREvdU
 VtgdxC1iHq3Tn/6cVYHb81vv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:13:53 -0800
IronPort-SDR: jUR4Ga/AgjsQ4L4AvN6Hg/EjVE9fPfWkJmmXo3DaAHpDsfX4IKmIEpVmefIGLxwGxYD1Bt4fHR
 u+Yqppv0mxdXLpMJZpqFEpCh8XUuUg6c0YqHMnoiPo9DGUzciheFoWLZbxEfBmS237vxs2/ft5
 h5Mj38aeG08za7ZpR2xGxUw7FPmgXosGQ2CuF1hHDoylFhXg7GBDh11iS8c63Kdx3snZ+1SgOr
 PoIV3hSbAi5psxQQjaN4nIS7dqR6Atmcjh5PT5cgFChN6XO8x72PLPb1hD54d14CXUp0N/atRo
 4ig=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:40:02 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZ94gdMz1VSkj
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 13:40:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641418801; x=1644010802; bh=P58rSH9FYVGMWJye9p
 B0DBdQcbydJZIVFxFrCQLsVdI=; b=Bgv3OpX//RDY4cNlR+JaJBPCbSmgoM0Jfu
 9nPEmM3slX346JlukV0cvF5b8Y5BXOcP17pHUikOkYsFpTn/88VuiAglmvr88mTV
 /sKXSuIJ7nSkIek2AdnHHAulUtmcGbCT54UWbGQHmD6inQ+7nRuHBNAfTrewI8Av
 2Dvh/UMEKV4iq49UD87p1INeM6WDF6DTCdN1jGga+cDVcxn+uSKwW8zh6xT0i8el
 o5O44b65zx/cQLYjs6MW+RD/o8LpjyfJV0rGVgxueF6c8OJm4j3Yi+Udw4hODgAc
 lP2rMRxZaG0Yg0FdIwind8vjanihEjcVeURUDPCtYqWW8h0SB3Aw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id R-TOkPxz6Xb2 for <qemu-devel@nongnu.org>;
 Wed,  5 Jan 2022 13:40:01 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjZ42xHqz1VSkV;
 Wed,  5 Jan 2022 13:39:55 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v4 2/8] hw/intc: sifive_plic: Cleanup the write function
Date: Thu,  6 Jan 2022 07:39:31 +1000
Message-Id: <20220105213937.1113508-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/sifive_plic.c | 76 +++++++++++++++----------------------------
 1 file changed, 27 insertions(+), 49 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index a9f7a1bfb0..698492ce77 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -33,6 +33,11 @@
=20
 #define RISCV_DEBUG_PLIC 0
=20
+static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
+{
+    return addr >=3D base && addr - base < num;
+}
+
 static PLICMode char_to_mode(char c)
 {
     switch (c) {
@@ -269,80 +274,53 @@ static void sifive_plic_write(void *opaque, hwaddr =
addr, uint64_t value,
 {
     SiFivePLICState *plic =3D opaque;
=20
-    /* writes must be 4 byte words */
-    if ((addr & 0x3) !=3D 0) {
-        goto err;
-    }
-
-    if (addr >=3D plic->priority_base && /* 4 bytes per source */
-        addr < plic->priority_base + (plic->num_sources << 2))
-    {
+    if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
         uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
+
         plic->source_priority[irq] =3D value & 7;
-        if (RISCV_DEBUG_PLIC) {
-            qemu_log("plic: write priority: irq=3D%d priority=3D%d\n",
-                irq, plic->source_priority[irq]);
-        }
         sifive_plic_update(plic);
-        return;
-    } else if (addr >=3D plic->pending_base && /* 1 bit per source */
-               addr < plic->pending_base + (plic->num_sources >> 3))
-    {
+    } else if (addr_between(addr, plic->pending_base,
+                            plic->num_sources >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid pending write: 0x%" HWADDR_PRIx "",
                       __func__, addr);
-        return;
-    } else if (addr >=3D plic->enable_base && /* 1 bit per source */
-        addr < plic->enable_base + plic->num_addrs * plic->enable_stride=
)
-    {
+    } else if (addr_between(addr, plic->enable_base,
+                            plic->num_addrs * plic->enable_stride)) {
         uint32_t addrid =3D (addr - plic->enable_base) / plic->enable_st=
ride;
         uint32_t wordid =3D (addr & (plic->enable_stride - 1)) >> 2;
+
         if (wordid < plic->bitfield_words) {
             plic->enable[addrid * plic->bitfield_words + wordid] =3D val=
ue;
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: write enable: hart%d-%c word=3D%d value=3D=
%x\n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode), wordid=
,
-                    plic->enable[addrid * plic->bitfield_words + wordid]=
);
-            }
-            return;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Invalid enable write 0x%" HWADDR_PRIx "\n=
",
+                          __func__, addr);
         }
-    } else if (addr >=3D plic->context_base && /* 4 bytes per reg */
-        addr < plic->context_base + plic->num_addrs * plic->context_stri=
de)
-    {
+    } else if (addr_between(addr, plic->context_base,
+                            plic->num_addrs * plic->context_stride)) {
         uint32_t addrid =3D (addr - plic->context_base) / plic->context_=
stride;
         uint32_t contextid =3D (addr & (plic->context_stride - 1));
+
         if (contextid =3D=3D 0) {
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: write priority: hart%d-%c priority=3D%x\=
n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode),
-                    plic->target_priority[addrid]);
-            }
             if (value <=3D plic->num_priorities) {
                 plic->target_priority[addrid] =3D value;
                 sifive_plic_update(plic);
             }
-            return;
         } else if (contextid =3D=3D 4) {
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: write claim: hart%d-%c irq=3D%x\n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode),
-                    (uint32_t)value);
-            }
             if (value < plic->num_sources) {
                 sifive_plic_set_claimed(plic, value, false);
                 sifive_plic_update(plic);
             }
-            return;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Invalid context write 0x%" HWADDR_PRIx "\=
n",
+                          __func__, addr);
         }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
     }
-
-err:
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "%s: Invalid register write 0x%" HWADDR_PRIx "\n",
-                  __func__, addr);
 }
=20
 static const MemoryRegionOps sifive_plic_ops =3D {
--=20
2.31.1


