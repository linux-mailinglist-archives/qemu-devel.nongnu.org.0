Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766EE346722
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:04:33 +0100 (CET)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlOK-0008Ko-Fv
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHT-00078M-1O
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:24 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHR-0002sX-8F
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:22 -0400
Received: by mail-ej1-x632.google.com with SMTP id k10so28273241ejg.0
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vckf+pPL5pOYGH6FyOdM2DsPAnORk+8EZCi9joz3GnQ=;
 b=PGqxE9B0o0WWlJAJIffqm/cJQ8cgebiK5J6vRBvYUN61e0Wh6lOY/l9ar/ldJWUwv+
 GMqRKJ3VBY4wMZclCkF2LhOOissvSQ7PAlJBCDjVOkMoS7hEVAU1uddnOnFtZNo6jTLJ
 uAJr9yiPor8SOvl5lEC+CGmpRuWhXRiL/t4y5nGS/XNVjfWCIOKt37ADswTuVKYh7Ifg
 8A2pyUuUiUSpHf8sPEwG7Bh2eeBns+0l7gK9duxJFCrf0eQ4Wj6eCB6QMyig2kXrAzMe
 z+h3+rZx9UTyGbvEr21PI0ekVH9KtSH7KAcciYVJN/AQ20jmHR1ARJV1eEtsc8gtfYmT
 OrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vckf+pPL5pOYGH6FyOdM2DsPAnORk+8EZCi9joz3GnQ=;
 b=LJSsXpVky/29lqTCqhb8vmdxbkNxTLzM0+kBIyGK28pOTkVrYiqjan/UeQgUVFQKiK
 S1wu5B1mzgf3KcUKc/oJDK2ioUrowRXeg/8wi3a0StqpWFry0PDbzktYofpBXQYbkvTg
 yOb/Osy8HZ5ATUfjrWFV4eoweFBFuWzrQmTRXE06T+izcJEZvykaAFtTAq0/3SvwIsTj
 AQspi2Nz73Aq0r5ozrXwjQDf0kzw55pwcFcBGJPsLDMMoChStTSvTa9LbXv79Umff31b
 ooBrtW6ZOzDwsZH3GlvF4gCL0tvtNPWZ9HiYhTH+kYmOu63v3eqkfkkLgS19N3K6ZzLc
 Y5JQ==
X-Gm-Message-State: AOAM530BssI+F0wRILz7YYxQWHkxB1mqp9WzE4gk9T/DOfuHs/mc+K3Y
 l9p82fEG15qCFmV1ap7qtS+wUg==
X-Google-Smtp-Source: ABdhPJxhL35q8dD3D7cWuDrpqmjTtBfMmD7/XmZU4PLJ3LH/kEiOQJYbY5W52tFzoJ0bBAQOkp6L4Q==
X-Received: by 2002:a17:906:5e01:: with SMTP id
 n1mr5814446eju.359.1616518399897; 
 Tue, 23 Mar 2021 09:53:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm13206432edu.79.2021.03.23.09.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DCF011FF93;
 Tue, 23 Mar 2021 16:53:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/22] semihosting/arm-compat-semi: don't use SET_ARG to
 report SYS_HEAPINFO
Date: Tue, 23 Mar 2021 16:52:53 +0000
Message-Id: <20210323165308.15244-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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
Message-Id: <20210320133706.21475-8-alex.bennee@linaro.org>
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


