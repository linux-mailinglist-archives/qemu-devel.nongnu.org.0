Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00371408ABD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:09:22 +0200 (CEST)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkm2-0001G7-1p
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb2-0002rj-Cv
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:00 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb0-0005wI-Tc
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:00 -0400
Received: by mail-wr1-x431.google.com with SMTP id t18so14312064wrb.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDW0/wH2iY9wyTNx+C9A/U5ln75ztBlF6G4LQIygGKU=;
 b=KIcKTmSvqSIr+7uXbcMGpFZ9vh00LzE2pO4rSdhzw27VvIdhK2dPwLfgvgpV1ymj8m
 sVHhKzfz5X4tnUWracbGSbwcV3/MVsqIf0P/7NSNNzS4GK+c3yh5aQKpqpMWa/eqaYID
 1VvLD0rTenK2uWoHkmZqikuo/SWGvSQDVSkIg1ol1OT7EoMo5u5dTWbHFLCfFAu8zIkt
 f/HNgM6o/ypvtG53RZ4P/6rf3N4L+xaRTgQJMm9N/QN+Qln2XN1ODTjfF5aMqz/epWDr
 0pFtGSy0CvzZnI1h/6JD3TQbdO3B9krEBKXlmFH0olFkVGeZHkZrXDmxEuZ+DlCPHZlV
 Q/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QDW0/wH2iY9wyTNx+C9A/U5ln75ztBlF6G4LQIygGKU=;
 b=0X6bBtXS+pZTYe97uXlu/d1tHXbuhDKws47vK1lhR5R9J2Z5VCJHNv54mVoAqguphi
 qNi9lfiKo0NamrEhjl5GZ3TFJUjsE91XTcXqtE/zqhB0dKN5WTs6ETFRdIRXKaMReNWH
 8fKsobEq2eRTcL84xBp73Zcj/cyCj/Rt7bNophwdpMqnL948fW4KLL1b30datU3Kx4Hq
 ZXMs6PW9j/tH6JnZriTZKANntw+AxdHL6MNs9zyNg+XNoaLEjLAgz0r6I7HkFOVlA27F
 e2jvFrYCRtmdTnUJ8v6UbmhcxZauICiIugwwQU1i5bpEmdPLilXIYgOjI1hsbpdwr2y/
 ULpQ==
X-Gm-Message-State: AOAM531Tc1sc5v5r6H6UF7l6OWWZ5+fWLwXCG0OP0SSpMvzwab5RRzqA
 pGXthefn7U/oIMFwo3TEoIPNmZW3hpQ=
X-Google-Smtp-Source: ABdhPJwwBwFY0EwOTsEO8JwHjaWJ8o3pIAupA6O91vfwnYQv8xPqjosB6VOceFj/OlH4U6lwnCJV5w==
X-Received: by 2002:adf:e806:: with SMTP id o6mr11790254wrm.239.1631534277618; 
 Mon, 13 Sep 2021 04:57:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:57:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/21] docs: standardize book titles to === with overline
Date: Mon, 13 Sep 2021 13:57:30 +0200
Message-Id: <20210913115742.533197-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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



