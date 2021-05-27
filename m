Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72410393334
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:09:53 +0200 (CEST)
Received: from localhost ([::1]:39838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIa0-00060P-H8
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITq-0004tn-Mo
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:30 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITl-0000L0-H5
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:30 -0400
Received: by mail-wm1-x331.google.com with SMTP id h3so514674wmq.3
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=//WP5NyEkM2KZxOSONWiz5eSL4w73b2EWWIfjaJEJ4I=;
 b=rHRZ6etsOQ+AvtW+bBjoS+rC8NH9LKcwBlL1noc1rDWd9+ak9L4XOzB5vB512aG88p
 sdQIfQ/XpyAZzQ2yvvRxq3B9QymVXeTKI5oziUF+K6bRQtWEr4yPyKsmZweNjyv6tQHZ
 gjKnKmniI0VI9Af8PEaYDX5i1QV7L2yCJx9fnO8oxZ2QtoK38HK0//DyvaBmiiLj74rL
 SNFs+GRagkahQX2xZwMYm/G0HxoXHzetvoYU/zidCZOJpyL6PTiY1LwC04Jkq4rPI0A4
 Ym976A+E2G/Kw74B4F2r8Vm3aRUE5v53d/QM0F8i3Ac7h8YiEsYzWjZR6miiVm7Ud913
 S0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=//WP5NyEkM2KZxOSONWiz5eSL4w73b2EWWIfjaJEJ4I=;
 b=YSLU+l6gviLifpdedSNyH804sYxzd0H4k4P9upB23jZ5PHyIXHqoQwKWu+XAq+fTGI
 DWQPWrd02qJYmg9RwIrQaKGICbV2hK3m2cr0HPRwoC2y8jdBZBjGPSHpT4G1RUYHMpNd
 Eyj3OXztMQRe93/xpjXTCmWfyb0/hnzTgmawd4IgrSSfWzoJTTLNKJfLlvgpKWyx0raQ
 mpwhSR4EbXeSmgvSaOMf0TDuc3Pb6xb7+NHk+ANrWSpSezPZ+HIG06GhhKfduEt2d7Ac
 cMaNTs7oqECuuUFFwCSGeaYLN1UDyzYqHxRhZ3U5n0YbdUKLjdu1AGt7sQLGdVor1fs2
 YYgQ==
X-Gm-Message-State: AOAM530B5XUQOSTUS17BOrfQ9og5Y3+7o8yTZa/jcnqr7w6q1HSeHbnT
 /hq2QSqJqpPTXX3iFuEiE4N5rA==
X-Google-Smtp-Source: ABdhPJwUTsvnhq2uWAW8tQV5kPVws7RSQUD/CweTbLWW+34tO0I3+Y4dyOUY8i+rZ7jV8ehGXMDpig==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr2805019wmg.179.1622131403765; 
 Thu, 27 May 2021 09:03:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q11sm4137559wrx.80.2021.05.27.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:03:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABE351FF8F;
 Thu, 27 May 2021 17:03:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/6] tests/tcg/configure.sh: tweak quoting of
 target_compiler
Date: Thu, 27 May 2021 17:03:16 +0100
Message-Id: <20210527160319.19834-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527160319.19834-1-alex.bennee@linaro.org>
References: <20210527160319.19834-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you configure the host compiler with a multi-command stanza like:

  --cc="ccache gcc"

then the configure.sh machinery falls over with confusion. Work around
this by ensuring we correctly quote so where we need a complete
evaluation we get it. Of course the has() check needs single variable
so we need to unquote that. This does mean it essentially checks that
just the ccache command exits but if we got past that step we still
check the compiler actually does something.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/configure.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index ed6492ce59..aa7c24328a 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -222,10 +222,10 @@ for target in $target_list; do
 
   got_cross_cc=no
 
-  if eval test "x\${cross_cc_$arch}" != xyes; then
-      eval "target_compiler=\${cross_cc_$arch}"
+  if eval test "x\"\${cross_cc_$arch}\"" != xyes; then
+      eval "target_compiler=\"\${cross_cc_$arch}\""
 
-      if has "$target_compiler"; then
+      if has $target_compiler; then
           if test "$supress_clang" = yes &&
                   $target_compiler --version | grep -qi "clang"; then
               got_cross_cc=no
-- 
2.20.1


