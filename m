Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEB612D52
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGnl-0008SA-VL; Sun, 30 Oct 2022 18:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnj-0008Rg-8E
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGnh-0007A9-QT
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:29:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id v1so13645570wrt.11
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrsrz42sYHssiuYjKAsYt6biBGP0JSCE4Lb0wsM4SmQ=;
 b=GKbcQxALokapv/lioUwwuI4/IScyfHyzUoUXkFtDm5PB/BBjNU8rMZISaf3pecp6+O
 fLgIt81W0TmBe7MrP4LBUruLKuLDUE4qmhDZk9nUCFam76HguEZYiNvb3KOZDrC8SZ9f
 5lWbEmjf5RJ9R/Ih4MmXI1Ix6Kgg/2zn45fxZIP5hF6/4u8UnZXnyygRedOhh+ptc4YM
 9kL17yBdClyjScKgy5K/2pQ6SSeu4iv6mymmnvqSpoMW1rAlk+LRfUqF1Bm0E2aiy0Li
 w8179s//hW/7mSJXGc7BQdqXKJkyCtxTkYPwEvOIV3gyskx8FaeGdos/G0O8GJC8s+5O
 jNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrsrz42sYHssiuYjKAsYt6biBGP0JSCE4Lb0wsM4SmQ=;
 b=TRZ4hq5LWWykBtWhEjD8NBcSvmy95wwI57VHcraJjJ6deLL0sDeQBUTpdg1FU+0TLk
 thhA8ioE7o0ApBmaU52yUbnJ0MuLkfQg8RXpS1giGypI733J41lJqUaXtquwoUffMM5x
 iU7RqFJeiFEM1E0TWyxAKN+eDdiT4ETNcJBF1hbmR3oEX2K3f/2gOrfAx8cGx6a9eY+Y
 Fr5UtYWowa+jHJuPkjzQddX6Lf870VpACq/L/Rn/DCr9oSkcWKJ9iIFIIw8gqOjMURoN
 k/lkBA/ehH8CLlkQVPM88wYDoQCJ1NGZu5OFn86+hQ/KQgpj37jKpuLW0jaCDdSAIoB4
 hnng==
X-Gm-Message-State: ACrzQf23FSmzxB+QuC72VKMKY3iLHnf6LSRT+F1NSC+JDZfaOFMW+dTl
 XekWa2JUYa6ZWvlpeU+NnbfRP3VmOvXqIQ==
X-Google-Smtp-Source: AMsMyM5dghwnBic0oqpX0qZ2zpcv0snUXnc8+4oc5RHxH+y+cCPLw9XeyfNO7Ad55mVxvJ6s+f1R3w==
X-Received: by 2002:a05:6000:15c8:b0:236:812d:d3e5 with SMTP id
 y8-20020a05600015c800b00236812dd3e5mr5939903wry.303.1667168944340; 
 Sun, 30 Oct 2022 15:29:04 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adffe4d000000b0022afcc11f65sm5224921wrs.47.2022.10.30.15.29.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:29:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 03/55] hw/isa/vt82c686: Prefer pci_address_space() over
 get_system_memory()
Date: Sun, 30 Oct 2022 23:27:49 +0100
Message-Id: <20221030222841.42377-4-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Unlike get_system_memory(), pci_address_space() respects the memory tree
available to the parent device.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220901114127.53914-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.37.3


