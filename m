Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB42C4AF50E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:21:37 +0100 (CET)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHomm-0003Za-KF
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu9-0000dv-7W
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:09 -0500
Received: from [2a00:1450:4864:20::434] (port=43668
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu4-0001N7-Cd
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id i14so4307378wrc.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lukOH5svd/Hz95RpuYVLFtn5Xg6Jr0xu+vp1sdClrfw=;
 b=VJPDQ7xNckzeDBnCtxEHJlyqlyYYMz2q3dTEhViRjAcde0AKaqLKqX2Zg46kJbjOlq
 oflkNJ2AEIgyCIFOTHd7TXH83LZHHY3YNhN7zTfRynJbd/io1CfgsD6aJZyNprEMDzOi
 bMqxQP4CTItOv1GwlzUa063D3UYStQxkgi2E2Lhuv1mCh6IB5msqkwzhvW5dj5ERAZvG
 1y12udDlxzYqkXhO1qZHt6vRsBLH6hmGyTrD0W4B+Fe5GldbaTx3G9CqtcUeP84ELYrS
 edOLbhny+iBJl/rTGNdrnku6Wu9vd+RcC+I+lZKDG/HZiVcITL2mE74tFwCYwYfeWzKL
 G1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lukOH5svd/Hz95RpuYVLFtn5Xg6Jr0xu+vp1sdClrfw=;
 b=QZS/tf0Pee8Nm/9GTtWDHsZTuCAwQytqJbUQIeHhDOnEt+ztNCY823FlLkVSwfQBXp
 qLHG6+taTpWAKKguV/w06VKyIS/EqqSYzhMSuNeRiWP6rPLdefmbqX3eIUvjd5nIVZvK
 5yme896V+DBaUXXu6RdKzRE19+FqNuyS3swu515389jOdy+ByO+0QwfDaW4tWnJDZp65
 fMUUBO9IjIzKnw1x+wHQUZdYi3KlBFHdfbsS9qD4GBa4Qfhio+sV3bBy4UsrRw1o7VgA
 LjRY9CgvbsBy+t+VOte4AzSAny0giiMRILxPzpYQwohG2zcyVddd0/ClLWjLEjg1okR1
 c9FQ==
X-Gm-Message-State: AOAM533iMXZbq35VMjLjv1DyqiqhaF5tcW6veAr4wGNFWF1OHqAgWP1g
 8AIGtwrpNBPFntW8UfW8ld4juXdbejdy5g==
X-Google-Smtp-Source: ABdhPJwbHw4y/Sfj3GGilQaYaDpcoa9843DWsZjRfpb+einNEhy+vejJlJw48tb9HTDppGCiOJwuvQ==
X-Received: by 2002:a05:6000:2ad:: with SMTP id
 l13mr2299189wry.174.1644416703004; 
 Wed, 09 Feb 2022 06:25:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a22sm5062979wmq.45.2022.02.09.06.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADDCD1FFC8;
 Wed,  9 Feb 2022 14:15:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/28] tests/tcg/sh4: disable another unreliable test
Date: Wed,  9 Feb 2022 14:15:17 +0000
Message-Id: <20220209141529.3418384-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given the other failures it looks like general thread handling on sh4
is sketchy. It fails more often on CI than on my developer machine
though. See https://gitlab.com/qemu-project/qemu/-/issues/856 for more
details.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Laurent Vivier <laurent@vivier.eu>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220204204335.1689602-17-alex.bennee@linaro.org>

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 0e96aeff16..620ccc23c1 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -18,3 +18,7 @@ run-linux-test: linux-test
 	$(call skip-test, $<, "BROKEN")
 run-plugin-linux-test-with-%:
 	$(call skip-test, $<, "BROKEN")
+
+# This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
+run-plugin-threadcount-with-%:
+	$(call skip-test, $<, "BROKEN")
-- 
2.30.2


