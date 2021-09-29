Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8E41C225
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:59:31 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWN8-0000MT-Jc
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtf-000295-T9
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:07 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:35423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVta-0005qd-GT
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:29:03 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M1HqM-1mYH3C06aw-002nRx; Wed, 29
 Sep 2021 11:28:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] nubus: add trace-events for empty slot accesses
Date: Wed, 29 Sep 2021 11:28:30 +0200
Message-Id: <20210929092843.2686234-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:llOd+AHXWEFRb5NqqDzvKos7h5dUILgJYUeKp2Jl/dhQaIS5up3
 lZ3ru0QshJX3qh05QE09X8yenwTHl09g/c0X8A5AyDwV2+4T7QNqIwj+BM6WPOL0ruA5K7t
 y7HDoiuauKXuyVDnCUzusDr1UuUmG8yLa6w/HiwXP9gYorI5SwSc1WUahaU7DqlUzR4N994
 LgwCPyHyXrVq2GjNVYbGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PEQgKKI8rKE=:efIkO/oZjS2K15XfufC041
 XUlzT0kTQAxHEeKouWOvKG13Wk7b2BFlxD4Lg3TGqgA/ckAjWiash2kFEt6lsVGP3dxDrDMxX
 GNSIbtGYPYXeAHfUqIqNKcL1cNp+det4a6ve9EJEqNYnPg28IIfR13RqjpspuIAZ5AvtAh/Lc
 YLNC1FcY8JawtgE90gRXKMq3MUlLlj34axllSK97LbxeE37GNXVcS+Ta1Zxju0GuapuK73THk
 8VO1VXqtVmPKme6g44rLB4pUdahGLQo0w0SGm1H8WKcjDMwjRVNP4tYROGztHqoQMc7gj4Svz
 hZL/w3pAsrW5DvgXr2c3GQqFDfaivKq0Z85QKTLJauArFT7EHXbAxsmwcRdngT4XXmPa9mcoh
 73qo2KwJvnwJFh8Q0otZUbsu/VVbv7EEUNpbl7rtsPPGYMRbcBobbVOR6WruxgLDEEfg078n4
 C5LE4LpuU9w4BFIttiNrhGYsWIw6mTr1EEslWH5mXMF5jH4Ep0LFjTIPqbr9tkbw1/ZzMJuAR
 oHhLEt0uxHUWK90PSWpiH8/EsNgET+k8gkDPaxhtg+Cl7p7MfdGN06uTcafvCQ/xQtyqJt0j8
 1tMEulvntVMK/YiAo812OsVQgiaUvujm18E29x2b/sOk6HvvtifB5ybRcYPQ3uLx/yJongMsp
 2tOSNt2mFiFhRllxXAAek4asIeZJerMlVZNkaUweBfV44PIVip6D1SZ2XrbzpQvzfk9n5bKCE
 u14LwHyXIRIc1VnFymeNoWd9cpqOf+9zjKGN8g==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Increase the max_access_size to 4 bytes for empty Nubus slot and super slot
accesses to allow tracing of the Nubus enumeration process by the guest OS.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210924073808.1041-8-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 meson.build           |  1 +
 hw/nubus/trace.h      |  1 +
 hw/nubus/nubus-bus.c  | 10 +++++++---
 hw/nubus/trace-events |  7 +++++++
 4 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 hw/nubus/trace.h
 create mode 100644 hw/nubus/trace-events

diff --git a/meson.build b/meson.build
index 15ef4d3c4187..7bdbbbdf02ed 100644
--- a/meson.build
+++ b/meson.build
@@ -2142,6 +2142,7 @@ if have_system
     'hw/misc/macio',
     'hw/net',
     'hw/net/can',
+    'hw/nubus',
     'hw/nvme',
     'hw/nvram',
     'hw/pci',
diff --git a/hw/nubus/trace.h b/hw/nubus/trace.h
new file mode 100644
index 000000000000..3749420da175
--- /dev/null
+++ b/hw/nubus/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_nubus.h"
diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 04f11edd2465..a9fb6ded9e4e 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "hw/nubus/nubus.h"
 #include "qapi/error.h"
+#include "trace.h"
 
 
 static NubusBus *nubus_find(void)
@@ -31,12 +32,13 @@ static void nubus_slot_write(void *opaque, hwaddr addr, uint64_t val,
                              unsigned int size)
 {
     /* read only */
+    trace_nubus_slot_write(addr, val, size);
 }
 
-
 static uint64_t nubus_slot_read(void *opaque, hwaddr addr,
                                 unsigned int size)
 {
+    trace_nubus_slot_read(addr, size);
     return 0;
 }
 
@@ -46,7 +48,7 @@ static const MemoryRegionOps nubus_slot_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 1,
+        .max_access_size = 4,
     },
 };
 
@@ -54,11 +56,13 @@ static void nubus_super_slot_write(void *opaque, hwaddr addr, uint64_t val,
                                    unsigned int size)
 {
     /* read only */
+    trace_nubus_super_slot_write(addr, val, size);
 }
 
 static uint64_t nubus_super_slot_read(void *opaque, hwaddr addr,
                                       unsigned int size)
 {
+    trace_nubus_super_slot_read(addr, size);
     return 0;
 }
 
@@ -68,7 +72,7 @@ static const MemoryRegionOps nubus_super_slot_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 1,
+        .max_access_size = 4,
     },
 };
 
diff --git a/hw/nubus/trace-events b/hw/nubus/trace-events
new file mode 100644
index 000000000000..e31833d694af
--- /dev/null
+++ b/hw/nubus/trace-events
@@ -0,0 +1,7 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# nubus-bus.c
+nubus_slot_read(uint64_t addr, int size) "reading unassigned addr 0x%"PRIx64 " size %d"
+nubus_slot_write(uint64_t addr, uint64_t val, int size) "writing unassigned addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
+nubus_super_slot_read(uint64_t addr, int size) "reading unassigned addr 0x%"PRIx64 " size %d"
+nubus_super_slot_write(uint64_t addr, uint64_t val, int size) "writing unassigned addr 0x%"PRIx64 " value 0x%"PRIx64 " size %d"
-- 
2.31.1


