Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E765FA16
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdD0-0002TB-R7; Thu, 05 Jan 2023 22:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCy-0002Ox-DK
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:52 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCw-00088g-RA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974950; x=1704510950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oIyxVIASJiAxM+fnTVQdUk3cMNM7f/9syyu+vtGCb/s=;
 b=BwjPyWr+ukMqFVsoHRE2zjKfBs+xIAeT2tRepCv4AkH8623lf1PQAZSB
 P/tBOHEoCLn3PocFGLKYsJcuZq9Gbd4hNHblxRfJTnIHRTaFODWTLFHbP
 tSNZVHvNhln6/p2qyr1d3Y1HY5otydoH61RzUn43ZUYKFC/+onS3JBKL2
 el9BfZ0Qw3R0MNI+CfdmwRgOLWbEBkqJAy5jyIK6h4itKzdrJBU4gHS2r
 jkpiMmvdDix/CzJBzu+SEJgMMH4ZW49SlPbrBIj+NyKLB4JyguLkMshpk
 Vg6dBTASH4yl0leZnOnDULEs+vlLlApiJIgxr45C2oLFUxrCSHp5MaXp6 A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254817"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:55 +0800
IronPort-SDR: bPTVM30CpfJ3EU29dPLOHRDlcxj6aP8clkYzCUXMgDfCCzShkFhDd9nEVPJD+puSLdtpvqcZcA
 I8c83yD7G0jIegGZsHARtLPLslPtgaGbMOhgtpb7aC24usZIyN/vMI+rBRT8l4hgKRLbznDddM
 VaAE6qR1xZ/rcjbVSyUqv++7Wu2ZxA/jGHB8FScdn+J8WWToW5GLLwRPREAhwIOHt5yWNXcvkp
 5uWVLbkkLaUIusqgHSBbWKlaZuqnRx7LokxLdvoo7il5jEGr0pluHKWzjIP5fVF8FEqlDk+q9r
 XfE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:06 -0800
IronPort-SDR: SFJrlgJt73zj+sP4GCyk5fme2fr+8UP6bo9al8ZEalN5m/aZelhrsCcl9Mq/e964pmq7jrFPks
 imy20jxE+SIWFxTQv8VjTAV/MCYvvegfe6vV9OBSf8oei5DWDwQrk9UC4Nnq40dFQSHw8631mi
 8vhmkC4W8Z5n+v46R0bXXir4ecZ1Xu/QKhx68AtSzeuaik/INowyZIdD1hlwbY+dwrRa0ebtOG
 hYJyeY1bxBzj3c+1d4f9NeG0d9dyLNPyv3GXL1KlI3oNgl5Q7C4GBvK+tENhWlybTwkBF3d7Bg
 4P0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7k70mcZz1RwqL
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1672974894; x=1675566895; bh=oIyxVIA
 SJiAxM+fnTVQdUk3cMNM7f/9syyu+vtGCb/s=; b=ljpsgqM58jfkloRGz2xjFUr
 SOxTjVjT1vofxW3/+HcpqJgn5NWemXxuNXBGHrNC1c1A0DXli4djn4S+jg389s6L
 cZ2Wxs48UKIgeNCfNnd3oBH4LqCeVpONsWkf6p2Z6Jx69CQ0OI2/daVDDwP2MWvY
 fMB2ji/wlPX/SdtJ7RX4QRFZDZ+HFQtr11o0tIdPwhkDtanrKTIlpfEiaRtvPCMR
 Sczf2W82XyKozNqYEjvXFdQxWMwK++DKRA7G1CTGwchasHEnpRmr8bqBQ3hURkbj
 qY/337UHE0c2Qpf7UDLWBUtc18QzPiAKu8fX2bUxVuBGDHL7+nqhgQVFaCaO35g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id JsYeytTGbofS for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:54 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7k52Vr1z1RvTp;
 Thu,  5 Jan 2023 19:14:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v3 29/43] hw/intc: Select MSI_NONBROKEN in RISC-V AIA interrupt
 controllers
Date: Fri,  6 Jan 2023 13:13:43 +1000
Message-Id: <20230106031357.777790-30-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

hw/pci/Kconfig says MSI_NONBROKEN should be selected by interrupt
controllers regardless of how MSI is implemented. msi_nonbroken is
initialized to true in both riscv_aplic_realize() and
riscv_imsic_realize().

Select MSI_NONBROKEN in RISCV_APLIC and RISCV_IMSIC.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Message-Id: <20221211030829.802437-2-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 1d4573e803..21441d0a0c 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -72,9 +72,11 @@ config RISCV_ACLINT
=20
 config RISCV_APLIC
     bool
+    select MSI_NONBROKEN
=20
 config RISCV_IMSIC
     bool
+    select MSI_NONBROKEN
=20
 config SIFIVE_PLIC
     bool
--=20
2.39.0


