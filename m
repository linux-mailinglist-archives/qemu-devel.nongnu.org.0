Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2113C71FB
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:19:49 +0200 (CEST)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JGG-0002vp-SN
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifu-0000a4-C7
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:14 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifo-0006Cp-Vc
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:10 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8hEd-1m7PPS1Kz3-004ksC; Tue, 13
 Jul 2021 15:41:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] linux-user/syscall: Remove ERRNO_TABLE_SIZE check
Date: Tue, 13 Jul 2021 15:41:48 +0200
Message-Id: <20210713134152.288423-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kCSWo2qBWccEQtM77bnB63g1WgctXkQa5HhTmKnGKFPaKQ/Z0M6
 IhxG50U5o62nGeFQKM8ONZ7WYhDghsKe+M1PMQmpiWnn1hf3dTvg8RkNoXiUfw5bvCo7cfO
 m6i1q+12L5W9Y+iwnwzalHq6YDv3b94Jhlk2XRZSxFr1gDXJaoeaRhdg1xd4ke/X7Fp1ONF
 FEoB1p28NNeeT/GMhprAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m052WbsLj20=:TnrIIq2vL8Os6za+JImb6G
 tGhLWfIMfxLEyhcFD8/gK2QztkupnmgOCYcGYgUfILg+e4j++6QRVuz9V8s3NSvXd/W80zSNN
 yW83Ox1aIL0huE894KKaxwMmOVRKb+WBAsfKnTlOEebVjCSVHftKr3rOOzZi/XaI7CFt/00aa
 0lEX9oBJMwaatJE7LQNEQRSCMxO8vmGgjArY2GN/pEgZC3+Mz8aySzelASglehAptHB3S/sGm
 dZTyfE0/QhwKQdDdBTo4pmmIK+KcQ0ugAKOHrjFUFylItFeGXLyQ+EwQNgPu7/j2Xz1LKfEu7
 gLegmg/Dw/IfO3SZLVFY1QBhcqd46qqFf0btB96pPcvJY0UjHNYUHkRY0gRbdP41Iaq+v34tC
 xyKX1R9OpiL9aIc91OErVoKQj4MBk7h7h9O6Si8XAPt9VwmCtndEk3cJVhGkWU+zBEpAOZfzL
 aMvzPzhTFKnPJ2oOMlgWsdb4Z1KPodoXE5aGSR54cGDKC4XMhBh8UAaSqqKypEfFib0kTDtLS
 bUdyKpyPzAbBmF9QMQU5rRb320N4KsAjrP9/EmRbNjGF7P584CxfaM9wKnPhD/Xm1P1jkIh1/
 NWCaQ7b2XW38HyfxKSc7UUIeRODyIMjZ6wRUuzHOyWl4N4FqBEbSjAvtNQ9UgDmjBRBQKVJim
 6xE9IRJce7dlRLP691kdZYIKm7ge0cw87mTjucRSnuBWuCRT90ApAtZ/L0ZUJcQ6l2k89FcZd
 LnWvLIJOve6bVc1V3SdQVq/B7xDD+OViwEysS1KvpJPtA0enChcR7SJtoOS+LeBsFcO1AGhmB
 YovWO0OTZ9Skk30t/pwfJVS2JlcQZEt7feZsKzs+cgXAYBHoTYRG7dXYmek+1jZU+pcbbt6
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Now than target_to_host_errno() always return an errno, we can
remove the unused and arbitrary ERRNO_TABLE_SIZE definition.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210708170550.1846343-9-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 94ec6f730b3f..376629c68915 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -507,8 +507,6 @@ static inline int next_free_host_timer(void)
 }
 #endif
 
-#define ERRNO_TABLE_SIZE 1200
-
 static inline int host_to_target_errno(int host_errno)
 {
     switch (host_errno) {
@@ -548,9 +546,6 @@ const char *target_strerror(int err)
         return "Successful exit from sigreturn";
     }
 
-    if ((err >= ERRNO_TABLE_SIZE) || (err < 0)) {
-        return NULL;
-    }
     return strerror(target_to_host_errno(err));
 }
 
-- 
2.31.1


