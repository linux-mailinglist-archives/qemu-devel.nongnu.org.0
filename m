Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF1D346DD0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:18:45 +0100 (CET)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqIO-0005ca-V2
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqDx-0007le-UQ; Tue, 23 Mar 2021 19:14:09 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqDw-0004og-FY; Tue, 23 Mar 2021 19:14:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id v4so22524958wrp.13;
 Tue, 23 Mar 2021 16:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sXZ5+rlla4hihnGaVsI2lt7KqMDnWJjmcdH6IhiIyEo=;
 b=ZLqCD0Gpxqtp0SDy3lky78VnlZRZ8YDrP4BiCiv3r20dEfP7Ng4LkwDNgvZwwBznjm
 K7svhznNryC+x42fkDbKjSlAPvzrTg/A+kLAOZ5pzqbT09NSxWLAFJVKiaTeYaeX73es
 Wgym1HrNSNPyVZYGSf4CMnLE/5H7k4PXQPYml2P3ENSS9xzvqQ1vZY+xrWN6fxOpXVaz
 rmGx6dpntHeJ9CEFGF3rZo9s+sdUoMKGVX9VEWO4R1qVnzCLllyWmXYrsA0Bt5K9h5FY
 0GfRA7HSNTxpdwb9AefH3iEJwBa523eT1HMqvXZppwYCVWyKneBQTiIQ66eYzZm5abY8
 X1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sXZ5+rlla4hihnGaVsI2lt7KqMDnWJjmcdH6IhiIyEo=;
 b=Zawdv3Z1mdsIlO1lExNDMf0dLRUEDKgyxCv5LAaBLHf3Qw9QKtQ7RgDUGlFEKfG7x5
 HJdV58wv5UZpmS4At4hjIhX5HP8oeCsvIIzjoL5IWhriJxF9tvk84GFpFXtydImjpBQ4
 nz6flbQcNyyR5BYlwnd6JDr6gWWIHyVNCONjQ2kbwdMAw5FvG9M0V41+56WzFO7OkO8A
 5Lr4wkgRWXNkl5m+kBbPnpWwW5cfD3+v+D/BaOroMYX9mHSBZ/asDW5jRZ3o9fjMfmZV
 VbE2/SjkZ8L3rcXg2kSRmEL0+HGyEjoBI1q09sUMLUkH0cI1h6eE+F7mK757ysDyi7/f
 ZuEQ==
X-Gm-Message-State: AOAM531y+ICWRWFOffGvakSZUmSPG2BlvPOp3VtT+uY5fSK1C5K3jIpL
 Fs5bg4IZv7pTk/9xuOVFrJKdC5QtPCs7/Q==
X-Google-Smtp-Source: ABdhPJyf0b4MMlPIcfzx5/iQiQ+K4z2Gtyt1DVmPXwsjsi6wZPocYQF0E5gHpeG4NUJAlob8AIOPMw==
X-Received: by 2002:adf:90f0:: with SMTP id i103mr296408wri.318.1616541246281; 
 Tue, 23 Mar 2021 16:14:06 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a14sm483763wrg.84.2021.03.23.16.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 16:14:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/isa/i82378: Name output IRQ as 'intr'
Date: Wed, 24 Mar 2021 00:13:53 +0100
Message-Id: <20210323231358.396520-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323231358.396520-1-f4bug@amsat.org>
References: <20210323231358.396520-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Named IRQs are easier to understand in the monitor.
Name the single output interrupt as 'intr'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/i82378.c | 2 +-
 hw/ppc/prep.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 2a2ff05b937..fd296c8ed7a 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -113,7 +113,7 @@ static void i82378_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
     I82378State *s = I82378(obj);
 
-    qdev_init_gpio_out(dev, s->out, 1);
+    qdev_init_gpio_out_named(dev, s->out, "intr", 1);
     qdev_init_gpio_in(dev, i82378_request_pic_irq, 16);
 }
 
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index f1b1efdcef9..50d9b6f0d54 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -284,8 +284,8 @@ static void ibm_40p_init(MachineState *machine)
 
     /* PCI -> ISA bridge */
     i82378_dev = DEVICE(pci_create_simple(pci_bus, PCI_DEVFN(11, 0), "i82378"));
-    qdev_connect_gpio_out(i82378_dev, 0,
-                          cpu->env.irq_inputs[PPC6xx_INPUT_INT]);
+    qdev_connect_gpio_out_named(i82378_dev, "intr", 0,
+                                cpu->env.irq_inputs[PPC6xx_INPUT_INT]);
     sysbus_connect_irq(pcihost, 0, qdev_get_gpio_in(i82378_dev, 15));
     isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
 
-- 
2.26.2


