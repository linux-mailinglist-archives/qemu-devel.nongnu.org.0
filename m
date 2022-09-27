Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66535EBFC2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:29:24 +0200 (CEST)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7q7-0005Xj-Ta
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NR-0008HU-Vu
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NQ-00005G-9w
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664272782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cv2s2RMj/yiIy9atQZWzauYp1PxlHA8JgOuTAzR6GEk=;
 b=dmJzQop9ALW/+25PYuSg2MANsZ8xauKzDWi2myDpMFUPS2p00cn61+yROMgGShgfFmh5Ck
 hFsJNTQN2elpZldpo7aiOQ+1D2PECCXLkFlIGGEXDONcfMSUjyzgUEponvKmlmniC6YgyU
 nMMWT36I26sV009VJwJpqwU+zXjHK8I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-567-PyQJyk5OM6CFq2nwv8oMww-1; Tue, 27 Sep 2022 05:59:40 -0400
X-MC-Unique: PyQJyk5OM6CFq2nwv8oMww-1
Received: by mail-ed1-f71.google.com with SMTP id
 x5-20020a05640226c500b00451ec193793so7424058edd.16
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Cv2s2RMj/yiIy9atQZWzauYp1PxlHA8JgOuTAzR6GEk=;
 b=IdeMoLWV6gM3G43vGxtRxoI/qPetDb2ISbDkPWJkFCAAZpRCwOitA3Jlrzt1++TfhU
 RysQJxGhBwgU3TQDyyyDQ2Su5AoqkHgg2K/Ove3nmVjse93zjRcMzMCHaidA1tZRjQP2
 tflRPTEXGzujW2yTDPg1eXkI7YSx0d5wPandj0AIulsqfJhhQyif8U0VNtn+MhgJvVad
 NLm+JH07ltOLxbpuDqn5xyGcSaRFzB+uOkimgSI3I4ENs3/I2O9/QNOHgZIMWhARFQD4
 lLJuEUpZTn8OQ4nY+emNpgWlsgW4YyC2NZnxOUMz65dlARXrvABPK9HPlaWOj74xLmZm
 p36g==
X-Gm-Message-State: ACrzQf3WCZt9h2V0BC1xYJdvW2WpTUBYZxBqctlVlxnu1GrIAmvPWDqW
 lrihIKkxOT3pTs6ek1Kb+cvTBU5aeSffgjEOUqEDJ+Qfbg3qea/QjEiMyyosvZi1U1X8++JaClU
 W2WJykkEZ+1HW5NyMc4EqudN9y7wac2Eml7JJYQNGIJoWPUcUoQnx2SIFX+CKmNPlV/k=
X-Received: by 2002:a17:907:2711:b0:781:d13a:bd15 with SMTP id
 w17-20020a170907271100b00781d13abd15mr22382508ejk.669.1664272778552; 
 Tue, 27 Sep 2022 02:59:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5quwjykfode9Tg9sJrlLphSK0HBkIJjaXfLXh620i0PMCYybFYak+cTc1o97CVgb9sy7micg==
X-Received: by 2002:a17:907:2711:b0:781:d13a:bd15 with SMTP id
 w17-20020a170907271100b00781d13abd15mr22382486ejk.669.1664272778248; 
 Tue, 27 Sep 2022 02:59:38 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a170906769700b0073ddff7e432sm557077ejm.14.2022.09.27.02.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:59:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Subject: [PATCH 5/5] configure, meson: move linker flag detection to meson
Date: Tue, 27 Sep 2022 11:59:21 +0200
Message-Id: <20220927095921.261760-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927095921.261760-1-pbonzini@redhat.com>
References: <20220927095921.261760-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 16 ----------------
 meson.build | 13 +++++++++++++
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index 0a6f57c371..e5f1eb6213 100755
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
@@ -2247,14 +2239,6 @@ if test "$have_ubsan" = "yes"; then
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
index f57a60ac4c..f8c80a5b00 100644
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


