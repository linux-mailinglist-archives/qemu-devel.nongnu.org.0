Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE33C7976
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:14:27 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Qfa-0006i3-TP
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZ8-0001F4-91
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:46 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZ6-000655-S9
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so2215862pjb.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t+Pe/eROmqykKa9dIoKt2kOQl5E0f+1/SQgnS/Y/Hus=;
 b=DaaupQIhY5og8J5aMaC9T8h7i09/ZaFJDtat8+AFZXz0xiea3u8XArwXpbDKqd6zw8
 qriGT7wIFvwtvBgATf5pcXQSZP3bb9u7ly6b1RJdSF+YvbxGLFgAc17k81KBl1Nm7XS1
 OxAlEd7OIcx/ONy+3LX5xLmPF7oUzXx3/cSJXFtxCc7XMHxc3Z5RNMXXS+uvjVmlH3uQ
 hW8OkANXHC2Z5drEIfbgRFWJ/+YpgWD5QfILXC/bevjDff+60Zb+Ot34Q4m+Ca/1bL/a
 /pklYc/kLpgvx7jG0RZoWsowjdhZCjCa0XV78XqNn1nzQ4OQ7krVD2mgAIMRb6r8XcYF
 pl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t+Pe/eROmqykKa9dIoKt2kOQl5E0f+1/SQgnS/Y/Hus=;
 b=Pp3+3/T0T24EmE2SRvMczGg8uovEzdvUBOnNnLeW3ovVE+umxxVvCrlTNwfu4SQ3kY
 GBOZeWQAO8yX/MZGsbrCmA+fzKa9VFUs4OsUuYqO7XNOQPs2dj7ihIN6JaZblAdh+oJ4
 IuqTL2TviJY0RGQ5duynnsPyNv7Qu+dFbnML+ndL2yFDSoOXIL82ETzbqjbb0/2VaKpo
 4feahkO+a9nrEpP8dY3GrHpu9uNoJari7ggICz6ivbKdv+oJ54+8LnIHrX7/Fsk2FUat
 MZ8jWzmbq0ZLM+yf9IzElm5EDDXzsroRDUtm1qTsNNdX6GOhjfZPzigh7DBV+MN3OmBp
 c5UQ==
X-Gm-Message-State: AOAM5314qvHjSD3XwMxapGtIej2lqYi/bjdtk7z39YJsxtybWnqJ9ges
 x+Hoxfo/THb85Cu1uhB8Z5dN+hsGJLQNhg==
X-Google-Smtp-Source: ABdhPJyH0QooczI9Al8PV8ly3DZnyg6CZn0CaIZAXd/C+2+XHdybdwRd786nA6fDlif7MMgaZT/xuw==
X-Received: by 2002:a17:90a:6782:: with SMTP id
 o2mr363791pjj.165.1626214063318; 
 Tue, 13 Jul 2021 15:07:43 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.183])
 by smtp.gmail.com with ESMTPSA id w16sm94678pgi.41.2021.07.13.15.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:07:43 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] python: Add dependencies for AQMP TUI
Date: Wed, 14 Jul 2021 03:37:30 +0530
Message-Id: <20210713220734.26302-3-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713220734.26302-1-niteesh.gs@gmail.com>
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
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
 python/setup.cfg    |  7 +++++++
 2 files changed, 19 insertions(+)

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
index 1a552d672a..c62803bffc 100644
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
-- 
2.17.1


