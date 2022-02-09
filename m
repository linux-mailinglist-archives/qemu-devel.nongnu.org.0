Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2D4AF5DE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:57:47 +0100 (CET)
Received: from localhost ([::1]:38534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpLm-0003xH-GH
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:57:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu0-0000Tx-Gv
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:00 -0500
Received: from [2a00:1450:4864:20::329] (port=42835
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnty-0001LT-C7
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:00 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso1712545wme.1
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8UfyzWf3r+2lPwCD7ItMY00LnQ/yK7iXTXYLE56BSA=;
 b=Kv6WwqFqeEj0JenTJ9U5MY+rmmTxQmqGqDxOGFOx0H4htBUJWjGJvuov3dkHuWGmjC
 nB+gl5ikF5dRXgQi6PSY1SEyuQcSjFWtfpzUNqbUDJ49bMcsNL3nY1FiaM3N9vA2tIfY
 WmAmhwzOO2WvTUPFKduw7nEoNAXG2niVk3tC15GDS4FUge2bxsFgd+BhHmq03E7jEmO1
 47znQ1Jx/VWaszoNfLwsZMGBocqW+v06362BonHi5A5cFj2fEsyjIeM/c/ePbSUjR2pp
 dncNW4DnjL25WvdHgREBvQOQOoejy6AOguS8u4SrmZNaV72MWNmsk/Rbc0cA0Qp0utGT
 9YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8UfyzWf3r+2lPwCD7ItMY00LnQ/yK7iXTXYLE56BSA=;
 b=bvDp51Hnrd31mcu1x6iK7MSFyMXd3ARMf6bAmT49rlLSb6O3X3VGXraArfi9gL4+Z8
 yf5o4XpqzExzpeMVRpk0r1sDozOLCw1SCSB8eZ3F2YqgObijvHTN9+lKjY+WJYR9kBQG
 oZZzIv0t2GytFaqLCqhMgs2q8Eg+9gs1jjiAlLoSajMQKxD4yz1fVRDWqTnEYhwO+vTA
 xZpo5S7PegbM9c6B2EkFaYH5+4IS9S4cvI8HFTTpNCog7WyqbQiEviUC2Bb/2v4z5X12
 8+XWybMbHt+5aqqnx3sVG/9yKCKbQvTp7QWKYNV3ztB0mzFVW4dgRwNXMQiqmpaeHoJv
 eFRw==
X-Gm-Message-State: AOAM5339nmy7zok7Htc4c1xD2kHA6BLcftFyS9tlCfd5CSz0797aDyXL
 vU57m14cmONxlza2yFw7qT172w==
X-Google-Smtp-Source: ABdhPJxFjPMWIWXfaba7KizDR2xlwS/WVPOcAHsEKuopK4WocRZlMpjYNyZek5h8SXuZjaED1ewX0A==
X-Received: by 2002:a05:600c:600f:: with SMTP id
 az15mr2310588wmb.27.1644416697102; 
 Wed, 09 Feb 2022 06:24:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f13sm5583596wmq.29.2022.02.09.06.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:50 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9888D1FFC7;
 Wed,  9 Feb 2022 14:15:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/28] tests: Update CentOS 8 container to CentOS Stream 8
Date: Wed,  9 Feb 2022 14:15:16 +0000
Message-Id: <20220209141529.3418384-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Support for CentOS 8 has stopped at the end of 2021, so let's
switch to the Stream variant instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220201101911.97900-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220204204335.1689602-16-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 3abac7a8b1..3ede55d09b 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,10 +1,10 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool dockerfile --layers all centos-8 qemu
+#  $ lcitool dockerfile --layers all centos-stream-8 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-FROM docker.io/library/centos:8
+FROM quay.io/centos/centos:stream8
 
 RUN dnf update -y && \
     dnf install 'dnf-command(config-manager)' -y && \
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 25301f2ef0..4ab90a310a 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
 ]
 
 try:
-   generate_dockerfile("centos8", "centos-8")
+   generate_dockerfile("centos8", "centos-stream-8")
    generate_dockerfile("fedora", "fedora-35")
    generate_dockerfile("ubuntu1804", "ubuntu-1804",
                        trailer="".join(ubuntu1804_skipssh))
-- 
2.30.2


