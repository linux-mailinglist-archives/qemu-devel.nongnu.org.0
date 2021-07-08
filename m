Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC433C19D9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:33:27 +0200 (CEST)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zm2-0005GZ-Ch
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPI-0003Ra-Ih
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZPF-0004nB-DK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:09:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i8so8804230wrp.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+XD6CUR2a54j4OIpwStnjx10263sXMuG0XSNJjuriUo=;
 b=yeuAdAeZadIxxWLxr+KqbD8+LNyF5PoQ6GTr1B7/Fq6s9QLnsdXzM+wgVvHjJQIHlA
 jmPpBsSFcrUVhwHm2YkjW8wVGl9CVqJgaZDyOWUtW/3FexpicFbVRePTmXVgQpBFb9W2
 U3A/oZpYvS/NoLWkhplQSEBUlNjnQDsSJHOUiV+qq1TU1f2SC77YZZ8yjAJlDtPViTkD
 j+lWkyPbdlUbalO4kzbf2u3Nn7jAbWQDyj1Mjr+hLyNFE6TIsjk6guiv7K7FXodZK5Oe
 UirYa4A3AatMbRQnkVpNUgtgFSZK2I7jKw60Fsl+mAAdEQ+sWM1AdMZK5+gh/FHATjaS
 qy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+XD6CUR2a54j4OIpwStnjx10263sXMuG0XSNJjuriUo=;
 b=k1I5sbHnJj6K/qOsFS9PiXFoVz5ChNkLeA/N0SPSOwszoIgwSGU/DwBaOkoNYY5lQd
 ZN4PNcrxrffY+8V+jN0WkWoJ83bk83FrUhMWv8eE3emeOuNz+46GTA0KcuGE1jPD1Hg8
 8djl5WcsVp2oOWMjl3QYUplOHud46PVKP45VU0uWyPHUtNd11fXCi7PrcnoC9sgh/sii
 EY1f3Gh+grFdRLX00L0DJhk8pLS3PPELoH2n47x3Cq61XU1GS1v5da6yH998qsn1mAhf
 L7Ab89WgOHA55KtYwQcXRLhqf7y8mARuR5PzXLrRA6hO47iCtGMCVHim3khqNx6ZogDt
 wM+g==
X-Gm-Message-State: AOAM5311pD8CEGPpTmwrJnOOyFxur8kB7ObDYRad0e4iM28tTPrKNvts
 lnN0zxxRJo1p+JD/R0wzKuSDvg==
X-Google-Smtp-Source: ABdhPJzro76IOa8NMdXcehrfu93HWBh5Fn12NLKSeCSr+ptAQZS+kkjxHDyD80nAv5szFORb8NpDGw==
X-Received: by 2002:a05:6000:2a8:: with SMTP id
 l8mr28076887wry.417.1625771391798; 
 Thu, 08 Jul 2021 12:09:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z3sm3554832wrv.45.2021.07.08.12.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:09:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6ADA81FF91;
 Thu,  8 Jul 2021 20:09:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/39] tests/tcg: also disable the signals test for plugins
Date: Thu,  8 Jul 2021 20:09:07 +0100
Message-Id: <20210708190941.16980-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be more important when plugins is enabled by default.

Fixes: eba61056e4 ("tests/tcg: generalise the disabling of the signals test")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 2 ++
 1 file changed, 2 insertions(+)

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


