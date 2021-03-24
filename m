Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14712346F06
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 02:48:05 +0100 (CET)
Received: from localhost ([::1]:53512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOscu-0007iv-3l
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 21:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYi-0005vd-0D
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:44 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOsYd-0005jM-OF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 21:43:43 -0400
Received: by mail-oi1-x230.google.com with SMTP id c16so10304113oib.3
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0e93t7AcpX0MjpVEUPJ+qK951VVe9n5DKhcqYQAAQ+4=;
 b=ckMQQ3HFhr+elAIS1qIUVUMpiwJLmburz5CjITSwDDix6ocT7D0ZoI+vt3FSE0Flyr
 okcEAEgHBz8NgdqNe+TmPA5O//9YbcXyeMrUobDUvHRhUpAcFsute9mzqUSU/NuZezCa
 0b3vygxVQyRRGQrHBa0IEDQG28DzOcnk+voI+D8J6ZvDs0HPPtmLdeEQo0ihUQmMshc+
 xPwL70EcXNgeMBn7h+DRKb4vC/MzorVsJWqLvj914MuDJUvlP/glHamooosqhC9fHvaU
 1e59XdR6iQCX9gY4Q0i6u0Zwcj4vOdW8XFj31h/Rz5s5aPANfxaa8Sln72ThNjkaU2m3
 ypMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0e93t7AcpX0MjpVEUPJ+qK951VVe9n5DKhcqYQAAQ+4=;
 b=VkPAygWB5Cbtk/ydFrGUCX3WdFCceAlao0NV4ADeq8WX3U/HOwTVwn9GyupHuYYGwv
 uilOYvf0VXB+mBeagPEBBza7GTLniy2fJUbeve16EK3CW6WR+jSyHQ7RloVRS8qvAtZE
 YOVEPVtxrb4WpN87pSMyEAf3o9CJdqSkkNoqqKXzRrsEKF+ZpgzxMZmwbUsZkpQ6joGb
 tdBVN/ICP0qw+HkfehVjlefY3Gu6prkVicIeKQkf4Sz3VjGYdJkM21vBLQef5KfZdoaP
 mZwgZZgjJbQj32f02D1pbjhlM4s0xsxVpuBECcJWDrcqqZ4eYtFyKQKuRFBbXLE5Jpdk
 BoFg==
X-Gm-Message-State: AOAM531GnfCF9NEh++S30vaGJUWcI7ny3Tj9+xQBECpwx2if/dex3moU
 X0AKLHkKEIfWDBclf/D/hPi1gjJaK1caKgVP
X-Google-Smtp-Source: ABdhPJzGBNqVS9RR2Z38R6X3oxfEzVd5xiRyHiWRvJQQmKNkODfQGzYBt/6rrPPmGfI02AekVNFnOQ==
X-Received: by 2002:aca:2104:: with SMTP id 4mr713558oiz.124.1616550216942;
 Tue, 23 Mar 2021 18:43:36 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c9sm203601ooq.31.2021.03.23.18.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 18:43:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] exec: Rename exec-vary.c as page-vary.c
Date: Tue, 23 Mar 2021 19:43:30 -0600
Message-Id: <20210324014332.6331-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324014332.6331-1-richard.henderson@linaro.org>
References: <20210324014332.6331-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

exec-vary.c is about variable page size handling,
rename it page-vary.c. Currently this file is target
specific (built once for each target), comment this.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210322112427.4045204-2-f4bug@amsat.org>
[rth: Update MAINTAINERS]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build                | 3 ++-
 exec-vary.c => page-vary.c | 2 +-
 MAINTAINERS                | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename exec-vary.c => page-vary.c (98%)

diff --git a/meson.build b/meson.build
index 5c85a15364..f0dd8aa089 100644
--- a/meson.build
+++ b/meson.build
@@ -1933,7 +1933,6 @@ subdir('softmmu')
 
 common_ss.add(capstone)
 specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
-specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
   'tcg/optimize.c',
@@ -1945,6 +1944,8 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
 ))
 specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
 
+specific_ss.add(files('page-vary.c'))
+
 subdir('backends')
 subdir('disas')
 subdir('migration')
diff --git a/exec-vary.c b/page-vary.c
similarity index 98%
rename from exec-vary.c
rename to page-vary.c
index a603b1b433..344f9fcf76 100644
--- a/exec-vary.c
+++ b/page-vary.c
@@ -1,5 +1,5 @@
 /*
- * Variable page size handling
+ * Variable page size handling -- target specific part.
  *
  *  Copyright (c) 2003 Fabrice Bellard
  *
diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429..ed68de3cec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -117,6 +117,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
 S: Maintained
 F: softmmu/cpus.c
 F: cpus-common.c
+F: page-vary.c
 F: accel/tcg/
 F: accel/stubs/tcg-stub.c
 F: util/cacheinfo.c
-- 
2.25.1


