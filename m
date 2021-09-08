Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A064403807
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:40:59 +0200 (CEST)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv0k-00049X-6m
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS4-0006v7-Dx
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS0-0003EY-W4
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id z4so2397204wrr.6
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9gO+6rZ8JlV74yiESfnbGPf5MMVTMA7x/McqIYwXak=;
 b=lr2dZ9GGLxih4jBBz3hAydRhHFDq2VqCuEu1I1DewfMrh6SC/XbosLBoV+ws8s5piZ
 W1RyTmznrq/uFueA0jGhAisd1W5lTIIMiB8p6olCAXD1HFXYjosmAAhfuUZE8dkayoj8
 iadNHVSm04Lbxu6kn/QATF+CNYOdim6Vfp/18+DdjSWk96EsC1Ya8ViLBVkhHyg1wcTK
 ZSMwBd3o5yzK/8lgmjlF9qfv8bGm1tm+YUVNCZlamQEG9TkH8seg2jDDmd7GCIPwG9Ln
 qthPpAZBZTMKaAFa07YY7xahito+6oraFUbkpSyM07I7MCsOpXLiFNGsey5tBHNej6co
 /h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T9gO+6rZ8JlV74yiESfnbGPf5MMVTMA7x/McqIYwXak=;
 b=SoDWd156ENEkzl1Vp/XrMmKtFCx+17oUI6QY/fyCkpo54vagvRXGg0sbv9/ju+Od2T
 hCCkDUIf7FiQBdij87F+ieoavHIJs0xsIgHjCQaTetgyaSz4oxxjj4yyj2dOWuUH3rpl
 sFKUYX90G3YFY785kKQo//9/l+VSDjEoiGlPfeGyQRLB9dEdfJ94K/p5TpKUAUejv6RK
 YLow7eoYzjmHq2kGR0shd8l9wmlnmKa7EXuGcPMqjlFg8cqVZDavAUc5D9lpsQna3+dg
 CUw9SK2W4UlwcpdytPj+44ViHZ9+eHyUqZoU8zQrsYD8K1wUdoqLFwkkdkzJB4uSUjth
 Tjgg==
X-Gm-Message-State: AOAM530EAQret0q7fs5xpMiiTE+HA1zYeHKr6MEiD9x/PvE7DsPOJM68
 vk2t6Rlp26eY0YA6/at+AXqiKP5D0QY=
X-Google-Smtp-Source: ABdhPJzY1kjOqnaXK1HJ/QDCZIdEE8TkNimhX6zynVai4wApHSEwniGFMyPZl7D+vEM3JLnhgcZJnw==
X-Received: by 2002:adf:9d45:: with SMTP id o5mr3048191wre.226.1631095503466; 
 Wed, 08 Sep 2021 03:05:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 38/43] docs: standardize directory index to --- with overline
Date: Wed,  8 Sep 2021 12:04:21 +0200
Message-Id: <20210908100426.264356-39-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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



