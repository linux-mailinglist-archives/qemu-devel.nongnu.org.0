Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C53BA509
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:28:06 +0200 (CEST)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQhh-0004TP-Hy
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQg2-0002Me-S2
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:23 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lzQg1-0001R2-8o
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 17:26:22 -0400
Received: by mail-pg1-x52c.google.com with SMTP id u14so10949169pga.11
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1ueaTPN7xEXakJK1s7LlaAPIYUOdKDqyBSz3qHkWlog=;
 b=h5x+uA/hIDs11fwBh3VHZT+udSHemkEYTKbbSO5cLGKlnzIR5tXqgx/qm1hZgabX4b
 /KiGrbK4bhk+/YVuA6XKtkbZPGrFNV8zs9KIPrxC2q6K1ikvK8iAQKPHd4BCyahfEgau
 UohpzzeZqOpMqzAeugwHmsFxz7bve/4AXdVm0h1UMuAkjmuTZjpGK09eb8XwLG/KQoUr
 aTROLNMSxzOiaY576s7EpUSkrLukjLe3btR6JfONiyvcXIe/y6etVmOCLXa1crQCQ3yL
 oaYcXVuVm86hueg0qOEPXCtmn+EusFpPsbtbRMDty94rtEhmZ4nvcOb6+GfaGPsHskTr
 gMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1ueaTPN7xEXakJK1s7LlaAPIYUOdKDqyBSz3qHkWlog=;
 b=P9qS5zh7YpBPx2oxXce7JJSqZ/4gLBgh/IwM/SXlA1h2iYfTstyIGT+1zl4hx1QYg2
 e6gwlDfzhd0LlaMU99igJ4RYhYWHYc7X0kqnCTvlK+Q4YfWc01frjCDnywx1Ba6Ex1d8
 i7iT29POcLoFr+nzhBS9R8OfL1g1wgGDKwsLVjb7XSUqIVR3Vy39TmllWmyHd1kTOJBE
 dsJDAn4L0yDREhpVwIz/fVWjevHxfO4WV2kjYB+GuqWv1JGB6sgaEuZyDjxTfhe1duOQ
 gfHqsgS5SwzK5v2l9ma64UR8Prn+KHJDDRNaNLbv+8O/Pb6EXZe+YETcQe4LdLw7+OcB
 h8Aw==
X-Gm-Message-State: AOAM5310Hnx9FsgiEfwE6xkRyBrjZ2mit0xYYUIhoBylO628RP7M3qLx
 8inl22DHC41vml6Fc/8Z0SM=
X-Google-Smtp-Source: ABdhPJxtqKCTgGIuCHrh8GS0S3Gu7y8DN1WWXgPEtDwllfK7W2ZvTR0gxluE7dClZgZt3mlc6rshOA==
X-Received: by 2002:a05:6a00:1348:b029:30f:201d:6b76 with SMTP id
 k8-20020a056a001348b029030f201d6b76mr1638213pfu.55.1625261179539; 
 Fri, 02 Jul 2021 14:26:19 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.1])
 by smtp.gmail.com with ESMTPSA id o16sm71563pjw.51.2021.07.02.14.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 14:26:19 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: jsnow@redhat.com
Subject: [PATCH 4/6] python: add optional pygments dependency
Date: Sat,  3 Jul 2021 02:56:01 +0530
Message-Id: <20210702212603.26465-5-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702212603.26465-1-niteesh.gs@gmail.com>
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pg1-x52c.google.com
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
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
index c6d38451eb..4782fe5241 100644
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


