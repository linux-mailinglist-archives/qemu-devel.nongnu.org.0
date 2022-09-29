Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F035EFCC3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:13:36 +0200 (CEST)
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ody2R-0000Oh-Io
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwR1-0003kB-JL
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQv-00037I-Qk
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UjY/Jq0lPx63CQPxnhr1RzSewXNLSU5XzcmJxfZ8oUE=;
 b=htfrPPjLDKJpW7e50yV0k8ip88bDC4gsOwidpGXSGX3M0q0JEOvh80H8TYujMK2EcxP5XT
 G6mWRiGIFw0lfv9gdfL1piSU8K7XAOYO4LjJcOapz949Qs55/cU2lbuylJ28Mx/WTgxo9f
 3Y4ZOB4g+YANXAikCxp5OqsSYrfBiaI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-Kpp0_TqCMheyqodmI1ZCLw-1; Thu, 29 Sep 2022 12:30:43 -0400
X-MC-Unique: Kpp0_TqCMheyqodmI1ZCLw-1
Received: by mail-ed1-f70.google.com with SMTP id
 s17-20020a056402521100b004511c8d59e3so1670666edd.11
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UjY/Jq0lPx63CQPxnhr1RzSewXNLSU5XzcmJxfZ8oUE=;
 b=n3YKLAvG8GT4dJsbOhtSPY8NrIyIcJ8Kj7s8e4m5Fvapm0mXnQAlygH4e0wyEqcCBx
 u5RdTutv7XMGyEEzYyPWmQ3teNbcvqtmcDMHryRXXbVQbdJEvAPfUMeoC709WP4bDXV/
 MyF6gHqBG4pZrCh+o7x2xSr7WfXd8TgebyThmua3W3GjmJU9IjgAE7h0yrjwgI+fj5lv
 nVX9F+T5IAR6ZrRGPRqNrQucte5yl42cq5uVyHkvSLIHYiR8vgPwoJhw7JN4BnNAa72Y
 d/v1h7gE6Lec9RQ4i1+Su+y89QhMciGRsZ5LJVZvVXgWGZwOAeuVpu6Ce2+TYotdE9MA
 salw==
X-Gm-Message-State: ACrzQf3h6/ni7k1KANixHVqDKQLcH5zL5rYP8LNfuddEPsvnJKap1BWs
 cl5OLzKq08TqT/XcRHHBazk3CuowhUjkpnRGB0+mu6MAecA1Gz38RRW3hzpv1vpFymEecSx1/ju
 aw66D8mQqRIaer5tVHBgLGgu7gnuct6HL67tPJhb5fljMrN9oUUvDUc0kx+jCBwuv0VQ=
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr3382677ejc.755.1664469042195; 
 Thu, 29 Sep 2022 09:30:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4CQ6YbL+xTRBMZazjs7x2AwSEkrJDEzsLYsSmlKxbw+0b6OlqdrIhmCuGnuISqIBhM63zDNw==
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr3382654ejc.755.1664469041950; 
 Thu, 29 Sep 2022 09:30:41 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 dk9-20020a0564021d8900b0043df042bfc6sm5633028edb.47.2022.09.29.09.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 09/14] meson: require 0.61.3
Date: Thu, 29 Sep 2022 18:30:09 +0200
Message-Id: <20220929163014.16950-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This removes the dependency of dbus-display on --enable-modules.  It also allows
cleanups in modinfo collection and allows moving C++ compiler detection to
meson.build.

Because it is now deprecated to use install_subdir to create an empty directory,
replace it with install_emptydir.

Updating the Meson submodule to 0.61.5 also removes the message

    WARNING: Broken python installation detected. Python files installed
    by Meson might not be found by python interpreter.

unless using system meson is forced with --meson.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/873
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/848
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure       | 2 +-
 meson           | 2 +-
 meson.build     | 5 +----
 qga/meson.build | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 894e37310f..c5069775db 100755
--- a/configure
+++ b/configure
@@ -1114,7 +1114,7 @@ fi
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.59.3; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.61.5; then
         meson=meson
     elif test "$git_submodules_action" != 'ignore' ; then
         meson=git
diff --git a/meson b/meson
index 12f9f04ba0..3a9b285a55 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
+Subproject commit 3a9b285a55b91b53b2acda987192274352ecb5be
diff --git a/meson.build b/meson.build
index 3885fc1076..8c1139a82b 100644
--- a/meson.build
+++ b/meson.build
@@ -1,4 +1,4 @@
-project('qemu', ['c'], meson_version: '>=0.59.3',
+project('qemu', ['c'], meson_version: '>=0.61.3',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
                           'b_staticpic=false', 'stdsplit=false', 'optimization=2', 'b_pie=true'],
         version: files('VERSION'))
@@ -1669,12 +1669,9 @@ endif
 have_host_block_device = (targetos != 'darwin' or
     cc.has_header('IOKit/storage/IOMedia.h'))
 
-# FIXME enable_modules shouldn't be necessary, but: https://github.com/mesonbuild/meson/issues/8333
 dbus_display = get_option('dbus_display') \
   .require(gio.version().version_compare('>=2.64'),
            error_message: '-display dbus requires glib>=2.64') \
-  .require(enable_modules,
-           error_message: '-display dbus requires --enable-modules') \
   .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
   .require(opengl.found() and gbm.found(),
diff --git a/qga/meson.build b/qga/meson.build
index 65c1e93846..a0ffd6d268 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -138,7 +138,7 @@ else
   if get_option('guest_agent_msi').enabled()
     error('MSI guest agent package is available only for MinGW Windows cross-compilation')
   endif
-  install_subdir('run', install_dir: get_option('localstatedir'))
+  install_emptydir(get_option('localstatedir') / 'run')
 endif
 
 alias_target('qemu-ga', all_qga)
-- 
2.37.3


