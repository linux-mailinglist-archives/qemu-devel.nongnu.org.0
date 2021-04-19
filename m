Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573FD3646A7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:03:21 +0200 (CEST)
Received: from localhost ([::1]:41970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVQm-0003RS-8S
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVId-0003Ur-5V
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:55 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIa-00070B-Nb
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso6496189wmq.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iizzfPGhkn8lyZo+/wpl/UTbuqCuTImLvD1b5kAGalE=;
 b=YUZww2364DApKUBOOFecZAlH3Cjw0njXUMJB/SSvPzE+crGVZ1JzpBkcv0NC9H/5Jj
 u+b+9tw4yH7BDB1cSFhbLwfYY30aAMduALfJdpcfPZr8m6UQdoUf0urf2vO8yuU+IokW
 tooPV0yY3XHdTgywrbl/D6gZg6rhUZsGzANMeOD+k9iEwyxcK50RGkmddNk1HzO6wShs
 Jrpsp1yp7mVU4bO6ohT/RKuJGsWfSiu2lPBHql95w8wIxjej4SgGy2ttShLw+jUDGmww
 n+bvOhCi4jdvvpmbEErIfxvc4E9CUHBftx9+icXhlwtIA9JNaatELaWzTIMzrq3DAUyo
 vnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iizzfPGhkn8lyZo+/wpl/UTbuqCuTImLvD1b5kAGalE=;
 b=YQ59wmSwAjKuukjxnx7HaGcspgZI1EhfQlxueWPKbedjP/sQpxAiF4QFmKWJK8+ft+
 yCmIcg9CjngEShfwjA5xeYeCUOBAPLlacMfctln5BHyaUYtoQACaTRgN8Uw2kCghXTtQ
 yx4CKwBIMX3cKzFdyvvGrbj9OqbBjKilKsBwxOSglpdZufJfg3dcVCKEvdQi2n65BLCf
 pxy0Ytr6RPCBjHcgYWfNUt3ym5oWAO+6t3jW3v1/pDmi5pb7ryiwQ7qnlo/nOBgO01PK
 IC929rK2fyZTB7kJqoQDI1LTXnYzZh290M9QepEwSKtFiysOfqQq80CYQXYUxwBOh9iw
 Itbg==
X-Gm-Message-State: AOAM530ICS0UylD61Mr7rtEkbLe7qKidKDuYxrGZZwyRFknO8d7HpB+X
 lxoHW5uuNMAlcDnWyr0fJRVPSQ==
X-Google-Smtp-Source: ABdhPJzoiOR6QO8/4AOlZEzxr+Of8Vu2QRstzFsPouBgF6H92bO54nV7ybusSriJEY9fjP2ysChCxw==
X-Received: by 2002:a1c:1dd0:: with SMTP id d199mr21577263wmd.54.1618844091428; 
 Mon, 19 Apr 2021 07:54:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 186sm20132107wme.10.2021.04.19.07.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A41E21FF9A;
 Mon, 19 Apr 2021 15:54:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 11/25] tests/tcg: Add docker_as and docker_ld cmds
Date: Mon, 19 Apr 2021 15:54:21 +0100
Message-Id: <20210419145435.14083-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

At least for the TriCore target no easily available c compiler exists.
Thus we need to rely on "as" and "ld". This allows us to run them
through the docker image. We don't test the generation capabilities of
docker images as they are assumed to work.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
[AJB: fix quoting, only handle docker & clear, test -n, tweak commit msg]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.qemu | 15 +++++++++++++++
 tests/tcg/configure.sh  | 17 ++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index a56564660c..2c4617516b 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -22,6 +22,8 @@ quiet-@ = $(if $(V),,@)
 quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
 
 CROSS_CC_GUEST:=
+CROSS_AS_GUEST:=
+CROSS_LD_GUEST:=
 DOCKER_IMAGE:=
 
 -include tests/tcg/config-$(TARGET).mak
@@ -42,6 +44,7 @@ cross-build-guest-tests:
 	$(call quiet-command, \
 	   (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
 	    $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC="$(CROSS_CC_GUEST)" \
+			AS="$(CROSS_AS_GUEST)" LD="$(CROSS_LD_GUEST)" \
 			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=$(CROSS_CC_GUEST_STATIC) \
 			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
 	"BUILD","$(TARGET) guest-tests with $(CROSS_CC_GUEST)")
@@ -59,11 +62,23 @@ DOCKER_COMPILE_CMD="$(DOCKER_SCRIPT) cc \
 		-i qemu/$(DOCKER_IMAGE) \
 		-s $(SRC_PATH) -- "
 
+DOCKER_AS_CMD="$(DOCKER_SCRIPT) cc \
+		--cc $(DOCKER_CROSS_AS_GUEST) \
+		-i qemu/$(DOCKER_IMAGE) \
+		-s $(SRC_PATH) -- "
+
+DOCKER_LD_CMD="$(DOCKER_SCRIPT) cc \
+		--cc $(DOCKER_CROSS_LD_GUEST) \
+		-i qemu/$(DOCKER_IMAGE) \
+		-s $(SRC_PATH) -- "
+
+
 .PHONY: docker-build-guest-tests
 docker-build-guest-tests: docker-image-$(DOCKER_IMAGE)
 	$(call quiet-command, \
 	  (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
 	   $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC=$(DOCKER_COMPILE_CMD) \
+			AS=$(DOCKER_AS_CMD) LD=$(DOCKER_LD_CMD) \
 			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=y \
 			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
 	"BUILD","$(TARGET) guest-tests with docker qemu/$(DOCKER_IMAGE)")
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index bfe9619217..9f304b6c5a 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -75,7 +75,13 @@ fi
 for target in $target_list; do
   arch=${target%%-*}
 
+  # reset all container fields
   container_image=
+  container_hosts=
+  container_cross_cc=
+  container_cross_as=
+  container_cross_ld=
+
   case $target in
     aarch64-*)
       # We don't have any bigendian build tools so we only use this for AArch64
@@ -272,7 +278,16 @@ for target in $target_list; do
       for host in $container_hosts; do
           if test "$host" = "$ARCH"; then
               echo "DOCKER_IMAGE=$container_image" >> $config_target_mak
-              echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> $config_target_mak
+              echo "DOCKER_CROSS_CC_GUEST=$container_cross_cc" >> \
+                   $config_target_mak
+              if test -n "$container_cross_as"; then
+                  echo "DOCKER_CROSS_AS_GUEST=$container_cross_as" >> \
+                      $config_target_mak
+              fi
+              if test -n "$container_cross_ld"; then
+                  echo "DOCKER_CROSS_LD_GUEST=$container_cross_ld" >> \
+                      $config_target_mak
+              fi
           fi
       done
   fi
-- 
2.20.1


