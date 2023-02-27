Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1E26A441F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8p-0005Ax-J6; Mon, 27 Feb 2023 09:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8f-0004rw-7D
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8c-00082r-8q
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fm20-20020a05600c0c1400b003ead37e6588so7229881wmb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XcyZBEGIyj8pgSPqx0qibrEIuq5k2XdtgcY01B6U23g=;
 b=TZVwXBkoLX/8qcON2BtCCUbAs3WAgrAeeN5rdVMcDO6NQ+IZtC/eJgc36uCPioSijh
 uHwsHP8Fuig4eNMCzMvLWSvFeFio9i6V4wugn42jNHshnAvtOQxQPH0XErLIVDejmmp3
 xggfNMyL6pz2SAtFVDu3VaJZkSSIZy19dqgzmAlp4T1WFNGowhJvYX2l/DlFS2tRdbcm
 N+KOgvkriPUW4zlmSZmQuwz/ceFjh6vwZT6Ai1tysUGsTWXOXPZWuo6ruPEMAd3KvSVG
 muuGgU0R4L39SKh/ek6xYO7aiJK8bZu1lh8s3AkoRZyTPEsjowZBBq2nWVr+rwPI50aG
 0yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XcyZBEGIyj8pgSPqx0qibrEIuq5k2XdtgcY01B6U23g=;
 b=wajmTCPaUim8fbhmcH1VJNJ+Y1tDlGyJvUzv1G8qsw5NnKeklnv414srvByFUqPLbM
 Roq7Y1gxECRUJonIPNr7hkNCpKZHXXtTW0/uSw7VMkFQOM74iQIoqw+1dvqluwHQgv35
 yRs4t8IxL/KUibc8dFTAFuAGiI0i0YLtzqTlGk4prcjQQu3Ji+A9zRePmGsaItjmoPIC
 ZhlIr506LzKu5unqi4enYTvMBNtndW6qWMxa+2YX8Dn3C2sH4xrFxnyIHv7YYK2ENTcW
 OuiN1rof3JfGo7DCG/C2WFM0jbHrrnrlMZwkI3W8I9uG3akgeUwyIkbnz7pcf4/rgE+8
 3H9A==
X-Gm-Message-State: AO0yUKXfGEnQvA4MNcX15zBycOuAAvwQtvSkEdO1cnbFGOZGLiWq8za0
 yWjHKEhXUrlBapnBuRk2K/rMs4opwECROWky
X-Google-Smtp-Source: AK7set+lFZKHFpXdpQB21TqdC471OppUC1Ok6lnZqGj9SrvZwv0lhvzyR7r/HIJC/x8ed+Md83HhcQ==
X-Received: by 2002:a05:600c:6001:b0:3e7:772d:22de with SMTP id
 az1-20020a05600c600100b003e7772d22demr16640849wmb.30.1677506756686; 
 Mon, 27 Feb 2023 06:05:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c0a1300b003e4326a6d53sm12811395wmp.35.2023.02.27.06.05.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 050/126] hw/i386/ich9: Clean up includes
Date: Mon, 27 Feb 2023 15:00:57 +0100
Message-Id: <20230227140213.35084-41-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-12-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/acpi-build.c   | 1 +
 hw/isa/lpc_ich9.c      | 2 +-
 include/hw/i386/ich9.h | 8 +++++---
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b67dcbbb37..1bb73c3e9a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -59,6 +59,7 @@
 #include "hw/acpi/pcihp.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/ich9.h"
+#include "hw/i386/pc.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/i440fx.h"
 #include "hw/pci-host/q35.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index e3385ca7be..ce946760bb 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -40,8 +40,8 @@
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_bridge.h"
 #include "hw/i386/ich9.h"
+#include "hw/i386/pc.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
 #include "hw/pci/pci_bus.h"
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index d29090a9b7..3125863049 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -1,11 +1,13 @@
 #ifndef HW_ICH9_H
 #define HW_ICH9_H
 
-#include "hw/sysbus.h"
-#include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
-#include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
+#include "hw/intc/ioapic.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
+#include "exec/memory.h"
+#include "qemu/notify.h"
 #include "qom/object.h"
 
 void ich9_generate_smi(void);
-- 
2.38.1


