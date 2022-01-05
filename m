Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD1485403
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:02:50 +0100 (CET)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56sL-0006OQ-60
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:02:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gS-0008Cv-OY
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:32 -0500
Received: from [2a00:1450:4864:20::52a] (port=33463
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gP-0004Ee-38
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:30 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m21so163452682edc.0
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=USv2v4ZwxE9av5kMenRnP4ydLcxdEXeYFT8WV8bcZA0=;
 b=CC1gM5Z10hesHgQLd15MI33ono/PffFCcYtrLwPpa6tVuSeAiCd1CE3sOtdMYIv25w
 j6xSyRK0ErydQXVIDxO9XJSyY8SD4lo+1NzMQCsRPdbWJGbosMrcz8crWlbUFCNzroej
 TVI+CsnsmU+ALlCKfruU/3yum0x3Zd3llVHjzrsrSQmJBuHjPcGYizdhm50kmW3c9YkN
 eMc0jXjueOpvTylqhOTrYl39sP8xqzVKt+0u/lqxCBwMlUNUdOSNFLke28ejpIoQH6x2
 TnWEt1Hzu97jMZNPeuxEtKXUBVpGyyMD8xLour9AHZmbWk7bK3sDiUiHhweA5FTE6rc4
 J4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=USv2v4ZwxE9av5kMenRnP4ydLcxdEXeYFT8WV8bcZA0=;
 b=etnXE5gQken7l+v2TWZ+/7LH+z+dNCvlH9tCc1U9GAQWeHBppKnR2FXWJdi72V4EVu
 ejIEM/hd/PVdeS7G8oL5ctTDrfR7LPhoxL0TNwtN9bT/8x3rOgamA+v9N0Yxld6Gu3MP
 uo//FzDqkgy/DGErvDtt1MYwFjHYfZp3ik2VaOPAGs10zVFRaff71LLifmPoHESXHCzt
 jJGbAJuMhamklj1G0H/TnBjtUG+e0E/AH8qcXSnCgTjGZi0otsRg93i6bn+0iCwb8wyJ
 aj6fJoRAPxgX+pTdL+2p45K5Ygey6u/Hsra8HX8mq6+NX3jjuAyCYNflGcaGTv1zPhtE
 8vsQ==
X-Gm-Message-State: AOAM531rI5iIfjiVs/05f68PsRoLERyTvmlXIPz+RTM5JrOcXoftSml1
 0WqIjh8FkJfb7P0PU6ZOURN/kQ==
X-Google-Smtp-Source: ABdhPJzqoYgiJMUPgEA9NJ+yPju5LyxzI1do4fe6+2RobJmC/ixCO/dMoHeeFlDBMASatNZrJG+vHQ==
X-Received: by 2002:a17:906:1b52:: with SMTP id
 p18mr42163000ejg.564.1641390627766; 
 Wed, 05 Jan 2022 05:50:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b6sm1692085edd.47.2022.01.05.05.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 929FF1FFD2;
 Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 27/34] tests/avocado: add :avocado: tags for some tests
Date: Wed,  5 Jan 2022 13:50:02 +0000
Message-Id: <20220105135009.1584676-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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


