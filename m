Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3523FFCD6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:15:28 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5IF-0001AV-Qv
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM579-00069P-Mk
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:59 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM572-0005bs-Io
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:58 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso3269106wmc.5
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RyVojjuqH6WORlMZZGsMkQpTfSUfAqc9uy3n8opotoQ=;
 b=ZVZ9CrTkeBdB8XcTJseYInwzK9SISYruOVu4dl6i2eqFtFduOWeeXvJfLTpzSEHM3l
 VAaP1ioJDWyprKgQI43U1KyZv/nw6RnQUF8Q5mrGs6CG6HMPqkQC11NqQb/JxbHtgQXY
 OuazxFgSs1lisZpvSyTB1VijlU7l0fzNeyL31GHjUFKyn0rOu9CgqjBpnwyVVUGGCX8s
 NUz3mNd0GCdwbp1+yA9p6sOqxO3SIvWuU75bKRV0pPUqojbASaxThBf+pmkBkCyA/Sc3
 VlR7XE5xbgof60WRfcPqX9Ck3tL45Ot8KMj0Re3G71qls9Bc7fIwVqbHTbHSWFpZoDjL
 GCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RyVojjuqH6WORlMZZGsMkQpTfSUfAqc9uy3n8opotoQ=;
 b=cLDts91dhgmxRNyQDnwCwsgHSRYjE+LKJXlpCzbl+vYyNqKEAjS1Gz8hCHNQA6K9ib
 1fWR6DlQWvh7524k4EbO1Fw1vGLUbaEALew3Jix23RPYjot12yxgVmtPF134i5j5uIrL
 YYS2uGBFsImIrCKNRiOG3m4UVQ0RJQAuhLR2uHwuqcoRJRYZVYo81ROHfJeef78SX5uu
 giK0aTOFnRATPLo4E6vxKbu8cg3ji1Z4EIBelaLOgFqouWpVOouGyKD+A2VMrP8rXDu7
 7cqgMOPUqeyFZc94YkJbvmwucKUcDPEExXoZGHqE81HF4qVQjxER3yoJfxSL1Fx2dpeM
 a6Uw==
X-Gm-Message-State: AOAM533CrilInlPLorDS1/b3qc2wFbzmQxpD57/Rm2bg681yp7Sihviu
 50rfGiPOGVHj1Yohx236EUdyALotBDkAhA==
X-Google-Smtp-Source: ABdhPJzMR8GZVmJRXN82ZjlrY2F2sj8bEO/iGz+0YHwDiPghXMQ8yOi0JrzHJpU0icjoueo31QcrUQ==
X-Received: by 2002:a7b:c014:: with SMTP id c20mr2247867wmb.81.1630659831192; 
 Fri, 03 Sep 2021 02:03:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e26sm4282287wrc.6.2021.09.03.02.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CB3D1FF9C;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/22] plugins: do not limit exported symbols if modules are
 active
Date: Fri,  3 Sep 2021 10:03:22 +0100
Message-Id: <20210903090339.1074887-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

On Mac --enable-modules and --enable-plugins are currently incompatible, because the
Apple -Wl,-exported_symbols_list command line options prevents the export of any
symbols needed by the modules.  On x86 -Wl,--dynamic-list does not have this effect,
but only because the -Wl,--export-dynamic option provided by gmodule-2.0.pc overrides
it.  On Apple there is no -Wl,--export-dynamic, because it is the default, and thus
no override.

Either way, when modules are active there is no reason to include the plugin_ldflags.
While at it, avoid the useless -Wl,--export-dynamic when --enable-plugins is
specified but --enable-modules is not; this way, the GNU and Apple configurations
are more similar.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/516
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[AJB: fix noexport to no-export]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210811100550.54714-1-pbonzini@redhat.com>
Cc: qemu-stable@nongnu.org

diff --git a/configure b/configure
index 9a79a004d7..7659870810 100755
--- a/configure
+++ b/configure
@@ -3187,9 +3187,8 @@ glib_req_ver=2.56
 glib_modules=gthread-2.0
 if test "$modules" = yes; then
     glib_modules="$glib_modules gmodule-export-2.0"
-fi
-if test "$plugins" = "yes"; then
-    glib_modules="$glib_modules gmodule-2.0"
+elif test "$plugins" = "yes"; then
+    glib_modules="$glib_modules gmodule-no-export-2.0"
 fi
 
 for i in $glib_modules; do
diff --git a/plugins/meson.build b/plugins/meson.build
index e77723010e..bfd5c9822a 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -1,9 +1,11 @@
-if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
-  plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
-elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
-  plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
-else
-  plugin_ldflags = []
+plugin_ldflags = []
+# Modules need more symbols than just those in plugins/qemu-plugins.symbols
+if not enable_modules
+  if 'CONFIG_HAS_LD_DYNAMIC_LIST' in config_host
+    plugin_ldflags = ['-Wl,--dynamic-list=' + (meson.build_root() / 'qemu-plugins-ld.symbols')]
+  elif 'CONFIG_HAS_LD_EXPORTED_SYMBOLS_LIST' in config_host
+    plugin_ldflags = ['-Wl,-exported_symbols_list,' + (meson.build_root() / 'qemu-plugins-ld64.symbols')]
+  endif
 endif
 
 specific_ss.add(when: 'CONFIG_PLUGIN', if_true: [files(
-- 
2.30.2


