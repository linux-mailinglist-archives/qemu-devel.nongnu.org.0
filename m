Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF953E524
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:48:29 +0200 (CEST)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyE1s-0006Qd-OV
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr6-00020h-DI
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr4-0000XG-JM
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zULr4YP03VtZMbKJkPWJb9O8aKaUTvJuTVWqlVbFzjI=;
 b=YBcDy8Njx12NnulHaHw1W1I5nYLrnxoYhxryfdBXsiMGkkVE6q/C2tqNoAcwal7lKd2SkE
 8tVJTke8KoyhOzX+95h2LVb5A7uyD3+ocHfEIEWRPqzkvz0v9Rdk5PktXlP1depX+EMT6s
 Wg1L67Q9sNnQs/YEhLsZ96gM/ISCKEQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-3hBohOiwN1C-psrmCUYV9g-1; Mon, 06 Jun 2022 10:37:02 -0400
X-MC-Unique: 3hBohOiwN1C-psrmCUYV9g-1
Received: by mail-wm1-f69.google.com with SMTP id
 n15-20020a05600c4f8f00b0039c3e76d646so4422225wmq.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zULr4YP03VtZMbKJkPWJb9O8aKaUTvJuTVWqlVbFzjI=;
 b=hmP93F7KjlZJfEja7Mg60CaQlkcSsrjKXDIEqNyQ8Lyk4SnrcSlIzvBChslfoRGhbe
 rGzHxA6KFiW0y/D/HLF41wkorZ6v7qEEmTBQGv+o95QwMmZQW+esdeuI+Akq8oxlZMsm
 7oK7J/aZRH5lQw0a07MV8uYFJE494P6QX5P/vsleMKqX05UZH9oc8ZYzqm8sr5sJW14R
 I+E+X0to+VAl/xd/lekzGM/9m1oK3TXCl48x13G0Q/dg99Ha7q7yAe275u/5AZ1UpHZi
 /laYQwN02hzKqGPfT4GyFREHaIAIX/sdJuiJUSW/ev7rP+gi12JnkO7Ja2bZ1tgnabOZ
 xroA==
X-Gm-Message-State: AOAM530Eelq7iJVwhFw700r8Vd3CHSyFumM8i5C4trsTrf+LnpZ/3mSo
 bO5RzfTfnzi9aPFjhqCZl78MK1FToQHGqXLbq44ko6Mu2y0/j5MFiOycFTgWdPm6V5Qd7rD45fW
 AOboH/OmMoQhTIgwoc5jB7JLaE5WR2GyNgpXkg/HGNTZBsJfEgs8EqbNy0Dr4v3cH0js=
X-Received: by 2002:a5d:6acb:0:b0:218:426d:5973 with SMTP id
 u11-20020a5d6acb000000b00218426d5973mr3677645wrw.4.1654526221181; 
 Mon, 06 Jun 2022 07:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb8NpsHiLhrKhOVyoq71fpcjB/gLDzSGwoTauN9lS8WKhNUvI2eGUZcLbtd/Kgkf7kw3XMDg==
X-Received: by 2002:a5d:6acb:0:b0:218:426d:5973 with SMTP id
 u11-20020a5d6acb000000b00218426d5973mr3677611wrw.4.1654526220855; 
 Mon, 06 Jun 2022 07:37:00 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b0039c4f0c827fsm3650521wms.26.2022.06.06.07.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 07/29] replay: notify vCPU when BH is scheduled
Date: Mon,  6 Jun 2022 16:36:22 +0200
Message-Id: <20220606143644.1151112-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

vCPU execution should be suspended when new BH is scheduled.
This is needed to avoid guest timeouts caused by the long cycles
of the execution. In replay mode execution may hang when
vCPU sleeps and block event comes to the queue.
This patch adds notification which wakes up vCPU or interrupts
execution of guest code.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

--

v2: changed first_cpu to current_cpu (suggested by Richard Henderson)
v4: moved vCPU notification to aio_bh_enqueue (suggested by Paolo Bonzini)
Message-Id: <165364837317.688121.17680519919871405281.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/cpu-timers.h | 1 +
 softmmu/icount.c            | 8 ++++++++
 stubs/icount.c              | 4 ++++
 util/async.c                | 8 ++++++++
 4 files changed, 21 insertions(+)

diff --git a/include/sysemu/cpu-timers.h b/include/sysemu/cpu-timers.h
index ed6ee5c46c..2e786fe7fb 100644
--- a/include/sysemu/cpu-timers.h
+++ b/include/sysemu/cpu-timers.h
@@ -59,6 +59,7 @@ int64_t icount_round(int64_t count);
 /* if the CPUs are idle, start accounting real time to virtual clock. */
 void icount_start_warp_timer(void);
 void icount_account_warp_timer(void);
+void icount_notify_exit(void);
 
 /*
  * CPU Ticks and Clock
diff --git a/softmmu/icount.c b/softmmu/icount.c
index 5ca271620d..1cafec5014 100644
--- a/softmmu/icount.c
+++ b/softmmu/icount.c
@@ -486,3 +486,11 @@ void icount_configure(QemuOpts *opts, Error **errp)
                    qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                    NANOSECONDS_PER_SECOND / 10);
 }
+
+void icount_notify_exit(void)
+{
+    if (icount_enabled() && current_cpu) {
+        qemu_cpu_kick(current_cpu);
+        qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
+    }
+}
diff --git a/stubs/icount.c b/stubs/icount.c
index f13c43568b..6df8c2bf7d 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -43,3 +43,7 @@ void icount_account_warp_timer(void)
 {
     abort();
 }
+
+void icount_notify_exit(void)
+{
+}
diff --git a/util/async.c b/util/async.c
index 554ba70cca..63434ddae4 100644
--- a/util/async.c
+++ b/util/async.c
@@ -33,6 +33,7 @@
 #include "block/raw-aio.h"
 #include "qemu/coroutine_int.h"
 #include "qemu/coroutine-tls.h"
+#include "sysemu/cpu-timers.h"
 #include "trace.h"
 
 /***********************************************************/
@@ -84,6 +85,13 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
     }
 
     aio_notify(ctx);
+    /*
+     * Workaround for record/replay.
+     * vCPU execution should be suspended when new BH is set.
+     * This is needed to avoid guest timeouts caused
+     * by the long cycles of the execution.
+     */
+    icount_notify_exit();
 }
 
 /* Only called from aio_bh_poll() and aio_ctx_finalize() */
-- 
2.36.1



