Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD24C2FDB3B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 21:57:07 +0100 (CET)
Received: from localhost ([::1]:37494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2KXK-0006VC-Vq
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 15:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVZ-0005CY-E8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:17 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lb.workbox@gmail.com>)
 id 1l2KVX-0006KJ-DY
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 15:55:17 -0500
Received: by mail-wr1-x430.google.com with SMTP id 6so17123053wri.3
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XmeL9mE/IBaH5W/4gblIhnO7rxtfKGhhnwLIsynrDa0=;
 b=uQ+mSht8PqrJ2RF7WGocG0D5pp32zR5XremNdfgvrfqWEJCudWp1Zalw8uJqzwGn0B
 UhUnVHuwJ8umcawh5kUYQb2EsIyuhL+9pqzakHVyMUGP+83DCSw/ZGm2edMZs8cPPD1S
 Xz4se9/jbGXMCRBpbjjZaG0hp2wmozXsF7IH1agsjo9ehtArTT9Bc5ZA/r4/QnSs8YyR
 Om6g89vn8HOvkRWMv0d7Iz69/pOA5Sp8F61ANiTOrj/XRALNEiozSzNKzQKQNgIBgge/
 dBnRTk5DDIc8YKZcMpjZ29R2HEhc2NIFPxs30l8SLEA4TZy1UuqyeUYya46iAlTqvxfz
 3rGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XmeL9mE/IBaH5W/4gblIhnO7rxtfKGhhnwLIsynrDa0=;
 b=T2doSlfrYstVQ7Ah1XmviFjOqfowcA9qKWI6jpTm6WoEGeH6Ldk3QMGQO0PK9zRNAm
 mcKjjppYmL6vM4mzErKHKnC7/N7zSZ/CkugCXBgiOEgTKXXN39Y4Bf0V2/s0AatNpdLV
 G70FLAGPZtmnlQFaTOdtEPB1wRxjtKbQTCDO2qMAe1rZWSW6bMhWOmT1JRVl6umAoeCa
 8xI4OIsrKPddrKFO8jNgB3pMW9RERNTA7/MjTO0H/ThKybIvBBDXfs8/rdzRsFz3LRVf
 hZfyNark3XKcXnEU7RlE/UfGVZeUn4sOoT2iYSZKuBouSQwZePNuBUEr39WH29kG5No3
 SPwg==
X-Gm-Message-State: AOAM533KUCWXDOliZlI0x/49JECQp78Zwu9BJG9IymaGTRbuAqnFUA4u
 zxJ9XnNSRTTCh0y8cuZxnaA=
X-Google-Smtp-Source: ABdhPJzdb9i1ZTM+eYRsVCrLu+iagvAHVODZBr75+7qXIlh9/lRwx3V3ZppJ1+ii2tPkws5xpTNFFg==
X-Received: by 2002:adf:f403:: with SMTP id g3mr5154264wro.212.1611176114076; 
 Wed, 20 Jan 2021 12:55:14 -0800 (PST)
Received: from lb-xps.. ([176.230.215.91])
 by smtp.gmail.com with ESMTPSA id k10sm5614823wrq.38.2021.01.20.12.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 12:55:13 -0800 (PST)
From: Leonid Bloch <lb.workbox@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/4] hw/acpi: Increase the number of possible ACPI interrupts
Date: Wed, 20 Jan 2021 22:54:58 +0200
Message-Id: <20210120205501.33918-2-lb.workbox@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210120205501.33918-1-lb.workbox@gmail.com>
References: <20210120205501.33918-1-lb.workbox@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=lb.workbox@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Leonid Bloch <lb.workbox@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Increase the number of possible ACPI interrupts from 8, to the maximum
available: 64 by default.

Signed-off-by: Leonid Bloch <lb.workbox@gmail.com>
---
 hw/acpi/core.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 7170bff657..71ba7c17b8 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -706,19 +706,32 @@ uint32_t acpi_gpe_ioport_readb(ACPIREGS *ar, uint32_t addr)
 void acpi_send_gpe_event(ACPIREGS *ar, qemu_irq irq,
                          AcpiEventStatusBits status)
 {
-    ar->gpe.sts[0] |= status;
+    int i;
+
+    AcpiEventStatusBits st = status;
+    for (i = 0; i < ar->gpe.len / 2; i++) {
+        ar->gpe.sts[i] |= st;
+        st >>= (sizeof(ar->gpe.sts[0]) * CHAR_BIT);
+    }
+
     acpi_update_sci(ar, irq);
 }
 
 void acpi_update_sci(ACPIREGS *regs, qemu_irq irq)
 {
     int sci_level, pm1a_sts;
+    uint64_t gpe_sci = 0;
+    int i;
 
     pm1a_sts = acpi_pm1_evt_get_sts(regs);
 
+    for (i = 0; i < regs->gpe.len / 2; i++) {
+        gpe_sci |= (regs->gpe.sts[i] & regs->gpe.en[i]);
+    }
+
     sci_level = ((pm1a_sts &
                   regs->pm1.evt.en & ACPI_BITMASK_PM1_COMMON_ENABLED) != 0) ||
-                ((regs->gpe.sts[0] & regs->gpe.en[0]) != 0);
+                (gpe_sci != 0);
 
     qemu_set_irq(irq, sci_level);
 
-- 
2.30.0


