Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938913A16B3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:12:18 +0200 (CEST)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqywL-0006EH-Kr
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqyuW-0003jq-Br
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:10:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lqyuR-0006NJ-4G
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:10:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso4317834wms.1
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SK4Sda9oKAO+kAJdqn+QafWI9XvksejZSvmI3F9R0lo=;
 b=ThhnxJXqlKNpUl5qYUi6A0MSXeZgFTHQMckiI4DPHkoeqz7qS8usBhZ8su0vGTZ2iF
 FODzMTSK7RdUBKP+NaxESlyOILQTRZsRo5lBMyIXa6xzvse/9nK56d7A4wqjgE5ckzlN
 t/8paIt1g9D1UUbGh0o2A65Dj7d/zLnMetFCKhXAokFYFPG/bGbKtKhJPCa2e4tHArxe
 WQ421EjaxNRBhZoZV/GU0p39CrKPkDnJHVZDyIXXghvyn1L2BkAehhKcANcyac9955gy
 uYozoC89NtM/romJsw8tDT7du/eO1wmNo5urq4gY4BPJBoeLrujgmT6zgx/TL02vuUOl
 7dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SK4Sda9oKAO+kAJdqn+QafWI9XvksejZSvmI3F9R0lo=;
 b=dfc77Q9XbMsjpKzLWydypw7E/TRnJ1QKHYs+MIyfe31wLTtsmJLE8yDoQqxZphIeNl
 MRwLXSZ1PeZvPggWWFXnzZ9PrAXs7rmSIClCO55WnmT9OHAUEqOpw4ilZM8o15nZrxG2
 TsZ5gcAicmCk179CeMJLmx85V8DXp3ZKIWtsgJ1TMopCi1MbNh8l8CRebFLnuhsTG1vh
 Y4JjOzS7gQL/OvcFjlb0du89VItkkoLtzS7lsDu2DSxBm2GNu4cUXCdCI+Hpp28Dvac6
 PDRfgi8BTb4iGB+7hE++ECaLEr8Vx7WcThmNbzfqpUDOJzqvprsnYehIZ7p56+y9e6wH
 WFbw==
X-Gm-Message-State: AOAM531HWsfJdBQdf8gBeH78PrpP4mOX+O3gCvHzgHEX5bQMyOtKLYcB
 zk/vPY6d00L2em5KpbBDtVSz9l0edBfxyw==
X-Google-Smtp-Source: ABdhPJxxYSgNV6WU1qc3iTRGMNfGLj5hPfnTOD1rGGyzO0/Xjn03K5FFl2GPQtIdhU6MiAFnPyey5w==
X-Received: by 2002:a05:600c:35c3:: with SMTP id
 r3mr10033186wmq.169.1623247816991; 
 Wed, 09 Jun 2021 07:10:16 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id j12sm24258wrt.69.2021.06.09.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 07:10:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] accel/tcg/cputlb: Extract load_helper_unaligned() from
 load_helper()
Date: Wed,  9 Jun 2021 16:10:09 +0200
Message-Id: <20210609141010.1066750-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609141010.1066750-1-f4bug@amsat.org>
References: <20210609141010.1066750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace a goto statement by an inlined function for easier review.
No logical change intended.

Inspired-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cputlb.c | 54 ++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f24348e9793..2b5d569412c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1851,6 +1851,34 @@ load_memop(const void *haddr, MemOp op)
     }
 }
 
+static inline uint64_t QEMU_ALWAYS_INLINE
+load_helper_unaligned(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
+                      uintptr_t retaddr, MemOp op, bool code_read,
+                      FullLoadHelper *full_load)
+{
+    size_t size = memop_size(op);
+    target_ulong addr1, addr2;
+    uint64_t res;
+    uint64_t r1, r2;
+    unsigned shift;
+
+    addr1 = addr & ~((target_ulong)size - 1);
+    addr2 = addr1 + size;
+    r1 = full_load(env, addr1, oi, retaddr);
+    r2 = full_load(env, addr2, oi, retaddr);
+    shift = (addr & (size - 1)) * 8;
+
+    if (memop_big_endian(op)) {
+        /* Big-endian combine.  */
+        res = (r1 << shift) | (r2 >> ((size * 8) - shift));
+    } else {
+        /* Little-endian combine.  */
+        res = (r1 >> shift) | (r2 << ((size * 8) - shift));
+    }
+
+    return res & MAKE_64BIT_MASK(0, size * 8);
+}
+
 static inline uint64_t QEMU_ALWAYS_INLINE
 load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
             uintptr_t retaddr, MemOp op, bool code_read,
@@ -1866,7 +1894,6 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         code_read ? MMU_INST_FETCH : MMU_DATA_LOAD;
     unsigned a_bits = get_alignment_bits(get_memop(oi));
     void *haddr;
-    uint64_t res;
     size_t size = memop_size(op);
 
     /* Handle CPU specific unaligned behaviour */
@@ -1893,9 +1920,10 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         CPUIOTLBEntry *iotlbentry;
         bool need_swap;
 
-        /* For anything that is unaligned, recurse through full_load.  */
+        /* For anything that is unaligned, recurse through byte loads.  */
         if ((addr & (size - 1)) != 0) {
-            goto do_unaligned_access;
+            return load_helper_unaligned(env, addr, oi, retaddr, op,
+                                         code_read, full_load);
         }
 
         iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
@@ -1932,24 +1960,8 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
     if (size > 1
         && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
                     >= TARGET_PAGE_SIZE)) {
-        target_ulong addr1, addr2;
-        uint64_t r1, r2;
-        unsigned shift;
-    do_unaligned_access:
-        addr1 = addr & ~((target_ulong)size - 1);
-        addr2 = addr1 + size;
-        r1 = full_load(env, addr1, oi, retaddr);
-        r2 = full_load(env, addr2, oi, retaddr);
-        shift = (addr & (size - 1)) * 8;
-
-        if (memop_big_endian(op)) {
-            /* Big-endian combine.  */
-            res = (r1 << shift) | (r2 >> ((size * 8) - shift));
-        } else {
-            /* Little-endian combine.  */
-            res = (r1 >> shift) | (r2 << ((size * 8) - shift));
-        }
-        return res & MAKE_64BIT_MASK(0, size * 8);
+        return load_helper_unaligned(env, addr, oi, retaddr, op,
+                                     code_read, full_load);
     }
 
     haddr = (void *)((uintptr_t)addr + entry->addend);
-- 
2.31.1


