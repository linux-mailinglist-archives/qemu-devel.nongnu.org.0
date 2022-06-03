Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B7C53D212
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 21:03:01 +0200 (CEST)
Received: from localhost ([::1]:40842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCZZ-0006ZJ-2b
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 15:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCOF-0007Jk-Mu
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:19 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCOE-0004CR-8l
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:19 -0400
Received: by mail-ed1-x52b.google.com with SMTP id fd25so11315430edb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jc4MKfgMJx8u8UCAhQmdavk8QSdZLeuW9RwLxX0XHzY=;
 b=dSrA32Bq09z+93G3SA44grIgVCtQ8Vzgf0Upp/Dk+ileI8/Tsu1lXNogB5QR+nEu4r
 PC+Cgi+ZmG40SH42np8w4+VaB7WJmFI5zgLyfqWdXCYyw5EbTPvGJwiZfZkBpl/rtypy
 pspfCXKIUU+NnEiGriiTbEevGJGKc5Gj6ZoQDkCLugInvRPMWZl3QK9b3elFDOk/6S3E
 1KPxneN5KeqLGqofbdBA94Eqxn3kRljuhkIG7vOCbB8ktzBa2C9xjxuTFreiKWdYgWoH
 CO8kTsjymCyyq0gDRdwLs/1SPgVJMJBz8qOOl/GHBCVIIqL+oANLlaGZQvET2xVr3jT1
 xPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jc4MKfgMJx8u8UCAhQmdavk8QSdZLeuW9RwLxX0XHzY=;
 b=oeyhjk8bVRTCq1CrKqNwQyG8E2NQON9nhC1NnRLcuPNqoalOsn9ToZ2fpX6pxAELjP
 EiwVO6+9BMUDS7SYpd8wwABNyJwIvEHpra/wb9x06hWTCXe2AtfdbbNGcmGaP9J1ury/
 u1Abk/Hz4Ay9BFWcEng0p07+azVappNzdWDkk0SkZFDN5FPVdQnB+Kgto1OsjAtSjFfY
 o0+Ijp/qBEtAwGUfOP2IyjGj6i22pKN6/kOwBi/KGpo6/8zEooSSvL89HbOCvkCn7I52
 LS6Nu5feA4prLpC4CjUiXyOaoc8yywhL/ZLWwh/fjThoGdD67/q5MktklL9+OALsbixf
 bGvg==
X-Gm-Message-State: AOAM530JYX97vQglwON5tmKP9FQCmm7yKfpzW65uY2hB+/eCyw/a/5Zt
 EUU4//5nYnSoztKCJVIMJoW4wi2FYsCvYA==
X-Google-Smtp-Source: ABdhPJzbQTZ0RbuNdOajp3U7Ts2M/O0282vsaiE37xNi/hpOeJHdz8AIWiYLFnNX/ITIiD9qji0uhw==
X-Received: by 2002:aa7:c55a:0:b0:42a:adfa:9150 with SMTP id
 s26-20020aa7c55a000000b0042aadfa9150mr12325038edr.57.1654282275973; 
 Fri, 03 Jun 2022 11:51:15 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:15 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 11/11] hw/isa/piix3: Inline and remove piix3_create()
Date: Fri,  3 Jun 2022 20:50:45 +0200
Message-Id: <20220603185045.143789-12-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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

During the previous changesets piix3_create() became a trivial
wrapper around more generic functions. Modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc_piix.c             |  6 +++++-
 hw/isa/piix3.c                | 13 -------------
 include/hw/southbridge/piix.h |  2 --
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c884d1a489..b58fbd4815 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -197,6 +197,9 @@ static void pc_init1(MachineState *machine,
 
     if (pcmc->pci_enabled) {
         PIIX3State *piix3;
+        PCIDevice *pci_dev;
+        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
+                                         : TYPE_PIIX3_DEVICE;
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
@@ -207,7 +210,8 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        piix3 = piix3_create(pci_bus);
+        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c6ff7795f4..01c376b39a 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -399,16 +399,3 @@ static void piix3_register_types(void)
 }
 
 type_init(piix3_register_types)
-
-PIIX3State *piix3_create(PCIBus *pci_bus)
-{
-    PIIX3State *piix3;
-    PCIDevice *pci_dev;
-    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                     : TYPE_PIIX3_DEVICE;
-
-    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
-    piix3 = PIIX3_PCI_DEVICE(pci_dev);
-
-    return piix3;
-}
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index f805fb8683..2693778b23 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -68,6 +68,4 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus);
-
 #endif
-- 
2.36.1


