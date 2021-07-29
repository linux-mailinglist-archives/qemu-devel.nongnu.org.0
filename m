Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9683D9A94
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:51:02 +0200 (CEST)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uGL-0007ta-TN
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCT-00040p-9Z
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:01 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCR-0002Qz-Oz
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:47:01 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso12929890pjb.1
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q3cYyHXxQVv5PEphtWnVuUV6VU+DjAsyUiTSK40GqUs=;
 b=eLTRrDsPQUaeWVjcrWqsgFIPWxhdrmpwuHDW3gmDE0ISyDAk+T2yjfa6QfLyI/rDcZ
 HqfoKE7Mjho2ae3Nyd4SF0XvpFslAEqPla6zCQ1bD0eqrng3kMmKGQtNTYwwwwHZkpmP
 UHVTL6ZQ9eliB/aOQzMsfS6/arh6b3/QJHesnHuEH0JAsYx5kFhqCumklG8Tx0AlVzKQ
 IU1vTCsm5Ld1ibpwl18q21jpb+7MIr2dfbqJf3Wa98XEF7lcbdSkNv2tdSY5Csp7dVVL
 +uKT/fzK942hYzWWqlvyXavgc6UIuXi8p9uyGKgLkujrFiyvdZ4KMEtNJHNAS4V1Yk8Y
 LovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q3cYyHXxQVv5PEphtWnVuUV6VU+DjAsyUiTSK40GqUs=;
 b=mjEgxfHgP3T4jfUrH0LY4YYK9/Rraww4j7B3iOxM/eYbfTl8qbotNa+iySjDp9PimQ
 htjCDu2pSqEJBj/+BFTZ4HIJ1ByZpt0eWNt0DyOkD/WKRR3cJnZMBdgKeRtW9bYZ7gCK
 PS2LBU/Ll74NeOu1VTGKNcrtA67kAngAKoeIxbQEUvf1rfwrLWBvW/rOc9hqKkt7Ow+f
 r7myvLwr6OSSuvc9D+bOg0+8sYiw4vvchIL83NE+6Qch9/rvqoJvBobqIAkQe+oFycWv
 hHjpFU4GQWD3wj+n4ztklUTZic/t79id4cPOyBP1+cHqn/tNDb81mXGFcPLO6u45F0sb
 Utew==
X-Gm-Message-State: AOAM532NWiz1rPwHD3QWR3u4BectVhloruwAJm06TxyG494mVT7vFaN5
 OH/8eL3OCfg5GNMjiJt+7R7/z8bDeORTtw==
X-Google-Smtp-Source: ABdhPJyAJZSiToAlfa3f/dVag4zJQpDCMBbFI66TdGtXCNaV7/TjaNGOILXAr0OQfMsOcVWtoBCKdQ==
X-Received: by 2002:a65:4342:: with SMTP id k2mr1480112pgq.138.1627519618488; 
 Wed, 28 Jul 2021 17:46:58 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 07/43] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
Date: Wed, 28 Jul 2021 14:46:11 -1000
Message-Id: <20210729004647.282017-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a79a0ed465..0b2c6de442 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1503,6 +1503,8 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     CPUPPCState *env = cs->env_ptr;
     uint32_t insn;
 
+    env->spr[SPR_DAR] = vaddr;
+
     /* Restore state and reload the insn we executed, for filling in DSISR.  */
     cpu_restore_state(cs, retaddr, true);
     insn = cpu_ldl_code(env, env->nip);
-- 
2.25.1


