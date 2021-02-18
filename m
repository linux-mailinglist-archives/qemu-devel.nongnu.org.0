Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BE031E82D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:59:10 +0100 (CET)
Received: from localhost ([::1]:34314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg5V-0003Y0-Tg
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuK-00075e-F1
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:36 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuF-0007If-Ko
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:36 -0500
Received: by mail-wr1-x42b.google.com with SMTP id 7so2223434wrz.0
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cfDw5C6zvUmFdQECRjitQbGFP3IAXxbCAzqXHPWLjR0=;
 b=tJNa3xcpbF/wfS3dZoq1UjDb4tqq4g5CYyFftQJNjLwOSEtKgtp7mDzJAiETHHEdTa
 WMX/WrK4W+lYikTxtgQzrwsG2Kir9Of3oI2/jW96F8enXr7y2TduwoTE0pmCZJwbpXnr
 NyMEClPinG+Argfwxtaqxo1rtbY+ce8VZOeTvcQw44796OekiA4XwwXa83SUanDp6J/B
 C1cqQzMRhhfoO1xxYzKH2mULd2vj+ETmkDIxIrxo3Fd64HgaP3zeQskODgtOfpRBHcAt
 Kn5pXcN8mfO3pS2JITlasA4fPqehIJZC+zxV+uLsfEjQxXlDBXCAFub4PA0ViH7gtzP4
 uB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cfDw5C6zvUmFdQECRjitQbGFP3IAXxbCAzqXHPWLjR0=;
 b=OtpOdsHijf5SpJn4XCde3RmbTqCXQFuohICHW1MQXCt4nkPAJ5tiTgFxBl5D4otjgT
 pgESiY3w30bhtjv8J5vn92T58NzDRiL4Qu5gGONiw8Mc0XtLf6JcELTkS9K37A+zDIgY
 qtPlghv7P1tU3ctKL89pwtBCf8GlqT/OAVVnhM7cEqLwejsiLYjh8rjvArsTW34ju2Kv
 AsAoK3vICagHB2k2ITRciODHLP2ChfNk5paaUdDh6P+tUDJfoW1rdJ62qDSK+O9sL5Tg
 MTcKB3MFklNGiC7jpNe+tajy1MdSUMnptfCiyVFF/L5m2nBOQvzutNEaI83jaQnFTLCB
 MCpQ==
X-Gm-Message-State: AOAM532imSDD0YTKsgO1Rmro0BwF+BBeV50qzmbh48fKB01sKfWJ7HEq
 m6Y/E9PZjjLRUstMkvmhg656MA==
X-Google-Smtp-Source: ABdhPJzMXOkjnIR7JWzXGS9NPKiu5GpsYsMVovHz1k9ddNe07+jXCsOMbnqVWXnP8YovFcGiTlWi4Q==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr3471481wrg.171.1613641650314; 
 Thu, 18 Feb 2021 01:47:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm6690599wmi.25.2021.02.18.01.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9CB41FFA6;
 Thu, 18 Feb 2021 09:47:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/23] accel/tcg: re-factor non-RAM execution code
Date: Thu, 18 Feb 2021 09:47:01 +0000
Message-Id: <20210218094706.23038-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no real need to use CF_NOCACHE here. As long as the TB isn't
linked to other TBs or included in the QHT or jump cache then it will
only get executed once.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-19-alex.bennee@linaro.org>

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index c0b98e76b9..72b3c663c5 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1779,7 +1779,8 @@ static inline void tb_page_add(PageDesc *p, TranslationBlock *tb,
 #endif
 }
 
-/* add a new TB and link it to the physical page tables. phys_page2 is
+/*
+ * Add a new TB and link it to the physical page tables. phys_page2 is
  * (-1) to indicate that only one page contains the TB.
  *
  * Called with mmap_lock held for user-mode emulation.
@@ -1798,17 +1799,6 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
 
     assert_memory_lock();
 
-    if (phys_pc == -1) {
-        /*
-         * If the TB is not associated with a physical RAM page then
-         * it must be a temporary one-insn TB, and we have nothing to do
-         * except fill in the page_addr[] fields.
-         */
-        assert(tb->cflags & CF_NOCACHE);
-        tb->page_addr[0] = tb->page_addr[1] = -1;
-        return tb;
-    }
-
     /*
      * Add the TB to the page list, acquiring first the pages's locks.
      * We keep the locks held until after inserting the TB in the hash table,
@@ -1881,9 +1871,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     phys_pc = get_page_addr_code(env, pc);
 
     if (phys_pc == -1) {
-        /* Generate a temporary TB with 1 insn in it */
-        cflags &= ~CF_COUNT_MASK;
-        cflags |= CF_NOCACHE | 1;
+        /* Generate a one-shot TB with 1 insn in it */
+        cflags = (cflags & ~CF_COUNT_MASK) | 1;
     }
 
     cflags &= ~CF_CLUSTER_MASK;
@@ -2097,6 +2086,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         tb_reset_jump(tb, 1);
     }
 
+    /*
+     * If the TB is not associated with a physical RAM page then
+     * it must be a temporary one-insn TB, and we have nothing to do
+     * except fill in the page_addr[] fields. Return early before
+     * attempting to link to other TBs or add to the lookup table.
+     */
+    if (phys_pc == -1) {
+        tb->page_addr[0] = tb->page_addr[1] = -1;
+        return tb;
+    }
+
     /* check next page if needed */
     virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
     phys_page2 = -1;
-- 
2.20.1


