Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C553731B911
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:23:09 +0100 (CET)
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcuC-0000Mk-PF
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRI-0000P8-9O
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:17 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcRB-0004KK-ND
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:53:16 -0500
Received: by mail-wm1-x32b.google.com with SMTP id x4so9063020wmi.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tcAjs6Tc8qQsl3E9FrIN+atfmeW4XdFPz3i2ahNQZg=;
 b=EijJPzjFJs3G562lgGFUbRqLtDIgX/B2FFRNo9gsEc2aX9sgq/wltrNr1gnm1H5/DJ
 rhGWSMnWLp9YQEJ7QC8F9rc2ReBwkN+hDcRbldmhn4v+t+01IJmpsmgrKaoB+1d0yh51
 sUkcexnwDdWDclH0vM/LdBUAOARUBi83hbok4Uuj8B3QNr2NQXZ0b/I69QLdaTNd2Mfa
 T9dWDA4bA+UNzbkKpVSaBqyVMOOyaA3qOS85606Hqd+ODI0OX3Cb2+BPTAhDEyaUy7s7
 bFO8Q+j6aHbtc41UAMS9ndTac2TtwmxKcn4eN6r3FRrpXT6rKQNAihZj9tLfNVJSW+iz
 9IIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tcAjs6Tc8qQsl3E9FrIN+atfmeW4XdFPz3i2ahNQZg=;
 b=REvnZNEm+CZ22qWhjsJG2v9wOe/lGmyQVpDe8uskvMfhHlSU8nxRbdlqzvV2jcgHJ9
 xJIOP3rA74AMqECjFKD65GvzHY+Yfm5Ql+yV6U7IGE7saZttaW+Edf3xNeUZfhY/MNIh
 MMT77jcRcj/t3V5pJ2gHyGhi5ZxTugC3qfiIf5Gw8GLF810VIMvsgH9DNZjn19qteLPt
 Ugy+vhzSQ17wnMmCJ963T8l9837QtynVeuxaup6G3OLMn+1bGuZhIsKzWFkJk+0pWTOB
 EtgEfYmjyBO/I/wswLo9vsSPX5V21bJnBYTI0zgfZ84KKehsAXaN2/bfctZNo9tkimae
 5raA==
X-Gm-Message-State: AOAM533Nz9fRKXMcD9FPyBNSj9uC0eimKSsGcguSLi5Pge1RbjIZJtIO
 cXSCZkAK072E3wgUOLvKtZOisnjMWvQRoQ==
X-Google-Smtp-Source: ABdhPJwOoXvDi8iBcRkYhtmkoM2783GqUJkScwIe6dHgmBasXHC4hoFot4x6i6ZiqtIcX9XXBV0low==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr13800559wmi.34.1613389988575; 
 Mon, 15 Feb 2021 03:53:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:53:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] docs/system/arm/mps2.rst: Document the new
 mps3-an524 board
Date: Mon, 15 Feb 2021 11:51:37 +0000
Message-Id: <20210215115138.20465-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add brief documentation of the new mps3-an524 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


