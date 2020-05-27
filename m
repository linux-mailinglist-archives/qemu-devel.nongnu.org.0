Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0E1E46BC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 17:02:22 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdxZV-0004p0-Rz
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 11:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jdxST-0001mr-Qc
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:55:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jdxSS-00088W-QE
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:55:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q11so12158767wrp.3
 for <qemu-devel@nongnu.org>; Wed, 27 May 2020 07:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vupRe9jwuhTs7KToAQhEvgkiMcCUBt7Mkvk5TFUzZs=;
 b=nHUorLf0Pn4IZ7q0JQXkBRUnT3MZYUh2Ww9VNciYYAZN+d40i1yby4TuZ4P89NcO5c
 LFxXxeCwKrJQBoDWoBSeQPFEOXTnyLwsuzwq0l1AxyBifZCBh/gza0eFq94lNiE6jFfL
 Ce1mzFrs9kc6wH9TiLRgdBLyKaRB/jxZeOFhsqI804mpDIU8qqztplpjhn+Fx+QK2MXp
 IiE8vJ/F6NKaadtOjlVODFwWjrCYmwF5O3Gpj9/VKnJsCzqsjpJo+tyZatMSWLcyjtSK
 8IZcipKz1f/LP6sbJeo+oZq7MunT+0zkIFIFfgsgrFpEkU6W9zgkQXJ7Vzb62OHcKpVb
 oqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vupRe9jwuhTs7KToAQhEvgkiMcCUBt7Mkvk5TFUzZs=;
 b=H2A18UwtrTaYp6HqKPDYBtq2fTsCJHgWV08/kWKqeQh1/lq6c+DsTgqpBhNkM5UBfi
 lyKSET4blc2EkJ1R4cgFLnZjVrTIiF6dbejo/oGdAEFBCPCb1qcqqfUJwJkKMTh/Mfqx
 6Q2sFP0BFEkAZoa7afuBSb/n22DsCUXUQp+UiMBLAZcL103Nfreef3vGp28ob89ndR4V
 JAKLvFvy7dYHD3WP6+gr7maj0dezk326U68FMMBd4mhyu5zv20LpFTWktGf99yEf4M1b
 5CXf9zzhN3wXBe15JAWfywu8isMWIXGUy3ZahvigPpvkxkXTE7qM10Fab/ci9EdZmpfd
 zo6w==
X-Gm-Message-State: AOAM533+PjT7h7TClkWt1nncnOg+xpDF+5JMWmR9u4ndAoyrl/yYfCY+
 PsrhDoQeBZ8E52SrfTh0Fn41HAOCC+E=
X-Google-Smtp-Source: ABdhPJyeT2NEB0Zbf5S9m40Ozq+xmLN2nu++ng0XDnBD4/ogjSBTgq4jU7o3e9yTtY9kPikgeQXG2w==
X-Received: by 2002:adf:e883:: with SMTP id d3mr15356633wrm.274.1590591303447; 
 Wed, 27 May 2020 07:55:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u74sm3027510wmu.13.2020.05.27.07.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 07:54:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 821D71FF91;
 Wed, 27 May 2020 15:54:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/12] tests/fp: enable extf80_le_quite tests
Date: Wed, 27 May 2020 15:54:48 +0100
Message-Id: <20200527145455.2550-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527145455.2550-1-alex.bennee@linaro.org>
References: <20200527145455.2550-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These have been fixed now so we no longer need a special version of
the le_quiet rule to skip the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200520140541.30256-6-alex.bennee@linaro.org>

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 03a74b60f6b..e6d87fcbf0e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -741,13 +741,6 @@ check-softfloat-%: $(FP_TEST_BIN)
 SF_COMPARE_OPS=eq eq_signaling le le_quiet lt_quiet
 SF_COMPARE_RULES=$(patsubst %,check-softfloat-%, $(SF_COMPARE_OPS))
 
-# FIXME: extF80_le_quiet (broken)
-check-softfloat-le_quiet: $(FP_TEST_BIN)
-	$(call test-softfloat, 				\
-		f16_le_quiet f32_le_quiet f64_le_quiet  \
-		f128_le_quiet, 				\
-		le_quiet)
-
 # FIXME: extF80_lt_quiet (broken)
 check-softfloat-lt_quiet: $(FP_TEST_BIN)
 	$(call test-softfloat, 				\
-- 
2.20.1


