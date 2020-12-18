Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D562DDE8E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:26:47 +0100 (CET)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq9Dy-00029r-IT
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pq-0005BG-F3
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:50 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pe-0002GA-GT
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271614; x=1639807614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=edkHNzieMwACHyvxiGIRYzR0KJtKt3tQD9/6nXhexJc=;
 b=UcC6GnDGJWxnMlcV2OM1WCx8R3e0WE9oS7eJDUQ2Xq48O2KATUpZq0C8
 SFO+E9i7ERPACfkKwlWtGjt51zJdnODa7VyVR0+2pf5++1PGwHaclqF8T
 +97RrudInW8aPAgoMjYBZTTyxV8EgMFNJh1XeYZW7g2uPhcQpij077jNk
 WkQhn1uwkTMJkXjzU3PNdr5UZtbpCOurE4nZ9wRf5I+77fEvLIlADDw56
 BqcU4W8fPkm0UG64xIhoJRRt2sTNbiSpIHPRyWrbMf53RASy0Hpa1JP/g
 CCn1TQ1a24cYrMmSoG+bH1LBvvrsIDd4TC0vavuKBgK7V+aGFbFZL09vX A==;
IronPort-SDR: D9achIB84SMw2XMhqX1hNQUFEprL7uINjNoTc+w0Yzg7ZygjvjoANED890ds0Obnc5SzNKg+NY
 hu/fKyRYoSZ8pNJ1OeoJIGc2XEbJQyNnKe6i7XStLdbtuFCQg324aQvaknD+20fW8RcP3QWoLl
 A9LkZMR5BDA2uoHMS4rvPmctnvCt0WucGSAVEwZEtEGjE0tg9U7pcHyNr/mEuf+K13zJDjlN71
 f5s8pqpdhMhT76JVykring9yQJHauyOJLzMnQ2zcJ9XAmyynlGUNj968HvBkgZJz3MqEDM/H44
 9mE=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237056"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:29 +0800
IronPort-SDR: wbxbBL/Vf9lE/IDXYDAlhlK5QOnyddHADoTQXTsppgnAdtnU13plsArpGxYBnK4/ZxTGytq7fm
 wgq6LDakjmJO8fcXozZcm9lJ8sRYAIB+GXdxbNNzgl8QWxdgG/tW154zLVwF3zGTvxFagNs21m
 Q/axf7bhWRxajx6loHun4kof+/L0uBbeR93YiKoSluYB0pMc8POl5UsjCTHMm/QjoPuIFYxcQF
 o6ZJT6R+z+j8SaCtScig9MagkUl31ri9TSneVNmpQX0TbC3GgCF3l+vDC60HfO2b0JbdL9kmhA
 pC2tpsfIw+md0dMmIzfPP0FE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:38 -0800
IronPort-SDR: xMuK5ot+ksXsf7GyHe+zTVu+lxpmjstvelwbuRBCK1GieTgy2ejfI+eVzVhtFEIgpl1rYzGQt2
 MSfd190DXYzGKbmJeYDR4aJJ1ZtOdztuuFin7Hnt+0Hko9r0Eq43Z7WPmMAMfR+1FQhMs2tWlB
 py9ZT74gG6eLVgC2BpJYeoDf84US+tUdcF2wRpYi5w/va7579SYF4b5Rh82Vc+GWZW6CSIl4Sg
 rOOZKC7okJQdNdcYFeoMvJGiIuMtuwkcWZw0rf1/w1Q432V8Ir3IH7tv5FFAikaor89FT3HmT1
 8zY=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:22 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 10/23] riscv: virt: Remove target macro conditionals
Date: Thu, 17 Dec 2020 22:01:01 -0800
Message-Id: <20201218060114.3591217-11-alistair.francis@wdc.com>
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
Tested-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: aed1174c2efd2f050fa5bd8f524d68795b12c0e4.1608142916.git.alistair.francis@wdc.com
---
 include/hw/riscv/virt.h | 6 ------
 hw/riscv/virt.c         | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b4ed9a32eb..84b7a3848f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -89,10 +89,4 @@ enum {
 #define FDT_INT_MAP_WIDTH     (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + 1 + \
                                FDT_PLIC_ADDR_CELLS + FDT_PLIC_INT_CELLS)
 
-#if defined(TARGET_RISCV32)
-#define VIRT_CPU TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-#define VIRT_CPU TYPE_RISCV_CPU_BASE64
-#endif
-
 #endif
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3cc18a76e7..3e41dbfd3c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -704,7 +704,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "RISC-V VirtIO board";
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
-    mc->default_cpu_type = VIRT_CPU;
+    mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.29.2


