Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316E53FA65
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:53:53 +0200 (CEST)
Received: from localhost ([::1]:51382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVuJ-0004yb-PZ
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhi-0007sZ-Px
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhd-0008Oh-0y
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654594844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qmlSKWjAIMfHWVWkEVGUtG8RQRcbg2SLL6dUqS1vtw=;
 b=DCdr8FrTq6YjqlUL+jgfwfLRiaUksBAiCdeFZVEqO+VW6hyLm6DYi6gk1MV5yO75VCNrp+
 V1CMATLmKBK8sY66za5+BNPyyA9HUCxhClvLWT04Pd3djy2QWiR693sls0ZmzEzW4zzkAj
 5CwypP93ELpn6aa3BKIJPeOeAAPntBM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-nXyC49isPkuyGOXLDoYZqg-1; Tue, 07 Jun 2022 05:40:43 -0400
X-MC-Unique: nXyC49isPkuyGOXLDoYZqg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so3549470wms.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3qmlSKWjAIMfHWVWkEVGUtG8RQRcbg2SLL6dUqS1vtw=;
 b=XZBMzIP4x8Vcwv8HJYC+OBexvZ3cjCcEoZpGyJK8En5gP4HPeWoP+bEcY1imZtlAFc
 Pnm/ZvYY4+Yop5QVc4w81vugKEBQf7D2VYm0dG3iKJ8bWfDWYMcgSn9gcFLOqMml/MnE
 kxNSAezOX+0LLqfULsjC2lh6b+e3V8LApHEt7xEoL+mX7nWpPKMCalnTs3bYLf26CD+R
 afmMXIb278hAGqDQKIPYgw62aYdQiGcuFbrrTeFVqUh+yqhvXy+FzGeXKgxLJ204KOQe
 EwAcdruT1hdDDBYT5zSQ/K1ywss73AogjuGo6VrqXOm6nVDkcJvrsGkSUgmanxWUWqGh
 JfGA==
X-Gm-Message-State: AOAM530thMsFgJPFUkjVHHBB+eba/CtdEkP+XB0mZezCvB1yHmM9+f3S
 Lvn6rnFG1XfQWk/x2ro3+xa86GRJeLUsLpjFcZ9HJfSqvqiNk1M/Vqv25VZZv1csycoM1o8Byjw
 lBf6iqP4B2rxko4xJB8Nk6+RBGoNHSsasxvDFZNn/GpuSJ1+REanZZdVaWnTPT7Imx9A=
X-Received: by 2002:a05:600c:a07:b0:39c:350b:f9bc with SMTP id
 z7-20020a05600c0a0700b0039c350bf9bcmr26403343wmp.145.1654594841692; 
 Tue, 07 Jun 2022 02:40:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWLXYnj9fP0vRbX7Vr9HIehL7cccoEOiyxNoKVFe8FLOZNwabja3UJ1+BS/904Mv+r6MeupQ==
X-Received: by 2002:a05:600c:a07:b0:39c:350b:f9bc with SMTP id
 z7-20020a05600c0a0700b0039c350bf9bcmr26403318wmp.145.1654594841330; 
 Tue, 07 Jun 2022 02:40:41 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 d11-20020adffbcb000000b002183ee5c0c5sm4988114wrs.50.2022.06.07.02.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:40:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 4/7] configure: move tests/tcg/Makefile.prereqs to root build
 directory
Date: Tue,  7 Jun 2022 11:40:28 +0200
Message-Id: <20220607094031.1227714-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607094031.1227714-1-pbonzini@redhat.com>
References: <20220607094031.1227714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

It will not be specific to tests/tcg anymore once it will be possible to
build firmware using container-based cross compilers too.  Prepare for that
already, after all Makefile.prereqs is not _used_ by tests/tcg.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile               |  5 ++++-
 configure              | 15 +++++++--------
 tests/Makefile.include |  3 ---
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index ec4445db9a..9fc750ee70 100644
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
@@ -216,7 +219,7 @@ qemu-%.tar.bz2:
 
 distclean: clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
-	rm -f config-host.mak
+	rm -f config-host.mak Makefile.prereqs
 	rm -f tests/tcg/config-*.mak
 	rm -f config.status
 	rm -f roms/seabios/config.mak
diff --git a/configure b/configure
index 28f8c6188b..6b38b0815c 100755
--- a/configure
+++ b/configure
@@ -2126,6 +2126,7 @@ write_target_makefile() {
 }
 
 write_container_target_makefile() {
+  echo "$1: docker-image-$container_image" >> Makefile.prereqs
   if test -n "$container_cross_cc"; then
     echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
     echo "CCAS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
@@ -2234,6 +2235,8 @@ for f in $LINKS ; do
     fi
 done
 
+echo "# Automatically generated by configure - do not modify" > Makefile.prereqs
+
 # Mac OS X ships with a broken assembler
 roms=
 probe_target_compilers i386 x86_64
@@ -2471,10 +2474,7 @@ if test "$safe_stack" = "yes"; then
 fi
 
 # tests/tcg configuration
-(makefile=tests/tcg/Makefile.prereqs
-echo "# Automatically generated by configure - do not modify" > $makefile
-
-config_host_mak=tests/tcg/config-host.mak
+(config_host_mak=tests/tcg/config-host.mak
 echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
@@ -2570,9 +2570,8 @@ for target in $target_list; do
               ;;
       esac
   elif test -n "$container_image"; then
-      echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
       echo "BUILD_STATIC=y" >> $config_target_mak
-      write_container_target_makefile >> $config_target_mak
+      write_container_target_makefile build-tcg-tests-$target >> $config_target_mak
       case $target in
           aarch64-*)
               echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
@@ -2595,11 +2594,11 @@ for target in $target_list; do
       mkdir -p tests/tcg/$target
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
       echo "EXTRA_CFLAGS=$target_cflags" >> $config_target_mak
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
index 3accb83b13..f4ba4027ea 100644
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
2.36.1



