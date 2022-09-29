Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E15EFC08
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:32:31 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxOf-0006qv-8x
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwR6-0003mk-TX
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwR5-000389-C0
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXxWqtCuAF+FsHQxb4jKS3YZKYzYr+qDiDGVxpCRZYs=;
 b=W7r02gTUccEpgG4arNVmm8Tm+uZoh8WyJrvYeqKbi5XpImK2UJDBg0qNhfyj26DOJBDdDu
 xT98HVF8IyblqtWdHzJWejtRgvKuZlFdDwUvJB71s122WOH8m+8q312rC3Amu9+suDju1F
 haYWO3ih6U5hh7fKX/nRa0dAc9l+hmg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-xW5nPv98N4aSApHtBQgicQ-1; Thu, 29 Sep 2022 12:30:52 -0400
X-MC-Unique: xW5nPv98N4aSApHtBQgicQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 sb34-20020a1709076da200b00783a5f786easo969924ejc.22
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xXxWqtCuAF+FsHQxb4jKS3YZKYzYr+qDiDGVxpCRZYs=;
 b=2EkuNZryQpvbyv/YoaXh9dk/U3bcRQAMe/42YX6tvzfzWOY7RqWxQ6iWiKXVmyR5gF
 SK7Xztp5caJQ+/ygq/QmOBlOcZcFGW07Ejk4cwT9ADaIfgGfDGSrxL6O2XfKMeEzk8AO
 DN5ioBmuRHDzFQgH9SchFZoVGyShF9sUUwy3lYVLnl22oTKdJnnrcJRz3JRw1sM01klw
 KNCNK4YIq3wc7HVN8NidniYvSjTWF+dDj65XRSK/qJASoc1LxbIzNF6WtTc+BJMX0zxX
 OY8OSzozYsFhen6n6mSmmE3/IiuEC/jBWVP2o0Hkj0tZrWipyfEPHwRGxciO4/N25YDK
 fl5A==
X-Gm-Message-State: ACrzQf23yJ/pfMSYHOy6P73lHeQ5xJ735n87NkdsAaIZI4vMSH6fFttJ
 zk/gOp+V9cFujSsNWsY2xnYAY22F822HMWHtqIbf1Xt0xoU5YRT/4QXXznZ89P+/RyjiehdvGFI
 lDQTgn1scAkQvFK43uQhmOUddzQfG5p7P511yoPt+BAD4pLHde3qVPAtScEmgoJo+Fs0=
X-Received: by 2002:a17:906:8a4a:b0:781:70ab:e7cb with SMTP id
 gx10-20020a1709068a4a00b0078170abe7cbmr3309099ejc.492.1664469050787; 
 Thu, 29 Sep 2022 09:30:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Bds7YivMfkbnNm4qWAiZ9pAriQOS3UGuBHyLPW4z0By1eqwXXOTmQQLK7SIiBJLgJgzq7cA==
X-Received: by 2002:a17:906:8a4a:b0:781:70ab:e7cb with SMTP id
 gx10-20020a1709068a4a00b0078170abe7cbmr3309082ejc.492.1664469050435; 
 Thu, 29 Sep 2022 09:30:50 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a17090631c700b007803083a36asm4149159ejf.115.2022.09.29.09.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 12/14] configure, meson: move linker flag detection to meson
Date: Thu, 29 Sep 2022 18:30:12 +0200
Message-Id: <20220929163014.16950-13-pbonzini@redhat.com>
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 16 ----------------
 meson.build | 13 +++++++++++++
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index 3e3c0f36c9..e032bd0a08 100755
--- a/configure
+++ b/configure
@@ -1342,12 +1342,10 @@ EOF
 if test "$static" = "yes"; then
   if test "$pie" != "no" && compile_prog "-Werror -fPIE -DPIE" "-static-pie"; then
     CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
-    QEMU_LDFLAGS="-static-pie $QEMU_LDFLAGS"
     pie="yes"
   elif test "$pie" = "yes"; then
     error_exit "-static-pie not available due to missing toolchain support"
   else
-    QEMU_LDFLAGS="-static $QEMU_LDFLAGS"
     pie="no"
   fi
 elif test "$pie" = "no"; then
@@ -1369,12 +1367,6 @@ else
   pie="no"
 fi
 
-# Detect support for PT_GNU_RELRO + DT_BIND_NOW.
-# The combination is known as "full relro", because .got.plt is read-only too.
-if compile_prog "" "-Wl,-z,relro -Wl,-z,now" ; then
-  QEMU_LDFLAGS="-Wl,-z,relro -Wl,-z,now $QEMU_LDFLAGS"
-fi
-
 ##########################################
 # __sync_fetch_and_and requires at least -march=i486. Many toolchains
 # use i686 as default anyway, but for those that don't, an explicit
@@ -2242,14 +2234,6 @@ if test "$have_ubsan" = "yes"; then
 fi
 
 ##########################################
-
-# Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
-if test "$solaris" = "no" && test "$tsan" = "no"; then
-    if $ld --version 2>/dev/null | grep "GNU ld" >/dev/null 2>/dev/null ; then
-        QEMU_LDFLAGS="-Wl,--warn-common $QEMU_LDFLAGS"
-    fi
-fi
-
 # Guest agent Windows MSI package
 
 if test "$QEMU_GA_MANUFACTURER" = ""; then
diff --git a/meson.build b/meson.build
index a1b265b133..f6962834a3 100644
--- a/meson.build
+++ b/meson.build
@@ -183,6 +183,14 @@ qemu_cflags = config_host['QEMU_CFLAGS'].split()
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
+if enable_static
+  qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
+endif
+
+# Detect support for PT_GNU_RELRO + DT_BIND_NOW.
+# The combination is known as "full relro", because .got.plt is read-only too.
+qemu_ldflags += cc.get_supported_link_arguments('-Wl,-z,relro', '-Wl,-z,now')
+
 if targetos == 'windows'
   qemu_ldflags += cc.get_supported_link_arguments('-Wl,--no-seh', '-Wl,--nxcompat')
   # Disable ASLR for debug builds to allow debugging with gdb
@@ -265,6 +273,11 @@ if add_languages('cpp', required: false, native: false)
   endif
 endif
 
+# Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
+if targetos != 'sunos' and not config_host.has_key('CONFIG_TSAN')
+  qemu_ldflags += linker.get_supported_link_arguments('-Wl,--warn-common')
+endif
+
 add_global_link_arguments(qemu_ldflags, native: false, language: ['c', 'cpp', 'objc'])
 
 if targetos == 'linux'
-- 
2.37.3


