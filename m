Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C52DFD2A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:05:12 +0100 (CET)
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMkJ-0003oY-4b
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRJ-0004x3-Sw
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:33 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0007kS-LH
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:33 -0500
Received: by mail-wr1-x431.google.com with SMTP id r3so11336230wrt.2
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sUsC5XccRN5FSZ4Jz4t0i7Xc2JZJL4oZwyC7G9+iFnU=;
 b=EIlwpCo884b38gbE2AmrOeFvBhxslytz50wwLdP/zn44DGymD7eoMLscbnaQ5CjHJv
 8N5DnYLR2H5TEaeInyQJyfoQviUpqwdl7S/NN++HM5CZYk7ApDsI5MoHCyw98WZi7cxN
 DcDIeBSFNZmaWTxR/KnGD18rnyg1XNHM8yejazAxMvMEN6yyMrkORdc2SEuq5jRAQ0B2
 AxLAs0wm09goXG3q8MxNphSJ6tkBv3xN28izk70bMKY2gBVw3ohdcWDg5BRrlWp+xU/8
 IN86fVjWp+ft6HmFeCZUT1JfnIOgcZ5L7jB73sAT5C0Ot7KH2kwxrsECu0sn8RR1EflB
 ctpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sUsC5XccRN5FSZ4Jz4t0i7Xc2JZJL4oZwyC7G9+iFnU=;
 b=KsXkg8DQFSvlvTo9Sr4LNzuoF4CivLUckUAEmUY4jI7z+CutjnD1xESi+9gE7hkAt6
 DzVAbFlw/FhOe8omKB2rxwQHyoe/MyY3ESwSAmUGPsBcNxA/3ohCAzKGmpJ4LlzqBhlX
 GPe5RekKHI6CrBgUaEuqjPUh1nPw0bZM/bhaM5rH5rQBfPNJRE1jyFtBTGSLd25vJ236
 v5SlnqYKUw6Dx75M9/MtQD/5rVz8lD04uiSKeZPCPN5oYUZQTqUuJwugq1AQeATxaBw6
 yZztaRLLyrA55wKKeWV3WyHJOez91yOe+ki4PTogtk50BB4vOCpiEyy0gvkxEVV/aH6O
 DlHA==
X-Gm-Message-State: AOAM533GXX4ZQitWbRSYJIbqsSjCfXMW5msld10Xbp92+00R/I1i97Xr
 y0qcbqDFn+s/o9LrdCVeGXMFxChZGZ4=
X-Google-Smtp-Source: ABdhPJwD5n//eSq8HKG+6Uixs9xXOhChU60XgsVtkVpcZs8KIWB6opX2TV/8UTVOZaYOyVcUZZGSgw==
X-Received: by 2002:a5d:42d0:: with SMTP id t16mr19007660wrr.230.1608561908688; 
 Mon, 21 Dec 2020 06:45:08 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/55] remove TCG includes from common code
Date: Mon, 21 Dec 2020 15:44:14 +0100
Message-Id: <20201221144447.26161-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable removing tcg/$tcg_arch from the include path when TCG is disabled.
Move translate-all.h to include/exec, since stubs exist for the functions
defined therein.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/stubs/tcg-stub.c                      | 1 -
 accel/tcg/cputlb.c                          | 2 +-
 accel/tcg/translate-all.c                   | 2 +-
 accel/tcg/user-exec.c                       | 2 +-
 cpu.c                                       | 2 +-
 hw/i386/kvmvapic.c                          | 1 -
 {accel/tcg => include/exec}/translate-all.h | 0
 monitor/misc.c                              | 1 -
 softmmu/physmem.c                           | 3 +--
 9 files changed, 5 insertions(+), 9 deletions(-)
 rename {accel/tcg => include/exec}/translate-all.h (100%)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index e4bbf997aa..8c18d3eabd 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -12,7 +12,6 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "tcg/tcg.h"
 #include "exec/exec-all.h"
 
 void tb_flush(CPUState *cpu)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 42ab79c1a5..ced3dc077e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -33,7 +33,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic.h"
 #include "qemu/atomic128.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "trace/trace-root.h"
 #include "trace/mem.h"
 #ifdef CONFIG_PLUGIN
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b7d50a73d4..a1803a1026 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -49,7 +49,7 @@
 
 #include "exec/cputlb.h"
 #include "exec/tb-hash.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 4ebe25461a..abb9555201 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -23,7 +23,7 @@
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
 #include "exec/cpu_ldst.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
diff --git a/cpu.c b/cpu.c
index 0c485cdf2d..0b245cda2e 100644
--- a/cpu.c
+++ b/cpu.c
@@ -34,7 +34,7 @@
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/replay.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "exec/log.h"
 
 uintptr_t qemu_host_page_size;
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 077c3f4866..2c1898032e 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -21,7 +21,6 @@
 #include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "migration/vmstate.h"
-#include "tcg/tcg.h"
 #include "qom/object.h"
 
 #define VAPIC_IO_PORT           0x7e
diff --git a/accel/tcg/translate-all.h b/include/exec/translate-all.h
similarity index 100%
rename from accel/tcg/translate-all.h
rename to include/exec/translate-all.h
diff --git a/monitor/misc.c b/monitor/misc.c
index fde6e36a0b..9a132f73d1 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -77,7 +77,6 @@
 #include "qapi/qmp-event.h"
 #include "sysemu/cpus.h"
 #include "qemu/cutils.h"
-#include "tcg/tcg.h"
 
 #if defined(TARGET_S390X)
 #include "hw/s390x/storage-keys.h"
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 2cd1de4a2c..67b53d39e4 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -25,7 +25,6 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/target_page.h"
-#include "tcg/tcg.h"
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
@@ -53,7 +52,7 @@
 
 #include "qemu/rcu_queue.h"
 #include "qemu/main-loop.h"
-#include "translate-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/replay.h"
 
 #include "exec/memory-internal.h"
-- 
2.29.2



