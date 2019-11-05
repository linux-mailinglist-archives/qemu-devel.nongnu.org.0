Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2D6F04F7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Nov 2019 19:21:48 +0100 (CET)
Received: from localhost ([::1]:47229 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iS3Sd-0000S1-Fz
	for lists+qemu-devel@lfdr.de; Tue, 05 Nov 2019 13:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS3Iw-00065N-9S
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 13:11:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS3Iv-0004l1-4D
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 13:11:46 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:52091)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iS3Iu-0004kT-Qs
 for qemu-devel@nongnu.org; Tue, 05 Nov 2019 13:11:45 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MoOpq-1i83Z60YPY-00op4j; Tue, 05 Nov 2019 19:11:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] linux-user/sparc: Fix WREG usage in setup_frame
Date: Tue,  5 Nov 2019 19:11:14 +0100
Message-Id: <20191105181119.26779-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105181119.26779-1-laurent@vivier.eu>
References: <20191105181119.26779-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0DoNR5fwugDlgAqxhCD9lhbRLQ2oXfce50dKpyFaWJT51JDiFSK
 COW20gXNKjeZgykCDzKnyYd4/hjTlVPGDGtQ+mzQSrk7A8SlBOtCV1NtrEbfalEg9zolqgw
 yOhbEaPyViy50J4E9OXiWvKjmjX8/KCdCuoymVsO904AFnC92o0XYhZ4ycpFS+B3qT9LtgI
 ONj99oGcaw8X+80lrayAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gQhxm5rs/Uc=:JNxFxc8YM0iO8rzluI1/q+
 xvRohACWaykUGoPPgizrKttTlX7NkDW1FS/TKKJSDVPantb8t+ZS+pGB5cnDFlVjtyDeNDKNP
 6t94UxT77Xl2zl+wj+/8msC558/XhT3IeuvkLHukw0xglEf08J/uPF5pRcqgUAiyd/OK2n2Qz
 vjbvIOKO8nwwepPknnpeNj0NpdsbNptXiJ/fNlw598QaQbIfJCtsJDtP+71PHfxmo2e4+RPBy
 mCn/FTH4bX3cm0B6Xf0p193840OxcmVHKCaReJL3NDNvPLMUe4oAXX+02pb5sM7Ex82y5ZFXz
 EBfeHYOUUL6CRjSyIUCplRB49phpNc5gDI0bAUxS1M7beGmUbjwWr6JF/d/FFNTn7C4d5TCxW
 QaPn3gGjaaoQnB7+AnhCU/4kmhxm8OMpA/RON8OC5PPf8YUWSkBXtEBvmv+ak4v1/AKA/3SSO
 8wbkqluQWl4W7pXwwBvpPyavxP52MV1s4iQ3WmLiq2ZxJiktU3EDW0e9BW/Hig9znMyys6WBX
 hQ6tpzrAh8nRpZRP7BJx0X2/3HANwTetD7w1x/BVDWvYjQ1hUEUeeXj/snXMtjTKUzVI8ErNH
 vK0SYL9nW6ySL1svmfmp6JBEodFdUzl6zmTyinoPpuHKyF2xLaOxG/AKvddaHHibCsc+wsdn3
 332udlbUNVRxgqgymNpkFi6rCzZNZv8HTfWykNBQE2S9FmeXnvbSH+3kWxd2ArWX9ZuiJQAXh
 pA3MmoaloZMktuCssXTxZJHzYrNzgQ3+3RZ5FyAqLONymBuQudam/R1TtfYBGJPtYtLaZevWb
 euSPD84rC5h0IV4Us2N4cewjQkyDy8hDX1m/O5jIvhPeBYXjyghM+DyfzI+fmtwReXyfrrMHL
 lT9pYP+/x3oHgdJQbQdg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.74
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Use WREG_I0 not WREG_O0 in order to properly save the "ins".
The "outs" were saved separately in setup___siginfo.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20191025113921.9412-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0db4c5f84fe4..efb0df7e2b2d 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -192,7 +192,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
         __put_user(env->regwptr[i + WREG_L0], &sf->ss.locals[i]);
     }
     for (i = 0; i < 8; i++) {
-        __put_user(env->regwptr[i + WREG_O0], &sf->ss.ins[i]);
+        __put_user(env->regwptr[i + WREG_I0], &sf->ss.ins[i]);
     }
     if (err)
         goto sigsegv;
-- 
2.21.0


