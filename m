Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D333728A2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:17:34 +0200 (CEST)
Received: from localhost ([::1]:46934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds7P-0002ey-SR
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrt6-0002gC-Pe
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:44 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrt4-0003Co-PI
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:44 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n2so8744526wrm.0
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPq9uGOdfE2STV15D/gtYtThg7p+C48gB81bHaUpG4E=;
 b=qrWt5IoStrpX88zJcQ1vMdoy/l3i7izqpIYK46R1VO55zOxvNe4gnBfLO/QpOQG/Dy
 D6uP2tx58/vLFncE3KkY+vRkn4Pm14/WHtQLFfpN+Vi/ntYjW1+KebSfM92sb3wbfZPh
 wlXRaWViVZ/qcmzu8p4+qUXOU9MNTj73V9JPZfmeArXmVer8yuEpVfv+UTSUOAqNr9HJ
 lMYmMbqoV9Wr29AstqXfIYPx+CyPuNcSgVVYvq/lvkSPbuXWOT4kNn5M2m3LyKZvW2Q0
 E05kooWllSiO0cmzmFrNpskf4i0YgYzjlFrkXIBbM5duEcfxvIr9EU1e/YVrAj3vwlBP
 S9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPq9uGOdfE2STV15D/gtYtThg7p+C48gB81bHaUpG4E=;
 b=Zeq8I1VjQWtVtCE9n7XYSOs07CKrUIXS3JIALhj5prYHSTXJStcM3dBPSe2asGZwCf
 MjD4tk1/caiXgp+691rKW/kOb7nHmX7Ijan5ClMpeZGIGuYUAOf9rI7oMLYPFZiISLJX
 c/U6rSgWs5TfMAayLsl+fm3/FZEg/rC9uhibMiu0+XdOI9E3BQD79NO5/7uQlVOP3vSU
 XmG14s/+ZpH1of1WkpyeM4IwQmbmbhukjvXCa70B3+FaGCDF+y7Dfaj7PvKHrqa2+8Al
 XRCNtq0zDArnAbOCbwTeCwmQasN8sUD3FCCv3+/nCsGKFnO0tJSM58K3xlB6WjKfY4A1
 AHuA==
X-Gm-Message-State: AOAM532QVUxkvgt8r2xLSId3QAWNcqc2LmKmUAJc0zuevfoAgpe02m13
 CvTSugYGAZyvGG8ix2g0Jk/LMA==
X-Google-Smtp-Source: ABdhPJxa5TD6CFpkAN+8HNXgBJwPLFQeeqvZ3nw3X4LJYJOhq3FHW1hyIA4YZuMiQIlgoHR+6gEQrw==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr30370819wrr.21.1620122561506; 
 Tue, 04 May 2021 03:02:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm19376404wrq.45.2021.05.04.03.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE3391FF9A;
 Tue,  4 May 2021 11:02:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 11/30] tests/tcg: Add docker_as and docker_ld cmds
Date: Tue,  4 May 2021 11:02:04 +0100
Message-Id: <20210504100223.25427-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


