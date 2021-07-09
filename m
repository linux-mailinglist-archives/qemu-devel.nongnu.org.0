Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B695B3C2A71
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:38:18 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xGL-0004Pt-Qh
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x76-0006TL-7A; Fri, 09 Jul 2021 16:28:44 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:43447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x72-0007X5-BK; Fri, 09 Jul 2021 16:28:43 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MStKq-1lb3MK0T8A-00UGGz; Fri, 09
 Jul 2021 22:28:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] util/guest-random: Fix size arg to tail memcpy
Date: Fri,  9 Jul 2021 22:28:24 +0200
Message-Id: <20210709202824.578187-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AUse9cH1is9MEo3IktQmuLG8soA4mjG4Rk7m+Zn/OcPEpHKR+PO
 kkxiIiElz43QZOgvDAFKgjLMTfVpkJWxPm9wHdnxSvIR3pC6FpxvnOReOrBav2UIU20+GmE
 dH/O2o2JgrW07EpKGvv3X9bvPvCRY4TJDiLP01bWtEbKTeXKtXAs8kQfyojXBO5F6xJ+IxZ
 h+7XaOJijk4z9n07T3POQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:73VLRv3XisQ=:0z0ao/ne0UNIrwb+xEDVxG
 r/6lg+QLuHsnFvwJJLv9QQL8L6L/THxR2fmC5wW1dzTnnVhKU/PmFmG62AIjbDP7dGJHwirlQ
 ySnh0py1QXoIxjuO+OSqV0Z+ri8dzKU2Jj9u2lMqifVNRAjRnYIooKM8x6h41j3Et2eGi7Ic2
 VjJMZq00uzT7JGH3s841WstBJyV+K1tEyc76IW/PWtgFR+07Vwroo067kMY9RyDv7vCoQrUuG
 B54GCpN05FfXCjny5Wlz5oBdbJL2AI0bKkFlq+6zhrsSZEmJGW8mfmco59CSAl9aOK++fKAkb
 bGvzntlBLmJU0SZ9wOJCjtQ/ogmtmzjhFpP6jfe4o6mE/T19HF0X9Xpju/nswjTEl6k320WJ4
 H6ULORcJKrIn/DsUgErYXNuNfRTs06L1npeCzgVIGVtnV7hT33vtCPzC1FlxuE5bQYCiRhNWZ
 oK2T1IOYuUv4aIKFWP/ZfRwazfDAKiI8OBswGrppv+K7lEgpobAeEI33Sor6Y7bmlIB7S/rnX
 NlDm6DZkeTMYNvLzK7Y7kGpBbEX990YvQ9MN9DWpW/WgElyvmIAFzjnby8LMXXRwF+JbD6bYQ
 9bD539eTvgoQRJKLkV7W3GbHwEvbWsXNtmvE943dpOK4I54VULOcOvhjbI68xS6UntOGsNtLw
 jBtry1OWRN41K8eLRRatF/C0L5c6u0VHG3Y4ku9HfmpypW9WB8r3OgNPJAfZ0CXV3t2RzO99t
 XXk9ByJEmfRsT5k3mNpIURv7pC8X+Pa30MvidahzZlJ6kiG+v65Ac4AVRuu0tuqvr54Brlzod
 lGEQ4F0ob/SPKrE6r19kEnKaK/3JESKA6JGYR4Sc2M+qo1yVEagwPRkHX4aOtJafNDsLjgG
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Mark Nelson <mdnelson8@gmail.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Nelson <mdnelson8@gmail.com>

We know that in the body of this if statement i is less than len, so
we really should be copying len - i bytes not i - len bytes.

Fix this typo.

Fixes: 8d8404f1564 ("util: Add qemu_guest_getrandom and associated routines")
Signed-off-by: Mark Nelson <mdnelson8@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210709120600.11080-1-mdnelson8@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 util/guest-random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/guest-random.c b/util/guest-random.c
index 086115bd6702..23643f86cc60 100644
--- a/util/guest-random.c
+++ b/util/guest-random.c
@@ -38,7 +38,7 @@ static int glib_random_bytes(void *buf, size_t len)
     }
     if (i < len) {
         x = g_rand_int(rand);
-        __builtin_memcpy(buf + i, &x, i - len);
+        __builtin_memcpy(buf + i, &x, len - i);
     }
     return 0;
 }
-- 
2.31.1


