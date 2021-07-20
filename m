Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D8F3D05D6
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:49:15 +0200 (CEST)
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zUA-0004vI-M2
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zPV-0004tQ-VM
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:44:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zPT-00087q-Ut
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:44:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id g12so309963wme.2
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k2569d8O27zbpUpRofMVpSjervW0zDNJ4dbEmMRTg/0=;
 b=YEBrYIy4nDuvmPFqmECtHpB908ZD7FVQQFieh87VLYj3oP16ZiBQY3VulrbqbWPgX+
 LWQLT6d3CY+ECYiYhdPjrH7Ejj7BJlVKP1Z+8M07A3cuSdfijk7XPGoCLzvSZwibLQcu
 7ggNsjpnUnakPXemE7qwmxXY/JnrSjAkBO6wEeWZvgl9er64DwEAZt5ZUqRKfcA4uUC2
 k5w2J58tE0ISUXrZaEaPDOCfvIr21g6rqJoNKFqu16o6Ubso5y+ZHApyBo/qRex89Un5
 jrIwm9mddSNAjfWvgPx8aDdNq5ZnDz/Xedr9lGbCsrORFu+c6h6rnDh0X90A+3jYGpPJ
 w7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k2569d8O27zbpUpRofMVpSjervW0zDNJ4dbEmMRTg/0=;
 b=kdK37HpFe5MHijiDwmqeue/zGhSAX5WuyUM0LtgPvVRr2Yhn36gmRV51z7UXYF3vG4
 OySy0JKoIBqz91pzVwd6vzSBQJ6ymt7Q5JyCGv2IUXw71a1++1z9ckY2C4hg5i4ySshk
 f3QMvivOy21OSYJROpahG37y3M/0u0O/VcGnvMRQwLMDz8a1pCvnkuDmcdVJ8cxVx5RO
 Q+/0IgIavLD8rXdzWwzFZUZpveKdLtEyhLn0fUf6MtfpnPlWBCwhbNAZ7MEbyWSvPaGd
 Zco4hNJC5KjUgcDeY66a9NjozNCStQJykUVAys76WeXrzhVC2+UCz8dIIacOt9ofLGm0
 MGVg==
X-Gm-Message-State: AOAM533r8Gl0vaHjUuXf0ZP+IIip/p+CkjMqmxHwAMrUvrul9EeSCe4j
 5XZBh48+AIF0iLU6J/7WAJx0Jg==
X-Google-Smtp-Source: ABdhPJw11eI3EnC9IVXVTxHBnOETwEb9EBtr9a+3ge+k3051FUMyM9KqDHJ7xz/FDrc/OAd8A2mtjg==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr25691715wmq.106.1626824662602; 
 Tue, 20 Jul 2021 16:44:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f2sm25089506wrq.69.2021.07.20.16.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:44:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 778331FFB3;
 Wed, 21 Jul 2021 00:27:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 28/29] gitlab-ci: Remove the second superfluous macos task
Date: Wed, 21 Jul 2021 00:27:02 +0100
Message-Id: <20210720232703.10650-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
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

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210719073051.1559348-1-thuth@redhat.com>
[AJB: fix up commit formatting which trips up b4]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus.yml | 15 ---------------
 1 file changed, 15 deletions(-)

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
2.32.0.264.g75ae10bc75


