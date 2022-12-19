Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8982D650640
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:19:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75je-0000t1-7p; Sun, 18 Dec 2022 21:18:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jb-0000fu-QL
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:31 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jZ-00019F-FB
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416309; x=1702952309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wy8uMlexCTLFy7zcIJSicrjiNVPO7dvX3ZUqTF3gE+Y=;
 b=Q5M48X6hyvAPZWT6XNwodYSXIykng1ochtuoSbKKY3SQJyrTEW6HoMJr
 FTGFgU2UjbqYAyV0+niz8St2iXfiPJqbdZMWP1Ho/dp1QSVKGZLsp1Z77
 MZBZY7qG0dOVhngLSegrzWmwixTmsd1UXmYH5oaqO9ynTZiru9hCqU+r9
 VErAxfgvaNoGFbEXC9wJR7nuYAbziKd3z1XQRYpMuhynsD+4NHsamGcYq
 6uSK/zQqRHbhXighan4w0DG9r+/NorYnykB/bEAzbvDJiZ5VBM6+bmRgs
 ypvxKQelIIJnJmCxPmI/stBm5w1Bi4iRDgWzVPTID33Cc6E89n7KRqz1R w==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056800"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:26 +0800
IronPort-SDR: BFlNLF4Sw6uu2LozxrQhbHYIzycL1rLQTWy/wqaf/pi+MbV2VWzETjrOTUGRrmkLTV95GLvZGM
 CxhUF0/zjptq8jb5emcVqiFPlpmNtXcNKfCEsAB62FtvSYhb0lArNOveMVSMdd2W0JD21rZEON
 79QEXk+K1hGXBuqCpHGK0OLWsJ9NGGGa/m0Rf8vGzPkHnpVlv0UzzNHOTNqW5eKoLHUJN3caoM
 0NQuIsKh+jc6nEHMwubjkFKHSfvPtIp6vn1ErJxgbAIBAAJJ9E4dbZLIIpwjhjf33+FelKRyiq
 Pp8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:43 -0800
IronPort-SDR: Ut+R0Jp8Ut/If4W3ro7X8qL0fnx1lSBRRXi2n/CO0OdHPb/9vhzbDTU+qkZRWkmn5jQJOE3dcz
 Vn3mLVtqnOMpRJM6bxyeaSM70pMYzxHiWbl48xhRFlfjk2TDCwblE5ClebgGWsvhR29RXkb4Be
 GPMWS80xN5P6n15bfLcWxavYaEs2KEoAaMhO46eEPlrpZFtZeB1eSX9cUgqgGmT6ISjR2IuUwa
 oKRyjcQqEJj9KhT/tJd7QwciEM5Ju+cNN2Vr207KHLhhPiN7aBkfIO6XkdoKDihW1ZgnoLyI9T
 xko=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3KG3tlHz1RvLy
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671416306; x=1674008307; bh=wy8uMle
 xCTLFy7zcIJSicrjiNVPO7dvX3ZUqTF3gE+Y=; b=W5jo00qFJEYULtpC5lRnBiw
 TaCHN+3UJtq1/L0k55Q0vZDkW5SSDv9Q2I+pyDhb2o8YKzxqy3BnIbd+tI/iQzIT
 5QmIauW/ZPva8ihduw2jaI9pgl18nuB+WFl6UwRHr/ZaVCcePay57w6XE8o95Sfc
 xl2r/tmgeqD8siGjCHQtzstobSWYZoix4W3yA+gAIRBnu4x+sj3M/7KPFIESZo11
 lxVspVMfCWcUSkaV2u/r76La37IrlMRSZoeFzgtC9Ln97gFMF0L/cMKqj4j/a5Cx
 p+fw/XVlhNcWge9fiQjG4Kndzb4N1C+MpQP6GGFTX03iRf5MPYvlOKlXx7FhY8g=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2bq3Vi-Oqikj for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:26 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3KC6vNQz1RvTr;
 Sun, 18 Dec 2022 18:18:23 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 31/45] hw/intc: Select MSI_NONBROKEN in RISC-V AIA interrupt
 controllers
Date: Mon, 19 Dec 2022 12:16:49 +1000
Message-Id: <20221219021703.20473-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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
2.38.1


