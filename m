Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3DD54999B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:16:13 +0200 (CEST)
Received: from localhost ([::1]:41716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0nff-0003HR-O1
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0nce-0001E2-Kp
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:04 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncc-0006vj-V2
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:04 -0400
Received: by mail-ed1-x52f.google.com with SMTP id z7so8051723edm.13
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eg8b3OBoXd8GR9gPG0wlVgN4K3uY6FcjkKfFCryrL/8=;
 b=qZhF3Up3fN6NIFJlmhDoxHiH9pALpDUlB8alLtVBOuyxbLYYilXNd1mDK9a3vtnkxJ
 2zOayoFlUBdv9fk2U5v2uHpkqHAj0sSJdg7oyABoqdB1FOkWm8usrmofRTRSUnfA2CYG
 fmCFdJm9eQRXlY3/szMsbe+xfc6gLAyImYS0CNowG9nyXDiO6exe99LS7EQQa87POmIK
 Mxw9eb7wlgVRZWNCewuSxeR8eLuWGgo7gEgTqVaNJMq3Y+DWkzL8EodC3dajqb+Ev/ex
 EGfLWE9BJX281zeslpg1PSC4oNJHqDrGKwuoaJ20FfumGFAZQc//PTUa4Z1oJL+8c3CD
 dJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eg8b3OBoXd8GR9gPG0wlVgN4K3uY6FcjkKfFCryrL/8=;
 b=r+ctkYFTE25EY3/Hw3KbeNqV25XmYGfaUrVig/h+YeFo44C3nODKmnScxEhU2DAcj3
 rK2+72B6yqWTMhbHS48wDcCG9MapGv8EwKpnrHOsnEnzqMvMk2aB2slNIcA05Vs9di6B
 01SmLXmjrdEfJSUJDCiEX5J1/LNWzrz6dHJ99dDeTzPY91VZHnphrtPFFaT8lss/7vRb
 87uktfx9CC1sbvjhXDgktIKyXB//Cu9j/jt7thM99pYL0PAcUlZYbao9foVzB4QSz458
 hkOkQLcSXTiFG6YrtddA52nduko5EcpQnSSE1CIMgC1u1yEytfdEY53dldHO58LHbHQ4
 p74Q==
X-Gm-Message-State: AOAM533SoCdIvs2KCEjBA2uBMURdyViHVI8HYxMbim1cD2SzFUBpEqcs
 Hld5Ddv7czZcvhOjbW5qamiqDg==
X-Google-Smtp-Source: ABdhPJy+Q2d8IuWLH6i8lmfHKPFgA6rOD4srlZbGw5UHY6k5sh6Zdbwh7Q7rmhEjYPk6wQ3G5A5v9A==
X-Received: by 2002:a05:6402:358a:b0:431:20d5:f4ad with SMTP id
 y10-20020a056402358a00b0043120d5f4admr800150edc.375.1655140380899; 
 Mon, 13 Jun 2022 10:13:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056402510700b0042e1cbc4471sm5409304edd.3.2022.06.13.10.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:12:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D2971FFB8;
 Mon, 13 Jun 2022 18:12:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v1 1/7] test/tcg/arm: Use -mfloat-abi=soft for
 test-armv6m-undef
Date: Mon, 13 Jun 2022 18:12:52 +0100
Message-Id: <20220613171258.1905715-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220613171258.1905715-1-alex.bennee@linaro.org>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

GCC11 from crossbuild-essential-armhf from ubuntu 22.04 errors:
cc1: error: ‘-mfloat-abi=hard’: selected architecture lacks an FPU

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220604032713.174976-1-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/Makefile.softmmu-target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 3fe237ba39..7df88ddea8 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -20,7 +20,7 @@ LDFLAGS+=-nostdlib -N -static
 
 # Specific Test Rules
 
-test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0
+test-armv6m-undef: EXTRA_CFLAGS+=-mcpu=cortex-m0 -mfloat-abi=soft
 
 run-test-armv6m-undef: QEMU_OPTS+=-semihosting -M microbit -kernel
 run-plugin-test-armv6m-undef-%: QEMU_OPTS+=-semihosting -M microbit -kernel
-- 
2.30.2


