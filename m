Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9502C35C410
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:33:55 +0200 (CEST)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVttC-0007qN-Lj
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrK-0006cb-DO
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:31:59 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrI-0000Fq-60
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:31:58 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so6555582wmi.3
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Xlfjf/uSOBy2ns+mImu3cJYZVqSzF2h27OuzEQHXbV8=;
 b=TYx5pXp9d3FgrYZ1FMp9MtsKnDOkX5tSR2+v+jPf74Bq9ZXgNH6IGKS4mZ90NhhYoq
 ip2RNeSIjlApNsh1ZRIApF2apx1zTRyFVWUrdFgAdGoLoMcc/Q+DT/PhRJi/H1yA5ap+
 Rcf0TG1jQcq54ox+ClLTDcM+P9i5xrWvIJuXGw1oPGIQiG8ksrZ3ZC4vGMWU+agC6j/0
 ktKNWXPWklx6ZtNwEfnzIkGvTvjN2Gnvu0kFGqV2qAjDTTofitPzbahOClOAjB9cwKR9
 CyGUL+YmTO1kRg5WmMdlgj5/G9K8fRE16B8ZrloghoMLVgUkOk3rDegNE0Auj8ZRP/e6
 4SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xlfjf/uSOBy2ns+mImu3cJYZVqSzF2h27OuzEQHXbV8=;
 b=k0USeO+W1Ekm52oFqpAFkq8GYvvwwgKHzaTjsBPdhsJU+zapArXKYOqx2TXnM0t+z+
 kI4fpAT6P2yRAbC0Iy4XukjxzrMeY8i6BpnSLxBlMn29V8Tck6ukwUXTrcvxLrm41kLH
 2YD0TLfIoneaOAoZ6v7EoVR9bF+p6fsO2Z9q6VgbW4UoFdjZNBxVW4jhXWzSUPMiEM6A
 KXLvXs66Omm36PtmjbGG4i6c1+Fr41mbJdonVvtPbPm6giMrCRKjLVqfqXlastBG2LsG
 eGydmopDwUiuLSn/tgzC1c4j/UNKR1sNTiUJLjJOL4ph4m+Cev8NCMWqMD9Z6RUGkeIv
 GKWg==
X-Gm-Message-State: AOAM533Jg5zxBu0Gl92pCfLbKGKgnevf2GUVH9s4EHPWpFE0V/8c/ctE
 KktsAC4ZqK9ULrH0qdgxd+/Vhb2VRWADQO42
X-Google-Smtp-Source: ABdhPJzz4yI6utU8kXVd0h39LrTnNfOT78YqowoufeSAC8+P0PZZLxIlFoOQwSdrL8ysZfv2RQOiCA==
X-Received: by 2002:a7b:c20c:: with SMTP id x12mr11775145wmi.51.1618223514326; 
 Mon, 12 Apr 2021 03:31:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d2sm16878651wrq.26.2021.04.12.03.31.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 03:31:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/arm/virt-acpi-build: Fix GSIV values of the {GERR,
 Sync} interrupts
Date: Mon, 12 Apr 2021 11:31:48 +0100
Message-Id: <20210412103152.28433-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412103152.28433-1-peter.maydell@linaro.org>
References: <20210412103152.28433-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

The GSIV values in SMMUv3 IORT node are not correct as they don't match
the SMMUIrq enumeration, which describes the IRQ<->PIN mapping used by
our emulated vSMMU.

Fixes: a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20210402084731.93-1-yuzenghui@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt-acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f5a2b2d4cb5..60fe2e65a76 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -292,8 +292,8 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->flags = cpu_to_le32(ACPI_IORT_SMMU_V3_COHACC_OVERRIDE);
         smmu->event_gsiv = cpu_to_le32(irq);
         smmu->pri_gsiv = cpu_to_le32(irq + 1);
-        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
-        smmu->sync_gsiv = cpu_to_le32(irq + 3);
+        smmu->sync_gsiv = cpu_to_le32(irq + 2);
+        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
 
         /* Identity RID mapping covering the whole input RID range */
         idmap = &smmu->id_mapping_array[0];
-- 
2.20.1


