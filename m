Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215505A6CCA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:09:13 +0200 (CEST)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6bo-0000vI-7O
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U7-0002zG-SW; Tue, 30 Aug 2022 15:01:15 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oT6U5-0008Q4-6f; Tue, 30 Aug 2022 15:01:15 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so6688663wmb.4; 
 Tue, 30 Aug 2022 12:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=stKyWe1aP4GErtwepvDPTmPyOUKRJLsF/b+AUrVbyU4=;
 b=UUaxz5+2s6p5K2ocrffAUQAs92DhIiDxyXL1KIsvkHlzetPTN4ToDH9cCoXaVH9Ant
 2Dz7NrOWe9p1eA04qpFR0zlCAa8VemW5NFnketywxtj7sm06N42iTZduZcAVtFVJxEg1
 0Jeer4CtaJQnd6U1uj4xVDgIruU6r1SlONV5ZNW1LlfEJx2YR00wBlfpw8W9KU8dHHhe
 AeNutSDy+sJnAC34Gy85gkcDiYA/Vlt+KFZk7JW8oJotGwYA41GbsaZXwG0lgyeu9mTd
 a1lgKkZQ3IlYQa9cNuxJ/vgEEvzOn3HthpiEww88Sh2PmqEfcMqyILq4owp7t8HyTUjV
 oMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=stKyWe1aP4GErtwepvDPTmPyOUKRJLsF/b+AUrVbyU4=;
 b=iLxdH2lx3drGMxxnfH16f9ODvkUU3pEthP/F9CcEXOEwjGRwzYUIWA0R9G3ii+9GqM
 TO0+v3gwmHyFQS6pUziLwCTvijyXhjzbumiCsctsyWD3V4pDHS3mmxHnIuwdH6QhDPXu
 JXvcJEOzA/y9egWWiP5lj9dJDhkPdvBy5l0yvqQLBxjUIurIJ0AkuewWWtI1HBp/0dw5
 gt9qti8ocCTrOBLDopVE7eonc6cnQFEi2dTUItMCUkiYo8lsOhGoCluLehZTKj4pI729
 9VFNDNvQLhq0MJMwaaXAUktzhzHZG9CYEIJX8EeZradQM4EOBwNnqbIMYFrfJg4J4RB2
 KG3A==
X-Gm-Message-State: ACgBeo3+e9tj6xO3sMVz1zDkgEcWj0KF501nCPUTEFeGi18YogMUyE0P
 57ucFt6GmL9Xrvi+DObLAsrwswYb1U4=
X-Google-Smtp-Source: AA6agR4Ye03AduSgHY9isI53Sb8WLfcwXH/cwwye5g8p58MfWcowyiL1YFBeETObHQMRyq1rwKNFMQ==
X-Received: by 2002:a05:600c:4152:b0:3a6:48c0:509c with SMTP id
 h18-20020a05600c415200b003a648c0509cmr10656417wmm.24.1661886070630; 
 Tue, 30 Aug 2022 12:01:10 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adfea52000000b002206203ed3dsm9821285wrn.29.2022.08.30.12.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 12:01:10 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 03/10] hw/isa/vt82c686: Prefer pci_address_space() over
 get_system_memory()
Date: Tue, 30 Aug 2022 21:00:41 +0200
Message-Id: <20220830190048.67448-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830190048.67448-1-shentey@gmail.com>
References: <20220830190048.67448-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
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

Unlike get_system_memory(), pci_address_space() respects the memory tree
available to the parent device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 9d12e1cae4..5582c0b179 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -589,7 +589,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
 
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
-    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+    isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
                           &error_fatal);
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
-- 
2.37.2


