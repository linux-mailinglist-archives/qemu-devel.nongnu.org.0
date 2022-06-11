Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D062C547428
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:16:21 +0200 (CEST)
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzz6K-0007LL-EN
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySu-0005MI-Q9
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:36 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySt-0006gn-5n
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:36 -0400
Received: by mail-wr1-x435.google.com with SMTP id k19so1475464wrd.8
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FyJZ5mYGcMryi5EAJoqWLv4MwrXIaK5gIKWOY0dgxAI=;
 b=jzbGYoJ0PrE4WDVJ6mNdAe6NSy87WAs8z7oP1mbwI+z3420BBmYMeaguWkhyREKleY
 KXSitjy/j69v/duNh3PFEYNlN3ipAkQe2QHPgPX0y82NqNUSxFlqfIY2jOAw4Fm670vK
 dhZdlyPInqN/8MoyWSwp8xEe+KXl2qoGkV+NNIgXAfjWk8lppSAhrE9YxBQfIrxO36VY
 9V8ReqcHLlWeqsfOWSG1wFX6E9czKFtngN5SZA4GZBESAqLziECC2hp69gE+hQjAnNKJ
 gGrqhFpXIrmBtC3kkayajprV0pG5GjwbNbUZBl7AAeYRN10hK7Bk56dNcOrTUZrHkinr
 /zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FyJZ5mYGcMryi5EAJoqWLv4MwrXIaK5gIKWOY0dgxAI=;
 b=ZKmcDvId8LrKa6q/q2xeaHt+DUnEoteAyRkq4hT4V8hGjyi26oa1LFLkXoM6em7iDz
 WwF5U5i52tR3suf76FZQLdRMl32Uz7RkInboILE3T+KL6+WSFba/YpaMTySaHjxeTZRB
 rexj6smjrniUCQi4TMr0GFW6AbEaW06wk4DvnYJAmZlVYVb5u+yoxHenQvSAnO1JwcNr
 7ulIaa+Htzdxcwj7eQfw2aegWcgafinlvqGhDfunDL2y9ZD2pwWHmTvhbkSZLpzZc6nJ
 Ad+qEtDPpj/mWNidm8lg2xaRy/hC0XWgInlesP+jJXk0Wgx2NJaWQZwlyGC/CUyq4JLh
 ZGTQ==
X-Gm-Message-State: AOAM530y3sJ8ir4UqEIE1AV1JfI9I01JvXwUy+2ZTUljIRLhyp2aIdDz
 7MNCiMG94dLkYWcpwfSgSO7VIN6ToOE=
X-Google-Smtp-Source: ABdhPJyTlp8QzGlZAi7K1QV5jaNl0b1ypNMtI7z4Ho47Ot6nIY/DYexAvb4y4wBvmHn2/eHBRpY74g==
X-Received: by 2002:a05:6000:156d:b0:210:3135:ce1c with SMTP id
 13-20020a056000156d00b002103135ce1cmr48545546wrz.409.1654943733733; 
 Sat, 11 Jun 2022 03:35:33 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c4e4500b0039c4ff5e0a7sm1970356wmq.38.2022.06.11.03.35.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 27/49] hw/southbridge/piix: Aggregate all PIIX southbridge type
 names
Date: Sat, 11 Jun 2022 12:32:50 +0200
Message-Id: <20220611103312.67773-28-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
ones, too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220603185045.143789-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c                | 3 ---
 include/hw/isa/isa.h          | 2 --
 include/hw/southbridge/piix.h | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index bfccd666d4..c92b36c4f2 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -36,9 +36,6 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-#define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
-
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 6f9380007d..6c8a8a92cb 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -129,6 +129,4 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
     return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
-#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
-
 #endif
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 976b4da582..3b97186f75 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -64,6 +64,10 @@ typedef struct PIIXState PIIX3State;
 DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
+#define TYPE_PIIX3_DEVICE "PIIX3"
+#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
+#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
+
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
-- 
2.36.1


