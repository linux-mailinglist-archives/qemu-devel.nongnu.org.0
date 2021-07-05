Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7F3BBAB7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:03:11 +0200 (CEST)
Received: from localhost ([::1]:57450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LRW-0007tQ-9o
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKY-0003ho-DU
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:58 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKT-0003rn-A3
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so21358692wri.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5aJmi5qP69A8jB2kjWt+ERl07/6sgHvpkI4htSpBqrk=;
 b=RRn+D+5rAFWFmqvqcR8gyxvi1gTJHrMYfkpkcYPTLhhtxjRzi2brv+vn5NZIeXW2tu
 apvccFfPrALLZrVVDgolDfC7yK0GotbHdmMPptb4FwIvskGQdN7jcBLU6K9W5OMP9ENR
 COggIJWHTjTYuxUvkZ3fmed/fQyXMmzE9nN3N9rMrsFcjiVaU/YX1brZR8rV1BqsKuF/
 ZWOEhDBih3yVqIIsGlHjLtJ/h85LBSZyt25KcZZLJblUPD79cj8Zg6ku1XOYjeG8Ab+O
 ql7xIxbXqDjcZQ1bCwERlq5O1uQN6lTxsYRuqAdg0Vz5ZYNEmy/Mp1GRXEFoZ9oZ/5EP
 A2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5aJmi5qP69A8jB2kjWt+ERl07/6sgHvpkI4htSpBqrk=;
 b=tRAicoEAwg8eafgnLQ3ODA4crRcGHfkLZ6cYApzD0Jta8G9HHqRRs5PNqbrcG0DU/q
 HatTVE9pW9QrGJyTIypVy7mOZtsNppxR8toJ1V9nJoohtbqNgarH3XCK8OInqPfiwsGX
 cj60sfA/x+cGYbma4TU0PVjmvaVW2HmobpvydL2qD4thWkUEMoSE9eNx9++o8GvtI4P3
 w/ONz1kJFYufqyLxgLct5q7KkvdYEcDruHwLdcYWe+moZLR9SVs/Nuhvqa7AbuXgNTed
 3aEUBC1AvYLdYvEfRpPseK5CRHp5Vl1ZrhDxcdBSqV+fhOPZcAPWJCHQakF+NRJqp7df
 aF3w==
X-Gm-Message-State: AOAM532HaBbgJsuqK/9y7Hi97VCYRKT0jXNTxpLyJsv/ZtTIxJZ/nnXW
 x4qlTyAmH5n3tbTdetZOkkYa7z26l7e1uSxX
X-Google-Smtp-Source: ABdhPJz23AnUx1/Jlc1xCUQBnTlcBVY5bJ7mAbE9p5Fr5kWRuAcpyk0BjDVjafW+tTtqsIHXIWPDtA==
X-Received: by 2002:a5d:4291:: with SMTP id k17mr14617936wrq.211.1625478951707; 
 Mon, 05 Jul 2021 02:55:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm12528727wrr.4.2021.07.05.02.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:55:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] docs: Stop calling the top level subsections of our
 manual 'manuals'
Date: Mon,  5 Jul 2021 10:55:42 +0100
Message-Id: <20210705095547.15790-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We merged our previous multiple-manual setup into a single Sphinx
manual, but we left some text in the various index.rst lines that
still calls the top level subsections separate 'manuals'.  Update
them to talk about "this section of the manual" instead, and remove
now-obsolete comments about how the index.rst files are the "top
level page for the 'foo' manual".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/index.rst   | 5 +----
 docs/interop/index.rst | 7 ++-----
 docs/specs/index.rst   | 5 ++---
 docs/system/index.rst  | 5 +----
 docs/tools/index.rst   | 5 ++---
 docs/user/index.rst    | 5 +----
 6 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 977c3893bda..e188f187a18 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -1,10 +1,7 @@
-.. This is the top level page for the 'devel' manual.
-
-
 Developer Information
 =====================
 
-This manual documents various parts of the internals of QEMU.
+This section of the manual documents various parts of the internals of QEMU.
 You only need to read it if you are interested in reading or
 modifying QEMU's source code.
 
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 219a5e5fc50..8b34da6f551 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -1,11 +1,8 @@
-.. This is the top level page for the 'interop' manual.
-
-
 System Emulation Management and Interoperability
 ================================================
 
-This manual contains documents and specifications that are useful
-for making QEMU interoperate with other software.
+This section of the manual contains documents and specifications that
+are useful for making QEMU interoperate with other software.
 
 Contents:
 
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 7b08314d334..4c0d2a37cb8 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -1,9 +1,8 @@
-.. This is the top level page for the 'specs' manual
-
-
 System Emulation Guest Hardware Specifications
 ==============================================
 
+This section of the manual contains specifications of
+guest hardware that is specific to QEMU.
 
 Contents:
 
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 6092eb2d91d..2a9bd759807 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -1,10 +1,7 @@
-.. This is the top level page for the 'system' manual.
-
-
 System Emulation
 ================
 
-This manual is the overall guide for users using QEMU
+This section of the manual is the overall guide for users using QEMU
 for full system emulation (as opposed to user-mode emulation).
 This includes working with hypervisors such as KVM, Xen, Hax
 or Hypervisor.Framework.
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index d923834a739..ffb14b9690b 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -1,9 +1,8 @@
-.. This is the top level page for the 'tools' manual
-
-
 Tools
 =====
 
+This section of the manual documents QEMU's "tools": its
+command line utilities and other standalone programs.
 
 Contents:
 
diff --git a/docs/user/index.rst b/docs/user/index.rst
index a5b47459ec7..6ac2ac089fd 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -1,10 +1,7 @@
-.. This is the top level page for the 'user' manual.
-
-
 User Mode Emulation
 ===================
 
-This manual is the overall guide for users using QEMU
+This section of the manual is the overall guide for users using QEMU
 for user-mode emulation.  In this mode, QEMU can launch
 processes compiled for one CPU on another CPU.
 
-- 
2.20.1


