Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3336A4458
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:27:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe7v-00046K-W2; Mon, 27 Feb 2023 09:05:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7i-0003rs-CT
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7g-0007zX-Md
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r7so6346206wrz.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eh1VSyfv5tGj+acgtwNpwwVd0uyV2g7zvk5mN67oJa8=;
 b=O1rI/ckDnoWNTcZQM/zmyzCMFJZXn0yxabEsXttZa34A3WVveiEuzc4w4ug4EwW6ZX
 pztjpVOlJIQE61RzDp2eILJD52ZQ+NtMZE1/vQ0VXm/FQQpUeMJdk+eLC3qy7WVUEQUh
 Xq9MjAVy5p8fuN3VPhgBnlqWf0elRGLlA2Jq+AWNz4ig/s5dKmUGBm7X6gX68sz/bmkn
 gxsC/m3Kq9OUhng1eqwvEss8AC7YjgajyuHhZTSs+6MBxKdzUkGXVXM1McM+MzY4fJ0p
 M7l8OWzm4JsfkeZGg+f6uE/Gm26JktNeZmLYeMTEnjHZbnpKbse2V+grQrqpCJ3l4hig
 tjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eh1VSyfv5tGj+acgtwNpwwVd0uyV2g7zvk5mN67oJa8=;
 b=ZerSM0d1JDEberCRiohdU78EeIK64ksLnObs4rTqlGnZNItg3FnFOs85V9RfNJCQmS
 P0YI2NnwbgrPcW8YJzMOXyoDutDrpcdx2b+9c1AE3pwZia04auuHUz9gIp8u/McnRlAc
 Xuo8uTnmdq4bgE6O3G/ZBUJjn5AxfhYZhn18tfhNX3fra2Geix5uR7Gb5r5oTZUYm7ZB
 LUTOpgT3FIvcdpyq47EAuCedTtV+m88NsfXWxnPBPzLf/sZphoeurTQwyzO7AEZQmdHv
 uToR2X7/ESmU/YSCC38MrYFhwdn/Xs4gcNcZHEWJa4jGIAoK2wM22TQ/oJn59JyOBySR
 NgLw==
X-Gm-Message-State: AO0yUKUqJk3ogk44ZmiETDAQ4DfOZ3KijeYrkdZpNzJB3w09/xJ5p9fX
 ChLQuthEung+XRGzOSkPDer7aDoxWffYRNkB
X-Google-Smtp-Source: AK7set9XvNK9NhgxC/d9HVfnvWg5n4ZgS2tGKd/cKuQGlWSCJmWfoG4BJnpQdKtHDkupxNAYuGQAng==
X-Received: by 2002:a05:6000:10d0:b0:2cb:59ca:8671 with SMTP id
 b16-20020a05600010d000b002cb59ca8671mr2648718wrx.24.1677506699695; 
 Mon, 27 Feb 2023 06:04:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a5d4565000000b002c3f81c51b6sm7130135wrc.90.2023.02.27.06.04.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 040/126] hw/i386/ich9: Rename Q35_MASK to ICH9_MASK
Date: Mon, 27 Feb 2023 15:00:47 +0100
Message-Id: <20230227140213.35084-31-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

The Q35_MASK macro is already defined by TYPE_Q35_HOST_DEVICE, so let
TYPE_ICH9_LPC_DEVICE have its own one to prevent potential name clash.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-2-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/ich9.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 222781e8b9..36e0ccd16a 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -75,7 +75,7 @@ struct ICH9LPCState {
     qemu_irq gsi[GSI_NUM_PINS];
 };
 
-#define Q35_MASK(bit, ms_bit, ls_bit) \
+#define ICH9_MASK(bit, ms_bit, ls_bit) \
 ((uint##bit##_t)(((1ULL << ((ms_bit) + 1)) - 1) & ~((1ULL << ls_bit) - 1)))
 
 /* ICH9: Chipset Configuration Registers */
@@ -137,13 +137,13 @@ struct ICH9LPCState {
 #define ICH9_LPC_NB_PIRQS                       8       /* PCI A-H */
 
 #define ICH9_LPC_PMBASE                         0x40
-#define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       Q35_MASK(32, 15, 7)
+#define ICH9_LPC_PMBASE_BASE_ADDRESS_MASK       ICH9_MASK(32, 15, 7)
 #define ICH9_LPC_PMBASE_RTE                     0x1
 #define ICH9_LPC_PMBASE_DEFAULT                 0x1
 
 #define ICH9_LPC_ACPI_CTRL                      0x44
 #define ICH9_LPC_ACPI_CTRL_ACPI_EN              0x80
-#define ICH9_LPC_ACPI_CTRL_SCI_IRQ_SEL_MASK     Q35_MASK(8, 2, 0)
+#define ICH9_LPC_ACPI_CTRL_SCI_IRQ_SEL_MASK     ICH9_MASK(8, 2, 0)
 #define ICH9_LPC_ACPI_CTRL_9                    0x0
 #define ICH9_LPC_ACPI_CTRL_10                   0x1
 #define ICH9_LPC_ACPI_CTRL_11                   0x2
@@ -162,7 +162,7 @@ struct ICH9LPCState {
 #define ICH9_LPC_PIRQH_ROUT                     0x6b
 
 #define ICH9_LPC_PIRQ_ROUT_IRQEN                0x80
-#define ICH9_LPC_PIRQ_ROUT_MASK                 Q35_MASK(8, 3, 0)
+#define ICH9_LPC_PIRQ_ROUT_MASK                 ICH9_MASK(8, 3, 0)
 #define ICH9_LPC_PIRQ_ROUT_DEFAULT              0x80
 
 #define ICH9_LPC_GEN_PMCON_1                    0xa0
@@ -172,7 +172,7 @@ struct ICH9LPCState {
 #define ICH9_LPC_GEN_PMCON_LOCK                 0xa6
 
 #define ICH9_LPC_RCBA                           0xf0
-#define ICH9_LPC_RCBA_BA_MASK                   Q35_MASK(32, 31, 14)
+#define ICH9_LPC_RCBA_BA_MASK                   ICH9_MASK(32, 31, 14)
 #define ICH9_LPC_RCBA_EN                        0x1
 #define ICH9_LPC_RCBA_DEFAULT                   0x0
 
-- 
2.38.1


