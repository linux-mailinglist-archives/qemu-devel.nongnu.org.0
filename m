Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E7347B22
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:51:24 +0100 (CET)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4qn-0004b8-07
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f7-0000K4-1l
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f2-0003Qb-Pp
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:08 -0400
Received: by mail-wr1-x433.google.com with SMTP id v11so24684309wro.7
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LYtY8WstaP7kuj1GgptrAmRoMMv/ADLOwkzOGpAVJtI=;
 b=FF3JMkf21WzUKirBnvrpbZOXU2adk8wVK070JInTbEddMbeeDtGnmf29eoNmWaeWbC
 8Y6Cyu7Nwsh3wXLFuBPUJcvA56iuYkIRN+3cjs+mEK/AutCLz3icE1m5YP1Je/odqFcV
 qiQotswVEb5xy+PjOHniOiIsWyVdibLANFvrZuhZgkojpqqegtOLaHdPU39GfEn99WQH
 DOWlvb2cw9pNwrofXG6E7f9YaKB3g5xS8aPsT3grHtRPXG9fOH9wzct1YJTj8GMluMHq
 OcntVhIYU0xaysHgPUZBC0C183sNczaXpilTzbG32lJ2TrNyfVq4G8rq2G4ug8pVi/M9
 27FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYtY8WstaP7kuj1GgptrAmRoMMv/ADLOwkzOGpAVJtI=;
 b=dVgdwIkPU7wC3Lh2Dv64jn7y/l3gG52VkJI7SErCaUmiOugjvcL5NM1BK9AyYoGMDM
 cTHmqaanNwByUZEy4/+aMBtZHaZCIMt7D1/IZQoR6Wn+C4961uymIkUHwq/zxRXSxTWn
 vFt2uqcF6aHr8NMcUm+YvCgnUweHx00fRntGWeSHjpnUDOGpGlbyV5K/O1qBlFNTrxDr
 XRGSQAaG/1CWokE6iDCSbP1N/KgsYotTCbEvf2+Q5MYejLzGNSiGpa0M70NvxmPHm/fm
 bi+ZulcDSd0X3orBy61mdMZNNdDPNhY/zLDBeWUOV2jdx6YeJ5NVfjWM4SGmclcJb7sq
 u86A==
X-Gm-Message-State: AOAM530aJ3/MlkS58HDAsF+6+1vgpzo6XvBMRnhsVhLlz003LKmyeK/z
 MMegBSsh1Vv5IbLCje+4u+La0g==
X-Google-Smtp-Source: ABdhPJyEDpcnJtnfiVhQzafaGytaviq53sqYChqewXrUZOBQeknNOWptGfOWeytxMO2ngERsjtVY+Q==
X-Received: by 2002:a5d:4710:: with SMTP id y16mr3919750wrq.344.1616596743365; 
 Wed, 24 Mar 2021 07:39:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j20sm2664934wmp.30.2021.03.24.07.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:38:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 57DDC1FF9F;
 Wed, 24 Mar 2021 14:30:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/22] m68k: add the virtio devices aliases
Date: Wed, 24 Mar 2021 14:30:16 +0000
Message-Id: <20210324143021.8560-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
define the virtio aliases.

This allows to start machines with virtio devices without
knowledge of the implementation type.

For instance, we can use "-device virtio-scsi" on
m68k, s390x or PC, and the device will be respectively
"virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".

This already exists for s390x and -ccw interfaces, add them
for m68k and MMIO (-device) interfaces.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210319202335.2397060-3-laurent@vivier.eu>
Message-Id: <20210323165308.15244-18-alex.bennee@linaro.org>

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 0c90706516..16da279696 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -42,5 +42,6 @@ int xen_available(void);
                               QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
                               QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
 #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
+#define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
 
 #endif
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 0b40c97c6e..a9955b97a0 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -60,29 +60,41 @@ static const QDevAlias qdev_alias_table[] = {
     { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
+    { "virtio-9p-device", "virtio-9p", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-balloon-device", "virtio-balloon", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-balloon-pci", "virtio-balloon", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-blk-device", "virtio-blk", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-gpu-device", "virtio-gpu", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-input-host-device", "virtio-input-host", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-input-host-pci", "virtio-input-host", QEMU_ARCH_VIRTIO_PCI },
     { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-keyboard-device", "virtio-keyboard", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-keyboard-pci", "virtio-keyboard", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-mouse-device", "virtio-mouse", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-net-device", "virtio-net", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-net-ccw", "virtio-net", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-net-pci", "virtio-net", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-rng-device", "virtio-rng", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-scsi-device", "virtio-scsi", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-serial-device", "virtio-serial", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_VIRTIO_PCI},
+    { "virtio-tablet-device", "virtio-tablet", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
     { }
-- 
2.20.1


