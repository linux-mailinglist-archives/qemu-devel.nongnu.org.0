Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBF75A9D99
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:58:59 +0200 (CEST)
Received: from localhost ([::1]:47504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnWs-00075v-S0
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2T-0002QS-Nt
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:34 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2P-0001Yd-DN
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:32 -0400
Received: by mail-ej1-x62c.google.com with SMTP id bj12so35786557ejb.13
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RlCSmMuQDRF6y5ZkriXMWkW/D+R8q96BPAZaVelr8N8=;
 b=e3n8t9JHNMTLagGoG26zEc2nsxjAJX8+abQqtI1iJCdZNL4LpFxFxzMYA0yB8h+o4u
 uiyO9UavAoyJ7RsIS5OPrFieA2cz++lbb0V+LUPC+Xaqfy0SxHId0/z9wFc8Zjq+hae5
 z0kpIs9wEhJSv5SrU8CULP0kkE0lqUplhBTVvoOuAOJxTIk0T6vNyUBJaekAcx3kco34
 kqNykaeE7yU5DzjLKxErMPiJg2rpLbEuNX0exi6RiIhrn5PXJJzYKpURLDuMOZiUKdzF
 3JYCjv/YtyVbmNMPQr44A+3HNcsUIzIJ/w6B0OcabPNp+eLP5SrREeaiLN6oPepx6/hg
 YApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RlCSmMuQDRF6y5ZkriXMWkW/D+R8q96BPAZaVelr8N8=;
 b=APg7t/cI0kqJst0vJS4yme7+4g9Y/O4NsRbHLSB8sAoJ40gQ/bEp6aDsNwZjh2QMdC
 yWWQHKV0N6qu4dd2XhKl+IIGY8N1h+4oogNsk0ckCLHetbU2CpmDKMONDxmyjug98lMw
 hkQ1RiOXocPltNUsP62F1lN5PVkIavkQoQlxK/LKaniZJIpQW8ICOzBxDkggZ0aBO720
 iu38dDEypsgvWUwXaTrPSg5+XK2fmr46LZqqmJR4mtpXXd8xIklVtnVUMoKfWwxZ4nGE
 GMMJJHPl0tk4eNaRNxWPHM1XCyJ9zXMWM2DoUIlW9gCw8Cuxfq93aMSk0RakguDx/q6d
 zK0w==
X-Gm-Message-State: ACgBeo3cM8RHmARzBZhnZT8DrDj974LLH5Aj3Nyl6R9Jen4Da1cpSMcp
 gxvbY4Da5HS+6q0YC5tTC4es+Xrao+I=
X-Google-Smtp-Source: AA6agR4jrNAHEtyk8TqTtv+b3rUcM6crcd6Cus5QK8/KrC4peHsdFz3g2uMXsI39ZJBhm1fLyCGHGg==
X-Received: by 2002:a17:907:7215:b0:741:416f:fb59 with SMTP id
 dr21-20020a170907721500b00741416ffb59mr18595950ejc.150.1662049646536; 
 Thu, 01 Sep 2022 09:27:26 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 35/42] hw/isa/piix: Harmonize names of reset control memory
 regions
Date: Thu,  1 Sep 2022 18:26:06 +0200
Message-Id: <20220901162613.6939-36-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

There is no need for having different names here. Having the same name
further allows code to be shared between PIIX3 and PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 5d3715b64e..ba7b5d953f 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -387,7 +387,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     isa_bus_irqs(isa_bus, d->pic.in_irqs);
 
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
-                          "piix3-reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
@@ -578,7 +578,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "reset-control", 1);
+                          "piix-reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
-- 
2.37.3


