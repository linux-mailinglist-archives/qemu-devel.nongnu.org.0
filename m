Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843ED4037C5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:22:57 +0200 (CEST)
Received: from localhost ([::1]:45280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNujI-0001Qx-Ie
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS6-0006w9-DG
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuS3-0003FA-B3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:05:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1073196wml.3
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwPR13OXi9fX3IyCvHJSOgO2fs5MlAYtMNrY89yA+cU=;
 b=kGa7weZckfn/LKikM6Y46uAtx4PFfMkG+I+jqkWEBSGIDY6v17D6x7qzPEl5YR2P9R
 NhWwyEh6hBvTcLBjt8HW2Fpg1e7uHqz/zj5N9BNpbtJirZ7qTaxaFFCJJeNECSzlzHX0
 NP4GKXGseNeRcsWSKCnCAwZyw0myJuN3Fnu+MLEUAkcHg0OYdfQ8CyD2Vl4sxE9NvYLd
 wPxJLsbuyc7705x0jnixEX5p/56rw86aj5gPwOKTe//ot/yvOC7HOixbpkcWQxbwn9Vj
 7edU5ZUcYXd60eABoVxY7B+ZTwlJP/RphEIYY2eLc2DbGVXlNcKt377bdmTAFADZ0RXh
 xKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WwPR13OXi9fX3IyCvHJSOgO2fs5MlAYtMNrY89yA+cU=;
 b=RG9+SFpo39kx0m/HcDVPy77Qzydo34rssDaRSHY20/8KhHsZsSUX5bfMhtB4/UuGiw
 qvIlBNc25KUKKwzlmudo0fsYvn4xMq7tIaH0Py164TOqghm1n3ujmNRF5yJS4c2PU6hh
 pS3/zLO8yBu5AJovAvhKN3Y6LmBXFjzjgyaLQVULpGnx3RruWCKNu2m73zNdYlw03Rxp
 Xb+QgbphXmxO896aWCMjsmXgLpgYJ9Gj72LEzcy5b0oqmhJIacDKiruafz/isHoIY8rs
 ppLzyT6npUpJOKfKWtW9DQmhno69lb4svIh6wBbn9MV3FGIF0vMJUqXQw9FPe4dI2n9P
 Ls+A==
X-Gm-Message-State: AOAM5322Vmw9P/XJsCVtJmlI/xydfFSaHz52oDp1UKiJZ0v41SdwG4pz
 waxNOr9uoCG3qZH9YlPDFJ38gzoulTQ=
X-Google-Smtp-Source: ABdhPJz6v2gvL9YPYQohmUEkixu03A7nN4rMp2nypqIJsgbgPLjafdSWtOY93T/DFLsw21JueyxF1g==
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr2778820wmj.85.1631095504806; 
 Wed, 08 Sep 2021 03:05:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:05:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 40/43] docs/system: move x86 CPU configuration to a separate
 document
Date: Wed,  8 Sep 2021 12:04:23 +0200
Message-Id: <20210908100426.264356-41-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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



