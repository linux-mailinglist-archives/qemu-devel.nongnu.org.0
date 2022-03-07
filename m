Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FAE4CFC83
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:19:45 +0100 (CET)
Received: from localhost ([::1]:52984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBOx-0001lb-To
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALz-0003G7-Ri
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:36 -0500
Received: from [2a00:1450:4864:20::42b] (port=44582
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRALy-0004KG-Ft
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:35 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u1so22333320wrg.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDE9Vz75Ls7oUn4Wdl9zyEDREjfA3a6GoIfStHrEoHA=;
 b=BCzxjWnoRyYZCmlbcLnt2V7hyCrwlPDicDdR2mPrda/zUq+6/js9UgQGLJ5CzfsqOF
 EdB3uzbZMPqRpg70Kuws0MJKotV5i9FbYzZFIobkbXNcwcorGhGT5GfcTF8A5Z0epnEu
 WeVXt+F7sC0fIZyXdICncZarGv3EC9SzkHy67t3FQ+BAfb/A7vOj6ZlOdk50WIjFXBim
 w9DJgREc4+Ov6ZCuel/LoBBoNWAz2rnPRZfNBVVjdlFhQr7DoTiLlLTM7TOmDs4kmxzL
 IbHB4sdgEM/AZJu40jNeBhc/2a+9jjKZtmi6IZdlUXtHnZgv0YFSHXDFnTR7+OqveLot
 DqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDE9Vz75Ls7oUn4Wdl9zyEDREjfA3a6GoIfStHrEoHA=;
 b=jNWbVRsPnps5rQSTOk264syCu3uvQ8MBCm+GOdy0zuE6Tnp6dlzl7fIdT9PGWt/Am1
 wEcqO60VafM6KTBFKrjofyo6zCCJDF2ErgStVLEadA9kIzt8ouwmAAnCHc7+0alghHQl
 zXd4DGQibTwY/KT+9EgnOq9XJa0uvFRap81ECh3YWxk2OtLBqkocZr+tgzruarr+SmaG
 XH9Qw1a7N7qnJIkYf+GD+oJKFtFJlg4sI5+pjeykx0AA4/JkSkznD3NhO+cEVGLdB+dp
 5dwl9W3v3fpouJ8yuezIvavoCI5Wu/p8XtYVYVk8pmGyEx7Da9kvJDJakg2vqwe0LcSj
 zfkg==
X-Gm-Message-State: AOAM533GrwicP72Yi8NNnqP+VXtUZYpQ/Pydcb7Hy5jIM2isb4pO3KDf
 r/rtL1w6tM8AIqho4uqQlEFnQJlP/RY=
X-Google-Smtp-Source: ABdhPJzJr6QkT1v6pZdzGOnHxQBWH/f9DnK3fWGCHRksg0qJ2sUPlUhKVm8gAlmSu84Oxv/TmKVGKw==
X-Received: by 2002:a05:6000:18c3:b0:1e5:82d3:e4e2 with SMTP id
 w3-20020a05600018c300b001e582d3e4e2mr7558451wrq.575.1646647953027; 
 Mon, 07 Mar 2022 02:12:33 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b00382871cf734sm18454092wma.25.2022.03.07.02.12.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/16] hw/isa/piix4: Resolve redundant i8259[] attribute
Date: Mon,  7 Mar 2022 11:11:56 +0100
Message-Id: <20220307101207.90369-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
gt64xxx_pci to piix4" where i8259[] was moved from MaltaState to
PIIX4State to make the code movement more obvious. However, i8259[]
seems redundant to *isa, so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220217101924.15347-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 196b56e69c..179968b18e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -45,7 +45,6 @@ struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
-    qemu_irq i8259[ISA_NUM_IRQS];
 
     RTCState rtc;
     /* Reset Control Register */
@@ -320,11 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
-
-    for (int i = 0; i < ISA_NUM_IRQS; i++) {
-        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
-    }
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
 
     return dev;
 }
-- 
2.34.1


