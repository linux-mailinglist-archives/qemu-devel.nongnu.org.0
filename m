Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EFB310FC9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:22:51 +0100 (CET)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85ko-0004kg-R3
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Ts-00071d-Qn
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:16 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TS-00047W-Rx
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so8520725wrz.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=saCU3fNa93sGe02vfYgHjxSHpcdvDyRLS+pyj+1uZRs=;
 b=Vqi0kulHOqCCVtlemY34va18uaiYFHQQR5y+nmjaIJT5o7eW4bn/r7gMBzWWgofvYV
 hW1+i67RTEeQAqhivgNzte/6UqMhoJSh5MeEC1Ta0znzvTyNUSd8QGW8jP8DVjvaOVIu
 gTHKOPGZ5/vE1Ds2nYOR3ahc+1eSnLH1yKjuEOMSlVXKHgxQt9UFvtAn//8fVYSNEBlf
 b8/4nbRoR6EOJRmFDG5NW9cmoKtNDIq/S6GhfY9qzLaBroLdv3Juz9kNQYs8DLdpMs0R
 e5AZX0SUakA7IrRp/B4OYg6+XlA6SOTjoe3lQp7D5xuDed9pAf+8lDpl6DmTeVtTkYMJ
 GSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=saCU3fNa93sGe02vfYgHjxSHpcdvDyRLS+pyj+1uZRs=;
 b=SXI36a6vL99fT5jf49xIzcxzSGAOvZ0BSsbX+MJpj0fdiXd976P7oV07Qyj01CZnL/
 lTRFdGuo2mekaJsb6DCtb0Q7RnGgCGV6mvgWejf1gEKRW/IeJL9l44JieplT8TNkEYao
 DkDnPJB1v0UVBvb/bbxRpXbdPmBfoMQpIoFC/Oxx/tGugU68EE7yCKHEY3055lIOSIAv
 MDzlJecXNhRyVkSp3xIoi8u32t4qSldrdJ1wxCTIJ1afoP0bwPkp+H8MdNquQp1hSlcD
 Dk3rfRLPn0CSNzkmLoJq8lBjq+qXLhHhz64mFR4B6hzeqwLgeCD1xSzMm5YLtG+Twn9k
 mYMw==
X-Gm-Message-State: AOAM531lv2blUDK3nJP5kZADEQKIWhGwaUJml2xLbvWx2+nteY8nVLp3
 B3GyPCfDjQwivtxom9uGocbu3w==
X-Google-Smtp-Source: ABdhPJw/Q8zqSHNh1pF+QaNV1mDx9nGVciuno+RpjDrHeW8j9Br7yxhlwNEnoQiWNziB8e9icI1Xzw==
X-Received: by 2002:adf:decf:: with SMTP id i15mr6010264wrn.405.1612544440245; 
 Fri, 05 Feb 2021 09:00:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/24] docs/system/arm/mps2.rst: Document the new mps3-an524
 board
Date: Fri,  5 Feb 2021 17:00:18 +0000
Message-Id: <20210205170019.25319-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add brief documentation of the new mps3-an524 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mps2.rst | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 8c5b5f1fe07..601ccea15cb 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -1,12 +1,15 @@
-Arm MPS2 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``)
-================================================================================================================
+Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
+=========================================================================================================================================
 
 These board models all use Arm M-profile CPUs.
 
-The Arm MPS2 and MPS2+ dev boards are FPGA based (the 2+ has a bigger
-FPGA but is otherwise the same as the 2). Since the CPU itself
-and most of the devices are in the FPGA, the details of the board
-as seen by the guest depend significantly on the FPGA image.
+The Arm MPS2, MPS2+ and MPS3 dev boards are FPGA based (the 2+ has a
+bigger FPGA but is otherwise the same as the 2; the 3 has a bigger
+FPGA again, can handle 4GB of RAM and has a USB controller and QSPI flash).
+
+Since the CPU itself and most of the devices are in the FPGA, the
+details of the board as seen by the guest depend significantly on the
+FPGA image.
 
 QEMU models the following FPGA images:
 
@@ -22,12 +25,21 @@ QEMU models the following FPGA images:
   Cortex-M3 'DesignStart' as documented in Arm Application Note AN511
 ``mps2-an521``
   Dual Cortex-M33 as documented in Arm Application Note AN521
+``mps3-an524``
+  Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
 
 Differences between QEMU and real hardware:
 
 - AN385/AN386 remapping of low 16K of memory to either ZBT SSRAM1 or to
   block RAM is unimplemented (QEMU always maps this to ZBT SSRAM1, as
   if zbt_boot_ctrl is always zero)
+- AN524 remapping of low memory to either BRAM or to QSPI flash is
+  unimplemented (QEMU always maps this to BRAM, ignoring the
+  SCC CFG_REG0 memory-remap bit)
 - QEMU provides a LAN9118 ethernet rather than LAN9220; the only guest
   visible difference is that the LAN9118 doesn't support checksum
   offloading
+- QEMU does not model the QSPI flash in MPS3 boards as real QSPI
+  flash, but only as simple ROM, so attempting to rewrite the flash
+  from the guest will fail
+- QEMU does not model the USB controller in MPS3 boards
-- 
2.20.1


