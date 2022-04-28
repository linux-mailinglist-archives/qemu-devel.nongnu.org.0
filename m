Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C107A512CFF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:35:50 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njygn-0003h7-Sy
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy24-0000EJ-TL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njy23-00055Y-7A
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:53:44 -0400
Received: by mail-ed1-x530.google.com with SMTP id y21so4410596edo.2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eWVoNFg17cglqQICzMxJj6RBiNCEoEjYKsESWBBr/7w=;
 b=ierrJpoe3K0/aMvDWwp52ZWelIQkIaHWS/JozVYvVGIMvnWwxPrDmKPQlMw2NL4FrU
 LNDjVxn+Kc9Rk6MMYs7atkYa0tKfvJALSruHRsUASDrJb4TtGclJb85oEhsUWGTe/dGy
 zf/hFtZjy6I232kJoNvhRKxT8GrLXX+e24oyhUCdpu6hsPg4ngLJ4mCkvtteXLwFpjy/
 Jom+CXofOdc2ncBucWBPmsOoIFhui7/Tk8bDNXT8WlQmx065taHN8Gw/UMwX/UwEY5Ef
 7jgeGsngT3pSCs+Bg4UHKzoQe4vAvz2FPwKnmrelR9/TU1hACsAO/igVGN07OWquz8ie
 JvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=eWVoNFg17cglqQICzMxJj6RBiNCEoEjYKsESWBBr/7w=;
 b=ve1gzSZRPZOq3iZegR5JfSlKnIQWbWxK+0/c7bOpw7ON8wMu2QEFGM1DH/ya2thlDE
 hvXrG3uu+eOjjQ1ffUjoLajlO7yhLKohsmsslir5KdkuKcIfwVzIzsNqkLvwvRY2UV8o
 Vx5ozcaz9nSa+dc2JGWxafoiIBCOvy9guAOjnY5rMkBtVDrUyFMwL6fFQAyUlD/kVqQm
 cbLUYpRCE44dcOHMuCEBwZS8OclseK0f9tgMkJkLGP7j+HzQJqaRsQojNCRmaS+oa2od
 M5MNITsOR+0q619qW2wAUrC9sMUhqHjzeZAWI4OeUfji1AvPAPdz+EB/6uVkgTlHsa3d
 hYgg==
X-Gm-Message-State: AOAM533UqfQXB2G/NUiEXQIDcgiYMY+/tPITc4VAth5jw3eqqHhGw/X/
 h3RBzacGQ+/bC/igy3YJSH/b9mnD/6JXnw==
X-Google-Smtp-Source: ABdhPJyi6BtMvHV1leuTMtqA/1dI5AlDjuE2vBRkL0LCYEPxfmWhRipYALlZ6K//yVwnsHcRaIJ/bA==
X-Received: by 2002:a05:6402:f18:b0:425:df36:6e99 with SMTP id
 i24-20020a0564020f1800b00425df366e99mr23633191eda.303.1651128821661; 
 Wed, 27 Apr 2022 23:53:41 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm5406804ejb.158.2022.04.27.23.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 23:53:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] configure: remove dead code
Date: Thu, 28 Apr 2022 08:53:23 +0200
Message-Id: <20220428065335.189795-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
References: <20220428065335.189795-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tcg_interpreter is never written, it is purely a meson option;
trace_backends is never read.

And SeaBIOS is only build from the source tree with roms/Makefile,
so the config.mak file is unused.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/configure b/configure
index a4942c13e4..9e32c96fce 100755
--- a/configure
+++ b/configure
@@ -320,7 +320,6 @@ linux_user=""
 bsd_user=""
 pkgversion=""
 pie=""
-trace_backends="log"
 trace_file="trace"
 opengl="$default_feature"
 coroutine=""
@@ -391,7 +390,6 @@ for opt do
                       cross_cc_vars="$cross_cc_vars cross_cc_cflags_${cc_arch}"
   ;;
   --cross-cc-*) cc_arch=${opt#--cross-cc-}; cc_arch=${cc_arch%%=*}
-                cc_archs="$cc_archs $cc_arch"
                 eval "cross_cc_${cc_arch}=\$optarg"
                 cross_cc_vars="$cross_cc_vars cross_cc_${cc_arch}"
   ;;
@@ -2881,9 +2879,6 @@ fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
-if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
-  echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
-fi
 
 if test "$opengl" = "yes" ; then
   echo "CONFIG_OPENGL=y" >> $config_host_mak
@@ -3024,7 +3019,6 @@ LINKS="Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
-LINKS="$LINKS roms/seabios/Makefile"
 LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
 LINKS="$LINKS tests/avocado tests/data"
@@ -3059,24 +3053,6 @@ done
 export target_list source_path use_containers cpu host_cc
 $source_path/tests/tcg/configure.sh)
 
-# temporary config to build submodules
-if test -f $source_path/roms/seabios/Makefile; then
-  for rom in seabios; do
-    config_mak=roms/$rom/config.mak
-    echo "# Automatically generated by configure - do not modify" > $config_mak
-    echo "SRC_PATH=$source_path/roms/$rom" >> $config_mak
-    echo "AS=$as" >> $config_mak
-    echo "CCAS=$ccas" >> $config_mak
-    echo "CC=$cc" >> $config_mak
-    echo "BCC=bcc" >> $config_mak
-    echo "CPP=$cpp" >> $config_mak
-    echo "OBJCOPY=objcopy" >> $config_mak
-    echo "IASL=$iasl" >> $config_mak
-    echo "LD=$ld" >> $config_mak
-    echo "RANLIB=$ranlib" >> $config_mak
-  done
-fi
-
 config_mak=pc-bios/optionrom/config.mak
 echo "# Automatically generated by configure - do not modify" > $config_mak
 echo "TOPSRC_DIR=$source_path" >> $config_mak
-- 
2.35.1



