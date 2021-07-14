Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CEB3C874D
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:25:01 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gku-0002e9-RJ
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUu-0006m3-Sp
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gUt-00041O-4g
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:08:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id g12so1808645wme.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BHQFj7LJmqkK4fnAtb9yLTlpkkBhIUxm3Sb/+SC3MMA=;
 b=GS6pmjQHia2HZey5gzy5WWkS3ZnjSqJFIfC6e6JbIiQAJvXQbcTlcdJc/GcVO4VGrH
 2lqLewoLOMw/YWuzReR9ZEag37iJ2sNzzIybwmONBDugDULDdUvl7Ea0b0T4F0KkpUmT
 DTFNlx9j57Ly39KbNVhhMCZgTNpcN0GEvXYSwmmspLR9/QwP8X+a/KJnX+m2BazrB/yu
 mjShyueqdOayRtbG+2z19SGzLq+LpwirCzziTRBpVc843+mY+4r9/rqcfJd8eJiAaKmB
 udo9yM6/FWt6l5BH23gWTqRISR1HTKyxSFJjDJwYLXCsTBKiqyEo2QMNL5C98BN7urCv
 iByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHQFj7LJmqkK4fnAtb9yLTlpkkBhIUxm3Sb/+SC3MMA=;
 b=K4NF0eMqgDtjufb/P6SSg1Z7/OUXCKHhnUEvmw/+vkFNgM8HMp3ebXfbtmQoUoa1ht
 M0C/oZsFBGvIqxAqpD1M3NHwpwXGmx4iMd9XI08ePuGP3OsPS5aWfO/1oedIb9kVVpho
 VvgmhwYJd+H3A/RbMbIwl6i91ISzTQR5XafZNBolizRXAbpWmBdmjFr/nTWi0nO1dgZC
 kyLd2h0hvOcsx/omZU5Dfkgf562VwYVk9ROIvB1xrEsXIB17osH7o6JS+9186rKFhPw8
 c9CANd1KfGFmZNVZbAMs5PM399MXd9CkNkmSpJCU593M4T9vumLGbAyY1WwD1ExdQDje
 VQVA==
X-Gm-Message-State: AOAM532su4ihantqBuyrT72mfL0waWdCzGa4wR6tV9Xya8NSA9MO/d0O
 1mtcTkKvRRwNwXAv4rYeJfDqSg==
X-Google-Smtp-Source: ABdhPJxiuXt1VrWWmQYzKQDTdsC9wzhHKQw4RDHk49re7xJ0yKxbfqqPszEd7TZPJGxjEx7C3LV8Nw==
X-Received: by 2002:a1c:988a:: with SMTP id a132mr4593295wme.175.1626275305605; 
 Wed, 14 Jul 2021 08:08:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z13sm2927491wro.79.2021.07.14.08.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:08:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 497831FFBB;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 33/44] configure: don't allow plugins to be enabled for a
 non-TCG build
Date: Wed, 14 Jul 2021 16:00:25 +0100
Message-Id: <20210714150036.21060-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-30-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 4d0a2bfdd8..e2a353ce1c 100755
--- a/configure
+++ b/configure
@@ -1110,6 +1110,7 @@ for opt do
   --enable-cap-ng) cap_ng="enabled"
   ;;
   --disable-tcg) tcg="disabled"
+                 plugins="no"
   ;;
   --enable-tcg) tcg="enabled"
   ;;
@@ -1575,6 +1576,11 @@ for opt do
   esac
 done
 
+# test for any invalid configuration combinations
+if test "$plugins" = "yes" -a "$tcg" = "disabled"; then
+    error_exit "Can't enable plugins on non-TCG builds"
+fi
+
 case $git_submodules_action in
     update|validate)
         if test ! -e "$source_path/.git"; then
-- 
2.20.1


