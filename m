Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27BD476949
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 05:56:48 +0100 (CET)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxiox-0005No-TX
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 23:56:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinF-0002Zu-B6
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:01 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:6603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinD-0003qf-LO
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630499; x=1671166499;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4IZx9WjGfYJOYFMc1NhfAQRWWd90/x/xUALrZMkCDMQ=;
 b=iYEgNsw4ZzmmZ1iNK2u2j5j/wTEM+uZLqBV2b/5mZ+gzw8zCqv9AP8NM
 HyIVRYrRNiNoJU8fnoxJMiXlUUjdwEyzdgS60noYW6O26GxvuyB6P06Mt
 LlFJgGq3MjjfpWvMhqf5WkXE46UANsrSbIGsA+tjCY0QyNHMI2vrL9hmw
 uQ1PLjOSMbZ+HZvVdjdYWPs2GP1tfY758dfKV+7TS1THsZCh1jAzWO63B
 Jh9IsTBvjBsBxdnaYWHsmi4n6p73u7UY3ZNqrMrwpU60slt1DEusgrkLE
 hUUiRc/MV/UsjHd3sqXcNvFOI7Bv3SnkG1HgQzWPLGGTjNIkwez7QJx5x g==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="300226945"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:54:55 +0800
IronPort-SDR: 2eVY5WCzxMhgnW0b4P+tNw6CPljIf1yhDTWuWxCTvRneU8tSu8aS9f/Hn+bf5z5XiXAPARhDvH
 xmkiIlpxQs2jYOsmW5/ll0LQ7cpc0ziVgjjzdo0xLK2+iLdEP+dPBaG4z6vb8gMKs9PMbjDuuP
 adtfzarmScV1iWggPDaAGqrICLhnximKDpZdHAOS8lFHlRilTWIG/A9fI1Y2lZh2yqZg+Re7HJ
 amgEaTmiOkxvDRVU4TJsDpVvcgP3yqEEkFNIhZSHSuGXm8sXrNAWb3kpCNx9LNPc1YDFEYc7AK
 7THuOpxbsjl4ulM2xAIymGft
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:29:17 -0800
IronPort-SDR: 4Yc3mBl3F6O0i0IX9KYjN7X+8sUER9B6EOkw/hOI4w3O505O6i3AkZr+nOkJVgplb2TCg7YoO9
 hCVzKklRL8os0hHkVxyBPZIgv7qiUKTdMNV0eS7Zv/XLTiM89D1wYBFP1LB/WHanGS1Z4DcmBx
 mAu+Hc3erxRBPQopdVwxVH6x87H2xEfTjMca/25qiHDZKkjy5wXnhRedEQ9XrLAKHUnjeRGN1/
 oy5Ki3+1fB0fDyaCQnLLnSlGRbPNsABsXza1bo66bDUTURryPc3tk3ghyCkTyJTOaMJCEAjkWo
 92c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:54:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0Cf5V3Pz1Rwvd
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:54:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630494; x=1642222495; bh=4IZx9WjGfYJOYFMc1N
 hfAQRWWd90/x/xUALrZMkCDMQ=; b=mMt7yH/HBgWZX5FJqQGmbpe8oBwPPe4ZN+
 OOCVGcJghyFrWfijXkB9i/vshmn/NI6Tm4/Tgd04svTO+3HlhGlP+Sg0DIm40sga
 cqclispZcceknkI3l8zwFvSNZnlicoXKH50PCBJ+FA1+8R8OqihjpuHgbjCGKNhB
 urL5Ts5c1J9Or2CTH+Ge3njYx1N3+bXEhCi0UrB1ZOvvuTIReDEEi+Zk1asqyZ0R
 h+Q+NxBTO6IWF+UUYv4OipwBX0EJdv2ybG4m7X7AtXT8qT7J19DMqXUy/6RfUllm
 7ShqYviNnBBZTe0YYTfOfiIMFCliAhv6PE7JEKwog/xS7m464J3Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id L3VfeIyg1rnc for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:54:54 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0CY3msGz1RtVG;
 Wed, 15 Dec 2021 20:54:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 3/9] hw/intc: sifive_plic: Cleanup the read function
Date: Thu, 16 Dec 2021 14:54:21 +1000
Message-Id: <20211216045427.757779-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


