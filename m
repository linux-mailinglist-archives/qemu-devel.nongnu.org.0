Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9224F450724
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:35:51 +0100 (CET)
Received: from localhost ([::1]:39288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd5K-0003mL-MT
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmczB-0001JY-B8
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:29 -0500
Received: from [2a00:1450:4864:20::42e] (port=35337
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmcz6-0004Mt-E0
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:29 -0500
Received: by mail-wr1-x42e.google.com with SMTP id i5so31136116wrb.2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=utaazeHLlNG/kPiCg1qIdDNF39ZpPCNYiXBpO6Y4xLY=;
 b=XF0KcF9ZkG6a7FDAkmorbhlI82FvY3we0eQMrPPzI7OkM1P9m64EE+aRyub9A3tvDz
 P01sg8mVOAUHh+McQ2SPA3/hfl7Wu1Sfmeuj/QNCIYADqhVB98wUwkUCEFLKXWRWUVGr
 phtVZYWYNF33b/5G8q6yourYqlAuvE3vtscvbruJ7ky+cAsms/AN5Tv8NCFnrGZgbMUY
 327R7m5Ldk+f2civSlV72CiRxlxPj+BklaVbLf2iLyUft0S5+a5iWZvk5Y/6ZLqnxxz7
 VnVIxz2wkU67ksFx9CzHq2q5HMBi/+fT0PqGJNLRlu9Bwe2krE5neWSOuL/qAow66YhQ
 YDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=utaazeHLlNG/kPiCg1qIdDNF39ZpPCNYiXBpO6Y4xLY=;
 b=ftGIBjCEbbduTRn7N2fiDVrvT2ur6Jg62AR41Iv6VKeoBCi5gLkfxhriyJIniTebEb
 1ZS4/R8OLkdQrG7v7j/EtJMZhrtFM/WQhXwXysAj/FcKYBnUROq+2c5rpINMTi1CJ1V7
 FTddAExywh2wxDy48hWLG3e5aLxdggxCM7uLdbFaVR5MB36wFbQJp3RSpPh6VzJj72uq
 cYwJh6ZZ4dQKYe+8DkGkS9YzUBu4WJIENMMxby3TwRyi4DCzNcXi6ahXm6idk99T9PEE
 T31+Feq0aHRDtsTQUG1NRU4aI53OLDkgleh3Amtd35zw05GhJoWyIcMf+H0BIiuGvX37
 6s8g==
X-Gm-Message-State: AOAM5328KrZm0Hr5o0V7Bw7jLoBI6Ba6JYNzMAv5UY59rOf58v7paaOr
 PCDBSowEERLeNll3lPcq9uogzQ==
X-Google-Smtp-Source: ABdhPJxvu5rQn4Wk9Am9ahhboRZ7V6hYvF1QPetUNfStm2r75Fpvr+IuqgEpnP/p4wuiIHn3I0qEXg==
X-Received: by 2002:adf:ef84:: with SMTP id d4mr48262324wro.175.1636986563214; 
 Mon, 15 Nov 2021 06:29:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q8sm14333768wrx.71.2021.11.15.06.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:29:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CA5E1FF9B;
 Mon, 15 Nov 2021 14:29:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/6] meson: remove useless libdl test
Date: Mon, 15 Nov 2021 14:29:13 +0000
Message-Id: <20211115142915.3797652-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211115142915.3797652-1-alex.bennee@linaro.org>
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

dlopen is never used after it is sought via cc.find_library, because
plugins use gmodule instead; remove the test.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211110092454.30916-1-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build           | 8 +-------
 accel/tcg/meson.build | 2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 2ece4fe088..baeaee4522 100644
--- a/meson.build
+++ b/meson.build
@@ -566,13 +566,7 @@ endif
 spice_headers = spice.partial_dependency(compile_args: true, includes: true)
 
 rt = cc.find_library('rt', required: false)
-libdl = not_found
-if 'CONFIG_PLUGIN' in config_host
-  libdl = cc.find_library('dl', required: false)
-  if not cc.has_function('dlopen', dependencies: libdl)
-    error('dlopen not found')
-  endif
-endif
+
 libiscsi = not_found
 if not get_option('libiscsi').auto() or have_block
   libiscsi = dependency('libiscsi', version: '>=1.9.0',
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 137a1a44cc..7a0a79d731 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -10,7 +10,7 @@ tcg_ss.add(files(
 ))
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
-tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c'), libdl])
+tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
-- 
2.30.2


