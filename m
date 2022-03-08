Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF134D203E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:27:43 +0100 (CET)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReYg-0001Vr-72
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:27:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nReWA-0007WQ-16
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:25:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nReW6-0003qP-Lv
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646763901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9eHzE2Oeiv8GnAde9Vlt7vdxFQ1ZbGYXgwrANjAz7Fo=;
 b=GkM4/6kW8urqhGfdLmrPeKx5+sZGSaFtkbg7co3cQiiCiwdhomuAzXVNR/vAMxcI/k5TOh
 dnMXho5QTK49e8gdHYCrSLp1s/+IDdcOPR3OB/6uQ5tyQbEGfp6qESx3qv501AkabsmKYh
 4gtfCr/qPVKevSh7g8Pgpw8lTCLjneU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-fOlLW5j6MVqtDN7bLz3lTA-1; Tue, 08 Mar 2022 13:24:59 -0500
X-MC-Unique: fOlLW5j6MVqtDN7bLz3lTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C37C1800D50;
 Tue,  8 Mar 2022 18:24:58 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B902886C44;
 Tue,  8 Mar 2022 18:24:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
 drjones@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/intc: Rename CONFIG_ARM_GIC_TCG into
 CONFIG_ARM_GICV3_TCG
Date: Tue,  8 Mar 2022 19:24:51 +0100
Message-Id: <20220308182452.223473-2-eric.auger@redhat.com>
In-Reply-To: <20220308182452.223473-1-eric.auger@redhat.com>
References: <20220308182452.223473-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

CONFIG_ARM_GIC_TCG actually guards the compilation of TCG GICv3
specific files. So let's rename it into CONFIG_ARM_GICV3_TCG

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/Kconfig     | 2 +-
 hw/intc/meson.build | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index ec8d4cec29..a7cf301eab 100644
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
index 81ccdb0d78..d6d012fb26 100644
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
2.26.3


