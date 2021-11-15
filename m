Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3674C4517B2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:40:02 +0100 (CET)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkds-0006xD-VO
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkad-0002QX-Gk
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:36:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkab-0002lb-KH
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637015792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6cf7aB4+QDSTk3uAaJrNRUpmepplRJF45y+7KCnkr4=;
 b=YDmQpI1PSRSpN9g1tlw29p3t5ANFweP06FNo938qeJY0SBy6cVzYjkHDfMx8hz8DUKjHaB
 5m6lmQhfdX8KHdEDQd/7KHlW2xBc/Qnzzp9IDWj7yOfFDgLHFLSr9q52F4R8t4XV4Bwoxf
 jYhbDPwXlOIPfCoQkCCCYXtrK4SlgTQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-S-cNtD4BNRSwaVRPLoV4Vg-1; Mon, 15 Nov 2021 17:36:31 -0500
X-MC-Unique: S-cNtD4BNRSwaVRPLoV4Vg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so239755wmd.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6cf7aB4+QDSTk3uAaJrNRUpmepplRJF45y+7KCnkr4=;
 b=d6NsJWKcbBNqaIlHSTJiL0aqgq4rj/IG7vfofJKXco5udMU1vsQDUfXs7xVOrRzQWe
 pRivQFRNf1U3yZ8/FUPrwwj+2TECR3RDQyDTy6wY+sLvFK3KQq89W0riZCvFTorCE5UE
 BoAOIpzPK1/4xB4hVNNoVtP9yEvOqHIzhC/D4SdyeL6Xe++pH9wyeXqBzM5eIt9xtR5c
 54qYdaGtqi5ekL8uqvYyUfZPpUmruOeuEIh7cKrxmmHxfzxtseKE0jgmtwEOji4r41l0
 fhhQNKNOsdpEVcI8Tyg1rnf79esb/fml46WYceFCIhSVaBtuY/3Q2ypYSPS1P/IZuOLy
 owRA==
X-Gm-Message-State: AOAM5300x7xQOXZRpPk18X3Q3U1lElWbDx3Z3IFOAMJxLwgBAcxBkAwn
 KRWcHhw0azxNPJEnARzdxgApqeI1YYhZwIkMk+H6UvUOcTi9usCrk6dcxgJkrg3fgJV7X4nOVYO
 iGGV9yunRUshuFEK0iB+8MoqEVD8sGiLuT3fZfmuzts2zdfB6RsRnfmU+uXUburay
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr3347020wrx.236.1637015789706; 
 Mon, 15 Nov 2021 14:36:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp0THh9QS5GhBlJIpP31oH7Lqvfk+SrHdf+46T7qGWHnOiBhQYHEg/b6dNN/bTl4AZ+fKEwA==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr3346989wrx.236.1637015789471; 
 Mon, 15 Nov 2021 14:36:29 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 i17sm627846wmq.48.2021.11.15.14.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:36:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 2/2] hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG
 Kconfig selector
Date: Mon, 15 Nov 2021 23:36:19 +0100
Message-Id: <20211115223619.2599282-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115223619.2599282-1-philmd@redhat.com>
References: <20211115223619.2599282-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TYPE_ARM_GICV3 device is an emulated one.  When using
KVM, it is recommended to use the TYPE_KVM_ARM_GICV3 device
(which uses in-kernel support).

When using --with-devices-FOO, it is possible to build a
binary with a specific set of devices. When this binary is
restricted to KVM accelerator, the TYPE_ARM_GICV3 device is
irrelevant, and it is desirable to remove it from the binary.

Therefore introduce the CONFIG_ARM_GIC_TCG Kconfig selector
which select the files required to have the TYPE_ARM_GICV3
device, but also allowing to de-select this device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gicv3.c |  2 +-
 hw/intc/Kconfig     |  5 +++++
 hw/intc/meson.build | 10 ++++++----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index c6282984b1e..76950c6f724 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -1,5 +1,5 @@
 /*
- * ARM Generic Interrupt Controller v3
+ * ARM Generic Interrupt Controller v3 (emulation)
  *
  * Copyright (c) 2015 Huawei.
  * Copyright (c) 2016 Linaro Limited
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 78aed93c454..010ded7eae0 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -25,6 +25,11 @@ config APIC
     select MSI_NONBROKEN
     select I8259
 
+config ARM_GIC_TCG
+    bool
+    default y
+    depends on ARM_GIC && TCG
+
 config ARM_GIC_KVM
     bool
     default y
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 11352806db2..70080bc161c 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -3,12 +3,14 @@
   'arm_gic.c',
   'arm_gic_common.c',
   'arm_gicv2m.c',
-  'arm_gicv3.c',
   'arm_gicv3_common.c',
-  'arm_gicv3_dist.c',
   'arm_gicv3_its_common.c',
-  'arm_gicv3_redist.c',
+))
+softmmu_ss.add(when: 'CONFIG_ARM_GIC_TCG', if_true: files(
+  'arm_gicv3.c',
+  'arm_gicv3_dist.c',
   'arm_gicv3_its.c',
+  'arm_gicv3_redist.c',
 ))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
 softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
@@ -26,7 +28,7 @@
 specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif.c'))
+specific_ss.add(when: 'CONFIG_ARM_GIC_TCG', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
-- 
2.31.1


