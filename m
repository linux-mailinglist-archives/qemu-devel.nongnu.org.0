Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C93F536F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:39:57 +0200 (CEST)
Received: from localhost ([::1]:41034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIIbf-00040A-Qt
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIIa5-0002f6-V2
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:38:13 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:42992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mIIa4-00073g-Gd
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:38:13 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 c19-20020a9d6153000000b0051829acbfc7so40627633otk.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e+vmUdU/giGsSkSIQo4m0qZs9uEO4d8YRre5I3lw2nc=;
 b=kLoxJBx6V8XgYplkU2TmV5ALQojT+RLKaWrtUhuQEbxLD1rssDPPGPKtoj746L8Fdi
 DgSeCbMKz+XZUtOksJKgNlupq4MIw7O+u44uM2fePg3trQ0OUoPFxjnWj1e1iVDKZ0CD
 WPgVnBeVADD39y9135K+J67kYsVCLVbWlUWWpUoSTgdsFA3nVgbYbbva6Kstfv+vHAMB
 mURVeuBVs58jdWeiSoo3lPnVNpU8NO02kO3ooOSkBAy3yMnYJfAROCN8L/Lk2kvmhkOh
 zik6mTR/1GQgX8EtdpcuXyn5od6nmlwsh+SoIjNL+OIs+DetmnaUK8VJDD8X2qCutU/Y
 CJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e+vmUdU/giGsSkSIQo4m0qZs9uEO4d8YRre5I3lw2nc=;
 b=SfwxRVQZungrKazVyrfa4Tg0NyekddYKFT6em2mpeJA41Pt0jntKwrOCZA21HeaQu9
 woiExNbT5aRO+EIhcntJtYe90MIOlzhIPR3zXelly8FPwt+wEm7+Xxv4qt5PWtlynkXn
 jwmgw3bk5aK/M0k530AJpm9g/lUYXvTGEfBcZYKuLCLpqfkKmCyLZGxeVyPeqJZVcetZ
 0eeMCUrphlnzfjWrFuIWTku9uzGIxJJTUlaLjiY7B50ayBmgrBQa0aZhI/NfWUPiZ+uR
 Scu64n+m4+Ws43budEalWcg/jVQUxLlt8PVYAc0dijVOKbvK3bR4fMSr66WxaUi/VWo7
 1xnw==
X-Gm-Message-State: AOAM531piUDUc3FcGhh4uVCT9Bc+2SMiTG3LI3eI6+u9JH36TmZ3ujK3
 jEVJmb/VHyuwUJZ4FEe34tk2GVpaSuc=
X-Google-Smtp-Source: ABdhPJwc/Ww+SS2rHLLZM3AtRrY9wd0iFRt+fgZAWOepyqAtGpUYfcwCLclc9W0vPgmAaD58thnWWg==
X-Received: by 2002:a17:90a:4b4d:: with SMTP id
 o13mr738688pjl.236.1629756492895; 
 Mon, 23 Aug 2021 15:08:12 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.180])
 by smtp.gmail.com with ESMTPSA id j21sm16217454pfj.66.2021.08.23.15.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:08:12 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/5] python: add optional pygments dependency
Date: Tue, 24 Aug 2021 03:37:45 +0530
Message-Id: <20210823220746.28295-5-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823220746.28295-1-niteesh.gs@gmail.com>
References: <20210823220746.28295-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=niteesh.gs@gmail.com; helo=mail-ot1-x335.google.com
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
index 0850c7a10f..435f86384a 100644
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


