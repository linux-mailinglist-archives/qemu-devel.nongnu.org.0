Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCF71FB17F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 15:03:31 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlBFS-0001Tm-I0
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 09:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlBDe-00086y-SK
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 09:01:38 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlBDb-0001bz-2L
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 09:01:38 -0400
Received: by mail-wm1-x329.google.com with SMTP id j198so2234863wmj.0
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 06:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9XedwggDKQfNxmposMH4fQX7sPemUGNkbKr4QfRYHA4=;
 b=eweEZtO0xq6/T9zZ37JJQtqmHqA782Mz/gdbopt5aSKTcoQfaH9qKG1C4STBtkXyv2
 v0agyMGjQG2PmTAZ8XdT3Us8uC09UDICZutn0EOO4V1yOK0LjvcZhorP2iCVKgufJoFv
 D+Lb38hcLOfgVGVHVVEZ0MsoBmqfmdC+svM6Rj3a4/gajKX4EpqkxGoWh7BEP87vE5AR
 oo6wEqkE3CRN7Q/0km1+Y4fDz8t1TI8JpiElABn/1zDqrF5O0r+misE0orspX9MTRG/2
 Y5soAzHYaJPH5ntGDv90eqV3sW06TPw19dYYOm3ShFBXGW8ANNBCZCvh4QG5jEXH6wbt
 bcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9XedwggDKQfNxmposMH4fQX7sPemUGNkbKr4QfRYHA4=;
 b=kBT350a+/I9mmgHpUlhy7ElZTtQMc+Ho2vTzjVoAN4lMuV9pQdyB5SL7akxtpFsC/I
 E2T7pfyfnijxJlcrvrlo6JrBOQY9MAZN08k8hmnlnsy3SN0sR95HsTbqXlGJWcnZnUVs
 OojGK4tIHFF8bVdlU7Dfy0vXaUEDFAqTKnppbYnmbjB5WhFXXtvy1p58eOTlszVHiT4Z
 6G0KusFcn3n260A9rbVVCqUdRbC/tgl8I+iHBvrfXaoib8SVPA618+jhmvGwTd8jU/eY
 OqXuWPTtcKlrQnNYTViV+CDdTc1DWLL8ktjC5v2qd5jRgSrhMBiBD43+gqC+xRtN9vbw
 KBvw==
X-Gm-Message-State: AOAM532nyteGCjBT6wsTXKMSA6Cf16kfanCCX7SMkznPgaqECmATbxuJ
 n74OELXM5RyVk5MgNlwz6JC3Vg==
X-Google-Smtp-Source: ABdhPJxjSnp/0GMJe/XUY7KQRwt3zyjkJOCdI+Z3/ObOXTUtQEipg+3gTk37+2AsQfPGgSgB9nwc0Q==
X-Received: by 2002:a7b:cd94:: with SMTP id y20mr3035370wmj.87.1592312493522; 
 Tue, 16 Jun 2020 06:01:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 185sm3870503wmz.22.2020.06.16.06.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 06:01:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C82E31FF9F;
 Tue, 16 Jun 2020 13:53:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/21] tests: Disable select tests under TSan,
 which hit TSan issue.
Date: Tue, 16 Jun 2020 13:53:19 +0100
Message-Id: <20200616125324.19045-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616125324.19045-1-alex.bennee@linaro.org>
References: <20200616125324.19045-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Foley <robert.foley@linaro.org>

Disable a few tests under CONFIG_TSAN, which
run into a known TSan issue that results in a hang.
https://github.com/google/sanitizers/issues/1116

The disabled tests under TSan include all the qtests as well as
the test-char, test-qga, and test-qdev-global-props.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200609200738.445-14-robert.foley@linaro.org>
Message-Id: <20200612190237.30436-17-alex.bennee@linaro.org>

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 5607c7290d8..3f4448a20bc 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -55,7 +55,6 @@ SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
 
 check-unit-y += tests/check-qdict$(EXESUF)
 check-unit-y += tests/check-block-qdict$(EXESUF)
-check-unit-$(CONFIG_SOFTMMU) += tests/test-char$(EXESUF)
 check-unit-y += tests/check-qnum$(EXESUF)
 check-unit-y += tests/check-qstring$(EXESUF)
 check-unit-y += tests/check-qlist$(EXESUF)
@@ -108,7 +107,6 @@ check-unit-y += tests/test-qht$(EXESUF)
 check-unit-y += tests/test-qht-par$(EXESUF)
 check-unit-y += tests/test-bitops$(EXESUF)
 check-unit-y += tests/test-bitcnt$(EXESUF)
-check-unit-$(CONFIG_SOFTMMU) += tests/test-qdev-global-props$(EXESUF)
 check-unit-y += tests/check-qom-interface$(EXESUF)
 check-unit-y += tests/check-qom-proplist$(EXESUF)
 check-unit-y += tests/test-qemu-opts$(EXESUF)
@@ -123,9 +121,16 @@ check-speed-$(CONFIG_BLOCK) += tests/benchmark-crypto-cipher$(EXESUF)
 check-unit-$(CONFIG_BLOCK) += tests/test-crypto-secret$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)) += tests/test-crypto-tlscredsx509$(EXESUF)
 check-unit-$(call land,$(CONFIG_BLOCK),$(CONFIG_GNUTLS)) += tests/test-crypto-tlssession$(EXESUF)
+ifndef CONFIG_TSAN
+# Some tests: test-char, test-qdev-global-props, and test-qga,
+# are not runnable under TSan due to a known issue.
+# https://github.com/google/sanitizers/issues/1116
+check-unit-$(CONFIG_SOFTMMU) += tests/test-char$(EXESUF)
+check-unit-$(CONFIG_SOFTMMU) += tests/test-qdev-global-props$(EXESUF)
 ifneq (,$(findstring qemu-ga,$(TOOLS)))
 check-unit-$(call land,$(CONFIG_LINUX),$(CONFIG_VIRTIO_SERIAL)) += tests/test-qga$(EXESUF)
 endif
+endif
 check-unit-$(CONFIG_SOFTMMU) += tests/test-timed-average$(EXESUF)
 check-unit-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_INOTIFY1)) += tests/test-util-filemonitor$(EXESUF)
 check-unit-$(CONFIG_SOFTMMU) += tests/test-util-sockets$(EXESUF)
diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index 5023fa413d1..98af2c2d933 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -314,12 +314,15 @@ tests/qtest/tpm-tis-device-test$(EXESUF): tests/qtest/tpm-tis-device-test.o test
 # QTest rules
 
 TARGETS=$(patsubst %-softmmu,%, $(filter %-softmmu,$(TARGET_DIRS)))
+QTEST_TARGETS =
+# The qtests are not runnable (yet) under TSan due to a known issue.
+# https://github.com/google/sanitizers/issues/1116
+ifndef CONFIG_TSAN
 ifeq ($(CONFIG_POSIX),y)
 QTEST_TARGETS = $(TARGETS)
 check-qtest-y=$(foreach TARGET,$(TARGETS), $(check-qtest-$(TARGET)-y:%=tests/qtest/%$(EXESUF)))
 check-qtest-y += $(check-qtest-generic-y:%=tests/qtest/%$(EXESUF))
-else
-QTEST_TARGETS =
+endif
 endif
 
 qtest-obj-y = tests/qtest/libqtest.o $(test-util-obj-y)
-- 
2.20.1


