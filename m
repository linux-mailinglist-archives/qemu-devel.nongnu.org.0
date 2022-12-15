Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C9964DBA2
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhS-00071E-Vi; Thu, 15 Dec 2022 07:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngw-0006kl-D0
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:26 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngq-00046y-Qk
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:26 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ja17so10764673wmb.3
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M2KhCSPIZElH7SCUlfpHXiQKpSM6BHwX+ecHE37djY8=;
 b=b22ycleeN95Y4TGAtLi90kDOoI3rsW8BK1ZQkLMU/15TzdjwI3lIaUF5YHqPPbzbQv
 3ur2jh0lwstIz9F8mbAfDNOjq1SSmTif69RKxM1xArLidFi+M8P8lE2Hlz3hXFapW0Pb
 kMNVNEyr+cVGgh9RqIBYoD4o1CYp6Xh4xGkiiXbDoGExij/R2gVDBjY7u5ZIOlr9UwBT
 z5zCjg65+cFr4gleOkPBmdYcimvmEmPjfO98S2AOVfOFfkXnB2KnzQk9qmi2cjDpkmB8
 kCe9uiM0s9hVPNgF1PPgu0s5qU5dWLqU0XU3qhFloKhqCfuHSYKo8ZJRteGbTb8txkkc
 Iiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2KhCSPIZElH7SCUlfpHXiQKpSM6BHwX+ecHE37djY8=;
 b=l6nf/06bautxnZZXsZVLtxPxtIsF272hGQ2oVbnPLMsMlvP8IsXZ8ZpvIvFaKmtlSl
 9cAqi4lrQCfRU1DEKzhxW73DdDBcw8t4lpEP3Yo5OtNAPEmew9kI5LB/FEeHUL6h0InI
 1q4YF+i9FSyIvzWx5yoBfo6yiHg/9OByqqfoVe9sAh2RjczBP6BZbO40a2LztR8/QP/S
 MM/tf96GnsLAKFxMpR0DoYSfZqEs14NphvWg7LesYEdpeg/eR+G2oowdlnshhZBPT2kP
 FlhNvD9PUh15DyVxbGy6O64L0hi+NZuHaNE4RxtIJ5NPPK21tVjcHJ1p1fFfoV/HgW4q
 0SVw==
X-Gm-Message-State: ANoB5pm2xC60V2GVq/JWesMG0vYiZSp4FcfR6mMZQQ9AH1bMz8MrFCFw
 EhSO0WxLphQ7bXJlw7VzrInswjoUugdvKwbL
X-Google-Smtp-Source: AA0mqf43JT/Zs28q91hPe7M69PDIdGEIj5gqRKdI5kMuXmzJtyYJ8PGj6jCghKiw2SX5SnWpUsweuA==
X-Received: by 2002:a05:600c:3d98:b0:3d0:a31b:ca32 with SMTP id
 bi24-20020a05600c3d9800b003d0a31bca32mr21610342wmb.1.1671108619406; 
 Thu, 15 Dec 2022 04:50:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/29] hw/arm/virt: build SMBIOS 19 table
Date: Thu, 15 Dec 2022 12:49:48 +0000
Message-Id: <20221215125009.980128-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Mihai Carabas <mihai.carabas@oracle.com>

Use the base_memmap to build the SMBIOS 19 table which provides the address
mapping for a Physical Memory Array (from spec [1] chapter 7.20).

This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
("SMBIOS: Build aggregate smbios tables and entry point").

[1] https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf

The absence of this table is a breach of the specs and is
detected by the FirmwareTestSuite (FWTS), but it doesn't
cause any known problems for guest OSes.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
Message-id: 1668789029-5432-1-git-send-email-mihai.carabas@oracle.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0acb71be962..bf59784aefa 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1614,9 +1614,11 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 static void virt_build_smbios(VirtMachineState *vms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(vms);
+    MachineState *ms = MACHINE(vms);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
+    struct smbios_phys_mem_area mem_array;
     const char *product = "QEMU Virtual Machine";
 
     if (kvm_enabled()) {
@@ -1627,7 +1629,11 @@ static void virt_build_smbios(VirtMachineState *vms)
                         vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
                         true, SMBIOS_ENTRY_POINT_TYPE_64);
 
-    smbios_get_tables(MACHINE(vms), NULL, 0,
+    /* build the array of physical mem area from base_memmap */
+    mem_array.address = vms->memmap[VIRT_MEM].base;
+    mem_array.length = ms->ram_size;
+
+    smbios_get_tables(ms, &mem_array, 1,
                       &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len,
                       &error_fatal);
-- 
2.25.1


