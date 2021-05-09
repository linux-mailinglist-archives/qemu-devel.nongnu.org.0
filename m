Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B3377744
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:20:36 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflER-0003sA-UP
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAq-0005Wf-B3
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:52 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lflAo-0005V9-A6
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:16:51 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso8518150wmc.1
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3bnpttYgG4ezXee8lT9HJOsRveBPtRPILa4oFFuqprE=;
 b=osc5IKhWZlmxnjUqS3ynEKiJ9ZLjdsnW1rXo0iuLcadDx16EkixhiG0SoJprl+cfr7
 1YU3nGqcj2KXRTSW4SVXlsYSLi7UCoT0OimNnrubfEhJyBNS9uK/f5wH2kHATKbFykVu
 vTqTV5LP6TOPfI4uVJ4XNwdVFE+esK1Z/Kc6k1AQoG+ddZnk72LDrU5ljwuybbeP6M6t
 JhkyvqyhWwyXz5Odl6Wuqx4XvpiDpMAMsC+ZQBV5Q1J5A4foPMKNoNzel/85TfjrdY0+
 LUCJ3xRS6BOODV3QyLL8XDtVk+jXug+jvZsYEuD2oANhDDU9YykduwtNO5UbDdmlgRez
 1l5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3bnpttYgG4ezXee8lT9HJOsRveBPtRPILa4oFFuqprE=;
 b=ZZklmtYsoRyMOWP10PZ5qWs30FRbgU+NfyG8fA7KYyjpgODC2fUFJL6Bo6FFZxTn9f
 oVpQFbNDKuuYs+84YlEKKPapsviVXzSBEEgzzoHjhVCv69TQCBGVHRNt1AgWzK/kJGLz
 o+V9N6sS7bCvSud/Cq58HvSrMcoNH5+XyEMHIgaw6+XjzQJJ7b8eAgcS0ELDmlJl81ye
 fM2U8bjBTMbMx5aH2YddMprwOioGVpsEUk+QBx01BJKI4Pev2PlhYzu8GPoFXK+mXyxA
 Qh360VWb216dsqVTuX0Opm0YJJ+oGBvTccIGqF4OWQSBpQDDDtMWgibg5JImkdGmJU8O
 rw1Q==
X-Gm-Message-State: AOAM532awvyZ8agQiz7wKcwQ69/a1rZ5gW9UMZGXrn+MQA9GjGSiQS35
 nXtUaVz6TUi7EWQ1PToAjhE6BPtSWO+KM9XE
X-Google-Smtp-Source: ABdhPJzDoteND6sxI5hbeoqJwZA5+bLqVx8cdnWFybfHD1zGcv9jwrlDs+Qoa1igk4tqdKsRy/Srvg==
X-Received: by 2002:a1c:ba86:: with SMTP id k128mr33043298wmf.65.1620573408866; 
 Sun, 09 May 2021 08:16:48 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 3sm15610156wms.30.2021.05.09.08.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 08:16:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] accel/tlb: Add tlb_flush_range_by_mmuidx_all_cpus_synced()
Date: Sun,  9 May 2021 17:16:15 +0200
Message-Id: <20210509151618.2331764-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210509151618.2331764-1-f4bug@amsat.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
 include/exec/exec-all.h | 12 ++++++++++++
 accel/tcg/cputlb.c      | 27 ++++++++++++++++++++-------
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9a3dbb7ec08..8021adf38f4 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -281,6 +281,11 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, target_ulong addr,
 void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu, target_ulong addr,
                                         target_ulong len, uint16_t idxmap,
                                         unsigned bits);
+void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                               target_ulong addr,
+                                               target_ulong len,
+                                               uint16_t idxmap,
+                                               unsigned bits);
 
 /**
  * tlb_set_page_with_attrs:
@@ -397,6 +402,13 @@ static inline void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu,
                                                       unsigned bits)
 {
 }
+static inline void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
+                                                             target_ulong addr,
+                                                             target_long len,
+                                                             uint16_t idxmap,
+                                                             unsigned bits)
+{
+}
 #endif
 /**
  * probe_access:
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5314349ef9d..bc4370f4e21 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -924,16 +924,20 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
                                        idxmap, bits);
 }
 
-void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
-                                                   target_ulong addr,
-                                                   uint16_t idxmap,
-                                                   unsigned bits)
+void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                               target_ulong addr,
+                                               target_ulong len,
+                                               uint16_t idxmap,
+                                               unsigned bits)
 {
     TLBFlushRangeData d;
     run_on_cpu_data runon;
 
-    /* If all bits are significant, this devolves to tlb_flush_page. */
-    if (bits >= TARGET_LONG_BITS) {
+    /*
+     * If all bits are significant, and len is small,
+     * this devolves to tlb_flush_page.
+     */
+    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
         tlb_flush_page_by_mmuidx_all_cpus_synced(src_cpu, addr, idxmap);
         return;
     }
@@ -945,7 +949,7 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
 
     /* This should already be page aligned */
     d.addr = addr & TARGET_PAGE_MASK;
-    d.len = TARGET_PAGE_SIZE;
+    d.len = len;
     d.idxmap = idxmap;
     d.bits = bits;
 
@@ -972,6 +976,15 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
     }
 }
 
+void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                                   target_ulong addr,
+                                                   uint16_t idxmap,
+                                                   unsigned bits)
+{
+    tlb_flush_range_by_mmuidx_all_cpus_synced(src_cpu, addr, TARGET_PAGE_SIZE,
+                                              idxmap, bits);
+}
+
 /* update the TLBs so that writes to code in the virtual page 'addr'
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
-- 
2.26.3


