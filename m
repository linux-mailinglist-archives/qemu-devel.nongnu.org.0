Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA20261409
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 18:00:35 +0200 (CEST)
Received: from localhost ([::1]:44866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFg2s-0002V9-1O
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 12:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFfyV-0004iA-SB
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 11:56:03 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39687
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFfyT-00041h-U8
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 11:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599580560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7Ag5wnuoUQYeKlBzjbRjYp0ocSUB86y3tv8q6ZNJJA=;
 b=fihq/HN4h3EzkZN64zLjdkXt9ea00B4XIHjJulWttRV9tvDxuiHGRdRE/+u+ShoE7SsO+v
 UF7IZxEFvXP/fXB9ZksotwHKzxkYKEA4/NpafFixZSy2DKaA64cPdcUkWddU/ugXL0ywuf
 Q53kyvEYnsMz/0aBX/RItsvaLoAEkJU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-8uY5cVRPOv2wBNLRFNoZXw-1; Tue, 08 Sep 2020 11:55:59 -0400
X-MC-Unique: 8uY5cVRPOv2wBNLRFNoZXw-1
Received: by mail-wm1-f69.google.com with SMTP id l26so3618620wmg.7
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 08:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7Ag5wnuoUQYeKlBzjbRjYp0ocSUB86y3tv8q6ZNJJA=;
 b=tu/QLKtd8u59Pf1asXv/f9r3I2j4/3AR/5MmSadvc+6oSg/GvrG7GQZ8f3qav02op0
 O91Bjv59HBxj4/Gjcs0o5CkkXJZv2QV0B65T+rkioHpmx/dFsOmdwEdDdOttK+X6n7Dh
 Sx0N31H5GtLLW8kT66kNADmd05YiiSqAknCHl5JPqpGXSaUUBES+jjTwc4Eh6X94il1i
 j1KMBhJ8SpI/SVI33o46a0FJCqQ0ddnU1PN+Wa6Tf91AcBPXPeB7tNn3FOSx9UUHtWZO
 X9ifVaRsPw1TXD1jEXDdq0gCN3I4pjwIhd58HMuHTRtLcf6Bxjd4Nytc6MeiTD4L0D60
 yE9g==
X-Gm-Message-State: AOAM531NPVfoVT1CSz/0FtcuFsAJ9eCD7++TFDrZunYYIHmJKlMhIlFo
 FbC7K5nvF3bOUWude5iINnYCAAe3b6zq9jmilyUnhDgCKzcbwyUmERTJhWmV/pAJwvJLt5xcw3o
 YQuG5KEIxpWKZxmk=
X-Received: by 2002:a1c:408a:: with SMTP id n132mr171987wma.45.1599580557610; 
 Tue, 08 Sep 2020 08:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUFRkRRVJCqVG6l89owtWDMK776psHv3Hm0UYLZ9EZUoKSwjLV4cvgxH1H8jSVri7Qh45g4w==
X-Received: by 2002:a1c:408a:: with SMTP id n132mr171968wma.45.1599580557436; 
 Tue, 08 Sep 2020 08:55:57 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id 11sm32118347wmi.14.2020.09.08.08.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 08:55:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] hw/xen: Split x86-specific declaration from generic
 hardware ones
Date: Tue,  8 Sep 2020 17:55:29 +0200
Message-Id: <20200908155530.249806-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908155530.249806-1-philmd@redhat.com>
References: <20200908155530.249806-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xen_hvm_init() is restricted to the X86 architecture.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/xen/xen-x86.h | 15 +++++++++++++++
 include/hw/xen/xen.h     |  2 --
 hw/i386/pc_piix.c        |  2 +-
 hw/i386/xen/xen-hvm.c    |  1 +
 stubs/xen-hw-stub.c      |  1 +
 5 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 include/hw/xen/xen-x86.h

diff --git a/include/hw/xen/xen-x86.h b/include/hw/xen/xen-x86.h
new file mode 100644
index 00000000000..85e3db1b8de
--- /dev/null
+++ b/include/hw/xen/xen-x86.h
@@ -0,0 +1,15 @@
+/*
+ * Xen X86-specific
+ *
+ * Copyright 2020 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef QEMU_HW_XEN_X86_H
+#define QEMU_HW_XEN_X86_H
+
+#include "hw/i386/pc.h"
+
+void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory);
+
+#endif /* QEMU_HW_XEN_X86_H */
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index b2b459964cb..1406648ca58 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -30,8 +30,6 @@ qemu_irq *xen_interrupt_controller_init(void);
 
 void xenstore_store_pv_console_info(int i, struct Chardev *chr);
 
-void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory);
-
 void xen_register_framebuffer(struct MemoryRegion *mr);
 
 #endif /* QEMU_HW_XEN_H */
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3e008bb0b1a..43205f48188 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -46,7 +46,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/arch_init.h"
 #include "hw/i2c/smbus_eeprom.h"
-#include "hw/xen/xen.h"
+#include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
 #include "hw/acpi/acpi.h"
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 49748cda3fb..e03c59e53da 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -22,6 +22,7 @@
 #include "hw/xen/xen_common.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen-bus.h"
+#include "hw/xen/xen-x86.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-misc.h"
 #include "qemu/error-report.h"
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index d14efef49e9..2ea81909217 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -8,6 +8,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/xen/xen.h"
+#include "hw/xen/xen-x86.h"
 
 void xenstore_store_pv_console_info(int i, Chardev *chr)
 {
-- 
2.26.2


