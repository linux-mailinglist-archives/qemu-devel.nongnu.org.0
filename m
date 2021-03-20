Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89473342D1E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:42:53 +0100 (CET)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbsS-0008FH-HM
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn6-00034M-C9
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:20 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn4-0004Gm-Ji
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kt15so4581703ejb.12
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/e/SdGSFzWo+xbjndfr99fhe97V2yal8vW6qxaRucA=;
 b=pbpHF2NtDcnU+gVku79AOo669AZh4wmkmNpTzMX+L8Jk4sxlIU3a/2FIuAzU+4Emi2
 P0D5isRSDzlP7X1UMxfZdnVivGloRNVegRzeH+mUOozo+f7xhkj87Mr7V6BIW/2Q6eSR
 qDZJ0HUEkSgO20/16YL4hYe4kfNLqSB6xRWr784e+FLlHehtAnpDYMbu9SojZH2Vpkzi
 2aRmBmnVWpSqdYBVwjX48XYu2d+KegtDAr3hjw2wBRHfXe2tKLzVIi6H+UuVYtcOq/Nh
 blW2uo5DRohmuZaSA2eQh8jTDOvkmlfbNVbQbsL0LOXJ03FHWW3VkAyExDGZTqCrw6EH
 yYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/e/SdGSFzWo+xbjndfr99fhe97V2yal8vW6qxaRucA=;
 b=ew1cXW/wXaEC3YoMiP1GbWhlM9vkP9fysZzzYEhEHsaPuJubfYMiMd43P7+cFlijNn
 cxdOEyDCNUXGN+BAuvCiSMfW900r1t+vt4T3muLiVroRpsJzmaUo4nL6rKiOdmfC/q1x
 Iz1/Oeh0BfHYeDwpT6NztoycMbuggJaEIeeJO8PK34dNrlEYNAmmz1h3TVZNUMpqISDv
 GDyzy7FZHG7YivvreWTdT6p510AAv5CrJJlfjeXmY5vq8wfAfxs5Ze6+Gy5RJUCWumys
 jZ3mPfck60xgmTBbfRTmYAxBwFhKr3RWglnWelMHsmagIioe3kwfjbEPghixi8PmtS8T
 M5JQ==
X-Gm-Message-State: AOAM5328HeXOtKNjpgoNtlhFqVq1O0vFeFAbs+huTDwVaLfizkhhlx91
 0GMxKIIyfbbSjp6wvK8xL5H7eogTXEUzk+s+
X-Google-Smtp-Source: ABdhPJw1lWpV6Exj5U/l1R0WdZlA5ZAFROJXQkCBd2WdiX4rvTiSHpmJmWru5shOtMb6iH/BJsVbRA==
X-Received: by 2002:a17:906:d554:: with SMTP id
 cr20mr9859829ejc.61.1616247437251; 
 Sat, 20 Mar 2021 06:37:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c17sm6773579edw.32.2021.03.20.06.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A8211FF93;
 Sat, 20 Mar 2021 13:37:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/14] semihosting/arm-compat-semi: don't use SET_ARG to
 report SYS_HEAPINFO
Date: Sat, 20 Mar 2021 13:36:59 +0000
Message-Id: <20210320133706.21475-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bug 1915925 <1915925@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per the spec:

  the PARAMETER REGISTER contains the address of a pointer to a
  four-field data block.

So we need to follow arg0 and place the results of SYS_HEAPINFO there.

Fixes: 3c37cfe0b1 ("semihosting: Change internal common-semi interfaces to use CPUState *")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Cc: Bug 1915925 <1915925@bugs.launchpad.net>
Cc: Keith Packard <keithp@keithp.com>
Bug: https://bugs.launchpad.net/bugs/1915925
Message-Id: <20210312102029.17017-4-alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 0f0e129a7c..fe079ca93a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1214,7 +1214,11 @@ target_ulong do_common_semihosting(CPUState *cs)
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
                 bool fail;
 
-                fail = SET_ARG(i, retvals[i]);
+                if (is_64bit_semihosting(env)) {
+                    fail = put_user_u64(retvals[i], arg0 + i * 8);
+                } else {
+                    fail = put_user_u32(retvals[i], arg0 + i * 4);
+                }
 
                 if (fail) {
                     /* Couldn't write back to argument block */
-- 
2.20.1


