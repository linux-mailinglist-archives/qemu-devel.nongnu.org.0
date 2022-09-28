Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D92C5EDB94
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:17:41 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odV4O-0003D1-Es
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEN-0008FM-OU
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:53 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEJ-0008Ho-Gj
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MUGRh-1onBH81P8N-00RLfN; Wed, 28
 Sep 2022 10:15:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 37/38] linux-user: Log tid for strace
Date: Wed, 28 Sep 2022 10:15:16 +0200
Message-Id: <20220928081517.734954-38-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i5ZY7Coc5Bj5XrtIawWcES17e8izESnLioTNJdl8kUcOFK+ffrM
 LVnVJ2fUkhZcHkEpU0ZgfCBRJggcQhdi0npW4JSZYz2dSW+A+N3Is3HZrvrBjY+mTmfB9xx
 Q9c3iFQpm0r6eHGqxAlsRy9g74VgTeCuuq8UxtfHULecuqZtFb62vj1J0HW3k77tOWnOvA0
 n+Kfx1xYluqRXoXDvGqKg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xitIvZ3Wpok=:IzuSQAShq3Q9xX//W6QnpV
 NpuwYNCtgTvxnJDOufjaA6c14plZev65yKJ4rtb7UHrjnAuo5JkvVvP0bqBkECtrcmXAjSAu6
 Sc9eH74AQBOXye9qcIAeSqAkQu4Hs7I1ekcCb8xPBxD08PVJUUM3iJ3VgBbsGOZCumb+Rw8Bs
 GicAU36uwLJ6XnfF2ep55nKCO/dTYT1zyimzC1gCgpRhUSiZfRA2pjJL5YOj6b/JnmwvdkiVZ
 WJi3KVxa8HeoTctASI+A6xBMsnXQeZSWD4eKv3n+M8V3pvZUYiYFl3wRmou1ndDYcfriFb3iR
 Z5wAaD29BEWgVTwMUngMbQWPEtp5rBqmZDu9IhHAOaewQoxaOZXyrGKNgaB4A/W00MoPnISyB
 pU3FPePw7dwdFm7uyxfzyEtQvgRNCmdPp0c6WqhZ8omRN733UxSGWb4d/IaEOKwx8uYA0HSzb
 UHJ7VD8N4BPots0lFOmq+znyIkK7CWfqGjDBp9Ck2NURYhi3P9wbI9MvZtjikYt6MGulIE4Rv
 ecK1NfMyxIzMgTcaZmsUk0RapVfhYH1YOKm8tnERWxL99JmR8Y9Dwnvfn9XRj6y/XtDiuA0U4
 +DIophvkfUTpWVB0+HJ/6tyvAhOM6SO8W15x+JC/UopsV8zjbl8h1h8gDaF0DPMDi0g0H8ZVL
 UIPbno9Ag7iGcJ2VKVwyStdHJkO1riti2vKildpGARcDIS7Ik9dAhKUgW3h0826b2+bfzCcQU
 c77PsQgSShwTQtkDb0O5nlf4xdLs1pEW5P3rReH1gqCyMNTiKJJ7d+UkFrUzYHsAQXogNUtrx
 XKcbd8Y
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Printing the same pid for all threads isn't helpful.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220829021006.67305-9-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 37bc96df9bb6..e02dbc3a7108 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3928,7 +3928,7 @@ print_syscall(CPUArchState *cpu_env, int num,
     if (!f) {
         return;
     }
-    fprintf(f, "%d ", getpid());
+    fprintf(f, "%d ", gettid());
 
     for (i = 0; i < nsyscalls; i++) {
         if (scnames[i].nr == num) {
-- 
2.37.3


