Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E554743A
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:27:48 +0200 (CEST)
Received: from localhost ([::1]:35552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzHP-0004Nd-L2
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUP-00074A-W2
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUO-0006pz-AL
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:37:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m24so1469462wrb.10
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w8vNfNLLIee2MaL+ks67DcO/J88IIdeho9H0Sq2FOVQ=;
 b=k9JR3N09pXjje+ggVtGLpmP3uZnOBr3P+ECZ0zN23czR0OzoFJmnc0D4LRQZQUTOsq
 sNE3JM91uZbHHmkB81+AHnPaSVWqmFRdE/Kp4TkwZxbf7e4WNBCWsXccFSgVp7GggUFb
 iK16OGDHci0xriYpwbnkCx5aby+d7xdBsBt0s/0PcgqZHo87MAEYsakDj6gM6QEfFRWU
 QLFaYbrp2avhLcNNr9O/I/BOp6UJsIZo8FwYEIaq+mfyXyeIPC4tLbyxisP3wsaU4yPQ
 PwKC8e2SRsStojvBx7kbdKaJYPtwpxFk7kXMvJmUr6YMMhWgBoipGaSc/i4e+6QAi0W3
 aVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w8vNfNLLIee2MaL+ks67DcO/J88IIdeho9H0Sq2FOVQ=;
 b=dV+b+8ch8h35aKlnUnLjI1GmBZpuMOvUc8LzGVsseIAb5s105ewcpz85zy09s5Lr7I
 oPpwG7b3ty9gmFRp/h+ezKON4S7v5ksRvxeaTDethTqWmDIMKilohx+3zUyEg8Jm74va
 uy3GiI2t9g1GjCrEwHZOSU7oaHLuoHerzIH3hdCz6TYds7zywH/XWHOFX5TrcnaQvJWy
 2FnHNFT59eoQYGR3yPR8YipUgznAkOfPGm1gK4YcxgA4hddFf/WPLIs93JIdK4ayRVjT
 zvhjUhzOlel+TeKcQCaAl+I7eMN0rK+Y+h90FX8zxl4OFcP4uGN0nT+R3PuXBX8nYcXr
 TngA==
X-Gm-Message-State: AOAM533qLQnxjFUWbR4jyq8qmBVHkhvEJCcNmhb2+5GaFZF9eulRqS7r
 aOqEdxNwJcmeXZFH3oWvnRsIwYU5X7o=
X-Google-Smtp-Source: ABdhPJy5LhaCW1s47OpHFPRLdCNxjXwFhBzmFWiZt1JlpIbPCoqMRo86YJPhoLcf4AAlw9MNT1TD6A==
X-Received: by 2002:a05:6000:1f18:b0:20f:e61b:520e with SMTP id
 bv24-20020a0560001f1800b0020fe61b520emr48241497wrb.214.1654943825809; 
 Sat, 11 Jun 2022 03:37:05 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 n10-20020a056000170a00b00219fb3a275csm364003wrc.16.2022.06.11.03.37.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:37:05 -0700 (PDT)
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 45/49] hw/i386/pc: Remove orphan declarations
Date: Sat, 11 Jun 2022 12:33:08 +0200
Message-Id: <20220611103312.67773-46-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-6-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/i386/pc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index eb3d093bca..b7735dccfc 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -171,9 +171,6 @@ void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus);
-void pc_pci_device_init(PCIBus *pci_bus);
-
-typedef void (*cpu_set_smm_t)(int smm, void *arg);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
-- 
2.36.1


