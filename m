Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA15788B6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:46:16 +0200 (CEST)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUox-0007Hx-O4
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSx-0008Uf-LX; Mon, 18 Jul 2022 13:23:37 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:36848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSt-0001vu-8v; Mon, 18 Jul 2022 13:23:31 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10bf634bc50so25536826fac.3; 
 Mon, 18 Jul 2022 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xy/J6nDx5Rdq3r1yCxku7h1hliPNBu1FJJ1iHHYlgkQ=;
 b=b3A7Flwtza3tKS0x50HkXl7r/6hJKZvCmKlclGxhzTqLmkhkw+6U2QRuI6QTjRKfdC
 1msm84EPlFGzab+YZFCNE2D7eliZ+r18vH9L/9n3e1w3c82pos0G+1S6zT2jWsjhpba8
 3BT4y9af05XcyGhHj7LcLnaIxWY6vDErt5wfrb0UKtGgYm2na31Wf6k5V0ZvYjUTLk73
 +RdmP8tgxD/aL5FwTh4NxhinK9JTWGLlAnlvumxCHlYOVqWRxWIhhm7zWcIkCisp0wCI
 WDjesPq8zRUof00K4Z8ZccFPbD2QhCxeNoyHDxBZ0PDB4GbyD8LyK/Rnfe7Z/9sVyrle
 +ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xy/J6nDx5Rdq3r1yCxku7h1hliPNBu1FJJ1iHHYlgkQ=;
 b=nPIfRKLFodVl5Iyrz/2eQ6bEJ85WP1KZBLdQP9bQ4pS7GyNPCjnoiUIm7D/7c+dz7m
 VQtaJ9WuR2h+FuGRQJqwdrcwQk5gFV3GVBQGu6R9+4vXkofL/T+guAVI5RQ0jdWpFtTq
 LzEzwRt4sYv3ww2ifd2tI3dKU5O7pq9SIloHUboPYkbU0X19/rfgVekJ3tf0fpkx0jWJ
 I2tqRnaPa1qr6u8DYlKMnqYTZ62+1mvo5jXoc/ii+EPcxunNOdZEUbWhIR2blt7P9cFZ
 Xz+72uVNybbnZWrkwxMAn5wBnt6z/T5t8iRD8mS0nEk9fNtjUrkMemPixrFw8vtQMvW1
 a28w==
X-Gm-Message-State: AJIora+09cjYy4o7K33ocXxNG7sJaKD0zm0F+X12nBwfTZtLuc+jFlXM
 a/FLPytb78dDVZv1CHxmS5bQO7piDic=
X-Google-Smtp-Source: AGRyM1smewgqLSJihisg9b27pqt61B27gZq0dwIeyT3NVa6tvUhNos6pM4NCPQz7YFuYlzPC/aqI7w==
X-Received: by 2002:a05:6870:d1cc:b0:100:e9ba:f14b with SMTP id
 b12-20020a056870d1cc00b00100e9baf14bmr17568595oac.256.1658165005740; 
 Mon, 18 Jul 2022 10:23:25 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PULL 29/30] target/ppc: Improve Radix xlate level validation
Date: Mon, 18 Jul 2022 14:22:07 -0300
Message-Id: <20220718172208.1247624-30-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leandro Lupori <leandro.lupori@eldorado.org.br>

Check if the number and size of Radix levels are valid on
POWER9/POWER10 CPUs, according to the supported Radix Tree
Configurations described in their User Manuals.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20220628133959.15131-3-leandro.lupori@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/mmu-radix64.c | 49 +++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 9a8a2e2875..705bff76be 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -236,17 +236,37 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
     }
 }
 
+static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
+{
+    /*
+     * Check if this is a valid level, according to POWER9 and POWER10
+     * Processor User's Manuals, sections 4.10.4.1 and 5.10.6.1, respectively:
+     * Supported Radix Tree Configurations and Resulting Page Sizes.
+     *
+     * Note: these checks are specific to POWER9 and POWER10 CPUs. Any future
+     * CPUs that supports a different Radix MMU configuration will need their
+     * own implementation.
+     */
+    switch (level) {
+    case 0:     /* Root Page Dir */
+        return psize == 52 && nls == 13;
+    case 1:
+    case 2:
+        return nls == 9;
+    case 3:
+        return nls == 9 || nls == 5;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix level: %d\n", level);
+        return false;
+    }
+}
+
 static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
                                   uint64_t *pte_addr, uint64_t *nls,
                                   int *psize, uint64_t *pte, int *fault_cause)
 {
     uint64_t index, pde;
 
-    if (*nls < 5) { /* Directory maps less than 2**5 entries */
-        *fault_cause |= DSISR_R_BADCONFIG;
-        return 1;
-    }
-
     /* Read page <directory/table> entry from guest address space */
     pde = ldq_phys(as, *pte_addr);
     if (!(pde & R_PTE_VALID)) {         /* Invalid Entry */
@@ -270,12 +290,8 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
                                  hwaddr *raddr, int *psize, uint64_t *pte,
                                  int *fault_cause, hwaddr *pte_addr)
 {
-    uint64_t index, pde, rpn , mask;
-
-    if (nls < 5) { /* Directory maps less than 2**5 entries */
-        *fault_cause |= DSISR_R_BADCONFIG;
-        return 1;
-    }
+    uint64_t index, pde, rpn, mask;
+    int level = 0;
 
     index = eaddr >> (*psize - nls);    /* Shift */
     index &= ((1UL << nls) - 1);       /* Mask */
@@ -283,6 +299,11 @@ static int ppc_radix64_walk_tree(AddressSpace *as, vaddr eaddr,
     do {
         int ret;
 
+        if (!ppc_radix64_is_valid_level(level++, *psize, nls)) {
+            *fault_cause |= DSISR_R_BADCONFIG;
+            return 1;
+        }
+
         ret = ppc_radix64_next_level(as, eaddr, pte_addr, &nls, psize, &pde,
                                      fault_cause);
         if (ret) {
@@ -456,6 +477,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
         }
     } else {
         uint64_t rpn, mask;
+        int level = 0;
 
         index = (eaddr & R_EADDR_MASK) >> (*g_page_size - nls); /* Shift */
         index &= ((1UL << nls) - 1);                            /* Mask */
@@ -475,6 +497,11 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
                 return ret;
             }
 
+            if (!ppc_radix64_is_valid_level(level++, *g_page_size, nls)) {
+                fault_cause |= DSISR_R_BADCONFIG;
+                return 1;
+            }
+
             ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK, &h_raddr,
                                          &nls, g_page_size, &pte, &fault_cause);
             if (ret) {
-- 
2.36.1


