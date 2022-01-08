Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB6B4881D4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:19:16 +0100 (CET)
Received: from localhost ([::1]:32986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n654N-0000Rb-JV
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:19:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64da-0007t6-IO
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:44 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:24134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dY-0006jE-KJ
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621092; x=1673157092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ubWksNnkykcWudwapXGt29r+wkIJt4Rjz+cpzoM8670=;
 b=ChFGhXRtZI6t9Ps0nFy3F7kBVwCyHAhwtLYz6fIhJgsRsprwtDbe9EAu
 fkVHLs+xTnwnEeFcre5W2eqg7eP91vlLkVUOeT+wK7Uat8TQcYOfvCdyq
 MU5eSAzCJ5idY5a9m6cm2aIpWJduQGvTqNyr617fTfM1HAu5JsQHUlgir
 BCohhQ8i64+PBtsawWpoGx6eazETJgNa0Umv5lTuUAKGjTrl4rs3IK5O0
 /TLkrUNrlq5wuu43Xpr9hnAARCgSFzdW3qRpqlDzKzy/ls8CFGc9zrDgZ
 WrVg8gBrSyCMjwupFindaZFVhkKdFWJG4dvjFSg/1oCak0GckQbwuimuI A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027341"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:31 +0800
IronPort-SDR: 8p/fjjzzwLXqR4eNH6d8xRvutLbbAQr4gRv6wRfizjl7+aynUAHwtlkj+UFiXzjIJ37t+cNxPE
 a87EgxVnkv5e+dH16YcRR3QhkcZT/o947uEKKEFnLMKNlwokU9P89rC5awpvInpxbRm5wKCWaT
 HH9rN13d+x2A4Hnl+UogkUC+/egrpf9km8zDSOkpOzmugZnDjMKg+7uE8/geOdw/4BNYeWLv/A
 6AxLu35K2EnrVNbb7OvHasta/CGLUjoJEhYM3iknSVTFKcBizhuE4iz7+g4/O6vEfPNJM27q2g
 cTJqZFXhQZ5TFyipDecpzFbY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:20 -0800
IronPort-SDR: w6SjN9r7nqkIwdqV3MseTSLli5iA24n8YEA/hgWh+RFfXl9+VO6ahPoDZNSPcbtMPKAFuTxYnU
 QA3pHkJaLsACzQ89/QQbMBYUr5DItfIOHZNhBECFSpQ1CdAkg92B0CmQQkFjbMg/J68K2C1VId
 5VF7kD81vYRsr0GzkJ2aJbltdorP2xtRDt1Apcs5ZHVGT7pGGRzfQ2ljduawTJh3qHP12rwD8D
 SxkF6yaS2dXphnKvmUshJQTtLtA3JvjkJFelrMbhM75eTSnA8CfWtBAevB/+6Z9wuHZt4w90HY
 pvo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8NM508nz1VSkc
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:31 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621091; x=1644213092; bh=ubWksNnkykcWudwapX
 Gt29r+wkIJt4Rjz+cpzoM8670=; b=uqQVTa2Xz5hfTGq6nwr0h1j3ZMG6CF/QvL
 zQPhPwhFg3anrKP7HimyHGw/rIIqE38L8YFFe0vMvE/l6jZbWVFmDXn2fo1egnwg
 9uhlHA1zpymljkqwK5860ha4Gs0jyFvg7en4J17z/t3TtlK2NanvmK5nzG+x7Ozy
 uVVjM/qsJdYgmeRCgJ/8Oywtzz1EiGU3rqrOX4XAE/xTrFSLm9SUBwlA/OmOw20p
 zSqVLOkVlYVCpT+TpnsZ23mFwCYzKitlYz4B4ejl7V9flOyOaMIsIKJJK7U4leI6
 BMtfXlUqoNtQZKYVc7+EENMIQrw4B3PR4rp5GooErcAKQTqIOJxw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Qkrpq2FXm1MY for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:31 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8NJ48tZz1VSkV;
 Fri,  7 Jan 2022 21:51:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 06/37] hw/intc: sifive_plic: Cleanup the read function
Date: Sat,  8 Jan 2022 15:50:17 +1000
Message-Id: <20220108055048.3512645-7-alistair.francis@opensource.wdc.com>
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
Message-Id: <20220105213937.1113508-4-alistair.francis@opensource.wdc.com=
>
---
 hw/intc/sifive_plic.c | 55 +++++++++----------------------------------
 1 file changed, 11 insertions(+), 44 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 698492ce77..44d24b3c59 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -199,70 +199,37 @@ static uint64_t sifive_plic_read(void *opaque, hwad=
dr addr, unsigned size)
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
-        if (RISCV_DEBUG_PLIC) {
-            qemu_log("plic: read priority: irq=3D%d priority=3D%d\n",
-                irq, plic->source_priority[irq]);
-        }
+
         return plic->source_priority[irq];
-    } else if (addr >=3D plic->pending_base && /* 1 bit per source */
-               addr < plic->pending_base + (plic->num_sources >> 3))
-    {
+    } else if (addr_between(addr, plic->pending_base, plic->num_sources =
>> 3)) {
         uint32_t word =3D (addr - plic->pending_base) >> 2;
-        if (RISCV_DEBUG_PLIC) {
-            qemu_log("plic: read pending: word=3D%d value=3D%d\n",
-                word, plic->pending[word]);
-        }
+
         return plic->pending[word];
-    } else if (addr >=3D plic->enable_base && /* 1 bit per source */
-             addr < plic->enable_base + plic->num_addrs * plic->enable_s=
tride)
-    {
+    } else if (addr_between(addr, plic->enable_base,
+                            plic->num_addrs * plic->enable_stride)) {
         uint32_t addrid =3D (addr - plic->enable_base) / plic->enable_st=
ride;
         uint32_t wordid =3D (addr & (plic->enable_stride - 1)) >> 2;
+
         if (wordid < plic->bitfield_words) {
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: read enable: hart%d-%c word=3D%d value=3D=
%x\n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode), wordid=
,
-                    plic->enable[addrid * plic->bitfield_words + wordid]=
);
-            }
             return plic->enable[addrid * plic->bitfield_words + wordid];
         }
-    } else if (addr >=3D plic->context_base && /* 1 bit per source */
-             addr < plic->context_base + plic->num_addrs * plic->context=
_stride)
-    {
+    } else if (addr_between(addr, plic->context_base,
+                            plic->num_addrs * plic->context_stride)) {
         uint32_t addrid =3D (addr - plic->context_base) / plic->context_=
stride;
         uint32_t contextid =3D (addr & (plic->context_stride - 1));
+
         if (contextid =3D=3D 0) {
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: read priority: hart%d-%c priority=3D%x\n=
",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode),
-                    plic->target_priority[addrid]);
-            }
             return plic->target_priority[addrid];
         } else if (contextid =3D=3D 4) {
             uint32_t value =3D sifive_plic_claim(plic, addrid);
-            if (RISCV_DEBUG_PLIC) {
-                qemu_log("plic: read claim: hart%d-%c irq=3D%x\n",
-                    plic->addr_config[addrid].hartid,
-                    mode_to_char(plic->addr_config[addrid].mode),
-                    value);
-            }
+
             sifive_plic_update(plic);
             return value;
         }
     }
=20
-err:
     qemu_log_mask(LOG_GUEST_ERROR,
                   "%s: Invalid register read 0x%" HWADDR_PRIx "\n",
                   __func__, addr);
--=20
2.31.1


