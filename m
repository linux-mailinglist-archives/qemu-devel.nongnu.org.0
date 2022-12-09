Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FC76481D3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:36:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXG-0005wX-7X; Fri, 09 Dec 2022 06:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVq-0004Sn-9s
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVl-0001aE-RI
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XL3SE4D+sFTguF12ERUOqOKoyGEmbAcXchpRDTm09AA=;
 b=YfajYAGymRKajT//1OwwWnIOjFRR4qKXddFbC7tMJ2qfncrUJH/pGIAov2Y/D+uBwnmSGT
 +WqE8rHHjzM7dJaAA6zfwLmREYmpiy0cjoLzl7aps78CoXCxSPNVwSm0EeH7u7hNCkEpws
 kpAAHVJG1NxTzRUkme589Mth4pzZqxQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456-nDCjX1qjMXCyXQ6P3XYEvw-1; Fri, 09 Dec 2022 06:25:45 -0500
X-MC-Unique: nDCjX1qjMXCyXQ6P3XYEvw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hd17-20020a170907969100b007c117851c81so2942875ejc.10
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XL3SE4D+sFTguF12ERUOqOKoyGEmbAcXchpRDTm09AA=;
 b=3VzZPHLGBxnPXZrznN49Wj+dzukN3QsMb0Hv1NcCld8sBfQmKaLuJLxIV/2fL7rwmT
 B8SIjL5WOmhgA9VfOic9vIEpxZg/YvPV6UUSJnROOxh+u0jrBFMYC4pnFYDsOFBWr1Hj
 00I4CyBCt7uc46MPM2ZmFtz4ALNPLkBPGeW7gLgD0cKifp+qCHfvpGtwAq8dIlpuqx3S
 nZdseSFRv3CxWmnt+HJlP8L2MJkaXmhncoTZoEL2sRbV+MtcFChpjfXBnMp+kuDxVI6V
 9awkcwImjhYsba5L7YoWzo7KDACTh5bWK8Yr4HXqtU9L3DMwdgE1fu77jr7gBKULOHS7
 IFjA==
X-Gm-Message-State: ANoB5pngGGUfxa4iGWEAmPA1aLt7F4s5nkBXzglM6gboeoRc5Q3HUePm
 lJ9Rhq2bnFskg2TfSnZgaNcjVZpb+Ixk2RYVPqkomG2B/mBdns65BH57JBDTs0w3AK/pAY27QeF
 XOS6ZicQwAZvg6KWP/MDIkQXy4m0/nvixibO49xRc4i+OpO0KVx2wnXzrlIT8MiZHgUA=
X-Received: by 2002:a05:6402:4029:b0:462:555e:1e95 with SMTP id
 d41-20020a056402402900b00462555e1e95mr5262439eda.35.1670585143766; 
 Fri, 09 Dec 2022 03:25:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4JnnnYDIS7YHQgIjSTdvVc7501fIn8nvhmG2fAv1TB8+SNB8aZXI3ccvaux9x4loieDOM5cA==
X-Received: by 2002:a05:6402:4029:b0:462:555e:1e95 with SMTP id
 d41-20020a056402402900b00462555e1e95mr5262416eda.35.1670585143464; 
 Fri, 09 Dec 2022 03:25:43 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a056402170f00b0045726e8a22bsm513811edu.46.2022.12.09.03.25.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/30] build: move compiler version check to meson
Date: Fri,  9 Dec 2022 12:24:06 +0100
Message-Id: <20221209112409.184703-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Instead of checking with preprocessor defines, use the Meson compiler object.
Because of the mess Apple does with its versioning scheme, check for an
option that was added in clang 6.0 instead of looking at the version number.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 25 -------------------------
 meson.build | 11 +++++++++++
 2 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/configure b/configure
index d5491fc3b986..a7c95535fd01 100755
--- a/configure
+++ b/configure
@@ -1033,31 +1033,6 @@ if test "$targetos" = "bogus"; then
     error_exit "Unrecognized host OS (uname -s reports '$(uname -s)')"
 fi
 
-# Check whether the compiler matches our minimum requirements:
-cat > $TMPC << EOF
-#if defined(__clang_major__) && defined(__clang_minor__)
-# ifdef __apple_build_version__
-#  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
-#   error You need at least XCode Clang v10.0 to compile QEMU
-#  endif
-# else
-#  if __clang_major__ < 6 || (__clang_major__ == 6 && __clang_minor__ < 0)
-#   error You need at least Clang v6.0 to compile QEMU
-#  endif
-# endif
-#elif defined(__GNUC__) && defined(__GNUC_MINOR__)
-# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
-#  error You need at least GCC v7.4.0 to compile QEMU
-# endif
-#else
-# error You either need GCC or Clang to compiler QEMU
-#endif
-int main (void) { return 0; }
-EOF
-if ! compile_prog "" "" ; then
-    error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang v10.0)"
-fi
-
 # Resolve default for --enable-plugins
 if test "$static" = "yes" ; then
   if test "$plugins" = "yes"; then
diff --git a/meson.build b/meson.build
index 01c6ac0045bc..3316ff005cfc 100644
--- a/meson.build
+++ b/meson.build
@@ -190,6 +190,17 @@ endif
 # Compiler flags #
 ##################
 
+foreach lang : all_languages
+  compiler = meson.get_compiler(lang)
+  if compiler.get_id() == 'gcc' and compiler.version().version_compare('>=7.4')
+    # ok
+  elif compiler.get_id() == 'clang' and compiler.has_argument('-Wpragma-pack')
+    # ok
+  else
+    error('You either need GCC v7.4 or Clang v6.0 (or XCode Clang v10.0) to compile QEMU')
+  endif
+endforeach
+
 # default flags for all hosts
 # We use -fwrapv to tell the compiler that we require a C dialect where
 # left shift of signed integers is well defined and has the expected
-- 
2.38.1


