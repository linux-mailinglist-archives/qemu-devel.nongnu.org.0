Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B55A1CAA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:46:28 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLcJ-00079j-Cc
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKX-0002HT-KZ
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKU-0004YJ-Gz
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgJHID9UA2jAHc0QgjBFfSa7ywjZHF6Jpkt9gAD+Jpc=;
 b=B1rY/6wUS5hgOsrDJHFhULiNXPjxNOxyrfcVdEFTAtVI0Ucg9V6WfJmejlxB+nTgwhF3H4
 sfUA0XSEUc4O+Pw2MCFeIo4rMUW1aN43Q8YirJ5p/U2mglD/bv9ymFAf5B2C9jRzd6/9OQ
 QtZuCNl5U0nQS+NBj5elcf5bZT/05Kk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-R6iql-VVP-miBoXDBw_UHg-1; Thu, 25 Aug 2022 18:28:00 -0400
X-MC-Unique: R6iql-VVP-miBoXDBw_UHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so11492874wma.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tgJHID9UA2jAHc0QgjBFfSa7ywjZHF6Jpkt9gAD+Jpc=;
 b=mNOKWI7kaOHtBrcSGBuFryobS3o1AYpPm/+mPh8Dmu9Vu12KhcbPOuP2e3/ggHPdCp
 RcFZdCL32P652d6rGQgz7BONiIYxTcMKZK/z7J6lMFXGV3CXssG4oPNx9p1nwfEDRrWE
 FodSlKwO/IEzna1aQFXxluuFTMsxMnQLeQE+f2+RE+IZV4JDk5V3yQds07NJTWIY8cms
 gA/sIenXcusRLo0GqxcNJIp/g+9xn3g1bBlSCAYKd0W/GnJmhGinKZeDUjmImkopUZPr
 LxQ00RJHaWLSt0sN7ZDsYihMRTyb1sw6vdmLYzAA3770EbV3Wjm1j2mRLrJ8MYkUcO0A
 Qvqg==
X-Gm-Message-State: ACgBeo2TeqXgJ16cPoHRFoZGI79y/WzkBFpo4x6iNwp7ehXVJpmkSbqP
 wOEnMfEt5ZqRy9hbXFjk//PB9WYM8IGRW0YX4nCgYxeEGd6fxKCrtZ8XXf/WiXTZEvVEtQHra6t
 Kl2aBAGX3MNSMtYxYLLCIr91EFbMpcfzO1cjTjqPeYF2mi8JRXGaoCb81F7zzuSLQjgU=
X-Received: by 2002:adf:eb8e:0:b0:223:a1f6:26b2 with SMTP id
 t14-20020adfeb8e000000b00223a1f626b2mr3401160wrn.216.1661466478677; 
 Thu, 25 Aug 2022 15:27:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Bzgs7NlsLPYy+zXuDPx+ZHyrXCzwlNLlhSGEVy7CfP8/T7CW3CpwWtSYJTUUvbsCDjn4Umw==
X-Received: by 2002:adf:eb8e:0:b0:223:a1f6:26b2 with SMTP id
 t14-20020adfeb8e000000b00223a1f626b2mr3401151wrn.216.1661466478396; 
 Thu, 25 Aug 2022 15:27:58 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c4f4500b003a64f684704sm7439922wmq.40.2022.08.25.15.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 08/20] tests: simplify Makefile invocation for tests/tcg
Date: Fri, 26 Aug 2022 00:27:33 +0200
Message-Id: <20220825222745.38779-9-pbonzini@redhat.com>
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

Remove the DOCKER_SCRIPT and TARGET variable from the Makefile invocation
for tests/tcg.  For DOCKER_SCRIPT, resolve the path to docker.py in configure;
for TARGET, move it to config-$(TARGET).mak and use a symbolic link to break
the cycle.

The symbolic link is still needed because tests/tcg includes dummy config files
for targets that are not buildable.  Once that is cleaned up, the symbolic link
will go away too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                 | 23 ++++++++++++++---------
 tests/Makefile.include    |  9 +++------
 tests/tcg/Makefile.target |  2 +-
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/configure b/configure
index ed18a17013..42952591fc 100755
--- a/configure
+++ b/configure
@@ -1848,6 +1848,9 @@ if test $use_containers = "yes"; then
         podman) container=podman ;;
         no) container=no ;;
     esac
+    if test "$container" != "no"; then
+        docker_py="$python $source_path/tests/docker/docker.py --engine $container"
+    fi
 fi
 
 # cross compilers defaults, can be overridden with --cross-cc-ARCH
@@ -2218,16 +2221,16 @@ write_target_makefile() {
 write_container_target_makefile() {
   echo "EXTRA_CFLAGS=$target_cflags"
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
 
 
@@ -2657,6 +2660,8 @@ for target in $target_list; do
   fi
   if test $got_cross_cc = yes; then
       mkdir -p tests/tcg/$target
+      ln -sf ../config-$target.mak tests/tcg/$target/config-target.mak
+      echo "TARGET=$target" >> $config_target_mak
       echo "QEMU=$PWD/$qemu" >> $config_target_mak
       echo "run-tcg-tests-$target: $qemu\$(EXESUF)" >> $makefile
       tcg_tests_targets="$tcg_tests_targets $target"
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3accb83b13..826b1895f4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -50,23 +50,20 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
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
index e68830af15..f29b0abf17 100644
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
2.37.1



