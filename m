Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76593342D8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:16:56 +0100 (CET)
Received: from localhost ([::1]:55672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1W2-0001tv-SI
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1G0-0004ZO-LU
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:20 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fx-0002fK-Ep
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:20 -0500
Received: by mail-ed1-x532.google.com with SMTP id b13so28860795edx.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1U/ORcIBWROYJWFUfscqlCNl6s4lUhCxpTPOOlyuiKA=;
 b=G6iKuMJ4LfH3G4o/X7znHloQndR0ehEvO3lnmy15ekpuU3q27N9x4jHe4TngluDktf
 doczNoDtmoGa2DyF3rhhxGRj34n6LgR5yiQY+gaNc3AkUIS2lfLfrGy1veeUK1hP5RNu
 nMrIqlW3vq7hKE+ogVSzc5AVqc83CpLMeXozyQYwcGuNy4vJgGztG5fPUnGL0igeTtZc
 KP6wSYz7xF59NJJdPdXlzJ2ZQgPiWXglI+LsHV1wZxP7WVEMf/lzyY8A/dY67uVm176J
 fAE8uexPe7xFv+z///l99a8JX7D5kPcvJVDU2nSRvt+E5Ydl1F1kKNSLbFIRikwfMq/r
 127A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1U/ORcIBWROYJWFUfscqlCNl6s4lUhCxpTPOOlyuiKA=;
 b=aSDSBtYkZ4Hwxw+OI7SeNF9CCMopPvsq8TGspXSHe6XjzCAg8ONhfqn8uvppv6Esbh
 nEHRP1ZTX6S8xkSNZIX0la/AWGlveYMe1ZGb8JFvugUyad6D6hkiBsebZWOwj6OqeBpi
 kAatXwrot2LDbG1UQ4J4c7XS0fcCiv+cu1JaiUz9o9r63YaMw+RM5EmJJxsiIIRwC21v
 AOhz4oeoo9XbiD1IxhUiAkemW2QQjk4EhSfjP4R/XmwL4Ae4On7pCLXC81ArkKvRS4PY
 +OyhNyFx5+FO1GeOWnbAo7rUuoxVPD/tCjStCCiCInUayHH0XyLdD7zpeILsjy1H18Fq
 lfMA==
X-Gm-Message-State: AOAM5328r0G53mUIuHRGhOVWNrGJ97zIncyQgnieQziu02/voroS+SF0
 +MMYS8lQ13H22YovszKHNxBB8g==
X-Google-Smtp-Source: ABdhPJy+4RqgFmCrlGn2oFI+qTZcBFcJ8CxGvIYNeqa9PTbQJQ1JBtmb0m80fzywiI9L97mT9kwEkg==
X-Received: by 2002:aa7:d4ca:: with SMTP id t10mr4062784edr.388.1615392011409; 
 Wed, 10 Mar 2021 08:00:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i2sm11227314edy.72.2021.03.10.08.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 20B031FF92;
 Wed, 10 Mar 2021 16:00:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 06/15] .editorconfig: update the automatic mode setting for
 Emacs
Date: Wed, 10 Mar 2021 15:59:53 +0000
Message-Id: <20210310160002.11659-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems the editor specific keywords have been deprecated in the main
editorconfig plugin:

  https://github.com/editorconfig/editorconfig-emacs#file-type-file_type_ext-file_type_emacs

Update the keywords to the suggested one and point users at the
extension.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210305144839.6558-1-alex.bennee@linaro.org>

diff --git a/.editorconfig b/.editorconfig
index 22681d91c6..7303759ed7 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -4,6 +4,11 @@
 # plugin.
 #
 # Check https://editorconfig.org for details.
+#
+# Emacs: you need https://github.com/10sr/editorconfig-custom-majormode-el
+# to automatically enable the appropriate major-mode for your files
+# that aren't already caught by your existing config.
+#
 
 root = true
 
@@ -15,17 +20,17 @@ charset = utf-8
 [*.mak]
 indent_style = tab
 indent_size = 8
-file_type_emacs = makefile
+emacs_mode = makefile
 
 [Makefile*]
 indent_style = tab
 indent_size = 8
-file_type_emacs = makefile
+emacs_mode = makefile
 
 [*.{c,h,c.inc,h.inc}]
 indent_style = space
 indent_size = 4
-file_type_emacs = c
+emacs_mode = c
 
 [*.sh]
 indent_style = space
@@ -34,11 +39,11 @@ indent_size = 4
 [*.{s,S}]
 indent_style = tab
 indent_size = 8
-file_type_emacs = asm
+emacs_mode = asm
 
 [*.{vert,frag}]
-file_type_emacs = glsl
+emacs_mode = glsl
 
 [*.json]
 indent_style = space
-file_type_emacs = python
+emacs_mode = python
-- 
2.20.1


