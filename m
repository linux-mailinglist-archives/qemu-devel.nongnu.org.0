Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21875481761
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 23:54:41 +0100 (CET)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2hqB-0006WX-Uh
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 17:54:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2ho1-0004Vv-M4
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:52:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n2hnz-0000Qq-Q9
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 17:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640818343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoRpcBVSaExXmb7fG4VqILyo3dvxz3orNpgQdbWBHqE=;
 b=HKGSSisBtuycW/6lnTD3GDH61/vJzee1yijTKT3CAMAOOvD7CPv1WHRRUDeL70ZTwG4zTC
 vZ9SJvQaknl7WkaIsO8h+VvIVXiXAKoDF4FHQHoM7qDOCMtOQObOfw1HV7g1pDDsDnXgH7
 7earPucR5kyKUdHUm4YiZUgDR5JbQvA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-J3hbLGh1MLyuWM_RHZW5Ag-1; Wed, 29 Dec 2021 17:52:20 -0500
X-MC-Unique: J3hbLGh1MLyuWM_RHZW5Ag-1
Received: by mail-wm1-f69.google.com with SMTP id
 d4-20020a05600c34c400b00345d5d47d54so4880757wmq.6
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 14:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QoRpcBVSaExXmb7fG4VqILyo3dvxz3orNpgQdbWBHqE=;
 b=oR6eoCfMggQwYpIEHbZg4udAqFmrKqqqhGpe9er1ZZsgl3Yi1H9iv8oLq8PFh7MwUD
 kDuIApUf9nTAKz8Q5YPFJYnIaszs31AoOGN2vflkFK6EPUSXLHmEIDvTjIQMXQbS0WKc
 CMEgS6IiyiehujTBMY0N+euNgj6xGhRCcj0X6xjKnZAjqycP6eSxWaAH6E3xMEONocGy
 Yduaih7rcvyFmpo3Wp3ezigxnfjGMW69PRNoB9po1lQ/ELUGUVoP37OjPWpY7qvqGhvk
 pukoc2O2dgvTZ18DkhT7QCP75zp7m57wF8bTa2IdLQe4+wsBJ03ygNDwDhPyDHSvLJ48
 Vqhw==
X-Gm-Message-State: AOAM532niM31JQkorilc6Mkzi+lxzuml7IfIsW7J8AgPlEzMOAiPPj4q
 3+zLDDg0L9qD0pcoBtMClQzIZi/+tQe+u8yhDsS/nZgcmlqwIjAjycINSy7N0GYllGIj41dzbCD
 qCO02z34sNu5RGwicYgEudrAQm5mbWZ8rylk/BbqG+P82whuUkc5NQwGo+V9c//iC
X-Received: by 2002:a05:600c:204d:: with SMTP id
 p13mr24293397wmg.102.1640818338883; 
 Wed, 29 Dec 2021 14:52:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPE5b8DuLYePT6Y64gnwlRrsxQC6MembPp94mt7rHfJzJ5kIt/jQTJNtbRZIKLfHzQvWr+qg==
X-Received: by 2002:a05:600c:204d:: with SMTP id
 p13mr24293379wmg.102.1640818338702; 
 Wed, 29 Dec 2021 14:52:18 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id n9sm27898232wmq.37.2021.12.29.14.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:52:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/sysbus: Restrict sysbus_get_connected_irq() to
 sysbus-internal.h
Date: Wed, 29 Dec 2021 23:52:05 +0100
Message-Id: <20211229225206.171882-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211229225206.171882-1-philmd@redhat.com>
References: <20211229225206.171882-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sysbus_get_connected_irq() and sysbus_is_irq_connected() are only
used by platform-bus.c; restrict them to hw/core/ by adding a local
"sysbus-internal.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/sysbus-internal.h | 16 ++++++++++++++++
 include/hw/sysbus.h       |  2 --
 hw/core/platform-bus.c    |  2 +-
 hw/core/sysbus.c          |  1 +
 4 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 hw/core/sysbus-internal.h

diff --git a/hw/core/sysbus-internal.h b/hw/core/sysbus-internal.h
new file mode 100644
index 00000000000..991b3e3159c
--- /dev/null
+++ b/hw/core/sysbus-internal.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SysBus internal helpers
+ *
+ * Copyright (c) 2021 QEMU contributors
+ */
+#ifndef HW_CORE_SYSBUS_INTERNAL_H
+#define HW_CORE_SYSBUS_INTERNAL_H
+
+#include "hw/sysbus.h"
+
+/* Following functions are only used by the platform-bus subsystem */
+qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
+bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
+
+#endif /* HW_CORE_SYSBUS_INTERNAL_H */
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 3564b7b6a22..24645ee7996 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -77,8 +77,6 @@ void sysbus_init_ioports(SysBusDevice *dev, uint32_t ioport, uint32_t size);
 bool sysbus_has_irq(SysBusDevice *dev, int n);
 bool sysbus_has_mmio(SysBusDevice *dev, unsigned int n);
 void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq);
-bool sysbus_is_irq_connected(SysBusDevice *dev, int n);
-qemu_irq sysbus_get_connected_irq(SysBusDevice *dev, int n);
 void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr addr);
 void sysbus_mmio_map_overlap(SysBusDevice *dev, int n, hwaddr addr,
                              int priority);
diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index b8487b26b67..016fb71eba1 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -25,7 +25,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
-
+#include "sysbus-internal.h"
 
 /*
  * Returns the PlatformBus IRQ number for a SysBusDevice irq number or -1 if
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 0e6773c8df7..dcd7beda184 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -24,6 +24,7 @@
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
 #include "qdev-internal.h"
+#include "sysbus-internal.h"
 
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
-- 
2.33.1


