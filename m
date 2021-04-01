Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB033513B6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:36:57 +0200 (CEST)
Received: from localhost ([::1]:44050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuh6-0005QH-63
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWp-0002oR-8k
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWI-0001lJ-JO
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:12 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j9so1261352wrx.12
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rTMdnuZrQXPhdMtK6L8H7oKEdE7GRmWL93bfr6A1xC4=;
 b=ejM5JhYT3GN9/p0ZMFH1Qi0ADcPvFOiQ/xXH5PYgtSHQTw6mAEGeJgY/zbsXzqFxrB
 +Wlu62aNhX0/EB4mKnDZhFv8Oc8ae0x6yoD7qTs7hOIGQVVdw8LgdbA5KPWryvxz/wIR
 K3Ti3CIsqmpI5lRBcjGrUpi25yzO/TNLOjZPap1CRuQGE92ZCq6ilO/NkwONSNdLyfxM
 QxA7FGSPJZsMGzHouPoxfTkVqOHwpokeGmcv4zuuwFlPvHnljcSMM7RmVC0++yPs2qBE
 vAA9ltf4SZbO3KxmR6kq5UwxejRK+PgRYg862aK9+vAh4LAxyqZkKv2JQbr45EDXJxVY
 /dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTMdnuZrQXPhdMtK6L8H7oKEdE7GRmWL93bfr6A1xC4=;
 b=QmYU4zhlzxdi9dehKydMrPJWCdlQsBAqLMIP1ErF+TuPi7uchXEYOMLWT1BuHx0Jp/
 zvr5jDN7qZLq9yw+nO0X+ndhJ2z0t2D4hPNq50OvQ++PQwXySx9WuS+u0wqfor8SqUyH
 L+p4UtUP9aYeqHZnESsIHyr5SksnMqAH25w0Zpm39v7rAZQVUd1Co8lEwD3RgMY+o0FP
 dOAJINMkDCcQUh/i6ju+y4ommbm8rdn1NfbP8RG3uzpWCFrAl+WJ3SIR0QUcx5EIZIyH
 y9AOXZqyFX0JcJmqW4Vmzf1Y0VwhRIIWKAgIS+DJLD36vpFVSzQKEPoQtECzF7UZyCLe
 PWpw==
X-Gm-Message-State: AOAM532u8w8q/5vmx0S9PhOBzm1hpVgokAogAc2Nm0YpdI7W+6aJf56x
 hCrLYcQUoBoY95Y+/0mTn6cCKA==
X-Google-Smtp-Source: ABdhPJwzQDoYrvV+Fq7vURIwxPs3G+Trg7ZOLfbMWoMTd7j0JuCyS5fMlfYRnY44QwpJITjwd8N32w==
X-Received: by 2002:adf:f4c1:: with SMTP id h1mr8883548wrp.71.1617272742678;
 Thu, 01 Apr 2021 03:25:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h10sm9064001wrp.22.2021.04.01.03.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1E191FF92;
 Thu,  1 Apr 2021 11:25:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 06/11] tests/tcg/i386: force -fno-pie for test-i386
Date: Thu,  1 Apr 2021 11:25:25 +0100
Message-Id: <20210401102530.12030-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The containerised compiler defaults to no-pie anyway but if we are
relying on the users installed cross compiler we need to check it
works for building 16 bit code first.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/configure.sh         |  6 ++++++
 tests/tcg/i386/Makefile.target | 16 +++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 90fd81f506..46bc8634bb 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -281,6 +281,12 @@ for target in $target_list; do
                 echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
             fi
         ;;
+        i386-linux-user)
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+                -Werror -fno-pie -no-pie -o $TMPE $TMPC; then
+                echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+            fi
+        ;;
     esac
 
     enabled_cross_compilers="$enabled_cross_compilers $target_compiler"
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index c4a6f91966..f7efaab918 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -27,13 +27,23 @@ run-plugin-test-i386-bmi2-%: QEMU_OPTS += -cpu max
 hello-i386: CFLAGS+=-ffreestanding
 hello-i386: LDFLAGS+=-nostdlib
 
-#
-# test-386 includes a couple of additional objects that need to be linked together
-#
+# test-386 includes a couple of additional objects that need to be
+# linked together, we also need a no-pie capable compiler due to the
+# non-pic calls into 16-bit mode
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_I386_NOPIE),)
+test-i386: CFLAGS += -fno-pie
 
 test-i386: test-i386.c test-i386-code16.S test-i386-vm86.S test-i386.h test-i386-shift.h test-i386-muldiv.h
 	$(CC) $(CFLAGS) $(LDFLAGS) $(EXTRA_CFLAGS) -o $@ \
 	   $(<D)/test-i386.c $(<D)/test-i386-code16.S $(<D)/test-i386-vm86.S -lm
+else
+test-i386:
+	$(call skip-test, "BUILD of $@", "missing -no-pie compiler support")
+run-test-i386:
+	$(call skip-test, "RUN of test-i386", "not built")
+run-plugin-test-i386-with-%:
+	$(call skip-test, "RUN of test-i386 ($*)", "not built")
+endif
 
 ifeq ($(SPEED), slow)
 
-- 
2.20.1


