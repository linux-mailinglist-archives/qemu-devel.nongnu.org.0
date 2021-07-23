Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B93D3E7E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:22:10 +0200 (CEST)
Received: from localhost ([::1]:39754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ysD-0007wE-6y
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ygA-0005oK-4L
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:42 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg8-0008FH-E1
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id l4so3110320wrs.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgu5KUZOtGrz8LzEOf+t3n1mZYFwOO8fAUWdqWN1G9g=;
 b=jzJPjWvh5vwL7RduH36Zu6cY5V/OGGdSIK1K1Osd5YPh4g5zrFwKonlVHdZPvTdGbe
 URbvhtXLBdD4Y9e9DD5srbkC9cQR7iJknxUybx7Jm88LVXYS1/HnnSejCvVWPh93mwmk
 rDSlRsnrL7pHjT90z9EuqbGoqxJMf0ArrRBhCad/x/vLZ1+yixO4GRU6Kp5w14UucpYW
 f6x/Gj4YAD3gFqfv/NxlVZFLvcnRvw1tO8RMz6Tuuw1Q4FGuVXZhjRsY22yBmdjt6w4t
 hrZLtTxTkEYTtnOAMm+mQkj9M4IBhkFEd/X8h9gu2+2B/P8oh7VAGriD9h0EGLjXawle
 LLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgu5KUZOtGrz8LzEOf+t3n1mZYFwOO8fAUWdqWN1G9g=;
 b=D8woFpW++8KkvRlvkM+AYokLfipbfzzVd8aFpwQn6mWg6TXVITOQwed4OU1+aowuIX
 BKP8hQRelTLqp2LJnYn+89MyrrZffo22HTHR8AsgLmpDG29pPC7LRPAikUtjBA2iCDgg
 srff5p7XCYNcvF5SC67bvEUZoMgguAf4S+8YT0dZBB7WVbiB8L26UXdqw346LNHQLCgm
 h19kp4c5d9qn/tunHdC3fUspCslERiir8RCITgh52YUQcjZ4uu+nQFLNlL6oWYLqBxQ1
 sSgXGJWvOFXWnEpf1eDGwhBelbZa0La26TXu48YBPG67guuMixrnLppgTDCa6UPYQz0V
 M0IA==
X-Gm-Message-State: AOAM53300mlM3dct0WVzBX6GXj3ote8Ii3DOzuDWe9flpQm3IYKcrVkE
 W/OgIC1oSi8pYpJbY/aVnPkgSw==
X-Google-Smtp-Source: ABdhPJxdDUTpuqTsNYmqELxTrJAtCkUpdtzN0GqrhYq1RVb/qQCMVU8Vewse8FxP2NHowpoFXmqivw==
X-Received: by 2002:a05:6000:1841:: with SMTP id
 c1mr6164754wri.423.1627060179138; 
 Fri, 23 Jul 2021 10:09:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p2sm27516180wmg.6.2021.07.23.10.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A83581FFB4;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 27/28] gitlab-ci: Remove the second superfluous macos task
Date: Fri, 23 Jul 2021 18:03:53 +0100
Message-Id: <20210723170354.18975-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

While there might have been bigger differnces between the -base and
the -xcode images in the beginning, they almost vanished in the
current builds, e.g. when comparing the output of the "configure"
step after cleaning up the differences due to temporary path names,
I only get:

  $ diff -u /tmp/base.txt /tmp/xcode.txt
  --- /tmp/base.txt	2021-07-16 09:16:24.211427940 +0200
  +++ /tmp/xcode.txt	2021-07-16 09:16:43.029684274 +0200
  @@ -19,14 +19,14 @@
   Build type: native build
   Project name: qemu
   Project version: 6.0.50
  -C compiler for the host machine: cc (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.29)")
  +C compiler for the host machine: cc (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.28)")
   C linker for the host machine: cc ld64 609.8
   Host machine cpu family: x86_64
   Host machine cpu: x86_64
   Program sh found: YES (/bin/sh)
   Program python3 found: YES (/usr/local/opt/python@3.9/bin/python3.9)
   Program bzip2 found: YES (/usr/bin/bzip2)
  -C++ compiler for the host machine: c++ (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.29)")
  +C++ compiler for the host machine: c++ (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.28)")
   C++ linker for the host machine: c++ ld64 609.8
   Objective-C compiler for the host machine: clang (clang 12.0.0)
   Objective-C linker for the host machine: clang ld64 609.8

Since we're not using Xcode itself at all, it seems like it does not
make much sense anymore to waste compute cycles with two images here.
Thus let's delete the -xcode job now.

[AJB: fix up commit formatting which trips up b4]

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210719073051.1559348-1-thuth@redhat.com>
Message-Id: <20210720232703.10650-29-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 60b13ed83f..675db69622 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -85,18 +85,3 @@ x64-macos-11-base-build:
     PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
     PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
-
-x64-macos-11-xcode-build:
-  extends: .cirrus_build_job
-  variables:
-    NAME: macos-11
-    CIRRUS_VM_INSTANCE_TYPE: osx_instance
-    CIRRUS_VM_IMAGE_SELECTOR: image
-    CIRRUS_VM_IMAGE_NAME: big-sur-xcode
-    CIRRUS_VM_CPUS: 12
-    CIRRUS_VM_RAM: 24G
-    UPDATE_COMMAND: brew update
-    INSTALL_COMMAND: brew install
-    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
-    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
-    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
-- 
2.20.1


