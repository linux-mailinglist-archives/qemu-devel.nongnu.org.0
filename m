Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064AC408ADC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:16:30 +0200 (CEST)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPksv-000505-3U
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb8-0002ux-5j
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:07 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb6-000610-M3
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:05 -0400
Received: by mail-wr1-x436.google.com with SMTP id u15so8208068wru.6
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwPR13OXi9fX3IyCvHJSOgO2fs5MlAYtMNrY89yA+cU=;
 b=XRBux6Ru+mp9RGicIEYP9nLA2aKwQnxlOty19ym5uM/wLkO2s3lFC9T2tZ82qTIgzm
 JfosQv13mQk4EFHKqcqADfP1dRiaj2PekXyd9tMvSb0PAItRePZKYGhsnZDksjzVQ3sv
 0/qld8iAGF2LHuQ5PbBKKNqgx22zHTQwgjGMaeb9CHc55bGtn7NFcgoKzKqh8wVn10NR
 bzcf9aZ4Sf4ubHvP7r5ZeeG8hG3VxlsZHm0ANrD9WaqWurlyv4I5xw1qF6rMLZW9FoGp
 o1V8znol7aH3TQPBOTptZAl4gZTENJzMiJjmkaCqGjofxtQiFlxlu/qIdt6vNcPn2TTR
 VBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WwPR13OXi9fX3IyCvHJSOgO2fs5MlAYtMNrY89yA+cU=;
 b=JTaNw31BHyyuyNAQMbLaI9/2I0leQc2/9d9zLqHbxG9YHgxmSqocDVY2Z4XKFkYuzd
 xUc5kmUY4qUmGtXjYHi/kDR1TG7ehvFx43JgJzho41QlglrCN+Tcm7zkYFmpaMwcQhNd
 555k9u9qMuoLFoPB3jVh+4ok+QJsxPZYl5c7Ouc8JsAkMm6/B4LQ8bdibWoWOIjDE5y9
 2zEOLa91YTdccLTJduHrQBO7dMpyFKfkD7HOiXEgLuV0XaXwhofgUkeQxGdOzrP8slSC
 UXhq5StA0S65JlLp1+Bfab4tfK92LplKglqIz2Nk5AvG6YhbFRI8W0JASU+xCsknLhCb
 uJYA==
X-Gm-Message-State: AOAM531S/NfpeZS6WmTr85SW85eQqnXHbfm/fQ8dzXr7LDR8kQa17394
 4nILo9ZeyEs+qcOoO886W0cg2tn5Ru0=
X-Google-Smtp-Source: ABdhPJy+QT1d1o78nTOlkHtJnrpEAeSPrM2pfZntOUTHBgQktU77hQy5t0vtsBw5qQAotsJUec6Abw==
X-Received: by 2002:a5d:4488:: with SMTP id j8mr12245441wrq.260.1631534282789; 
 Mon, 13 Sep 2021 04:58:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] docs/system: move x86 CPU configuration to a separate
 document
Date: Mon, 13 Sep 2021 13:57:33 +0200
Message-Id: <20210913115742.533197-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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

Currently, cpu-models-x86.rst.inc is included in target-i386.rst directly.
To make the toctree more homogeneous when adding more documentation,
include it through a first-class .rst file.

Together with the previous changes to the man page skeletons, this also
frees "===" for the headings, so that cpu-models-x86.rst.inc need not
assume anything about the headings used by target-i386.rst.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/cpu-models-x86.rst.inc | 4 ++--
 docs/system/i386/cpu.rst           | 1 +
 docs/system/target-i386.rst        | 8 +++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)
 create mode 100644 docs/system/i386/cpu.rst

diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index 9119f5dff5..6e8be7d79b 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -1,5 +1,5 @@
 Recommendations for KVM CPU model configuration on x86 hosts
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+============================================================
 
 The information that follows provides recommendations for configuring
 CPU models on x86 hosts. The goals are to maximise performance, while
@@ -368,7 +368,7 @@ featureset, which prevents guests having optimal performance.
 
 
 Syntax for configuring CPU models
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+=================================
 
 The examples below illustrate the approach to configuring the various
 CPU models / features in QEMU and libvirt.
diff --git a/docs/system/i386/cpu.rst b/docs/system/i386/cpu.rst
new file mode 100644
index 0000000000..738719da9a
--- /dev/null
+++ b/docs/system/i386/cpu.rst
@@ -0,0 +1 @@
+.. include:: ../cpu-models-x86.rst.inc
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 22ba5ce2c0..c9720a8cd1 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -19,7 +19,13 @@ Board-specific documentation
    i386/microvm
    i386/pc
 
-.. include:: cpu-models-x86.rst.inc
+Architectural features
+~~~~~~~~~~~~~~~~~~~~~~
+
+.. toctree::
+   :maxdepth: 1
+
+   i386/cpu
 
 .. _pcsys_005freq:
 
-- 
2.31.1



