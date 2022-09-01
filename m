Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBAD5A9D86
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:53:03 +0200 (CEST)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnR7-0003es-Dx
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2R-0002Pd-Jt
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:32 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2N-0001YM-IF
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:31 -0400
Received: by mail-ed1-x534.google.com with SMTP id a36so19485947edf.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=L2ZD0tf22k75Y60smdBIZGtimaHKATr8a5+W5rsYQ0M=;
 b=LDvzp45UD0Zry9SKWvo+q+B1QsrQydvy3lnPRPqEUz91kBPvOT6AvVzVXFVYKcViSt
 NSJdMZma3tHl9FWWS84jf9VevV+JHZUn6CNFt0GOTjq6Z7phsuDOkIKVsNi+WYTAqxcj
 DbZtKswv6NP9dQaq2lp1q409lvve+jtm/wtLiQAv07IX4xKVx8kt0ihMpSusunktQW8E
 DT94fjct+FJiXu2Ev+aac/T8C7OpdjMHUdht2zcacPFLipAUPh4qkZtVFRa+AkFfpLk+
 n8iwPqWMFE8sSwklIOpG6sCTJ2K01J9cUZQmw2a9U2Rnts9PSBzFIT6aczrvV1f3rViE
 5/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=L2ZD0tf22k75Y60smdBIZGtimaHKATr8a5+W5rsYQ0M=;
 b=OPwOAnxeTB2LjwmdMruTujfM1L1VF/4UqeUDkHgktnPGNW8f4U2NvsukqsNvZa+8VA
 w0VVry/WHcBuvqhtCr5+Gd8jqj9mixme2XPgVMr06PDNbdCtNJ9R1hjdc2JFbHaFcd7f
 6zZtGOK2EbsB9EXu7klb8KsTRm/x/xhv8eqVsgqeRFzg24GH9osmdflr+jxAnJ0lis7X
 tEZWKM4zG7HPidW7kELm/SUY6QibwEL+9Wac8wynW+1pdctZIOHuJvgIXBFAbE0Jr9zH
 Mw9fOnKjDWFQJdE/yv0ggrBnpDzy5JGwcl3j4ClxBMj1k1UMpM9aIwTf5qy01yOb0C2Y
 2fyQ==
X-Gm-Message-State: ACgBeo0AJwHKkQK+XgizVTp0fGdIKgotpZ9asNriAh12UqfhSpdnNFiB
 nhrwItJPLJTJgf06NqwHemlyCwfos5o=
X-Google-Smtp-Source: AA6agR7qkd0C2FOQlVFwR2kRRJOj/F5nB3wBXAWHZHS+JOfv2orxij4ev0sPjax5HwTVD2a31X3PeA==
X-Received: by 2002:a05:6402:5ca:b0:43b:6e01:482c with SMTP id
 n10-20020a05640205ca00b0043b6e01482cmr30588799edx.189.1662049644163; 
 Thu, 01 Sep 2022 09:27:24 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:23 -0700 (PDT)
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
Subject: [PATCH 33/42] hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"
Date: Thu,  1 Sep 2022 18:26:04 +0200
Message-Id: <20220901162613.6939-34-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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

Prefixing with "piix4_" makes the method distinguishable from its
PIIX3 counterpart upon merging and also complies more with QEMU
conventions.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 72bd9ad74d..01a98990d6 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -62,7 +62,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
     }
 }
 
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+static int piix4_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     int slot;
 
@@ -248,7 +248,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
                               qdev_get_gpio_in(DEVICE(&s->pic), 9));
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
+                 PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
-- 
2.37.3


