Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB69D408AC6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:12:31 +0200 (CEST)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkp4-0007H6-O0
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb6-0002uG-Sm
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkb4-0005zS-At
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id g16so14297220wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFxC3PMcGDPUTIq1mYdRtX5DKUYLQy7cB0NmvTziU58=;
 b=G4WZAIcpCOsTgb2/hxj1gmq09ghaBvIHo37NKUi55+aGZEV2rOvBkzINmOz5gPMO3P
 ZWkgf1DZ9H8mdnY/u7FDDdJNzgVAywfty+qx3JBierDK0KHl01NPPuciKNn3bZkgd+Pc
 QRg6DBftQryGOJ0m6YY570inijKztOWz8dOvRlogO0+mB2xjR9IilmVDZFDZmdnedOMM
 VpNA6Tb72KzuhmeQPMIxxVSCnJE+LJ9vLltFWGy38KxpIL8rTKLWFL4k8yp/a7PfUUtV
 DJCBBvnorQDjoPoz2DPRQo8M0COweGYbdo2vOK+pBYfnRXw+bDAfaUqhkOMSR+FrMZn6
 wOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OFxC3PMcGDPUTIq1mYdRtX5DKUYLQy7cB0NmvTziU58=;
 b=NfytVd+8YxG9BXwxE0q+3tmJl+CCUJc6qgvo4bVCIFkqNTM+OfqKtC6hchNHhIOlQG
 SKQkbQ4ZYv+HxeyAD/gfmmJOoI1xta0n0H4GAkcN9rMfdk25rsV6hlHdt1PIxAGfyP8X
 PRoXSYKbOKFfrn840937Inz91S6qhNjPadzsVEDDP2DkCBj4w6gqmt15S9YZeGOwmswN
 ogGgLLsMTZfn+PyW0yjyJ5Y3pSV0ceUUDdLMm92XqRAYfr2c08eADfFeBl0xjctKpfvH
 +VqdK/vBiLqsW1Mp5P6KN2msCnkQFfQ9HNdQ7oiLd7SyOUfiux7h17NogIFqWMWW+ETM
 1QBQ==
X-Gm-Message-State: AOAM531Zgp1s+s4o6BE/5k8m/BkzjtpJY/VFAbzIkkFbBKL001U/P5bD
 qxg3AIXJEudmow8hJ6XxJUIHC+6vo98=
X-Google-Smtp-Source: ABdhPJwZtfkgdeJnz+20wWMAC1bozQKvOyENavNpMmVlEBfIDWs0hgdsHV8FCO0G/v5BrveT8yfa6g==
X-Received: by 2002:a5d:53cd:: with SMTP id a13mr12092335wrw.33.1631534281021; 
 Mon, 13 Sep 2021 04:58:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] docs/system: standardize man page sections to --- with
 overline
Date: Mon, 13 Sep 2021 13:57:32 +0200
Message-Id: <20210913115742.533197-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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

Man pages in docs/system use file inclusion heavily.  Use headings with
overlines in the main files, so that the same included file work well
from both manuals and man pages.

This style of heading is a bit more heavy-weight, so it is not used by
the other man pages in interop/ and tools/.  If in the future they
are changed to use include files, for example to avoid having sections
named "synopsis" or "description", they can switch to --- with overline
as well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/qemu-block-drivers.rst | 3 +++
 docs/system/qemu-cpu-models.rst    | 9 ++++++---
 docs/system/qemu-manpage.rst       | 5 +++++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/system/qemu-block-drivers.rst b/docs/system/qemu-block-drivers.rst
index eb276481d6..c2c0114cec 100644
--- a/docs/system/qemu-block-drivers.rst
+++ b/docs/system/qemu-block-drivers.rst
@@ -4,16 +4,19 @@
 QEMU block drivers reference
 ============================
 
+--------
 Synopsis
 --------
 
 QEMU block driver reference manual
 
+-----------
 Description
 -----------
 
 .. include:: qemu-block-drivers.rst.inc
 
+--------
 See also
 --------
 
diff --git a/docs/system/qemu-cpu-models.rst b/docs/system/qemu-cpu-models.rst
index 8c51e2bf49..5cf6e46f8a 100644
--- a/docs/system/qemu-cpu-models.rst
+++ b/docs/system/qemu-cpu-models.rst
@@ -4,18 +4,21 @@
 QEMU / KVM CPU model configuration
 ==================================
 
+--------
 Synopsis
-''''''''
+--------
 
 QEMU CPU Modelling Infrastructure manual
 
+-----------
 Description
-'''''''''''
+-----------
 
 .. include:: cpu-models-x86.rst.inc
 .. include:: cpu-models-mips.rst.inc
 
+--------
 See also
-''''''''
+--------
 
 The HTML documentation of QEMU for more precise information and Linux user mode emulator invocation.
diff --git a/docs/system/qemu-manpage.rst b/docs/system/qemu-manpage.rst
index d6f44e265b..c47a412758 100644
--- a/docs/system/qemu-manpage.rst
+++ b/docs/system/qemu-manpage.rst
@@ -10,6 +10,7 @@
 QEMU User Documentation
 =======================
 
+--------
 Synopsis
 --------
 
@@ -17,11 +18,13 @@ Synopsis
 
    |qemu_system| [options] [disk_image]
 
+-----------
 Description
 -----------
 
 .. include:: target-i386-desc.rst.inc
 
+-------
 Options
 -------
 
@@ -34,11 +37,13 @@ not need a disk image.
 
 .. include:: mux-chardev.rst.inc
 
+-----
 Notes
 -----
 
 .. include:: device-url-syntax.rst.inc
 
+--------
 See also
 --------
 
-- 
2.31.1



