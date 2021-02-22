Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236623213FC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:20:17 +0100 (CET)
Received: from localhost ([::1]:48446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8K7-00043u-5I
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8FA-00080v-9g
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:08 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F8-0005It-FH
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:08 -0500
Received: by mail-wm1-x32f.google.com with SMTP id a132so13011981wmc.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4WDCDJCZFc7Rv2pOdA5J+1cdyXSasBpQj/RQiguMQU=;
 b=B8n/eIhqzNGvjsuusv+Kl1oJ28riz34WUdW464T1zxF84WCpLJ2R1tvwlBYyZG+qxT
 SPu10F43PmplVygKK5UR0m8aqw9nm8K4Gx2CFL+ugBou59vjLMeUSFpQHbPZAdQrJejN
 6u/OuBxyY5fnYBNJchfs33BAB/qj9agaep8nCJTj3eBFNd8AYvhCA95c0ZZUeGSMm3Bh
 VyFcbEkvf3vlq/NgVgsCZg7751Yyr82E2o+d0UNJ06ZbgYbJuooOu571oHEde3kg629a
 0c/pcN07txAvVKRrT6zKGyztaY1rufSjvw5hAPK6nPF0T6R0sJVxyVDned6tLUJFA/xb
 QtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4WDCDJCZFc7Rv2pOdA5J+1cdyXSasBpQj/RQiguMQU=;
 b=OKSBel4K8O5L0IHJAxSA8cvi0c2AdIPPCCHs7SGllDEyYCQHhQnOrFnuqWYQwVBuFl
 sMNLHj3oBqTbUR8JGWG9fooa8VkS6yV5IURFh3S9blbek6nfyc9Df8lM9yhxojFqxCAk
 ElRYA32cAUFYBxNxZYDxYO4KkWfctsWZHwn6jM5UtPmn3ti50t6nwlXRQ7BXP0RUPxjF
 LcE4rJ16FYAGHGzza54Kt9Kd7YFbsfyRugYzTRQxDXgiZggMznTqi189tRA8aWMPZVA7
 TPef/mjU+F12SjaHdQvgeG1MfsHdamDLNqEXy9XoI2714icHh9sUX21Q93GFFZ0CJ0l/
 wg/Q==
X-Gm-Message-State: AOAM5336ghzcmoJKVc7VUaNVKRAHan07s0EGfXiUE2WL6M7tqn0US5oE
 A8pUreyy4Iq2C827hpCNJzMcCg==
X-Google-Smtp-Source: ABdhPJziJr5NuQ+GnhYoZJ38ROVLsd0yJWA0cpkZI6xaf/upIki7IDF5KvPlsmb3TPbvV2vI3H3eJw==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr18973548wmd.26.1613988905013; 
 Mon, 22 Feb 2021 02:15:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h17sm20101496wrw.74.2021.02.22.02.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:15:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 578421FF92;
 Mon, 22 Feb 2021 10:14:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 6/6] docs/devel: add forward reference to check-tcg
Date: Mon, 22 Feb 2021 10:14:55 +0000
Message-Id: <20210222101455.12640-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222101455.12640-1-alex.bennee@linaro.org>
References: <20210222101455.12640-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For completeness reference the check-tcg tests in the container
preamble text.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
---
 docs/devel/testing.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e43c992f21..3124ee2470 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -289,6 +289,9 @@ an alternative container runtime. Although the many of the target
 names and scripts are prefixed with "docker" the system will
 automatically run on whichever is configured.
 
+The container images are also used to augment the generation of tests
+for testing TCG. See :ref:`checktcg-ref` for more details.
+
 Docker Prerequisites
 --------------------
 
@@ -1011,6 +1014,8 @@ And remove any package you want with::
 If you've used ``make check-acceptance``, the Python virtual environment where
 Avocado is installed will be cleaned up as part of ``make check-clean``.
 
+.. _checktcg-ref:
+
 Testing with "make check-tcg"
 =============================
 
-- 
2.20.1


