Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00891B0CFC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 15:42:22 +0200 (CEST)
Received: from localhost ([::1]:35886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQWgn-0001kj-OS
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 09:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33214 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maxim.uvarov@linaro.org>) id 1jQUBI-0001LB-Ow
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:01:44 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <maxim.uvarov@linaro.org>) id 1jQUBG-000752-TB
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:01:39 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:34092)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1jQUBG-00071s-Gs
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 07:01:38 -0400
Received: by mail-lj1-x243.google.com with SMTP id m8so9429821lji.1
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 04:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=90U7g6QRjcavx5MlRUxgpf0KQqMNtMFsmbd8Sg10FCw=;
 b=em5P/SqA9R+M0f/miql+iu4JbomjBshXY/wqlfYil5vKPIecPGprogSfbVhNG9ZOxQ
 1AAA/qW9Pho9CHp0WQfdplM2ky+agN0gsUdGnO3Y67dyuf44hTeMEep/1iXdZ310XysT
 WJIDmTQmtVCBT8+ezfolgS3NWnd+QkM6jJUjT8BLcMJXIAzOfQmjy2bUj3rRAJB4jbAR
 8NmEwDX1NK0vF8vcQudoDf3OlYPMKEMN8EeR2jUuoK5d7GvcPlU4tIB2KobislyugVPp
 /LhhWBN1mNrX/FraDctEoD6lAbAWznlPSrBkmdSWINATgLfzwLO5R3+JmQrvoKS/IT5n
 Xy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=90U7g6QRjcavx5MlRUxgpf0KQqMNtMFsmbd8Sg10FCw=;
 b=YpVhNlHC9bjsbskFjUHtKo9ve6udH+m1WNOW8LbJ+ScQsYTh7Vm2zy3LOiH3BdtTDA
 3S67G9hIhf5f7Xax1xnZ1PG7gvXSU2lwGNgSsrIl9CiJrOcIrwnnY7f2B22+DZ8OH7ST
 1uoyZiayNAaeMx/OVBf47Ycnsov+06cZe3BnC9skeqwVxj5OfMgK80id/O60aSfGNUv/
 2wc8paIHZ+M+hYbgvWHJHRsXVr7F9vHulIwv2QMXSv9BM4SfZFbml3Omu+4qxrvtvAlW
 R0MOkDNnn81wNhafWRarX4ZAx3tO/Rz+BqgM0IUSU6QJUqyZMRTXbDPKNYby/I6Lp9wY
 0Nhw==
X-Gm-Message-State: AGi0PuYzef1G1MXDHs/tylATD+1oI38ReUOznG1XYfaV2TyUc027uXzC
 lE9duCahZiP9sML0iUGMUD5+iWJ8qCc=
X-Google-Smtp-Source: APiQypL8tsQM/Sd23FKj055h+9GMtF7pIJ6vUkQFQRldbzpoNXAk6i6Xejx3fMNHGvu0e2Qd15e0Rw==
X-Received: by 2002:a2e:95da:: with SMTP id y26mr10066273ljh.26.1587380495767; 
 Mon, 20 Apr 2020 04:01:35 -0700 (PDT)
Received: from localhost.localdomain ([176.59.41.106])
 by smtp.gmail.com with ESMTPSA id b28sm507531lfo.46.2020.04.20.04.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 04:01:35 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] add optee dts entry for secure machine
Date: Mon, 20 Apr 2020 14:01:26 +0300
Message-Id: <20200420110126.12693-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::243
X-Mailman-Approved-At: Mon, 20 Apr 2020 09:36:03 -0400
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add optee compatible string for dtb to force linux
to boot optee module.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/virt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 656b008..7d712f3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1335,6 +1335,22 @@ static void create_platform_bus(VirtMachineState *vms)
                                 sysbus_mmio_get_region(s, 0));
 }
 
+static void create_secure_tee(VirtMachineState *vms)
+{
+    char *firmware;
+    char *optee;
+
+    firmware = g_strdup_printf("/firmware");
+    qemu_fdt_add_subnode(vms->fdt, firmware);
+
+    optee = g_strdup_printf("/firmware/optee");
+    qemu_fdt_add_subnode(vms->fdt, optee);
+    qemu_fdt_setprop_string(vms->fdt, optee, "compatible", "linaro,optee-tz");
+
+    g_free(optee);
+    g_free(firmware);
+}
+
 static void create_secure_ram(VirtMachineState *vms,
                               MemoryRegion *secure_sysmem)
 {
@@ -1720,6 +1736,7 @@ static void machvirt_init(MachineState *machine)
     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem);
         create_uart(vms, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
+        create_secure_tee(vms);
     }
 
     vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
-- 
2.17.1


