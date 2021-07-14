Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8516B3C8775
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:29:37 +0200 (CEST)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gpM-0005h3-JA
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gV0-0007Af-Gs
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUy-00045F-TI
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:34 -0400
Received: by mail-wr1-x433.google.com with SMTP id f9so3612011wrq.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwsUwBTLZFfTsKglJpuTCG7rL3bqmkHOdoMoH79RLik=;
 b=Vb23rUyThkzOSQ5V7Z0HQuRSFK5Oj1TM2dOqika8Nq0B/+J/DYlGoj/mdfGTexs9g1
 Hj5mhyu2KZ4baBQ17k/cqxJ9EVSrX+DTFP3vn4pT36Erpv1A48oKyGpKvTM8SOQ7cIji
 Xn9B+r+0/rS0zQMONRD40iD2VlfoWFoV1LEdXWepmfa8LfYUKdOvrq789wlQDFX2t28u
 5yetS68vB3E5JtdfRrx2zJaMwAqsWhk8K6JjlXa1EHjVORgeeJv9T3TVcaAP05MWoVCB
 IRS+YLOyk8NGk/l7gjyTtFWjQkvN9t2KKP9E/Mf7MaJTIYCnDiVusKVfHFteVW6DkZnG
 7vvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwsUwBTLZFfTsKglJpuTCG7rL3bqmkHOdoMoH79RLik=;
 b=Cr6phQZYZjvOu5JP8qqDbOBKrmu4rX/JZ3StXJdhuzyqYG3k5oHgnhrSEqefuJS1Ft
 WAJa7hL/SPvhR3eBt7I6N2qXS64vavlHYIhsc/DL33an6KDCKIh7IPZ5tWZLHxT1oLs+
 L/fh4P5ZFbs31G79REXbsrICxngR8uFoOyWhQXycWust7+RBERevXXGHYMWLgZJwQCay
 Te8LgBywukEEmHELn3QcNqq0m2SI3hkz2sySiZ2XjPqldYiaXKbeRNRie2dJuGAA4iZa
 kn6X6VFxDeowTx+SV7/QIaqQkhwfzc43hgahbYO6bOWHHwmDQWxpWlhjFZAqrHFYjnNE
 WcDw==
X-Gm-Message-State: AOAM530aPk4J/mUBo5WatW3bDr5tS50h7TL2Ac/jewNvhYgtqaStaytA
 l+COLdFzHUAvG+yP8HSGmUJYx/mL8pAbgQ==
X-Google-Smtp-Source: ABdhPJwTAks8lqRxnPshBWftwG9ELI7L8msSraRPaRRSD0HRmENq3srXd7P23cAyem+6kTOcxNyGiw==
X-Received: by 2002:adf:e409:: with SMTP id g9mr1965992wrm.66.1626275311552;
 Wed, 14 Jul 2021 08:08:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f26sm2344648wmc.29.2021.07.14.08.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E38D01FF87;
 Wed, 14 Jul 2021 16:00:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 29/44] plugins: fix-up handling of internal hostaddr for 32
 bit
Date: Wed, 14 Jul 2021 16:00:21 +0100
Message-Id: <20210714150036.21060-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler rightly complains when we build on 32 bit that casting
uint64_t into a void is a bad idea. We are really dealing with a host
pointer at this point so treat it as such. This does involve
a uintptr_t cast of the result of the TLB addend as we know that has
to point to the host memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-28-alex.bennee@linaro.org>

diff --git a/include/qemu/plugin-memory.h b/include/qemu/plugin-memory.h
index b36def27d7..0f59226727 100644
--- a/include/qemu/plugin-memory.h
+++ b/include/qemu/plugin-memory.h
@@ -18,7 +18,7 @@ struct qemu_plugin_hwaddr {
             hwaddr    offset;
         } io;
         struct {
-            uint64_t hostaddr;
+            void *hostaddr;
         } ram;
     } v;
 };
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b6d5fc6326..b4e15b6aad 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1728,7 +1728,7 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
             data->v.io.offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
         } else {
             data->is_io = false;
-            data->v.ram.hostaddr = addr + tlbe->addend;
+            data->v.ram.hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
         }
         return true;
     } else {
diff --git a/plugins/api.c b/plugins/api.c
index 332e2c60e2..78b563c5c5 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -308,11 +308,11 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
         if (!haddr->is_io) {
             RAMBlock *block;
             ram_addr_t offset;
-            void *hostaddr = (void *) haddr->v.ram.hostaddr;
+            void *hostaddr = haddr->v.ram.hostaddr;
 
             block = qemu_ram_block_from_host(hostaddr, false, &offset);
             if (!block) {
-                error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
+                error_report("Bad host ram pointer %p", haddr->v.ram.hostaddr);
                 abort();
             }
 
-- 
2.20.1


