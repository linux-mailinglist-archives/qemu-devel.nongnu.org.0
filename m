Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6543BD94F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:01:33 +0200 (CEST)
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mZo-0007aE-IS
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mX0-0004ez-CS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:38 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mWt-000237-FB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:58:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i8so13547589wrp.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6XYeRZ0RRlPFd/72iPoC9h0a9yGfi2XY4pmA13N9sM=;
 b=CbXCJ8YaRX3KP6VPziblomeo/5M4vdKJnHQcMifN9E/vdwt7f2sFyCi95J9ezyoTxp
 7C3aie32E6eAcevr2n2HQWkxbuivXWyjmXaiWC2jvHW/wsxq/pyt4gk3W3ntpRpot4GI
 ea3ofLjSosMuUBF6B1NkKltw+HkgntAfWDBFTr3/jdku3TdacSKhn9PAjdyjxSI87urS
 VvDQlj8JxW55+kdoagG4BtehDKMKn+EnHEdjaxAaAcjhoAHW5dL1ax2YPmew6RjqXUvG
 pikVRLwvorjqTCcXrhhS7gyToQovVrenvc/gLFG3Od3LyAKGFB0mFivp4cA3GrsPwl09
 agTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6XYeRZ0RRlPFd/72iPoC9h0a9yGfi2XY4pmA13N9sM=;
 b=tHCh6WhxjZ4Sq8+9oHDDxfAQGFCm1sUQaEIewsOAkfBmjMn21yOULNw8dseCtTQWH5
 Uulc0GofVp7JH/oxCByypEzmJJzLBM/vp6uC3lA0q0wg1X9tmTRb/2InvKTy6OrEBAhI
 HEqQbqBj0EA8KH8HWNwAZ5FyzLxCpLV5bowjH3q1P3T2ET1zicrHJJJJzT8EiPLFhwa6
 cZBwNwpLWjyQu4ygmBaQ5IeppHXn8KH/c8SKAGoSH9LhqSPEbhEKK3ubGn8ELV/7gYHP
 m/WZu6fy2AfDj6fovh46XUh84EU6N34oXJoU77F7bYXsdM8RaDlFzbE5XJvSsLCCRQ5r
 wUUA==
X-Gm-Message-State: AOAM530jNHICR++7JVU0OjQUMAcnzhBT9IwleYPuUz+RHrLnd/knhGfZ
 wA86X1N9EG9PBcmGDbaxEaMahg==
X-Google-Smtp-Source: ABdhPJy4VEaRNKXTBt2ilSWrVEWTjfWY3vh/yBqVRrfi9wheR9tAFFdAvqn9lOpogEDAxR4EqTcq0A==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr19996266wrt.153.1625583505222; 
 Tue, 06 Jul 2021 07:58:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c1sm16964984wrp.94.2021.07.06.07.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 07:58:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67E761FF92;
 Tue,  6 Jul 2021 15:58:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/39] build: validate that system capstone works before
 using it
Date: Tue,  6 Jul 2021 15:57:44 +0100
Message-Id: <20210706145817.24109-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
 f4bug@amsat.org, Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Some versions of capstone have shipped a broken pkg-config file which
puts the -I path without the trailing '/capstone' suffix. This breaks
the ability to "#include <capstone.h>". Upstream and most distros have
fixed this, but a few stragglers remain, notably FreeBSD.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210625172211.451010-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meson.build b/meson.build
index 7e12de01be..2748721d71 100644
--- a/meson.build
+++ b/meson.build
@@ -1641,6 +1641,19 @@ if capstone_opt in ['enabled', 'auto', 'system']
                         kwargs: static_kwargs, method: 'pkg-config',
                         required: capstone_opt == 'system' or
                                   capstone_opt == 'enabled' and not have_internal)
+
+  # Some versions of capstone have broken pkg-config file
+  # that reports a wrong -I path, causing the #include to
+  # fail later. If the system has such a broken version
+  # do not use it.
+  if capstone.found() and not cc.compiles('#include <capstone.h>',
+                                          dependencies: [capstone])
+    capstone = not_found
+    if capstone_opt == 'system'
+      error('system capstone requested, it it does not appear to work')
+    endif
+  endif
+
   if capstone.found()
     capstone_opt = 'system'
   elif have_internal
-- 
2.20.1


