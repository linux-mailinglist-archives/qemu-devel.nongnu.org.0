Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D93C7964
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:09:56 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QbD-00045y-7u
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZC-0001Jb-J9
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m3QZB-000690-4b
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:07:50 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso143464pjb.0
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CIT5Qi+TmHYy1A7fr2pjHtK64KmgdsTMU/FvGBocCwo=;
 b=ZzEAFcpXy15NS/tpYV5KUXSNlQszmp20JMmyPQPUFEPZZgDIHUoodl4P2wozG1SF8N
 n6R7fBw0FLDW8wNgXWLMFA+UN7xYfJoJyGeyKFUQkQ8v+0dOvVRpG2YcG921sEHLAqOA
 2gS0kYxOkrfjYGXN1+Eer7zpa3wlNhE+aTnnaeHzOqLj6PWif4MApsgUwu+0xmPfIPyO
 EdDUp/MQDI0EAm5Irpg0Efldjdb//syeKR76LvyIRuTEE+tawjw0BxSZDOtbbDc7ifXh
 sTIHoUuvThqTLaBoxlO9nQmRkQMIvmmb5DnLgWO/Ltu/E9uQbKx5Q/DBY63Yb/Q88Kqn
 OzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CIT5Qi+TmHYy1A7fr2pjHtK64KmgdsTMU/FvGBocCwo=;
 b=ia+Qn9t7SxED75Xr792Eavia8gZ3a1ngWNJifVW1Vken4d3dekWUgWAfVumHzfpYgi
 VHDQWEdyi2D+a2mBw5hwHbnd2Zh+mPhNGs6qeYR+fnHfErE95cICb9GIZB6CsQ3jo/Y4
 N4KI+uW7nFqLSNH/GMjvOJyr3E+vom+N5cSXmk1VHv23BIdE4pnUOYql9x7XoG2E1xKI
 D2CNNoajPjsTnvD0NNgN8+oq/7Q4tPdo+6h/8P9+fGp/DvtxOSxDt5UT3CQ94rCaqvNk
 +ZMfcVxY+wD2kOAp/8c65MfFBJK/QTUBBIS8ooT7AvZ8Kvp766bciADAsApsdCBvwvVI
 LcwQ==
X-Gm-Message-State: AOAM532Wtrf3W534P/H9TToTxaK065ki5UG018qtrk0Kv37AoPQIjZ3Z
 L0wPt1vAknhoR9crlxqwXc6f/i6jtQ4w6w==
X-Google-Smtp-Source: ABdhPJzPe+z9JeU99Ts/ydTtTZlovnYfwpe1oud6onRZZtC4XqDIVYCDe59Nv4T0QlND/slizlwaxA==
X-Received: by 2002:a17:90b:110c:: with SMTP id
 gi12mr4043282pjb.163.1626214067878; 
 Tue, 13 Jul 2021 15:07:47 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.183])
 by smtp.gmail.com with ESMTPSA id w16sm94678pgi.41.2021.07.13.15.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:07:47 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] python: add optional pygments dependency
Date: Wed, 14 Jul 2021 03:37:32 +0530
Message-Id: <20210713220734.26302-5-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210713220734.26302-1-niteesh.gs@gmail.com>
References: <20210713220734.26302-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102f.google.com
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
index 76cf1e4930..2c6d779348 100644
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
index 7e5aae66c7..63f5156c03 100644
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
@@ -99,6 +101,9 @@ ignore_missing_imports = True
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


