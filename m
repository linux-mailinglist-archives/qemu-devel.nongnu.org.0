Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9953AC9A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:16:47 +0200 (CEST)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSth-0004XW-AQ
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr6-0001h7-91
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:04 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSr1-0006XT-QB
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:03 -0400
Received: by mail-ej1-x62f.google.com with SMTP id rq11so5429374ejc.4
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XyOIPduSP6mWZwGS3Z+Ma1uowcWemZ8L6d4bwTuU7ig=;
 b=Xsd7TfeVzHOuE+pILtMj2Yc06jMzg9xBHHBvlnxg9cteicMyWgGcRsphC01d+8rvIn
 ptMNhmpfBvvjz28CSXyTsBTM8KPVH9fM3Giwc+7vbxq/wQQ3LW07TJwuVRv/z6tKDQYl
 Y1CcYbi2WyGGoh6F9xez1DX+Xds7tYqym349sF/OFQlfGYLVcDvZx4jaTV8jN7SGU001
 zM3zOFypiN/hdr3QzK7w7CzNux9oO9Q5q9+ZQQYPJ/h1BHL6lR0HERIWKSH0zBcFn5Ii
 QeUrlGk1xysMoOS/tDyQ25NWn3lCKywVX74RxwgZ8mbPigposQcaKtpxKi4G6XnDQjai
 EFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XyOIPduSP6mWZwGS3Z+Ma1uowcWemZ8L6d4bwTuU7ig=;
 b=rxCt46fVlzqIfPptywjKFzwvr8yv9Z9vjxcV3//Hcgl144oKvJBQ9iOUaKkfgJ1kv5
 rnm9Ufh+G9ocbTbPl6QD6TyC8ASYyIGzk6ScM6ftrOaSBH0RkP0ekZctEdywpahWinqc
 Az1Ik1OGhUgNZ1FMl7Smw1MZWEXJKquKAVj2qgKOaHzgaPVHPQNhgoVw1mz+5VBib2RP
 eTeu2uqdN8NIUUpqnOoYEogKj3LSia5t1AwtGDpWofEJgA5Ry3xAlRhktpyftlkkd1YQ
 psqA8ifDB/NAXBIxgO3urNToF9E02H4dzvpLjhm/s0B2qkoA2uV8/F8pwfNsULbb42Zd
 MUPA==
X-Gm-Message-State: AOAM531Dc5MWk3mLpiB7nDr7mWQ1g0IoyF0HQHY+BBetJdArati+GA4j
 m/3/V/1VFUzfYKXSRMPNjZ/Yiw==
X-Google-Smtp-Source: ABdhPJwobkcF8YT58BTJl9qwrGvgRQbpH/fOwPb8d8w5gyrceQHNrXI00A2UDxP9jCA1DR0LVEG86w==
X-Received: by 2002:a17:907:9714:b0:6ff:338f:b4d7 with SMTP id
 jg20-20020a170907971400b006ff338fb4d7mr738417ejc.718.1654107238090; 
 Wed, 01 Jun 2022 11:13:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 fx10-20020a170906b74a00b00708743e31b2sm645939ejb.27.2022.06.01.11.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:13:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 174541FFC6;
 Wed,  1 Jun 2022 19:05:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: [PULL 14/33] build: add a more generic way to specify make->ninja
 dependencies
Date: Wed,  1 Jun 2022 19:05:18 +0100
Message-Id: <20220601180537.2329566-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Let any make target specify ninja goals that needs to be built for it
(though selecting the goals is _not_ recursive on depending targets)
instead of having a custom mechanism only for "make check" and "make
bench".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220517092616.1272238-4-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220527153603.887929-15-alex.bennee@linaro.org>

diff --git a/Makefile b/Makefile
index fad312040f..3c0d89057e 100644
--- a/Makefile
+++ b/Makefile
@@ -145,8 +145,7 @@ NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
         -d keepdepfile
 ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
-ninja-cmd-goals += $(foreach t, $(.check.build-suites), $(.check-$t.deps))
-ninja-cmd-goals += $(foreach t, $(.bench.build-suites), $(.bench-$t.deps))
+ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))))
 
 makefile-targets := build.ninja ctags TAGS cscope dist clean uninstall
 # "ninja -t targets" also lists all prerequisites.  If build system
diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 304634b71e..0fe81efbbc 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -81,12 +81,12 @@ def emit_prolog(suites, prefix):
 
 def emit_suite_deps(name, suite, prefix):
     deps = ' '.join(suite.deps)
-    targets = f'{prefix}-{name} {prefix}-report-{name}.junit.xml {prefix} {prefix}-report.junit.xml'
+    targets = [f'{prefix}-{name}', f'{prefix}-report-{name}.junit.xml', f'{prefix}', f'{prefix}-report.junit.xml',
+               f'{prefix}-build']
     print()
     print(f'.{prefix}-{name}.deps = {deps}')
-    print(f'ifneq ($(filter {prefix}-build {targets}, $(MAKECMDGOALS)),)')
-    print(f'.{prefix}.build-suites += {name}')
-    print(f'endif')
+    for t in targets:
+        print(f'.ninja-goals.{t} += $(.{prefix}-{name}.deps)')
 
 def emit_suite(name, suite, prefix):
     emit_suite_deps(name, suite, prefix)
-- 
2.30.2


