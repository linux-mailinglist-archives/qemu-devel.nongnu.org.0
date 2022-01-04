Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7046948419E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 13:22:53 +0100 (CET)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4iq3-0001B1-Vi
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 07:22:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4ioX-000089-98
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 07:21:17 -0500
Received: from [2a00:1450:4864:20::52e] (port=40891
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n4ioV-0000lu-Mp
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 07:21:16 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z29so147747479edl.7
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 04:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USv2v4ZwxE9av5kMenRnP4ydLcxdEXeYFT8WV8bcZA0=;
 b=zfuSzUe+zF4TqAcHTCDtWP0/NlnlGZYJ9hmwMb9HAx7Olos9TvIBlRUU06acKePf4b
 slAfcoDErh9sbbLx5YuUVpSU+Gb7gYg7WdO5pe0wPVlT89ETMs1/OtAWIJ21FyzqrrQ/
 7+UrIS8AHMVGWpmXBH/DZS5On2K1BiG3x7FZWWADXAMgWsefKAGfKvP0QM+aNKywP2aP
 VaNxRBJODV7q/jbSkD+6HpK+8z988Qw5J3Ij00KwcSKwGZAE+krFmVH6tBsx/VF8bxAz
 tGH7QOc4Zqvls1JoWwqO2k58vXQt6i2PttJG6u50St9Ez08EG2MAdurdNPywV4tpV3O9
 6c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USv2v4ZwxE9av5kMenRnP4ydLcxdEXeYFT8WV8bcZA0=;
 b=QenqfwEBHi6atmbw6F7IYaJbrRTUROrx9OhKgH1GwXuU48Yxl2VjuNmOghWRCBfIFu
 sv7goP9Amd0qTYG2n1Qp0592QnB7+MmT/PCbA6LkESb9kJ0/qYOeGDR95hY/gU7IFtyd
 IFL6I8eCEx9xEwUwrfofZahQWH00BtUGCOBb7/kEWp4t1pVPXdg1tVxMWyhvtO1htTch
 W4n0LvQzXahP6PHjXdBt+6XwkvRG1TxcFH4UVkx5oRSZig9gKzn9RLFQYiq0us8A3ojH
 NDcU1Ya6O2++n8BSLUL1/8EG0Nmg1OIMHnag90Hgbis5BVddt1d/HF0mfGXHj+Y6bhHR
 8+MQ==
X-Gm-Message-State: AOAM531AFDu00VwRkZnMkpB4MRFs/9xqazcWGrMory/QjiG+8r2zRHzq
 F5YiQ1wt4a23Jxo464qeKO9JIw==
X-Google-Smtp-Source: ABdhPJxDGmdQ9EXQ5t9DpJ2ZaHoXbdvtnVCdH0KAVvgLcCIueQOmbnKkTFxejHHp+IY4gcsWparzkA==
X-Received: by 2002:a05:6402:27d1:: with SMTP id
 c17mr47212636ede.128.1641298873935; 
 Tue, 04 Jan 2022 04:21:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y13sm14713532edq.77.2022.01.04.04.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 04:21:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C3171FFB7;
 Tue,  4 Jan 2022 12:21:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/avocado: add :avocado: tags for some tests
Date: Tue,  4 Jan 2022 12:21:04 +0000
Message-Id: <20220104122104.849084-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This stops a bunch of tests failing because of a lack of
"./qemu-system-x86-64" in a build directory where you have configured
only one non-default target. I suspect what we really need is:

    :avocado: tags=arch:host

to be properly multi-arch safe.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/empty_cpu_model.py | 3 +++
 tests/avocado/info_usernet.py    | 3 +++
 tests/avocado/migration.py       | 1 +
 tests/avocado/version.py         | 1 +
 tests/avocado/vnc.py             | 1 +
 5 files changed, 9 insertions(+)

diff --git a/tests/avocado/empty_cpu_model.py b/tests/avocado/empty_cpu_model.py
index 22f504418d..ffe27780a3 100644
--- a/tests/avocado/empty_cpu_model.py
+++ b/tests/avocado/empty_cpu_model.py
@@ -11,6 +11,9 @@
 
 class EmptyCPUModel(QemuSystemTest):
     def test(self):
+        """
+        :avocado: tags=arch:x86_64
+        """
         self.vm.add_args('-S', '-display', 'none', '-machine', 'none', '-cpu', '')
         self.vm.set_qmp_monitor(enabled=False)
         self.vm.launch()
diff --git a/tests/avocado/info_usernet.py b/tests/avocado/info_usernet.py
index dc01f74150..bafbc0e23e 100644
--- a/tests/avocado/info_usernet.py
+++ b/tests/avocado/info_usernet.py
@@ -16,6 +16,9 @@
 class InfoUsernet(QemuSystemTest):
 
     def test_hostfwd(self):
+        """
+        :avocado: tags=arch:x86_64
+        """
         self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22')
         self.vm.launch()
         res = self.vm.command('human-monitor-command',
diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 584d6ef53f..4e5516f425 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -22,6 +22,7 @@
 class Migration(QemuSystemTest):
     """
     :avocado: tags=migration
+    :avocado: tags=arch:x86_64
     """
 
     timeout = 10
diff --git a/tests/avocado/version.py b/tests/avocado/version.py
index ded7f039c1..be794b9354 100644
--- a/tests/avocado/version.py
+++ b/tests/avocado/version.py
@@ -15,6 +15,7 @@
 class Version(QemuSystemTest):
     """
     :avocado: tags=quick
+    :avocado: tags=arch:x86_64
     """
     def test_qmp_human_info_version(self):
         self.vm.add_args('-nodefaults')
diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 096432988f..1f80647414 100644
--- a/tests/avocado/vnc.py
+++ b/tests/avocado/vnc.py
@@ -14,6 +14,7 @@
 class Vnc(QemuSystemTest):
     """
     :avocado: tags=vnc,quick
+    :avocado: tags=arch:x86_64
     """
     def test_no_vnc(self):
         self.vm.add_args('-nodefaults', '-S')
-- 
2.30.2


