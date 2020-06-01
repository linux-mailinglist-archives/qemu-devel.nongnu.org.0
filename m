Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26491EA605
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 16:39:42 +0200 (CEST)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jflbJ-00062Y-VG
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 10:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRh-0002Xn-GA; Mon, 01 Jun 2020 10:29:45 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRe-0002cK-WB; Mon, 01 Jun 2020 10:29:43 -0400
Received: by mail-wm1-x343.google.com with SMTP id k26so11591858wmi.4;
 Mon, 01 Jun 2020 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1c6Ywd2WY7bkeebkfpfDjPJtSo9TSSd8GLZEIuba7M=;
 b=KOMpvQ1h+cZ/GQVz8Qxdx0mis+TlMoxKHuaO2rSRSRaGWhvUFWWUqHiwcfE323UL85
 aFEytOww3L6zSlWIZYTfxs/42vrUDiv9C6o/n7DgZcVeQbTpRmEyDlSCBhRvyEEe/q1E
 KTruiQ5Yb9wpzHMcL/S5jvbB3uNWlV8t7A15KU5YJuRpiEXQ8HrJAra1lGOBEpLrTZ3O
 642Vmt3sR4HbgPjDypLJB8+Ui1R+27mPnBXP523uszOrtFVLjhJkd3kdzmV8PrhICcHq
 x0ChezwGeMAvWpPgfm2AcOw/MfHwRzWWgyDUEAGIrSzdPEIsC91vU304u1JiiHnltmvV
 YGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R1c6Ywd2WY7bkeebkfpfDjPJtSo9TSSd8GLZEIuba7M=;
 b=BHInmlzzDjYfv+7X/hjKTVXkS+Sl5PSXB9J5eeiyLrA9xj7u0egwQP9KRSmgXGuZkD
 Gl6Re551G0EJFiuETyCkcX6EgQcqjGeUhd6emwAKR871aWhwQ9XifzPr5tMoEmwgKIrs
 JtrJrA+fllVOeaEhvMbyvgZQK5c9dFju/ywhm1+y0tUzfqgNcURybWxkc1LcvGnwjXQ0
 HaJwlmNZz6pYLOW/XtNjTSALgHjIA0GE7cW3Fd/eQI14lj6GhR0yWm6BWEaD9auok+h+
 xWIrJwRFkdeJ+v2qmEFAx0iTgBQoN7JalwG+YRkmeSeyx+gvkRlQV9/WbLjZ/BfP3bej
 DjBg==
X-Gm-Message-State: AOAM531qekWiU/FofUDLch21IPDoDqIL/+onNTg5PiSfg4w4+ezWfY29
 bEX/+m79UP8cJw67JOgyxr5EMd1r
X-Google-Smtp-Source: ABdhPJwdSMIYLsZyoLFaZUJVXdLPvSbS6G1a5vB2dplcqD0mIzzFuz5/mh32BbsK8QB7xfYYy+wUTQ==
X-Received: by 2002:a1c:7f96:: with SMTP id
 a144mr21650923wmd.176.1591021780425; 
 Mon, 01 Jun 2020 07:29:40 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] hw/pci-host: Use the IEC binary prefix definitions
Date: Mon,  1 Jun 2020 16:29:27 +0200
Message-Id: <20200601142930.29408-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601142930.29408-1-f4bug@amsat.org>
References: <20200601142930.29408-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/i440fx.c    | 3 ++-
 hw/pci-host/q35.c       | 2 +-
 hw/pci-host/versatile.c | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 0adbd77553..aefb416c8f 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/range.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci.h"
@@ -301,7 +302,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
     memory_region_set_enabled(&f->smram_region, true);
 
     /* smram, as seen by SMM CPUs */
-    memory_region_init(&f->smram, OBJECT(d), "smram", 1ull << 32);
+    memory_region_init(&f->smram, OBJECT(d), "smram", 4 * GiB);
     memory_region_set_enabled(&f->smram, true);
     memory_region_init_alias(&f->low_smram, OBJECT(d), "smram-low",
                              f->ram_memory, 0xa0000, 0x20000);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 352aeecfa7..b788f17b2c 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -589,7 +589,7 @@ static void mch_realize(PCIDevice *d, Error **errp)
     memory_region_set_enabled(&mch->open_high_smram, false);
 
     /* smram, as seen by SMM CPUs */
-    memory_region_init(&mch->smram, OBJECT(mch), "smram", 1ull << 32);
+    memory_region_init(&mch->smram, OBJECT(mch), "smram", 4 * GiB);
     memory_region_set_enabled(&mch->smram, true);
     memory_region_init_alias(&mch->low_smram, OBJECT(mch), "smram-low",
                              mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index cfb9a78ea6..8ddfb8772a 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
@@ -399,8 +400,8 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
     pci_map_irq_fn mapfn;
     int i;
 
-    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 1ULL << 32);
-    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 1ULL << 32);
+    memory_region_init(&s->pci_io_space, OBJECT(s), "pci_io", 4 * GiB);
+    memory_region_init(&s->pci_mem_space, OBJECT(s), "pci_mem", 4 * GiB);
 
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), dev, "pci",
                              &s->pci_mem_space, &s->pci_io_space,
-- 
2.21.3


