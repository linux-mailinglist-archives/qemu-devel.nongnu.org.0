Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4625E37BAFF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:42:11 +0200 (CEST)
Received: from localhost ([::1]:36230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmJe-00078o-8b
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8X-0000aM-94
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:41 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8M-0000ZQ-QH
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id z17so4002648wrq.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPq9uGOdfE2STV15D/gtYtThg7p+C48gB81bHaUpG4E=;
 b=P+NzgoOlr6njhzjVrNlIZ8tvcdsTsy/ik5QjmRKTJZ8T7DBl8d/dKYdEQBiCOdpuEy
 j3jXH0dI3v0+pLdEElffZlQ1TkRZOF6cdDNnle+eYaLcbYvWt7SlVGCkRhbSsetV5Tas
 8BkTiJuc8e02LD9/EJcjHAKgGLSuB32z3KSjmiGtbgJeilAktMVhB2PQUZH1sFy1ZYWE
 lIUiYvRtlkstraW10HRYxk2CV1TOtkvrdQv1FUrSmcmhyxrpJUYixV0kJta8NTl4lTGD
 hFFPxUMi66S75ipuB3op5iiGELcJ/Hkd1sKEz6QAnAcvi/X9ttcLLpqkn6PtKDDfoIhR
 UGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPq9uGOdfE2STV15D/gtYtThg7p+C48gB81bHaUpG4E=;
 b=CdpqM3Qw/oHs9dMtaVjEJww43XmAL21ISpxNl0KHPg2rRyZQdhZVxVQ2c6dwWuxsZI
 ItMTG5wDp4UPuEMLlDSYprulJB2p1LbOUt3Zb9mIcZH25vK0jdiSSyicrhdbg5d7+UAy
 11cHEj6DtaRdrs7HcLdZdtl00614vHZsw8+wWu1JnSOI+re+HKSO/IEe3L1dL5RNsLpG
 wEZ/tioUPBpfxLSkiKSxhzSRaHd/Q/o3DkwMm411+bq5F2EovYeP/wq+UVIsNSmMPds7
 qyuvbk8GlfbTy6iz0PDb64X5RaI5kGigQ3sqT4QH0AmV3J09BdB8ZJXiv4EMlNCXbZm7
 a/AA==
X-Gm-Message-State: AOAM5329JOTOvgyzMqbeM0OqwowkQDu2sy+bAbOg2zzJmrTXgVrxvama
 ZXjwj2HXNFK/NhiQKGJrU8rELw==
X-Google-Smtp-Source: ABdhPJxVf7c/zCJKKTjhV7f2jT3WaEdI+GnvXErjCHGqzNv8hq3+0ShCqzRHbObQ0NeWwMFaGcOfDA==
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr45984304wri.66.1620815427667; 
 Wed, 12 May 2021 03:30:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y17sm33738807wrw.90.2021.05.12.03.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 385111FF9A;
 Wed, 12 May 2021 11:20:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 11/31] tests/tcg: Add docker_as and docker_ld cmds
Date: Wed, 12 May 2021 11:20:31 +0100
Message-Id: <20210512102051.12134-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
[AJB: fix quoting, only handle docker & clear, test -n, tweak commit msg]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - only pass down AS/LD if defined
---
 tests/tcg/Makefile.qemu | 17 +++++++++++++++++
 tests/tcg/configure.sh  | 17 ++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index a56564660c..84c8543878 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -22,6 +22,8 @@ quiet-@ = $(if $(V),,@)
 quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
 
 CROSS_CC_GUEST:=
+CROSS_AS_GUEST:=
+CROSS_LD_GUEST:=
 DOCKER_IMAGE:=
 
 -include tests/tcg/config-$(TARGET).mak
@@ -42,6 +44,8 @@ cross-build-guest-tests:
 	$(call quiet-command, \
 	   (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
 	    $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC="$(CROSS_CC_GUEST)" \
+			$(if $(CROSS_AS_GUEST),AS="$(CROSS_AS_GUEST)") \
+			$(if $(CROSS_LD_GUEST),LD="$(CROSS_LD_GUEST)") \
 			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=$(CROSS_CC_GUEST_STATIC) \
 			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
 	"BUILD","$(TARGET) guest-tests with $(CROSS_CC_GUEST)")
@@ -59,11 +63,24 @@ DOCKER_COMPILE_CMD="$(DOCKER_SCRIPT) cc \
 		-i qemu/$(DOCKER_IMAGE) \
 		-s $(SRC_PATH) -- "
 
+DOCKER_AS_CMD=$(if $(DOCKER_CROSS_AS_GUEST),"$(DOCKER_SCRIPT) cc \
+		--cc $(DOCKER_CROSS_AS_GUEST) \
+		-i qemu/$(DOCKER_IMAGE) \
+		-s $(SRC_PATH) -- ")
+
+DOCKER_LD_CMD=$(if $(DOCKER_CROSS_LD_GUEST),"$(DOCKER_SCRIPT) cc \
+		--cc $(DOCKER_CROSS_LD_GUEST) \
+		-i qemu/$(DOCKER_IMAGE) \
+		-s $(SRC_PATH) -- ")
+
+
 .PHONY: docker-build-guest-tests
 docker-build-guest-tests: docker-image-$(DOCKER_IMAGE)
 	$(call quiet-command, \
 	  (mkdir -p tests/tcg/$(TARGET) && cd tests/tcg/$(TARGET) && \
 	   $(MAKE) -f $(TCG_MAKE) TARGET="$(TARGET)" CC=$(DOCKER_COMPILE_CMD) \
+			$(if $(DOCKER_AS_CMD),AS=$(DOCKER_AS_CMD)) \
+			$(if $(DOCKER_LD_CMD),LD=$(DOCKER_LD_CMD)) \
 			SRC_PATH="$(SRC_PATH)" BUILD_STATIC=y \
 			EXTRA_CFLAGS="$(CROSS_CC_GUEST_CFLAGS)"), \
 	"BUILD","$(TARGET) guest-tests with docker qemu/$(DOCKER_IMAGE)")
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index e6c1be5450..ed378e7840 100755
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
@@ -273,7 +279,16 @@ for target in $target_list; do
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


