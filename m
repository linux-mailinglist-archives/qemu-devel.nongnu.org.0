Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC695408AC5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:12:00 +0200 (CEST)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkoa-0006VG-15
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb4-0002tL-3b
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb2-0005y7-Gd
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:01 -0400
Received: by mail-wm1-x32c.google.com with SMTP id e26so6463112wmk.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9gO+6rZ8JlV74yiESfnbGPf5MMVTMA7x/McqIYwXak=;
 b=aXRxZMJFd4y2vflGSYeLlmDSe+MWe536D7Yi0E1A3kGRmxXEgKgK1RPMkF7wKMLMaK
 QdxueFZdaS+U2KG2sVh3ILz8SMzWfv3urMRU+JxHhzBRkjv4Z7tkY7+yx+0gqEuhxkjo
 FqYyDJfgnOBKyWnwNJbkdTwqF69ApIE6LLu5PgI89FjFBQO58pxIyEe/rmYIzw2LFC7X
 /qa1p3MpSENdepnnPR0EbiqcPXd4AMeSXjGSbFabGoinoqUDZRf+1PC/hMLoXz91xLKi
 eVNI6YHxOFpeO7K4NDsohvp4KW6rY/y8NLD2YspaqjXrWFT/UjjIsdyIx4C8aGSrFc3L
 5jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T9gO+6rZ8JlV74yiESfnbGPf5MMVTMA7x/McqIYwXak=;
 b=ukoWRS62y9nGwMKx+X8jNIgoK+0QnLFcefkWS3SxUVif0BAQxU7JAHeAfZKt56zdSE
 6/fpix2UuY/lQm86Pi8Jrd/jLTa56NreXLKe8/vicvZmNrTwTT4DmNvH61F67mEYwXWL
 pczYqoCI3tdL59TqiNS7sBWoUOWZluT7crNwR5cQSwK04zRFIrrkgwWnrjYqsmljrVIh
 saVcYz+8fXSd52LmHjEjstz5i6wZ6Nu0QfrKRE7DXsY9J67h0PqxHob3tvrF5e586Ler
 kSrVFPpfE73YHvl+ampQq3C0jYY+l+dElW+djiFfczAQbD+r5g95O8H4okqMSKgcd1Ep
 Vicg==
X-Gm-Message-State: AOAM5329znsYkvz7Iz0a0tbZxTQkAlqYw3e3yP0Ldd5YEb8Hv5xqaWjx
 RSZimsNoN44Js/YFYRl0oqSgNDEAgpk=
X-Google-Smtp-Source: ABdhPJzNAb1utrUI4P7YzW5pUeianw0DWnKkjUUcLCmxcNxu8Xg5MGQBju05ys55mG22mB+pSh9Y+Q==
X-Received: by 2002:a05:600c:1552:: with SMTP id
 f18mr10537660wmg.168.1631534279239; 
 Mon, 13 Sep 2021 04:57:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:57:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] docs: standardize directory index to --- with overline
Date: Mon, 13 Sep 2021 13:57:31 +0200
Message-Id: <20210913115742.533197-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a standard heading format for the index.rst file in a directory.
Using overlines makes it clear that individual documents can use e.g.
=== for chapter titles and --- for section titles, as suggested in the
Linux kernel guidelines[1].  They could do it anyway, because documents
included in a toctree are parsed separately and therefore are not tied
to the same conventions for headings.  However, keeping some consistency is
useful since sometimes files are included from multiple places.

[1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/index.rst   | 3 ++-
 docs/devel/index.rst   | 3 ++-
 docs/interop/index.rst | 3 ++-
 docs/specs/index.rst   | 3 ++-
 docs/system/index.rst  | 3 ++-
 docs/tools/index.rst   | 3 ++-
 docs/user/index.rst    | 3 ++-
 7 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/docs/about/index.rst b/docs/about/index.rst
index beb762aa0a..5bea653c07 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -1,5 +1,6 @@
+----------
 About QEMU
-==========
+----------
 
 QEMU is a generic and open source machine emulator and virtualizer.
 
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 5522db7241..f95df10b3e 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -1,5 +1,6 @@
+---------------------
 Developer Information
-=====================
+---------------------
 
 This section of the manual documents various parts of the internals of QEMU.
 You only need to read it if you are interested in reading or
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index f9801a9c20..47b9ed82bb 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -1,5 +1,6 @@
+------------------------------------------------
 System Emulation Management and Interoperability
-================================================
+------------------------------------------------
 
 This section of the manual contains documents and specifications that
 are useful for making QEMU interoperate with other software.
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 65e9663916..ecc43896bb 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -1,5 +1,6 @@
+----------------------------------------------
 System Emulation Guest Hardware Specifications
-==============================================
+----------------------------------------------
 
 This section of the manual contains specifications of
 guest hardware that is specific to QEMU.
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 7b9276c05f..73bbedbc22 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -1,5 +1,6 @@
+----------------
 System Emulation
-================
+----------------
 
 This section of the manual is the overall guide for users using QEMU
 for full system emulation (as opposed to user-mode emulation).
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index ef6041a490..1edd5a8054 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -1,5 +1,6 @@
+-----
 Tools
-=====
+-----
 
 This section of the manual documents QEMU's "tools": its
 command line utilities and other standalone programs.
diff --git a/docs/user/index.rst b/docs/user/index.rst
index 9faa4badd7..2c4e29f3db 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -1,5 +1,6 @@
+-------------------
 User Mode Emulation
-===================
+-------------------
 
 This section of the manual is the overall guide for users using QEMU
 for user-mode emulation.  In this mode, QEMU can launch
-- 
2.31.1



