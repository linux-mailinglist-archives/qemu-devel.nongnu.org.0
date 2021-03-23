Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7317034671D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:02:51 +0100 (CET)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlMg-0006L8-FX
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMv-00074j-2v
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:01 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMq-0005xf-82
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id ce10so28266712ejb.6
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fc/Dd/qTuhlyfrWCSVhIMmkOAWAkiW0BiozfHOUPBs0=;
 b=TADFzYNVvxKQ63J8lLexDeReqSidkhcyrenrEaRcKzL/JTdSRYEKD5mwcI+1FIDiuP
 VZ7vSzBDQoUGLm2E3s1VjitFxKJE/QLlU+gmJRx2hXHD/FY4aoHrp8R4TLQT7Ov5jplr
 6+7a/V9oQlGBZmay74953zP3oTqnZL3NWqNaXWbfa+jRV5TSt/TpFHZFXCsM5hyui7bA
 adQZJI8oGDyXQALjjiu/nFBsPSFNwP+0VbnBROtRj3zYs8i6Q8EOASVmZNkyOdDcWbKh
 +Omm2liXbkPndV0WmHcGD4Ooc30S1on+fN0hGBBrqvr/k4L/y1XIXefQxGk7AULYUgns
 xi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fc/Dd/qTuhlyfrWCSVhIMmkOAWAkiW0BiozfHOUPBs0=;
 b=CUrQpHRCbQPBreSd7Qw5PGqBlhyWcgaR5QU6FMBsu4XWnFrUjBgpHdYzYKD+tb8fgZ
 s5SekI1Rsyl25HoMU2yp7UVIQp2ZVN6D8YHvnY/gsbhn1e323QP/kKPfrtF7VBzDWjuj
 iiDb077m0Ytrurml0Feu9nZhmKcTWRsy46RAoVe58OkarFzGgsUvQViCSYS4I/AGffSm
 VbMpCqHuXEXLReabjW/x21ppUyC2KEl+1VCzYD7t1lQdcuqWkPrfSos9Q2DoJKMT9eJX
 1nqXgtV8rbEreFKnmA9A/SD4zk5OCrufLpTCzQy1WwfTqG/TOAjb4LfznU4PTCQoYjJJ
 +D7w==
X-Gm-Message-State: AOAM5323Eto+LOOfcP/1RTa1XXbYQUHinDnTfeuI1NqC/u5mAJYTyYOD
 XlhPxP2MHbfZ+at7uChtx+nlhg==
X-Google-Smtp-Source: ABdhPJzyzbKk/vu82OH5BlbpGrfM+UHMjkwaPD4mgAoynGjESmV9xh3QEI0OE0+cR/GEopC+p2jOlQ==
X-Received: by 2002:a17:906:1985:: with SMTP id
 g5mr5743050ejd.285.1616518733921; 
 Tue, 23 Mar 2021 09:58:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w6sm11398859eje.107.2021.03.23.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF12E1FF9E;
 Tue, 23 Mar 2021 16:53:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 17/22] m68k: add the virtio devices aliases
Date: Tue, 23 Mar 2021 16:53:03 +0000
Message-Id: <20210323165308.15244-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210319202335.2397060-3-laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/sysemu/arch_init.h |  1 +
 softmmu/qdev-monitor.c     | 12 ++++++++++++
 2 files changed, 13 insertions(+)

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


