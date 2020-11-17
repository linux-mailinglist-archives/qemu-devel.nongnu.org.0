Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6402B6BED
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:40:14 +0100 (CET)
Received: from localhost ([::1]:60380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4xh-0006iG-GC
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uL-0001ld-RH
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uJ-0006Mf-66
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id 1so2499628wme.3
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iZ6emmsVGopMBicjEoGUTBo8VBEOaBaz0b4I5fK20m8=;
 b=mTZhIZwmq/aPdobm+ylhLINwVqdw23gHoYv5vTN8s0SnP7XZ9Pz34n8nP93OUz75o7
 muKrCLpVMtgt0oFXbBe4RmDBJ8EYnyPX784bOty9rQS3wCKS4HG8xsoaMo43laFWkAza
 kmy+4exEKfFKItKeCUfxnZQ7zhBHunOu1ZTe9MEr8xFK/0kI7yHAHY0o8Av1Gn0w9sh/
 XwIBauXe8Xm+T1/ckQqBcYvFV6QHJwowwwQhXahees0bxtyfp5zdHngnkQLH85+iLrKL
 Inv43AUTErxULyYPiWOllnGjl5xS7IuzxtEmvQmE9sXsdatA2fZ8SLZYc7Wv+F5xO/Xd
 ET1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZ6emmsVGopMBicjEoGUTBo8VBEOaBaz0b4I5fK20m8=;
 b=pIrFWFjUVQkzN5pYEK1NdnRTRiSIt/f1Jp1PQXELEbZKbzSTSp5AOjq/iZiZBNcq7i
 YDCpyqCw5ZKxoma8mnCE4+KQuylo6rxDkRTIK+nvoM9z/tyg9quw46G62+KjftUe5ijv
 XO5oqkpKle9janaCJXz0RP6a4zT3AfTwIWrpBsm39ur1/UbXgldNKc1ygwVRdvZrgEVo
 JiZrRuotjCr12f8nawXEQzyPzUvRgMI7LEiwlOullhEsMD2NGwxC08/VLWMRkwPs9v9H
 7RyupvvU/U1Yjq15UbEgQpFZZcwtXjZ3k9B9FMtRRl2a4T6yaxPks3nCYKwVBOXCokX2
 W58A==
X-Gm-Message-State: AOAM532tWtvQFwrOSimiPH7Pz94U0kot8IgyUK7reT6LofEsPDCrrteN
 HzIr538kgbWqZoYs9RVo2A34wQ==
X-Google-Smtp-Source: ABdhPJy1DdftWS9IGZaLsK4wRjPMBE80qT1sRFfVWdj+l8bSV0uXHL3RLdGxoFlInd5Md92IMxGcNw==
X-Received: by 2002:a1c:d0:: with SMTP id 199mr194149wma.148.1605634601911;
 Tue, 17 Nov 2020 09:36:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 31sm6889143wre.43.2020.11.17.09.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:36:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A56F41FF8F;
 Tue, 17 Nov 2020 17:36:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/6] tests/avocado: clean-up socket directory after run
Date: Tue, 17 Nov 2020 17:36:32 +0000
Message-Id: <20201117173635.29101-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117173635.29101-1-alex.bennee@linaro.org>
References: <20201117173635.29101-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously we were leaving temporary directories behind. While the
QEMUMachine does make efforts to clean up after itself the directory
belongs to the calling function. We use TemporaryDirectory to wrap
this although we explicitly clear the reference in tearDown() as it
doesn't get cleaned up otherwise.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 3033b2cabe..bf54e419da 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -171,8 +171,8 @@ class Test(avocado.Test):
             self.cancel("No QEMU binary defined or found in the build tree")
 
     def _new_vm(self, *args):
-        sd = tempfile.mkdtemp(prefix="avocado_qemu_sock_")
-        vm = QEMUMachine(self.qemu_bin, sock_dir=sd)
+        self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
+        vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)
         if args:
             vm.add_args(*args)
         return vm
@@ -193,6 +193,7 @@ class Test(avocado.Test):
     def tearDown(self):
         for vm in self._vms.values():
             vm.shutdown()
+        self._sd = None
 
     def fetch_asset(self, name,
                     asset_hash=None, algorithm=None,
-- 
2.20.1


