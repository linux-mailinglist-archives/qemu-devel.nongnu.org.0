Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479DF67159C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3FX-0001rJ-BL; Wed, 18 Jan 2023 02:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FV-0001qh-H2; Wed, 18 Jan 2023 02:52:45 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FT-000228-3r; Wed, 18 Jan 2023 02:52:45 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MTiLj-1pA79X2nRl-00U62E; Wed, 18
 Jan 2023 08:52:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 03/15] hw/intc: Move some files out of the target-specific
 source set
Date: Wed, 18 Jan 2023 08:52:22 +0100
Message-Id: <20230118075234.2322131-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1qiBwNSzoDFSblx92XfC9mUCpEenPVaYdBNiwFjugvOyKjPA5hL
 LgmHsFOfw+E//015rNZ0BYDhBY+pXF9c0d8bAlkEnGRwliftxTTSCCutOgsrwuqyxi/qjWl
 AnDS6CoBQnkh3KOtOl4StOFGGKZ3h2dN6bW+WxrcZdobgtpwrKCOJRIdozXwWjjX1qUjwxn
 HvcQCQHtmujedudkICGsA==
UI-OutboundReport: notjunk:1;M01:P0:1TT3JVM73m8=;FYEu2Fh8oLkpn833JLyzydo9Dmc
 hq4sNnIYeXEdEQ3dx4c3g3JGpVnGDU9Zo9YuPURnMFmKNLgC4APQw6aQN+tKhhw2yPxNoFRDm
 Fdwcy3rWX+3RZykv3Pv4atkJld8+ojuYOFZ0LXeoDYfN2k6jVpoPTQa6TYf9pQvSqvzIJDGbu
 vJuM7b+CwDp41KdKO91yl8PAJ9+pE+FRfzvSzV4vtkNMU+fCFHhsP+7h65fiWNXcuD0DOq6EJ
 0Q+NBzo8MVStBV/AMMQ3/D5UctoMbmC7KGnfYtvOAprmdwox/Sili5GB7S/7ZZtJuHzt9f8tP
 K4Hs2HAD2wwe9QKkeyAgyMBeK3uQDSWRvLLOKdkK0y3E1JPrAnglwtZw9vYruVj0Vl2LxGomB
 K3Wtlfg3qXz/Jz2kBVrOty+tduvv7LDQYVRdewgP48J0KdkuttFkanj5z5Y4QJfxCGiHpnMlq
 rEwaclKt+gCg3LfYHma1mQ0KtiFHfQDvS91H5iUE4UfnXF+JuXC7eQ3oyr2thQgx1Ax6cQbhU
 d4BoHJBLPOB9lUDUMRsb0bOfAiCr2PtwzZ4glQ3FNiln0c1Gv+4pyX5aoU2R6Mvze6u5OvTBp
 oII8gMWKDlHhyQn2VSEiu1nHleXfuI0w7IUnydGStIreMSZfihEsTO/cg2VIMJEIky3H2WyHD
 UPZxO4Yz/QLW1E7HLqNScUibezsmu95f1zMB8uvsBA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The Goldfish interrupt controller is not target specific.

While the Exynos interrupt combiner is only used by the ARM
targets, we can build this device once for all.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209170042.71169-3-philmd@linaro.org>
[thuth: Change patch title, and also move 'exynos4210_gic.c']
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112134928.1026006-3-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/intc/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index cd9f1ee8880f..0988cae8ab06 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -13,6 +13,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
   'arm_gicv3_redist.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
+softmmu_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
@@ -39,7 +41,6 @@ specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))
-specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
 specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
 specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
@@ -66,7 +67,6 @@ specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'spapr_xi
 specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
-specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
 specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
 specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))
-- 
2.38.1


