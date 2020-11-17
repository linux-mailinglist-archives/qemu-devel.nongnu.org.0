Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF082B6BE9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:38:38 +0100 (CET)
Received: from localhost ([::1]:52616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4w9-0003Q1-JN
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uL-0001kd-BI
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:45 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uI-0006MT-3h
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id 1so2499564wme.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CbOi5+WP6WrA/d0FgepLR05MMDG8YalJxPttC+Q6vfg=;
 b=ZO5iP5xyAd5aOAXmu3vt4k0uiHwY/Pp71Da85mU9izXmaidHO4gu/1SCkhtEnklyGq
 IIIOq1F7bcMyEmlvZay/ihTNhVoIx2TN59ca+TA5z+hJl2ls/iC3awekrnadG3YybY/m
 l6JWc44ojmXKjr4/w2jrfwLQYeiTiTd/rem/doPrjF4bDwJ0T8xzA9Y98l+D1WfD8ZAw
 3hwHjVoOT6cK5I7f7YyNEoId8p5d/zmcrqxmKgRe2/8zoOY0vkol+w9hZWCrQqUKlVa7
 7912jjdoEQDMUBHFXaTa7kT18psBxcfzbIhdhDzUMpajZw3b69J34NDDtBXKyIwu2i5i
 NXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CbOi5+WP6WrA/d0FgepLR05MMDG8YalJxPttC+Q6vfg=;
 b=EDMzX7mG9ZyRgvx9VsZ25ZfO5N9moDwIGHUMNtFgoNxMbevya1nBZ6AGrt+PCMcQ3Z
 lWJiOyqLRxaatJuBUJ2D4wVAL51beivzv4zYLkQZRfDRuVtPhiiimLjgdHF5V183jLUX
 lIL9Onc7Q8ZLPQMulPEeD0ZSJqNP+DmLT6oj31WAWYzf2nzF5ggoIYucUc2zy2SJ+gc3
 bwzB8uTYgWSihZEN9vmY8z4lglucb0QiZJWb94ldckHya9u5Gm+Uony/szG5Hvp/8rQ1
 o6hMuZpvwE6VOZX6BoCYAR3i20CBVNPoHEbFhzyJOP6Os3tcU19iCrefRx8gM1MowotU
 dhvg==
X-Gm-Message-State: AOAM533Yy0PDAAyEgY5ZoBV4NJvz3g6+jXGi+UQ0ysuvUgcS62x5PtJn
 HS5r+HceWncIb/pwNV21VnaBbA==
X-Google-Smtp-Source: ABdhPJwQVrSrkukQ7X9y5bthDb48qI72A3SsYSVitG8AAqYxhKO82p+ycemMFkTjygup4s8udszB6Q==
X-Received: by 2002:a7b:c384:: with SMTP id s4mr175136wmj.77.1605634600708;
 Tue, 17 Nov 2020 09:36:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o13sm4639547wmc.44.2020.11.17.09.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:36:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C2CC1FF8C;
 Tue, 17 Nov 2020 17:36:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/6] tests: add prefixes to the bare mkdtemp calls
Date: Tue, 17 Nov 2020 17:36:31 +0000
Message-Id: <20201117173635.29101-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117173635.29101-1-alex.bennee@linaro.org>
References: <20201117173635.29101-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first step to debug a thing is to know what created the thing in
the first place. Add some prefixes so random tmpdir's have something
grep in the code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - fix long lines
---
 python/qemu/machine.py                    | 3 ++-
 tests/acceptance/avocado_qemu/__init__.py | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6420f01bed..64d966aeeb 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -303,7 +303,8 @@ class QEMUMachine:
         return args
 
     def _pre_launch(self) -> None:
-        self._temp_dir = tempfile.mkdtemp(dir=self._test_dir)
+        self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
+                                          dir=self._test_dir)
         self._qemu_log_path = os.path.join(self._temp_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 4cda037187..3033b2cabe 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -171,7 +171,8 @@ class Test(avocado.Test):
             self.cancel("No QEMU binary defined or found in the build tree")
 
     def _new_vm(self, *args):
-        vm = QEMUMachine(self.qemu_bin, sock_dir=tempfile.mkdtemp())
+        sd = tempfile.mkdtemp(prefix="avocado_qemu_sock_")
+        vm = QEMUMachine(self.qemu_bin, sock_dir=sd)
         if args:
             vm.add_args(*args)
         return vm
-- 
2.20.1


