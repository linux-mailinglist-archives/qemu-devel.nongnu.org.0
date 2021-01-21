Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4E32FF7DF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:21:03 +0100 (CET)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iK6-0001Lg-VT
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i9E-0006Vi-Da; Thu, 21 Jan 2021 17:09:49 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8x-0000Ng-Re; Thu, 21 Jan 2021 17:09:42 -0500
Received: by mail-pg1-x529.google.com with SMTP id n10so2270564pgl.10;
 Thu, 21 Jan 2021 14:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lkc05bhxPEaurDuvorYROlMZGsONdTZ57rQZ1y9IAE0=;
 b=SNQjPI0PDRwLoNbpDImHPqTU4ZF0ZAFLy49Fu+sXxrDQhCxY6FoiWL8h32vf6U6VxA
 CofVSnAaU6uqUXbQ1VVtadlBNK65N23Loq7//gS2uoa0o22A4vG9yxn3I72fHu/4LwWV
 ULdP+jLOH9pPU0ZndeaTwvam3rv8s3f1XYxgydFAc1klklMWGdSnqHw3VAPC1HOzgWhl
 CYYc7xXjQxotf3TNKuxuBgGgNWb/lNGYIzpvaCseKxPYj8uMtolXsEJFmPSXYVZqttsS
 u8aK3GxOLDKV74JsKzXatMDWOzezvOZaPqb5aCsOGBzi3c0yh7W7Oq30HTC4tAsUoz0Q
 DzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lkc05bhxPEaurDuvorYROlMZGsONdTZ57rQZ1y9IAE0=;
 b=Lmm+Ql4VqNzjMdOyCf9xBOTUbhFaDGuLMBj/rdjmLRagewUm4nIaqCrVOXDS3kwXeo
 aO5DovnrydvdDR0SvL8klPWqHvHZ/E2PyOVDevk7EagBedGDQI6OFj7GdMLLz2i95Beg
 GWigRqLXKghTQuH/GiHeR/wQ+LyMofdNhDUoyOhNAsN/sE1piV4RkEfbjkmyEShZ8oKP
 pxYVChn/jBUOSJPALRh516j6P7REMbtUx1DZBMRPXBHzQUhzwDExNZtZNvTyoCZQxkkA
 AbNDVKuPbnq6WdQNHNGxGoag6oVqlPpq+mose8lQ+iUJ0C+jjT3y4az4H2DVa0YKVDIk
 YIRQ==
X-Gm-Message-State: AOAM530/X8rd+CV86YLnr8KT3PF4h0VxCQrNy7pLfxM+5NJ4gsH0d60G
 K2K5PsWoyd50CyKaL6hJRFNooaJ7og23eQ==
X-Google-Smtp-Source: ABdhPJzO1vVJzeDY2COO8O4ZCTKGHvUVT+XtluyKdcttrFY+nP9K85575hOyeFBv8epmb09/tS45LA==
X-Received: by 2002:a65:494f:: with SMTP id q15mr1377957pgs.367.1611266968557; 
 Thu, 21 Jan 2021 14:09:28 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c8sm5584308pfo.148.2021.01.21.14.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 14:09:28 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 5/6] hw/block/nvme: add NMIC enum value for Identify
 Namespace
Date: Fri, 22 Jan 2021 07:09:07 +0900
Message-Id: <20210121220908.14247-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
field to support shared namespace from controller(s).

This field is in Identify Namespace data structure in [30].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index d6415a869c1c..ad68cdc2b92d 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1203,6 +1203,10 @@ enum NvmeNsIdentifierType {
     NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeIdNsNmic {
+    NVME_NMIC_NS_SHARED         = 1 << 0,
+};
+
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
     NVME_CSI_ZONED              = 0x02,
-- 
2.17.1


