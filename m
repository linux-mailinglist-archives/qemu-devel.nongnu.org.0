Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C13DBFCB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:26:55 +0200 (CEST)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z5q-0006mc-7x
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyc-00055J-8N
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:26 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yya-0000zq-Kp
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:26 -0400
Received: by mail-pj1-x1033.google.com with SMTP id mt6so16895349pjb.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x8nI1gjkdCEj7MHHw+ygQfpgEXfIOirnsZ0+rfOXPbk=;
 b=V+F35C8DInqs/g2pmgBlLLXaq9onEpa1xnFXp+7ZhO2VviZEVG9xf3mkBzlueDaC1J
 8KgkANyCEQpibeOZEA6poGgioSqhsEUTEGOeSqdgVMo4esL7nAl2BZik3Vy0Ly5n52ty
 6DYms6tcFLyoUlsj7upeFfl9m6kRswla6Dn88N0jOShqlAY4RBdilyS5PZF11SyQwnKN
 nqeDPVmKVO/quNPrbmTBaPQIMghyPv0ape8hJ/zzLcGJx4FuXSh/LdR77CbPC6m27I21
 GicpH/GqNBvHlSoibjf2J1TcANN49xsyBOzw4lcvkbJOv3j8GGzZU6R/JOH6BwP3gUF3
 WWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x8nI1gjkdCEj7MHHw+ygQfpgEXfIOirnsZ0+rfOXPbk=;
 b=jsvpFEVDXRIl3WPyi3wM1ce7vdFPAbA+n2GYrWP4GyIPBBrXZKEVrNPw5apXB8WNfu
 gOJl0T22mqEzvW1DwWs7VI7M15BocOKYoDXWP/UMDG8O6XeRVFwRPLwuhcmU20SNpJfO
 bJa3qBudnIY7JDvJendrt1IZOKyC8HkvuajPCDAibQ7taOkN1e+FJMLZVAPEo9JO1fg7
 IiRSZolj0ffKGbumbBAUqfqvBTeib0kvDHGWqUa7E1S/zQ8YgpcJjPUUAAF8LCPozi0T
 vIMw8uCrxxPUehsB5KpSpmyFbGekAEKHSDOGHrhPA0NxQrBnoiJlGyV9glVoeQHaVa7t
 hqYA==
X-Gm-Message-State: AOAM532GNln3lSqTyp/GEfzXxWSA9tUtP+dSGCOoUcwbWg8rzbvxCawa
 iNas4Nu7Uxw+PsfUn+9Nb+E+7jBDfquCAg==
X-Google-Smtp-Source: ABdhPJyF+r/NBTGNm7qZ0hYbNxBgywI1hm1kPEtt4tgR/XfwfMisJXlkd358DOSXzrzgd1bD7xOFOA==
X-Received: by 2002:a62:79c9:0:b029:3aa:ef64:1569 with SMTP id
 u192-20020a6279c90000b02903aaef641569mr4586005pfc.8.1627676362226; 
 Fri, 30 Jul 2021 13:19:22 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:21 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/13] python: add optional pygments dependency
Date: Sat, 31 Jul 2021 01:48:40 +0530
Message-Id: <20210730201846.5147-8-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1033.google.com
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
index 11c6240aba..bbb7306c3d 100644
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


