Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B793213F0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:17:19 +0100 (CET)
Received: from localhost ([::1]:41444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8HF-00017N-Fj
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F3-0007uf-Ou
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:02 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:56245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lE8F1-0005F8-BU
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:15:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id i9so3028112wml.5
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qWQxTTJ9yHrhgADq5YDj18MKlBZV63tENXZ5aJU0qpw=;
 b=ob4rT3hhhwv7nLPFnXrM25XRnIRyZkiVhfRBdEoJBvdNegrazWcLDJ9W5H3iZmtLUj
 oaTCd1a0g+EkmX5M11nFp6Ml++NCZKcyVwqM05sLqlX+DmLLzAqjk33H0PB345QMagV2
 wKMk59QYmxBggGgrKUx0tcPtItdddWsXMP/PK7/3KKdJa09g/MJli6aTK/n2R2mvDvwW
 3Ck70HisQ7sN+LM+fhVTZLB21Aj+uV1ja3VLczJHlUJiquDNWwQz9ot6SfvPz8OZ89dm
 3nmMqurKYDYrD+Y7l0hiLbfVoMyiNtfFeVh3u2sR+ru6Fxogjro02oIEUZBgmPWziVMh
 wiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qWQxTTJ9yHrhgADq5YDj18MKlBZV63tENXZ5aJU0qpw=;
 b=jVb6RehH20ds/omafgMFY4Des7wa1fuahXtUWfJMLWxIDU7EK+v5nvdSEpRk5lanHE
 U0E+89CUGmHX6ACTAVnZVM7e9qHLWlCWnAEuhjG/b+ybOVZkzuEmUmDTqz6YfTGSYvMY
 1PvBqMSbovHJ2o/p0/fdjn/kUkeyML7rzI97NAj/8zxdYygRCmHopbcQbrVOJG7jVyNE
 1eV4+fgwv4YU+XO09IJFsbeTHl4NR7MD7Mw7gpcY/74dl+kbKmF3LH9hLenNzH6Xn37e
 lgABy0Rdo7crwCcc2WJz2bcO/2S78+3m6ovcrp2+ilkwAAVz0j2iR2krSTcohpClswDz
 Pt5g==
X-Gm-Message-State: AOAM531pjW0zUPLPZUuijufS4sHbMMS2RL2vDXpmd0ZD2R1jwBkaf42E
 neSPvQwME86kafqsSpycZGCnIQ==
X-Google-Smtp-Source: ABdhPJw3RUeI0zH3ktMCVUBJwcybauBHPvZdszjT2hRG1RImPQlWNGzLm4btDbb4Mvuo6m3vfCaAAg==
X-Received: by 2002:a1c:f019:: with SMTP id a25mr9379644wmb.125.1613988898057; 
 Mon, 22 Feb 2021 02:14:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q140sm31545021wme.0.2021.02.22.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 02:14:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7C8E1FF87;
 Mon, 22 Feb 2021 10:14:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] meson.build: expose TCG cross compiler information in
 summary
Date: Mon, 22 Feb 2021 10:14:50 +0000
Message-Id: <20210222101455.12640-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222101455.12640-1-alex.bennee@linaro.org>
References: <20210222101455.12640-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Blink and you miss the cross TCG compiler stuff so lets display it
with the rest of the compiler information.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210216102522.6279-1-alex.bennee@linaro.org>
Message-Id: <20210217121932.19986-2-alex.bennee@linaro.org>
---
 meson.build            | 18 ++++++++++++++++++
 tests/tcg/configure.sh |  8 --------
 2 files changed, 18 insertions(+), 8 deletions(-)

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


