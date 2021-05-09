Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF137774A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:24:20 +0200 (CEST)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflI3-00047n-P6
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAy-0005dS-8P
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:17:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:47075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAt-0005Xw-12
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id x5so13976248wrv.13
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCTOx52drStOjJYnYYWJbRH789MMpjX8vG5a6xW98dQ=;
 b=NSU64zPYmZnqixhPtvUi6X7zufYLr2P7blPUIikQSxYw+uHgoYd/MNkTT1BQNYyt+W
 Ofg1D5Ta/3m5olbdVck00XWlevNDGDXjYVY8XtcIZyp7NxIDHbNAsDih3xMA2YoWMi/P
 Z3wzKtYI4ZF2nBxPzLX1Btiz8VFKkMBGRyHQ3jTRXguy7BkI5z000JIPMDoLQQMKfl0a
 vmVanWA5W+LTRh5p72QswrAjzBUAKM1qS8gUn9Wtyi5xGNjYOsKEbccilCWsPAOgIfzP
 joT4Ctb0CppRgLfUAhbicj9kLKWILmE0yvGRXgVBK/6uok02zwzP4nULHEwJZRoj7Ygy
 6JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SCTOx52drStOjJYnYYWJbRH789MMpjX8vG5a6xW98dQ=;
 b=LHQoEF5ZuLdHvH5kNBMG/YO1dHXnE3zIWWQRH0ACc2m7mbFjgYU6XUjmfd192fhkzf
 dJJ7kyTN8EgBcGxAfut/55kSvYHa7r8fi1Hc2It2E4wqzoxfZxay2o4ZLj6INGyEsNSR
 HK2PMcp0YiwwtnZxO6rZo9W8J59RfBdtjLYYJRh2miVw1RhbgWwEIlBeiLu/oiWwMhco
 3O4VERm/iZvOTChOvoOTc8SmcCZSMtUD4Ps9nVNB9do2+4waWdekc4b7THx8szyAwG9M
 UfmIKWRM5/iFEjkhLZ89m6+1uXIav9QmYL5DqXZBbPAHPLCsmVpqWUPJ4Sf+JiFPZ/gO
 3c4A==
X-Gm-Message-State: AOAM532FBESTYo0HMUc9/HOkoTqA6k4E82NOdKEVFdqZaSrIq4vu4t4R
 dH7CNoJo9f1eoEytOQv2/atWMSPYzQBv3BFD
X-Google-Smtp-Source: ABdhPJwBSaN0h39LSdW3fu5YdXKHDkLIsBGf+G0rJ1vFrk3fplnqo+14gnEnmB2LyQEE+z24YdbSqg==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr25841657wrn.253.1620573413449; 
 Sun, 09 May 2021 08:16:53 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id m5sm4561059wrs.76.2021.05.09.08.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] accel/tcg: Rename tlb_flush_page_bits ->
 range]_by_mmuidx_async_0
Date: Sun,  9 May 2021 17:16:16 +0200
Message-Id: <20210509151618.2331764-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cputlb.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index bc4370f4e21..47c83f0fc83 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -764,9 +764,8 @@ typedef struct {
     uint16_t bits;
 } TLBFlushRangeData;
 
-static void
-tlb_flush_page_bits_by_mmuidx_async_0(CPUState *cpu,
-                                      TLBFlushRangeData d)
+static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
+                                              TLBFlushRangeData d)
 {
     CPUArchState *env = cpu->env_ptr;
     int mmu_idx;
@@ -814,14 +813,14 @@ decode_runon_to_pbm(run_on_cpu_data data)
 static void tlb_flush_page_bits_by_mmuidx_async_1(CPUState *cpu,
                                                   run_on_cpu_data runon)
 {
-    tlb_flush_page_bits_by_mmuidx_async_0(cpu, decode_runon_to_pbm(runon));
+    tlb_flush_range_by_mmuidx_async_0(cpu, decode_runon_to_pbm(runon));
 }
 
 static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
                                                   run_on_cpu_data data)
 {
     TLBFlushRangeData *d = data.host_ptr;
-    tlb_flush_page_bits_by_mmuidx_async_0(cpu, *d);
+    tlb_flush_range_by_mmuidx_async_0(cpu, *d);
     g_free(d);
 }
 
@@ -853,7 +852,7 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
     d.bits = bits;
 
     if (qemu_cpu_is_self(cpu)) {
-        tlb_flush_page_bits_by_mmuidx_async_0(cpu, d);
+        tlb_flush_range_by_mmuidx_async_0(cpu, d);
     } else if (encode_pbm_to_runon(&runon, d)) {
         async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_1, runon);
     } else {
@@ -913,7 +912,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
         }
     }
 
-    tlb_flush_page_bits_by_mmuidx_async_0(src_cpu, d);
+    tlb_flush_range_by_mmuidx_async_0(src_cpu, d);
 }
 
 void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
-- 
2.26.3


