Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E86E850
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 19:07:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL9k6-0000EZ-2j
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 13:07:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL9eS-0004Sl-Br
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:01:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL9eM-0006We-7d
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:01:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35880)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL9eI-0006Qc-FT
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:01:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id h18so189194wml.1
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 10:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Rv9idA66U0R3da/ng9l1sXaK23Zu2IQFWoWn3MV0yck=;
	b=e7rIDARkQlswB+K4yyeHwsM5VJ1v1gWkRdrp7S4ViJtg8krnJrGFDW1JxfKhCJp84+
	YwrsZbx6/cBnzSEecmm+/1w+yBpiPywCFU9daUtrRaJOUK1CQNYgFGDOXXmPbDedalUE
	188IGa0yhNPGfE3i5Ko6Sr81+kUD5CBGI1Z56Kiri2tdUMX2Z490ejs+tGJlCQSRsXPz
	A1jytr6ee+XDr+mj6Hdg9trdggq0wycUjLgz0Ndgjask276bQUVkVAZLf2teQL60IuEA
	gQX3HIaG1yqMhrmFvCIyRfLX5l5RuJod//wQXQj1qXrqdUshETYMADn9m9fUcqKyqVBl
	HAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Rv9idA66U0R3da/ng9l1sXaK23Zu2IQFWoWn3MV0yck=;
	b=Ktk1aLRpA2NjKhJtidUVSCsrRppXhWtDnv00v1OxrgiySUZBj04Mvz8yHaL7YoZVaB
	avFyQT/BJ6uYLZKzDro1S8+7QuAUTl8JX30Hb5mrwjPyYJv2LKycTnoEWORymUfdtgSj
	0Q2+J9Xhsc83VMM7R7xKmHsmZnH1Fji7rnyX32vf2J27K1r/uSVHBsGHva62Ajl5hgGk
	NCL0QGaabrbIFcp1ptAC4f/YlBTWpURkDYuVDHVCa3U0o0JsA81P7gWiwSQKFmdW95x3
	MP8Htdp7EgCWDlpQ3sXyFR3pxhs+kjaGSB3zz/FbmpdCMFia29HsGejYPsrtrj+2adFe
	7Jbg==
X-Gm-Message-State: APjAAAV0PzzYBRHkO7oWiXYmWBUU7BgTjeWa/VJ2cAL+TondyDddNm8z
	h7tpVt0bJhI87LDkwTLwRAm5GKHdMoM=
X-Google-Smtp-Source: APXvYqwsON+Gd5pBYahcX+Ha7Bkl5oFmHzdPPtx41akjLA86E/X9V7qYqV62/QG04owTTmEhjGdtqQ==
X-Received: by 2002:a1c:ef10:: with SMTP id n16mr57476wmh.70.1556557251610;
	Mon, 29 Apr 2019 10:00:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id a13sm36896wmj.39.2019.04.29.10.00.50
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 10:00:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 29 Apr 2019 18:00:03 +0100
Message-Id: <20190429170030.11323-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429170030.11323-1-peter.maydell@linaro.org>
References: <20190429170030.11323-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32f
Subject: [Qemu-devel] [PULL 15/42] target/arm: Clear CONTROL.SFPA in BXNS
 and BLXNS
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For v8M floating point support, transitions from Secure
to Non-secure state via BLNS and BLXNS must clear the
CONTROL.SFPA bit. (This corresponds to the pseudocode
BranchToNS() function.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20190416125744.27770-13-peter.maydell@linaro.org
---
 target/arm/helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 547898581a2..088852ceb96 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7819,6 +7819,9 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
     /* translate.c should have made BXNS UNDEF unless we're secure */
     assert(env->v7m.secure);
 
+    if (!(dest & 1)) {
+        env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
+    }
     switch_v7m_security_state(env, dest & 1);
     env->thumb = 1;
     env->regs[15] = dest & ~1;
@@ -7876,6 +7879,7 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
          */
         write_v7m_exception(env, 1);
     }
+    env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
     switch_v7m_security_state(env, 0);
     env->thumb = 1;
     env->regs[15] = dest;
-- 
2.20.1


