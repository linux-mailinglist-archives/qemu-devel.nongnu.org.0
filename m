Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F6C430DF7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 04:46:32 +0200 (CEST)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcIfX-0006pn-L9
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 22:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZn-0005Px-3H
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:40:39 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:27464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIZj-0007D9-Jj
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524830; x=1666060830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kVHw/9dIxuTMXXrLABkqeh+ThPO+0Poe5s1ULi4JFAM=;
 b=qmw7dFRATtqpT1y+VT7BUcRfNEzxvz15uuO7TLAlW0e56mE9P4RZesg/
 wujyCoESDB8lxPKji99pkiQMTzrcl8gdc3lUZSjEFEyRZu3/a/BW0Kmvs
 zmvNth8fwQcKeMfpFt4PE+1a84CjmSvDrt2dqbbJSdbUc45+QQm4WDKcX
 e9Ib5qeGLGcx9ErZsrXyTtewQ31CX0p0tlPzUkj1uoF5pdjEtsAx8KT7R
 Xn6GiTM+RiBC7KT3uIFnjxyO5YHy01hw2SBx6sGq5WouDIID5jKRt6mLh
 fyWy1AvFxC4f/hNdxJ7Si4yyhsJakm3iss8dWdx54/xkWY96xy1ySYirv w==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="187913825"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:40:24 +0800
IronPort-SDR: xHYuLyBUFcEcTxgG6mXK4F2UbaLxj4v9b43ac3Ba+YJo59Ixb1CTFvD/y4pPIyKVBj7YrqmknK
 twladf0piel4rHBnR41UTzDvRtMDXKvrK/7V9jXFvMOQdSKDvo9y24Xe+IUUiBi+exTIXHxGJx
 jFsjMtYUYA8TbdjXS4+bs7A5+bwxfPLPdejvHX3uxHWO8JegFzOCqNDyJGSEehxIwHSlqyJH/H
 SlDWHfB806OQwbj+/ffe5dCDlbrWRU8T8b8iMILr2a45E7Oiyyw5oBHmviBVEQzKDzd6rX2BMn
 c0gfvF9AMgYr8jr+GRR9wUdU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:16:05 -0700
IronPort-SDR: Q73hBae5SzncyGS+FD+bLDrppp/MyeYLpMyxVW5GNqwdleuFfHXdCeO3tdEjxyXemHdMLq6qP1
 kXrUEOWp8GOuifUFOlP7c7SV+l2cL/RsquVwjbMpvV/nggPtN9smG7reIzsZvxkRKgLTtXtSXa
 5nkLn/PKReW3QQDtbcBd4OmubeZv5QeFHke4YY862uw2tSwQD7jcmO/1Z1WtIUwnXBp56G5cQJ
 txajUWoOsRd+hs0Zs8lLXOwJkx+JL1OmN//ZfSatykllqFU7YYcpqrTIXjnDhk6hwxKi+R7tGT
 DPE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:40:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh1h50Lnz1RvmD
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 19:40:24 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524824; x=1637116825; bh=kVHw/9dIxuTMXXrLAB
 kqeh+ThPO+0Poe5s1ULi4JFAM=; b=pUaWNnNgivxKROkFJfioTkwsELfW4PnoCa
 pW/PxNGso/Ulc1IXraLCaphTrUMqrZH2Zqm417z2p5V8hSHfHvK7Uwlgv656vI3a
 /ejKR0IO7ywN2ythnW6BsNacY+/zmhrqolW7BpdlswSvsSE52y3tuQMQ63H4Ia3S
 IlWR44MZOPQmGf6aIQf2RzEzcPB+wWi11AjkEoifOtLj1HoXjw+JjD/B3y0ytbd4
 5aEnZB7QZSz1/yEoFDd2hpnRtHwCNY5s5JZahrW47Bh4nN2Ds2tEySvviBd+Fv7b
 MgAQylg8mcEB7uVK4TnragGRRwzsu3cxxnN+eDYmxPga89jhlwgg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Lt1TcyHTWRah for <qemu-devel@nongnu.org>;
 Sun, 17 Oct 2021 19:40:24 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh1b2sL3z1RvTm;
 Sun, 17 Oct 2021 19:40:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 7/9] hw/intc: sifive_plic: Cleanup the write function
Date: Mon, 18 Oct 2021 12:40:12 +1000
Message-Id: <3daa501cf8ea5c10a887474ab9f899124ad779e1.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 82 +++++++++++++++++--------------------------
 1 file changed, 33 insertions(+), 49 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 5444368ad4..49e566a76f 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -33,6 +33,17 @@
=20
 #define RISCV_DEBUG_PLIC 0
=20
+static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
+{
+    uint32_t end =3D base + num;
+
+    if (addr >=3D base && addr < end) {
+        return true;
+    }
+
+    return false;
+}
+
 static PLICMode char_to_mode(char c)
 {
     switch (c) {
@@ -269,80 +280,53 @@ static void sifive_plic_write(void *opaque, hwaddr =
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


