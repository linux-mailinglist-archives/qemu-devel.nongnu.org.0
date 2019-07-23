Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864487165F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 12:43:20 +0200 (CEST)
Received: from localhost ([::1]:41106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpsGN-0007HY-9B
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 06:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39671)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hpsF4-0002PF-1n
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hpsF1-0004CW-Qa
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:41:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36892)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hpsEz-00049C-LF
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:41:55 -0400
Received: by mail-wm1-x331.google.com with SMTP id f17so38029614wme.2
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 03:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k0cRgpglCD2PcKK9Njfjp9ahbK4mgT1ZXlX00pGzzsc=;
 b=iSbO1Q5+/Yo9C3K/uq/3MxLeuXxOvA6mG+XkKyUaR0L0mCcTI28nqav4GU7XnW27e1
 MRrVx95yJ1XY3uvUIxagXKzrYTphlj2OfXUd47LvTlgDeIFRX5yqF/nf4IyFnOqX3RrW
 Q9ewxx2pTuD1Hr6c7fqZaDMaxsMhU8rl11YT877zWMoKNp/x8LQ4eT7hRBoIPgX4okd+
 +fbrDZwnTgkaPV20r08uPPApf548SOFASEqcRO9nyYMGR5kuxo+C+u6FkrgcSn5rTS3D
 NX8bQOCvfci5m+/peQDjvTXa2Fpww+1YLokEIV4ieKjVCn9M3oqhkmsCE4MK0ia6mEqi
 twrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0cRgpglCD2PcKK9Njfjp9ahbK4mgT1ZXlX00pGzzsc=;
 b=YNdgVMUfkVemAuo8xXDXYziNdPOCub1XOp+a9ESSa4DiHbVIyCWJENuRi/Z2NW9x2T
 zdjGdn6jRbTjuz0DhhvbLJ7rpiZJ4jh1FLzxju9R6NKiUi2/J+8aD3lG/GoxGLF0neI9
 gh/h3aeN1OMCgw2t2n7VmemCuewqDWfxi4a2QviiTVhD0xE0Rz64jU3VroCFISRfYGTW
 pZW30sde0eAE6bwTDsTz3wZsCxVvwK962jAW+22iX3JroDrN6v1tBdHjIQQOBZMc3Z+s
 t1ubKV0ZpoIf7jmM+AFK8Lu+OtciEoQXsmEC+cGvILZdl8gk1Mw0oX4T9ZBhI6RGaKJ9
 yg7Q==
X-Gm-Message-State: APjAAAU3nvxX4+7hBEfxo89pQnHmOxMzngTY8LTV/P9ykEhEBffjzM14
 4cCMp5y0RLm+pG7FdyOfgv5FPw==
X-Google-Smtp-Source: APXvYqx62NgTwNNfqzhOHz98GjHxgW3n/2nPl4w2nQS1nS6Qiu9Z2PLlV9rndwAZ6LKK5V1usSn5Lg==
X-Received: by 2002:a1c:1b97:: with SMTP id
 b145mr65323798wmb.158.1563878511302; 
 Tue, 23 Jul 2019 03:41:51 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id g12sm59382890wrv.9.2019.07.23.03.41.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 03:41:48 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB1731FFA3;
 Tue, 23 Jul 2019 11:36:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 23 Jul 2019 11:36:06 +0100
Message-Id: <20190723103612.5600-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190723103612.5600-1-alex.bennee@linaro.org>
References: <20190723103612.5600-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
Subject: [Qemu-devel] [PULL 17/23] hw/i386: also turn off VMMOUSE is VMPORT
 is disabled
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 97fd1ea8c1 broke the build for --without-default-devices as
VMMOUSE depends on VMPORT.

Fixes: 97fd1ea8c1
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index b9c96ac361e..6350438036f 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -52,6 +52,7 @@ config I440FX
     bool
     imply E1000_PCI
     imply VMPORT
+    imply VMMOUSE
     select PC_PCI
     select PC_ACPI
     select ACPI_SMBUS
@@ -59,7 +60,6 @@ config I440FX
     select IDE_PIIX
     select DIMM
     select SMBIOS
-    select VMMOUSE
     select FW_CFG_DMA
 
 config ISAPC
@@ -78,6 +78,7 @@ config Q35
     imply AMD_IOMMU
     imply E1000E_PCI_EXPRESS
     imply VMPORT
+    imply VMMOUSE
     select PC_PCI
     select PC_ACPI
     select PCI_EXPRESS_Q35
@@ -85,7 +86,6 @@ config Q35
     select AHCI_ICH9
     select DIMM
     select SMBIOS
-    select VMMOUSE
     select FW_CFG_DMA
 
 config VTD
-- 
2.20.1


