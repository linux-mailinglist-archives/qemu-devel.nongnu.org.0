Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAAD2B07BD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:46:00 +0100 (CET)
Received: from localhost ([::1]:39848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDrL-0004XV-7B
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmO-0000fF-Ap
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:52 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmM-0003l8-BB
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:51 -0500
Received: by mail-wr1-x436.google.com with SMTP id 33so6241693wrl.7
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xpY+qBYQS+fcNHN03IyJvcvU2rXnoyuOeph6fIF4tkE=;
 b=oYLG76D8TuYx8P5ql94dGcvhjIjB+EttMYdJaUPPWg6MCjVMs92U5B8sJDwG24A8Ib
 OVvmoKnPFnK5SeWa3vFaxY9t11o2RYWyACOsRiipWZW9SOt0IHDqPKaxzhSPibS66zmR
 Oar+sjZjNciJRp1oFc4hYgpCOnBVA00arvYqXJhehLt5c+GahQbk6zFWqbYIVrpMuaV5
 EvSmmFmVkGeQ+AA5Tm+qeJOGFxkQWr//eBDIiA0p3ii0DbomtoKUendMEuW1t5xX0w+t
 Qpl8aPRut80upgQuF2z8adbCIuwBG4qddVBhbZp6djrJboocdJyat6T1EgWaSKTwCdFG
 DMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xpY+qBYQS+fcNHN03IyJvcvU2rXnoyuOeph6fIF4tkE=;
 b=SLvTt9lPcyJRi52/1YWQvhEpfRjwo70UrqG2OK2RMoLCxkTLc2LKUBykR7Pl+bVSEt
 uYlTF25zNL+GusEVK+bW3lynC7rTLdKC8zw5Ct2fmawS75x5BjKAMG4CiJ2ALvt2PFl3
 s+XZRHXtnAt9fHETRZKd84eorFrVXiZi19S2xMoUY9/mFgUDFkd+2NTZMo1XKRSnKPyj
 dBlt6E2PZsu35nx0JiBlMIu9iRgy83lmbuRZaBG1EKN2jtyPSq7p80g8e56RCURkgl0K
 9W+1o1M3GbsOorTGJ23dTnVN14xQuKr1J/7Le0Hv2+FOXQwzKBQAln8q5gtBq+WCEffo
 IPrw==
X-Gm-Message-State: AOAM532l+SeFclcuD63TlfAGpTkcxrbu6q1dAvj87E1E3YOEh2aVEz0S
 IAIYuKYFEr7ABWuGEQwu6JgzOZMjFTShPA==
X-Google-Smtp-Source: ABdhPJzw72F9P56oVIjJLkaLAibI9hSYm7oB/NsFZ2ITZe55GLv3+a0epvdPjxfReNgROpLFcEw/nA==
X-Received: by 2002:adf:ee12:: with SMTP id y18mr29041126wrn.231.1605192048552; 
 Thu, 12 Nov 2020 06:40:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 4/9] docs/system/virtio-pmem.rst: Fix minor style issues
Date: Thu, 12 Nov 2020 14:40:36 +0000
Message-Id: <20201112144041.32278-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
   make the underlines of the top level title the right length

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
---
 docs/system/virtio-pmem.rst | 55 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/docs/system/virtio-pmem.rst b/docs/system/virtio-pmem.rst
index 4bf5d004432..e5f91eff1c2 100644
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
 --------
 
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
@@ -59,14 +58,14 @@ the guest::
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
 ------------
-- 
2.20.1


