Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F82C0482
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:27:35 +0100 (CET)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khA0M-0001TT-Qt
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yJ-0007nu-L8
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:28 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yH-0004be-04
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:27 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s8so18182166wrw.10
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+f08uG8G1zuCsDeFkdWQnHNS8j5fbAvdTDg/RUI/fvg=;
 b=CuSjVxUZeVKF2LfNPQM1Rg8pEAhpFa+m5Oy7cXr+0I5+wCYGytPvu0Y389OhawSGVk
 GhW8NPw5uIsm6TyR2YLQNdDia+4h0vlfndqSBXRlQr4nm1QMRG1A0K7HSymV/y80mSMQ
 x1fOWEE6j0S5DqdyYog9Qp2oe1kUh9wXG7I87k/+uP5eNaFT8GtNwR1uWf5KcdA3rzzv
 gsP+kxHxAFcU3mxcSjgXkdNHmBrIadlIuELjaHfwTPKlxKBE+o9C37abDErZmj0/o4IP
 vxGvTnNlbTFiAAAUjERlF8wjhZ4A3ubtiggwlGiqkwx7pBACwoaMZbyq1jFxMM71D7jI
 DVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+f08uG8G1zuCsDeFkdWQnHNS8j5fbAvdTDg/RUI/fvg=;
 b=lxxS6roa8b8g3Eif2DBGdeThyKYJm74MLHIayeSmni+tNHG+M8+IPVSXuizOE50imn
 eGfJtxjfB3dM+17wCDcGaAiZhWQj0JeScXJv1+2Qd55aqk5TaE96rolIhSfhzrYLNdVy
 Smgc2+Nr6fmm2934X9Wk2WD96gUaW+GsZZI09kCLnIIIACY2RWJKP7opU3y6Dn1+5yyl
 YI4KhSjbOEeRMCD23ezV9XfT1zK8rbzp/b5lXO3QeHLols5FqRcksG9O43SAFL8FUwgv
 9E1eycZpTj83l1upHItl0DSnM5NQSQCcWp7fXPpahYuvUdokrvwVi7JgU8hq4rbV+1jK
 7l3A==
X-Gm-Message-State: AOAM533OY+pb13WFgginI1ck9ONvRrdvrvJqSyoYd/wFT3qvAMpum+sL
 5BUV6eI9zBIEleAKzlvLK5Ptkw==
X-Google-Smtp-Source: ABdhPJzkxnqR6oTSMWaZ2jtklX1PWUG4V7swHwZlBXew3C/IdlgzNQq89OEdr0zyVUxaiOxkAs39ow==
X-Received: by 2002:a5d:6548:: with SMTP id z8mr11285737wrv.399.1606130723595; 
 Mon, 23 Nov 2020 03:25:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o2sm18647963wrv.4.2020.11.23.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:25:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F18C01FF8C;
 Mon, 23 Nov 2020 11:25:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/7] tests: add prefixes to the bare mkdtemp calls
Date: Mon, 23 Nov 2020 11:25:13 +0000
Message-Id: <20201123112518.13425-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123112518.13425-1-alex.bennee@linaro.org>
References: <20201123112518.13425-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first step to debug a thing is to know what created the thing in
the first place. Add some prefixes so random tmpdir's have something
grep in the code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201117173635.29101-3-alex.bennee@linaro.org>

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
index 4cda037187..307020be45 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -171,7 +171,8 @@ class Test(avocado.Test):
             self.cancel("No QEMU binary defined or found in the build tree")
 
     def _new_vm(self, *args):
-        vm = QEMUMachine(self.qemu_bin, sock_dir=tempfile.mkdtemp())
+        sd = tempfile.mkdtemp(prefix="avo_qemu_sock_")
+        vm = QEMUMachine(self.qemu_bin, sock_dir=sd)
         if args:
             vm.add_args(*args)
         return vm
-- 
2.20.1


