Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F631D950
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 13:23:57 +0100 (CET)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCLs4-0007QG-RC
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 07:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLo6-0002TF-Dr
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:52 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCLnt-0000It-Sf
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 07:19:49 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r21so17135206wrr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hTHuIZYF7Ch/fCQqi/0ES5poPKV3lkXwJDCUU0xASBM=;
 b=u3qqlEZu5zYnOepoY09NOWwYpEGAOWPEP3LHveHD3Lb3zKGRlxI+sohw8J34zNTB3Y
 pa5mjZLEU4sltyJuzzt+DKI9AfSC19AyisDI499Y/E7uAm/tlkgajAlNlGndk4f0amlz
 frn7jjTU5y2cI6YA0KA0Yz6llRhW3nbqLahVyTmJDHX7qa8nD3kvUeytz/CKx2ISgjbT
 6AZmDVtgAunjnkJsTISb9XK8EqL9bpHgHz0oscaRylkBsL1v9me7SaE7fwMUw5orWySU
 omNNB3N31MhxM3JLY60DiMHYvN9fzR0NJ8aEqF08Z9uQX8EcWgM2g7kok7/awGcI1vM0
 NhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hTHuIZYF7Ch/fCQqi/0ES5poPKV3lkXwJDCUU0xASBM=;
 b=tiJ6ihh2aztAAcd3rc42nB27VJhJNf8CXeZp79TLA6qMNQH+NPxN92T+2V2vtzbb+l
 8H9EZ+4lqMqqDLkR/fyz8uT28u/1VETdZYRIKF5gOopoG3GvY7VSnf9H6z7yypVTMUu7
 dD7swYDkliAlGU+k2aB7P0xKX4gE18DfvlwXyue1glUQjLJpZsSEk5yb1tEsT/bsJihK
 mN9gDz2ts0aN7Dc8n4GifALGpHefnFHpCHC1fKWT2RlNlvnOBo+HLAVxc0dvN/Wr3XZQ
 mJxS8RcHedxQyG0UnfvNdnRnpo2OK7FgYFkRg6Oa6BSqR3Mg+vBYiWQasOV5NK7erKEm
 xd9g==
X-Gm-Message-State: AOAM530o1GPZNQxYzFowUaql9984mzdYQCWDAfqAUkM1TV6lzfAvUIuv
 NDS3YW4Zdb+uevWcxhX4Ar10U4r1eEE2KA==
X-Google-Smtp-Source: ABdhPJwcTUVvDFeRdrT1YpQkXdwUOyg2pA8hZV7pPIjcSH72aur/xBrAg4YN8Q3sLbq0dndhWxBSiA==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr28909051wrg.362.1613564375158; 
 Wed, 17 Feb 2021 04:19:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 101sm4312687wrk.4.2021.02.17.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 04:19:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F1F71FF87;
 Wed, 17 Feb 2021 12:19:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/6] meson.build: expose TCG cross compiler information in
 summary
Date: Wed, 17 Feb 2021 12:19:27 +0000
Message-Id: <20210217121932.19986-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210217121932.19986-1-alex.bennee@linaro.org>
References: <20210217121932.19986-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Blink and you miss the cross TCG compiler stuff so lets display it
with the rest of the compiler information.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210216102522.6279-1-alex.bennee@linaro.org>
---
 meson.build            | 18 ++++++++++++++++++
 tests/tcg/configure.sh |  8 --------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index a923f249d8..4462e7279e 100644
--- a/meson.build
+++ b/meson.build
@@ -2508,6 +2508,24 @@ endif
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
index e1b70e25f2..77a18fd289 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -257,11 +257,3 @@ for target in $target_list; do
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


