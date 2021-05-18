Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE4D38716D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:48:08 +0200 (CEST)
Received: from localhost ([::1]:58278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisaN-0004tT-3c
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKV-0006ry-EH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:43 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKT-0006wL-LM
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:43 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mf0uq-1lFrIP2lj8-00gXQ3; Tue, 18
 May 2021 07:31:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 15/59] linux-user/sparc: Merge sparc64 target_elf.h
Date: Tue, 18 May 2021 07:30:47 +0200
Message-Id: <20210518053131.87212-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:y0WpMoUJkFAn86t3/w26k8dqCcS0w2IIlRaYSqas3ZFf14toAeT
 hsUKkRPNvLQz/g8OMOGCFj/xYvyNEUGuB4AVKlr07Vg5G6RJ9nWHW+ai3+7Z2R8yJ5z8Mpl
 jOKsjVvf+gfy83+zareN9fJ8yfaWoMdN2/rBeraYBBsKferkgmG7Jj5t8Jbo42zHboN54am
 ZerU72i9Wn+ZeOlUZuICQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+U0wW7jjOX8=:gS5sWBGKltgVGM3AvYDO77
 tRiE0ZAW4TNAN7MJ7EZLJmEFMfT12doGmryO7CqkmspoQfP4MYyNRdY5g+24w5e5wizVdkqPl
 utNCCBSZ7UoLtEIEm6yEio6mVyuQsRWg9+ECJYmlA1XBv1KaNs8Z4iGhkcix7xGPw5atulW2T
 Fji5VRRWWKYvs/mY+BnbvHGrQt+zgVgopRNsuc2dueIV6PLTtFHQPjb19JlaKHMpLOPglAme/
 oeJiSvFAfjay1xcbJ6T5HBQRqhtR4TGWKhbIqvWPXs8uMwBpRqN/PIIs9YEntXJpx1Cr6Q2YE
 pmoZMCPQ3y/LzAtLzsZIoL0T85JhzNaIbkFm1zbJIsIRZexFva6KJqnoSYAsPLZOjp/2HMliQ
 dyi/EgwmLfqcfx2TMYVOI3N7Rg1fohHeRPKqROSBod6IT88sNHiq+6iVxPKf3CCs0iOYEjhPK
 ntwy+iwf4A86Cgoll3UBGzbCsdLM6Cp5uBlgnKwTYCH17WdKXSE1FVJebFgSEphZ5ZeKA3kN3
 EICg/zpC6zqg68YfS1lA04=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc64/target_elf.h | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/linux-user/sparc64/target_elf.h b/linux-user/sparc64/target_elf.h
index d6e388f1cf60..023b49b74375 100644
--- a/linux-user/sparc64/target_elf.h
+++ b/linux-user/sparc64/target_elf.h
@@ -1,14 +1 @@
-/*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation, or (at your option) any
- * later version. See the COPYING file in the top-level directory.
- */
-
-#ifndef SPARC64_TARGET_ELF_H
-#define SPARC64_TARGET_ELF_H
-static inline const char *cpu_get_model(uint32_t eflags)
-{
-    return "TI UltraSparc II";
-}
-#endif
+#include "../sparc/target_elf.h"
-- 
2.31.1


