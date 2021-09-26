Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19934418A66
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:59:28 +0200 (CEST)
Received: from localhost ([::1]:58698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUYQx-00062G-2z
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYOZ-00039M-83; Sun, 26 Sep 2021 13:56:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYOX-0007In-St; Sun, 26 Sep 2021 13:56:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id s21so5032577wra.7;
 Sun, 26 Sep 2021 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FPXJV62TB4NXEKfsor64tTCoCfKx12CzkiEiOU9oIyg=;
 b=n426p2QUEZN0NeqLFCHuwTjYbV1lo2Pt5wPaAl8uWIXEmV+G3H8y14eDH1ulXtTcZP
 OPG8RjsIW6XHbytC+QJkcmXuQHruvj5wudRVq3CLtKOoCI9Zacfuk6yiJb7np2WjwDua
 ANzf/iZRObT94EZeEHQDvUNaGJFNxup+Lo/SlrYTEb/igtb+rM2FLm3red0aoXyBEWwN
 YI1lli8xVhaeNyWBztGERz2hDhdYHa8x3izoEg0+xgFPNlg3qlzv7h+4pv6jb5T9PmxP
 yLkVyNLZx/RisK5IVYKu1qiv93upM/ebOdycECCISRcmxGNB0K/YjxnDx2vwHdVega07
 ldsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FPXJV62TB4NXEKfsor64tTCoCfKx12CzkiEiOU9oIyg=;
 b=NI2TbLldwKdSfSsECmi7/HAEGXEmTwh5R5dg2OZKWHCYfWINsoCX4xfZ9Ul8gOgGxR
 O77kdkShmRuPFyardJKp/N6sMVA/ODKM0kQqPHv/0itJ4VECiKtDaP/U8yxol9UixMnb
 gj+d4/WuqZkxMJL016RS36BEO3oRlHKhYyxrZGFoFIBqJfzwUQ9pgdzIsmvQLlfCY2wu
 c1BeM6Y2DKxgryrfVxluVDOCuOH/PovDGkbkmGoiZcxRRjjtAxZvxmLOF6nwfevuywzW
 HhI1Gr+VA0sqG2pWk8++IapCmJruEpTFY7loHkN6YBzUgyY6/T868c44WBYk+yprBv2J
 rGhQ==
X-Gm-Message-State: AOAM533AXUsWK96k5vhIQDi1C9iut8ZwqesTT/vwYJ5rU9kE/ULSWHLX
 7qPnrKGxHgHEFgdKQ4WN2Uds8wdXsjk=
X-Google-Smtp-Source: ABdhPJya9SLaApBfx9w4Anq2k8ycX+H/1l3rL6DmjaH3tEFegBQGw/0Vvia6FacUtcjGP6653OSQtQ==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr22712676wri.355.1632679015944; 
 Sun, 26 Sep 2021 10:56:55 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 h15sm14078043wrc.19.2021.09.26.10.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 10:56:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/i386/amd_iommu: Rename amdviPCI TypeInfo
Date: Sun, 26 Sep 2021 19:56:46 +0200
Message-Id: <20210926175648.1649075-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926175648.1649075-1-f4bug@amsat.org>
References: <20210926175648.1649075-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

Per 'QEMU Coding Style':

  Naming
  ======
  Variables are lower_case_with_underscores; easy to type and read.

Rename amdviPCI variable as amdvi_pci.

amdviPCI_register_types() register more than PCI types:
TYPE_AMD_IOMMU_DEVICE inherits TYPE_X86_IOMMU_DEVICE which
itself inherits TYPE_SYS_BUS_DEVICE.

Rename it more generically as amdvi_register_types().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/amd_iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 2801dff97cd..0c994facde9 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1621,7 +1621,7 @@ static const TypeInfo amdvi = {
     .class_init = amdvi_class_init
 };
 
-static const TypeInfo amdviPCI = {
+static const TypeInfo amdvi_pci = {
     .name = TYPE_AMD_IOMMU_PCI,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(AMDVIPCIState),
@@ -1645,11 +1645,11 @@ static const TypeInfo amdvi_iommu_memory_region_info = {
     .class_init = amdvi_iommu_memory_region_class_init,
 };
 
-static void amdviPCI_register_types(void)
+static void amdvi_register_types(void)
 {
-    type_register_static(&amdviPCI);
+    type_register_static(&amdvi_pci);
     type_register_static(&amdvi);
     type_register_static(&amdvi_iommu_memory_region_info);
 }
 
-type_init(amdviPCI_register_types);
+type_init(amdvi_register_types);
-- 
2.31.1


