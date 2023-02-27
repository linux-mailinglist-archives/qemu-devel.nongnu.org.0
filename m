Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6496A4485
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFS-0002ZX-Dt; Mon, 27 Feb 2023 09:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeED-0000NI-EM
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:47 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeE7-00016v-I7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:40 -0500
Received: by mail-wr1-x436.google.com with SMTP id bx12so3215845wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WAAv2NL3QoMZlMFQUgIQZmf6j2u7rmtL1deiCwTIQao=;
 b=Flrp+z/LvNgumA1/pzbnMH5TZrPJToCPEZbnF3PEImYcYLoQ3Fy4S1pfWjPtlXE2fD
 u+9SZ2ZVCPguQV7TtUL2pjoidLpHukvgnFaTyftfH9idc2q1gzaDSmzcCeI/4Y+uNO3g
 VI22PZm/k3TM09b4uud55IC5GXfISyw6dk2BBVzAz8i9kstAuAg04rScqQgXOXZSjMRy
 BE+cKN7HgV0VF/39UDNEThVw4V+UZoR3Z5uT/FYlKTt7AYgAKpzg5zhTeFwzjz4Us8UV
 PMLNWiPvj2MFsACAvheKyJd/5doe4p84uO2i97uB7b3fPM9FcmYoq2jJ2SPWO08voRw/
 7A0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAAv2NL3QoMZlMFQUgIQZmf6j2u7rmtL1deiCwTIQao=;
 b=d+GFFT3ZrXmJyIbiSl+wmc0FRxEPbMXjIUl8uUX/nnp+m2pcyBP6Vq3UHkTTudpdk2
 n7ByXy6RN+6RrUw3LVo9/3k7x5Rra1iHXqtlcbaS4Ni+YTnRh2aIIGVuHCQb7P2G9YsH
 aaLgYqNYAW7bzzs2frWyaPisUB0IjHdREt+IN7ma4VfJGW5F8H2I2E1pc2nvYx7HfgnG
 zOP/XsylVJ21IODjF39HxlmoP9amxmoJSXA9M1Zrho6Fk93u74hICAIexxRfNfc9R/h4
 pNIX79p/ZTsvAuKv2LUHxdMWo93frdwp9+6WIUqyEBx+u3NOQV1WeuZ/efcfjA+xVAFY
 9nVg==
X-Gm-Message-State: AO0yUKUgBnelTf+0PLqi2xbhbJX0xT6alHYUWkklHIJAJJAdb0LRP4rr
 Q0IKhPRnnx8+gGlFbHlBHg3+OE5gzvWT1cGP
X-Google-Smtp-Source: AK7set9cZzhjVVvV/CwfC3L43I/tjrokwzAuyGMZPBs+w0Pe0x9Wbvb31NGpKVVPFVwSpvhmcfnPow==
X-Received: by 2002:a5d:4692:0:b0:2c7:16c3:1756 with SMTP id
 u18-20020a5d4692000000b002c716c31756mr11372254wrq.61.1677507098265; 
 Mon, 27 Feb 2023 06:11:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003e00c453447sm12353884wmr.48.2023.02.27.06.11.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:11:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 113/126] hw/ide: Declare ide_get_[geometry/bios_chs_trans] in
 'hw/ide/internal.h'
Date: Mon, 27 Feb 2023 15:02:00 +0100
Message-Id: <20230227140213.35084-104-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

ide_get_geometry() and ide_get_bios_chs_trans() are only
used by the TYPE_PC_MACHINE.
"hw/ide.h" is a mixed bag of lost IDE declarations. In order
to remove this (almost) pointless header soon, move these
declarations to "hw/ide/internal.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230220091358.17038-18-philmd@linaro.org>
---
 hw/i386/pc.c              | 3 ++-
 include/hw/ide.h          | 4 ----
 include/hw/ide/internal.h | 4 ++++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 98c2becc11..992951c107 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -33,7 +33,8 @@
 #include "hw/i386/vmport.h"
 #include "sysemu/cpus.h"
 #include "hw/block/fdc.h"
-#include "hw/ide.h"
+#include "hw/ide/internal.h"
+#include "hw/ide/isa.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-bridge/pci_expander_bridge.h"
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 24a7aa2925..db963bdb77 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -3,10 +3,6 @@
 
 #include "exec/memory.h"
 
-int ide_get_geometry(BusState *bus, int unit,
-                     int16_t *cyls, int8_t *heads, int8_t *secs);
-int ide_get_bios_chs_trans(BusState *bus, int unit);
-
 /* ide/core.c */
 void ide_drive_get(DriveInfo **hd, int max_bus);
 
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index c2b794150f..d9f1f77dd5 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -647,6 +647,10 @@ void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
                   int bus_id, int max_units);
 IDEDevice *ide_bus_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
 
+int ide_get_geometry(BusState *bus, int unit,
+                     int16_t *cyls, int8_t *heads, int8_t *secs);
+int ide_get_bios_chs_trans(BusState *bus, int unit);
+
 int ide_handle_rw_error(IDEState *s, int error, int op);
 
 #endif /* HW_IDE_INTERNAL_H */
-- 
2.38.1


