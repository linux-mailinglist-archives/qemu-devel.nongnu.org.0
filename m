Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0928402C44
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:58:36 +0200 (CEST)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdUa-0002w0-0n
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSo-0000xc-SY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:46 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:36786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNdSn-00067F-6U
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 11:56:46 -0400
Received: by mail-ed1-x52f.google.com with SMTP id u19so14624149edb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AWzamfV+E41PXw44M8NVUJe8mjyUcRc5MKys0dNFKps=;
 b=M1cr4dnwaeJ3ZFRm6hpN59HTqCM+UaVwqqqUEotU/hq7EB10VGXbUxB3GfeMw7Kg3P
 zu9xZkeFbGZum+wC3yTmweMDDMtyO8KuZ6A2J/QBzRRWiVwpShExlIq3S61e4YdFU1Gq
 ycxgtjCa74cf8Ax9kselxqmrQSVW8Qv2+rqGHJ25ry3tRvphUfNx4ym3Uk0nUWiUzFS+
 gSJTcZrOJIUVO1XTUvkDKVVpJOhpy7nVuymcnqKSVJdjt8fST33dOEnyaL8duUaErhx3
 k0Kr3Q8gHnQXHzWUCiX5Y0/8hRgN5XWL7rscJwjPCMXloXQSEkswtuTZEM3N/LIhdJpj
 l49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AWzamfV+E41PXw44M8NVUJe8mjyUcRc5MKys0dNFKps=;
 b=ID6Xo98xHhdMxqvBmjqswrt8I67qD1qMpza2RlT63Yt9xplEZS9pNbsPDTAPYsVJiC
 7kgm9LHDVoby0vPruDhKid+hAZZjcj6VTyC0MxDbs+LYAByd3ldKVu2D5L9lUhK7+nR/
 LTCKcClL8ja6rXnR/I5toLn3yryAwoyUp6R0ovHUUDPORE3hJ3RMBi2k0h9kSVr+EdKh
 RH1hH2vhn8Vh377aJkeFuzYxErFIIZXrkjQMxWMM7FxNk6fXnbzXP7MPqLNXDyQkGCn2
 VzHsP9BOFslxF7D78a15gkg7gHrfD0K6qseQAn3z4z6iOWkvf/lQOMg1YTAnAcVvVwvk
 yapQ==
X-Gm-Message-State: AOAM533xFee4wE0A9KnWh27urDc4QLJzWHXkZlBaPvIHEZrd0s4a3g0a
 QnePN7jwzYnLUWMdCbSjsl7StC5sSI0=
X-Google-Smtp-Source: ABdhPJzhIQpqueEKuXM6PXkjT/CPYCkVnq+hmAlUdVl+VurUZX6xoq1PRg+sAzxHmWRxpPBKv6IEUQ==
X-Received: by 2002:a05:6402:d6b:: with SMTP id
 ec43mr134547edb.107.1631030203446; 
 Tue, 07 Sep 2021 08:56:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h30sm6869669edz.40.2021.09.07.08.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 08:56:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] docs: standardize book titles to === with overline
Date: Tue,  7 Sep 2021 17:56:37 +0200
Message-Id: <20210907155641.197844-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907155641.197844-1-pbonzini@redhat.com>
References: <20210907155641.197844-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Documents within a Sphinx manual are separate files and therefore can use
different conventions for headings.  However, keeping some consistency is
useful so that included files are easy to get right.

This patch uses a standard heading format for book titles, so that it is
obvious when a file sits at the top level toctree of a book or man page.
The heading is irrelevant for man pages, but keep it consistent as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/index.rst                     | 1 +
 docs/system/qemu-block-drivers.rst | 1 +
 docs/system/qemu-cpu-models.rst    | 1 +
 docs/system/qemu-manpage.rst       | 5 +++--
 docs/tools/qemu-img.rst            | 1 +
 docs/tools/qemu-nbd.rst            | 1 +
 docs/tools/qemu-pr-helper.rst      | 1 +
 docs/tools/qemu-storage-daemon.rst | 1 +
 docs/tools/qemu-trace-stap.rst     | 1 +
 9 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/index.rst b/docs/index.rst
index 5f7eaaa632..0b9ee9901d 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -3,6 +3,7 @@
    You can adapt this file completely to your liking, but it should at least
    contain the root `toctree` directive.
 
+================================
 Welcome to QEMU's documentation!
 ================================
 
diff --git a/docs/system/qemu-block-drivers.rst b/docs/system/qemu-block-drivers.rst
index bd99d4fa8e..eb276481d6 100644
--- a/docs/system/qemu-block-drivers.rst
+++ b/docs/system/qemu-block-drivers.rst
@@ -1,5 +1,6 @@
 :orphan:
 
+============================
 QEMU block drivers reference
 ============================
 
diff --git a/docs/system/qemu-cpu-models.rst b/docs/system/qemu-cpu-models.rst
index 53d7538c47..8c51e2bf49 100644
--- a/docs/system/qemu-cpu-models.rst
+++ b/docs/system/qemu-cpu-models.rst
@@ -1,5 +1,6 @@
 :orphan:
 
+==================================
 QEMU / KVM CPU model configuration
 ==================================
 
diff --git a/docs/system/qemu-manpage.rst b/docs/system/qemu-manpage.rst
index e9a25d0680..d6f44e265b 100644
--- a/docs/system/qemu-manpage.rst
+++ b/docs/system/qemu-manpage.rst
@@ -6,8 +6,9 @@
    parts of the documentation that go in the manpage as well as the
    HTML manual.
 
-Title
-=====
+=======================
+QEMU User Documentation
+=======================
 
 Synopsis
 --------
diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index b7d602a288..fe6c30d509 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -1,3 +1,4 @@
+=======================
 QEMU disk image utility
 =======================
 
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index ee862fa0bc..e39a9f4b1a 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -1,3 +1,4 @@
+=====================================
 QEMU Disk Network Block Device Server
 =====================================
 
diff --git a/docs/tools/qemu-pr-helper.rst b/docs/tools/qemu-pr-helper.rst
index ac036180ac..eaebe40da0 100644
--- a/docs/tools/qemu-pr-helper.rst
+++ b/docs/tools/qemu-pr-helper.rst
@@ -1,3 +1,4 @@
+==================================
 QEMU persistent reservation helper
 ==================================
 
diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 3ec4bdd914..b8ef4486f1 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -1,3 +1,4 @@
+===================
 QEMU Storage Daemon
 ===================
 
diff --git a/docs/tools/qemu-trace-stap.rst b/docs/tools/qemu-trace-stap.rst
index fb70445c75..d53073b52b 100644
--- a/docs/tools/qemu-trace-stap.rst
+++ b/docs/tools/qemu-trace-stap.rst
@@ -1,3 +1,4 @@
+=========================
 QEMU SystemTap trace tool
 =========================
 
-- 
2.31.1



