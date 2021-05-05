Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22729374BDE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:27:07 +0200 (CEST)
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQv4-0003Ey-4Y
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrf-00073k-KN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:35 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:42178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQrd-0000B0-Nt
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257013; x=1651793013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qPCk4g3W8fX2UrYqx8Ha0jhj3mJEcwbKzn0C8s8q6fI=;
 b=Fi9zwscfMUMKkmIFjGFzvP3wKu1YfMyBGzY09zrmowrAcHE7KFd5tpMc
 V5to7HSyHKSWaADeXekuJv8ij9RnYbJkVnsOiVNbBRMIgxW/L4Ai63RtB
 fihR4pbWYuVzU0Q8YnUdW9IJ8/8yGz9s4pnDk53j1041OPmKdS3ffmhoW
 66LAwKa+yijGVoCTeTSoJb/uMgDo7R6+CuciugpmSqe2ku2SfLtZCjKtO
 v4SQfmEWYepj5jD8GoxcFQsIThKuogou84eaa2pRQIq5XSpr9C01Lt4GL
 9777Y0p6LLjQDE9AHZzflc3eCeQG6uxkHHNSbaQpxSb9d1bk7H7oQxJyN Q==;
IronPort-SDR: XMdxx3s3iZmfV0XPPCaHY6/EVVtKIQ3B6vhm6rilI253SLjsaZRsoDPT0+HkPMW84IJU5sqLuU
 PjgGhh65r1TJnJ3cgmrlOPLq44oRXpoh2rrd1OBWRa6b0YV+WN68EUnAT4+p1Jwa92zCVNdDK/
 EZAA8wqiM+BZ39OaThg+4NrXm+BVPNUVjBlWAJSB8m0qOwKIxDGiZUA7hf07ZvocPcToR6fla7
 kIo8L4A3bgS6MTPVLccoJye98BvCz0AdBaljr+q6ye26qK4hPvrlYoRNSAvOKRLxqJvQ076UFo
 vn4=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="278356869"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:23:32 +0800
IronPort-SDR: vLNvDJk1CmDhsgsIGFOGRGDrRE+2dodFYJ88R/ygzFYF+IYcKmrJU0BRRYCi+3PtopysbKIdXq
 g5GyuvwBaJQNeL/Xnc7ZkJYpKfeSgejsqr1bRpkggz5a8cr5IGRmCA2jICxLI4zLqXrQ5a8e+5
 tnbKBy7bRgMKHYE8s0y8eLxdU9eBquxSt9mtXQkkXH5Ym/xh5aYM0GIAbBLqKAPT4c/v2FiOc8
 cOZaX4vJTWvJkjz+H9IQS1rHRIF0B5lBr78+IU1Eet/niVK9hD03TW2L2bHrl81QXuOLLzwb6S
 pSzxKM8dzfj/D9i20ANUykKz
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:13 -0700
IronPort-SDR: Jsx5xyAgBuShn+TT5EHkbJ3Row0nrVGTjtZrsmAaVOTa6DLbfOriOc5uhUC+JcQDq4gX+8/M7j
 FOIqpc968I7fuJyAMGJFecKr96w9vQDydWgbbIorhjONwA2WYH58g3C9NpFGxNwV+Gxpg8jt2Y
 C1eG0Ct8l2XZUnopdhOJnzkGhabtozJfZIFyMRCtzsjKg0AaHY7ZD+iZx3o4lrc9s3k59HfpCA
 +X1vNb4qjopYaFxyMJceFRdNipKcMFeOjc1L3GkenQ3KQJzu6Sow2NLPXQuLqrHm4dprpSE+Q9
 b10=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:23:30 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 05/42] target/riscv: Add Shakti C class CPU
Date: Thu,  6 May 2021 09:22:35 +1000
Message-Id: <20210505232312.4175486-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vijai Kumar K <vijai@behindbytes.com>

C-Class is a member of the SHAKTI family of processors from IIT-M.

It is an extremely configurable and commercial-grade 5-stage in-order
core supporting the standard RV64GCSUN ISA extensions.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210401181457.73039-2-vijai@behindbytes.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 311b1db875..8079da8fa8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -38,6 +38,7 @@
 #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
 #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
 #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
+#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
 #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
 #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 047d6344fe..6842626c69 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -708,6 +708,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
 #endif
 };
 
-- 
2.31.1


