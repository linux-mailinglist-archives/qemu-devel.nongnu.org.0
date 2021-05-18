Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362F38752A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:32:39 +0200 (CEST)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw5e-00074t-Be
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp2-00054G-Qi
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livor-00010l-7g
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:27 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 h3-20020a05600c3503b0290176f13c7715so1050236wmq.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mn6SaZ8plyB0/DLAD6T6WLKOaxQYkXa/tSd0uVFivYE=;
 b=T/NAnNMQMtJuJqPGnOvZM9pMZP6qu16G/dwEQ6BUVu1nR3Vrr0ypq/9VjnUL7AKKRS
 ZExWwOuiN7+JpcxMdlODVM8IKjJCuKUCqQpySj4fS27i/LAE7tLwUkROWtBoyDkyf7hH
 1l0WPsib1xqPSo1BjzcJ9dr33Pjg0S3T09zNPzIleq1HPBD2CU5H56d0GHOTgDuMZ9ki
 /yivzFVUwjvYOwg2dkGrLiVM7zdaM2cJCHPViyp0lAFx2chLC39SNcHyM/8ZANlaA1Hy
 XHnc9REZiP61BczUikhk9UJz1aioos5O6SuO6ccVqKYdG2uiQSBrOt8Wq8HepmiX4us7
 CpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mn6SaZ8plyB0/DLAD6T6WLKOaxQYkXa/tSd0uVFivYE=;
 b=nlRHgJ2fIzI8LRwqy+86V/DnjDtCCL9dHmUjoO2ar3EACig99zMspxKSW/XqP5p0xl
 QdtxDfjJSCFhd6JMWiKeZe2EjRj56J8CpUuBLxSkOgo2KMHYI0EgVjHUKtJX0gsF+Eo+
 a6UJbvuZZbF/Vz6W34sdO70J8ltwRlxRt1s35+R8nYqOG06Jz8IT+08Nlv/dDlpkA9cU
 WIG4cV4mX4WjyXpMgmaL8Cv39TUIyssjywX3AYvYHwT3cljyBJbxJUWKrSzch02xQdsL
 02bkkdQLtfYNOS3esmjx/6BH5i8oJ4GKbhQAUJ5rIxlJsUUinqyssb7NIQolSXFYDtrF
 zcGw==
X-Gm-Message-State: AOAM531JtT/ETXwA8b/SO3YyKRGfsxJN1Ygo32+lHgX2/RSoey+a4Wdy
 cvVHjPJGtPamwTAs6A5s3wElvw==
X-Google-Smtp-Source: ABdhPJyDcm2w1Jb/lQzFxY60RBRkAF5LXE/U/X7Sbm3EDAkakxJyvqYM690GIdwDIfkzbk++0tCRIw==
X-Received: by 2002:a7b:c093:: with SMTP id r19mr4319577wmh.35.1621329315938; 
 Tue, 18 May 2021 02:15:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f188sm1977697wmf.24.2021.05.18.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 98E431FFB4;
 Tue, 18 May 2021 10:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 28/29] tests/tcg: don't allow clang as a cross compiler
Date: Tue, 18 May 2021 10:07:19 +0100
Message-Id: <20210518090720.21915-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently there are two problems.

The first is clang generates a preamble (that is always executed) to
stack xmm registers. This causes a ILLOP on the x86_64 softmmu tests
as SSE isn't enabled.

The second is the inline assembler in test-i386.c breaks clangs
compiler and I don't know how to fix it. Even with Theodore's patch
series (D5741445-7EFD-4AF1-8DB2-E4AFA93CBB1A@icloud.com) I still get
compiler failures.

For now lets just skip clang and allow it to fall back to the
containers which we know have compilers which work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210512102051.12134-31-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 6627318adf..ed6492ce59 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -82,6 +82,9 @@ for target in $target_list; do
   container_cross_as=
   container_cross_ld=
 
+  # suppress clang
+  supress_clang=
+
   case $target in
     aarch64-*)
       # We don't have any bigendian build tools so we only use this for AArch64
@@ -119,6 +122,7 @@ for target in $target_list; do
       container_hosts=x86_64
       container_image=fedora-i386-cross
       container_cross_cc=gcc
+      supress_clang=yes
       ;;
     m68k-*)
       container_hosts=x86_64
@@ -186,6 +190,7 @@ for target in $target_list; do
       container_hosts="aarch64 ppc64el x86_64"
       container_image=debian-amd64-cross
       container_cross_cc=x86_64-linux-gnu-gcc
+      supress_clang=yes
       ;;
     xtensa*-softmmu)
       container_hosts=x86_64
@@ -200,6 +205,7 @@ for target in $target_list; do
 
   echo "# Automatically generated by configure - do not modify" > $config_target_mak
   echo "TARGET_NAME=$arch" >> $config_target_mak
+  echo "target=$target" >> $config_target_mak
   case $target in
     *-linux-user | *-bsd-user)
       echo "CONFIG_USER_ONLY=y" >> $config_target_mak
@@ -219,21 +225,26 @@ for target in $target_list; do
   if eval test "x\${cross_cc_$arch}" != xyes; then
       eval "target_compiler=\${cross_cc_$arch}"
 
-      if has $target_compiler; then
-          write_c_skeleton
-          if ! do_compiler "$target_compiler" $target_compiler_cflags \
-                 -o $TMPE $TMPC -static ; then
-              # For host systems we might get away with building without -static
-              if do_compiler "$target_compiler" $target_compiler_cflags \
-                     -o $TMPE $TMPC ; then
+      if has "$target_compiler"; then
+          if test "$supress_clang" = yes &&
+                  $target_compiler --version | grep -qi "clang"; then
+              got_cross_cc=no
+          else
+              write_c_skeleton
+              if ! do_compiler "$target_compiler" $target_compiler_cflags \
+                   -o $TMPE $TMPC -static ; then
+                  # For host systems we might get away with building without -static
+                  if do_compiler "$target_compiler" $target_compiler_cflags \
+                                 -o $TMPE $TMPC ; then
+                      got_cross_cc=yes
+                      echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
+                      echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
+                  fi
+              else
                   got_cross_cc=yes
                   echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
                   echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
               fi
-          else
-              got_cross_cc=yes
-              echo "CROSS_CC_GUEST_STATIC=y" >> $config_target_mak
-              echo "CROSS_CC_GUEST=$target_compiler" >> $config_target_mak
           fi
       fi
   fi
-- 
2.20.1


