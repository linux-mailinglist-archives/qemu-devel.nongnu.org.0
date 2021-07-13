Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27303C71E9
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:14:40 +0200 (CEST)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JBH-0007lT-UR
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifn-0000L2-52
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:07 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:37829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m3Ifk-00067R-Rs
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:42:06 -0400
Received: from quad ([82.142.17.146]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MPXQi-1lqhlo2gug-00MYbj; Tue, 13
 Jul 2021 15:41:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] linux-user/syscall: Fix RF-kill errno (typo in ERFKILL)
Date: Tue, 13 Jul 2021 15:41:41 +0200
Message-Id: <20210713134152.288423-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713134152.288423-1-laurent@vivier.eu>
References: <20210713134152.288423-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8MFXMEi9VvtHtmSkLfksD14c3gnzNr3YMakgEWHpUMCk70ZtASL
 97c8Z3Swe2k0M1Pt2Th6JCxeRWJ1NqmsRlv9ezJIiZ0+uNj2GHqHjQ0TbeOrX7KXV7KMIWz
 6ns5+g2dYiXJyfPXIh4frVRHFQbxtlXRvENcUZWBYfyN4/kd39dPzB+krBZ1Nd6ZLB1s1sk
 QcbJ3crqxYJeLQtNLhz4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VwZBF7/bTnw=:gg3Us2HzguusUIwN1rhjsb
 8aYeSxvmPduZPM2E47hiYxji/UAs4fNTZ12bzk4tw247GL5Y1IkFBIK7uSdtkrBfsEtEZqZF2
 OqCb/V+fqHyIfHSf4LL6PpnyWIO0i3uHu2/0eI00cHtKhH8BGmTwEyuStHDlsL81ohCoXBGYr
 ROotbpNOwNvuy/ZMVcr0CQ1ZWMg8IwUUidmv5+iBvBF8XbVd/Oj1An9YeAFIpW/QiakOeFbE+
 vQE8KwUq2A/YJhF9x8qX2esViE1s9+MByR6QfkCWMsuXStKYIiRN4cPPBZY52529yDKvOxVIV
 0z3z1Fnk5Igq7iZkiPotZe255ldBCZga2ayJIlJ0I7po0hjfoVm9RfOM/A8Qim0ztbOI/OLqy
 9KxYyAswGmugIiKcPPJ8J0TqAxq6nGpulI4TUiHuowvCa+ff55Jhv/a/LZYoO9PzCVOuPmHSC
 gVFlBcO9I8ufpZfyXGra0Gwp0x6s+e6xo0utmhZWzlAO3cNb+ZqTCK6Koe0hHbKrN9Jfwj8k6
 1qh5eXLLrWPLzIc/D4Ulcx8s56Gfq2Tovhw7Jq+dfNytGWpnSPLnLau0iF1r2L3/n55Q2MfbL
 Z9AULGMpKVbJrgGEhv+e4D4FDKRsWhwBpSS/iUhMEbLBJN5r2IlOWItYmqXRuzCDe9Ft/hjn5
 vq2nsYFG+c9PgTzuprrwn73hlEM5D8cMMEcgEBrNFd+JZDKVHDByZcfH66nxaWhC9SVy/6ssq
 lQ3sulj8aD/JZDbRxX2biZBulb+Z7a80xgbfoYs5UoAijURDGyArzgs77zc7IPrkasdQyvq42
 UBzzT92Lc8vqpnsaQD7vk0cae2YLdUAiIhFQvUnw8MCfODc4qjznorojl2zHSyCfy41J9Dj
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

Affected targets: alpha, hppa, mips/64, sparc

Fixes: fe8ed7d5794 ("linux-user: Handle ERFKILL and EHWPOISON")
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210708170550.1846343-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2e826206d227..4842a1987b79 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -629,7 +629,7 @@ static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
 #ifdef ENOMSG
     [ENOMSG]            = TARGET_ENOMSG,
 #endif
-#ifdef ERKFILL
+#ifdef ERFKILL
     [ERFKILL]           = TARGET_ERFKILL,
 #endif
 #ifdef EHWPOISON
-- 
2.31.1


