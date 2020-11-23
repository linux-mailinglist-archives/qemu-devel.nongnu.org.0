Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3542C048F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:31:52 +0100 (CET)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khA4U-0005Ni-2m
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yM-0007or-78
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:30 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kh9yK-0004dz-1W
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:25:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r17so18272556wrw.1
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=644W6rrDPLrNr7S2TwGppHLCrtDMovLSq8gfgpARDEo=;
 b=CQY8YUTIU+Vfsw45igkx/uBD5iwej0kVqlU/qNq+se7ZKRDoGK6kfZYertLRNqZFLP
 pjgSvnK+zsDy+6gb4+8W6cfg6aovjfbiCLaKf4i/JVYWeAVY8djw3GSNNDzs1Ub0CG8u
 8r/Eica8yzUl1TynTPgvKR9bwkKSrTcKqtaD8J5/3NXzWfOOwHgQNe+6P8swyW9e9RS3
 vdXEuVt/TrXDSL77tuSZDTxHszyD+UdhjPZVYc0nImAXOE49lgOQ98T1g3yveFWUrcWA
 uJLytPLGKewep0B20APb07kalnLdgfAC2tRy6oT9uQKdPNaKKxppViPdij/Zqzn2iHiD
 n0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=644W6rrDPLrNr7S2TwGppHLCrtDMovLSq8gfgpARDEo=;
 b=pXXCVcxzoyMuuRrxXuJIRBU+hgYMfl9RHXlPJsMQCCLCxqKxR1FmB/UJtfQ8b747NE
 O+/n9agvAysHBHNLVN1h+UBB/mnNly3pqdJiKa/ueHJ8qM8HDIEvY76UZP7LmNMNf4aW
 hoUIordTbdeshK7BD2csIs9SmPIc8oKqMaIi8WypzFSsX4rst6SVJ63jLImmbz+qpXDB
 dL6QTkR60+kG1V6Sl27r25NABlyL5Pq/J1bZ8+HJEMHT5TeJJTcMgvJ0lQGcJ4KQc4VS
 x3aOORDBFYqIOHZPyZjUWPceTcEPPQiSTb+vDjy69M1mfM8CMhE9dvTiMZwZAWOWqraR
 NX0w==
X-Gm-Message-State: AOAM530V+BqOwYmkyQvChxHCWJeUyquKdE8tg8QXAGgWm/bHIOWnxqnb
 Ik1A2L7eKzZHsDeVTi5W7r7UAw==
X-Google-Smtp-Source: ABdhPJwrtl5M5Ei5w0G87460XM+8YARKm/0rjWKPi667yBgvyJbHu2hbzGclfBvikjPRzxRalhhG8Q==
X-Received: by 2002:a05:6000:89:: with SMTP id
 m9mr30708457wrx.412.1606130726289; 
 Mon, 23 Nov 2020 03:25:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u8sm16155186wmg.6.2020.11.23.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:25:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13E271FF8F;
 Mon, 23 Nov 2020 11:25:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 3/7] tests/avocado: clean-up socket directory after run
Date: Mon, 23 Nov 2020 11:25:14 +0000
Message-Id: <20201123112518.13425-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123112518.13425-1-alex.bennee@linaro.org>
References: <20201123112518.13425-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
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
Message-Id: <20201117173635.29101-4-alex.bennee@linaro.org>

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 307020be45..bf54e419da 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -171,8 +171,8 @@ class Test(avocado.Test):
             self.cancel("No QEMU binary defined or found in the build tree")
 
     def _new_vm(self, *args):
-        sd = tempfile.mkdtemp(prefix="avo_qemu_sock_")
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


