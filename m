Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435943DBFBB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:23:46 +0200 (CEST)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z2n-0005mz-B5
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyN-0004NZ-N3
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:11 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:55143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyM-0000rF-56
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:11 -0400
Received: by mail-pj1-x102a.google.com with SMTP id b6so16832836pji.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JAf48jWFc6CWhxcz/To0pdxZA1eMGrXjmRvqBvFFYSU=;
 b=q503bZuiLhXVqah2BTSEAyopnBjkbw+au1CMnk+E9udcFYfNRPtCZzHDy2ZWtq9Q/E
 qIyUfO8cYlUxHU6Q/xNflyQQrNXvAjcrzlopOQwgRJUjj31IrzBEHLJgJ4wMM9PIZxow
 6buqqhrWd39FRHn+nmS6IhQGDEF/cg0D6zrpFT5vJeIZ/6q2Pa4beLQoovBVweIeBrWR
 ZQLkXd3HaDpIY2Ux2V17fG9l2l7Jwcn9LI+QAVCcYE4QijPcnYF8lwF1BxqTs+2lKZjo
 EDxJEXmbAiZFvGzIWIvDc6pldwTDshftGvcNoqB4QQtqqpCz/Be3u0b4Solz9fceHAAx
 90sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JAf48jWFc6CWhxcz/To0pdxZA1eMGrXjmRvqBvFFYSU=;
 b=fZ6WWQEi61j0zIPcgS42uiFy/bm8CMx/wG+ME6aXuYmEdeH97R8NR0h6+J7oLK8q+x
 /qgRO0veEcYtWpEkBnn5rWfsknc0FpWBos8PbX9TUf8bTQQIXIm835ZNV8FbvBtgdh3Y
 FCeq5moYqU3mKJ907wXzfoONc6WpEfblnQeWgKh19D7MxksjoXWSCtlI+aATj7xybZdv
 k8ErV5mSuN+oaszWudQ18RvOkfrqLoetwdeoijXDVlXJi3O6Gzf8CEH32VCIRhfVWQSQ
 aE2J7nI0i9d6WjeVVVbpV4Bal9SwteuiGhdA1w6Wg5/BVirJTAh9WO0PFgFElQ0ht9wz
 wrrw==
X-Gm-Message-State: AOAM533VYE0xeULZG8r3ad4LRnkSeQYS32jsnLSolI8q0WudjYGTTAlP
 KQGaipHsN+jODVOqNTPhCop3mUDkheY9Ww==
X-Google-Smtp-Source: ABdhPJyk/pUKKLGWHvwLEd370Wx77HDmf/8ZFUlwoI2lePSYu11Iad2jJ6jcXzx68KmRwnlKC/5Vxw==
X-Received: by 2002:a05:6a00:2282:b029:32e:37d2:d35b with SMTP id
 f2-20020a056a002282b029032e37d2d35bmr4454061pfe.54.1627676348691; 
 Fri, 30 Jul 2021 13:19:08 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:08 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/13] python: Add dependencies for AQMP TUI
Date: Sat, 31 Jul 2021 01:48:36 +0530
Message-Id: <20210730201846.5147-4-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102a.google.com
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
index 8ab41a3f60..76cf1e4930 100644
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
index 7a30dd5b09..d106a0ed7a 100644
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
@@ -133,5 +140,6 @@ allowlist_externals = make
 deps =
     .[devel]
     .[fuse]  # Workaround to trigger tox venv rebuild
+    .[tui]   # Workaround to trigger tox venv rebuild
 commands =
     make check
-- 
2.17.1


