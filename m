Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B1418A6F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 20:01:28 +0200 (CEST)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUYSt-0000ml-P9
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 14:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYOj-0003bj-R6; Sun, 26 Sep 2021 13:57:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYOh-0007Qq-DV; Sun, 26 Sep 2021 13:57:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d6so44901974wrc.11;
 Sun, 26 Sep 2021 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jvqRK4Z3bdPv/1YidtRVaHsIt5mmLgAbnxJvc6rWeOY=;
 b=cIn7FVQh4RMmE1zr384PbkA3Wi06HLIFp3QYRDMUUOgesCR6HszXWE7xPedMuadbAP
 Y5321Imtl+QWLbWbrDvUS+AEoVA9plMRRLUKt+ENF+BLrIKxZPeUD/JZE/t6rnezjoQK
 nAqudy74ASh177PkUxNsxjjJmbFSF55jG8c+XaeNg4xqQK2IMxXeLas7O+8oztXM9H+o
 ampaDFV9+6CIF+UiFpVKqCrLFaGGtzRNPOngZvK03Xs9uJDUw6Wo40g6TlfGbj/hSz6y
 y2KkIUOOAqUdvEMo7DyU0I7CBw4PM49UUE8YVglwukwrX7lgTu9viiydgLP+yHmFz67T
 3zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jvqRK4Z3bdPv/1YidtRVaHsIt5mmLgAbnxJvc6rWeOY=;
 b=b/RiIpkdzp/fUeTsN5B6WLQU4x4Ht5HjfBeO5+DODCjvgPz4FWPf/QHgjD6Qv5Y+ZD
 4kzUUjTO9W/Ps/luXIyCrEHrgX+l2wj9pvktUCYqrCvYBSfbcaWca6Yn4YTAZ2Qo4ruI
 62tveP3lELz0BEg7mW7Udl711rMP8e1ONtJJURSVrDI5j17ZFX7JU3rKu7+PVmvcAJBr
 KKAcR/Md+IS/6hefKCgzw/OXKX4SKg/SHaS7f6m8e2vYL+Hcd5zahClbPVGop4IQMqgE
 7L1g7Py/gGLz/m+3unka4rXEXcVqyB6hWYlo0KKk2hvvUCHhP1nbYmvpZDnAASpaDAT4
 RNBA==
X-Gm-Message-State: AOAM532iQAuWSWoSuOLCHZs8jeh94ZjGbCXP0k7ok/y7wtbhee6MxzsT
 0ZrcO/P5pbfjqJKDjNT6RPXsUpNYmrc=
X-Google-Smtp-Source: ABdhPJzWFaeXI2saIAKE36Kv6vIhdV77FZdm4oDd973pjzBRub5olz1xPpNpAmF08NjPS3aRXNRFKw==
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr22599828wrw.311.1632679025490; 
 Sun, 26 Sep 2021 10:57:05 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 a72sm18919583wme.5.2021.09.26.10.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 10:57:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/i386/amd_iommu: Add description/category to
 TYPE_AMD_IOMMU_PCI
Date: Sun, 26 Sep 2021 19:56:48 +0200
Message-Id: <20210926175648.1649075-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926175648.1649075-1-f4bug@amsat.org>
References: <20210926175648.1649075-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_AMD_IOMMU_PCI is user-creatable but not well described.
Implement its class_init() handler to add it to the 'Misc
devices' category, and add a description.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/amd_iommu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 9014690ba3a..9242a0d3ed8 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1621,10 +1621,19 @@ static const TypeInfo amdvi_sysbus = {
     .class_init = amdvi_sysbus_class_init
 };
 
+static void amdvi_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
+}
+
 static const TypeInfo amdvi_pci = {
     .name = TYPE_AMD_IOMMU_PCI,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(AMDVIPCIState),
+    .class_init = amdvi_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
-- 
2.31.1


