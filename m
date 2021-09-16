Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E56A40DC9D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:20:28 +0200 (CEST)
Received: from localhost ([::1]:44874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsFX-0005SE-Em
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6A-0000aq-T1; Thu, 16 Sep 2021 10:10:47 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:43165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs65-0005tB-4z; Thu, 16 Sep 2021 10:10:46 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Msqty-1mkkQX38mW-00tBLd; Thu, 16
 Sep 2021 16:10:37 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] target/avr: Fix compiler errors (-Werror=enum-conversion)
Date: Thu, 16 Sep 2021 16:10:25 +0200
Message-Id: <20210916141026.1174822-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LyOkoG+asRnw83iBmSDISuopuy0rKxuaVsygE66lfD1NbRoAt7O
 CK5uqsqfN+hpVzCnellWtW3VkF8cuo9Zldr40InIuHj3mIMgTJTr88cE2lhqjvwi6flgTWR
 S1BF6xENsfcsHt8iS4N5xzWGksTbmojp49YcUBoJvPRukJbfNdUJdQCma7hSHUOxMcu7LLb
 7LSZ+nfTmEoINjQxjzACw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/5MQYTTCwJ4=:cyrC/6kKcQuB1wqvCkZXYI
 l/jKElGlWYgs7OzKTWQAawLXTxCMkDIwzvl2OZ51GFg57DDM0NOWO0yZ/BAm00qDArSiM3u6u
 NWbesw8e0YUMb7WbkJxmqRzW/a0N8gHyfE1DK5BtYQJ/SkBYgyVEdfRd5q9+G+DFwz/lCu/T5
 QquZ7eXiBe48wQ79026AAW1HmvzSWQkfr7+hUl8C/sxzYCQx1rPRqFfxw5FrAe+NybhGTbSXL
 FzzcI8qR0rmw8Uh+lcxoljxazAB9JTQpyyoJNMSfZnsk7ry33Y15mPOXszSKmNR8JoJzuwp2u
 xtoiNFBUjScZm1gUEZ3EnqLvUglNua0BrDamkTM/ti7CZIqFjHJsvrnYhHo87cxckMu8WVLzH
 7gwWNRAQ6O3PiSFD/ObVC7KnEKxJUduHXN+o79Ipc5/hdyZoa6XYxkh7ABwrhhj7vvxH1J6bP
 iPPXe4GIzau72qg7QARR29+nYwEpOL9qM7YTpns9foVWAN1j4q0Rzxny/3HgaRaOR7XLmrkxx
 z2rTMs7hYYyU2ADDEdojzxuDs7hBdVtRKPLezkMMoCStSAKX2eyr5jZ36DdDYyhv20Iw90vNE
 sOjSjzbaJjp8xMfUkg31LOLFibzzvvpWiM8NfncslW19kWbt1vfmsVYh3wqtYU2BHXMAPzdq+
 OjXReoakBT1ylI/RmVZEJR7eHywKfuJ29A/vccgo0AQNyoiHZ873ExTZbv5ZCpeWsiSFHhQCW
 UE2CLZWqAUWhNL8+edCfuJRcDBqbF0F8VXPzOg==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

../target/avr/translate.c: In function ‘gen_jmp_ez’:
../target/avr/translate.c:1012:22: error: implicit conversion from ‘enum <anonymous>’ to ‘DisasJumpType’ [-Werror=enum-conversion]
 1012 |     ctx->base.is_jmp = DISAS_LOOKUP;
      |                      ^

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Message-Id: <20210706180936.249912-1-sw@weilnetz.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/avr/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 1111e08b83f3..438e7b13c18d 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -70,11 +70,9 @@ static const char reg_names[NUMBER_OF_CPU_REGISTERS][8] = {
 };
 #define REG(x) (cpu_r[x])
 
-enum {
-    DISAS_EXIT   = DISAS_TARGET_0,  /* We want return to the cpu main loop.  */
-    DISAS_LOOKUP = DISAS_TARGET_1,  /* We have a variable condition exit.  */
-    DISAS_CHAIN  = DISAS_TARGET_2,  /* We have a single condition exit.  */
-};
+#define DISAS_EXIT   DISAS_TARGET_0  /* We want return to the cpu main loop.  */
+#define DISAS_LOOKUP DISAS_TARGET_1  /* We have a variable condition exit.  */
+#define DISAS_CHAIN  DISAS_TARGET_2  /* We have a single condition exit.  */
 
 typedef struct DisasContext DisasContext;
 
-- 
2.31.1


