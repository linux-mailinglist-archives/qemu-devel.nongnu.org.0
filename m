Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC677450725
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:35:51 +0100 (CET)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd5K-0003rt-UO
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmczB-0001Js-Eo
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:29 -0500
Received: from [2a00:1450:4864:20::435] (port=45611
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcz3-0004MJ-K5
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:29 -0500
Received: by mail-wr1-x435.google.com with SMTP id w29so31037081wra.12
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/jjIcKTHMUGABYMVYgopB5JbBaDExrshx7tpKvigeAQ=;
 b=UsYbhtAzH7LD89h4Ehvjpx3gHOeP6s7UyL/CjuUoNSzeF0+V3SHWskhXkSTl7tAKG/
 goTcniiB4nCIruXvAYHCoJFiVqZyj/rzeNcoU54D8Vt/R9PsT2Z4OdiPxveAnPJrUM/2
 ZGT7diweBT8AirPKevmEp2gkxaMTnDdrt5wpsHRxKUkBwLY4C9rV/oY7CDw4tiPOagr0
 XFcqRlB4xklDcoa6XMyp8NQnwEetLwqlz+rliMOJTQeH8f5MFAL5rYqqp02214ZNNJ7d
 Pfp8oGf1xSMPVrw7JGn8TkbjkN0Y7RjE8U2OBsK8EWqGzFBJPVNxHQ8HHVsZC/v/NUaU
 D0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jjIcKTHMUGABYMVYgopB5JbBaDExrshx7tpKvigeAQ=;
 b=PA7Y72ZNRq/KLfgtclUCUfcnfwcG3rlm44SRFgqcokm0hbutG+6OxCz184n4PPNXk2
 SxS7/3ZriPoEXkhJsTS8FcM0+0fQRxRmvE6oc0kcyk+PupfwEH0FP3/KpxMsfWh/SJpv
 X6HyyldPtO+NJy/N0JD2HVLNYirvz/wsKTuwNzGMpB5d5uODfdKYnZ4opPWAykqIeb8u
 Z5O8RlJVoiiQ/Az4183qB12/STdOrXUyBAoNExBEZW2Qbe/1G3ejWYc9a+ui8arSOEVG
 6Dr+ih4OZyRGh0AU6GjNBqZBB0WM7VD3wRH4utEYs+15SQAX5OZrQuiM+lqJVs/1XQvv
 zeeA==
X-Gm-Message-State: AOAM532NpxP9fIxxbwx71eN/PE04OuVmfwLuZ+gTe+QXaslxUBxLkNZk
 HPYz10UMrqV09+RcsDmpsO1UvA==
X-Google-Smtp-Source: ABdhPJyoDA6Ol1Kfxt+laCsYSfZLjFJrcjLfKLLAPZ5ikr41WLsuKJ0Uh1dhL5UXaTEblJFIVBDHCg==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr47754041wry.407.1636986559206; 
 Mon, 15 Nov 2021 06:29:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e7sm17610763wrg.31.2021.11.15.06.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:29:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20A871FF98;
 Mon, 15 Nov 2021 14:29:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/6] tests/docker: force NOUSER=1 for base images
Date: Mon, 15 Nov 2021 14:29:10 +0000
Message-Id: <20211115142915.3797652-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211115142915.3797652-1-alex.bennee@linaro.org>
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As base images are often used to build further images like toolchains
ensure we don't add the local user by accident. The local user should
only exist on local images and not anything that gets pushed up to the
public registry.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211103171339.721910-1-alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 7a63a3b7f7..f1a0c5db7a 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -150,6 +150,9 @@ docker-image-debian-sparc64-cross: docker-image-debian10
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
 
+# base images should not add a local user
+docker-image-debian10: NOUSER=1
+docker-image-debian11: NOUSER=1
 
 #
 # The build rule for hexagon-cross is special in so far for most of
-- 
2.30.2


