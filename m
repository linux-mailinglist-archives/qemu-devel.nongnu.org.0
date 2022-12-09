Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0208264819C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bWJ-0004zJ-LT; Fri, 09 Dec 2022 06:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUs-0003yd-40
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUl-0000zB-Ca
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4FMVLMLH7mQP0UGUkVZQ8bdJWPe09jUog+sQJ/g1V0=;
 b=coQG7+pb4vJZfhTpSPHUVDC8bOUGxCVqthFnkKMnT1IvVcrRPhhRU/wt35XjN11WCjCJj2
 3NQE3mZI9BxhbXWpjVQxIHnjlcjfHfRQI/Ap/QPwFmus/C7fCe67aI8Xl+cuQTL70wb/Kk
 Xv16nQpWXGP1mZRO7Ugn7S4mPhz8kQM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-227-mkbZhCWoMmOpKCzFsiHOfA-1; Fri, 09 Dec 2022 06:24:37 -0500
X-MC-Unique: mkbZhCWoMmOpKCzFsiHOfA-1
Received: by mail-ed1-f69.google.com with SMTP id
 f17-20020a056402355100b00466481256f6so1185481edd.19
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s4FMVLMLH7mQP0UGUkVZQ8bdJWPe09jUog+sQJ/g1V0=;
 b=ZBmHv7WDgloj8nusFFcPzylfep272s/qhQbcNzZ+Erte/rlw+eIphwlJKKK9NKHcqS
 AXsv790OOn6n9JLQ45aj3vdJowaoYQ1J2zCF5kpuf8G4DMRZ+rgvTMgXW2UdjIrzsGiq
 fs182wH6GzOY7scQ6qakk7SYMWaMl19GJENEqsMcGeI6EWM/RHY7P+fG51joKwM6RAb2
 URcdAlWeEHzTO1JQHJfsQCXaXRWxKUA382uWEM27h0c9gUhcgBMPX1s7RdJBf/R09ciJ
 BlYYmBNtGL9siOw7i2dCOaDG41OxmH5qrlT2N+F86dsQyzQnhFmjjkOTvTTN5gWTExvA
 DUUg==
X-Gm-Message-State: ANoB5pn2OtNE9zIV+i00dwTMzyhXtlUsbLqXtKADLpP8HeJkTBeZaQx2
 NqUQ6sukxli7zusjULYRl3eUk4OQXXeKAvXVw9vsnm0XZzpvB1RPgkVXR39jqCl8od1p3djIa6Q
 8issfJCwb5R19h+YpTZgPtIjqFnBc+0bYa314VfqPMxUagn6y6NWuKjvTTam+IeFC6i8=
X-Received: by 2002:aa7:dd44:0:b0:461:ac11:2e1e with SMTP id
 o4-20020aa7dd44000000b00461ac112e1emr4508721edw.22.1670585076465; 
 Fri, 09 Dec 2022 03:24:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4S9IMTuQyaurtQbe5L0gRVavo3/D4rrFg4Sn9071m8UtO+LF1UKLggRTtWoxAx9Pf4uZcrew==
X-Received: by 2002:aa7:dd44:0:b0:461:ac11:2e1e with SMTP id
 o4-20020aa7dd44000000b00461ac112e1emr4508709edw.22.1670585076098; 
 Fri, 09 Dec 2022 03:24:36 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d9-20020aa7d5c9000000b004611c230bd0sm522446eds.37.2022.12.09.03.24.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/30] meson: use prefer_static option
Date: Fri,  9 Dec 2022 12:23:48 +0100
Message-Id: <20221209112409.184703-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The option is new in Meson 0.63 and removes the need to pass "static:
true" to all dependency and find_library invocation.  Actually cleaning
up the invocations is left for a separate patch.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                   |  4 +---
 docs/devel/build-system.rst |  3 +--
 meson.build                 | 11 ++++-------
 qga/meson.build             |  2 +-
 4 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index 411dfe977958..6efc2055ce09 100755
--- a/configure
+++ b/configure
@@ -2315,9 +2315,6 @@ fi
 if test "$solaris" = "yes" ; then
   echo "CONFIG_SOLARIS=y" >> $config_host_mak
 fi
-if test "$static" = "yes" ; then
-  echo "CONFIG_STATIC=y" >> $config_host_mak
-fi
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "TARGET_DIRS=$target_list" >> $config_host_mak
 if test "$modules" = "yes"; then
@@ -2540,6 +2537,7 @@ if test "$skip_meson" = no; then
   # Built-in options
   test "$bindir" != "bin" && meson_option_add "-Dbindir=$bindir"
   test "$default_feature" = no && meson_option_add -Dauto_features=disabled
+  test "$static" = yes && meson_option_add -Dprefer_static=true
   test "$pie" = no && meson_option_add -Db_pie=false
   test "$werror" = yes && meson_option_add -Dwerror=true
 
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 189472174340..9db18aff159e 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -311,8 +311,7 @@ dependency will be used::
   sdl_image = not_found
   if not get_option('sdl_image').auto() or have_system
     sdl_image = dependency('SDL2_image', required: get_option('sdl_image'),
-                           method: 'pkg-config',
-                           static: enable_static)
+                           method: 'pkg-config')
   endif
 
 This avoids warnings on static builds of user-mode emulators, for example.
diff --git a/meson.build b/meson.build
index 19b023985325..dced840bfbee 100644
--- a/meson.build
+++ b/meson.build
@@ -18,10 +18,7 @@ sh = find_program('sh')
 cc = meson.get_compiler('c')
 config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
 enable_modules = 'CONFIG_MODULES' in config_host
-enable_static = 'CONFIG_STATIC' in config_host
-
-# Allow both shared and static libraries unless --enable-static
-static_kwargs = enable_static ? {'static': true} : {}
+static_kwargs = {}
 
 # Temporary directory used for files created while
 # configure runs. Since it is in the build directory
@@ -183,7 +180,7 @@ qemu_cflags = config_host['QEMU_CFLAGS'].split()
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
-if enable_static
+if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
@@ -830,7 +827,7 @@ if targetos == 'linux' and have_tools and get_option('mpath').allowed()
                                     kwargs: static_kwargs)
   if libmpathpersist.found()
     mpathlibs += libmpathpersist
-    if enable_static
+    if get_option('prefer_static')
       mpathlibs += cc.find_library('devmapper',
                                      required: get_option('mpath'),
                                      kwargs: static_kwargs)
@@ -1214,7 +1211,7 @@ if not gnutls_crypto.found()
     # Debian has removed -lgpg-error from libgcrypt-config
     # as it "spreads unnecessary dependencies" which in
     # turn breaks static builds...
-    if gcrypt.found() and enable_static
+    if gcrypt.found() and get_option('prefer_static')
       gcrypt = declare_dependency(dependencies: [
         gcrypt,
         cc.find_library('gpg-error', required: true, kwargs: static_kwargs)])
diff --git a/qga/meson.build b/qga/meson.build
index 3cfb9166e5d8..ec67326b25f3 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -22,7 +22,7 @@ have_qga_vss = get_option('qga_vss') \
     Then run configure with: --extra-cxxflags="-isystem /path/to/vss/inc/win2003"''') \
   .require(midl.found() or widl.found(),
            error_message: 'VSS support requires midl or widl') \
-  .require(not enable_static,
+  .require(not get_option('prefer_static'),
            error_message: 'VSS support requires dynamic linking with GLib') \
   .allowed()
 
-- 
2.38.1


