Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F59323BA2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:55:31 +0100 (CET)
Received: from localhost ([::1]:44894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEslO-00048w-5W
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfm-00063i-7d
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:42 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfk-0002XH-Kj
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:42 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e10so1379443wro.12
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPNIwQ4zhm1AK5NXAwaoNz0ED39G8E1PPFGRzykjq6M=;
 b=wuzMHzrwBGydPTJkiOWYktfhgld6rLQOtsxLQH5aAuIosAC6vYJB//qwGY6YEyo5td
 V6+G8+t7x7BmqJRp3Cia+vMNs6YOmHgrrTxXt45BJQtkC99n5UHCSsh+b3plYjWhn/MF
 JYPOhOVX3lfu6u6ZQphRMCB1EOrmXtyAg+wvIYghBe0Ix95cDcTfgB/WqnOiIsOMeTgv
 6QiHMlPMHszNTUXrFi60mH69X3Wo3GfmbTSJ16W2TpRzj/CHPcRFmlDNC30Q7KKgUgtZ
 k0GvrkY4Tu3WkB9X2Y6mT4WWYSywBnoLAeTTgIGkGvLVu8U6Iy114PaXRS843LxqlaEa
 GZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPNIwQ4zhm1AK5NXAwaoNz0ED39G8E1PPFGRzykjq6M=;
 b=V9frVCJnEnwtkjUfmi+Bcw8Fi9h8M0CCI+l2kNJiCMZHdc00CZzIGvgu5r/k6yyfAn
 UlLqqMoUnfHLRz1G9UxkXJz6fE9QL18tT32ja1CDEv/PDBfGXHxWeJZPa4PUuHyCd9i/
 s+SSQxVXwswhCb3lJ+zluBqOrADh9NvQrA4O5xs51FO2tZlDPcJQYxyaBrHgwVGejZek
 uj2PTD/ivzfuaTZek/6HQdJkORIHDMVPW3ru5S/f/CYAq8550heDE9Z8c5kN8dwK8C1z
 XWdZVNF89KUyueErLwX3qGwfrMAjhixOhsJB3LklFnlou9JMRrottM3hUfqKbwMBc2JH
 2eew==
X-Gm-Message-State: AOAM532wAd2phL62IFAjLTkztTEyHd9ZzOTapBY/kaKFuKO9DtGHG2qI
 PJRBdnvpiGOHxPm8/PoSL4NCkA==
X-Google-Smtp-Source: ABdhPJyXNC8fQv7cPJRb4sNMRihqV3YTiK1FuvbICWJo4QnvZAjWPCfFG6RW6tWJd75PjDvXUm3ubQ==
X-Received: by 2002:a5d:4a88:: with SMTP id o8mr28325141wrq.155.1614167379287; 
 Wed, 24 Feb 2021 03:49:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a3sm2964038wrt.68.2021.02.24.03.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:49:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEF4C1FF90;
 Wed, 24 Feb 2021 11:49:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 4/7] docs/devel: expand on use of containers to build tests
Date: Wed, 24 Feb 2021 11:49:23 +0000
Message-Id: <20210224114926.6303-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224114926.6303-1-alex.bennee@linaro.org>
References: <20210224114926.6303-1-alex.bennee@linaro.org>
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expand on the usage of containers for building tests and why we have
some that are not used to build QEMU itself.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Message-Id: <20210222101455.12640-5-alex.bennee@linaro.org>

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


