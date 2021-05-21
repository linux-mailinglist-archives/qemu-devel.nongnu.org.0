Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1380438CADE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 18:20:44 +0200 (CEST)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7tD-00028B-5q
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 12:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk7rN-00006z-IL
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:18:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lk7rJ-00082a-Oa
 for qemu-devel@nongnu.org; Fri, 21 May 2021 12:18:49 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so7708247wmf.5
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=//WP5NyEkM2KZxOSONWiz5eSL4w73b2EWWIfjaJEJ4I=;
 b=uc1EnOMELAIwyuEV4ScqjI29sBLUDkCjBuZrUCM0OBYNqNObiVVphuLZ9s0SVhCyam
 xdZDtuEJ7ZQ9Q7HtJW+FFGfvSMZTY0VY1vsCT62Lwc1+CPJbRHehT98VO4mpJC0VxXFt
 2Tl2neU4cf9wSm8zLkKf7IXcxPyLxBU2XdJ6CMFT1/4BMWdXEdZWG487sDGCp/skk0jR
 UFKGVbt/Y+8l7tBLspNZ2+jKFfNeO6SRbX4VQ7yAdN3eJXxO/aT0pdM4hpNabR7hSh39
 OrkY3PDuzLRS5UwWDGbTrJq19ntO7Nba2wnRuoBzATasU9ECa25VqB/24D7nAMsaiQaE
 9oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=//WP5NyEkM2KZxOSONWiz5eSL4w73b2EWWIfjaJEJ4I=;
 b=AzJXoxkXcVgl1/9NKbP6syoZUGQVmoFRJAm+1x0UUFOpVA1/UOqbIxyslGVpCFdeWD
 fShfFoDGN0K4JOs8Csvnn2DM/OO8S9dRATpszhEI8NmrUG4/1wJrANLbDqqWTxpgc1qd
 j+OgFvK0sIv5xkw/pWYOFm+z/euWdSYy6jO97g+Jjoq5FnrMZiA7nYJM3gd1sgEvg6eu
 dqeq/y3ErJ1NkTlPQjlIQGuNcT55ZnFVsLe2juXufaDFcMa7Wllohvf3XxxqJUnTeqYB
 P/qNRENK5e2/2pOW/2DNvfKot5XCJZmncW7adn9rFKChjbBxi2h5oG80zqbJ/OobJpU/
 7aSg==
X-Gm-Message-State: AOAM532YAIdFRERSnsG9pzHTKl3N5B/xnGtRCYZ7AoiaGZcl+hdxkGj/
 wLlHoDvnbZijFHaeC45/dktH7w==
X-Google-Smtp-Source: ABdhPJxrRteSsFuG2y7iLCih3B6FhuTgguNRBs7d+zABcPBU/TJYQibuK18RGLkDlWYtQLVKT5n9rQ==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr10011623wmq.9.1621613923313;
 Fri, 21 May 2021 09:18:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v12sm2369552wrv.76.2021.05.21.09.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 09:18:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 705FD1FF7E;
 Fri, 21 May 2021 17:18:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/tcg/configure.sh: tweak quoting of target_compiler
Date: Fri, 21 May 2021 17:18:30 +0100
Message-Id: <20210521161830.30050-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
Cc: peter.maydell@linaro.org, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


