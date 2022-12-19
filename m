Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12105650C43
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Fhz-0000u0-5B; Mon, 19 Dec 2022 07:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sl-gYwgKChcF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com>)
 id 1p7Fhw-0000tb-SM
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:57:28 -0500
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sl-gYwgKChcF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com>)
 id 1p7Fhv-0005z5-4q
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:57:28 -0500
Received: by mail-wm1-x349.google.com with SMTP id
 125-20020a1c0283000000b003d1d8d7f266so5115814wmc.7
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yTpaUx1+vDyWi6zSx2mxz5JAauTiU5OQgCyk8kTsRLM=;
 b=jMOEPIrwqPdA/yjJUJbD4wg0iA1S+bdNeUwEu2tq1tvRwe/SP3EkC9+1IXXDQSlq9e
 yFplkkkc2nxTR5z/TIFvAM5XKjnSL9+kxtwPn1KLWmTw2w0vWuMvIrXpB1p9edDLeveE
 wdhMROYvDkwPXHrSi+pD/EQyhqvWS/1u6khRGf1j/eGpuOYB2zXJBGGQjIhf4Wv7pVrP
 sspSC6FUXM6C1C3K5crXHPcP+V03LEVxLAcpIIg7NY6btDT3VhuuVyI5T1rH6Kl/Oigc
 SaQ7x+fN33FxXwIazCcbGw2I+sfPOhNQBqOI4dIAo8BkMN/sZDxycdTABC+pKzfhiTn6
 FCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yTpaUx1+vDyWi6zSx2mxz5JAauTiU5OQgCyk8kTsRLM=;
 b=i+v+rgAAQcG8m2b2DPb4ElIERMIxkp/X/AYXTR9qh0l5iV9oqRLXJCfarcBBRalZmW
 ndipj+d/ExS6E3cCiasOf9B44wewiRbM7ZqJrnMo3RAp8H7mJCcZ83KU9Ddgj7OyLG3m
 rIislEp3LAlWWYAkhy8e3XWiTG1zxJJJTrDYx2kBngal29WTh99ewxKh/dMGPAB0Tolv
 k+l0LhS3eZe8nXfo0izY4OWqTuCt5b5VfEc2MsPXm6RjH8QzP3xRTJqamlQPPkb9DZWM
 nhbRwLz00K5IakCk1tQd81GcTtpOGpR3W1WhUJRzfoup3VG5Jo5FqYCxj8SX9LzU80ZL
 SLOA==
X-Gm-Message-State: AFqh2kp1JCfJz4lgZWuakvU1ggvE8yiviLNYc9HI1wNviOTf9Ysv/dTg
 oKm2BpKVHdoeASwwjLBHBl2IOeh2pcDUx8NOT3VfsSYefmxfs25vrnHY7fXqtjcqMALRD5GyEhJ
 GV80KZgjy9VxrDE3pp7mne+2HZM367u7q4dZ6er6/Gy592S8/Jx8jDT8wzjJvhr8D3w==
X-Google-Smtp-Source: AMrXdXtEIOTZ7Q0IimWnJof8wGjU0s2wBh70zR4zqHoCBPNjaGTYafiSSLVdEydkiLAOfsAmCunPlsaeMXXQ3g==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:5567:b0:3d0:6b97:7968 with SMTP
 id ja7-20020a05600c556700b003d06b977968mr658356wmb.25.1671454642495; Mon, 19
 Dec 2022 04:57:22 -0800 (PST)
Date: Mon, 19 Dec 2022 12:57:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221219125720.1369027-1-smostafa@google.com>
Subject: [PATCH] hw/arm/smmuv3: Add GBPA register
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3sl-gYwgKChcF9BFGx2x3BB381.zB9D19H-01I18ABA3AH.BE3@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

GBPA register can be used to globally abort all
transactions.

Only UPDATE and ABORT bits are considered in this patch.

It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
be zero(Do not abort incoming transactions).

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h |  4 ++++
 hw/arm/smmuv3.c          | 14 ++++++++++++++
 include/hw/arm/smmuv3.h  |  1 +
 3 files changed, 19 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index bce161870f..71f70141e8 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -79,6 +79,10 @@ REG32(CR0ACK,              0x24)
 REG32(CR1,                 0x28)
 REG32(CR2,                 0x2c)
 REG32(STATUSR,             0x40)
+REG32(GBPA,                0x44)
+    FIELD(GBPA, ABORT,        20, 1)
+    FIELD(GBPA, UPDATE,       31, 1)
+
 REG32(IRQ_CTRL,            0x50)
     FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
     FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 955b89c8d5..2843bc3da9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -285,6 +285,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->gerror = 0;
     s->gerrorn = 0;
     s->statusr = 0;
+    s->gbpa = 0;
 }
 
 static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
@@ -663,6 +664,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto epilogue;
     }
 
+    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
+        status = SMMU_TRANS_ABORT;
+        goto epilogue;
+    }
+
     cfg = smmuv3_get_config(sdev, &event);
     if (!cfg) {
         status = SMMU_TRANS_ERROR;
@@ -1170,6 +1176,10 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
     case A_GERROR_IRQ_CFG2:
         s->gerror_irq_cfg2 = data;
         return MEMTX_OK;
+    case A_GBPA:
+        /* Ignore update bit as write is synchronous. */
+        s->gbpa = data & ~R_GBPA_UPDATE_MASK;
+        return MEMTX_OK;
     case A_STRTAB_BASE: /* 64b */
         s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
         return MEMTX_OK;
@@ -1318,6 +1328,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
     case A_STATUSR:
         *data = s->statusr;
         return MEMTX_OK;
+    case A_GBPA:
+        *data = s->gbpa;
+        return MEMTX_OK;
     case A_IRQ_CTRL:
     case A_IRQ_CTRL_ACK:
         *data = s->irq_ctrl;
@@ -1495,6 +1508,7 @@ static const VMStateDescription vmstate_smmuv3 = {
         VMSTATE_UINT32_ARRAY(cr, SMMUv3State, 3),
         VMSTATE_UINT32(cr0ack, SMMUv3State),
         VMSTATE_UINT32(statusr, SMMUv3State),
+        VMSTATE_UINT32(gbpa, SMMUv3State),
         VMSTATE_UINT32(irq_ctrl, SMMUv3State),
         VMSTATE_UINT32(gerror, SMMUv3State),
         VMSTATE_UINT32(gerrorn, SMMUv3State),
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index f1921fdf9e..9899fa1860 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -46,6 +46,7 @@ struct SMMUv3State {
     uint32_t cr[3];
     uint32_t cr0ack;
     uint32_t statusr;
+    uint32_t gbpa;
     uint32_t irq_ctrl;
     uint32_t gerror;
     uint32_t gerrorn;
-- 
2.39.0.314.g84b9a713c41-goog


