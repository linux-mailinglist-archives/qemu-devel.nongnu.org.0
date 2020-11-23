Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8EA2C0481
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:27:33 +0100 (CET)
Received: from localhost ([::1]:45456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khA0K-0001LG-TY
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yQ-0007wE-RP
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:34 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yO-0004hY-08
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:34 -0500
Received: by mail-wm1-x32a.google.com with SMTP id x13so7481754wmj.1
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pcPW5SyZ28a3ANzUZ9mcRABSoaLjoW2PPQzUbpyQ/Bg=;
 b=JOSWSiixoQGp1ta5bQxAhgcFtPVGpK59PTwLbtzY3OK9er75wU4pCIsiG8oXwzDnNP
 jBRg7jW1s3B0wo7I5I7u9kefoFM/gCn9oJYP0vrAIBSe2jS69MeTtHAwJe6UwoVa0lWc
 9lMh/n4Vu/xCbVoa0PPQHodsg1LF9pifeW6IdfgZoyHwV3fkF/zaP1ifHWyLSx7mOfOd
 VIIN+PyGQSkdqBBJMF2oMHwD9bB1dTP70h9yvZddhnXn2tugPEPK06QQN5VQrTk07BB8
 16ehz6JCNwu0Uomrk93VyqwjFjtGfGe7vXcDpmb5EKE66y8+JZRD/+ecKCAOPFssrORa
 o0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pcPW5SyZ28a3ANzUZ9mcRABSoaLjoW2PPQzUbpyQ/Bg=;
 b=G44UFR/n/F/X3JB5j2Zx/A7EAUBMBXKMjiyb4wuOr2BvguTWHRoIV++/eGIwq81oVM
 lgy2N1uzONxzwWBL7G6WTISELXxSdPsmkQLYMfnx2b4R2tz9XV/gFw7MPDC3bBF6EDv9
 HQjRDhozUMR0nhY11bmlv52r6seTZ65/B5O0V2mxq4U9cUzdivAvChBT647DRfnHNq86
 bmaccr54DTds7T9r8d+QLhAFVUz1jPG0bsWT68GuZ/hlK2OkV9gbEF8+JGHW2b7fyAtS
 +GKwTpAfCFVd3EgIVvplt5LymmNVZ48rKxldEwHqD3E0GDtYMgD/DVX89WWXpgVJGOyn
 05HQ==
X-Gm-Message-State: AOAM532pPUMYtYJwOWGR6mwyAfjNBf4lU1ttCJ1u8q0k83yTTzWp26e0
 FzXIioseNdtRNbOyvSjgvuXLaQ==
X-Google-Smtp-Source: ABdhPJzjKFTkEsdAON3KVS0h1066Qqe5Gqi0MKnivfi/3CMTNIhLGS5i/Dyy0ZgVmkY+IWpW76SxOg==
X-Received: by 2002:a1c:9901:: with SMTP id b1mr23084502wme.18.1606130729444; 
 Mon, 23 Nov 2020 03:25:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f4sm9889938wmb.47.2020.11.23.03.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:25:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 428651FF91;
 Mon, 23 Nov 2020 11:25:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 5/7] tests/docker: Install liblttng-ust-dev package in Ubuntu
 20.04 image
Date: Mon, 23 Nov 2020 11:25:16 +0000
Message-Id: <20201123112518.13425-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123112518.13425-1-alex.bennee@linaro.org>
References: <20201123112518.13425-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Install the liblttng-ust-dev package to be able to
build QEMU using the User-Space Tracer trace backend
(configure --enable-trace-backends=ust).

Suggested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201111121234.3246812-2-philmd@redhat.com>
Message-Id: <20201117173635.29101-6-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 355bbb3c63..ae889d8482 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -23,6 +23,7 @@ ENV PACKAGES flex bison \
     libiscsi-dev \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
+    liblttng-ust-dev \
     liblzo2-dev \
     libncurses5-dev \
     libncursesw5-dev \
-- 
2.20.1


