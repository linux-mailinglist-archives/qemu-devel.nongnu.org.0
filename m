Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542DA5A8278
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:56:28 +0200 (CEST)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ4p-0007ZV-EU
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvG-0002g2-3Q; Wed, 31 Aug 2022 11:46:34 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvE-00036g-1l; Wed, 31 Aug 2022 11:46:33 -0400
Received: by mail-ej1-x633.google.com with SMTP id p16so26096325ejb.9;
 Wed, 31 Aug 2022 08:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nD+jGqQYURG5xsaq+oD5YvWClrYTdwH6ZUzIb2BISlw=;
 b=ji8NyS8mX9gbE7sJnM+bjCkh9El+Aga3vdbbluQjcH+ijSmDJow8bNpUsGhlIl/GWi
 v0l3Jtbmx/pEwpXMxKbPZg45ITq9cEmsSfWrSj4RcohG8UFTN8GAN9uckLiy1+SGSCyx
 LPH4I/CFVh/6n0dgtQGD3U5KiMXWV2uuN+0tMFqlLmkHQE97b2vyuYopFzx9JO1NuXRr
 J7zGAu+P1MoSy3VkkGWDvsc5Mt7pzOc9c26NHCEcbgh4z1XfQZwJ8yHcrnHf/TiGPvUm
 2VnPY/YeVuSa208Wk9Qfl7y2/9Fir5sYmUOwaz3VpBfOmfEZSlLhGL8xpB3rNflfpife
 MvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nD+jGqQYURG5xsaq+oD5YvWClrYTdwH6ZUzIb2BISlw=;
 b=mpgJ56+WtGZoAX1fKIBRLBSn+94d52UbYUhB3UqP68lo9ggAFCUjsCumgqk8Q73Bjk
 GquZvUocXcR10Klsv11OQt5BIiKw4x34CGuLGTDFoxMOpU39EdlFsyFzzULucWJ+vIwo
 AYaYY6Ydvs5zNMmgWw9RHJfemXNGFhpp+OPPwpoKLcomSy4FqBbT63ANtNmN3s/walgE
 xX9SZsSEtLiuVsVkPka9Zp2yZQmP3YCQzDjQoBn6lRs+c8ag1UHs7lvXmqQDQXm+gzib
 XJkVL+ullTPTxGuMU2ID6tqRAAhqpDNtPtfQGxDhDj/1ydE1+0BH8l4xUFY1Jjkv+GJ/
 Efwg==
X-Gm-Message-State: ACgBeo1c6koY/7DmPytewZzgEUdjHKrfmTmc5xKMr6AJcnMKDwWy4JI4
 sM+BZXQvEoZgutoGZuY23QAOXT+ZM2o=
X-Google-Smtp-Source: AA6agR4s6Do6/NpPvxy28lFEH3xC9il6ASbowuM1Lk+NlJtT5vTUX3y3dnmAQQ9YL+GJpvMDaO9YmQ==
X-Received: by 2002:a17:907:7ea8:b0:731:4fa1:d034 with SMTP id
 qb40-20020a1709077ea800b007314fa1d034mr21210105ejc.758.1661960789614; 
 Wed, 31 Aug 2022 08:46:29 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 04/12] hw/isa/vt82c686: Reuse errp
Date: Wed, 31 Aug 2022 17:45:57 +0200
Message-Id: <20220831154605.12773-5-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220831154605.12773-1-shentey@gmail.com>
References: <20220831154605.12773-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

Rather than terminating abruptly, make use of the already present errp and
propagate the error to the caller.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 5582c0b179..37e37b3855 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -590,7 +590,12 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
     isa_bus = isa_bus_new(dev, pci_address_space(d), pci_address_space_io(d),
-                          &error_fatal);
+                          errp);
+
+    if (!isa_bus) {
+        return;
+    }
+
     s->isa_irqs = i8259_init(isa_bus, *isa_irq);
     isa_bus_irqs(isa_bus, s->isa_irqs);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
-- 
2.37.3


