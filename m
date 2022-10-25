Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516CA60D1EA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:49:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMzi-0007Xf-Ea; Tue, 25 Oct 2022 12:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMz2-0006hZ-Cn
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyg-0001lC-Nd
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:50 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bu30so22089775wrb.8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+Huf0vTV0723KK8XSSSroit5uyfCugRgjfLfrDKUKmw=;
 b=HoXm89nUZP0V8/7l1odxIt0Yy0+ky/TyxzEQpyLF2fkBCWYv166yzen4yzQSkzjvxH
 OP8zsnwh/koOMtbtOpl7OzppHcuShhrw6hzU8JJK//4d/l2TAcOj7tfOQ1yetOlLUV4P
 ErqsEmnJS7oVgjQtZ4D7lRm4+u9C4Z3u6BPJEe2OVprfcMzgjxFGwqQI07Z53oXq2sTW
 uuoq1jOqGfzV4PFBaEHmJ0ULvAKIBFv/zhKltcr84fumZCTm9JYhhVddrGZVLPe6a6pD
 7V4H2SLEEfBdyZZP5X3cOo4mqbZuCNKHXxg/4jU7P2wBDOOLCXiJ4SiXD0Zj00JUEsfm
 i2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Huf0vTV0723KK8XSSSroit5uyfCugRgjfLfrDKUKmw=;
 b=0E22aWJkQ+k95j1Bq/sbk9EGlNOwAkV+83+Lg4eTDi+dbkn3ipIKZNVDHJHC65786d
 jdVZ8SpMdUKmb6887IycX51HWF8KT0J8uh8DKaAvEJqP3gL6JAlIW1kWLJxZSj5Wm9k2
 B7ajjE3Wodzfkdr4FXXgVhvZ3UadkirRQuC3JMNNoZLYGrPWHM1QXy3A/w1BjkfKD8Kt
 Cmxl1jyaX8F+9VJ4Wsbu8ffgvQy07ex06cP4HfUD5Zv9d1rsZ8+EoKJAGUHfl80PyWjD
 SBS52x/RTLnkHhCh60i1QufmslheV9lH7nJtSCXqnOc566hqThdASAEUZyBAotIoio2m
 aKMg==
X-Gm-Message-State: ACrzQf3hDfP3WjX2AMIbuteQgjwWjMKr6RheBJ5pLcGZknVwz/6ldk1I
 o9ob3KbjQTowJYDk4lI9O4kIl92L45aDag==
X-Google-Smtp-Source: AMsMyM40tkRFlk3z5df8TwgJivmqfqssnxmoqXcR+jOGnJGMAvmSlpMV51bP25kEg/xXsw3bCUdqyg==
X-Received: by 2002:a05:6000:42:b0:236:6c52:bc22 with SMTP id
 k2-20020a056000004200b002366c52bc22mr9674668wrx.692.1666716024833; 
 Tue, 25 Oct 2022 09:40:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/30] m68k/virt: do not re-randomize RNG seed on snapshot load
Date: Tue, 25 Oct 2022 17:39:48 +0100
Message-Id: <20221025163952.4131046-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Snapshot loading is supposed to be deterministic, so we shouldn't
re-randomize the various seeds used.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-id: 20221025004327.568476-7-Jason@zx2c4.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/m68k/virt.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 89c4108eb54..da5eafd2756 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -89,7 +89,6 @@ typedef struct {
     M68kCPU *cpu;
     hwaddr initial_pc;
     hwaddr initial_stack;
-    struct bi_record *rng_seed;
 } ResetInfo;
 
 static void main_cpu_reset(void *opaque)
@@ -98,16 +97,18 @@ static void main_cpu_reset(void *opaque)
     M68kCPU *cpu = reset_info->cpu;
     CPUState *cs = CPU(cpu);
 
-    if (reset_info->rng_seed) {
-        qemu_guest_getrandom_nofail((void *)reset_info->rng_seed->data + 2,
-            be16_to_cpu(*(uint16_t *)reset_info->rng_seed->data));
-    }
-
     cpu_reset(cs);
     cpu->env.aregs[7] = reset_info->initial_stack;
     cpu->env.pc = reset_info->initial_pc;
 }
 
+static void rerandomize_rng_seed(void *opaque)
+{
+    struct bi_record *rng_seed = opaque;
+    qemu_guest_getrandom_nofail((void *)rng_seed->data + 2,
+                                be16_to_cpu(*(uint16_t *)rng_seed->data));
+}
+
 static void virt_init(MachineState *machine)
 {
     M68kCPU *cpu = NULL;
@@ -289,9 +290,10 @@ static void virt_init(MachineState *machine)
         BOOTINFO0(param_ptr, BI_LAST);
         rom_add_blob_fixed_as("bootinfo", param_blob, param_ptr - param_blob,
                               parameters_base, cs->as);
-        reset_info->rng_seed = rom_ptr_for_as(cs->as, parameters_base,
-                                              param_ptr - param_blob) +
-                               (param_rng_seed - param_blob);
+        qemu_register_reset_nosnapshotload(rerandomize_rng_seed,
+                            rom_ptr_for_as(cs->as, parameters_base,
+                                           param_ptr - param_blob) +
+                            (param_rng_seed - param_blob));
         g_free(param_blob);
     }
 }
-- 
2.25.1


