Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A483A3F5368
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:37:54 +0200 (CEST)
Received: from localhost ([::1]:36540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIZl-0000vy-Jl
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIIY5-00083a-FP
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:36:09 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:44800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIIY4-0005kP-2l
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:36:09 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so32158470otg.11
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h5KtKMWDDVs8IAOwL+94ObAhGladPMl23HCiYjqXkEo=;
 b=P2rrMIdWeCdJxaFglBKLUf7xMOTdXrQ9qqK3hCQAHDpgE32G+YiKSv5lWXMwP6fa4x
 OCvwgzUdyveRnoetSRnzmhzCO74qrinN3wV2ASt9zFcqtD1lMHxWL1cHqaBAI5uas5/b
 fDLhh+4hyRc4gK44RWkXUk00pOM3okJ4/sD2STJYu8PZRkzviWbiTDRjXOrIQK4kTWgk
 KG7+ks1dCG/5fuD1ZQohzH44Ge60m1fNmiVtZD+vxeTh7uCg+8bpAY3MD5I0gzxtekG7
 N1YJEjWC+d7gIVjFEb8suqdx1YwI53zd1L9+OwRE7eeBifoPsOpzQRoqtF/2LhDh5Rrj
 OoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h5KtKMWDDVs8IAOwL+94ObAhGladPMl23HCiYjqXkEo=;
 b=cTkdgdT764Xg7HcdhZ1q/SNwcd5gwjKefl5bSN5LHlOAAj6CGBOA8naSl+Byg4mmY2
 3z1cXC2+HQVyvxXBL40/7m7qr498t8XEqYmuJrCzZpszSLYZZKQCU9W21q/x4EEwBeHu
 t94ridg7lIJyHWKPf1TjkZr46PYMy/krYO5TCL+pfndmoI8FEL59Ma/LAQ17i27/B8/L
 YG1ILSgjbk5AyqBDk+Xfb0sa/W7vxt4IWenhn8rAL17Phsy/K5L+6mthPzVps9my9QDC
 118aofdbS+xKGgXgpRUESfHYtCJ16ORM7YELM4xEs7YyD1NPo2NwPUtiuBarjrTSCa7M
 G3Eg==
X-Gm-Message-State: AOAM531D/3zOeKIVSJDAoZha1GdEShcwvYHYsf0b+RMh8o8RTVN0nW2/
 8AQzRo33gPnGgkM/ufdVeexzLMNcE/4=
X-Google-Smtp-Source: ABdhPJzRfDSxUULmrxlUSUNHXtkM4hRc2keXhEigDjdBbfu9hl1hBhsZdWfjAqV6gAkncaWqh8AxQQ==
X-Received: by 2002:a17:90a:e416:: with SMTP id
 hv22mr740552pjb.232.1629756481456; 
 Mon, 23 Aug 2021 15:08:01 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id j21sm16217454pfj.66.2021.08.23.15.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:08:01 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/5] python: Add dependencies for AQMP TUI
Date: Tue, 24 Aug 2021 03:37:42 +0530
Message-Id: <20210823220746.28295-2-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823220746.28295-1-niteesh.gs@gmail.com>
References: <20210823220746.28295-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=niteesh.gs@gmail.com; helo=mail-ot1-x329.google.com
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


