Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A4540380B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:41:47 +0200 (CEST)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv1W-0005gl-F0
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS4-0006v6-DI
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS0-0003Du-CU
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q26so2384407wrc.7
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDW0/wH2iY9wyTNx+C9A/U5ln75ztBlF6G4LQIygGKU=;
 b=BWC2LQs/C13LAhVpZ7dEIzrFJPQhUE6KuWVMdBiY1cGgHlA9/EKdgrjfNLV/sn+lN/
 eqomz8O9MIUPcgLV9+daJ4vyhQV5jLTeYMT69hkG4n6SeWo1gWJpAApO3LHpodVGuUP5
 +J/EQK4LLbJuLb8XM1e/MfDBXcDjU/0rrNaiznkLZu2XVJbC/mI4L1Jk2D+xjkxEZ+Jz
 xYweE9Rh2KNsVsYmaFKV3mTkGFQxI682UaLGBZVIhprsqwS5JhpvWfMNMb1QrQFjOlam
 UPL3+a1KN66BtK7bRIfAAza/oxx2J6rk7BLFxN/TDFWeTDN0rvl0+uv375XMUAPdcCEo
 qI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QDW0/wH2iY9wyTNx+C9A/U5ln75ztBlF6G4LQIygGKU=;
 b=msTXEdy3HL/KxswkMtDDfNgLe9LJ7YwAJxWwa07gPvlU+jLRgsHPWN5Q15oSyOwH3z
 7TnHeUe8AHcYyue3TLpDwEwAoH7ylfvRBIw5E92bnd/utBn5tTMSzH7DjNEY3nl6x8Hn
 GCqKhVubPzeqyjFR67vuiDNtlKyA+ApmdslosnyA4CHIk8HOIXJ4wfPZpHpioV+UXFHH
 rrOm7AKRGeJLdyinc30liW9yXt1sP44kTHacjk/mofU1c4/G8K+7b0eTX6V2eRZxNRvf
 xawrLPT2Fy0fHma5aU/SDLw1JvTSCkt0/h875ktxEcIbuJY/9I+y/PKA1uYVOPlcKf1a
 TIGw==
X-Gm-Message-State: AOAM5314Ft1MLB2pqeotloxhYXF/9dMWOP6a0ELGjJun0NYu7V29bfog
 ZDb6VRcuhtmKhs1Z110go7DiNKd/nZg=
X-Google-Smtp-Source: ABdhPJzuedbEla8GMLzKFKuQe/7SO3U1MW2uSsVqMqc6SY+QBtGohKEaLqGxw2xkmzMqAyjmDVeQpQ==
X-Received: by 2002:adf:e887:: with SMTP id d7mr3034814wrm.79.1631095502764;
 Wed, 08 Sep 2021 03:05:02 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 37/43] docs: standardize book titles to === with overline
Date: Wed,  8 Sep 2021 12:04:20 +0200
Message-Id: <20210908100426.264356-38-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documents within a Sphinx manual are separate files and therefore can use
different conventions for headings.  However, keeping some consistency is
useful so that included files are easy to get right.

This patch uses a standard heading format for book titles, so that it is
obvious when a file sits at the top level toctree of a book or man page.
The heading is irrelevant for man pages, but keep it consistent as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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



