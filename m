Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16624881BA
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 06:56:59 +0100 (CET)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64io-0002LW-W8
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 00:56:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dY-0007t5-QU
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:42 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:31881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dX-0006jf-5D
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621091; x=1673157091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FGjFkOv1MIycstDiIWZK1kZpuwoYuaAATk4jTFfjkEc=;
 b=d1d5UMwU6GxwjCHixt5XEuG6wmSPg7wVo/X9E/v1fq6xRxHinT29/BjA
 J52CzFjKX5aO2Havu0pOkcpDZ9TS9xV7q9KXP7JWTPvRpmvR9Tc/P4Fd6
 Vp/wDwmD/nfMP1XqZnXHcl/6uf64RPTiDFZp2gHI0CWWdSd1AUMqUYnCk
 4LKZ4sxS2DcOMcYuez/qECjm86svhZ61iPKAHnvaEmAcYqPe9KSQZgVOb
 5z6piG1ahVRjDQ8bLDNG2CGV7lOliGJ1squ/jcEIy5O6Y/jU8HPoEtxkc
 fBF+3OPOhCNFv5YWQ5fAU90RDVay8ywmohg67YQ26htuYOjPqdTU7obaF g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027339"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:28 +0800
IronPort-SDR: TSeQpjtGc4YdXA2F8fOSYxU02nY3FHSd7w0RtM5tmzzaNefRyalPrBEIPI+7KE7L6QFcaSPBBS
 qmdanZyHMkPktl1BbiOWeYQ5Q5itB6z2vTm0FF+Q7DuaSj6QlZaNhKAx0q97WSAg+8YStu6pXE
 h6hcs2rcuydBVR1KIV7oaY8/6Gbqxm9xXN05XXA1WNylcLWYvaYtZLoQdQjy6EY4oumHylbfXZ
 +XTzICNEUo9aoIWjQ642z6oy/4etwatYWYu7WNlJuH2q+5dB+d5yhSA3JXObne6j077+3rPCz0
 mki7BBSHvLcbYsFwVj3+PDZP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:16 -0800
IronPort-SDR: qn09ySpSDi5nujnyf/bTsPi7eLhVxPjvwxNWPIyjmvoqHv0KuBugpgmd7h4f4XGiyos/vtlV7U
 8XdR+ee+tfmAOoW5M0DH3Am8PmwnjoXbAr9cpEjMZgk0HfZEu19D9s0JCh6fi7qKI+Iigx/g/4
 NYopjpY1HB7HY69CG/lpoupMTI2+mFv74bSqqfQ2JkCjIcpSWS0D5vuF6osGd/lpcrKuktgwBP
 3QKBRk4dDNvge/hMhQkrrWiFS+DkbQgRfAC5cvae5DJPLSf11C2XTeTTaxGy7/DF2BXwJvfGyv
 FhU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8NJ19NLz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621087; x=1644213088; bh=FGjFkOv1MIycstDiIW
 ZK1kZpuwoYuaAATk4jTFfjkEc=; b=LcxRAJonaEx3O3gAR6qORB/c9L1BiHj1SY
 WBHB2uEUFYJ+IgWZkjVKkLvHUcESCi4dRtbYdjdVTbJe7Ym0+08yNWAW3fjMXtEz
 H2NKWGAahnwH6OTNXYECcDkGr1k6oSGcpsbEExpViu4TB1+zf+MlX1xLA9dXFKA2
 IDT9yKG94NkYDhOQiw8CUZ196TtebMvhawAChGewsm0Wk4zCTpRm/ys3APOYX/wJ
 EFdttvcHrSg5yajpXni5LXygJ2SrcLvSacr/eW/LIAmA0kSpuGhrBWpUxNJ+TFEv
 XUfG3G9YoHinBsRdE9hrV+r2dmWzn9TcOWRDJ40euWDKaNZiFw2Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id r3-atoz0J6Hn for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:27 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8NF0F5qz1VSkV;
 Fri,  7 Jan 2022 21:51:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 05/37] hw/intc: sifive_plic: Cleanup the write function
Date: Sat,  8 Jan 2022 15:50:16 +1000
Message-Id: <20220108055048.3512645-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Message-Id: <20220105213937.1113508-3-alistair.francis@opensource.wdc.com=
>
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


