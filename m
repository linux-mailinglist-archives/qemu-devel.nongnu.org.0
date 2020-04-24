Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B241B7585
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 14:38:05 +0200 (CEST)
Received: from localhost ([::1]:34724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRxam-0007Ra-4V
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 08:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <arilou@gmail.com>) id 1jRxXx-0003eP-6f
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:35:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <arilou@gmail.com>) id 1jRxXw-0003vq-EI
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:35:08 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1jRxXv-0003oM-V8
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 08:35:08 -0400
Received: by mail-wr1-x441.google.com with SMTP id k13so10598703wrw.7
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hp0TKGKSi/gHtI8I2mIP8YOmXXrvnTmTwZnNNAObxR0=;
 b=Pm+b+wXp6au1aZDqRdjt/fUWSdxvEqkQDTdt8gV8yagYD0egXezNFtjHyFaHyD6qui
 dpyMkhb1k4Hmab4ehigdem5Ca1xy0HPUYS9Jg25olDzDjPtrRKoq7JruUfrRSAjW1A2g
 LZyXLOfhsbIcsdMsKji1gbCJFyXkMKCX4a3/08MDms7f3d4M59UI3XsNqIl+fh0WxeRN
 RT3nls1KdVJYsidvPcylqJvbVqz36grdUj/+v0MjLlLaJ9OjhJg/fGjql20hTdLWxF24
 WhtP5OlzJe9IyJRCNUJZxznU0RkyUpj0na3ZpjMvtmbZ5VehHJOtrJxnNEf/stmDt0KN
 uPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hp0TKGKSi/gHtI8I2mIP8YOmXXrvnTmTwZnNNAObxR0=;
 b=EQjY535RKrB2yUNLyK6Nrlc5EpNoYX3VYFx8u+j0kRc+l8PNvkcNZY8ooGqymuyuO/
 Mp6XmHdoac7MWmcteEO57tiu9IXVMT5Rn3d3VGaUIvlgERKdkOxz1h3kdSXDID14CtoY
 nt4U/mtsrP9TaSic1lXPiBYf4ueA6ChRpkn/wx9eewI+cvkFmQBMQf4DBO6aC581Ugub
 cAE41Nq+gZUndvxi/zS8EqKCtxbqW2dYK42TCizvi/1pMUbLv3NVhjv2ZCVEb8SavJ5N
 ww1yqKAWQLnRY895qqfXEOmeOtsR3ryUpIycVfe8Qg8U/87pi0z/TebXMXdLwkEvgDME
 4e7A==
X-Gm-Message-State: AGi0PuYSAbeaZ16t1qyrYZych70/8mB32N7rDjzbuk85ECkalL6CuGIv
 gxuMSEva68klG/xGMAH5oTUtvUZY4CNnww==
X-Google-Smtp-Source: APiQypJ1exlPl5n0zmNCy/2NVkYGiq0E/vTB4FSM+/UHCAoHY7aHWB3bMD3zJYm8s8/a/PfddoZjAQ==
X-Received: by 2002:a5d:6ccb:: with SMTP id c11mr11249439wrc.416.1587731705375; 
 Fri, 24 Apr 2020 05:35:05 -0700 (PDT)
Received: from jondnuc.lan (IGLD-84-229-154-20.inter.net.il. [84.229.154.20])
 by smtp.gmail.com with ESMTPSA id
 91sm8462859wra.37.2020.04.24.05.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 05:35:04 -0700 (PDT)
From: Jon Doron <arilou@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/6] i386:pc: whitelist dynamic vmbus-bridge
Date: Fri, 24 Apr 2020 15:34:42 +0300
Message-Id: <20200424123444.3481728-5-arilou@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200424123444.3481728-1-arilou@gmail.com>
References: <20200424123444.3481728-1-arilou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=arilou@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::441
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
Cc: mail@maciej.szmigiero.name, eyakovlev@virtuozzo.com, ehabkost@redhat.com,
 rvkagan@gmail.com, liran.alon@oracle.com, Roman Kagan <rkagan@virtuozzo.com>,
 pbonzini@redhat.com, vkuznets@redhat.com,
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
 Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As vmbus-bridge is derived from sysbus device, it has to be whitelisted
to be allowed to be created with -device.

Signed-off-by: Roman Kagan <rkagan@virtuozzo.com>
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Signed-off-by: Jon Doron <arilou@gmail.com>
---
 hw/i386/pc_piix.c | 2 ++
 hw/i386/pc_q35.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 9cceae3e2c..6daa0770fa 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -60,6 +60,7 @@
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "sysemu/numa.h"
+#include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
 
 #define MAX_IDE_BUS 2
@@ -417,6 +418,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     m->default_machine_opts = "firmware=bios-256k.bin";
     m->default_display = "std";
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
 static void pc_i440fx_5_0_machine_options(MachineClass *m)
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index d37c425e22..faaa39ced2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -53,6 +53,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
+#include "hw/hyperv/vmbus-bridge.h"
 #include "hw/mem/nvdimm.h"
 
 /* ICH9 AHCI has 6 ports */
@@ -346,6 +347,7 @@ static void pc_q35_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_AMD_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
+    machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
     m->max_cpus = 288;
 }
 
-- 
2.24.1


