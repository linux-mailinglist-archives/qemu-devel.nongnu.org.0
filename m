Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BD72EFB53
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 23:48:16 +0100 (CET)
Received: from localhost ([::1]:33978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0YJ-0000it-Tm
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 17:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TJ-0005aE-On
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:05 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0TI-0003Db-7o
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:43:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id d26so10364198wrb.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ISROrgxmTLwm8neDLFzzDk+uvwe3gX34uOZq7+aYuE=;
 b=vYgy1a1AUa5CWFcE7ojOgCO7EALxr4HAh0H0DNtSNXNXmDwBSCkd3si0vg+rQ2NUdp
 dImPwVp8XNeG90dwZ5t9mFt+VLoDc1Wf11V/TLMbmpoYgxcpSao+JMjxbKtUnMDVyjK6
 Bv7EhYxsy79FKNTRS5ZuFxJjVZpBxXUX4opNDANx8U6hsCjCNlOrK3/erWNXxEjRq4Pl
 sRqwnW56cptRX1PS2yb90TlKiGdDKVk8xyqJdemXlNk/1xwKlX0rQgmhecB+fQ+snpli
 xwgH2YvbXmi2ASQPHUGUflx6nadlB6+4KXBeaTejtAPKUeLLzd5pBYWaLa/qBzM2VpYP
 jVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ISROrgxmTLwm8neDLFzzDk+uvwe3gX34uOZq7+aYuE=;
 b=VMUauHnp9ghpuO5j3IhGFjeeYUZpLojajCJ5GTHY5ajUXY/m+5xuXYOpO2o9OIrw8q
 9ufGqJqsFMNM4UAXlJrGLP9z77efr2OmT+dyntOnBoKwg3kyu7ONoij7pQg1cR0mvB0W
 LlaaVVn3JHkwVJv26p/dbPwrAUWLcACsBnYuPffwV2YsgsONtKG+DUNgl7ozv9rDcoSW
 mgfsgxs2q/CGWV27+mGnHvmVrFTLO8N6Z8mCIatxKQjpPqXBdELsF2kjoZUnGcwVsTbt
 rQdlrPKvfg7kE003SLv4fNMiXbPwqFSmRu3n0gkb3hLDt8zglzVirzPvFbUwf05Fabf+
 9zqg==
X-Gm-Message-State: AOAM532PzfZUrQ+zU0IYu327ZZCoV4ajHdiQFBqWcXfnrDR99B6hmMCD
 rnbzcSGcjzwjWhtjqPtUMzNUDQ==
X-Google-Smtp-Source: ABdhPJxlEdNPTpzzJW2Wgc3NQGINllGFoZMj2niEAEumB1VPKUsQObvMXSfBAgjvDxEx2hNVR3K4eg==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr5717699wrq.19.1610145782828;
 Fri, 08 Jan 2021 14:43:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s205sm13563841wmf.46.2021.01.08.14.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:42:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C2E71FF8F;
 Fri,  8 Jan 2021 22:42:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 03/20] configure: gate our use of GDB to 8.3.1 or above
Date: Fri,  8 Jan 2021 22:42:39 +0000
Message-Id: <20210108224256.2321-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The support of socket based debugging which we need for linux-user
testing is only really stable as of 8.3.1 so lets gate our use of GDB
on having a relatively modern version.

For direct testing you can just point to a locally compiled version of
gdb via configure, e.g.:

  ../../configure --gdb=$HOME/src/binutils-gdb.git/builds/all/install/bin/gdb

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201214153012.12723-3-alex.bennee@linaro.org>
Message-Id: <20201218112707.28348-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 5860bdb77b..96cc7d9b9f 100755
--- a/configure
+++ b/configure
@@ -6239,8 +6239,11 @@ if test "$plugins" = "yes" ; then
     fi
 fi
 
-if test -n "$gdb_bin" ; then
-    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+if test -n "$gdb_bin"; then
+    gdb_version=$($gdb_bin --version | head -n 1)
+    if version_ge ${gdb_version##* } 8.3.1; then
+        echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    fi
 fi
 
 if test "$secret_keyring" = "yes" ; then
-- 
2.20.1


