Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96BD2DDE86
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:20:51 +0100 (CET)
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq98E-0006Fy-QD
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pm-00057c-GW
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:46 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pd-0002GJ-Td
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271613; x=1639807613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MpBQKdioGaJim1MlQ/ammtRMybI49VH5ClvBD9OZSzo=;
 b=O6ou+CSHYCxPkCiscthQl1dCISQO9WirDKGXkBkuHDFz/rsXKy0cthHb
 V5A4a3sdnhZOBkBtEHDxn40WeP/29tnIQCR7TKfkFvvIuYElnDsnOIc/T
 ag9wpIYlPZvq6mbguaQC1qK2bQAopAJddt7cEY5Ut7TMt+rD1POfTm2v9
 FtJr9koppQYhARjw/F0VlO2FgEen6pgsBjphBr+PecxpN4nGdje1Rkmlb
 r6yFbbdwKzuqQY4FQ241PQQzfcEHS5sVv7L15odsD1Emf5etdxC12V4zQ
 ou4bKh4DO6djkmrMFZwuHg4bCIYouLJZsk+gxDhq1m+zEgAP4ApbER6eX w==;
IronPort-SDR: G9uYvrgv8tCi/+lEbD1a7jHHf674KC/WSvMgiw1wrCGPvKSemqylFe+ZfjV2uO1TB/UqeVRn8S
 fIbLUEBZEMtc8qKyC5PLPQxTXEDaDbZfqGQmEDIEORZPS25f82MhvIpInr9uXDrL4vu+vHT3w1
 DyIkKFIKjDKJXKPJxFEhQYsZ2v23lT0+AlHdKZNCPP09aNPJo7qoCeU0ZZ9XBeNlsGhhdSwNTL
 bQKoCj/th9laUOBPJ/Y+Lw46CXyt/iLd7a8vpaV6Ev+NiZzpHjpWqviRyWk5M/CEogVkirYpYT
 h5Y=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237051"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:28 +0800
IronPort-SDR: 9eWqixBbSLFALJDEXzJzi3mO/IIDiPH2sRyqis0MTz6cW1RUS2qZ14Bih4wBbR2TaezoZaVzXT
 OINKMwF2eZWRFTKWOeN6TgWcpx8vT4VJjWegiVpxkUb26P0Cf7fxOAjvph0cbRLzMxd/hdv8ap
 RFKdi/wOJQrbQh0BCsJtkUYvnFUc7qrmXW/kSMk/U3wg1WT7njoPuFFcR6lHrO2R+OA2/iFZh0
 KNZXzkfFw9ZVeE3AriPJfLmcAIKsTFNGCHiL3Kq+TRAfca7dkWnPtjllZRULJz9NVhY9llS32I
 SqNAjA8UWa5pQjFCZGoJJbSy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:37 -0800
IronPort-SDR: 8pJiK1wubn8BrqTGU6eHFB6IOIMMN63UQ1Z7v+07kmeHTjKyhtCvrcHDTBSjYkh9hEeKfSQcuq
 FbPE/bV3ENAwav6/SkCZ2iaL+XGCQ8XQKyuF37qZxm81QcOJIaU0DIRxdO6ksYmEVfztZ6g4Le
 Za5eoAjzn5scTapX3xSRUqI5z0X0nndF6exdENNtABlXG1gENKtq7dybXxyHQnEdb61Agf+hUg
 f1mUta3+0T6vBHwPU2ifPJcx8u7i9UHx/2wcsQcja4E0/DisrvNfnLRtiVXayL3hQDDMJlYloQ
 /6A=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:21 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 09/23] riscv: spike: Remove target macro conditionals
Date: Thu, 17 Dec 2020 22:01:00 -0800
Message-Id: <20201218060114.3591217-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 04ac7fba2348c92f296a5e6a9959ac72b77ae4c6.1608142916.git.alistair.francis@wdc.com
---
 include/hw/riscv/spike.h | 6 ------
 hw/riscv/spike.c         | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/hw/riscv/spike.h b/include/hw/riscv/spike.h
index cddeca2e77..cdd1a13011 100644
--- a/include/hw/riscv/spike.h
+++ b/include/hw/riscv/spike.h
@@ -47,10 +47,4 @@ enum {
     SPIKE_DRAM
 };
 
-#if defined(TARGET_RISCV32)
-#define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-#define SPIKE_V1_10_0_CPU TYPE_RISCV_CPU_BASE64
-#endif
-
 #endif
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index facac6e7d2..29f07f47b1 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -317,7 +317,7 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     mc->init = spike_board_init;
     mc->max_cpus = SPIKE_CPUS_MAX;
     mc->is_default = true;
-    mc->default_cpu_type = SPIKE_V1_10_0_CPU;
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
-- 
2.29.2


