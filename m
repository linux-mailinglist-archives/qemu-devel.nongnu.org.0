Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D896032B7CB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:28:31 +0100 (CET)
Received: from localhost ([::1]:52312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQcA-0005aq-Sq
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQam-0003Ge-S6; Wed, 03 Mar 2021 07:27:05 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:37813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHQal-0000dv-0Z; Wed, 03 Mar 2021 07:27:04 -0500
Received: by mail-qk1-x72f.google.com with SMTP id s7so13582135qkg.4;
 Wed, 03 Mar 2021 04:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iDDeXYKwCfnvDPzgZ+8nfC2qiZUqg8nqKT+edgb162k=;
 b=e6uZuwcG1xWUpNkXyr86qfBtpANKFcZanNwEWnE3JEWfdq1CC3nhMfyKEIPmaNduuZ
 ojUJnh77h+rbuK3uC3+r78hrZ8YGN+60vg4MqGOIeTkY1iVwG5b4ImcWvVLCPPWoYBgh
 B5zbFUSP4iG5avTWro3IlLpIkWfAYKFxN1Y16uHLZ6wsdmuXkR4odFh2DBpqm6HK43Vp
 X09RSY6PP8X17wV+TP1vylXbg0oBpd648f87lX/p+9iwXHosqheSHpCL9xX6R4qgMmLX
 a3nlqp71j2cV1IDyuYYuV8HFi7Xy+9JCqzv956SsTIazG06G7rz8vd38Vt0w2/dxZdhK
 5BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iDDeXYKwCfnvDPzgZ+8nfC2qiZUqg8nqKT+edgb162k=;
 b=ONVHNFZPLuzo7uzIa+xkiMJNsMyMGUjoxUSrYRIDlnwgohyL3zPuPP52urohpgcH2e
 gu+qMFLpeotRmw/UZ2tOLQ/UJWwYB7rg0ihwrdp7rb15vUeGX1VOkzhrV694kn639iUW
 Id0wfrIYkV8zY8508KCNWu+QOrrjwQ3PldiPmxoODm5TmbvmAoOiJQE518ToSgWyDWlL
 iCB8RJmdIDk9O56m3y4Z9wHe+uBOmqZcED2FxsD930nYx7p7aaiAo3cCcnL4CRLbWgEL
 +PCSP/TLp64ByhxZ3ue/4aBnnsSS9Z0l6dL0gpF+B2cfIPZgDboVbB2f3DnTK6Twvb20
 5TBA==
X-Gm-Message-State: AOAM530zdY/F2DTcPD7/OLxpwwrHE8nVol50AKWzbT37cnTohR57lTpV
 V/CXDOfQHmduZICvUKLiE6E=
X-Google-Smtp-Source: ABdhPJyLsspi9ziqbtQM7d9cZ23zeTcNuBON00kCmL0w+ECcurt+WDb6XG2LMIRrmQZ8/gRzypf/0Q==
X-Received: by 2002:ae9:e418:: with SMTP id q24mr23941754qkc.409.1614774421415; 
 Wed, 03 Mar 2021 04:27:01 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x14sm15433458qtq.47.2021.03.03.04.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:27:01 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [RESEND PATCH v3 2/5] hw/sd: sdhci: Don't write to SDHC_SYSAD
 register when transfer is in progress
Date: Wed,  3 Mar 2021 20:26:36 +0800
Message-Id: <20210303122639.20004-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303122639.20004-1-bmeng.cn@gmail.com>
References: <20210303122639.20004-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per "SD Host Controller Standard Specification Version 7.00"
chapter 2.2.1 SDMA System Address Register:

This register can be accessed only if no transaction is executing
(i.e., after a transaction has stopped).

With this fix, the following reproducer:

outl 0xcf8 0x80001010
outl 0xcfc 0xfbefff00
outl 0xcf8 0x80001001
outl 0xcfc 0x06000000
write 0xfbefff2c 0x1 0x05
write 0xfbefff0f 0x1 0x37
write 0xfbefff0a 0x1 0x01
write 0xfbefff0f 0x1 0x29
write 0xfbefff0f 0x1 0x02
write 0xfbefff0f 0x1 0x03
write 0xfbefff04 0x1 0x01
write 0xfbefff05 0x1 0x01
write 0xfbefff07 0x1 0x02
write 0xfbefff0c 0x1 0x33
write 0xfbefff0e 0x1 0x20
write 0xfbefff0f 0x1 0x00
write 0xfbefff2a 0x1 0x01
write 0xfbefff0c 0x1 0x00
write 0xfbefff03 0x1 0x00
write 0xfbefff05 0x1 0x00
write 0xfbefff2a 0x1 0x02
write 0xfbefff0c 0x1 0x32
write 0xfbefff01 0x1 0x01
write 0xfbefff02 0x1 0x01
write 0xfbefff03 0x1 0x01

cannot be reproduced with the following QEMU command line:

$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
       -nodefaults -device sdhci-pci,sd-spec-version=3 \
       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
       -device sd-card,drive=mydrive -qtest stdio

Cc: qemu-stable@nongnu.org
Fixes: CVE-2020-17380
Fixes: CVE-2020-25085
Fixes: CVE-2021-3409
Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
Reported-by: Muhammad Ramdhan
Reported-by: Sergej Schumilo (Ruhr-University Bochum)
Reported-by: Simon Wrner (Ruhr-University Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Alexander Bulekov <alxndr@bu.edu>

---

Changes in v3:
- Embed the reproducer in the commit message

 hw/sd/sdhci.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f72d76c178..3feb6c3a1f 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1121,15 +1121,17 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 
     switch (offset & ~0x3) {
     case SDHC_SYSAD:
-        s->sdmasysad = (s->sdmasysad & mask) | value;
-        MASKED_WRITE(s->sdmasysad, mask, value);
-        /* Writing to last byte of sdmasysad might trigger transfer */
-        if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->blkcnt &&
-                s->blksize && SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
-            if (s->trnmod & SDHC_TRNS_MULTI) {
-                sdhci_sdma_transfer_multi_blocks(s);
-            } else {
-                sdhci_sdma_transfer_single_block(s);
+        if (!TRANSFERRING_DATA(s->prnsts)) {
+            s->sdmasysad = (s->sdmasysad & mask) | value;
+            MASKED_WRITE(s->sdmasysad, mask, value);
+            /* Writing to last byte of sdmasysad might trigger transfer */
+            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
+                SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
+                if (s->trnmod & SDHC_TRNS_MULTI) {
+                    sdhci_sdma_transfer_multi_blocks(s);
+                } else {
+                    sdhci_sdma_transfer_single_block(s);
+                }
             }
         }
         break;
-- 
2.25.1


