Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDCB65FA2E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:28:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdDY-0002dO-Sf; Thu, 05 Jan 2023 22:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdD3-0002Xv-IX
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:58 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdD1-00088M-Tc
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974955; x=1704510955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2WapDntgNDpK01ShbfxBnMGV744j4DCw2MfWtVlQAks=;
 b=R6sBpLn9Ebd85ddY2c2muNVbb4U9/fZEQnE7Y0RkqZCy1MeMTyJAuieW
 H/lDUJ44+jL6tw7LObZ1PtzhG5tFIwfQL+n+VJLN6ZvgEx2olECQQXYuf
 qqnRGg+9hTWyiXb9i2ID7XhEHtWOzrtL7ZhYM92YdI3ncl6Wi8b0fccJP
 6jwacBcOmEf9cFSe7RWWUeerPxrqbT8sTeD+SaO8OSDRdCueoNw/vqCEg
 phGIXSa2tR1Q/PbnbKtIh0aXh4tovPy2nf+uXVTuRw6A1lRCsjK+FeSng
 71LsY/I1rz9Wv/LEQOogHFKrntCd5caN/WFGY5nLbJiTZayQVyX1nIowU g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254822"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:59 +0800
IronPort-SDR: 9dS1PpeQR54zH/U/uZB0lYwZxdB/7C4qvwe0gWgk6LTCxizQdVqScmWmnvt5IlnenDkSy2+4BS
 E9j6k0X5FD0rgV0qDENRR7lmw2ELlLkLdbKfndKUtVy9ivqleeGNlgBQUcZx66V+y+cQ7r/Vqe
 T3d8vudUmqucVeuO1bX8FeNKsdEh+RfspwDHSrDhKyP5I0yTTXQRUxrguTEWSEeeimPVObhXue
 2AwOfp37n2pjpvAca/M+f+9WqTLGP4n2omuGuw+Hh37do6PGqjhBYAnZdQ/dChWbxcIGwV3/On
 bt8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:10 -0800
IronPort-SDR: ZHxmd1meW/Z9hCN8ZC7sodKUPOSmHP05j+m23nJzEgvcZ0OuYjHesDw5sxeMDRXk/ZHvo1veG3
 K/OEnuHigpwm/MzbuRegKpuyfHgJGnWMo6d0xGAeDgXFfUaw6a5OJyR+1qqSmFYIZbqSebO/aP
 W1l+yeyCzntjUrW+m8wayJ3CDVCmc4oSivRDcYohM7Uh0O9kxkPRHEXpd7NeluXLKhfPh/Q0T3
 RDukk8IudpsTroU8N+NM6hQfp+4Gtu3mKm4UCThNfn5vNk9k8DrYs7/yheahD0WcEPP6WbUdsH
 3Ys=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kC1vBPz1Rwt8
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1672974898; x=1675566899; bh=2WapDnt
 gNDpK01ShbfxBnMGV744j4DCw2MfWtVlQAks=; b=tgWFTb8M85K8aRzf4XmOdax
 9as4kZiDhcqkocFKjmYqjmRLtB315PmLxkK4JSLiPx8V223bTs8OD0OR9hGbsFgB
 xif7ozRU6x9HmxrsLjevOGXhkXdJW3UNUU/yuR+hqQM5B/UDp7HeOaExPzgqyzMQ
 g67q7z11bzFB7wid4GfwmPU0B25tdmeTo50g9/Lux648CrfqCqSxBn2/oTDJKKsb
 nkntaI7FcwF0+qFDjadpNoquFo3abjPGKe8j5JR1xRPEg5R0L72Eo6TdPagMZIVV
 bW2sRyo1/k3jsgLm21ZbBSx2VllX5Vz81rW9c+X7QNQryX8aYRaXdCwkCZ39TJg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id P2R8hmUlfhbD for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:58 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7k86nrqz1Rwrq;
 Thu,  5 Jan 2023 19:14:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL v3 31/43] hw/riscv: Sort machines Kconfig options in
 alphabetical order
Date: Fri,  6 Jan 2023 13:13:45 +1000
Message-Id: <20230106031357.777790-32-alistair.francis@opensource.wdc.com>
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

SHAKTI_C machine Kconfig option was inserted in disorder. Fix it.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20221211030829.802437-4-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 1e4b58024f..4550b3b938 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -4,6 +4,8 @@ config RISCV_NUMA
 config IBEX
     bool
=20
+# RISC-V machines in alphabetical order
+
 config MICROCHIP_PFSOC
     bool
     select CADENCE_SDHCI
@@ -22,13 +24,6 @@ config OPENTITAN
     select SIFIVE_PLIC
     select UNIMP
=20
-config SHAKTI_C
-    bool
-    select UNIMP
-    select SHAKTI_UART
-    select RISCV_ACLINT
-    select SIFIVE_PLIC
-
 config RISCV_VIRT
     bool
     imply PCI_DEVICES
@@ -50,6 +45,13 @@ config RISCV_VIRT
     select FW_CFG_DMA
     select PLATFORM_BUS
=20
+config SHAKTI_C
+    bool
+    select RISCV_ACLINT
+    select SHAKTI_UART
+    select SIFIVE_PLIC
+    select UNIMP
+
 config SIFIVE_E
     bool
     select RISCV_ACLINT
--=20
2.39.0


