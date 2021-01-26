Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490A63041D8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 16:13:31 +0100 (CET)
Received: from localhost ([::1]:43806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Q26-00063x-9F
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 10:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4PjO-0005lE-DW
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:54:12 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4PjI-00008H-Gz
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:54:08 -0500
Received: by mail-wm1-x333.google.com with SMTP id e15so3058669wme.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 06:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XnIiV3DzWrSm/DAQmEemcSTp/e/oYXKiquN/7lrri3s=;
 b=C9niEHAdM2qOkrwiyXqmffC1hA6EMCHZeznj0BLtMRwBLGVR6fCPy8paar0JRdr5Bu
 dRctIKsG1mDfSmpqBVktAMLcYnyf3JDRuPPNulPJIXQbwUBkJl9obtgOYWhqrWP14Dwe
 HdEH4awDWFZ5EBNeeZ+k5xkPt6ARgQBz/gMGB+FXgmJeyHbiupM4Ndxk7aEMNytkvxBL
 8iexhXqaSBocBQioVGuXQC21QlPwNWklyLOG4agVPmGUk9weLn2H380Bcx75TO1xdn14
 KGlwZW2Tt8Vz/v4AJf4g4OZ1GhDg42ioJXlcMo0lYAOyOOLmbui6tUcIHB/iGJTx8SIR
 SC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XnIiV3DzWrSm/DAQmEemcSTp/e/oYXKiquN/7lrri3s=;
 b=bpUZAZIQ2FejM2OYhnobOifjWGeBNYQnm/UtqhS3k/31snyh7GkjszW1yT6y+xMTbl
 8Y68rlnQt62dSs2Kn1GC4ZplTeTE3+z0KCjmfDMoVBPyUg7a/d1ZR/L9cUFmcsygonNi
 /IZzuwzLuqC67b63NjWxeS1HaYKfdwuIvbxp9Hk5RpaPt/GDsRDJhADDRZ3X+KhDExcf
 dlbKQT8sNfcA7lt+yU4smQvvoIcgymD1GX5sCfjwbcFNUJvbASTzBhR0a+opGzNR+VnG
 o6v0bswMM3diV6/iZvK/3Dr7v5koNuagDQCSjW7ztIYWXPrbAQFy3ifF2XOgDLNaBJ1r
 xgOw==
X-Gm-Message-State: AOAM533bMmrLv1snzJ64kuWqCOqLwENsmnRaFwDxrZTzotbdqXz6G0uq
 QA6cG4Oo67X4qR9uympSgFhKOA==
X-Google-Smtp-Source: ABdhPJzHX3ECjOrE8bESjlio/pdO/ZL5o6dx1c7smHRXTCPbT71NYLYpeMQa70IEwIrmTy5uBnn3sA==
X-Received: by 2002:a1c:a145:: with SMTP id k66mr140619wme.18.1611672841907;
 Tue, 26 Jan 2021 06:54:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b12sm19990409wrr.35.2021.01.26.06.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 06:53:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 386581FF8C;
 Tue, 26 Jan 2021 14:53:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] tests/Makefile.include: don't use TARGET_DIRS for
 check-tcg
Date: Tue, 26 Jan 2021 14:53:56 +0000
Message-Id: <20210126145356.7860-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210126145356.7860-1-alex.bennee@linaro.org>
References: <20210126145356.7860-1-alex.bennee@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_DIRS reflects what we wanted to configure which in the normal
case is all our targets. However once meson has pared-down our target
list due to missing features we need to check the final list of
ninja-targets. This prevents check-tcg barfing on a --disable-tcg
build.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile               | 3 +++
 tests/Makefile.include | 7 +++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index a380bbfa12..a25b2a5431 100644
--- a/Makefile
+++ b/Makefile
@@ -174,6 +174,9 @@ ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
 endif
 endif
 
+# Build up our target list from the filtered list of ninja targets
+TARGETS=$(patsubst libqemu-%.fa, %, $(filter libqemu-%.fa, $(ninja-targets)))
+
 # Force configure to re-run if the API symbols are updated
 ifeq ($(CONFIG_PLUGIN),y)
 config-host.mak: $(SRC_PATH)/plugins/qemu-plugins.symbols
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3ce8b03f34..ee438f8d6d 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -41,10 +41,9 @@ SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
 SPEED = quick
 
 # Per guest TCG tests
-
-BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGET_DIRS))
-CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGET_DIRS))
-RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGET_DIRS))
+BUILD_TCG_TARGET_RULES=$(patsubst %,build-tcg-tests-%, $(TARGETS))
+CLEAN_TCG_TARGET_RULES=$(patsubst %,clean-tcg-tests-%, $(TARGETS))
+RUN_TCG_TARGET_RULES=$(patsubst %,run-tcg-tests-%, $(TARGETS))
 
 # Probe for the Docker Builds needed for each build
 $(foreach PROBE_TARGET,$(TARGET_DIRS), 				\
-- 
2.20.1


