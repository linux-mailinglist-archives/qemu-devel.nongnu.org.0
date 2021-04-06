Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F197835572F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:02:51 +0200 (CEST)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnEB-0007vI-1F
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCU-0006YU-3K
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:06 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCR-0005CV-J9
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id x7so14572295wrw.10
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=epV8peuu7bDkNnCU4ud5+0/ywqFJPtW85LL1WyPiV5E=;
 b=n+2862UjDpoti//xZDd6qmIymYGQgV11sjMWLW2TdbUzlxYvM6tmySNNVlh/sm+J+X
 4BjLSIuG/qb99p1O95erdG1X3esIKju4sflruevrFa08+6fDzMrr6+WID3XUvSzzPNi5
 uxACd6+ts/G3aZ78cXMmiMqF2CAFIo4cn9JQ43ogoyCW/nHrPOYyO34xgnNQ/SDW/RpI
 ABBHfoGbtFtjNQmqlIId3xiDUYyZKNTpE9jAUcpQBxE2xNfyiurheLq1dTYBxiTlMAkD
 u3T1bokGRrrz34R7f82mv4HwsspfipFnWEGgsRV1YPQ4vwNvJFzCTYpy/2NTldB4OiHm
 94UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=epV8peuu7bDkNnCU4ud5+0/ywqFJPtW85LL1WyPiV5E=;
 b=iUU0c9SJVu69CHoiBpcjV/lOYmESq5HFvr0LDEH8lr65Ve2LnsLNi8aDOdxxOPZfqd
 FEhnYbj92WoAm1u/L4yHQbT3T/pqCvH8zWIs/FfNake98iIwTnn5qIxPcdxrDMdnM7Cg
 rpl5NTpZwPNM3PHEfXCtOxAP+/3XJRasIJGw6g4vtSfUbsHK3JJl0ApH1YPFzMUn2SwW
 05UAfS/0cRQ+uGl9jJoOLnn/SG3Sk4dtG3yFMqkYlG6nZzxH1RHruMSBLqMwtRWBuCU4
 STQi4mtpnN4s++SzYoq1CB5evkblkQp/cIXtQp25TJ9AI8kxzHacl0nK8mVboxgqK/Bw
 tFPw==
X-Gm-Message-State: AOAM530bEth5fUHOTZbnjSo6WL3yLP+XTMBjSRMYqJJ0M9Se4WK4gh//
 DkQ3BB5q4YdtBCxyz4UOkc/QgQ==
X-Google-Smtp-Source: ABdhPJxWHUh8ZBfImayCjqZ9zGs/AvAgOoADM3fiZp4Ia8LRzoXnoT6svIkfiD/M2BOeTX1KioTLWg==
X-Received: by 2002:adf:db51:: with SMTP id f17mr17713386wrj.64.1617721262343; 
 Tue, 06 Apr 2021 08:01:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g16sm35181851wrs.76.2021.04.06.08.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9551E1FF92;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/11] tests/tcg/i386: force -fno-pie for test-i386
Date: Tue,  6 Apr 2021 16:00:36 +0100
Message-Id: <20210406150041.28753-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The containerised compiler defaults to no-pie anyway but if we are
relying on the users installed cross compiler we need to check it
works for building 16 bit code first.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210401102530.12030-7-alex.bennee@linaro.org>

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 90fd81f506..fa1a4261a4 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -281,6 +281,12 @@ for target in $target_list; do
                 echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
             fi
         ;;
+        i386-linux-user)
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+                -Werror -fno-pie -o $TMPE $TMPC; then
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


