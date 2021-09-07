Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED7F402C46
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:58:39 +0200 (CEST)
Received: from localhost ([::1]:60312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdUc-00034o-Bt
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSq-0000xx-5v
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:48 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSn-00067t-K9
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:47 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r7so14591240edd.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VVWgi+atl4jLVLLDOWnirX4uUum7p0X1vILK9y8ze6M=;
 b=mFDQ6pRmGcg898LG5NdiS4Nqd5FjyeNZNSaFRxBylkjfht2ea6DB+64hWCESPvKZoX
 pktuLxu8uMc+/RcRFZL1QJeStHeM6KOuJ34jcmetwN55dfmylonltTwARhr//lxFfCxv
 Ma/k3qGvmZfApX48knYra578inuRpSl+Vf27V3U4Qwvk8DOHYYtjEG7oIQk0WJHLiROQ
 PLsUfRzkm8zeBud2f6uusdhjV+E7OKrzFnGD+vKFEz7Nk4SYmd9ZBE50yTKnVlDoMdIQ
 1R2T3yTNfdxMhWDJ5WvYVsF9aSr/2xkzwBVZqO1Cc3cZcztRkW4WaE70Sxa7iJJAIgNd
 S7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VVWgi+atl4jLVLLDOWnirX4uUum7p0X1vILK9y8ze6M=;
 b=HNP/DBqxc1N+bi2HTjiky/B5mG+h6W5pFSsYLVxCF6kPoii3qMw4ofLE0QdCfqIVMb
 GI2Aq8SJurt3QPFfQzAyZ6HNNLx93FjkGCBd7e0US6jn4dFDXaTAD4N/7xVSL8+jIbW5
 pHD3WB07ftaEV4OP8S6t3Nkl3KKqlrDVnrOophKrIVtQxP0sUe5J9LuquXHVIrCILjVX
 VVFrFKon091GjarshQlq+s6WCTHeMccgumSqq5QqdjodAS/i0dK7M3aygX6qGHsd4Kds
 vYM3XHVDc9iJyM+DIro5j/WH/sviG11AtSY7pSbZBJB8K85CF64snZE1j/WVrOA2HPho
 YTGw==
X-Gm-Message-State: AOAM532mVjMz1zw+msfzdIR6Jqs/QZL+gO8SzDfz7AiGTtIMGqS7mwNt
 WfulVNoHKpn/hba1hOPuexggqt2Ir5M=
X-Google-Smtp-Source: ABdhPJxQEeAB+7nsew0W4z2rDX1r/XMJrCmiqirxUHUi635OL/PKQmcUPkT/QZlbONKcDtjWhqQMmw==
X-Received: by 2002:a05:6402:1907:: with SMTP id
 e7mr122751edz.201.1631030204082; 
 Tue, 07 Sep 2021 08:56:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h30sm6869669edz.40.2021.09.07.08.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 08:56:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] docs: standardize directory index to --- with overline
Date: Tue,  7 Sep 2021 17:56:38 +0200
Message-Id: <20210907155641.197844-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907155641.197844-1-pbonzini@redhat.com>
References: <20210907155641.197844-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: peter.maydell@linaro.org
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



