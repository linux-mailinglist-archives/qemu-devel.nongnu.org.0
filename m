Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD04E3310BA
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:24:32 +0100 (CET)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGoB-0002vC-TM
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHw-0006LN-RO
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:12 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHu-00019K-D8
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id w11so11520130wrr.10
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8s+rghqoDmtXn+vNGYx+gVftGGy4eFdbii8sa4jsLZY=;
 b=JDikbxMe31Qs386NyhLVjDJP1O2ASmRPqTJr1Eo25jJA1aSYX5hNZgrkqIEtuFZQ8o
 GER0O6R2D6FYGFDD5JQ9Y8Xwn132jIAgudYG6TIchQBulqGZ6XohPihD1+sFvL8UCZqL
 wsBRCB+UZL1KkjFVFvuJUca8gTte58l0FMTocmR7KWT95FBdctukHW8H8e3KiMOYCCA9
 IC5hUWW1rBOhFQTlrFPTTYgHs6RRGTLv2PxwlL/A3pffPs67z3HS4SGSf2j6c3AIqNyK
 5CZB5O3evBOptQIJ01szDbLqBdylKokkkgWsejHH7x9Z1RstGE4RDUnuf5Pl+6czS2Od
 /m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8s+rghqoDmtXn+vNGYx+gVftGGy4eFdbii8sa4jsLZY=;
 b=RwnL2iFnCHMg3dw9Y02mgTWivIOJ6Rj/u9alwcNjs4NUR4FrKxEjWiFxB+rGz/xVmA
 YRW4HEvKpa94oM6/88krZ7Gb0YgjQ81XHy5wlJdoXGBYXBvw5ZwCalyQ1x0YEVYXsnx4
 D5i2053J5kANIvU7sn1DMIiq6P8T7s+P584g1YY9EE2NpEIkRGefijdXQH2oXtvqPQLu
 Y/LTXm7gav01aU/Yfv2tAk+5Xtmw5A0gHMubYm3KYbQH+c4waWQWbvF3mtV+aOfIkKRk
 uI0zIpOxsb1/u26H60awJVOS9tYH9grSqrnKHaZ3dqwVrfYaLn7+czGoW7tBqSOHPVWL
 XwAQ==
X-Gm-Message-State: AOAM530jAEtyQ2ts9EeIgbgi4GRgRtXVnoW9PUh8aHDu0M18XDXWyp7T
 YGBJAkLB+J/PqwWu2PC7oCWxhQ==
X-Google-Smtp-Source: ABdhPJwgXvE64nmwiFyPnDn2RCQsOprJd1LeOI3H0JKsprpR/EROi0Vw75LVNnoOVfiJpDqxlj57pA==
X-Received: by 2002:adf:ef4a:: with SMTP id c10mr22319349wrp.427.1615211468858; 
 Mon, 08 Mar 2021 05:51:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j11sm12300397wro.55.2021.03.08.05.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ED41C1FF8C;
 Mon,  8 Mar 2021 13:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/18] tests/docker: add a test-tcg for building then running
 check-tcg
Date: Mon,  8 Mar 2021 13:50:48 +0000
Message-Id: <20210308135104.24903-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is mostly useful for verifying containers will work on the CI
setup.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210305092328.31792-4-alex.bennee@linaro.org>

diff --git a/tests/docker/test-tcg b/tests/docker/test-tcg
new file mode 100755
index 0000000000..00993b73ba
--- /dev/null
+++ b/tests/docker/test-tcg
@@ -0,0 +1,22 @@
+#!/bin/bash -e
+#
+# Build and run the TCG tests
+#
+# Copyright (c) 2021 Linaro Ltd.
+#
+# Authors:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+. common.rc
+
+cd "$BUILD_DIR"
+
+# although we are not building QEMU itself we still need a configured
+# build for the unit tests to be built and run
+TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
+build_qemu
+check_qemu check-tcg
-- 
2.20.1


