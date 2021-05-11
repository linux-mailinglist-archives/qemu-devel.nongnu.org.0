Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB7837A530
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:54:00 +0200 (CEST)
Received: from localhost ([::1]:59280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQ1W-0008D1-CH
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWd-0001iN-Gi
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:03 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWZ-0006TG-Hp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728518; x=1652264518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eY64W9JB7jnGvaakjv5BADNjhl2X/P3bfdlkpxmil/8=;
 b=rDheA8St3yi5MHWPTIHSd7y/np43F0AeL6lwY3LQq/t5bsGe3lg0GtO4
 3oefXXNMLzbQLHqFjDfUeGKXsKlQb7urxe/yBC+i8IGtl/zAIV9258XUo
 urPe33bNVauclE0tIyP3wjqgoYBTLeE5SAFLF7KugSyWoz9rMJIh0VKoA
 iJXy+MIxgTY8E3NH60LYGtyJMGZ3R7Gp9H8PJ3IS2oGo/mUp95aAOqF5f
 GzUDqATEgsVPNuRBaDDd6Vu826iMm39A8k3UbM7Tng7w1fLJJ+RkEfjXp
 QwShS0LE4k0GoFmvp/XpzyIylA4w7jr80OoCt9s3qI88MRqkWwL7NJEQS g==;
IronPort-SDR: XokblxMn8TX098q3+Y0m+HCQYE43yp9TtyBHw5ipw3xr0wjcHbjBLdCMiRPmdVLOryPrGyvjMN
 zMttsyXViRQM3Y4J7PcOHkOhL0+VvfrJfE5NkzH07L5PWRdozt5kph3EpUYbXB/wPXz/vQUFKt
 BZGOhUCd6o87mR12BuRUwAowH7yTa4HBnbfP+pHY5DfDKV0apOd3lcvgsy0C982GBCbTcVhuF+
 FDRUdujBXD1jBVZWY+PKO8RTDjG1wQ7W/rfoeT0k7TjIFom+NaFnkTHMdmPanmZQOIUFbq+pdZ
 vKg=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735443"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:24 +0800
IronPort-SDR: WkTJQlaIVVVMnOGb20f1vf0wqEmbVMMW10jcB3wzGx0N5c8pBognO4iGaa0oKFc5k22QuScfBg
 ivJm7ytYAACzGZqRTQymOEuItn1L6qAmEGr1ER5boyr1g/tnEvrjKHeDwDRV+MVLQNB3uAxVt/
 WHww4q45y1/1ahaznCF1IFtOfQXDlBQW6SD9VJDs78L0b5tt463IysbUMtxdNTaKhwBBFmgUo2
 g6t87X/IN+LDDvOr+dyOg1ME8udrMG/xIjK34fYtqsAEJM5S4vDtNvSjoRnVt/3dAVzoAwtweM
 FlnJfgW9Y1czqjAZMiDpbnSd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:24 -0700
IronPort-SDR: m6qPRz/GwDRerIH9IML6ayzdwOW40GztvQvcH5J8+XaNb7aB/aa3FK03cAPMp8Q95eIYF0gT5b
 x4hOMlifGzNHDTbLjgB2Pb9d1OiNsrd4S3lBHTRKR9Ya+yriie5O8raz2moS3ES4B6oxvYYGs2
 YXfON/95Va2W0OTLGvPlGu4pNNTrRJLormP6tzwi0QWfxGvxghayJJMcmo1dbYQtFugMRlIpNc
 Eq4P3jp/y5JxixP1kxrka54+jYLf1Yg39E8jkpQozUdA3La8VfO+7FQEN6QlWU45cIa4k8G4ly
 TMk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:22 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 25/42] target/riscv: Add a config option for ePMP
Date: Tue, 11 May 2021 20:19:34 +1000
Message-Id: <20210511101951.165287-26-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Hou Weiying <weiying_hou@outlook.com>, qemu-devel@nongnu.org,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

Add a config option to enable experimental support for ePMP. This
is disabled by default and can be enabled with 'x-epmp=true'.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: a22ccdaf9314078bc735d3b323f966623f8af020.1618812899.git.alistair.francis@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 83b315e0b2..add734bbbd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -304,6 +304,7 @@ struct RISCVCPU {
         uint16_t elen;
         bool mmu;
         bool pmp;
+        bool epmp;
         uint64_t resetvec;
     } cfg;
 };
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index e530df9385..66787d019c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -412,6 +412,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     if (cpu->cfg.pmp) {
         set_feature(env, RISCV_FEATURE_PMP);
+
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        if (cpu->cfg.epmp) {
+            set_feature(env, RISCV_FEATURE_EPMP);
+        }
     }
 
     set_resetvec(env, cpu->cfg.resetvec);
@@ -554,6 +562,8 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.31.1


