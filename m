Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFDB53B8A8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:06:14 +0200 (CEST)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjaf-0003I6-DP
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTS-0000V6-71
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:46 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTQ-0001Da-HD
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MiakT-1nKw4s4BV9-00fhkl; Thu, 02
 Jun 2022 13:58:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/19] linux-user/m68k: Handle EXCP_TRAP1 through EXCP_TRAP15
Date: Thu,  2 Jun 2022 13:58:24 +0200
Message-Id: <20220602115837.2013918-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:S+pnPJHyysi4eznHgu74eOFRdnIExZsdv+STBbocPE02m34jMHU
 zTk+xl0b9sqp/EPMBaVpndFrYEx3bYe+HwCHxiLnjn0nNOrczQR8qBlBQGP2sHvGf+y50K0
 meJ17thJYbIrxfPWF1tTX6Sc3E0LzgLxu2SsdbKc0Ihfm3yPicThaRZg8oWVshystsSO7vx
 fe9m2o+uJQlwYKgcoeoPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8VFCskYE41Y=:qOpR1qQLc+WpT/246rTG9C
 SFpWBh+uk/m3ek13+XQK4AKpG48nEuU69mty1pwh5Y5UJAtzp9Ag/6sHN/Wn2ykmuijX7Z6Bx
 4H8LrEQxNtNYRs/yeFQEsG9QCPCdtt4dGWovbDA5CbsPkCxPgkDYMVJIIuME8WTPQo6SwfNh4
 jmJzx5XPjDrF1mDCcl47SZVMyEKDVPy9Cqqikdh+6pNpGx1mNrBwTdB2EIy2x3FCJz/x9tgM5
 T/a+DwtQnYCQcnHlMaRHPbJkqXQ3gyXD+u3zcWfgYCVHg2jeZjBaGAqaQ0zu+wN3bsoPoqmnB
 RBEVFaZM4E+z1X8cjhKysAs6rxjOo17HHf3tBrl5Y14VaYCAHrxG0OrN/Rz9+3ac8kVVkE6/B
 ifFi+mNHiOEtvCtT5NIYJILfDdz5ZqvTorRMlULBS1hIrel+dF99c4y5WA3nm7RhIp5pWpejh
 IJ4pZNDSY51bVV4xwHE5iy57qGRCiYm82yM3OsN+y2VmqRy3E4Fp0K7KyeylNcsUUJt9SQfkg
 aWIVIOpWhU2iZNXwC9AvoFk4hSSfj37iULlNZqtwIJWBDOzzZMdVk+BO+yKe0IZwiz8pBMHNk
 AmBuvEnCPWQIyMxuqGzC9UWwuI+WkloB5HmDjspbLgjNukadvW1Y1zVhY3vpJVzoQsoCk7G/B
 aI3E229/cWN/Z4t+Xs0YxD8o++BwtUi6SBjkF+tI/Oi3DVnXTVusakl92MzAYlzoosxc0TQsL
 sbYIAixR+IwUXiiwUKazVmnUumWprjXeZQjJkA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

These are raised by guest instructions, and should not
fall through into the default abort case.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/m68k/cpu_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 56417f7401dd..12e5d9cd5363 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -75,7 +75,11 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
+        case EXCP_TRAP0 + 1 ... EXCP_TRAP0 + 14:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLTRP, env->pc);
+            break;
         case EXCP_DEBUG:
+        case EXCP_TRAP15:
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
-- 
2.36.1


