Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BE43DD54B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:10:50 +0200 (CEST)
Received: from localhost ([::1]:47332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWmP-0007F9-KB
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaP-0000bb-Hk
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWaN-0003bX-Tm
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 07:58:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id c9so905568wri.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JQ370mH+fhk/bsQzvkzprTIabj45DjmXohdnh4/YhHs=;
 b=agZOf1TGDuwC17GVgX9u/JFZER4ibGyB9k/shjN15lm06HYvk+NZo+4TOYFHcbJjgV
 7fa7v/sb818KN8PfYuw/LiN5lnpAPGKrpftD3RLBWOLAr4GGy/t9CvSPgv5x/a6pTJyV
 fRkEPEvesxWf5babU4a5h727iW/nKacL4RztnE3ZJeG1RkQOvQxnz31xTre9nkHGhusN
 zPBxMwigL1NTXatPhop12Ncp29AFMi8U10izh+zVBnWoLPq5hWHCIsQ5Qhpvuma1SMiA
 jXsKRsM9fCB6MgRUjaSpHXnUVovTMcKORiMfadV4yxf2kct4m8XHkym/hG5BWYexedXF
 3r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JQ370mH+fhk/bsQzvkzprTIabj45DjmXohdnh4/YhHs=;
 b=XdoxG+3KIzByAdroyQTqg5C4Kb8hwZieVOZGXzJ/wPcJ7oXAEnEU2D+dXH1xdb5cwj
 4ny7KUlOyOFJkQ57c66gkUajsEbszdVuDcECjz94sZgwb1fa4Dy+uD/2sefk8Wc+yBs5
 Z/4cseLP2vrLCVqHhll+BuchjPlqIpg8fpv4uDXa+StYPAEMueqi3eVOxQNyLV3FHBHQ
 0erRWUGXgV4VWQb6YMxRuvGT40yuAulo9ORFmmepEGrQaJzueom5LpdOVcr0DjTfWlyp
 JCsQaQC3VM1w4NmG20wWBKkK6Ioht8F9qnSAe5SL5n6SDVmg9A7j/pO0XVg7fglz6vpo
 9RhA==
X-Gm-Message-State: AOAM533tPynkIlryH9PrQAnKnfqNPWb9jkOwaBp35gLSBdfLwtXJJcvH
 jZmls6jjA8UytEKlWyOi6qJM92fuA8/MIg==
X-Google-Smtp-Source: ABdhPJw2ZJBT04TO2RjDKJFVRmriuQZgOcmQKxFDtEY7qVqtdfMgXQH0nrJQQqsP5sL5fOMA+nYRkA==
X-Received: by 2002:adf:ef50:: with SMTP id c16mr16838206wrp.190.1627905502561; 
 Mon, 02 Aug 2021 04:58:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y66sm10102772wmy.39.2021.08.02.04.58.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:58:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/21] docs/system/s390x/protvirt.rst: Format literals correctly
Date: Mon,  2 Aug 2021 12:58:03 +0100
Message-Id: <20210802115812.10731-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210802115812.10731-1-peter.maydell@linaro.org>
References: <20210802115812.10731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Message-id: 20210726142338.31872-7-peter.maydell@linaro.org
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


