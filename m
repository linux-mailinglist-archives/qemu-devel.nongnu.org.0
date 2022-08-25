Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48CE5A1CA8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:44:50 +0200 (CEST)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLak-0005Rx-0I
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKg-0002h9-6t
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKe-0004ef-EK
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+8qYpeSJB4AUqoAOTgt0i7xsKNnSw4YYorOlcbb7M8=;
 b=WQiCzECltVimRnLENHaIWOPT6CELkCRjqk3r1mxtvEEEWXOolUCt+7ssm2/rGlX0F+l8/W
 o/cYYvU2ioWMrwx2ceULnzRbBlCtNkRxeh1KsEPOONzDb1qnpLBVqzAm4VAULKLnf3nRK4
 tmr90iFQFfOOR93qisJrGeUhbiRwUBQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-hXpNq87PNxStAQcbmyb4xQ-1; Thu, 25 Aug 2022 18:28:10 -0400
X-MC-Unique: hXpNq87PNxStAQcbmyb4xQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay27-20020a05600c1e1b00b003a5bff0df8dso3124308wmb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=f+8qYpeSJB4AUqoAOTgt0i7xsKNnSw4YYorOlcbb7M8=;
 b=cT2sEsQ9CMDexfLPYII4vaQHlO4oYws3RQzBX1YGaMaguuspq3U7qCq6+wFcaVfkK5
 p6rcUeYWZaPx4Wn50TZRl1dA76nEdxGVgA502wr/TOmX0lQbdadOv7HmBfyHSk9Rouug
 WVtOGr5Tr3/eNICvBOBWytSXNdPeV47dXr6E+A+WlDlu6B9KRfbUon5+yJBpb9cvbOHg
 OtqbRKnk8igrYpPlisCvQPZUwFBPkr8QixItP8iEMjjcFhQ2wBULAv6TOZ7Yo98hbhLS
 t4QZVjIt9y8U04H6h5JaP8QE6tsElRGMe3NqXWBpzSJVOG8DSW9fyMp7CQTEyqF0nk2k
 +m5g==
X-Gm-Message-State: ACgBeo2UkgIw1GY+5hZjGRIh+YNB8cZbFt9jCDa/f4F/2e3EsBVIbMXH
 BNeuSaEABDEeoRqu4xIbIgU3MRi+Q5hJLTWepcH5gJI8BzgRiMDqjxMFnsE8l7PnIUh+Qru4Qi7
 p8883vm3B5czGIZ9zfdXCRVireUBEUsR1wQGgbit9zXdXnnSKr4ah4x8GZZgD6tAp5lo=
X-Received: by 2002:a5d:648b:0:b0:222:cb51:a57 with SMTP id
 o11-20020a5d648b000000b00222cb510a57mr3382864wri.287.1661466489241; 
 Thu, 25 Aug 2022 15:28:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4p8aGy2iE3XkZlqGd7lldkcaF7WaTpvXeKGpVgxQMDQYwIar2TJNQouZ01/CWQQuAEch5MbA==
X-Received: by 2002:a5d:648b:0:b0:222:cb51:a57 with SMTP id
 o11-20020a5d648b000000b00222cb510a57mr3382853wri.287.1661466488830; 
 Thu, 25 Aug 2022 15:28:08 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 p19-20020a1c7413000000b003a5c999cd1asm630221wmc.14.2022.08.25.15.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 14/20] configure: move tests/tcg/Makefile.prereqs to root
 build directory
Date: Fri, 26 Aug 2022 00:27:39 +0200
Message-Id: <20220825222745.38779-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It will not be specific to tests/tcg anymore, since it will be possible to
build firmware using container-based cross compilers too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile               |  5 ++++-
 configure              | 15 +++++++--------
 tests/Makefile.include |  3 ---
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index ef0fbb4dee..6fd5b6ac06 100644
--- a/Makefile
+++ b/Makefile
@@ -42,6 +42,9 @@ configure: ;
 ifneq ($(wildcard config-host.mak),)
 include config-host.mak
 
+include Makefile.prereqs
+Makefile.prereqs: config-host.mak
+
 git-submodule-update:
 .git-submodule-status: git-submodule-update config-host.mak
 Makefile: .git-submodule-status
@@ -217,7 +220,7 @@ qemu-%.tar.bz2:
 
 distclean: clean recurse-distclean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak qemu-bundle
+	rm -f config-host.mak Makefile.prereqs qemu-bundle
 	rm -f tests/tcg/config-*.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
diff --git a/configure b/configure
index 8d61863432..6dc6a5a48b 100755
--- a/configure
+++ b/configure
@@ -2219,6 +2219,7 @@ write_target_makefile() {
 }
 
 write_container_target_makefile() {
+  echo "$1: docker-image-$container_image" >> Makefile.prereqs
   echo "EXTRA_CFLAGS=$target_cflags"
   if test -n "$container_cross_cc"; then
     echo "CC=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
@@ -2331,6 +2332,8 @@ for f in $LINKS ; do
     fi
 done
 
+echo "# Automatically generated by configure - do not modify" > Makefile.prereqs
+
 # Mac OS X ships with a broken assembler
 roms=
 if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
@@ -2556,10 +2559,7 @@ if test "$safe_stack" = "yes"; then
 fi
 
 # tests/tcg configuration
-(makefile=tests/tcg/Makefile.prereqs
-echo "# Automatically generated by configure - do not modify" > $makefile
-
-config_host_mak=tests/tcg/config-host.mak
+(config_host_mak=tests/tcg/config-host.mak
 mkdir -p tests/tcg
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
@@ -2592,8 +2592,7 @@ for target in $target_list; do
       write_target_makefile >> $config_target_mak
   elif test -n "$container_image"; then
       build_static=y
-      echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
-      write_container_target_makefile >> $config_target_mak
+      write_container_target_makefile build-tcg-tests-$target >> $config_target_mak
       got_cross_cc=yes
   fi
   if test $got_cross_cc = yes; then
@@ -2603,11 +2602,11 @@ for target in $target_list; do
       echo "TARGET=$target" >> $config_target_mak
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
       echo "BUILD_STATIC=$build_static" >> $config_target_mak
-      echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
+      echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> Makefile.prereqs
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
 done
-echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> $makefile)
+echo "TCG_TESTS_TARGETS=$tcg_tests_targets" >> config-host.mak)
 
 if test "$skip_meson" = no; then
   cross="config-meson.cross.new"
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9ed67721e2..9422ddaece 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -36,9 +36,6 @@ export SRC_PATH
 
 SPEED = quick
 
--include tests/tcg/Makefile.prereqs
-tests/tcg/Makefile.prereqs: config-host.mak
-
 # Per guest TCG tests
 BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TCG_TESTS_TARGETS))
 CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TCG_TESTS_TARGETS))
-- 
2.37.1



