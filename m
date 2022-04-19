Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E885A506804
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 11:49:19 +0200 (CEST)
Received: from localhost ([::1]:54934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngkU3-00045g-2d
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 05:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk0U-0006HC-Pd
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:18:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ngk0T-0001IC-1P
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 05:18:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b19so21525254wrh.11
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3DAB7u4iE0c0w65rd5E8o0VtRYVipoiZWyPdiNe3E7w=;
 b=QyNE6cZfzaqguc4/WRcGaKhU/5VttSUbJTTrIWd6RMjjx8Ca0T/66LxOe50gJnDVc1
 ZAGv/LJTxO9i0alK6zKgHWtnn1DCSc3yzTb8nCe6gZmNeGiwcjXZNvghRkvlOWr3K9Qi
 gl2i/SB1sHltp+dxty+qOyO+g8CGci/5Q9jyoE8GZedf7U8iH0wOSFOnV2NJKbmNYYpz
 /WDD/y1R7XJYtTHHU5WAHc+ObgQUsg0gam84FaXgVMZI6ENQNrFu37be9JVyQoxpv4qb
 RQgREGbXtV3n7PH1BEcEH7mECDV1rVfxptE+XKQXVVt7f/3DQTho9hPnhnjZIUbgxGQG
 vyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3DAB7u4iE0c0w65rd5E8o0VtRYVipoiZWyPdiNe3E7w=;
 b=GJmKVU8w2CjsuVlA/gE1kl89a63QgD0uV83QVGEKJrIKBx2qPaerOGgK0SHxC78G52
 BVBuH4lxTjh2/uQiZ36ZJXPutB8UrU0T+dN15EWra4bOHmpdMXOAYUVKMJLgPXmqHj+k
 JCnd5Khzqoj3FdIbIkBY3fGGpyWQXdqP9buBPNCfqea4Qj/TWyePJy9O5mtibk3DRrDX
 TGsJYuiGUecM/PVkRvBJoGNguRGqUYf56KYVMNrzkbvk+ys1YzGfBwtQd+Qw8uOVMT1b
 68BDKGhIYzjSHkWPplwFfcpbS1T9iXz/SNO5zDl1mr0hR8GNlHMYQVecE2FYhfutf3Xm
 ZgGA==
X-Gm-Message-State: AOAM531cXqvMun500r6d+l4C5Uyaq7avauWvJOgerCvmppnnZ8gqRUqy
 03Skgn6PhYlZAN9i5qz4fkKD1jXhf6YErg==
X-Google-Smtp-Source: ABdhPJzeYeDE3OCThQ11JUX9boE2UFdgPbyezBGKV/Eqb2sh7S7PTPa6x1rswWHDmt/dqFHbTER9zw==
X-Received: by 2002:a50:c3cf:0:b0:41d:5fc4:7931 with SMTP id
 i15-20020a50c3cf000000b0041d5fc47931mr16667914edf.244.1650359444771; 
 Tue, 19 Apr 2022 02:10:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a170906938f00b006e8afb5a7d9sm5398975ejx.33.2022.04.19.02.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 02:10:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E565C1FFCA;
 Tue, 19 Apr 2022 10:10:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 18/25] tests/tcg: isolate from QEMU's config-host.mak
Date: Tue, 19 Apr 2022 10:10:13 +0100
Message-Id: <20220419091020.3008144-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220419091020.3008144-1-alex.bennee@linaro.org>
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Do not include variables for the QEMU's own compiler, as they
are not necessarily related to the cross compiler used for tests/tcg.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-16-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                 | 3 +--
 tests/tcg/Makefile.target | 3 +--
 tests/tcg/configure.sh    | 5 +++++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 7c08c18358..e8786d478e 100755
--- a/configure
+++ b/configure
@@ -2937,7 +2937,6 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
-echo "HOST_CC=$host_cc" >> $config_host_mak
 echo "AR=$ar" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
@@ -3057,7 +3056,7 @@ done
 (for i in $cross_cc_vars; do
   export $i
 done
-export target_list source_path use_containers cpu
+export target_list source_path use_containers cpu host_cc
 $source_path/tests/tcg/configure.sh)
 
 # temporary config to build submodules
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 95499d8c9b..f427a0304e 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -30,7 +30,7 @@
 #
 
 all:
--include ../../../config-host.mak
+-include ../config-host.mak
 -include ../config-$(TARGET).mak
 
 # Get semihosting definitions for user-mode emulation
@@ -77,7 +77,6 @@ EXTRA_TESTS=
 
 # Start with a blank slate, the build targets get to add stuff first
 CFLAGS=
-QEMU_CFLAGS=
 LDFLAGS=
 
 QEMU_OPTS=
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index a577dd7ece..75603fee6d 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -83,6 +83,11 @@ fi
 makefile=tests/tcg/Makefile.prereqs
 echo "# Automatically generated by configure - do not modify" > $makefile
 
+config_host_mak=tests/tcg/config-host.mak
+echo "# Automatically generated by configure - do not modify" > $config_host_mak
+echo "SRC_PATH=$source_path" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
+
 tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
-- 
2.30.2


