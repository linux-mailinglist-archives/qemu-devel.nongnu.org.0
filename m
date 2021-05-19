Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ACD388F42
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:38:05 +0200 (CEST)
Received: from localhost ([::1]:46772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMOg-0000OE-88
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLiA-0003rS-SM; Wed, 19 May 2021 08:54:07 -0400
Received: from ozlabs.org ([203.11.71.1]:52777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLi8-0001mU-BT; Wed, 19 May 2021 08:54:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnv6ltXz9sWl; Wed, 19 May 2021 22:52:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428739;
 bh=a8ezrDhP56G/3k0UPoFxLdwiJbNoCTDgOHu1OoN77F8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=grH9J5R2mCpS1Y4Hf0ZQzGTkpa7zgyeXBQ/n/IcErQYqVk3By0WYyTMM9HUzwvtat
 3cezgqcAWvKAU64y0dND2GRkBxgylD7qRensnb4K/sTF30U21GSfyT5pB+OR6g0rJP
 K/Z283QVEWmthSpQBKiEtpLrkwkSMoThumPkmeRU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 48/48] target/ppc: Remove type argument for
 mmubooke206_get_physical_address
Date: Wed, 19 May 2021 22:51:48 +1000
Message-Id: <20210519125148.27720-49-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

It is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210518201146.794854-16-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 144a14abd9..37986c59ba 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1026,7 +1026,7 @@ found_tlb:
 static int mmubooke206_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
                                             target_ulong address,
                                             MMUAccessType access_type,
-                                            int type, int mmu_idx)
+                                            int mmu_idx)
 {
     ppcmas_tlb_t *tlb;
     hwaddr raddr;
@@ -1398,7 +1398,7 @@ static int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
         break;
     case POWERPC_MMU_BOOKE206:
         ret = mmubooke206_get_physical_address(env, ctx, eaddr, access_type,
-                                               type, mmu_idx);
+                                               mmu_idx);
         break;
     case POWERPC_MMU_MPC8xx:
         /* XXX: TODO */
-- 
2.31.1


