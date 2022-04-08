Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B134F9B41
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:01:42 +0200 (CEST)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncrzR-0006Yw-7I
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmK-00077n-LB
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ncrmH-000329-IU
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 12:48:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 v20-20020a05600c15d400b0038e9a88aee7so2832603wmf.3
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5QMnRBg+xsQZXK1fOjdgSZIM6gbUBuP2/PqplwQya4U=;
 b=envHThycnfrlKgSxI3LryjAquBJUq/K8cjQyjamVpUXlCCbI4A/y90tNcWMlydh2xK
 Sqa2fLzx/+A4yzwwULjum4jx9a87PpPMvVo/RgKq+3clNPWCgZwcFSsnnG0Y0B0khz/G
 8gwiLeJ/vSaDjV0Hcf0oWMr9ahxvvTIFFDPmvFs53sMedteY/JCS2VpDY3sV6Ix3kDey
 QEEvtwKAZGo1fd1hNmn6bNFgqjdxIeAqScAtPPvb3Jr8AWeYKRUSbjNQvDs5HGK5/sAX
 oYlvS6AVnNhHc3DpYkIu5KK68L6CEo1/9mDIiCCkkNWXuuJybiXC6UnJYq0AFqQ9OTRz
 QUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5QMnRBg+xsQZXK1fOjdgSZIM6gbUBuP2/PqplwQya4U=;
 b=t09FUwAOK70a9SFiFHXQPtaY62Ln+uPa2HvxE4wRX6dm0ym67NIhMGUp1sNy4Zwj4W
 Y0lehSxQZeYy0xMc9JGCCOw0b3tA05iQSAU5B3lZS5Z8yFv1J8S0+waFmzBUxVH7VkVS
 2mv2qNhUFElu9MdfHFtwo3wR89COdY2Z9+n7uYlazslj4KwtEr+AV2oInXTueDQM7cul
 aSsdP/L10N88l8GV81XDQgZD7zF5DDIjGBdc7ozozUbMQQkQn5lWc2n6LtFUa97JQSok
 YpPKLE7gPaGN50HBtrLSf1BfruneAT8H+KqGZ404w2gqnj7qAOuKlMMOPC48zZtw4Cw8
 BIhA==
X-Gm-Message-State: AOAM531qUUkH2uypZDXjsRNzdnZ13F9LezRf4Lo3hI6uIAOOypiDkDFX
 FCXOcJbR2GvyhikI89tpsly9Hg==
X-Google-Smtp-Source: ABdhPJwLqQbwec3sGbs//MzwQVH/HJZvSk0CsLO4dBL25IVQU5LGWiYAMfAfJS9ePa+qdzf3TT050A==
X-Received: by 2002:a05:600c:3b99:b0:38e:aa31:a864 with SMTP id
 n25-20020a05600c3b9900b0038eaa31a864mr2264200wms.108.1649436474820; 
 Fri, 08 Apr 2022 09:47:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b0038e72a95ec4sm12128194wms.13.2022.04.08.09.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:47:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B3201FFC0;
 Fri,  8 Apr 2022 17:47:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 09/15] cputlb: add tracepoints for the protect/unprotect
 helpers
Date: Fri,  8 Apr 2022 17:47:36 +0100
Message-Id: <20220408164742.2844631-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408164742.2844631-1-alex.bennee@linaro.org>
References: <20220408164742.2844631-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This helps track when pages are tagged for detecting code changes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c     | 14 ++++++++++----
 accel/tcg/trace-events |  3 +++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 35797cea49..f2983cb2fc 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -947,18 +947,24 @@ void tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                                               idxmap, bits);
 }
 
-/* update the TLBs so that writes to code in the virtual page 'addr'
-   can be detected */
+/*
+ * Update the TLBs so that writes to code in the virtual page 'ram_addr'
+ * can be detected.
+ */
 void tlb_protect_code(ram_addr_t ram_addr)
 {
+    trace_tlb_protect_code(ram_addr);
     cpu_physical_memory_test_and_clear_dirty(ram_addr, TARGET_PAGE_SIZE,
                                              DIRTY_MEMORY_CODE);
 }
 
-/* update the TLB so that writes in physical page 'phys_addr' are no longer
-   tested for self modifying code */
+/*
+ * Update the TLB so that writes in physical page 'ram_addr' are no longer
+ * tested for self modifying code
+ */
 void tlb_unprotect_code(ram_addr_t ram_addr)
 {
+    trace_tlb_unprotect_code(ram_addr);
     cpu_physical_memory_set_dirty_flag(ram_addr, DIRTY_MEMORY_CODE);
 }
 
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index f4d1321b1b..e11e59492f 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -7,6 +7,9 @@ exec_tb_nocache(void *tb, uintptr_t pc) "tb:%p pc=0x%"PRIxPTR
 exec_tb_exit(void *last_tb, unsigned int flags) "tb:%p flags=0x%x"
 
 # cputlb.c
+tlb_protect_code(uint64_t ram_addr) "0x%" PRIx64""
+tlb_unprotect_code(uint64_t ram_addr) "0x%" PRIx64""
+
 memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
 memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
 
-- 
2.30.2


