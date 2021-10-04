Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A778420741
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:24:07 +0200 (CEST)
Received: from localhost ([::1]:53042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJGY-0004Bj-Bz
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeZ-0004Pu-BY
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:52 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeR-0004wg-Iq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:47 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M2NqA-1mVfI03Pqg-003tq8; Mon, 04
 Oct 2021 09:44:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 25/26] linux-user: Remove default for
 TARGET_ARCH_HAS_SIGTRAMP_PAGE
Date: Mon,  4 Oct 2021 09:44:20 +0200
Message-Id: <20211004074421.3141222-26-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5soxRWu2yGVdM3Llu+2dQcIuLq9WLfse5gEmizw2FdTMamNUgQv
 yxKD0aSaWLYVBXNKA+QIzBzCWxQ0jxfQ3GzDhxXyU9se2Ro18BpeUA3BIqEGUFugICZNgYz
 ZDEn34BcjAx46JcNoDe0FpM9VE6a9XIoVSuG4UXkidbCmekMv9zzTDlY6ttIdfkczBRJ0i7
 erhfDr2LfnyzHFYpsu3JA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0ZrXZCwCPrY=:ybyRHnZxh6F/t8qk2CgzfG
 23Y/p5wqNR5/h7Uy+P3ACvTgHwxtaC/BUj0iHq9MjILzyez0K25MyYLsTHZ4rPts2dOFG4Isd
 Gps9btZ1Ml3h/jOJa+QlqNmKPfNqQ3+wLNKySGaSN/p9CNIU5q/Kazb0QzRn9EZL9sjVTvw9I
 ZpR9ZLXMt+h4SqIiWt2J3dDNWRj45L/aiEyXYOQjiTsqLVN9TzO1mZg0bu1K/EsJCSVGFZEbT
 LqXwMIftsuWKQjwGOhp5KvR1MfgBWCQgZwAR8Dla/ttVcx6M4kQmhjkzWpjIj0CcXrkhvEdvU
 fqY8FZKLXBHdkBg9IHK2com1xDFrZYTpMUy9I2KLroGD88+9+XKuHJFoSULn2IpfaorbLoQyV
 y7kykXQjEzuWc5MfNhvxAunDflNGNfxxDsBBtbGpfQ0QT8Rw8zHPpW8+AViY0+Ly8NhYUIbE3
 /GW24MoVfnuMEFV2DXFk7M+vlxvfvf1qjmMg+63My/x+ICCX7sIJLTXTl2AKZHIdWuAI9RYfG
 WvEiCkN7tWl6yPJUIMGGCI2moEEfzqfDfae3HdZOTa7TUxqH/VFOJ3fPGpE9TQ+IAWoRCPqP1
 l588b4cI2tqSqABGtU1vH1BZSUooaLf/Rm7Gb/cMrGNdwEpM9/QXHdOqVNzN2uYvbrarGiO+7
 vVBrLJ/8YIV503YDc+3sfcb81oV0GYL7XossniAEpObVzXI7e7k8FhneP2//ra3kpug2ADKCp
 FuIYk62IMx3k8X5qMYECpjzOiHVu9L0L3O5CMA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

All targets now define TARGET_ARCH_HAS_SIGTRAMP_PAGE.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-26-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 459a26ef1d93..2404d482bafa 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -30,10 +30,6 @@
 #undef ELF_ARCH
 #endif
 
-#ifndef TARGET_ARCH_HAS_SIGTRAMP_PAGE
-#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
-#endif
-
 #define ELF_OSABI   ELFOSABI_SYSV
 
 /* from personality.h */
-- 
2.31.1


