Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D2941767A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:01:58 +0200 (CEST)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlm1-0002PA-9T
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgt-0002zU-8u
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:39 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:35781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgq-00058S-Ug
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:38 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MtfeD-1mi8Le1gHH-00v5ku; Fri, 24
 Sep 2021 15:56:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] linux-user/arm: Set siginfo_t addr field for SIGTRAP
 signals
Date: Fri, 24 Sep 2021 15:56:26 +0200
Message-Id: <20210924135631.2067582-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924135631.2067582-1-laurent@vivier.eu>
References: <20210924135631.2067582-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GG4Ei9bgJnhqFlbD4cbNUt5vrrHJzrkD9ShlT/QeeBu4wmNQPO9
 1mu8LTcY+N5/0nFHltZs3sRyODmOzvpSkek+11/QSQ9SFAGGWlnHubSbAKPUKSAcUp9xscL
 5zs+fNREp8mHdzCg5yuSbRqOJVDwEKi7qWwUNhihsWPxy2My8m/GO4z6YtwOUdFmsL89lCH
 ZM39yxwdqcWC+W363dObA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vvNUg0noIpU=:58GBK7gN/HXnlF/zsO7Oim
 KHMOtK/KEhxJ+H8NkhxAKnnyoMzqGNZhC+6mJDED/Fd8w2L5/T7Jw0HhzA0EtT1406vhtsUXD
 nTDge4tUGUu9h8HNYhT1a2ttHDKmlENkpgRgjL6hPZyL4R+IfvhZiGuE8f3fP/XwNSQPy1H00
 qAarhkxoh7xu5a09elyr/IJBX++RwZb03mTCa8BzwJ6ph92+4kUyPu0R0kTgJ583Kje1CqSqM
 Tr38GGnJKqc87m592KqyH2szppSW9bmDZyyqMnqA5hQK+UsTQVfzM8Fbzzxf1ecAjMcxiZMKh
 oIiztPLQFt0E/zL6HjlT6kgVUsJZ+ibN/lPjwdsB45zAtXGjeU3bmOFcykMYM2jCJlA6ly1y0
 jLumwkguDkzISRpl/Go4PWTTN79t6QqphcuGBIcbP7TnPc67BbFAX6whFilW3LCwVqoqXvMy2
 Y+JdwA7LmPf2lRpfVnVs/hg6R3N+avBWemSP9xdFFPWdbLV2JM8sFGVjATPHvxL9NrBduyWwV
 gZOFmMDFIgOJZzNX+zJzRvgyIvZKp4rPHj+1jkcAE5NRpC9Gb0vnA/CJuStc+k+hlBr0M13BX
 saVLLo0QmML0twzNlzqVIBleiLZr7Kp0dqPfcYBsES6gunavet34AqkMfKLy7mWsBDroXWfmh
 5iDs4uuQGD+YZBU0fGRuDkZR1AYY2A+4W/6ql1Q3KlzYv9x6Fsd6B2WzPb+6rCAjmWxzU5fLt
 qZofud5xD/th84/nv+QQ9z3RG5uBs5GuwU9mYw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
to the PC where the breakpoint/singlestep trap occurred; this is
what the kernel does for this signal for this architecture.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210813131809.28655-3-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/arm/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 07032b300610..0900d18105a1 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -455,6 +455,7 @@ void cpu_loop(CPUARMState *env)
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
             info.si_code = TARGET_TRAP_BRKPT;
+            info._sifields._sigfault._addr = env->regs[15];
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_KERNEL_TRAP:
-- 
2.31.1


