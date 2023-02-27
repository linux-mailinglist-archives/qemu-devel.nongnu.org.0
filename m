Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73E6A450E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:47:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFQ-00029z-OG; Mon, 27 Feb 2023 09:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF2-0000YL-Ux
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:37 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEj-0001JK-5H
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:18 -0500
Received: by mail-wr1-x436.google.com with SMTP id bx12so3218053wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OccisqI4WNIDr8E7Yjsdl5GaM3rLNuobwKRrMT0Br6E=;
 b=vBj7v8dQCQDsRnqJG3milKwjXTdwIJ+Vew7E16Vgv52ADlfwQhBjeC+mjac7dn+NuH
 d9m889U4Znm/9zSNl63JhmSiBY5VdJmA6atRZ03+FVUtp3hpGfay9UbNHRaN2VsmMBHW
 yU6+GSu1KKrePN+gHy8EZkb+zpIX5eSOrSU72WA67zOxLvyXhVtFs1G8U5R8N36z6yH5
 IJl5cLQP96RowaTfRvVKnqujJJ1Kec1y74xbwOdqFRR7K8Ksj8RD1TOPhji8+Ud84JEw
 LWQ7w6K0BbJSZi/gySARysI4byzMkvgN1Ojp1iTEGfIawfRF/yUwS4kkZ0xNE6/Phxm8
 3NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OccisqI4WNIDr8E7Yjsdl5GaM3rLNuobwKRrMT0Br6E=;
 b=Nb5sPgxvPvRTfjeVV7K1c6f4ayvGDjIzEzhpttOpgY+zDvG+wvPgZt1/7plMGp1Uyw
 P3HymZHClEuoDACnL1CI5jcQ9ndVtz1pH3RTlsARXtjcwquOTHoewAKSY+RoHtd1mT8D
 3WAnI4gtxyZ/chcKbcyOMxR0xTcCZS0B9Lfnx4LttR23fiY1qY62Gl33C+1ZWU8jaA6L
 KHkvz5ykZMQSY7f7TD+WIlYsslv1Tw3aEJqk9XyaFyieXv6ii/I/PChkHmPcZ8B+AUG0
 my1pryyzqxXnxAgdHjaGjXMPsIWp/iooce2dcpVxyoHpqSqi8FsNQ7Gl8vpwz57upzOu
 vWJg==
X-Gm-Message-State: AO0yUKW7gzAsGpPCMlVlLFBBi0nsnnq/TcyzzDSaVjDFPhhgmZq5pkzW
 qY6vHEujI/CcEjGvtaVKSPrOiyVxxM6H+dyK
X-Google-Smtp-Source: AK7set8giuoQZiF4s3R5H2Nm8KIbSeyfg2QACZTaalm14PXtDlQMF1hweX3MONIR95iyCQMAta6x2Q==
X-Received: by 2002:adf:cd8b:0:b0:2c7:bfe:4f60 with SMTP id
 q11-20020adfcd8b000000b002c70bfe4f60mr16526846wrj.15.1677507135226; 
 Mon, 27 Feb 2023 06:12:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7181688wrr.6.2023.02.27.06.12.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:12:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 120/126] hw/ide/pci: Add PCIIDEState::isa_irq[]
Date: Mon, 27 Feb 2023 15:02:07 +0100
Message-Id: <20230227140213.35084-111-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

These legacy ISA IRQs allow the PIIX IDE functions to be wired up in
their south bridges and the VIA IDE functions to disuse
PCI_INTERRUPT_LINE as outlined in https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg01707.html

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230126211740.66874-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ide/pci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index 7b5e3f6e1c..74c127e32f 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -49,6 +49,7 @@ struct PCIIDEState {
 
     IDEBus bus[2];
     BMDMAState bmdma[2];
+    qemu_irq isa_irq[2];
     uint32_t secondary; /* used only for cmd646 */
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
-- 
2.38.1


