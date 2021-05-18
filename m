Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175173874EB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:18:40 +0200 (CEST)
Received: from localhost ([::1]:56474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livs0-0007Uk-1M
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhW-0008CX-4h
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhU-0005YO-0b
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f19-20020a05600c1553b02901794fafcfefso431231wmg.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHzMEhvW9dXILlz4dLRzWbxJpqXqkKl8FediKZsJZFo=;
 b=Ds4KNmCHRrLcxIkfVVM2ypn/EPGCzXiEJXDSGTddrTfqonltnZFKbUse1ICx8tT8tx
 A8KJCllqjDv1Caw8R1llzTlGeHTw5diiy0dD+cbthTxpEHLqsXGdfVvvC6u6ccg3i3yM
 OUv3qGDMQO3Hm4djCQqbfas3U4BuBlr1+dZenPTmMSneHk4E4LorZGFTwWW8GXft9Htr
 ZX9dymjw2gZnYjZ9Q9QM4bbWB9UsMChBzhXUSHKXiNw9zF/82xD1wvlFRc0Am0Q8qR+r
 z1paMEX5OfLJLY6vD2QBea9S76MJ4o5et5yiKHvSu+KGuT5onP4AUDm5MQ68zW9ZTY6k
 o70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHzMEhvW9dXILlz4dLRzWbxJpqXqkKl8FediKZsJZFo=;
 b=TcAXhaZodnQpvEmwosGCypecl9cFc/x6nJuweyrw/6FNFmjIILR+w7o+zYdbiQmGOD
 JH9yKSX2mk7T3uvDnJvZWUk9b9IMdJAGlX5tYR+PTcQCXB8SPkSsRJlf6l2sA5S5wuxj
 U2ApX0n8v/JAb+0IBJrw7DVSXRyOa/gZxmk6RCpPCbcvlsMCIYuSCvqE+mBkpFZTxvsQ
 g2U8QkTUSbzPQP+ynrHNQ/d/u7Cnbka0arVmH7FL1FMNcUijM7fhwKeKMyDF1pfjYqjj
 ETeBggkwL0m8W1PpMeQ4cg/B0Js3UjSJP82vzoRdc5p2cCqpKdKeyMLfCg7wtu5SoY2T
 Tuvw==
X-Gm-Message-State: AOAM533POFEEQESh7sX1QBXcf5lhEu/5F8OV175KlUy048135FssRyJh
 nrn1RtO/VO3ID3ISHDkY8LCIKQ==
X-Google-Smtp-Source: ABdhPJzKiWKHeaHjelps711hjQ6Ta6JeECfVTObN0Po4t8hoZuzwW20wQz47ctrYpq8v8SzNGvSkFw==
X-Received: by 2002:a1c:988f:: with SMTP id a137mr3806607wme.110.1621328858035; 
 Tue, 18 May 2021 02:07:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k11sm1952241wmj.1.2021.05.18.02.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D72DF1FF99;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 10/29] tests/tcg: Add docker_as and docker_ld cmds
Date: Tue, 18 May 2021 10:07:01 +0100
Message-Id: <20210518090720.21915-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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

Message-Id: <20210512102051.12134-12-alex.bennee@linaro.org>

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


