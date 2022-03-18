Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1CC4DDA96
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:32:44 +0100 (CET)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCih-0003aU-U1
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:32:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZe-0006RR-7c
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:22 -0400
Received: from [2a00:1450:4864:20::431] (port=41793
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZc-0002Bl-LT
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:21 -0400
Received: by mail-wr1-x431.google.com with SMTP id h23so11119140wrb.8
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rAR5UrC/EDjfSgwvecxgN1md0yBcDrI2n/IH7Cc540Y=;
 b=o1uw5syHWkVL9yTWMPTMADkUnyqKUQGRfKNY7R9INmqVRqRTRCXRqwzztLCDJzCLSq
 yoWlOYLgGiBAFFxHcvIFIJ+eqMzU5VVNkQkE51y+1rVO7JNw/p8WLl63xprI49jSOUFB
 jHkLLExxo9LLnedM55rti7tLkpLa/moD9R6WBAzS7l02Q+vSd8pm7rWX2wWATCxkOTaI
 v5Y/EvPHbBOyMZBBQ0lgXIvyhTn+CAOHqSHSm4Lif84yqi6b/2jP16VAQzwdpPvRdrkQ
 eryE6HkouC0hmhi7rbh9syAw8Ccqb5VsRPGy5JT/bz93vtx6Ysk3G3RgMAjee10lMpmC
 gIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rAR5UrC/EDjfSgwvecxgN1md0yBcDrI2n/IH7Cc540Y=;
 b=5rcOFaPg2bPUpDZ3W184lMHtJwVdJfGCPXN6XwhTxU6zMwErvkpBuug5VC8NJXRVPj
 x6fnAl7bGCTXbJ3L+m+xVge25rSUU0LpynqxphnoPzEh5GLAsdQgMbam1iS6hoPihMWu
 C/CGuH+wZwzSygCfHhcgMewvzcAf9zksVqaB3i5K9dXKCfyET8qyFV68bEhv4RAflVlv
 n5zsOizJrCck5nxCzD/8XUkqhSbyysHGfjof+EIlme4iMMtzb6c7+6aoOOpn4q+UDsNG
 3wR7ateHKQzJ2oqAAR+fjtBCOC0e0tI2Z8sKz+QwqS8GUc/oGGBKDmrbuz0MUBL0sSch
 heoA==
X-Gm-Message-State: AOAM5321ZE2Bbh4QXpRpkOD5mlOWEPVGu50OfDv7ktM3qXbBnirD1RX9
 GQg0idDxWOHjYG3MTqvhHyAjgYHO1IuF6w==
X-Google-Smtp-Source: ABdhPJxMpwh9jG4pUL46dqRdmYxCVh7TZd1fHNJAoSxxV1YnW0H27EqOpsJkrcuP+kqbq3xpv4vtEg==
X-Received: by 2002:adf:bb54:0:b0:203:e244:fbe4 with SMTP id
 x20-20020adfbb54000000b00203e244fbe4mr7926178wrg.313.1647609799326; 
 Fri, 18 Mar 2022 06:23:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] hw/intc: Rename CONFIG_ARM_GIC_TCG into
 CONFIG_ARM_GICV3_TCG
Date: Fri, 18 Mar 2022 13:22:54 +0000
Message-Id: <20220318132306.3254960-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

CONFIG_ARM_GIC_TCG actually guards the compilation of TCG GICv3
specific files. So let's rename it into CONFIG_ARM_GICV3_TCG

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20220308182452.223473-2-eric.auger@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/Kconfig     | 2 +-
 hw/intc/meson.build | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index ec8d4cec297..a7cf301eab2 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -25,7 +25,7 @@ config APIC
     select MSI_NONBROKEN
     select I8259
 
-config ARM_GIC_TCG
+config ARM_GICV3_TCG
     bool
     default y
     depends on ARM_GIC && TCG
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 81ccdb0d78c..d6d012fb264 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -6,7 +6,7 @@ softmmu_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
   'arm_gicv3_common.c',
   'arm_gicv3_its_common.c',
 ))
-softmmu_ss.add(when: 'CONFIG_ARM_GIC_TCG', if_true: files(
+softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
   'arm_gicv3.c',
   'arm_gicv3_dist.c',
   'arm_gicv3_its.c',
@@ -28,7 +28,7 @@ softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-in
 specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GIC_TCG', if_true: files('arm_gicv3_cpuif.c'))
+specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
-- 
2.25.1


