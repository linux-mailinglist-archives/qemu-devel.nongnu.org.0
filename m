Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19E1390511
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:17:59 +0200 (CEST)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYog-0000aY-TY
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYax-000269-9f
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYav-0004CR-Dm
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:47 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p7so28888660wru.10
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xJQGPPKuv/kA1nVYDPZJoGnXK3R8JXxcOwmAJZi+OLw=;
 b=ZxR9cSWUV5A7oVJqx8sMU5zNGyHI73IR6NiZPCpt7XR4/3WZALjZZP29ym0bX5HAba
 tyAqalMOakJTUrsZKJYAf62BBtfnYNH+8KvAajxafo769/TSA+GlAcV8BtiSD9UkhabN
 LItuSXLYrMnCAwpOLvnO+Y/Hm9N2D+Qc1XQUZJdIEi5iaQhf1Dmq17sk0LQHT1VvmOzD
 PxPgK8zs2kSICUg7ir3c50dx2OrdeU6V6sgiQrtwaIvAj90BqFy+igP+X7+R2b4/jLyI
 ZTDgQG1ZRV2q5hG2jJOJ10pEr+s9pERLDWfS/8Kk54E5ZU+Ul/h8xH6+0mLEPW8czJF8
 Gp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJQGPPKuv/kA1nVYDPZJoGnXK3R8JXxcOwmAJZi+OLw=;
 b=Ci3AQxWQUJkPABICD/73ozWgcqBz90ca7WupQZnA/k6aTTMIrMFzvRIHB39NYtJRhl
 vsqYv70iIRrThU5ruMV/tGscrfMENLCre6o8ayEvW3hg/ueOdDgW9g2SzAfPwfMGLdok
 W+X08br9z5HNnZSERMPPO/Oo4KnXBwSj2EJi09InRyHUQDuljcd3a9xKJZ0K1qH3k2VN
 lzpP55ilW8h8ir8a2jo6zxhmUNRkd1fnoWAWBKHid0Fd9QiL+4BmYl91bq/0OFIVF0wi
 +NE1Fgi2eP2f5hWbKzWzCbCWF95YOlYrhW5NLL+0LziuWslBFH2XT3cHiW/qvNDGhGky
 XWMA==
X-Gm-Message-State: AOAM5313Euon2BTL5mlwmbwTZbQOtxiCgVDqtnnBV8L4xXqakJ1kA7sd
 H54CZihIAMEYQQ9IzJze6M7bKqySvVD/OU7T
X-Google-Smtp-Source: ABdhPJxOy81ih7y7hVr8L6V0M9B9sRXrIJ9+O4yBpZZVgOBULnJQmfOi1BcOcl0wkwRteNGhOx8vpQ==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr28109523wru.19.1621955024185; 
 Tue, 25 May 2021 08:03:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 017/114] accel/tcg: Rename tlb_flush_page_bits ->
 range]_by_mmuidx_async_0
Date: Tue, 25 May 2021 16:01:47 +0100
Message-Id: <20210525150324.32370-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Rename to match tlb_flush_range_locked.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210509151618.2331764-8-f4bug@amsat.org
Message-Id: <20210508201640.1045808-1-richard.henderson@linaro.org>
[PMD: Split from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 accel/tcg/cputlb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4b3ac7093cb..596b87c876b 100644
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
@@ -793,7 +792,7 @@ static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
                                                   run_on_cpu_data data)
 {
     TLBFlushRangeData *d = data.host_ptr;
-    tlb_flush_page_bits_by_mmuidx_async_0(cpu, *d);
+    tlb_flush_range_by_mmuidx_async_0(cpu, *d);
     g_free(d);
 }
 
@@ -824,7 +823,7 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
     d.bits = bits;
 
     if (qemu_cpu_is_self(cpu)) {
-        tlb_flush_page_bits_by_mmuidx_async_0(cpu, d);
+        tlb_flush_range_by_mmuidx_async_0(cpu, d);
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
         TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
@@ -876,7 +875,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
         }
     }
 
-    tlb_flush_page_bits_by_mmuidx_async_0(src_cpu, d);
+    tlb_flush_range_by_mmuidx_async_0(src_cpu, d);
 }
 
 void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
-- 
2.20.1


