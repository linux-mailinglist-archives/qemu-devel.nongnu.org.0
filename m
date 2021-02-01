Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E803530A694
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:32:11 +0100 (CET)
Received: from localhost ([::1]:57370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XRC-0008DN-SB
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:32:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOZ-0006TN-MS
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:27 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOY-0008LH-1c
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:27 -0500
Received: by mail-wm1-x333.google.com with SMTP id o10so11297677wmc.1
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86kgWxqaVQ459jB6Z+UlH8D45KqeOXWfxBT1ho7ZaU4=;
 b=OvgFBK6bmxqweSp3L77Aj8WaAxT1RQK0LtEk3i36jsBBT/QaFtswrGEa72xZLMd4Yb
 HIUhY+oLNPcVTx0grppbuToABViBp+iIgP1lhjj7VUfVrYskRS511GA7hnokxOH0+1hl
 Llq6UzcwQZKox5D1iLDy4JUoVe9v7MvTlaPAwPhQGGDyHg/dG4Y7wUG4nevlaACcQCNa
 OGhW/bC2jrKwZhFOXWeH02rHFHQET1ePy5uJIr09AQTtEe/LqnRUMrCDsUr7yNukAjNX
 KfV/ZLVI7sFYmKWV4CFTTIr/ggz3eMOkgOHARcOO5pOvHUgqxm9ZDMwGiTNoRja/YO0o
 FkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=86kgWxqaVQ459jB6Z+UlH8D45KqeOXWfxBT1ho7ZaU4=;
 b=BURWxvviuTayRyWDoKbZyG9jEf0HO9EHS77Uu7rwzN7UcrxkYZhYW5gUHpLBOt+kzJ
 GZ5eA2aB9in4I3rnC0qNqRIfS+orT08EMBlvw0El50pdY/ottHgzx/J/gDnVANH72Rse
 UlSAJhtEWGIUejtNH8UXXXnMluIlPvZfBaemKOm6N4yf3YXjByWIyLVyl2jOBqSreZG8
 YatPy+KSzt9aL45MFcJGW+GHuNISfsLt6FjKMvfJ+Kj5dkbm6NKsJESjoMJrplJia5HR
 TM3L6wCuAJR3qqR48a1AOXyIezQmkK/9ecKeo4VXfUDH2lUF0gEID1K1Z8yTNVKTwmGX
 gVoA==
X-Gm-Message-State: AOAM531NvFXSIsWtm+zS/W+hxvFFjrqa3bolx44hwU48luphoyGU2qyQ
 AZ9c4B/doNgdbQUD/4hqUBw=
X-Google-Smtp-Source: ABdhPJxcRgfDMwb1tHeCu3Tj2p4+drVJi66+iJFM6aft3sJqiy4qEUbcRAahN2gmhZHZ8T/I+s19pw==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr14727242wma.114.1612178964810; 
 Mon, 01 Feb 2021 03:29:24 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id s23sm20324467wmc.35.2021.02.01.03.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] accel/xen: Incorporate xen-mapcache.c
Date: Mon,  1 Feb 2021 12:29:01 +0100
Message-Id: <20210201112905.545144-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xen-mapcache.c contains accelerator related routines,
not particular to the X86 HVM machine. Move this file
to accel/xen/ (adapting the buildsys machinery).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build                           |  3 +++
 accel/xen/trace.h                     |  1 +
 {hw/i386 => accel}/xen/xen-mapcache.c |  0
 hw/i386/xen/xen-hvm.c                 |  1 -
 accel/xen/meson.build                 |  5 ++++-
 accel/xen/trace-events                | 10 ++++++++++
 hw/i386/xen/meson.build               |  1 -
 hw/i386/xen/trace-events              |  6 ------
 8 files changed, 18 insertions(+), 9 deletions(-)
 create mode 100644 accel/xen/trace.h
 rename {hw/i386 => accel}/xen/xen-mapcache.c (100%)
 create mode 100644 accel/xen/trace-events

diff --git a/meson.build b/meson.build
index 97a577a7743..f2e778f22cd 100644
--- a/meson.build
+++ b/meson.build
@@ -1706,6 +1706,9 @@
   'crypto',
   'monitor',
 ]
+if 'CONFIG_XEN' in accelerators
+  trace_events_subdirs += [ 'accel/xen' ]
+endif
 if have_user
   trace_events_subdirs += [ 'linux-user' ]
 endif
diff --git a/accel/xen/trace.h b/accel/xen/trace.h
new file mode 100644
index 00000000000..f6be599b187
--- /dev/null
+++ b/accel/xen/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-accel_xen.h"
diff --git a/hw/i386/xen/xen-mapcache.c b/accel/xen/xen-mapcache.c
similarity index 100%
rename from hw/i386/xen/xen-mapcache.c
rename to accel/xen/xen-mapcache.c
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 68821d90f52..7156ab13329 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -31,7 +31,6 @@
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/xen.h"
-#include "sysemu/xen-mapcache.h"
 #include "trace.h"
 #include "exec/address-spaces.h"
 
diff --git a/accel/xen/meson.build b/accel/xen/meson.build
index 002bdb03c62..45671e4bdbf 100644
--- a/accel/xen/meson.build
+++ b/accel/xen/meson.build
@@ -1 +1,4 @@
-specific_ss.add(when: 'CONFIG_XEN', if_true: files('xen-all.c'))
+specific_ss.add(when: 'CONFIG_XEN', if_true: files(
+  'xen-all.c',
+  'xen-mapcache.c',
+))
diff --git a/accel/xen/trace-events b/accel/xen/trace-events
new file mode 100644
index 00000000000..30bf4f42283
--- /dev/null
+++ b/accel/xen/trace-events
@@ -0,0 +1,10 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# xen-hvm.c
+xen_ram_alloc(unsigned long ram_addr, unsigned long size) "requested: 0x%lx, size 0x%lx"
+
+# xen-mapcache.c
+xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
+xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
+xen_map_cache_return(void* ptr) "%p"
+
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300c..2fcc46e6ca1 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,6 +1,5 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
-  'xen-mapcache.c',
   'xen_apic.c',
   'xen_platform.c',
   'xen_pvdevice.c',
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index ca3a4948baa..f1b36d164d9 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -20,9 +20,3 @@ cpu_ioreq_move(void *req, uint32_t dir, uint32_t df, uint32_t data_is_ptr, uint6
 xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
 cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
-
-# xen-mapcache.c
-xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
-xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
-xen_map_cache_return(void* ptr) "%p"
-
-- 
2.26.2


