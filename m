Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E0A323B7C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:51:07 +0100 (CET)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsh8-000773-6D
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfe-0005qr-Ps
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:34 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfd-0002Tc-37
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:34 -0500
Received: by mail-wr1-x431.google.com with SMTP id r3so1589311wro.9
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yl9N9f02916jOdl75tlt9hwNyZRHfETE4hJ5ov352dM=;
 b=CBGfjhb6iZASoXsJ+gzezw1cNHGK19HiG6oS/htS/RrYT7u+1QE47t+X0kOL90YwQe
 yRAf5HhUAhG4Jo7rVE1zGHnRlyKcBokF6k5dqjqZixd5jqdIjxyIol//uEGPGBX2J61V
 nM19yqcL5IXCGtzyU/7sdeVB7Av4NV+HrWPOwQMW0zhEz8FFfarWqorKQ/z4Z+mi89LG
 stXdoTeeOSmWqs5oltfyS05GVtcIigLM+pRww0KVL7sXmSDJuNzsl/usjWD0yLhmqjR4
 4xkUdB0EayJ0t+XEPsVGlqTzBmTCkBbZfxUXixIbrhoNuZfijDIvNVvpEF3yKnDTtUNx
 N+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yl9N9f02916jOdl75tlt9hwNyZRHfETE4hJ5ov352dM=;
 b=t647MpjAPbSH3wUpgRUUHcwTYo4LeUeJrhMcwDkwtXpppgweyEFwGcMffXCBW9nHPN
 HRI/CmP72cKYaZT2cV0obXcw6sCGFI7G6DjH+gZ4iuHHmqOYQ/FIeyTxaSh4JP0W8cDF
 8a6+lrDF2U7Wjjgkm8YLbciryMbms2BBK8np6Qq+pUTh6qrUZ3WnlKAiVqkXN60WD/bI
 52vejJaH7VR+WY73V/wPwTfOjuu34UWYIQut+hy9FEAEUu6KwS68fUJznbIQChOoJlLJ
 YKmBkoausVtYByr8drl6nR0NPmz55nzeCiSvtxe8RoFKgJfLy0acr/YDRwVzhaEVWh7V
 hwVQ==
X-Gm-Message-State: AOAM5314AaGDx2atahwecBqELF5QawDhb0XSq3XqfhignciJmCdUbQAP
 SB+i1jbIjCLvl+ZungkW0p756g==
X-Google-Smtp-Source: ABdhPJxTl1I5jnejUMXz+1Z1HdeVzYuhei9mNRmIfoUXOkstwzL9pP4ywAlPtMjbnBiL1wdwUwc4vQ==
X-Received: by 2002:a5d:4705:: with SMTP id y5mr24069032wrq.313.1614167371593; 
 Wed, 24 Feb 2021 03:49:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z13sm3071189wrh.65.2021.02.24.03.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:49:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75F0C1FF87;
 Wed, 24 Feb 2021 11:49:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 1/7] meson.build: expose TCG cross compiler information in
 summary
Date: Wed, 24 Feb 2021 11:49:20 +0000
Message-Id: <20210224114926.6303-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224114926.6303-1-alex.bennee@linaro.org>
References: <20210224114926.6303-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Blink and you miss the cross TCG compiler stuff so lets display it
with the rest of the compiler information.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222101455.12640-2-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 05a67c20d9..f3db83e974 100644
--- a/meson.build
+++ b/meson.build
@@ -2509,6 +2509,24 @@ endif
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'sparse':            sparse.found() ? sparse.full_path() : false}
 summary_info += {'mingw32 support':   targetos == 'windows'}
+
+# snarf the cross-compilation information for tests
+foreach target: target_dirs
+  tcg_mak = meson.current_build_dir() / 'tests/tcg' / 'config-' + target + '.mak'
+  if fs.exists(tcg_mak)
+    config_cross_tcg = keyval.load(tcg_mak)
+    target = config_cross_tcg['TARGET_NAME']
+    compiler = ''
+    if 'DOCKER_CROSS_CC_GUEST' in config_cross_tcg
+      summary_info += {target + ' tests': config_cross_tcg['DOCKER_CROSS_CC_GUEST'] +
+                                          ' via ' + config_cross_tcg['DOCKER_IMAGE']}
+    elif 'CROSS_CC_GUEST' in config_cross_tcg
+      summary_info += {target + ' tests'
+                                : config_cross_tcg['CROSS_CC_GUEST'] }
+    endif
+   endif
+endforeach
+
 summary(summary_info, bool_yn: true, section: 'Compilation')
 
 # Targets and accelerators
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 551c02f469..36b8a73a54 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -263,11 +263,3 @@ for target in $target_list; do
     echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> $config_target_mak
   fi
 done
-
-# report container support state
-echo "cross containers  $container"
-
-if test -n "$enabled_cross_compilers"; then
-    echo
-    echo "NOTE: guest cross-compilers enabled:$enabled_cross_compilers"
-fi
-- 
2.20.1


