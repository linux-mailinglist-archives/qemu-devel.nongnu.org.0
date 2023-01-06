Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF7265FA17
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCy-0002ND-Cu; Thu, 05 Jan 2023 22:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCr-0002GJ-Jh
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:49 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCp-00088M-VU
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974943; x=1704510943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iPvZq54h5QMI+Tje/BNUkLTz2nKNMr5iaHAw7EbD4NM=;
 b=qTG/CTyLDDLbNHMfGhXU5NzZz8ii+EkWRCpf+k8fJgbn96RdK45gGd9a
 aIfm4J0YaWRVBcWGhJGxBh8xsqhFqmU40tTw3Rnz9yqKXpNAKLBXAsXVN
 z294sEy31HCpiQyDz3/KeY4iiiX39gMhv06QrEKEwRQdJokoDs56WvB35
 xHe8f7J5NH8m1Uj8yG7sVIp9upzHvs9Ya3wUdZFHMFM6ZusOy4anw68NP
 MMWadumdbt7q5o8RmxtdR0FVNiR6ENJ6mJUgNNJqp2EXcY9osHxmRT3Ik
 5SElazIwoIWFpO3r3qJ0GRuUoz5An8mA/aDb7vtMsJ95tH6P3lqGpiWO0 w==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254816"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:53 +0800
IronPort-SDR: fl84+6R5wUpdLY5IIfubsc2oq+oAjooqs78LLgQxtOId4FZgbtTMuxRCX2shhfr8WCrYaq0H7s
 VptSQsyYIItsYuZbgJoaHCLg8PqiB14o8g/oDQhpe3eevkQ2TnavxnHRfPgaO2IEWo0CXmCJAM
 XYVhUSgqzn/Yr+SIEYkB4hZow+h/TWIfBhJpZoTk6Ce4sYJagGIj7soeC/0ThHG13GYZrYDBvt
 quhag16N4oSRE2oPOtMt4+sKgJE57V8jZOl3AgwE2RXXk515IVHW03LR0ZH4qGTKMKcu0jLdph
 H/8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:04 -0800
IronPort-SDR: I7guEoNBGQRWZ/d909QvjPCcZkA7fWGjIeWMoXPGpQTf40Cs/8NnKZOp/EYqtGxWMc899yhByD
 8WuV0TUfh9xUAFU5J8zhTZj5e3TJnpZdVhBLuPPlHlNEOZWyXzdscDpuS0jCmGa+3L1iDcyw0z
 rvjBDQNZDmYbgYVOZTIldcnG5m+HmWezjRQx3B1/QlOBcp31Mv8LoG9JTHHpc8J+sII9Ojz0HU
 /XqZo9AxOZec/x2q0tH/9cxffv3Bne84uBqWDbV0TTmBtbMpoz/DdrjbcsyxbASwSSe1WkapLe
 7Ls=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7k535SQz1RvTr
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1672974892; x=1675566893; bh=iPvZq54
 h5QMI+Tje/BNUkLTz2nKNMr5iaHAw7EbD4NM=; b=KVadJ23V3WSwck85UjdpbZ4
 MhliFvnQjYB8zXe/H2u06wtcHJVOoXqU8HRhn4du7iupeocQYm/OK8FFeBKk+WEx
 AmFQuEsKlwlHol/DatEdWFQOZenFOI5lsv591RBojegkbuC1Bz5y4eEX5W5pFNXZ
 NSu564akTAJXcNSIK9sVC8wzs3ZVn1+HoCnG3IZovcGkQ63V2EbyjG3KkD8c/5d2
 uSSIFenwLWncyV50xl6yF/XKC+uTlcJCU7dFmJi20VpsVwfvM7Db7PKDoFUSUNew
 VY/HtlNzvC/c+EMi5WzspvoBPb9JbsQ8qzixfyOdaRl08IDPllCu3SjN5Kou6mA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CX3bgez30vVg for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:52 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7k32k26z1RvLy;
 Thu,  5 Jan 2023 19:14:51 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL v3 28/43] hw/riscv: Select MSI_NONBROKEN in SIFIVE_PLIC
Date: Fri,  6 Jan 2023 13:13:42 +1000
Message-Id: <20230106031357.777790-29-alistair.francis@opensource.wdc.com>
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
initialized to true in sifive_plic_realize().

Let SIFIVE_PLIC select MSI_NONBROKEN and drop the selection from
RISC-V machines.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20221211030829.802437-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/Kconfig  | 1 +
 hw/riscv/Kconfig | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index ecd2883ceb..1d4573e803 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -78,6 +78,7 @@ config RISCV_IMSIC
=20
 config SIFIVE_PLIC
     bool
+    select MSI_NONBROKEN
=20
 config GOLDFISH_PIC
     bool
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 79ff61c464..167dc4cca6 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -11,7 +11,6 @@ config MICROCHIP_PFSOC
     select MCHP_PFSOC_IOSCB
     select MCHP_PFSOC_MMUART
     select MCHP_PFSOC_SYSREG
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PDMA
     select SIFIVE_PLIC
@@ -37,7 +36,6 @@ config RISCV_VIRT
     imply TPM_TIS_SYSBUS
     select RISCV_NUMA
     select GOLDFISH_RTC
-    select MSI_NONBROKEN
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
     select PFLASH_CFI01
@@ -53,7 +51,6 @@ config RISCV_VIRT
=20
 config SIFIVE_E
     bool
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PLIC
@@ -64,7 +61,6 @@ config SIFIVE_E
 config SIFIVE_U
     bool
     select CADENCE
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_GPIO
     select SIFIVE_PDMA
@@ -82,6 +78,5 @@ config SPIKE
     bool
     select RISCV_NUMA
     select HTIF
-    select MSI_NONBROKEN
     select RISCV_ACLINT
     select SIFIVE_PLIC
--=20
2.39.0


