Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DCD4AD5A3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:45:48 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHO0J-00032A-6g
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:45:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1nHNst-0004tk-FN; Tue, 08 Feb 2022 05:38:07 -0500
Received: from [107.174.27.60] (port=33194 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1nHNsr-0007yf-4v; Tue, 08 Feb 2022 05:38:06 -0500
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 99E68804B5;
 Tue,  8 Feb 2022 05:37:57 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu] spapr/vof: Install rom and nvram binaries
Date: Tue,  8 Feb 2022 21:37:51 +1100
Message-Id: <20220208103751.1587902-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 107.174.27.60 (failed)
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This installs VOF-related binaries (the firmware and the preformatted
NVRAM) as those were left out when the VOF was submitted initially.

Fixes: fc8c745d5015 ("spapr: Implement Open Firmware client interface")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 pc-bios/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 4ac7a5509b69..c86dedf7dff9 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -81,6 +81,8 @@ blobs = files(
   'opensbi-riscv32-generic-fw_dynamic.bin',
   'opensbi-riscv64-generic-fw_dynamic.bin',
   'npcm7xx_bootrom.bin',
+  'vof.bin',
+  'vof-nvram.bin',
 )
 
 if get_option('install_blobs')
-- 
2.30.2


