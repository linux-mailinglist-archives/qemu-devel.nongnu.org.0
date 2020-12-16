Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809562DC49E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:50:52 +0100 (CET)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa0p-0001AL-6c
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyf-0007sx-3S
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:37 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyb-0002Nt-Nb
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:36 -0500
Received: by mail-wm1-x335.google.com with SMTP id y23so3101315wmi.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plN9xdsMieELC+ppKQXA+6DYaAZxpMpmyXL+0FGH/I0=;
 b=fnrC6LdiB6gCJL56dnw/VwUeh68HewPxyIu8wCXAn7Q4uWs4pckcyrTJSHfC1hya5L
 rgvERiq7qxS/aPaYzvUUd1jYEt2zUA0P5cHl7K1kvzSO+TuQEfYPAD3Dddyu8hsTtlTm
 00iYhUsdZfjwfShYtOhuNG0529TZ2KMi3d+RnnHmfVAZWnvXpUcAnSf3YZj0mjrASWMe
 wnFovgDeJsRHzMfOApUEnfhsIVjkHzypi7EaF70SmjKzs8bNy2IijZOn21CsiGSiMlD5
 QYlnvKvHOdK4tx4v/SqZgJtoBr8qkCccjcDY4DhDK8bEjh+bcQpX3BgufJHU+P1KIB3D
 CZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plN9xdsMieELC+ppKQXA+6DYaAZxpMpmyXL+0FGH/I0=;
 b=Ix/SyFwc8rJFTqyU8EXFFiWTGxINYzrMEL7hhXnVlHSAB69Zqs14P+AP5FLQ6fxHYg
 rRgYAyd3WcJsWoI2W488743+p7ATVyES+dQERIWAEpwPjgZ0uH2bmSB8HaejOBi+UeuO
 LGwTeSwz3Ak38ZeR9OnDGua2HWH/fM6+nvt56jpVzLgb6Byt9F9+Ll1z5RCjDG+RWimz
 QTRrS8nNrhSsimnFcdc5ThkzpHT6Y5T5voXrBspAhBWwjrf2sdh9ab2LENLI+pp2nupm
 ZhXrITPzLfROM83moTl9h/jUrDwxvP3QtqrZ4oIlaKHeJDkcOZIRCQlKVxyMX8B8nxdg
 3Dgg==
X-Gm-Message-State: AOAM532vaxS3gnKjkloIYDJUbt1YibLa6FZX2C1Y4Wd7jBOM7mFBNGn+
 /AFdrq36ppFNLcG3kDgXaWIaow==
X-Google-Smtp-Source: ABdhPJyvQaW7Ww5KuTrG+SCJ/XSs8WQ9vLkdOU/FfyE9e5vOxL4EB1BTe1glf2ZyJRFhe+7Bg4EImA==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr4278785wme.44.1608137311202;
 Wed, 16 Dec 2020 08:48:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n17sm3423569wmc.33.2020.12.16.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F093F1FF87;
 Wed, 16 Dec 2020 16:48:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/11] configure: include moxie-softmmu in
 deprecated_targets_list
Date: Wed, 16 Dec 2020 16:48:17 +0000
Message-Id: <20201216164827.24457-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We still build it but there is no point including it in the normal
builds as it is ushered out of the door.

Fixes: 4258c8e221 ("docs/system/deprecated: Mark the 'moxie' CPU as deprecated")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201210190417.31673-2-alex.bennee@linaro.org>

diff --git a/configure b/configure
index c228f7c21e..d37ec98aa9 100755
--- a/configure
+++ b/configure
@@ -1620,7 +1620,7 @@ if [ "$ARCH" = "unknown" ]; then
 fi
 
 default_target_list=""
-deprecated_targets_list=ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
+deprecated_targets_list=moxie-softmmu,ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
 deprecated_features=""
 mak_wilds=""
 
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 98bff03b47..b3bcaacf7b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -355,7 +355,7 @@ build-deprecated:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-docs --disable-tools
     MAKE_CHECK_ARGS: build-tcg
-    TARGETS: ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
+    TARGETS: moxie-softmmu ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
       unicore32-softmmu
   artifacts:
     expire_in: 2 days
-- 
2.20.1


