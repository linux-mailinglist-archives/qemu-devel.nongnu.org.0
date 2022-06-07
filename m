Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9365853FA15
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:44:39 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVlN-0002aO-VD
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhi-0007sa-SV
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhg-0008PT-VG
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654594848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mn9CKLXxBusFji1dUgXJShmDAf/CuJ2dsTOawN0KEbU=;
 b=MO5ycVWWFFpPiA8WPYa7y53kJeAxm7U2fe/JPWAwEB7WfNpJkxw1yC7IBp1yfeKeFdpwv9
 j5lqE0lcWWWlZQOrY3ElhwGEtwO9sZ+lhcKJJF+hEEucvMG4xUzP6OZvb5WA1PjYqyz4SL
 1jL1z5HV3tmvrxcs8yAwHn+gXzoafJk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-mRPg25ODMk-W0-UOuyd8Uw-1; Tue, 07 Jun 2022 05:40:47 -0400
X-MC-Unique: mRPg25ODMk-W0-UOuyd8Uw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i30-20020a1c541e000000b0039c1bf9739fso5541338wmb.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mn9CKLXxBusFji1dUgXJShmDAf/CuJ2dsTOawN0KEbU=;
 b=4kje2GwPxg4Aj3acv/Le+OccgR8Wd/Kb/9B1hbqrPRxno6n+EuYleirJrh4FEtRpsM
 2VAidCgQDyqCoom7ZBDwGycxiXQChJTSDUT6+O8NdaplCsONCef9olz32WhBTdCxqdFf
 o/eEwL1D0oTqtQgmLL70Gz+RQgniPuJ9H1l/RTSGHDdhH38wm29jm6o2HNmCH9SrM2a7
 gMZ1miAg//KrmC9OCBhc0Yf9kaQMssS9rqZgWT65oEj49XSnneD/BeUaxyDS6U1VWEPr
 ttO/HClfBQLntmjNMfT7rPKodUsUi8LGyROIuYdkHFJIT/lLewd+ykF59IybYz65gmbs
 8h1w==
X-Gm-Message-State: AOAM532ItjsBevnNwzXRJyeLemc0Xojnk9r2CK195p7mOtZqJvEzbK39
 mKqlSh1GZ5mCQQCkvhNHuEHrFob7FPzko6dcyWo98LiaQ4Vk1IPOqZNTQzk2P5RM8BpzDyWWLG8
 CBl5f1VqnBn9LS2GDqdfQBuGEH0wlSIGivbfZUDvjGCwG+wwYc9JR0NiEzrDD+JU5aOg=
X-Received: by 2002:a5d:6786:0:b0:215:3cb5:b16c with SMTP id
 v6-20020a5d6786000000b002153cb5b16cmr19600653wru.6.1654594845385; 
 Tue, 07 Jun 2022 02:40:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwsuxWpYDEu0zCNDbwOxJJDqfcJt2Xt3DYTxeXy27nY+d1NrYYIuSML87wkPSX6mV6A5tDpQ==
X-Received: by 2002:a5d:6786:0:b0:215:3cb5:b16c with SMTP id
 v6-20020a5d6786000000b002153cb5b16cmr19600616wru.6.1654594844894; 
 Tue, 07 Jun 2022 02:40:44 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c4f0d00b0039c55bc2c97sm3162247wmq.16.2022.06.07.02.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:40:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 6/7] tests: simplify Makefile invocation for tests/tcg
Date: Tue,  7 Jun 2022 11:40:30 +0200
Message-Id: <20220607094031.1227714-7-pbonzini@redhat.com>
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

The tests/tcg Makefile invocation contains the paths to DOCKER_SCRIPT
and TARGET.

One can just resolve the path to docker.py in configure so that submakes
do not need the DOCKER_SCRIPT variable.  In order to remove the TARGET
variable, create a config-target.mak file in tests/tcg/$TARGET.  For now
config-$target.mak is created before the check for compiler presence,
while tests/tcg/$TARGET is created afterwards.  This is temporary.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                 | 23 ++++++++++++++---------
 tests/Makefile.include    |  9 +++------
 tests/tcg/Makefile.target |  2 +-
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index 0fd5a3cfad..9d49ea4c5b 100755
--- a/configure
+++ b/configure
@@ -1824,6 +1824,9 @@ if test $use_containers = "yes"; then
         podman) container=podman ;;
         no) container=no ;;
     esac
+    if test "$container" != "no"; then
+        docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+    fi
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
@@ -2130,16 +2133,16 @@ write_target_makefile() {
 write_container_target_makefile() {
   echo "$1: docker-image-$container_image" >> Makefile.prereqs
   if test -n "$container_cross_cc"; then
-    echo "CC=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
-    echo "CCAS=\$(DOCKER_SCRIPT) cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    echo "CC=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
+    echo "CCAS=$docker_py cc --cc $container_cross_cc -i qemu/$container_image -s $source_path --"
   fi
-  echo "AR=\$(DOCKER_SCRIPT) cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
-  echo "AS=\$(DOCKER_SCRIPT) cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
-  echo "LD=\$(DOCKER_SCRIPT) cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
-  echo "NM=\$(DOCKER_SCRIPT) cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
-  echo "OBJCOPY=\$(DOCKER_SCRIPT) cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
-  echo "RANLIB=\$(DOCKER_SCRIPT) cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
-  echo "STRIP=\$(DOCKER_SCRIPT) cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
+  echo "AR=$docker_py cc --cc $container_cross_ar -i qemu/$container_image -s $source_path --"
+  echo "AS=$docker_py cc --cc $container_cross_as -i qemu/$container_image -s $source_path --"
+  echo "LD=$docker_py cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
+  echo "NM=$docker_py cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
+  echo "OBJCOPY=$docker_py cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+  echo "RANLIB=$docker_py cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
+  echo "STRIP=$docker_py cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
 }
 
 
@@ -2597,6 +2600,8 @@ for target in $target_list; do
   fi
   if test $got_cross_cc = yes; then
       mkdir -p tests/tcg/$target
+      ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
+      echo "TARGET=$target" >> $config_target_mak
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
       echo "EXTRA_CFLAGS=$target_cflags" >> $config_target_mak
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> Makefile.prereqs
diff --git a/tests/Makefile.include b/tests/Makefile.include
index f4ba4027ea..f2182ead1e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -47,23 +47,20 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
 .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
 	$(call quiet-command, \
-            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        DOCKER_SCRIPT="$(DOCKER_SCRIPT)" \
-                        TARGET="$*" SRC_PATH="$(SRC_PATH)", \
+            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS), \
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        TARGET="$*" SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run, \
+                        SPEED=$(SPEED) run, \
         "RUN", "$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%)
 $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
 	$(call quiet-command, \
-           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
-                        TARGET="$*" SRC_PATH="$(SRC_PATH)" clean, \
+           $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) clean, \
         "CLEAN", "$* guest-tests")
 
 .PHONY: build-tcg
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index f427a0304e..1e1c7097c6 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -31,7 +31,7 @@
 
 all:
 -include ../config-host.mak
--include ../config-$(TARGET).mak
+-include config-target.mak
 
 # Get semihosting definitions for user-mode emulation
 ifeq ($(filter %-softmmu, $(TARGET)),)
-- 
2.36.1



