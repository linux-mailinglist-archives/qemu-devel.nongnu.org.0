Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193113C1A31
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:54:43 +0200 (CEST)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1a6c-0007dO-0l
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZgB-0005Wb-F1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1Zg6-0001yT-Q9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:27:23 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d2so8963886wrn.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2VymeSF+HdKxVWyy9+ZA+5+qTRIVWKC1/sXMZ3ShAgc=;
 b=fF4lYccgE5zaRkXbcGb1m0QOi+mPXnbTmm1l2Oe7MmCEcNvAVn35MUIpMJ6+o1OQcc
 3Ik2RP2yuvOo56emb7UbWj2Yk0UVDxftxmQMdMHscd8pW9RBMM23k1Wh8afuwGBZJSdU
 0Jp0C3PaVI/40PtRpqDZKT74YCqUUAavnFQSCW0dhfSXoCpknsNobtq5nZ13/1s/x5TJ
 Jtdc5HhQa5AN6wPNBImXvWzmSF3o7uatgoMrGVecx06AHi4WXnMPKiWLx172zBX4YubN
 HKpU5X/RMijePABBCSzKF56eVFAqtJP0ILmsJOn82BwSyCNGUv2uBRet+hAdqwu+N2ZP
 DICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2VymeSF+HdKxVWyy9+ZA+5+qTRIVWKC1/sXMZ3ShAgc=;
 b=ACUA0Apzcm6eQeyE5pVz29cUMUFxnfyshXcH/kcr9pc3iUBjyEijdYd0HZQr5uV/VP
 /CjqGErecx9oFbgULB80BGl2DE5+3/rbYcZUCDLrFgsO3jF8bjYpvPtkb1EaqUbIo/wF
 pmsl/lQHk2L5kBWqcdKW7qar5uiEy78pfi5XR3Cpr807Ki0keLxYI24jffM6/KTNb+lK
 +elMvav6o8cXo5yaMjLzeyCXAMew0Bl/m2s9G9AFo8vIoZluqlwhwVhrbuyF/vsK7HA/
 XDp1BYFs7QSPJHuS3bGrxvXipYnTsGfcQPjklR0EcJbVA7kEt3r+PXwFNjaQr4kNsKou
 /YUg==
X-Gm-Message-State: AOAM531sHLWRMWo4sOv36lfJwcCfYFWPVRc6kVNIZlghRq5OQXDSHmht
 ZsxHFJF52AXWPZq27BtpKr24GA==
X-Google-Smtp-Source: ABdhPJzVlAnABpC/ShU0pochGyBG155QuJsF6YfYkTWruvl+jbVXEPscDQCZG1gitCiUbJp5Zc5A5g==
X-Received: by 2002:adf:e8cc:: with SMTP id k12mr36244891wrn.163.1625772436605; 
 Thu, 08 Jul 2021 12:27:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x21sm9844150wmj.6.2021.07.08.12.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EAE8C1FFB1;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/39] plugins: fix-up handling of internal hostaddr for 32
 bit
Date: Thu,  8 Jul 2021 20:09:29 +0100
Message-Id: <20210708190941.16980-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler rightly complains when we build on 32 bit that casting
uint64_t into a void is a bad idea. We are really dealing with a host
pointer at this point so treat it as such. This does involve
a uintptr_t cast of the result of the TLB addend as we know that has
to point to the host memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/plugin-memory.h | 2 +-
 accel/tcg/cputlb.c           | 2 +-
 plugins/api.c                | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

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


