Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9600937774B
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:24:28 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflIB-0004QJ-NV
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAz-0005hF-FV
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:17:02 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAy-0005b1-0w
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:17:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d4so13977038wru.7
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfEaQ4EAwk2GCSA1RWFu6Z5MyJScidZlbaMXLPjmHKE=;
 b=UP8p4G6rA/RVX2OKyHprWHy4N0nuUZqLfWQ/U/+0QvWs+YMLjAIzV4C701tY0p47SK
 HidqmYLj36nzXXxm2QWIkY1bxW357BMBK8WghoFdsW3tXcAcBy6F5wsKxBUH0f/gjLmS
 TqzUi+6t7tX8OZtO82Zn41lzRJ0VXLGDuwMNFYZwcs6MNl3edoAiTtA1f/iJRdx5rZqM
 NHJhQoBOadyJd9DjDB/DygetL8S8AqkJOYtEZ1Qd+WccgDKiXU/jbyqWDJ/wdK3BMBwj
 TN8DRqBIyfGdm6cyevX1Z/01KQ+Id41LbHXacP6vxtOLwP2UYPgLkSUiewIlVf/Wn6ii
 bhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KfEaQ4EAwk2GCSA1RWFu6Z5MyJScidZlbaMXLPjmHKE=;
 b=GajJVHuot8gfNMedJPPILZhPCDbH8mwFZClPVpxxzYg1LD04zy/O5lE1MyOTD7X5nT
 QmZhLzex+Ofsi695qbXeJ/Ar+fpniqa14u1d46WSJfLoGQNiyESSIOL9fVlENqBWFH1d
 0wQfvABlmwko1MbpkoDqXD01/z6IKBA9rl7Fhz20ig6m4eYpFLe6RKiefLzF4zz46FOO
 aew+QhndAhTRxI+w4gYU9MuxOoEaG2+E0xsQ0ajbza8CN7l21wJFhYOGHyiPDXsAFCYT
 u5Pwwsiz17/1tWyc4bGpYCzBlYbgrzi2L9uN3yCFtjB4qtInFnyORJxBgKBbaH7/dO4+
 YKrA==
X-Gm-Message-State: AOAM5332pn9SJrpNGBeSrXR44aWGCKH5z0J1+kIeblmAgVSfDnY7u+7Q
 u7GBXkr/W0FNUc5Gxa+hW4gY2WZ86jwxyVLE
X-Google-Smtp-Source: ABdhPJyWzFy7thHUevzSrmW7x5SHu0PBD1fWozzcKZ0PbNnbtyUuKCWwHuqv4f/sR5G74KZjciG7bQ==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr25027460wrr.289.1620573418039; 
 Sun, 09 May 2021 08:16:58 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h9sm15788362wmb.35.2021.05.09.08.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] accel/tlb: Rename tlb_flush_[page_bits >
 range]_by_mmuidx_async_[2 > 1]
Date: Sun,  9 May 2021 17:16:17 +0200
Message-Id: <20210509151618.2331764-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
 accel/tcg/cputlb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 47c83f0fc83..ad0e44bce63 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -816,8 +816,8 @@ static void tlb_flush_page_bits_by_mmuidx_async_1(CPUState *cpu,
     tlb_flush_range_by_mmuidx_async_0(cpu, decode_runon_to_pbm(runon));
 }
 
-static void tlb_flush_page_bits_by_mmuidx_async_2(CPUState *cpu,
-                                                  run_on_cpu_data data)
+static void tlb_flush_range_by_mmuidx_async_1(CPUState *cpu,
+                                              run_on_cpu_data data)
 {
     TLBFlushRangeData *d = data.host_ptr;
     tlb_flush_range_by_mmuidx_async_0(cpu, *d);
@@ -858,7 +858,7 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
     } else {
         /* Otherwise allocate a structure, freed by the worker.  */
         TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
-        async_run_on_cpu(cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+        async_run_on_cpu(cpu, tlb_flush_range_by_mmuidx_async_1,
                          RUN_ON_CPU_HOST_PTR(p));
     }
 }
@@ -906,7 +906,7 @@ void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
             if (dst_cpu != src_cpu) {
                 TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
                 async_run_on_cpu(dst_cpu,
-                                 tlb_flush_page_bits_by_mmuidx_async_2,
+                                 tlb_flush_range_by_mmuidx_async_1,
                                  RUN_ON_CPU_HOST_PTR(p));
             }
         }
@@ -964,13 +964,13 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
         CPU_FOREACH(dst_cpu) {
             if (dst_cpu != src_cpu) {
                 p = g_memdup(&d, sizeof(d));
-                async_run_on_cpu(dst_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+                async_run_on_cpu(dst_cpu, tlb_flush_range_by_mmuidx_async_1,
                                  RUN_ON_CPU_HOST_PTR(p));
             }
         }
 
         p = g_memdup(&d, sizeof(d));
-        async_safe_run_on_cpu(src_cpu, tlb_flush_page_bits_by_mmuidx_async_2,
+        async_safe_run_on_cpu(src_cpu, tlb_flush_range_by_mmuidx_async_1,
                               RUN_ON_CPU_HOST_PTR(p));
     }
 }
-- 
2.26.3


