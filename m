Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB32E2F8D
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 02:24:45 +0100 (CET)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktKnb-0001jq-En
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 20:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkR-0008QA-5N
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:27 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktKkN-0001AN-4s
 for qemu-devel@nongnu.org; Sat, 26 Dec 2020 20:21:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DBB517470F4;
 Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B342F7470DF; Sun, 27 Dec 2020 02:21:17 +0100 (CET)
Message-Id: <2157782addb379824c71edd301108f7799302694.1609031406.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609031406.git.balaton@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
Subject: [PATCH 01/12] vt82c686: Add APM and ACPI dependencies for VT82C686
Date: Sun, 27 Dec 2020 02:10:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Compiling vt82c686.c fails without APM and ACPI_PM functions. Add
dependency on these in Kconfig to fix this.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/isa/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index c7f07854f7..2ca2593ee6 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -47,6 +47,8 @@ config VT82C686
     select ACPI_SMBUS
     select SERIAL_ISA
     select FDC
+    select APM
+    select ACPI_X86
 
 config SMC37C669
     bool
-- 
2.21.3


