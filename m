Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D013F1F53
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 19:45:56 +0200 (CEST)
Received: from localhost ([::1]:34246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGm72-0002Ut-07
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 13:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0j-0003Fy-C5
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:25 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mGm0h-0000f9-Mx
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 13:39:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id q2so4312912plr.11
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 10:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uKACz5OqsekNHFIwRU3Lz9Hd8OaVdD7SYAY+WghaoVk=;
 b=S2M1JaH8zOkD4j0IADktN2iLoxFbumRZIB8v5zFUXlrghQZSx5Jtz+Idp/CZ6LhNDr
 oSlrLPsafGvZ4pM6vrdEo+9SASh+3Qnsbe6vBdODY+tBPzkxXBlqqjHPWsEwsRDmI6wd
 sb4Uvq8P0IjedzzM0yvsm5IuZaHRgm91jyLsBrwcTUH/l7B51ln+p/qeI7zUi2KDPimS
 Ost4fZNUPphx4pD5Bz8ab4Xd/HG/7MWf8Z1uqZmhCrgm4ahFM4JXn5ikb1V9xdcSjbsE
 55UZUA4qJ7EvTHwcCWIUmmF4P83O0v9seulvu+DJl1ewS7aDzh+OEwDr2FQmzBte7xu/
 02xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uKACz5OqsekNHFIwRU3Lz9Hd8OaVdD7SYAY+WghaoVk=;
 b=ECngsYQSbeUiqd/9Mv6oNlFQPiBtryVs4+NWQdiVCCNTKo+RC+LLbjCRfjU2Uc8yPC
 B5zvpKv7Ga3gsZm0eDY42hP3mOesc2L0qbhzDBY3NpH2FP5q+Ps8P7B3/KYSnMrkOts6
 axLHNNudzvKgxBpLx0SW3hb+RHWLxjbbDnhxNipJf0FdZ0KtaVtp6BbuZcwcJcKHtlhN
 jjX3jvehxv+M4aF6EsWGlwZVFU1z0G1bXyFXGemX/Yzoiq+AbtvmJc+RsgzkFlAvKIij
 u274G9vo2Yy9aTjvEzdZmUbC/lNvjxDh97u7sLmAGh4+3Qapfs3o8+dM8GK/xLMZBIQc
 y9ZQ==
X-Gm-Message-State: AOAM533Ohi0EeBNu9zaHAD1yu30Scj5lsF+RDvtAhwEKhe5IhGAJlZNl
 svhPlciwnPGRAnwOWdAy1gbxOCIx39w=
X-Google-Smtp-Source: ABdhPJx5+4KosVBQXq8lskonCj4a/0OTTyTFThUXnjmv6U0jWWazyjEL+n/Obfyrd7NhxHDi5xz8Dw==
X-Received: by 2002:a17:90a:7061:: with SMTP id
 f88mr8521205pjk.121.1629394762227; 
 Thu, 19 Aug 2021 10:39:22 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.8])
 by smtp.gmail.com with ESMTPSA id s2sm4061090pfw.193.2021.08.19.10.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 10:39:22 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] python: Add dependencies for AQMP TUI
Date: Thu, 19 Aug 2021 23:08:26 +0530
Message-Id: <20210819173831.23515-3-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819173831.23515-1-niteesh.gs@gmail.com>
References: <20210819173831.23515-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x62e.google.com
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
index e83c88db2c..a0ed3279d8 100644
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


