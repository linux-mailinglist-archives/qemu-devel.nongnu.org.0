Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B156D04F
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:08:29 +0200 (CEST)
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaQ1-0000BI-13
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJY-0007QL-6h
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJW-0003RZ-Bl
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:47 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso6242265pjc.1
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBe6RKRbi5QkFNalJayEoxBpVJ/vYkp2hV9cPSW8tWU=;
 b=eaiQK+0OIK6V9RSC7QixbETEeVNXsfB4AVW0CmP7rEBYGrnHgYtMsd2Pehk6UL71rW
 UGysn4Zyz7rxaguVi6fMKErEof08KS5j7E60+mOUR6fMlbFND2fjC+a+uei5Rs6agQ2o
 DB1F0EoG2V7AwEmMLhVeV8YDmJoaTnbJpP1YaYYpyQAWlVqmXlxERLbiTJXArSpOD+Jh
 lO62l8uESyPVR3v1c1MN9S5VQw8PNIt0xgNuH/TRrKXfnTp4EgQtrvXtluDjNkw+PqMz
 32GDd5rBv2JVb6x2lK1gfBoDWfN28Yig+3dimEgqdLuWUgfcnmRxtwWel6mZWTZXKQ70
 5H3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBe6RKRbi5QkFNalJayEoxBpVJ/vYkp2hV9cPSW8tWU=;
 b=HjaCXxZHCWRRrTjG6mvkVXsGOG23piGCoSeHQR2KmHzOxhmDohZcmudthBQoSp0R/D
 DCPIfpjRdGqpMJKgthz0+93Zna1cfR0gVTDUpxD+fwn+Veo5zB8d86URzrvCzf+ageMt
 4sZj/Qf5pw2hDQ9Itp87fBw1Tbw24N8/FtVjeCI+ZG/sRjB5D2HtsQEzLpU5pHPBT9r0
 fub2cY7lPCC+zEXsm34KEiZjjevcLQ1L3sXbDiFqUdSyfR3ekuNJG1ltHDOhbZR8RpRD
 RFXftmXhy6/RZHvA/2cmmlceN1VUsNKI/OyfR7pi8Q0InlRNEBM819UKFYzXCKyjONgW
 biYg==
X-Gm-Message-State: AJIora+afv3n0/SjFpqRw8tJHZxHVmuDNVLH7zWlkB19XrBOvavltIo5
 zdYtajr2N0VgFJjQUEuim0f9yN/vw/dtJ4Za
X-Google-Smtp-Source: AGRyM1sDkbb29AE1SG5w/dQULWS11YcvC7Bqt5QKiPy/ty6uBBlgSxXsdB5K3VnyorWJLNDi8EinyQ==
X-Received: by 2002:a17:902:cf4b:b0:16c:4634:72 with SMTP id
 e11-20020a170902cf4b00b0016c46340072mr1757964plg.15.1657472504844; 
 Sun, 10 Jul 2022 10:01:44 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:44 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 10/11] pytest: add pytest to the meson build system
Date: Sun, 10 Jul 2022 22:30:13 +0530
Message-Id: <20220710170014.1673480-11-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Integrate the pytest framework with the meson build system. This will make meson
run all the pytests under the pytest directory.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/Makefile.include   |  4 +++-
 tests/meson.build        |  1 +
 tests/pytest/meson.build | 49 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 tests/pytest/meson.build

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3accb83b13..40755a6bd1 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -3,12 +3,14 @@
 .PHONY: check-help
 check-help:
 	@echo "Regression testing targets:"
-	@echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
+	@echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest, pytest and decodetree tests"
 	@echo " $(MAKE) bench                  Run speed tests"
 	@echo
 	@echo "Individual test suites:"
 	@echo " $(MAKE) check-qtest-TARGET     Run qtest tests for given target"
 	@echo " $(MAKE) check-qtest            Run qtest tests"
+	@echo " $(MAKE) check-pytest           Run pytest tests"
+	@echo " $(MAKE) check-pytest-TARGET    Run pytest for a given target"
 	@echo " $(MAKE) check-unit             Run qobject tests"
 	@echo " $(MAKE) check-qapi-schema      Run QAPI schema tests"
 	@echo " $(MAKE) check-block            Run block tests"
diff --git a/tests/meson.build b/tests/meson.build
index 8e318ec513..f344cbdc6c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -93,3 +93,4 @@ subdir('unit')
 subdir('qapi-schema')
 subdir('qtest')
 subdir('migration')
+subdir('pytest')
diff --git a/tests/pytest/meson.build b/tests/pytest/meson.build
new file mode 100644
index 0000000000..e60d481ae4
--- /dev/null
+++ b/tests/pytest/meson.build
@@ -0,0 +1,49 @@
+slow_pytests = {
+  'acpi-bits' : 120,
+}
+
+pytests_generic = []
+
+# biosbits tests are currenly only supported on x86_64 platforms.
+pytests_x86_64 = ['acpi-bits-test']
+
+pytest_executables = {}
+other_deps = []
+
+subdir('acpi-bits')
+
+foreach dir : target_dirs
+  if not dir.endswith('-softmmu')
+    continue
+  endif
+
+  target_base = dir.split('-')[0]
+  pytest_emulator = emulators['qemu-system-' + target_base]
+  target_pytests = get_variable('pytests_' + target_base, []) + pytests_generic
+
+  test_deps = roms
+  pytest_env = environment()
+  if have_tools
+    pytest_env.set('QTEST_QEMU_IMG', './qemu-img')
+    test_deps += [qemu_img]
+  endif
+  pytest_env.set('G_TEST_DBUS_DAEMON', meson.project_source_root() / 'tests/dbus-vmstate-daemon.sh')
+  pytest_env.set('PYTEST_QEMU_BINARY', './qemu-system-' + target_base)
+  pytest_env.set('PYTEST_SOURCE_ROOT', meson.project_source_root())
+  if have_tools and have_vhost_user_blk_server
+    pytest_env.set('PYTEST_QEMU_STORAGE_DAEMON_BINARY', './storage-daemon/qemu-storage-daemon')
+    test_deps += [qsd]
+  endif
+
+  foreach test : target_pytests
+    test('pytest-@0@/@1@'.format(target_base, test),
+         pytest_executables[test],
+         depends: [test_deps, pytest_emulator, emulator_modules, other_deps],
+         env: pytest_env,
+         args: ['--tap', '-k'],
+         protocol: 'tap',
+         timeout: slow_pytests.get(test, 30),
+         priority: slow_pytests.get(test, 30),
+         suite: ['pytest', 'pytest-' + target_base])
+  endforeach
+endforeach
-- 
2.25.1


