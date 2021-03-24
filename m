Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539EF347B29
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:52:54 +0100 (CET)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4sP-0007gf-Bs
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f4-0000CQ-4t
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f0-0003Ou-Or
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:05 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1321639wmy.5
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y6jHpz4FecCSC+FwcChPhRloSKRaxaISexMbz45msss=;
 b=Ja4y9P2CmAEu8kWqsU/GZzgogLXI46BXAzYVbD5Y8X1u+S449cRlQGx8DH2TUxY2aB
 MryLzOZ+sWM1wjt4zBg6783INd4+TKrYL6weEkaHKQCpMMfdi1pDvOSfxbXwjXVTYB+E
 RcNu6kiIPNfxO7qLeBLVoLkZkkBsx8tEn9sJBItkhKZhXiv7Q9iPeYUAgX7goAhuaJBO
 nwBunoT9IMe2xhHUrzFINugVXBZb5EA2O2uhVjzh9ClSdoUC+QPoKDglikV+1pCEzFOR
 dXbKuJodK+sqXQzOW1R6O1ptZiH7HAlITHmINX2nBLXt/igFh71RSY9P0mgb+CXtOAME
 Nf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y6jHpz4FecCSC+FwcChPhRloSKRaxaISexMbz45msss=;
 b=OCEf7i2SGuVx3HdGlSKslXH9aHvNcBSYpq6+Rpl93u9+tV+sICIn/Xk3u0XDHdiN8J
 Sg3T0r2IbBX6uAJwC2O+a+9gl1651vNtJbOf1yqoJObpdNPca8CJAcLPoYqLg/5oMIUH
 HIeRFgTb+FYu7ZRqbqzPzAzecnqtoDExoUuy7p6Qwz412r8OuZwt9lztc8qsqIcA+Mam
 LJG+CEjuZNzt6tfzrCie8MEoJdmzO2lapS1SdDc2D3lb35Ufhsp23ZTzsfNtDajX208A
 z9JO//DamqUOLfvnJnWya/f033d25Dhrfluq7ORtIyYfiBt87zAJSPk7qzYaopjhIbYD
 xroA==
X-Gm-Message-State: AOAM530Pdncy6qbV7huSBwafWHQGtNc9cGFuA/NMGt6ctjjJSiv3lsrI
 aUzxbc2TxW3nRdFNXkD/VAHxnA==
X-Google-Smtp-Source: ABdhPJx9ti58q3tTvx9S+I86H74lEIvDfBQavOujRF6Y3kq18rCxYT2fnnHcabK6w7ClDwjiH3uf/Q==
X-Received: by 2002:a05:600c:3515:: with SMTP id
 h21mr3317745wmq.9.1616596741240; 
 Wed, 24 Mar 2021 07:39:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k13sm3714848wri.27.2021.03.24.07.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:38:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 401B61FF7E;
 Wed, 24 Mar 2021 14:30:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/22] qdev: define list of archs with virtio-pci or virtio-ccw
Date: Wed, 24 Mar 2021 14:30:15 +0000
Message-Id: <20210324143021.8560-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

This is used to define virtio-*-pci and virtio-*-ccw aliases
rather than substracting the CCW architecture from all the others.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210319202335.2397060-2-laurent@vivier.eu>
Message-Id: <20210323165308.15244-17-alex.bennee@linaro.org>

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 54f069d491..0c90706516 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -35,4 +35,12 @@ extern const uint32_t arch_type;
 int kvm_available(void);
 int xen_available(void);
 
+/* default virtio transport per architecture */
+#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
+                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
+                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
+                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
+                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
+#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
+
 #endif
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 8dc656becc..0b40c97c6e 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -60,34 +60,31 @@ static const QDevAlias qdev_alias_table[] = {
     { "ES1370", "es1370" }, /* -soundhw name */
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
-    { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_S390X },
-    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_S390X },
-    { "virtio-balloon-pci", "virtio-balloon",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_S390X },
-    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_S390X },
-    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
-    { "virtio-input-host-pci", "virtio-input-host",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
-    { "virtio-keyboard-pci", "virtio-keyboard",
-            QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_S390X },
-    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-net-ccw", "virtio-net", QEMU_ARCH_S390X },
-    { "virtio-net-pci", "virtio-net", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_S390X },
-    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_S390X },
-    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_S390X },
-    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-    { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_S390X },
-    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-balloon-ccw", "virtio-balloon", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-balloon-pci", "virtio-balloon", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-blk-ccw", "virtio-blk", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-gpu-ccw", "virtio-gpu", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-gpu-pci", "virtio-gpu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-input-host-pci", "virtio-input-host", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-keyboard-pci", "virtio-keyboard", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-mouse-ccw", "virtio-mouse", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-mouse-pci", "virtio-mouse", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-net-ccw", "virtio-net", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-net-pci", "virtio-net", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-rng-ccw", "virtio-rng", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-rng-pci", "virtio-rng", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-scsi-ccw", "virtio-scsi", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-scsi-pci", "virtio-scsi", QEMU_ARCH_VIRTIO_PCI },
+    { "virtio-serial-ccw", "virtio-serial", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-serial-pci", "virtio-serial", QEMU_ARCH_VIRTIO_PCI},
+    { "virtio-tablet-ccw", "virtio-tablet", QEMU_ARCH_VIRTIO_CCW },
+    { "virtio-tablet-pci", "virtio-tablet", QEMU_ARCH_VIRTIO_PCI },
     { }
 };
 
-- 
2.20.1


