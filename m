Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF23C262E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:45:58 +0200 (CEST)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rlN-00055O-5K
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdO-0004m7-1U
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdI-0000DO-EZ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id i8so12414535wrp.12
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SM3nhJYGRMl4JOlKoDgGk/W9n5D8WCblYwwfamyCKLA=;
 b=Rzi9pcOmK6iGAOhnaCbYXwyCL+iYzP8ZltiVnOkl484829hyGw/32DJFeQ5dAOuW4n
 c44lWKMtFu4fXpxxA1oDGh3+kvXuBmxtOMytARe0DMkOLpl/6q41ucAGbga5zfmhAcBS
 NgGEyWZmShyE/kqZct9TheKunw0cv0rT7eNE0dIvhBS0VTiCqPeBbCKLLszrXPgbsWNf
 +YQSCZDgRjBOV8Y3XX5wFCPuZu1H19tN6NEmPJI6T3aZZcf5v3ONN+7YqC3KTLxJgCUx
 /T7DkJAdOOkth9HekFdSMRnSkascoA9zvcePwDDBflwFraUOZfMZqlkuP8laQRd7mHA8
 i4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SM3nhJYGRMl4JOlKoDgGk/W9n5D8WCblYwwfamyCKLA=;
 b=njCYOovrF9pdjYiiD8LYa4Bbziww2N1u9jfd/YalwIjkJFzMIEn2vKqpWi4u4x+WY9
 slZ/HOVMk9OsH7CmIf+Czn6VQozSE+etdEyk00Sm2u3DgNbpqyw2xPph3203nPo9pMWZ
 FU8u1ZRsDhrHlu2j15nwZ0KbrfVnBlyvXJcWMZ7ywHQWEZAKc4KU89n3ZCvBjr7Mdvet
 mjlRyaYi/icpQN2yOblEv869W0Twns0ayGHBzlxG1wXMB7+eyy/Po1xjJ/9TQUeJhxlH
 eHSpoajce82gsE7LSjrGtmQuJRhnHvC8PSIsmizLtZAb9DXPBhFOgeU2CmmA+QbQDtXo
 a+Iw==
X-Gm-Message-State: AOAM531PP7hGhd41zUuQOzAXfC+dATk2A9MukUaabqpKk2jZjQPgoqqH
 eplW9r9akU46TazfrrUgMfhUag==
X-Google-Smtp-Source: ABdhPJx1Zr0+UCzb4/qrCkM0/4B8w7zJAFWpkk/YyROvoOShmcWBCn9sM3ROhYAzv2msegTcBOY7PA==
X-Received: by 2002:a05:6000:1a87:: with SMTP id
 f7mr41649696wry.172.1625841453306; 
 Fri, 09 Jul 2021 07:37:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t22sm5248390wmi.22.2021.07.09.07.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A1251FFAF;
 Fri,  9 Jul 2021 15:30:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/40] plugins: fix-up handling of internal hostaddr for 32
 bit
Date: Fri,  9 Jul 2021 15:29:52 +0100
Message-Id: <20210709143005.1554-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


