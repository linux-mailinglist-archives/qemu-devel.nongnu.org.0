Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D5671590
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fc-0001wl-Rn; Wed, 18 Jan 2023 02:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FX-0001rm-Hg; Wed, 18 Jan 2023 02:52:47 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FV-00022l-LC; Wed, 18 Jan 2023 02:52:47 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MybCV-1oWQoH47OH-00yynK; Wed, 18
 Jan 2023 08:52:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 07/15] hw/intc: Mark more interrupt-controller files as target
 independent
Date: Wed, 18 Jan 2023 08:52:26 +0100
Message-Id: <20230118075234.2322131-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1dBPmoAzHJTZs82nfWcfQm1PIe/ZhDN9XSSHaaUMSDcWqlJ1wcT
 /nL2mZUkEoJQdOoFeowq7ha+8+zRPPSH4/aJu7EmW9XxjAOHNlKODHPlBrUrIOMfU9vImi9
 B/+X3EkKhGinBeQHAcBX27RSS17f//RabAUaTMZuwDKi18RYgAIFaCWn5AUcTYVAa+B972g
 Xy0JYmzvW9hauIVx4rdSg==
UI-OutboundReport: notjunk:1;M01:P0:c4NQCdvE6Ps=;a3NTXS5Plo5j3CCNY9s4DFPnPHT
 4WAOjaJimThnnENvIhdLnIuldbHFOE6GFwR0gZq/h8zDWTfjj0qneNo7NM+7ZwNtX98S8V0J/
 qEJJW0874/sQeb6Xzk+1mqslhlhs2PJXqou0VYY19SfNachfthzArZtWkya6saE2d6Q6R4SEs
 BNbCbu7Ko0PnAErrAaD1qgF1rc8tDeikI72bGDaLjz6mvluTeRGvfiwYRXGzMwMcKv66pZQWp
 IBuL2a8lfAVMVXekzXoDClqvoel0LWOBIdY2JHq1p9p9jXmen9rcAgjuP4YoniGd5zx/GUaf5
 gxSWG7zsQa1f0oec/OjTFf0uFsKFsHYHXC2I1VU2wL7GcDyiPAFLPJRiNaMttmnuC+hLWTUde
 2h1wOe8s1XppotWAme5Fsnxl/v4Nc4TdK+lNaDGyfPU0tZyxtmG5OCRxX/BVqdoA5fXnDqoQY
 kgDhNOTeIEMGRxu6lu1MqKrQYLWrckm2AFZGkHjQu1VGx6zz3yFIiPVlJFx+CVP6cJ9nrMND1
 cpt1SQyU8pRLm9iUf4DHd04LFShRh6a6pybBVHNFO7VvreaXEDLmZicq1QF4pHYm04gQFltp8
 yGY1rlTXBqjxO76KGJemhxXvGi3VEJuwMtroBEyg4dyq7EPHoaioBhGDOaM76fjRzgvTp9Qen
 qETxnFM0I9XlBO1lqsaro+KOec5GB77LLNBMzgyzCQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

Seems like there is also nothing target-specific in here, so these
files can be moved to softmmu_ss to avoid that they get compiled
twice (once for qemu-system-arm and once for qemu-system-aarch64).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112134928.1026006-7-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/intc/meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 0988cae8ab06..8be459b41c6e 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -12,6 +12,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
   'arm_gicv3_its.c',
   'arm_gicv3_redist.c',
 ))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
 softmmu_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
@@ -19,8 +21,10 @@ softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
 softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
 softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
 softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_gic.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_intctl.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_intc.c'))
@@ -33,25 +37,21 @@ if config_all_devices.has_key('CONFIG_APIC') or \
     softmmu_ss.add(files('kvm_irqcount.c'))
 endif
 
-specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
-specific_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
-specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
 		if_true: files('openpic_kvm.c'))
 specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c', 'pnv_xive2.c'))
 specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
-specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
 specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
-- 
2.38.1


