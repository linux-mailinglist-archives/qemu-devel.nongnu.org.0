Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542624B38E9
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Feb 2022 03:19:39 +0100 (CET)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJ4UE-0007HG-F9
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 21:19:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4So-0006aO-Sl
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:18:10 -0500
Received: from [2607:f8b0:4864:20::102e] (port=54906
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nJ4Sn-00015n-Al
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 21:18:10 -0500
Received: by mail-pj1-x102e.google.com with SMTP id on2so11385995pjb.4
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 18:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+UTBf2yhJBIfMqKcblD9Lu0E7+J8Wpn06/z43sTP/s=;
 b=cII0Id7JVAfuOrb5PfVZcTTQ+KjSbLdCaSrtXSWuqyWZ3Ywj9smjKwM3LwoyQVi6Kt
 xPYmiQM+ZOCLaSn/xY83fiUnKs8TLUAiZxoqGK2CBQZEcbd0G+gabPK7h+pWzt9r3pXI
 kXIaKdl6JnMMCCkhVGgGiv4NP3CdIKKVSqdZIn7IO3XjJf496+KsUmbRh77GvIaABNwN
 yowuTW4ExqW3+UUjXgE3OHQ+gWNF3yE23FuwX6xkp3AuUYlpUK4k7qqrsyLO1XwRsBkd
 z2x0mmMkBQtLtEJNRT/szxu7/s3K4ZiUDhttI51oSyETt8gsb9vnvyZcNP4XLuSY/iuz
 V2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+UTBf2yhJBIfMqKcblD9Lu0E7+J8Wpn06/z43sTP/s=;
 b=SRKo8hubT+fdf3hGxZX6ytfiUUJN8cHmtia3XM5UbpaWpPNu8Q1PqpjJsUl6XdEnCi
 9Ugb0Sxhk/eS6KSiuhSpbK7aCR1idhiahappLTaoZmpdFLWgrQae1EL1yX8hexiGHWpD
 q+AXwezMQ1bBeOavQP+xYSEN5pd0gMKBPNsJ9VjLacFtfT+oxSq7VvWGepveh1ZrtCTa
 vMUuk72OYSrgemTvntGMhDs1diWwLa9qz15KHVcoZefw/ZFNX4wukyFvgozua1xiVnNl
 W4/9mddgiGWDD9JknIdiOXjigl8omB19Zh30i7z+VCCG5z06gTh0wHXDotCHM6184P6c
 TWZg==
X-Gm-Message-State: AOAM532ZHy6exm7f4Ele4TN08SWKMbijTQ2Xkmir0ZNRhY8CBl+U8VdX
 zKNAFOvmInmg6VxiyAWyctWkdMemdgM=
X-Google-Smtp-Source: ABdhPJyvkVEtAkLQNVCB4xxaqgYLRKriBFShIX0+nxyBpBx8ZvrFDnwy9rw8vEQTKP3/sEC2Q76ojg==
X-Received: by 2002:a17:902:f291:: with SMTP id
 k17mr113549plc.45.1644718687867; 
 Sat, 12 Feb 2022 18:18:07 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d85b:35dd:dae2:b7a9])
 by smtp.gmail.com with ESMTPSA id 38sm23012182pgm.37.2022.02.12.18.18.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 12 Feb 2022 18:18:07 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] softmmu/qdev-monitor: Add virtio-gpu-gl aliases
Date: Sun, 13 Feb 2022 11:18:00 +0900
Message-Id: <20220213021800.2525-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 softmmu/qdev-monitor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db57..a0df820b9de 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -83,6 +83,8 @@ static const QDevAlias qdev_alias_table[] = {
     { "virtio-gpu-device", "virtio-gpu", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-gpu-gl-device", "virtio-gpu-gl", QEMU_ARCH_VIRTIO_MMIO },
+    { "virtio-gpu-gl-pci", "virtio-gpu-gl", QEMU_ARCH_VIRTIO_PCI },
     { "virtio-input-host-device", "virtio-input-host", QEMU_ARCH_VIRTIO_MMIO },
     { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_VIRTIO_CCW },
     { "virtio-input-host-pci", "virtio-input-host", QEMU_ARCH_VIRTIO_PCI },
-- 
2.32.0 (Apple Git-132)


