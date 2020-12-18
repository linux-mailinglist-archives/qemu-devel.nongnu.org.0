Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B72DE1FB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:29:53 +0100 (CET)
Received: from localhost ([::1]:41740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDxI-0001Ho-CO
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDum-0006p8-K8
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuk-00035I-Qm
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id 3so2182433wmg.4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=52j5UDdkQCGobtG+iJtsfKQkVY+3DyC1b4VXquCpK3c=;
 b=H+BkBVJ12lclMF4XELXnUmu8nzqmC4HwqL7cYZ8qAuwCn3F1haXAedt1jlLhjg3maY
 LhhvS/OGWXTSxNyG40dUvB8aaae0rRJn194v7Q6OOHYBbLIL61NDxrEcJQTBq/yKLiu1
 MaDSNwCjHv9R7e8JbOwOOaPDSqVWxkLcF1iwVhhv7GFe+lZHz9tvWeJXxMkJHZgWVKV1
 Bl+01NLTFpG865xAmHx0vMycACKE5xDye4+Z3frA0N0GdsIsd9hriyMR7P3voH2lrFLD
 oyYgvYA0ISMI8/o1l88OLkWxIlHdErx5dsvCWeBhqdjyf9U1WuScIfNNkfRr6tVw8hZ2
 gOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=52j5UDdkQCGobtG+iJtsfKQkVY+3DyC1b4VXquCpK3c=;
 b=lPQ9wXSRd0wpuLLpls8U4Cl1P7E8l0JGBiHNW1jaZgIUNtiB6thCT8YXQe8J9/znjE
 jw9WnQH4l9C4lJh7EphcFF3azY6uo5I7hgxinxOeSqwYNB8Hs0SqkUvbcbsQVo+TpSJ3
 XxV9dEMySqTmacEWveAy14eWhyM5bPZUXYuO1Zhqhr07ZhtHsHGviQ/SBt91ueteUCEv
 nAhQeGe1YSbfGV7hPLL8+gJBeBjeIdQpcRNHalPGL34w4gkkCGBFB3+OaYWSLQ9c6Y6h
 MCbbmhWpExeHIeNpXiLdJY4gTiOLq6M3yMHnKDpyja7CdN38SDUXLVISBUdwKWPEkpMK
 Owtw==
X-Gm-Message-State: AOAM531IC+HsBf3seV/7RJ1mRHvATB6coJb7rxHC5jnuM8f0INDBauJF
 zMgtXVdmYB0h9+uACp/s3/dNTWgZ88YdSQ==
X-Google-Smtp-Source: ABdhPJzWCMjCAqdrfXwSf3VXXUp0XGv/EYhREih/ZhBP/uaIaE9dQJIzBhQg8N9BzGGViWC/jhIzwQ==
X-Received: by 2002:a1c:8016:: with SMTP id b22mr3717021wmd.135.1608290833454; 
 Fri, 18 Dec 2020 03:27:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 94sm14004876wrq.22.2020.12.18.03.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:27:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2FF41FF8F;
 Fri, 18 Dec 2020 11:27:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/9] Revert "tests/tcg/multiarch/Makefile.target: Disable
 run-gdbstub-sha1 test"
Date: Fri, 18 Dec 2020 11:27:01 +0000
Message-Id: <20201218112707.28348-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201218112707.28348-1-alex.bennee@linaro.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We won't attempt to run the test now it's gated on a newer version of
gdb.

This reverts commit a930cadd83b4681a98ce72abf530a791ee2e42a6.
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 230eb9a95e..cb49cc9ccb 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -54,9 +54,7 @@ run-gdbstub-sha1: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
 	"basic gdbstub support")
 
-# Disable this for now -- it provokes a gdb internal-error on
-# Ubuntu gdb 8.1.1-0ubuntu1.
-# EXTRA_RUNS += run-gdbstub-sha1
+EXTRA_RUNS += run-gdbstub-sha1
 endif
 
 
-- 
2.20.1


