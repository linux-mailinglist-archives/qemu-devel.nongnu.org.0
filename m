Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94362F677A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:27:01 +0100 (CET)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06Oi-0006f8-Ly
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wd-00047V-0E
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:59 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wX-000514-TS
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:58 -0500
Received: by mail-wm1-x32b.google.com with SMTP id y187so5326165wmd.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KW8lIzvnipfYX5ZFtuwParPNNorKyO1c/13pRWWU8zs=;
 b=fKvQnL7ckkAZR8b92pJr0wt96eMNgV0/f55KE3Hb3CYktmJPVbD1nPrGobYeDB5brW
 b+s3Zht1Tw9yUmkB3LUX2ijkW+ay7Uxo9/+3+tc9AZKPf6HIjTgPrRDZwvVB0+4J5qoZ
 oebIfnrs4vy+qHNUa33kEKGMP/RipSz0SOtPIWsPARComuzGXwihmB9Et7lpb/2xykwA
 5shLk7YlksKzFpZ01VZfPGFMRO8VCde2tsc/8FceO+06jnuSYdO1LiVQRx8P/wlrKaAq
 Bx3rm9aJHFJHSLY89A0J4yBy1nvh8dVFURQH3stSCcqX4kRUPkDHIAjbR58ozupxooV8
 JwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KW8lIzvnipfYX5ZFtuwParPNNorKyO1c/13pRWWU8zs=;
 b=eIFtGLd417xqONkfeKs8mjAY3JcJSBgt1g61k3+yIL9wEOqbspHMaaw5Xo3WmewuRH
 7Uey09EWNY/bbgtKwShJ5kzVw3ley3fvOoKNm7OCDyvB4UeNm35P4oUet/VL4ZgsVhNg
 FL6cdbU7yO2JTXVM+GlRc4U59dVMeiJfk9/0xSnoQXapmmfGzc1WT7Gr/xoXB5Q8tvgw
 W6lp49t6Fp/XdiEX6SpRRppjJF/WXPh+4S+z5andSE+EfZKJbxqJOy0RUrUpwOTJYk7K
 85kTfeXBCvxqpvOZJe43g0Yyt6nokYJ94W9Xe3Vv+zjyPdu0asAyJFniFh3XfhFIncCh
 jhOA==
X-Gm-Message-State: AOAM530ZuizvJ0GEnIkWuOsLSCPfALUBGGb7N4bmcj9Y8cpVisiFSmgr
 icyt1yXyBpf2JtqzT18Q4gmgtEqSq6cpCw==
X-Google-Smtp-Source: ABdhPJygrptExVo7d1qnOwrA25f7Yl8vhNukXZ2zX+jqbjBprCLUpnS1UECqudzoAGS8/M1WrvK9eQ==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr4905522wml.155.1610643472554; 
 Thu, 14 Jan 2021 08:57:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b132sm9862268wmh.21.2021.01.14.08.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18F161FF9A;
 Thu, 14 Jan 2021 16:57:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] gitlab: migrate the minimal tools and unit tests
 from Travis
Date: Thu, 14 Jan 2021 16:57:29 +0000
Message-Id: <20210114165730.31607-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These tests are good at shaking out missing stubs which otherwise work
if we have built targets. Rather than create a new job just add the
checks to the existing tools-and-docs build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 4 +++-
 .travis.yml    | 9 ---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bd60f3e741..a686bc40cf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -124,11 +124,13 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
+# No targets are built here, just tools and docs. This also feeds into
+# the eventual documentation deployment steps later
 build-tools-and-docs-debian:
   <<: *native_build_job_definition
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: ctags TAGS cscope
+    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
   artifacts:
     expire_in: 2 days
diff --git a/.travis.yml b/.travis.yml
index 3b574a5968..5f1dea873e 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -119,15 +119,6 @@ after_script:
 
 jobs:
   include:
-    # Just build tools and run minimal unit and softfloat checks
-    - name: "GCC check-unit and check-softfloat"
-      env:
-        - BASE_CONFIG="--enable-tools"
-        - CONFIG="--disable-user --disable-system"
-        - TEST_CMD="make check-unit check-softfloat -j${JOBS}"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-
-
     # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
     - name: "GCC debug (main-softmmu)"
       env:
-- 
2.20.1


