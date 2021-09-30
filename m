Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD3E41DD4E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:22:20 +0200 (CEST)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxt5-0006cJ-QU
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjP-0000Hv-Ni
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:21 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:45663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjL-00040I-EJ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:17 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so4600996wmb.4
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u3LelZdD7qPOY216rLv/itDL3Wpuq00I0pFgeV7VjOE=;
 b=TNopLoNtvYobasKjESWyi+Q9IbgxnfjTaFHmDOV96YsBIkHU57juV1RxzPehenrkkT
 A3xNP4CuIHurGsBHS2FCGBF7+k2Doo8YSS9VsfgIxnNALGsiPtjWKPOGZB/Wgld8NBsB
 WCsLnRTfESTiCf6gJMjOm1vO96QbATHZ2NnxExj7FcKo/D/i4Pk03aQ1nWKvtG2nlISH
 SspSfF4+1oQKNDJZX5obvLdGW7JqZKgKLVTXamA4ZrNSZtgbJQ33ilvcOw1TeU9dSn+c
 p8sgGdgfGqAGHIi5vlkE+BvRzmHx6+gZhbJkmA/svXhtfBhfG29meZ5WO5GysywzJh8v
 76Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3LelZdD7qPOY216rLv/itDL3Wpuq00I0pFgeV7VjOE=;
 b=omu5/KoLnNgeHhHdtEFatV6xjgVA0iBjK/2hUYFmIcuh23zC03AaVtB9dPtE/95nAx
 nZ0pI97DpAu5f9MbNIiBTxUcYIOMcGZpyxWyYRObcE6lnYBC5l2jvuI8HGw2Rs+mhrf/
 OTg3rPs9KpGvUkiS2YTmDjsCS/MMe9Gk2MvTvgT+gh99FO8Yvvm8myPkL6XfqALkzECR
 O3el0Zobbwwf5bH2M6Dqfk8nTSh+DKun1aEBTn5JRvoqyVQzl/FzTHXU46Z0eCT9F0ae
 rwV1/Ub+5LyLbjXzn0cfTfF6RBhbkESZObom1xP/mHvHUrDO7We3gPEeGC6H2j4yRcKb
 oubQ==
X-Gm-Message-State: AOAM533ft9bzvm2CO50dfdycEqfDPlvnRvbm1n061UBNI38vhSwYOEwL
 cpltRVQL2es/3z5yngYbB9f30flmFkn6Cw==
X-Google-Smtp-Source: ABdhPJx0DebkVhbVzvWKwj4iIoS+ufnPeYrhsCU3z57XxBSOXPCX4e7epP91H9SwCCezZVPDOiM66Q==
X-Received: by 2002:a05:600c:4c96:: with SMTP id
 g22mr13835978wmp.83.1633014733387; 
 Thu, 30 Sep 2021 08:12:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/22] docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE Usage
Date: Thu, 30 Sep 2021 16:11:50 +0100
Message-Id: <20210930151201.9407-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

From: Tong Ho <tong.ho@xilinx.com>

Add BBRAM and eFUSE usage to the Xilinx Versal Virt board
document.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Message-id: 20210917052400.1249094-10-tong.ho@xilinx.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/xlnx-versal-virt.rst | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 27f73500d95..92ad10d2da4 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -32,6 +32,8 @@ Implemented devices:
 - OCM (256KB of On Chip Memory)
 - XRAM (4MB of on chip Accelerator RAM)
 - DDR memory
+- BBRAM (36 bytes of Battery-backed RAM)
+- eFUSE (3072 bytes of one-time field-programmable bit array)
 
 QEMU does not yet model any other devices, including the PL and the AI Engine.
 
@@ -175,3 +177,50 @@ Run the following at the U-Boot prompt:
   fdt set /chosen/dom0 reg <0x00000000 0x40000000 0x0 0x03100000>
   booti 30000000 - 20000000
 
+BBRAM File Backend
+""""""""""""""""""
+BBRAM can have an optional file backend, which must be a seekable
+binary file with a size of 36 bytes or larger. A file with all
+binary 0s is a 'blank'.
+
+To add a file-backend for the BBRAM:
+
+.. code-block:: bash
+
+  -drive if=pflash,index=0,file=versal-bbram.bin,format=raw
+
+To use a different index value, N, from default of 0, add:
+
+.. code-block:: bash
+
+  -global xlnx,bbram-ctrl.drive-index=N
+
+eFUSE File Backend
+""""""""""""""""""
+eFUSE can have an optional file backend, which must be a seekable
+binary file with a size of 3072 bytes or larger. A file with all
+binary 0s is a 'blank'.
+
+To add a file-backend for the eFUSE:
+
+.. code-block:: bash
+
+  -drive if=pflash,index=1,file=versal-efuse.bin,format=raw
+
+To use a different index value, N, from default of 1, add:
+
+.. code-block:: bash
+
+  -global xlnx,efuse.drive-index=N
+
+.. warning::
+  In actual physical Versal, BBRAM and eFUSE contain sensitive data.
+  The QEMU device models do **not** encrypt nor obfuscate any data
+  when holding them in models' memory or when writing them to their
+  file backends.
+
+  Thus, a file backend should be used with caution, and 'format=luks'
+  is highly recommended (albeit with usage complexity).
+
+  Better yet, do not use actual product data when running guest image
+  on this Xilinx Versal Virt board.
-- 
2.20.1


