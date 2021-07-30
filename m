Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8FC3DBFCC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:27:10 +0200 (CEST)
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z65-0007Yf-FP
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yys-00060g-9h
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9Yyq-00019y-JE
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:42 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so22461407pjb.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Dsu/4D9anWF9gnF2alt4V4p0NibEInA/6NoWQOcZZeQ=;
 b=l5ZtYm571GU8Dkwhkk1MsPyhAqnZnQv3aN5bYzO/KINiECVnewgalqNsAgZSKwmci5
 qq4k3ZEMd1aYj6YDN6ZOSh8wdY5kiJiV+EGd9+eKM0oFyl6La6rzjET2gkko9aNVS78/
 OrEc5D4IZV2hKCWcTroJfQNI3ZifRkXpZbx7/tcJnMj53/ZZM2CQ4qed8qf8DVnf/9iG
 GoMCvbN+jVncwDHZdXQ1VHoCnhmb/K4mRSQUg/5w5xste3moHOOATL5o+rTAWIBZTNjc
 8SvYT6LW4hKV1p5xsl/otWVNMXxKsIJ5AJD6DnfWRGNuPv9dhUCLvJrKwFwsHQrEtAyd
 acQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Dsu/4D9anWF9gnF2alt4V4p0NibEInA/6NoWQOcZZeQ=;
 b=aV4StURAwVwmbq2MK82h5P0di/0bey4TFi2mmXxrQeWLmggnoG52uOjJBlH9i88My6
 X7Rc7Yl9aTX5etOybpSyWvR1yDstwq4Pk2KrkUv48L2IOweZmqUtGOFx3fxl6Wx+SU1S
 31KxtyR7Tlg/8KsjpcCUT7V9/ia+etANL7SxAzHKhnp5zFHLzvPAaqp9EuF90+dPP6Ji
 ZA74bOk3tCOhLbzSaeCRsz6mN13oT3RHjdLHC/XrfhLexzObgxGgJ1WB5sr/h7T34pee
 N/nujKNpAFEk+92KoA2NbBMiOw/EWbGbnhD1XMFoU240cZEL2fRHuagZbCvdKeHhQgRC
 mBvQ==
X-Gm-Message-State: AOAM530RUQ/a4o0Gua63pXwlj1h92Y6Q24BE7Wh4QPLY0SqCsiTc++Ie
 oNhX0QJDo9DNGWjfNaPecYVqlVgcOxl8Xw==
X-Google-Smtp-Source: ABdhPJw5CA1Xt8Y3ugo1Gmgtnl0n9O/+3tXowogP8KTILx62qJW9ilHv8M5rq+PETRtcRFgPOPXTSQ==
X-Received: by 2002:a17:902:ce8b:b029:12b:2b93:fbdc with SMTP id
 f11-20020a170902ce8bb029012b2b93fbdcmr3779261plg.46.1627676379194; 
 Fri, 30 Jul 2021 13:19:39 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:38 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] python/aqmp-tui: Add pyperclip dependency
Date: Sat, 31 Jul 2021 01:48:45 +0530
Message-Id: <20210730201846.5147-13-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1029.google.com
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

This dependency is required to enable copying from the TUI
using special keys to the system clipboard.

pyperclip works out of the box on windows and macos but requires
xsel/xclip to be installed on linux machines.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/Pipfile.lock | 22 ++++++++++++++++++++++
 python/setup.cfg    |  5 +++++
 2 files changed, 27 insertions(+)

diff --git a/python/Pipfile.lock b/python/Pipfile.lock
index 2c6d779348..3544c8703d 100644
--- a/python/Pipfile.lock
+++ b/python/Pipfile.lock
@@ -45,6 +45,14 @@
             "index": "pypi",
             "version": "==87.0"
         },
+        "backports.entry-points-selectable": {
+            "hashes": [
+                "sha256:988468260ec1c196dab6ae1149260e2f5472c9110334e5d51adcb77867361f6a",
+                "sha256:a6d9a871cde5e15b4c4a53e3d43ba890cc6861ec1332c9c2428c92f977192acc"
+            ],
+            "markers": "python_version >= '2.7'",
+            "version": "==1.1.0"
+        },
         "distlib": {
             "hashes": [
                 "sha256:106fef6dc37dd8c0e2c0a60d3fca3e77460a48907f335fa28420463a6f799736",
@@ -169,6 +177,14 @@
             "markers": "python_version >= '2.7' and python_version not in '3.0, 3.1, 3.2, 3.3'",
             "version": "==20.9"
         },
+        "platformdirs": {
+            "hashes": [
+                "sha256:4666d822218db6a262bdfdc9c39d21f23b4cfdb08af331a81e92751daf6c866c",
+                "sha256:632daad3ab546bd8e6af0537d09805cec458dce201bccfe23012df73332e181e"
+            ],
+            "markers": "python_version >= '3.6'",
+            "version": "==2.2.0"
+        },
         "pluggy": {
             "hashes": [
                 "sha256:15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0",
@@ -224,6 +240,12 @@
             "markers": "python_version >= '2.6' and python_version not in '3.0, 3.1, 3.2, 3.3'",
             "version": "==2.4.7"
         },
+        "pyperclip": {
+            "hashes": [
+                "sha256:105254a8b04934f0bc84e9c24eb360a591aaf6535c9def5f29d92af107a9bf57"
+            ],
+            "version": "==1.8.2"
+        },
         "qemu": {
             "editable": true,
             "path": "."
diff --git a/python/setup.cfg b/python/setup.cfg
index bbb7306c3d..683c0b1d00 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -47,6 +47,7 @@ devel =
     urwid >= 2.1.2
     urwid-readline >= 0.13
     Pygments >= 2.9.0
+    pyperclip >= 1.8.2
 
 # Provides qom-fuse functionality
 fuse =
@@ -57,6 +58,7 @@ tui =
     urwid >= 2.1.2
     urwid-readline >= 0.13
     Pygments >= 2.9.0
+    pyperclip >= 1.8.2
 
 [options.entry_points]
 console_scripts =
@@ -102,6 +104,9 @@ ignore_missing_imports = True
 [mypy-pygments]
 ignore_missing_imports = True
 
+[mypy-pyperclip]
+ignore_missing_imports = True
+
 [pylint.messages control]
 # Disable the message, report, category or checker with the given id(s). You
 # can either give multiple identifiers separated by comma (,) or put this
-- 
2.17.1


