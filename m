Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1315EBAC2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:34:55 +0200 (CEST)
Received: from localhost ([::1]:40780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4BC-00082p-4K
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od43L-0001wH-8Y
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:26:48 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:59753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od43J-0000Zn-8W
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:26:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M8xsm-1oZBtc46be-0063Pn; Tue, 27
 Sep 2022 08:26:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 1/3] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
Date: Tue, 27 Sep 2022 08:26:31 +0200
Message-Id: <20220927062633.618677-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927062633.618677-1-laurent@vivier.eu>
References: <20220927062633.618677-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aWbMteovk0Fsy5K+3nNKLLzndI0uND8TELJqH23Qyhm8WBGB3wR
 +FspVlHeNFBfr2A8/qxe3t4NYBMET0AbRzZvqoZ7bVOzG72+/87cOcCHXJBoduWUNF5DSoJ
 KXGGUPHsydj9Zo3ca7wxk72wt9eHMJkD+R0Ah2dm+KEpO6lAOHDIGgciMu3JYUtZemZgWVE
 QCYtmunn+yRDSqbrww+DA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MCM26cFk0t0=:H9yYOGtNq37ThQ97rO/Y3u
 a/lX+LY9Br0MDkVAL62K7mg0Ilhr368yBlo/UYHBb+/dd31cOpOSv9yQKwdRMq4vVK+wvsbrI
 m6L5y52umuitOBw6YuEDMJm4ijsAa1YoSxDbOJheqCXMQvyBd52PdlsyoL6jAKZSJcLutYfhw
 47t8i6HFku1kylHfMiNgTSK5fwZZzPeE0z0HsImaVqVqQOjqtQT3nbp//UhlQfKqeWNDFnxd4
 fOwrejfXT6QVOnHbfN8gLof9iAL0gXwnmMqhkOJcmUNtg7FzALDKfC8nbC0Uc9scI+LuNMMrV
 b6YCtOPdeXgF3+bb9450PPtwYqzDQzNFOJCkRQvHAY0mzGwajvlp/zIvxIVfhFRSslSYMms6d
 2Wu/C4BLlfkS8eQ/R1Cf1ZvE00W54U82+uFNGpBSJrVJ1YD3P2POXrFpMwGV2ZtWDA656Nh8u
 thFnzDG2qq41U/i5qYcUchTV7JlcIDnc15ZMOrSWvfYeY1eO11I0o00NIIzT/Z+wrDTHaVyD5
 LvPefKzeZcPzNPcnYnOWGZXBq+me1aYP06xXmBXQyNhkcwTYxzEfndquUHpAfuy365j8NEI+i
 pWw8WsWgTYDp/c1IEZxcgJT848zGwBBw2/WZuLqN7zDhs4pohJl9UgFYXdvfqrUk7Rvm2exKk
 2wam6FBaf3998/yaKl4hO4+Zmm8K7lx2xWiz3AvxYXGLg3rXIIDJiiPo81QCDCoJs3NHR9ZcE
 YacnBtvv3HeoPYxYwRCBMJrHxXzSx/wjmgN3plYIp+M9jQoZzBllsT9kGiA/W0IQllAPRjr/i
 BlSbNgr
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

There are already 32 feature bits in use, so change the size of the m68k
CPU features to uint64_t (along with the associated m68k_feature()
functions) to allow up to 64 feature bits to be used.

At the same time make use of the BIT_ULL() macro when reading/writing
the CPU feature bits to improve readability, and also update m68k_feature()
to return a bool rather than an int.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220925134804.139706-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.h | 6 +++---
 target/m68k/cpu.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 67b6c12c2892..f5c6e95cb44a 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -154,7 +154,7 @@ typedef struct CPUArchState {
     struct {} end_reset_fields;
 
     /* Fields from here on are preserved across CPU reset. */
-    uint32_t features;
+    uint64_t features;
 } CPUM68KState;
 
 /*
@@ -539,9 +539,9 @@ enum m68k_features {
     M68K_FEATURE_TRAPCC,
 };
 
-static inline int m68k_feature(CPUM68KState *env, int feature)
+static inline bool m68k_feature(CPUM68KState *env, int feature)
 {
-    return (env->features & (1u << feature)) != 0;
+    return (env->features & BIT_ULL(feature)) != 0;
 }
 
 void m68k_cpu_list(void);
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index f681be3a2a58..8d23c72056fd 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -38,12 +38,12 @@ static bool m68k_cpu_has_work(CPUState *cs)
 
 static void m68k_set_feature(CPUM68KState *env, int feature)
 {
-    env->features |= (1u << feature);
+    env->features |= BIT_ULL(feature);
 }
 
 static void m68k_unset_feature(CPUM68KState *env, int feature)
 {
-    env->features &= (-1u - (1u << feature));
+    env->features &= ~BIT_ULL(feature);
 }
 
 static void m68k_cpu_reset(DeviceState *dev)
-- 
2.37.3


