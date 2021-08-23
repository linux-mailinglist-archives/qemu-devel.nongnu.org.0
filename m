Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3566D3F4E6D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:33:43 +0200 (CEST)
Received: from localhost ([::1]:32900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mICtK-0002Qs-9B
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mICqu-0000QI-Dt
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:31:12 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:34378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mICqs-00088l-RB
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:31:12 -0400
Received: by mail-pf1-x42a.google.com with SMTP id g14so15835668pfm.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h5KtKMWDDVs8IAOwL+94ObAhGladPMl23HCiYjqXkEo=;
 b=iXzK6m4PEyiHn9SLvit8uEGqdCBfedGRQeDC0dyE4c+hizO/8pHiyBUCggyD2COnFd
 knKUt91f8SvGcDf+Mp0pdexOYjfZ77JvhN+AehBF0oeDZxm2/hpALjz+EeftquKB9eq/
 zYSJ5CEUFSnNJHQ4xKRl4LSdPhB/+8DFK8QttVEXA9rj/FVcn0MrUGumkI8OchnAdD18
 6wU4EHMzm6/I5Nhz4cYDUExZ5UaeHuu7XjUExLlN4dpBgirLnhqhHhCmRgNHigBaKTcw
 Sk8kgBIzYqudqBnW4pnHoIBmfxmc7qhqyCHPZUMZnx2F+Hix4227Ar4r/7lyi4DzB0n8
 ed0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h5KtKMWDDVs8IAOwL+94ObAhGladPMl23HCiYjqXkEo=;
 b=QqKE+mpzeaoVMfhqHqxHdwNrOQ7z6qkDKuwAOL10Le5owYhs/bSyRn2Kn+2ybC3iQj
 xvJYM/f0Vc7wPcZAL9svr/NwUjAQz3Scji1cF7rQEVFzWbVBRGdtoay4VwndagY40Dxx
 9dNH6qyI4BFZHW2H7LREDSxC6nuKwfOuAoTMVyLsH15g5fRupTg96sOitRiCvkq/MWkB
 XFBj8Zmfkn+ND3NaL/mlfiLf4WxOu94GUWGZtOvZ3J3XCNCVYeWoAhnsVYfmwoC+tWIL
 VoT4201RbCxYRBOS70jp0vF4d2hvTOU2LFwedxe3gHzNBg4FGHJ34IJv10VChceKhNOq
 oxaQ==
X-Gm-Message-State: AOAM531SL8//HC6FeI2XFpWfzj5OWeeEe6izrefx3t7/DgrdKDM8eJCo
 lNtQbpTialpQ3k4oqtkbjYZx19Jbhs8=
X-Google-Smtp-Source: ABdhPJy7AkZIg5LPQwpnk78JF8OYc+D0+gF6SSSg9LAK8GR2MOlWaIrq2sAXPKKxQ1uT/12ESzdR4w==
X-Received: by 2002:a62:fb13:0:b029:309:8d89:46b2 with SMTP id
 x19-20020a62fb130000b02903098d8946b2mr34327204pfm.67.1629736269242; 
 Mon, 23 Aug 2021 09:31:09 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id x19sm16371243pfa.104.2021.08.23.09.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:31:09 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/5] python: Add dependencies for AQMP TUI
Date: Mon, 23 Aug 2021 21:59:34 +0530
Message-Id: <20210823162938.32757-2-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823162938.32757-1-niteesh.gs@gmail.com>
References: <20210823162938.32757-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added dependencies for the upcoming AQMP TUI under the optional
'tui' group.

The same dependencies have also been added under the devel group
since no work around has been found for optional groups to imply
other optional groups.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/Pipfile.lock | 12 ++++++++++++
 python/setup.cfg    |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 457f5c3fe8..da7a4ee164 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -289,6 +289,18 @@
             "markers": "python_version < '3.8'",
             "version": "==3.10.0.0"
         },
+        "urwid": {
+            "hashes": [
+                "sha256:588bee9c1cb208d0906a9f73c613d2bd32c3ed3702012f51efe318a3f2127eae"
+            ],
+            "version": "==2.1.2"
+        },
+        "urwid-readline": {
+            "hashes": [
+                "sha256:018020cbc864bb5ed87be17dc26b069eae2755cb29f3a9c569aac3bded1efaf4"
+            ],
+            "version": "==0.13"
+        },
         "virtualenv": {
             "hashes": [
                 "sha256:14fdf849f80dbb29a4eb6caa9875d476ee2a5cf76a5f5415fa2f1606010ab467",
diff --git a/python/setup.cfg b/python/setup.cfg
index 152c683f41..589a90be21 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -44,11 +44,18 @@ devel =
     mypy >= 0.770
     pylint >= 2.8.0
     tox >= 3.18.0
+    urwid >= 2.1.2
+    urwid-readline >= 0.13
 
 # Provides qom-fuse functionality
 fuse =
     fusepy >= 2.0.4
 
+# AQMP TUI dependencies
+tui =
+    urwid >= 2.1.2
+    urwid-readline >= 0.13
+
 [options.entry_points]
 console_scripts =
     qom = qemu.qmp.qom:main
@@ -132,5 +139,6 @@ allowlist_externals = make
 deps =
     .[devel]
     .[fuse]  # Workaround to trigger tox venv rebuild
+    .[tui]   # Workaround to trigger tox venv rebuild
 commands =
     make check
-- 
2.17.1


