Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987683213F6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:17:44 +0100 (CET)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8Hf-0001JI-Jb
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F8-0007xW-52
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:06 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F6-0005ID-DK
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:05 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c7so1669240wru.8
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZFusUpUE78KLOYcTH3N+BBSwwTvd1bK6WCbPQhEmJo=;
 b=d3EbQ6Uq20yorzzDIp28h/72I2c6AzI8pm66HAAr+/qlwILvv1FfpxH9OaSqusEt1s
 tbYO8XQiGEZGvzaMn9JLidqzVkMcSdVopP0F1GS8Dap8b+dWmL7N+Dyw0VifPgi4N63n
 CG/yMANdLDMbGoJy8IGBFbFRsvZ6Lbnm3Y0EkjIvna2ny1ddBQXdZaes4/jAFIDg1wwG
 ExbE4R6Ka62L4WbGZPqEGSRELC5CaPbrVvLMGHphcJRbaGCpG/GSSVuTEuZYV+kQMV8g
 kqHCMTRLgV0Rl6LlKTBFOHyXWJU8WJOL874LJS5YWOlZHoGKbNhu9gY/f70/t7kkV5kP
 4gXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZFusUpUE78KLOYcTH3N+BBSwwTvd1bK6WCbPQhEmJo=;
 b=dCzFe5OTjxcIPN79XShQ+IoOfebKmB0ZSMBzvIyO3ivP1muqTW1VDrzXS8uktQYdpo
 vdf5QV9C9FzEdhLbmMzL9gBCcOa7UD053HO8F98Zc13ydDBJqVSD6WTqgCF0ZzGnDj+E
 XEIBXW7GiVQmrx03gPSvakDmHGYOVycK2WwD6nck9QvCt2drCzrUuvGi7wQUVXXPKD6D
 tdObrAy7C0ZKguMk4jG+rZYjIHUV89izW2Wwan0BRvRXdZ33pMlLPSQkwH6CX5OssnAS
 pgKWbld9GMQS5Dt7+kVZv0P7ZCqW1ezJFAjLu6pd8bDwXmasC0chPzUYOsO7jaX+uLPk
 VeWA==
X-Gm-Message-State: AOAM533IRJZuszLlVBqwGkOFgFl5+mMtzDiUdrQZR4/A/affo1Mws/Jt
 SniUYVqxJZzCwdt1RVaM42Wbxg==
X-Google-Smtp-Source: ABdhPJzMnCL5U/dwm/N3dlUS7TgIktnbgBL391Y7AVVYP7u9h9OiqfYODxY6ujyRC/Wol4Fg6XO1UA==
X-Received: by 2002:adf:dd41:: with SMTP id u1mr10075756wrm.190.1613988902946; 
 Mon, 22 Feb 2021 02:15:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm16967453wru.71.2021.02.22.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:15:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2CDA81FF90;
 Mon, 22 Feb 2021 10:14:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] docs/devel: expand on use of containers to build tests
Date: Mon, 22 Feb 2021 10:14:53 +0000
Message-Id: <20210222101455.12640-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222101455.12640-1-alex.bennee@linaro.org>
References: <20210222101455.12640-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Expand on the usage of containers for building tests and why we have
some that are not used to build QEMU itself.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
---
 docs/devel/testing.rst | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 00ce16de48..488d4e3537 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -272,10 +272,10 @@ Note that the following group names have a special meaning:
 
 - disabled: Tests in this group are disabled and ignored by check.
 
-.. _docker-ref:
+.. _container-ref:
 
-Docker based tests
-==================
+Container based tests
+=====================
 
 Introduction
 ------------
@@ -1001,10 +1001,17 @@ for the architecture in question, for example::
 There is also a ``--cross-cc-flags-ARCH`` flag in case additional
 compiler flags are needed to build for a given target.
 
-If you have the ability to run containers as the user you can also
-take advantage of the build systems "Docker" support. It will then use
-containers to build any test case for an enabled guest where there is
-no system compiler available. See :ref:`docker-ref` for details.
+If you have the ability to run containers as the user the build system
+will automatically use them where no system compiler is available. For
+architectures where we also support building QEMU we will generally
+use the same container to build tests. However there are a number of
+additional containers defined that have a minimal cross-build
+environment that is only suitable for building test cases. Sometimes
+we may use a bleeding edge distribution for compiler features needed
+for test cases that aren't yet in the LTS distros we support for QEMU
+itself.
+
+See :ref:`container-ref` for more details.
 
 Running subset of tests
 -----------------------
-- 
2.20.1


