Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4663F1F54
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:46:03 +0200 (CEST)
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGm78-0002lg-8j
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm14-0003Sv-IE
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm11-0000x4-G2
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:46 -0400
Received: by mail-pf1-x435.google.com with SMTP id 18so6179036pfh.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bfGJ7tGClvQrhd++AO2QAx+QBlxrMwpmjVO+pr4JCRo=;
 b=vF/kwKu5LbTeC4lfCl9A/GQzukH+m81piOtggR5gk5ngLKZGW69ak1S0NEndZzkcuh
 5t2PlqOBKXGfKnK4uT+/VS2k0iZT3WbCGOLdLgzlmdADr2FaThEdIKud47g5HgU2jp37
 fsvWpu9WWg2ymP7/UCt71XtOGeyN0MQWK+Km8suWy/uWymHwQX7Qdo4B4hmGSCBHULhg
 LKvDDUDonl5QEFhnBRYPKbQaGZskuSgZgRWRhFqdRXEiW0bnf9vJDqnxtY2IEDZw2N3z
 1EvcxjpFuTrK6Shill3ucdq/ScFP3VqR+EVmZ7CVskUsOkZYSlcnaNsPs1sg0vDeb9ot
 3Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bfGJ7tGClvQrhd++AO2QAx+QBlxrMwpmjVO+pr4JCRo=;
 b=UdxPZLHM+ROZz4MU8spUCllrN/P2p6ByGJJQl4wEN5WD5SL9iom3D0SeIruMfkfqVK
 lWKcBL0mfi3q4cYALu1Q41vKPo4/nvnM49Ixrg6PoF3+XFjTW59ZPYl8oIprqQkrWYkK
 VpN6iqb4IrkyCGffVoTATFafX65K6GS976ljWzlEmMjJJpDsx3mM+fbcjj0mvjhcm57r
 GsuwhgRU3UzrTAksGm2cozGWszGJ5rCeOM6+mXT7cUp0sbQbJThfCRQH9AnifZ/ekLJq
 NY4KTVckaAfBfb0QyZOc1oLckP7Ac2yRZ5Ckz+dVw78gkZJTcK2hfRAdFxZ0uKqJbBF0
 hBew==
X-Gm-Message-State: AOAM532dZtp+jvgECStmqoFLgg9t0Ebtm6wU9zpUIMS1YMCAfFfbYVGu
 9TBcr7M0d+s0RdIvdd6eg9U8OYnZEoA=
X-Google-Smtp-Source: ABdhPJxvRmA0Z9Jj3Fj4WPnVc4vR0WzZOOU92SVOCHdwIX8HqclrR1blBlu9CyHtQ/QO2kqLM3Z1cw==
X-Received: by 2002:a63:6ca:: with SMTP id 193mr14941452pgg.265.1629394781087; 
 Thu, 19 Aug 2021 10:39:41 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.8])
 by smtp.gmail.com with ESMTPSA id s2sm4061090pfw.193.2021.08.19.10.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:39:40 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/7] python: add optional pygments dependency
Date: Thu, 19 Aug 2021 23:08:29 +0530
Message-Id: <20210819173831.23515-6-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819173831.23515-1-niteesh.gs@gmail.com>
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pf1-x435.google.com
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

Added pygments as optional dependency for AQMP TUI.
This is required for the upcoming syntax highlighting feature
in AQMP TUI.
The dependency has also been added in the devel optional group.

Added mypy 'ignore_missing_imports' for pygments since it does
not have any type stubs.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/Pipfile.lock | 8 ++++++++
 python/setup.cfg    | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index da7a4ee164..d2a7dbd88b 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -200,6 +200,14 @@
             ],
             "version": "==2.0.0"
         },
+        "pygments": {
+            "hashes": [
+                "sha256:a18f47b506a429f6f4b9df81bb02beab9ca21d0a5fee38ed15aef65f0545519f",
+                "sha256:d66e804411278594d764fc69ec36ec13d9ae9147193a1740cd34d272ca383b8e"
+            ],
+            "markers": "python_version >= '3.5'",
+            "version": "==2.9.0"
+        },
         "pylint": {
             "hashes": [
                 "sha256:082a6d461b54f90eea49ca90fff4ee8b6e45e8029e5dbd72f6107ef84f3779c0",
diff --git a/python/setup.cfg b/python/setup.cfg
index 64ed0be0a7..1c2e879a4c 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -46,6 +46,7 @@ devel =
     tox >= 3.18.0
     urwid >= 2.1.2
     urwid-readline >= 0.13
+    Pygments >= 2.9.0
 
 # Provides qom-fuse functionality
 fuse =
@@ -55,6 +56,7 @@ fuse =
 tui =
     urwid >= 2.1.2
     urwid-readline >= 0.13
+    Pygments >= 2.9.0
 
 [options.entry_points]
 console_scripts =
@@ -97,6 +99,9 @@ ignore_missing_imports = True
 [mypy-urwid_readline]
 ignore_missing_imports = True
 
+[mypy-pygments]
+ignore_missing_imports = True
+
 [pylint.messages control]
 # Disable the message, report, category or checker with the given id(s). You
 # can either give multiple identifiers separated by comma (,) or put this
-- 
2.17.1


