Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCC2F6742
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:16:38 +0100 (CET)
Received: from localhost ([::1]:36242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06Ef-0002JT-Bj
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wW-0003vP-EY
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:52 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wU-0004zc-Ji
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:52 -0500
Received: by mail-wr1-x436.google.com with SMTP id c5so6515613wrp.6
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2e7mZD6SyLJEsK7O00sEdc8/yoIDsC3UTnuO1XxhiK8=;
 b=XWXvTVaWriSrLYMYnGdqUkUsiCJIelSY6/J9isQl3NGiCtAoV5GkOHI2/KHwsToaKS
 S4Osbxc5LEi16mHz7gUUZOcM8LoCgG3i2x57Sj5JE/tfl0wJav30sxtQ2IW2h9MOvsTN
 VVBWq6Nyb8MNRHqGyn7qFBWJ/GciAYmsxs5qmQ2bimUKOgRnYrJupkfz41EBEzu80xFb
 dihEyHzxzlAK0lWBKtbsQ1vzYUUvEA0AaekCwFg11uHd/atCfhumBkWtsHYU1R4BMDgv
 aIwJP8OG978R+STiHaaH5DaxWJL175r37Gom+CjU5P0RddLiW0AuY5IQ1exztyIwqEIW
 JnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2e7mZD6SyLJEsK7O00sEdc8/yoIDsC3UTnuO1XxhiK8=;
 b=iN86XhkpZFlMhnSam16xqnU2GTC35hTAV47zhLlKp26+pUW/0FToBctM7Vqcvff+Rb
 SIM6uorDjh+Qa/3fnYjBd2gGbX71OVU70VyY3CXjiY2nZbN1M5VddgdG/+ZOSuF1NnAS
 1UTNgUM8+k+TR5cTK5JHj5bTPuHaG1O8jTnyo/OFlQQk8ohbijQojoPmznjhtsGXQrIw
 YwZkj3UgQ20lF9uUU55KfYiGy0R5GIzmoWnb4rplY1KA9bsiUxtHF6BqoZys61FCI7Es
 7pXItax7lcbOK8IgE99rp03QIrUvvwyap+jMwQXiXJveUZwgDGrIh3NLSclsE98muEdj
 Awpw==
X-Gm-Message-State: AOAM5337+F637etnQG9dCruGs5RqoGZMRyntfK6ifCfq/iASAEl2YOtD
 ZYHRjFFBre4OteP5ddZWqWk36Q==
X-Google-Smtp-Source: ABdhPJz0WZsFKbm3Iryq9Wu56vcIrtf+a+Kn3vNc+e2aSGANGxTzUQiHzRRFkMYkbU+wVXgkWkN7vQ==
X-Received: by 2002:adf:db51:: with SMTP id f17mr9095592wrj.83.1610643469418; 
 Thu, 14 Jan 2021 08:57:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm8996342wmi.15.2021.01.14.08.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 01AE01FF99;
 Thu, 14 Jan 2021 16:57:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 10/12] Fix build with new yank feature by adding stubs
Date: Thu, 14 Jan 2021 16:57:28 +0000
Message-Id: <20210114165730.31607-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
[AJB: tweak MAINTAINERS]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210114141918.5201cc9c@gecko.fritz.box>
---
 stubs/yank.c      | 29 +++++++++++++++++++++++++++++
 MAINTAINERS       |  1 +
 stubs/meson.build |  1 +
 3 files changed, 31 insertions(+)
 create mode 100644 stubs/yank.c

diff --git a/stubs/yank.c b/stubs/yank.c
new file mode 100644
index 0000000000..6090416065
--- /dev/null
+++ b/stubs/yank.c
@@ -0,0 +1,29 @@
+#include "qemu/osdep.h"
+#include "qemu/yank.h"
+
+bool yank_register_instance(const YankInstance *instance, Error **errp)
+{
+    return true;
+}
+
+void yank_unregister_instance(const YankInstance *instance)
+{
+}
+
+void yank_register_function(const YankInstance *instance,
+                            YankFn *func,
+                            void *opaque)
+{
+}
+
+void yank_unregister_function(const YankInstance *instance,
+                              YankFn *func,
+                              void *opaque)
+{
+}
+
+void yank_generic_iochannel(void *opaque)
+{
+}
+
+
diff --git a/MAINTAINERS b/MAINTAINERS
index cb0656aec3..07e4851aa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2736,6 +2736,7 @@ Yank feature
 M: Lukas Straub <lukasstraub2@web.de>
 S: Odd fixes
 F: util/yank.c
+F: stubs/yank.c
 F: include/qemu/yank.h
 F: qapi/yank.json
 
diff --git a/stubs/meson.build b/stubs/meson.build
index 80b1d81a31..1a656cd070 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -47,6 +47,7 @@ stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
 stub_ss.add(files('cpu-synchronize-state.c'))
 if have_block
+  stub_ss.add(files('yank.c'))
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
-- 
2.20.1


