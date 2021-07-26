Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000353D5B8A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:27:07 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81ZT-00052D-34
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WH-0005Zl-Cu
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:49 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WF-0008RX-GA
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:49 -0400
Received: by mail-wr1-x436.google.com with SMTP id e2so11312406wrq.6
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UigroMdf1guDPuwFhMX1nmIx4c8X1Ptid/7aSU8rYdk=;
 b=U1Oi0Od4BqRoT2ncW22GF/WQ/Al9/lNCbHC5HZ7ca+3KejayQSDKCew2k6VWes9MR+
 BGTr6Tq2nakqZVqCOgKH8HP3wGDPA+AGwYNzEAxP/V54SQ2ablBlNawIK29nbzd8Dl1b
 xyC7Yols83SIIq0zsPSx75HTpZsJLyG+NZVwvomxcG06tfuiLKIwJtKLLZBggHRmkWbn
 75Vx/7kRfMVwDY46Ik2MLQCHvrOktUDII5yPxTq3Z2amgIvamjWNvBHOkp71XI8jHBRF
 j8sBssz7OeW+Yc+BBjoSY3mlafzXxvRnB/MznDMb6uKy4FRtHBHtm8WKcDWSe1h5qt+m
 XCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UigroMdf1guDPuwFhMX1nmIx4c8X1Ptid/7aSU8rYdk=;
 b=Wii2kIZV6UjrimqFmIPk5MsaMZnEIxeuiVO0Y5RAED1Bg2ReHanFCb/6yeoPvDkOuA
 AHcZZUy4lsBR/Ec7TDM8zSGzCaWmtvHoMA9Zbvg74hebiL3NugFeounAFTHreJZLbtSh
 K61sjGeZs0CVk7PFI7/sSOeIrzX68bTXS1BKA5koPEF7us+K4Ifp17DlNHsG78Og+uE+
 Y/larm7qH9+f5eRt2tSoM7lRnWEvMoAYOCRsd+IXbhc6ZSfjZazqj7XJAPIMbqCXzoYr
 e9BfoIXAu/cxgNBxFqM+OvMSQw+qpMf3Rr68hYQVvBDH09cWwBihHrwJ/3V7ECQe6vUd
 cwwQ==
X-Gm-Message-State: AOAM5304vSLcSRCQ+WuvHHTbFU/6h74QCEFPlBm7SY+5yjwPg/S74ddJ
 33XiO9z+jtD4jovwvh3WoFZmf8II6VIKbA==
X-Google-Smtp-Source: ABdhPJyIxeeznvuOgtGdsAq8l4snbp1vjqGGN3iXcPU46D42Pnkw+6A8ffD8GKTRhBZ5EWrv4zEbDw==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr19754938wry.393.1627309425970; 
 Mon, 26 Jul 2021 07:23:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 06/10] docs/system/s390x/protvirt.rst: Format literals
 correctly
Date: Mon, 26 Jul 2021 15:23:34 +0100
Message-Id: <20210726142338.31872-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rST markup, single backticks `like this` represent "interpreted
text", which can be handled as a bunch of different things if tagged
with a specific "role":
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
(the most common one for us is "reference to a URL, which gets
hyperlinked").

The default "role" if none is specified is "title_reference",
intended for references to book or article titles, and it renders
into the HTML as <cite>...</cite> (usually comes out as italics).

To format a literal (generally rendered as fixed-width font),
double-backticks are required.

protvirt.rst consistently uses single backticks when double backticks
are required; correct it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/s390x/protvirt.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/system/s390x/protvirt.rst b/docs/system/s390x/protvirt.rst
index 0f481043d99..aee63ed7ec9 100644
--- a/docs/system/s390x/protvirt.rst
+++ b/docs/system/s390x/protvirt.rst
@@ -14,11 +14,11 @@ Prerequisites
 To run PVMs, a machine with the Protected Virtualization feature, as
 indicated by the Ultravisor Call facility (stfle bit 158), is
 required. The Ultravisor needs to be initialized at boot by setting
-`prot_virt=1` on the host's kernel command line.
+``prot_virt=1`` on the host's kernel command line.
 
 Running PVMs requires using the KVM hypervisor.
 
-If those requirements are met, the capability `KVM_CAP_S390_PROTECTED`
+If those requirements are met, the capability ``KVM_CAP_S390_PROTECTED``
 will indicate that KVM can support PVMs on that LPAR.
 
 
@@ -26,15 +26,15 @@ Running a Protected Virtual Machine
 -----------------------------------
 
 To run a PVM you will need to select a CPU model which includes the
-`Unpack facility` (stfle bit 161 represented by the feature
-`unpack`/`S390_FEAT_UNPACK`), and add these options to the command line::
+``Unpack facility`` (stfle bit 161 represented by the feature
+``unpack``/``S390_FEAT_UNPACK``), and add these options to the command line::
 
     -object s390-pv-guest,id=pv0 \
     -machine confidential-guest-support=pv0
 
 Adding these options will:
 
-* Ensure the `unpack` facility is available
+* Ensure the ``unpack`` facility is available
 * Enable the IOMMU by default for all I/O devices
 * Initialize the PV mechanism
 
@@ -63,5 +63,5 @@ from the disk boot. This memory layout includes the encrypted
 components (kernel, initrd, cmdline), the stage3a loader and
 metadata. In case this boot method is used, the command line
 options -initrd and -cmdline are ineffective. The preparation of a PVM
-image is done via the `genprotimg` tool from the s390-tools
+image is done via the ``genprotimg`` tool from the s390-tools
 collection.
-- 
2.20.1


