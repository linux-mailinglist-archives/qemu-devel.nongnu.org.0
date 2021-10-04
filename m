Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D13254206DD
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:56:16 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIpb-0008OV-Pm
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeN-0004Ab-47
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:39 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeK-0004ni-Fw
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:38 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M3mHT-1mX1nf1jcZ-000vlz; Mon, 04
 Oct 2021 09:44:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/26] linux-user/nios2: Document non-use of setup_sigtramp
Date: Mon,  4 Oct 2021 09:44:11 +0200
Message-Id: <20211004074421.3141222-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wm3fA3ayo+Vpo1cXsJOJBEgO6suS+FDD9FUn/Xj0CcNrUldiO2F
 QBFYfVY0Kg4MdygbpL30bsnY5OHMz7b6XIzUSbbrtRNheWgFbynezpnvIszbApIMOJN7ibB
 9fF+I+PxEnqs9JBWQn7yaDENwt+G6e7aQmeujiqTgssMyF5B8XzNJMErM6ZVRJ/hB4zeYON
 itF2Nmz7eBqX2mjv/YEfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ioMF1ozEAk0=:luPzz7beYWTJSeGL6rsLt8
 uX+gA6wZCC76xQIA18/nt2Asd50Qhe9Wt66c4zVwXUyaCmvW1RYimwko4S3b3IEZIdVQXdzzp
 oHVjSqvuaEJLB/KKAXZIUGhBSE8NqVsNmp37Duj35za3jdLyTE7KirrdvrTINWGNyohEiuGWO
 lexyqo3NiTCJr9NqQegvutyYbVx+fgc5mS9sI563/McTJOoBZHTOrmLwSu9Yc9ky0GfDipJx+
 bq1zvib0S/gOokKpK182qmyhzRMQLDVwRprGRWxdH+3ZnHtg70ZmAyMvZSWAyEpVqHZeyzXpz
 5OZ4E8qBoZtc/tBWnvRw+Uq50RAoWx1sq7eQqOwWrQ4GLQBTbCPSk3WgBd5VUCPWrzM4+Vn8N
 5II0sjFuQV6ktQWc9cwzzQ4Wi1HTkMIDrPRCDHDOLCmiCTtovGpH1D3o+9PFD/LFAVQiHTfjq
 X2R8beXP0QBzpKYg9v8Flp3VIm0gMFMnNKQezHpPhJlryAcfoTApOvro4f79Cl2kTfJm1giOB
 esrfc5g8YBmU5YBlDdd8Nu7rk9OYrmKwjLp+o2mAdRoJJjyKxcOv7gR6KsHmNWsqbfGwkUL4X
 xS8s1evy5XyOqIykk/EUUrKdMF6YfecvFKkN8x+Wn/8QD6w+3bT3LTE8tf/RJnTZgm/YG/zkz
 mRXZIVTqzVWs17CVfOxQFfhT+Bd7W6J8iBktMb908BEnBdUVQDZsLSof0vawvV6Cq9hVOrcBd
 RI1ijiAltteAH9cCtAkp5qpzdK9J8JRtlk7D8A==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-17-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/nios2/target_signal.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/nios2/target_signal.h b/linux-user/nios2/target_signal.h
index aebf749f1278..fe266c4c51dc 100644
--- a/linux-user/nios2/target_signal.h
+++ b/linux-user/nios2/target_signal.h
@@ -19,4 +19,7 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+/* Nios2 uses a fixed address on the kuser page for sigreturn. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+
 #endif /* NIOS2_TARGET_SIGNAL_H */
-- 
2.31.1


