Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24134D9A5E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:27:38 +0100 (CET)
Received: from localhost ([::1]:43020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU5L0-0001gF-0b
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:27:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Er-0001q8-3p
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nU5Ep-000058-AN
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647343274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ca+pHvCOjERUQbNwmMptZh33fVUgMeYIPp8MFO0isMU=;
 b=Pm6GrBLKggpgJWwq7Eq3fo7+4ibSU/lXNsafaugUoo5EL6ImBkBZkG1yACe9Ymea/LG+CC
 n47Sc2FaL0D0aJBCpZRJzQAC8F9/wZvEGlIevtGYahzQv0hit3SBN6j2og/ybDLuQN2TpM
 DLj5rk8nZmYHg48qMuSVPaUKxIIaOh0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-V03cCSwqPQWXEz1569Kbkw-1; Tue, 15 Mar 2022 07:21:09 -0400
X-MC-Unique: V03cCSwqPQWXEz1569Kbkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D00E29AB3EC;
 Tue, 15 Mar 2022 11:21:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57C82C15D42;
 Tue, 15 Mar 2022 11:21:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] accel/tcg: Fix cpu_ldq_be_mmu typo
Date: Tue, 15 Mar 2022 12:20:50 +0100
Message-Id: <20220315112052.515467-7-thuth@redhat.com>
In-Reply-To: <20220315112052.515467-1-thuth@redhat.com>
References: <20220315112052.515467-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

In the conversion to cpu_ld_*_mmu, the retaddr parameter
was corrupted in the one case of cpu_ldq_be_mmu.

Fixes: f83bcecb1 ("accel/tcg: Add cpu_{ld,st}*_mmu interfaces")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/902
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220315002506.152030-1-richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 3b918fe018..2035b2ac0a 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2174,7 +2174,7 @@ uint32_t cpu_ldl_be_mmu(CPUArchState *env, abi_ptr addr,
 uint64_t cpu_ldq_be_mmu(CPUArchState *env, abi_ptr addr,
                         MemOpIdx oi, uintptr_t ra)
 {
-    return cpu_load_helper(env, addr, oi, MO_BEUQ, helper_be_ldq_mmu);
+    return cpu_load_helper(env, addr, oi, ra, helper_be_ldq_mmu);
 }
 
 uint16_t cpu_ldw_le_mmu(CPUArchState *env, abi_ptr addr,
-- 
2.27.0


