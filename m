Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F61E385D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 07:40:01 +0200 (CEST)
Received: from localhost ([::1]:57186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdonI-0003aM-6C
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 01:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jdoli-00014y-M4; Wed, 27 May 2020 01:38:22 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jdolg-0001bp-RQ; Wed, 27 May 2020 01:38:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49X03q3Tj6z9sSk; Wed, 27 May 2020 15:38:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1590557895;
 bh=167hnw7FWUOfd27HKDy2X3q5Aj849B09c+brDsAAulw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YMXg1g7apy31RoWrONdM/17x1tUgeFt3X3xVXd7HnJsWPeHyu0ROLoiUGQZ+kKIc3
 /W7xK1pJpOK8BwTyxlzpc/pJLdiTtEC+FVYW1ulCPULJZJfY+bl6/tF+4wyGXgqw/y
 5+MUIEaFLXGq0loIgAnJS04HAnrFHcQALof5kzbU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/15] target/ppc: Untabify excp_helper.c
Date: Wed, 27 May 2020 15:37:57 +1000
Message-Id: <20200527053809.356168-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527053809.356168-1-david@gibson.dropbear.id.au>
References: <20200527053809.356168-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Some tabs crept in with a recent change.

Fixes: 6dc6b557913f "target/ppc: Improve syscall exception logging"
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <158886788307.1560068.14096740175576278978.stgit@bahia.lan>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index f052979664..ace8620026 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -70,16 +70,16 @@ static inline void dump_syscall(CPUPPCState *env)
 static inline void dump_hcall(CPUPPCState *env)
 {
     qemu_log_mask(CPU_LOG_INT, "hypercall r3=%016" PRIx64
-		  " r4=%016" PRIx64 " r5=%016" PRIx64 " r6=%016" PRIx64
-		  " r7=%016" PRIx64 " r8=%016" PRIx64 " r9=%016" PRIx64
-		  " r10=%016" PRIx64 " r11=%016" PRIx64 " r12=%016" PRIx64
+                  " r4=%016" PRIx64 " r5=%016" PRIx64 " r6=%016" PRIx64
+                  " r7=%016" PRIx64 " r8=%016" PRIx64 " r9=%016" PRIx64
+                  " r10=%016" PRIx64 " r11=%016" PRIx64 " r12=%016" PRIx64
                   " nip=" TARGET_FMT_lx "\n",
                   ppc_dump_gpr(env, 3), ppc_dump_gpr(env, 4),
-		  ppc_dump_gpr(env, 5), ppc_dump_gpr(env, 6),
-		  ppc_dump_gpr(env, 7), ppc_dump_gpr(env, 8),
-		  ppc_dump_gpr(env, 9), ppc_dump_gpr(env, 10),
-		  ppc_dump_gpr(env, 11), ppc_dump_gpr(env, 12),
-		  env->nip);
+                  ppc_dump_gpr(env, 5), ppc_dump_gpr(env, 6),
+                  ppc_dump_gpr(env, 7), ppc_dump_gpr(env, 8),
+                  ppc_dump_gpr(env, 9), ppc_dump_gpr(env, 10),
+                  ppc_dump_gpr(env, 11), ppc_dump_gpr(env, 12),
+                  env->nip);
 }
 
 static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
-- 
2.26.2


