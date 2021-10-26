Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283FF43AFFA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:24:57 +0200 (CEST)
Received: from localhost ([::1]:33116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJdY-0002vT-9R
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbT-0000r5-EK
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbK-0007PN-Lz
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso831547wmc.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ngRXN6C0rFj50pv5HlX9iEwqM22NePpMgE0oGy9fjwo=;
 b=ynw7J+s/qjycEQ4hsT4/u55OlWBDoKM+fwuB38nj7JT6Ed7tK4XDbTZOayvKISXkHb
 hAmI7oc9hu6dKBJId1aH8X4wUZru9X9rt7nAXi+H0/VmMjOm0obOMWIp2DWv620HWbPz
 aDiNCRTtssJJv+GfdH6Whcohzw6om/JnfDMTg52zZNn38boc8YyQLeGCgmsk7XXrXGbn
 FgTrz7hMYJ98b2B3zjF1tGPAlFY8Yr7vgw9GH5PNy75dANNCj0M1HfaEYCa3L6fAiArC
 L+9de58HXUVWA8jF6uHaNBTmZ2JXoYirndvDorG3JgK4UkWEXanmfw2BlCpZuEXma0si
 RMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ngRXN6C0rFj50pv5HlX9iEwqM22NePpMgE0oGy9fjwo=;
 b=dYnHRC0OeUB+LluAzB42PBxNwjipIEBLSHXXV21T0Jqptlkwj16oS7L1qKkOW6hWqB
 He6aaLhWTDbJf2gPnbMZW/u6UiMueD370iIAM8j6dvhjf7GVydrnQgtBuEBVfps17i+n
 RlPkA6J6iqGGiZAv2IDbbEqrazMZHmw7jAqDUWTtdAMbwwmfk4g9Mgvv9RJFq8jRrWcG
 4RvwNhTlFWpn/jnvepriIGVCJHV5aPunoK6lufAfQXlQtYy4qAC8wL8imjzh9q2R3Tlh
 Ps9grrQlIpPuSb9lJJ+xvqPZgJ8+E+ouOCeJe6XH6CVg7MUWDJZFd8wD3DvE21+dBidC
 lF3A==
X-Gm-Message-State: AOAM532qT3U8rXTy5qnrFOIFfibHWyQLZjVznzHuEUxSkAgpPpvCKZuP
 97xuVqH0iFGAgsLYervriDx+LQ==
X-Google-Smtp-Source: ABdhPJyMWvkzEFkEhZ1PxSm6A0dHqIcxl0uU2dwWBdluVBZqGL3dZIJbeMqck2TmqYkh1b5fRiEp5w==
X-Received: by 2002:a05:600c:209:: with SMTP id 9mr955040wmi.143.1635243756742; 
 Tue, 26 Oct 2021 03:22:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm9363051wrb.73.2021.10.26.03.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2F231FF98;
 Tue, 26 Oct 2021 11:22:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/28] tests/docker: Use apt build-dep in debian10
Date: Tue, 26 Oct 2021 11:22:07 +0100
Message-Id: <20211026102234.3961636-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Replace the complex apt-get subshell with apt build-dep.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-2-richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/debian10.docker | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index b414af1b9f..d3bbb90c64 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -14,7 +14,8 @@ RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.lis
 
 # Install common build utilities
 RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive \
+    apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
         bc \
@@ -33,5 +34,7 @@ RUN apt update && \
         psmisc \
         python3 \
         python3-sphinx \
-        python3-sphinx-rtd-theme \
-        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
+        python3-sphinx-rtd-theme
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt build-dep -yy qemu
-- 
2.30.2


