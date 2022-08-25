Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873215A1CCD
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:54:34 +0200 (CEST)
Received: from localhost ([::1]:37630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLk9-00035n-Mt
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKf-0002g4-Sq
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKd-0004eP-VD
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rmDg6BdATaFYQIe6ZoZJwJFuXIDvkid+7HpZZxmT3dU=;
 b=c/INA4QVNQ8+8lvxaXaLg2zr4KCpJV3ghFYv3mH/YtVsQPW6uatHtVHZ0xcFFVuTm4KdSy
 ZfYmUJcZaWtSkqXCXN4799HFU9tsxwx6muMlafhfy8Xf6PhZOon+/GS6SqUW74uWrlUtjX
 6GFPXFejVc5hKs7oxyGQ4F6tZcK/7MU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-e-vSPA4RNzqRMjyb9P6S3w-1; Thu, 25 Aug 2022 18:28:09 -0400
X-MC-Unique: e-vSPA4RNzqRMjyb9P6S3w-1
Received: by mail-wm1-f71.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so11482624wmq.9
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rmDg6BdATaFYQIe6ZoZJwJFuXIDvkid+7HpZZxmT3dU=;
 b=ohHS/hFT43oMcOxfuN5zoPhg65KYfBb+eILPN9XvSjD8+W5KOuyECruI3f6RFp06Qw
 hUSWir2ph25R8YB715bdchEm23FCeQEmLbBqYV3kX9r5hRMX44BvTzdTNY2sR4t0u//6
 jy4zGdbxpIebsRq+aHPOgICt8dzXeT6EwmoH8/xZSDZaOC1MEL8OejjB8KnoXntA7ft3
 IslXiknvBqsJaUJ5jod0pToru2jysefDuOdmpzAQPiQFtEPDOKKJ9t/ql+Pay7ym/VMM
 grJ9OrGi/fvY1pQ8iMiWcZMH4dPBM46U/y2xhTBa5emwXJVRnJQs0s/OTBKJ8hcw/9h4
 A73A==
X-Gm-Message-State: ACgBeo3CEaBeTL24lHP90IA5FGUBHW37Ff7UAHwbmjiDOLiPiQd1su4a
 TvymhCMixcJvYbsCG31hG0eOZselnMS7nHPmrt5bXsEyRmdDYjFqq/mbn55AZ9DF4WioHY5uq5l
 QvUdi9AzE86PzBq9VtX7rOEI+cBsu3cd/FYlE5HQG01kmeh+jDW9/vdQTKsYO9JpdqRc=
X-Received: by 2002:a05:600c:4ca3:b0:3a6:1616:e591 with SMTP id
 g35-20020a05600c4ca300b003a61616e591mr3435625wmp.99.1661466487691; 
 Thu, 25 Aug 2022 15:28:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LtZhZXRqrFv5yI8ez/VgAFuw8bLPh2YHTleVg8kVBzZRwJffhxOtUUlIOeJo5o6VzYLhcwg==
X-Received: by 2002:a05:600c:4ca3:b0:3a6:1616:e591 with SMTP id
 g35-20020a05600c4ca300b003a61616e591mr3435616wmp.99.1661466487356; 
 Thu, 25 Aug 2022 15:28:07 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 l2-20020a5d6742000000b0022546ad3a77sm323054wrw.64.2022.08.25.15.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 13/20] tests/tcg: move compiler tests to Makefiles
Date: Fri, 26 Aug 2022 00:27:38 +0200
Message-Id: <20220825222745.38779-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
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

Further decoupling of tests/tcg from the main QEMU Makefile, and making
the build more similar between the cross compiler case and the vetted
container images.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                                 | 65 +----------------------
 tests/tcg/Makefile.target                 | 10 +++-
 tests/tcg/aarch64/Makefile.softmmu-target |  5 ++
 tests/tcg/aarch64/Makefile.target         |  9 ++++
 tests/tcg/i386/Makefile.target            |  6 +++
 tests/tcg/ppc64/Makefile.target           |  7 +++
 6 files changed, 38 insertions(+), 64 deletions(-)

diff --git a/configure b/configure
index e428cc62e6..8d61863432 100755
--- a/configure
+++ b/configure
@@ -2589,73 +2589,11 @@ for target in $target_list; do
 
   probe_target_compiler $target
   if test $got_cross_cc = yes; then
-      # Test for compiler features for optional tests. We only do this
-      # for cross compilers because ensuring the docker containers based
-      # compilers is a requirememt for adding a new test that needs a
-      # compiler feature.
-
-      echo "BUILD_STATIC=$build_static" >> $config_target_mak
       write_target_makefile >> $config_target_mak
-      case $target in
-          aarch64-*)
-              if do_compiler "$target_cc" $target_cflags \
-                             -march=armv8.1-a+sve -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -march=armv8.1-a+sve2 -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -march=armv8.3-a -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -mbranch-protection=standard -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -march=armv8.5-a+memtag -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
-              fi
-              ;;
-          ppc*)
-              if do_compiler "$target_cc" $target_cflags \
-                             -mpower8-vector -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
-              fi
-              if do_compiler "$target_cc" $target_cflags \
-                             -mpower10 -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
-              fi
-              ;;
-          i386-linux-user)
-              if do_compiler "$target_cc" $target_cflags \
-                             -Werror -fno-pie -o $TMPE $TMPC; then
-                  echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
-              fi
-              ;;
-      esac
   elif test -n "$container_image"; then
+      build_static=y
       echo "build-tcg-tests-$target: docker-image-$container_image" >> $makefile
-      echo "BUILD_STATIC=y" >> $config_target_mak
       write_container_target_makefile >> $config_target_mak
-      case $target in
-          aarch64-*)
-              echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
-              ;;
-          ppc*)
-              echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
-              echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
-              ;;
-          i386-linux-user)
-              echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
-              ;;
-      esac
       got_cross_cc=yes
   fi
   if test $got_cross_cc = yes; then
@@ -2664,6 +2602,7 @@ for target in $target_list; do
       ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
       echo "TARGET=$target" >> $config_target_mak
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
+      echo "BUILD_STATIC=$build_static" >> $config_target_mak
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
       tcg_tests_targets="$tcg_tests_targets $target"
   fi
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 6d588075f2..afbed9dd81 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -40,10 +40,18 @@ endif
 
 # for including , in command strings
 COMMA := ,
+NULL :=
+SPACE := $(NULL) #
+TARGET_PREFIX=tests/tcg/$(TARGET):$(SPACE)
 
 quiet-@ = $(if $(V),,@$(if $1,printf "  %-7s %s\n" "$(strip $1)" "$(strip $2)" && ))
 quiet-command = $(call quiet-@,$2,$3)$1
 
+cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
+cc-option = if $(call cc-test, $1); then \
+    echo "$(TARGET_PREFIX)$1 detected" && echo "$(strip $2)=y" >&3; else \
+    echo "$(TARGET_PREFIX)$1 not detected"; fi
+
 # $1 = test name, $2 = cmd, $3 = desc
 ifeq ($(filter %-softmmu, $(TARGET)),)
 run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
@@ -190,4 +198,4 @@ clean:
 	rm -f $(TESTS) *.o
 
 distclean:
-	rm -f config-target.mak ../config-$(TARGET).mak
+	rm -f config-cc.mak config-target.mak ../config-$(TARGET).mak
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 84a9990f8d..a1368905f5 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -19,6 +19,11 @@ EXTRA_RUNS+=$(MULTIARCH_RUNS)
 CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-march=armv8.3-a, CROSS_CC_HAS_ARMV8_3)) 3> config-cc.mak
+-include config-cc.mak
+
 # building head blobs
 .PRECIOUS: $(CRT_OBJS)
 
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 9837a809dc..fc8d90ed69 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -17,6 +17,15 @@ run-fcvt: fcvt
 	$(call run-test,$<,$(QEMU) $<, "$< on $(TARGET_NAME)")
 	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-march=armv8.1-a+sve,          CROSS_CC_HAS_SVE); \
+	    $(call cc-option,-march=armv8.1-a+sve2,         CROSS_CC_HAS_SVE2); \
+	    $(call cc-option,-march=armv8.3-a,              CROSS_CC_HAS_ARMV8_3); \
+	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
+	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE)) 3> config-cc.mak
+-include config-cc.mak
+
 # Pauth Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 8380f5846a..6f890ab269 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -5,6 +5,12 @@ I386_SRC=$(SRC_PATH)/tests/tcg/i386
 # Set search path for all sources
 VPATH 		+= $(I386_SRC)
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+          $(call cc-option,-fno-pie, CROSS_CC_HAS_I386_NOPIE)) 3> config-cc.mak
+
+-include config-cc.mak
+
 I386_SRCS=$(notdir $(wildcard $(I386_SRC)/*.c))
 ALL_X86_TESTS=$(I386_SRCS:.c=)
 SKIP_I386_TESTS=test-i386-ssse3
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 7db7a3e2b3..f081f1c683 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -4,6 +4,13 @@
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64
 
+config-cc.mak: Makefile
+	$(quiet-@)( \
+	    $(call cc-option,-mpower8-vector,   CROSS_CC_HAS_POWER8_VECTOR); \
+	    $(call cc-option,-mpower10,         CROSS_CC_HAS_POWER10)) 3> config-cc.mak
+
+-include config-cc.mak
+
 ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64_TESTS=bcdsub non_signalling_xscv
 endif
-- 
2.37.1



