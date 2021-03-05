Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A6D32F222
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:08:18 +0100 (CET)
Received: from localhost ([::1]:49292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEs5-0003v7-F9
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE43-0007VE-Bt
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:35 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3M-0007k1-Fq
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:34 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h98so2860277wrh.11
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+XShpYEVYvl0nNoaQznskWYr4AlkgFUIdkM3VhWjjN4=;
 b=qS2Ch/TZH5aPG5DueyiXsrihxcculP+XhSIkf2lYNEEHVAPjEIr42p3+9zQHnKrUFb
 GrmsgBAwiDbKS2f2kxjQPyDVKDTnU3HwlJlsdKhvJiNdoXKfowzxGV0IXqa4CpG4u9NX
 Wd/DtXIsx+Ve1urRYqz3E0WASOwEjiI7nK6701eiJHvkUfuHVg/IkCa1d8wyVFduJxMJ
 M2vNZxT2maNMU1d/h+4eDVjG9t4q1kW+ZWBh0jE/IiMKr57gdnrRNXiFJmC6RfaYBL6v
 U8+UcRBB1EX6rZ207rg+34rXE8Qi4zaVzLe1viIEiDCtc+R/Nr/1y0senkYEWFTI9XsM
 jCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+XShpYEVYvl0nNoaQznskWYr4AlkgFUIdkM3VhWjjN4=;
 b=ZMRP0+F4sO+iHuvefoZfMY8FYNQxGqwZM7rcGDs+ouJCflu8isSgsJHrNxfiS6n9w6
 lR6hOX84NmJG4K95MEWXGsWbZaGYobNma9/6NHQczywauK1aLl/03BPTPrXBoowU/MRx
 /AizwwZE7nyQg3kJtbekPxHuWjAotvLU06uXz4YYn+EyAAcWwH/1rI+bgLOmENfDkY+2
 jd7AH600diheZ3psZR4sLow7uMPXZZ6XKqA7KuVUL2A+IaSGmATdIYE5TZL55gEHw8w9
 sWW4EWVjba/SCJlMOBEH3+8yw5GxPa+arGh4v7CUe/fdlixU72tMBh++UcQ9ezLQ/7r9
 v/pA==
X-Gm-Message-State: AOAM531ynM0MmTvQIj1Q8XtwnVWGBJDfQd4rRKF78oVc4S+XwZjZsoqb
 ccln0F33Gny+eUoonRFuKVqW1K0VZE9dcQ==
X-Google-Smtp-Source: ABdhPJwLjX/5WoDHxLhO32a04MkuI/Gn58aptHt8upYoiUNKmZP6+Kmlpu1F+SYUZCV0P1gbVh6CIA==
X-Received: by 2002:adf:e411:: with SMTP id g17mr10331989wrm.225.1614964550268; 
 Fri, 05 Mar 2021 09:15:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 48/49] docs/system/arm/mps2.rst: Document the new mps3-an524
 board
Date: Fri,  5 Mar 2021 17:15:14 +0000
Message-Id: <20210305171515.1038-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-24-peter.maydell@linaro.org
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


