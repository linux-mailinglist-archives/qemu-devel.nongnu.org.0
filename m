Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ADA4CFBC6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:47:58 +0100 (CET)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAuD-0004zo-D6
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:47:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAME-0004AF-OP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:50 -0500
Received: from [2a00:1450:4864:20::335] (port=51794
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAMD-0004Lj-9P
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:50 -0500
Received: by mail-wm1-x335.google.com with SMTP id q20so6508046wmq.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BGq1NvCPKkPo6oZnX28wU6tvhaY2hUXR54Kp2JjpCz4=;
 b=KzpWKRDPFVk40D/sFzK8l19ejmaDhHs5OcYvbQK0R8CW5EG441rAJIB124ZIToh6n1
 QWvOvUJB97gYcd9sOoPJbkwDCwSEnWPrmYIds/0MF/08V9w6CmJgLBzR7QMnJt0/9Zn8
 NS1k7vGw5Yznpnz5LcIJMnOB6kT8JZHx6ivAbBMAKib+siUW9AOdJqxC12D/l2n7/HmQ
 ExZ5dn+ibMS6GWGKdf8JiFYp8vaMX016h4sMF3y06c24+mAJ2rFJUz169mcvS3V+1QVt
 crgIuzBk0j2Xfok+zlsjIpV+lKMAXEF3yhGVA7AUab3UUpuvuwumOc9ePaqEMjHVJ2XS
 tSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BGq1NvCPKkPo6oZnX28wU6tvhaY2hUXR54Kp2JjpCz4=;
 b=Mn9OFqIIi0MQSPV8xCdwOccQJ0A5DJ6jXbPA56mO00mb1EeOy1NhPWFGCAd5Xlnhz5
 d+LKq8mrpe+Ci1Xqc1rK5ph7P+nQ9y4vrUW/TwVISbNnw2ua15NX3PER+VOz3Tsevzow
 maN8E54BPEyyAhtykSHj5cBJ4XbaR0feNtt3gRNfxKIV2LLW2AEb5iD93FWj8zJDvt0Q
 g12uINuqdif2TSqVGLt7MsRUvMidW3ruljdbvfMkgoKD5UK+cYJSb5R3CgfiOlrw09xD
 MyeAITBwoqzXzW849wBS7MoCeJjGm71Vjbn+r0pFJb5tMkm1wEF8RswX8E0Kjw0Bl9hc
 ppzQ==
X-Gm-Message-State: AOAM532ffPd40lioUbzVIHvZQXIdXUqP9qNRNdwqUTI3tVtxlm94CiYX
 qT9XetoSYmH/hkYPc25jx4qEINeGOHs=
X-Google-Smtp-Source: ABdhPJzBiNLyw+tjvj7zRyNSbxh3m24uUUkGAGgYZYTHeQsJ73GVQkpMg3LkAjhaxADjBTiA6yJ7eA==
X-Received: by 2002:a7b:c30e:0:b0:37f:a63d:3d1f with SMTP id
 k14-20020a7bc30e000000b0037fa63d3d1fmr8380488wmj.178.1646647967635; 
 Mon, 07 Mar 2022 02:12:47 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003899d50f01csm5022185wms.6.2022.03.07.02.12.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] hw/isa/piix4: Replace some magic IRQ constants
Date: Mon,  7 Mar 2022 11:11:59 +0100
Message-Id: <20220307101207.90369-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

This is a follow-up on patch "malta: Move PCI interrupt handling from
gt64xxx_pci to piix4". gt64xxx_pci used magic constants, and probably
didn't want to use piix4-specific constants. Now that the interrupt
handing resides in piix4, its constants can be used.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220217101924.15347-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 2e9b5ccada..f876c71750 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -61,10 +61,10 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
     pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < 16) {
+    if (pic_irq < ISA_NUM_IRQS) {
         /* The pic level is the logical OR of all the PCI irqs mapped to it. */
         pic_level = 0;
-        for (i = 0; i < 4; i++) {
+        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
             if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
@@ -315,7 +315,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 
     return dev;
 }
-- 
2.34.1


