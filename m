Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEC5A93F3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 22:43:29 +0200 (CEST)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5c7j-0003QY-Rn
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 16:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49809)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i5bvF-0008At-K3
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i5bv9-0006eR-K6
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:30:30 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37949)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i5bv8-0006YI-0d
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:30:27 -0400
Received: by mail-wm1-x344.google.com with SMTP id o184so210656wme.3
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOLsUCpRO5RppiFlrrFGOubpGTLW833HZzVzpexdmsQ=;
 b=v2W17WoNPTi+qmiMJ60l+xCHJqCLsc1QAlJaEoKY0vmhpUdSzXYKD61iXiKc7rsUTM
 VnoN4RWnQeN3Gou6jSCssF7zLzddzcq78TVHeNcaRBFcPeRVsXqa5GwgmiYCWSK7JOq7
 7xyiJkHkeFu6esrxA3u5rq3WMfGgRAwvRUhAmBXAX7bQsH+1qU4i6mPoYMwv0LpXRsz+
 cm5vFZ60Y3CU0mnife88uVJoB6fIhLwCZsB1M3PEtQQ4tyXMJWoDei+hcc/hUv+g0v3x
 L2YlcXeZt9tZvkS0s4Qrs6Zjzz2ebVM79kGHtwTbeGcNd8XLv2wxeHw7M//CNihTBvVm
 sCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOLsUCpRO5RppiFlrrFGOubpGTLW833HZzVzpexdmsQ=;
 b=OVUlcEKA9vVfPmh0lVxBSG9Ka3dEyo/rxClts0ZK0rlm/v+2WKfSuj31245i+keq3p
 M2A+qUVwvDxskvpokzhnw60boRukScV0o0J5FIi3VaXxj0hFz7zDZTicoW5os6VzFaIX
 RwdzE7GYoMtQ0GDxNq2Y2bP9uoO4iFN73oYVE3OHBSdTJi3bp4ateltE3x+qtUZiv2AV
 qcZu/jt0yiYEv/NepsYkjhEU7QuoeIs8GoGfiu4qlL7ragmhJizoLnbGAg8kbkCuXc4m
 ICGSeXQmZRAwUbJkC84zPi+M18q7lFisEGS6TMbkYdJwc/o+zMZykhk4ZFZEK2A2DQ0q
 bSJA==
X-Gm-Message-State: APjAAAXlpqSeLhzXWF4PAlgk1d8ZwyWZz7mco7+0GpWTsBXQEzS1jz6x
 +qkam8wjGQE1QHMnJoBTrqy86Q==
X-Google-Smtp-Source: APXvYqwVVqsnQAx+wRl3nAfaFkk4Ob7wfkS9mUhILwUZP0LY3vhD1P7F6YVBbR7dV1Ao5lL9fe4o3w==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr101794wmj.74.1567629022077;
 Wed, 04 Sep 2019 13:30:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q15sm4891234wrg.65.2019.09.04.13.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:30:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D8841FF96;
 Wed,  4 Sep 2019 21:30:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 21:29:38 +0100
Message-Id: <20190904203013.9028-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904203013.9028-1-alex.bennee@linaro.org>
References: <20190904203013.9028-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH v1 07/42] tests/tcg: add .gitignore for in
 source builds
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This hides the new build artefacts from the re-organised TCG tests when
you are doing an in-source build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/.gitignore | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 tests/tcg/.gitignore

diff --git a/tests/tcg/.gitignore b/tests/tcg/.gitignore
new file mode 100644
index 00000000000..84d7541b286
--- /dev/null
+++ b/tests/tcg/.gitignore
@@ -0,0 +1,5 @@
+# These are build artefacts which only appear when you are doing
+# builds directly in the source tree.
+config-*.mak
+*-softmmu/
+*-linux-user/
-- 
2.20.1


