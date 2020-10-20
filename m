Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A5B293D2C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 15:18:16 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUrWp-000247-8t
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 09:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU3-0000E7-CD; Tue, 20 Oct 2020 09:15:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5266 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrTz-00076U-MC; Tue, 20 Oct 2020 09:15:23 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A51C4423EE2A1BB2D8FE;
 Tue, 20 Oct 2020 21:15:07 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:14:59 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 02/13] hw/arm/virt: Remove unused variable
Date: Tue, 20 Oct 2020 21:14:29 +0800
Message-ID: <20201020131440.1090-3-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

We no longer use the smp_cpus virtual machine state variable.
Remove it.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c         | 2 --
 include/hw/arm/virt.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0069fa1298..ea24b576c6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1820,8 +1820,6 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    vms->smp_cpus = smp_cpus;
-
     if (vms->virt && kvm_enabled()) {
         error_report("mach-virt: KVM does not support providing "
                      "Virtualization extensions to the guest CPU");
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 953d94acc0..010f24f580 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -151,7 +151,6 @@ struct VirtMachineState {
     MemMapEntry *memmap;
     char *pciehb_nodename;
     const int *irqmap;
-    int smp_cpus;
     void *fdt;
     int fdt_size;
     uint32_t clock_phandle;
-- 
2.23.0


