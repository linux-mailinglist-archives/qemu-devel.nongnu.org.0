Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E375F48B7B5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:58:36 +0100 (CET)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NHw-0008Pw-15
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:58:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCW-0007sJ-3Q
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:53:00 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:51489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCT-0008Fc-I1
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:59 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MHnZQ-1nBDDp2i6Y-00Et6B; Tue, 11
 Jan 2022 20:52:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/30] linux-user: Remove TARGET_NSIGFPE
Date: Tue, 11 Jan 2022 20:52:24 +0100
Message-Id: <20220111195247.1737641-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:etkb4DmUL+F4OJ3jyECd2GyqKAl4kzEZ2qXXaOhqtJfSfuB/rli
 wM0K6myBGoFeJJsV5LuC5ZJEuxcT4iRy6CrFA2cylWfjduozbHYCuW9gK8ACi8L11v20O7m
 z/cbuVDqH81lSwL/x4IvOSJZBDYNsc7lwmf37OCTU3hnI5nHJb3auGuMSIcLJ96Ylq1wYRb
 hQgpOlmCh0TOhQEqr1FHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+UO47+EiPgI=:BLADFwf/Bj6G9DccNzg7Dj
 N/zxdfaEoE3FdpE3T0AtD/0xSJcavztdxlWRvQRFGlx4PlEflpXoexio5w25wC6wy1/Cy3mcF
 WFngqWzzW6lAl9er5ZX6FBqCSC3f2tLQiNov2IBs3YJ07zPiYYC5/YhFteWVdTaOixaquLNXH
 GzdRWawFjpNKhlb9XNFD0oafnL+/BzLyo9Liyqzo7P+By+4oYNyqOoVj8WBS95fyR4YZQqkKa
 WI/j5+ZvZsxDw/z+T0O/zt/iOrbV5rmxXcK9bGxfpNsc7B/Fr3+WLBrLUH0qAlGOUIcaIeVjZ
 6UkYGFMwznfIVgoCeqbZr/+an1250eP5SA3vEZOFOng7rYjIZj2UPrIVx8Rt5r0S1OiP8jZ48
 uOAhmU4TrybiQ5NPEZ/ccuR/twUQxssSlGaOuMUWZgZkzSHRDbK2/y13ai8FFI73W8dFCVokg
 q6rJRhqnfd2X0A1aNwL1QextGSyQ88dWeHuS+nT8K6B76Tf6LgiZ32sbX1wMgU58128fklYob
 UJfubfyeZp0habT41afbMGDivCfZB95H9Zqkcf1emPOBk5FF0T31BesT7TMbA8XqMLfHtLICE
 YsuUI1NrC7fbomTEx97FJ+PU7e1qxUdfwjnQlw4CmQl3vqostpZS4uo/ZFfGAvsc/aDC8cgyZ
 knSHuVLXLePDMCkhfSIu2pawdvZQbwU9WNioJx7LauHYvT0lu6lfz9FmFcPHXxSqBGz4=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This define is unused, and we have no similar define for
the other signal sub-codes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall_defs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 18bed558fe6b..510a8c1ab585 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,7 +688,6 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
-#define TARGET_NSIGFPE         15
 
 /*
  * SIGSEGV si_codes
-- 
2.33.1


