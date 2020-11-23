Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24C2C052D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:04:52 +0100 (CET)
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAaR-0007Qt-9O
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFy-0004vn-Bu
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:42 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFw-0002mZ-9t
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:42 -0500
Received: by mail-wr1-x42a.google.com with SMTP id k2so18319985wrx.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n6PeSqD/L5FpOK5OB82HPwRlzjxhtNygqZgCFMpVmXg=;
 b=TV7vvSDdi9c7OCHG5D1gkwC88h/xtpidWlhLVqf9vdXMV9nd6b8qU8ppA1Vc2kSgK9
 lRl599ZzEXbX9XbYzh/Y03C/dht4q+V4ZRHnx8L9kc0ylNQumEaJ/eMMnspynWHWYye3
 l6M0+1nC6ZA1Ux97iWzJjxylGjyosFbqUnxqZk19GrHkc+bxWgxQbZdZrLCCcTNzRPAK
 h65jisptEBupkMh8oyOaF2rAkze61aE0ve9MPA2cEZoSVx7xGJtlQ40qq9DVmzMCOPtW
 RTWstdv9TdzgGo4cBeGp9TIn6eTyjGD8igU0MRykEfywjif2RtUNoKlubUkMrVc7q5HP
 prmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6PeSqD/L5FpOK5OB82HPwRlzjxhtNygqZgCFMpVmXg=;
 b=B929uFEd9cU18RUnfAP+xCQ7ozYmZ3POtbcwzsLJFfrfP5FP12b5gdXGaGG7TtYn89
 To2Xvk5Ps459RWzHKTkcWW8A+L81A/TCG9gasAQhi1d/T7rI2nETCanfvmk2zLIMoFY/
 +CxbRuo1nAzZjJjGNaWag3P4jk4nYoxDvN6Uvlp240+piPjELZbtJzUz8eY0sKzIKMZR
 w6TWIbW5x3Peuc+57y+3Wa69clllvvGVmllFvEq3k/Uj78rsYkJN2YU2hoYTSvsFU3W5
 AcYSgb/R0w3zhb9ruZv+w53m4yrO/TKk0mMQNQ1ihg/xkL5k89zseMes1HcYOsSkHJTU
 V9Tg==
X-Gm-Message-State: AOAM532EO7yU1mDhxD6WMwt2GS5JvcV2bK8VHJKHfR2gTZoAi0UwOwV0
 HQ4IrCAD3HOxsZ+t4xDNC9/V2hQKx+qHxQ==
X-Google-Smtp-Source: ABdhPJw271mVAxUO+A5t7/gE1Urgt111BhwJGijZLT0tQdOiwO/IaNEvaiDtnBWUzu3OO9tQxpszwQ==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr31999524wrt.66.1606131818577; 
 Mon, 23 Nov 2020 03:43:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/24] docs/system/virtio-pmem.rst: Fix minor style issues
Date: Mon, 23 Nov 2020 11:43:10 +0000
Message-Id: <20201123114315.13372-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

The virtio-pmem documentation has some minor style issues we hadn't
noticed since we weren't rendering it in our docs:

 * Sphinx doesn't complain about overlong title-underlining the
   way it complains about too-short underlining, but it looks odd;
   make the underlines of section headers the right length

 * Indent of paragraphs makes them render as blockquotes;
   remove the indent so they just render as normal text

 * Leading 'o' isn't rst markup, so it just renders as a literal
   "o"; reformat as a subsection heading instead

 * "QEMU" in the document title and section headings are a bit
   odd and unnecessary since this is the QEMU manual; delete
   or rephrase them

 * There's no need to specify what QEMU version the device first
   appeared in.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
---
 docs/system/virtio-pmem.rst | 60 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/docs/system/virtio-pmem.rst b/docs/system/virtio-pmem.rst
index 4bf5d004432..c82ac067315 100644
--- a/docs/system/virtio-pmem.rst
+++ b/docs/system/virtio-pmem.rst
@@ -1,38 +1,37 @@
 
-========================
-QEMU virtio pmem
-========================
+===========
+virtio pmem
+===========
 
- This document explains the setup and usage of the virtio pmem device
- which is available since QEMU v4.1.0.
-
- The virtio pmem device is a paravirtualized persistent memory device
- on regular (i.e non-NVDIMM) storage.
+This document explains the setup and usage of the virtio pmem device.
+The virtio pmem device is a paravirtualized persistent memory device
+on regular (i.e non-NVDIMM) storage.
 
 Usecase
---------
+-------
 
-  Virtio pmem allows to bypass the guest page cache and directly use
-  host page cache. This reduces guest memory footprint as the host can
-  make efficient memory reclaim decisions under memory pressure.
+Virtio pmem allows to bypass the guest page cache and directly use
+host page cache. This reduces guest memory footprint as the host can
+make efficient memory reclaim decisions under memory pressure.
 
-o How does virtio-pmem compare to the nvdimm emulation supported by QEMU?
+How does virtio-pmem compare to the nvdimm emulation?
+-----------------------------------------------------
 
-  NVDIMM emulation on regular (i.e. non-NVDIMM) host storage does not
-  persist the guest writes as there are no defined semantics in the device
-  specification. The virtio pmem device provides guest write persistence
-  on non-NVDIMM host storage.
+NVDIMM emulation on regular (i.e. non-NVDIMM) host storage does not
+persist the guest writes as there are no defined semantics in the device
+specification. The virtio pmem device provides guest write persistence
+on non-NVDIMM host storage.
 
 virtio pmem usage
 -----------------
 
-  A virtio pmem device backed by a memory-backend-file can be created on
-  the QEMU command line as in the following example::
+A virtio pmem device backed by a memory-backend-file can be created on
+the QEMU command line as in the following example::
 
     -object memory-backend-file,id=mem1,share,mem-path=./virtio_pmem.img,size=4G
     -device virtio-pmem-pci,memdev=mem1,id=nv1
 
-  where:
+where:
 
   - "object memory-backend-file,id=mem1,share,mem-path=<image>, size=<image size>"
     creates a backend file with the specified size.
@@ -40,8 +39,8 @@ virtio pmem usage
   - "device virtio-pmem-pci,id=nvdimm1,memdev=mem1" creates a virtio pmem
     pci device whose storage is provided by above memory backend device.
 
-  Multiple virtio pmem devices can be created if multiple pairs of "-object"
-  and "-device" are provided.
+Multiple virtio pmem devices can be created if multiple pairs of "-object"
+and "-device" are provided.
 
 Hotplug
 -------
@@ -59,17 +58,18 @@ the guest::
 Guest Data Persistence
 ----------------------
 
- Guest data persistence on non-NVDIMM requires guest userspace applications
- to perform fsync/msync. This is different from a real nvdimm backend where
- no additional fsync/msync is required. This is to persist guest writes in
- host backing file which otherwise remains in host page cache and there is
- risk of losing the data in case of power failure.
+Guest data persistence on non-NVDIMM requires guest userspace applications
+to perform fsync/msync. This is different from a real nvdimm backend where
+no additional fsync/msync is required. This is to persist guest writes in
+host backing file which otherwise remains in host page cache and there is
+risk of losing the data in case of power failure.
 
- With virtio pmem device, MAP_SYNC mmap flag is not supported. This provides
- a hint to application to perform fsync for write persistence.
+With virtio pmem device, MAP_SYNC mmap flag is not supported. This provides
+a hint to application to perform fsync for write persistence.
 
 Limitations
-------------
+-----------
+
 - Real nvdimm device backend is not supported.
 - virtio pmem hotunplug is not supported.
 - ACPI NVDIMM features like regions/namespaces are not supported.
-- 
2.20.1


