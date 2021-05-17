Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B2382AC0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:18:11 +0200 (CEST)
Received: from localhost ([::1]:44368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libGE-0000uS-BK
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libA1-0004Ov-7r
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:46 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9v-0000Xw-4u
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:45 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 o6-20020a05600c4fc6b029015ec06d5269so3371773wmq.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gj0bMEmiMQOKWa3Cw2/RrMu8sFYu/fhui5y3HNfbFHU=;
 b=c9BeS92GNxiuTyCFCw9d2HZdSM8olP/DV6YkJD+VEnKOG6Ex9NkqvJGPFdd0Z5+tNz
 14EFY3w/pnYEf3/6gVW5nhq4Vq1xEiAE/rhdvC9mGXqOVQDaRo4fnurQhQOnWaLcjSLr
 358I9E835WzMWA0DFwHd7LmD/ncEukA8vgOPNemA9/NSAf8Hs2QKj75FaIcjS9u03iFn
 jTE+LDsXKpigz2rfazh5jGA6UxQBjACPNadDrTehcG+2xa+OToESIVkoGTs4LWAJvBu4
 //JIFykLpeKczsWDA5jUz1/w4Txfwx0bfgmZdF8IEw03kHh9lEsVxe2wRC7sq8c/+E70
 xZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Gj0bMEmiMQOKWa3Cw2/RrMu8sFYu/fhui5y3HNfbFHU=;
 b=mRpPJZktCgqHWvWWW/oinxHvjt1ZBUs6G924mOYMQ//ouDAfq9CNoaRxg0geY54M0d
 YRugNriXpDRlNZEJry+HYPO2GXi1mM3tYCVBHbTLuCFfSEDQqKXi9OU8nOaRvKP4rfaU
 b16Ki567abHZBVMtZ082t2OijTQ8+x+euajB6MqKy1XL3WupFG4AswsllMbTvxr2c+4y
 mugswG4NqPbhS6kxbSZ0Z3DEG6iQ6L9RIFkcZp7YOv44+CQv1P0jF+JkwM+BlAFvNKzU
 pCWntFRvq5wac1E2DoJS4s8GZT5k4TsZw6RFNmbVq0Jn0Wb+9amKtItTvwxwWPze9IUH
 L93w==
X-Gm-Message-State: AOAM532fD45GMajwBXUwcIP8AQWUKcjpFeULZ7Yz8R4phXZ7rTmQQxT2
 gXaETyLIIemH4/6juSF1KN9knS0Y7cEMKg==
X-Google-Smtp-Source: ABdhPJxF7sQfV1ROe97hJTo8g7HIRsc/4yNcE6tqXWf1mt1/r02MfIy6IaNydljrEjMd2jgbjJbaUg==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr35116237wmb.113.1621249897504; 
 Mon, 17 May 2021 04:11:37 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k9sm14441458wmk.5.2021.05.17.04.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] exec: Restrict memory-internal.h to sysemu/
Date: Mon, 17 May 2021 13:11:05 +0200
Message-Id: <20210517111111.1068153-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it clearer the memory-internal.h header is sysemu specific,
move it to the sysemu/ directory.

Patch created mechanically using:

  $ sed -i s,exec/memory-internal.h,exec/sysemu/memory-internal.h, $(git grep -l exec/memory-internal.h)

Then the #ifdef'ry conditional on CONFIG_USER_ONLY has
been replaced by an #error.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/{ => sysemu}/memory-internal.h | 7 +++++--
 accel/tcg/cputlb.c                          | 2 +-
 hw/s390x/s390-pci-inst.c                    | 2 +-
 softmmu/memory.c                            | 2 +-
 softmmu/physmem.c                           | 2 +-
 MAINTAINERS                                 | 2 +-
 6 files changed, 10 insertions(+), 7 deletions(-)
 rename include/exec/{ => sysemu}/memory-internal.h (94%)

diff --git a/include/exec/memory-internal.h b/include/exec/sysemu/memory-internal.h
similarity index 94%
rename from include/exec/memory-internal.h
rename to include/exec/sysemu/memory-internal.h
index 9fcc2af25c8..f3459d687ad 100644
--- a/include/exec/memory-internal.h
+++ b/include/exec/sysemu/memory-internal.h
@@ -20,9 +20,12 @@
 #ifndef MEMORY_INTERNAL_H
 #define MEMORY_INTERNAL_H
 
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu specific header from user emulation
+#endif
+
 #include "cpu.h"
 
-#ifndef CONFIG_USER_ONLY
 static inline AddressSpaceDispatch *flatview_to_dispatch(FlatView *fv)
 {
     return fv->dispatch;
@@ -49,5 +52,5 @@ void address_space_dispatch_free(AddressSpaceDispatch *d);
 
 void mtree_print_dispatch(struct AddressSpaceDispatch *d,
                           MemoryRegion *root);
-#endif
+
 #endif
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 9ecc45180a5..14a4ee4ed63 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -25,7 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/sysemu/cputlb.h"
 #include "exec/tb-hash.h"
-#include "exec/memory-internal.h"
+#include "exec/sysemu/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "tcg/tcg.h"
 #include "qemu/error-report.h"
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 9ec277d50e7..0c88787d134 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/memop.h"
-#include "exec/memory-internal.h"
+#include "exec/sysemu/memory-internal.h"
 #include "qemu/error-report.h"
 #include "sysemu/hw_accel.h"
 #include "hw/s390x/s390-pci-inst.h"
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d5ab46d76a9..cdc935cdd27 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -25,7 +25,7 @@
 #include "qom/object.h"
 #include "trace.h"
 
-#include "exec/memory-internal.h"
+#include "exec/sysemu/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 20e69b09d68..31e490185f3 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -58,7 +58,7 @@
 #include "exec/translate-all.h"
 #include "sysemu/replay.h"
 
-#include "exec/memory-internal.h"
+#include "exec/sysemu/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "exec/log.h"
 
diff --git a/MAINTAINERS b/MAINTAINERS
index d515a954b2b..48ae2145513 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2407,7 +2407,7 @@ F: softmmu/dma-helpers.c
 F: softmmu/ioport.c
 F: softmmu/memory.c
 F: softmmu/physmem.c
-F: include/exec/memory-internal.h
+F: include/exec/sysemu/memory-internal.h
 F: scripts/coccinelle/memory-region-housekeeping.cocci
 
 SPICE
-- 
2.26.3


