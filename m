Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551353C86A2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:08:07 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gUY-0004JS-E2
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNX-00078f-Pb
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:51 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNT-0007SG-R7
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l7so3601860wrv.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MczHOqcdLoWxElksMGXRkUJuT9DwyDzq8Xjve6uQ6gY=;
 b=MEG7Iy+jNzlLLY9iecTQPOgj7g0EGObODvn/SgdakAChCFmpacxtKHcIbrDvCCNkaT
 3pllNYx36idNTdzNY79ZP9XkJ+mXwRM0DrvdAh2h1H3pIpgEdikSV2yOkFEa1XPWJsfp
 dGGuOxBbO0BLITdD1P7Ix0d4ERa0TQoCZsAFCdmLtGGQGA1ixOsjRHvwygq3t05mgjbL
 17b9eu9IuCK2uQl/DtCpe9Cp2eGTw3dmeMBYz/Rz4cbIZHrfIwgnHOi7u6NyH231LmSp
 Mm7vPW2YpeBdf+L9ec8QkmRe/FNBrvdGaJQFfefIY+udRwEmE0Rro5TKrjGDR8u9vFh5
 CrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MczHOqcdLoWxElksMGXRkUJuT9DwyDzq8Xjve6uQ6gY=;
 b=prLvcZ3o8KY8ZtRHNWQ250mpk1DJP+ZWaY/gHyaj/Y5zmWsNuRQysda0D4ubqEi9qR
 WaVG4dBi2IvAaCl5AYSeeXTC3XX5qJX3bXVecbEkex7AWfO+MoiX0qb+HB6m2C8vaigL
 yUD+FzPVPcMGU5AGT7lORrGM/3yEwpda60sCYeKy4OKr1Q6IRq/MHnQyfcn0joD9SgFw
 8fyzhkWr6fzWy+a7wseLxLmAqUaAypVF2ak7COQPfqo9cfHmApm2zlTjRElwvgO8ZrLO
 bOfbi+PIfFdhnik1KAjzJNmw3/5K0yaTkKejcftYilSxNd93l1opFiYtVC74u4buYlW+
 XrLw==
X-Gm-Message-State: AOAM533+ubhIFVMBHjC8BYTc5XdqxF7jy3hftE1T9cvAHTp5RhK5x1/+
 RXEFzAoN3EANcARww3KyB5aunw==
X-Google-Smtp-Source: ABdhPJyddHcVerGE6ymTuz/KfqO1anLXQX/bDv/Zbcs2lYBAFw9i/F4C+AnwQ3Qj89aMB3ikakqVsA==
X-Received: by 2002:adf:90e2:: with SMTP id i89mr14100707wri.338.1626274846277; 
 Wed, 14 Jul 2021 08:00:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm2801852wru.65.2021.07.14.08.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 413A11FF91;
 Wed, 14 Jul 2021 16:00:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 05/44] tests/tcg: also disable the signals test for plugins
Date: Wed, 14 Jul 2021 15:59:57 +0100
Message-Id: <20210714150036.21060-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be more important when plugins is enabled by default.

Fixes: eba61056e4 ("tests/tcg: generalise the disabling of the signals test")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-6-alex.bennee@linaro.org>

diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index f7efaab918..b0a2128980 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -65,6 +65,9 @@ run-plugin-%-with-libinsn.so:
 	       -d plugin -D $*-with-libinsn.so.pout $*, \
 		"$* (inline) on $(TARGET_NAME)")
 
+run-plugin-signals-with-libinsn.so:
+	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
+
 # Update TESTS
 I386_TESTS:=$(filter-out $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
 TESTS=$(MULTIARCH_TESTS) $(I386_TESTS)
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index d57a115873..85a6fb7a2e 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -37,6 +37,8 @@ signals: LDFLAGS+=-lrt -lpthread
 run-signals: signals
 	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
 
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
 
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
-- 
2.20.1


