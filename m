Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72817650669
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:29:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jg-0000xi-3s; Sun, 18 Dec 2022 21:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jc-0000ms-EC
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:32 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75ja-000190-Cp
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416310; x=1702952310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QikRAc9jhPx+8qjwv2aF1TI8bV2sm7YwxCfz1ApfiCc=;
 b=N9QQjxUGQ6ESDN6eaU1e0zjeBeueJqROuCbHodDDj9rdaoy0k86eeIxm
 3a6GJfdjI1XrzzOFj8OScn1qFmuxJcv1Ny7ssEWSLLF6B8maQIhXOL9Yn
 uWcGwfQBr3hhnBdODFowkLBr1+/mm9Zh+pbGwiS5h33FFAKLp2jzSI0nB
 2kGhJpnxeTAX87+6rTpiIo6+UZpay8NUczqvvCVoRYDhbJnM0c/hZ4TrS
 okHOQSoHK1n/1kl8guWlwuv2yHtzzFXoaqGt9Gu1jccuKgDZj9lstw5vv
 pZhs5xC4WWoZRu4nB+fSn3NSWfbOAFT4WJ+8irBo0W4IdMWzom7oInAVG w==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056801"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:29 +0800
IronPort-SDR: YerPDXKT+cGqwpbaIT/KMmdwAT1lbG8TGG8H4HRmZbbMvQKfPC5DHR9LoYngIeNpLceQvSkw9L
 /9S47HZnpuQsEGcVEwb4ANxO/NsqHzhvu1y5K4v6+yHNaEpOijosl28qT8UDfKN7DpxaiPWZfm
 tjRCB7OKcSCSuXXAqwcYoeL7S1GvESs3MDshcNLgvAoZcoNQ2AJnzKvwE68y4w1k7s9zUuKrVp
 /ol09WUa2H8GvJEWXcpDiV0QzJHV69AOvcYZCn8UtxWEgO2OYabxBcrvw5Z/gytWiz6LVloxls
 VuQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:46 -0800
IronPort-SDR: ndFl+cplJQd5wOljUvCqxzlHUgn0rVK04j2S22xiQJZc3bChl3rr88+KssprHbuZNT4ZtiO/D+
 G15lrP++hmQHSx5/3zjI5VpvOv3wn/aqNSiOzgkiR8DUn6GT4snsYHkWTcMIxZhSxBsmzcIRxv
 1KPyyR3o5NU0P6p9NV/lIhIhFjHWDfGw79IP/pjThG94TA+gVPicod44w61BBe2EVGZ32uvkwW
 s0bL8Z1VESmuys8U22jzlP6yOmpqci5o/U2rJ1LiYyvm1DH8pOU5Yi8hqFORNhOqb3wnxOul/F
 QXU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3KK3YKrz1RvTp
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416309; x=1674008310; bh=QikRAc9jhPx+8qjwv2
 aF1TI8bV2sm7YwxCfz1ApfiCc=; b=PAY1B7rH7suSzO3N2BAoXZcPIuaCCC2Rwe
 UUoF/sVZ6OETkl0AL5CNy4lfr/6JZGLOvigdKNt3ncF7/KTUgYxROijqa6Hmg+sX
 wk9JfH3wK5q3asN3w23eeDf8J2GFBH9RIYfHZpsqvdDxt61iQrx7rqzrhepxjnUo
 Ir/RIIO4lPM4qN6aGgQ20QH1MgDbcJXV1EzA+IVKTsV3YUeZUzdIlq0chxTcFLDj
 JwqiQo40JCesVkY8+ufOJmkiHArlkeTUZ0Z/rLblgwro4lddCLnMxtnLpoe6YlbS
 zX00ECBwQI3j0LC+jdWNB/OnrsUjuTYTBzBpkOaFu4Tfz8wJKgWQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FfvkEGl3uANX for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:29 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3KG5nyCz1RvLy;
 Sun, 18 Dec 2022 18:18:26 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 32/45] hw/riscv: Fix opentitan dependency to SIFIVE_PLIC
Date: Mon, 19 Dec 2022 12:16:50 +1000
Message-Id: <20221219021703.20473-33-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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

Since commit ef6310064820 ("hw/riscv: opentitan: Update to the latest bui=
ld")
the IBEX PLIC model was replaced with the SiFive PLIC model in the
'opentitan' machine but we forgot the add the dependency there.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-3-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 167dc4cca6..1e4b58024f 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -19,6 +19,7 @@ config MICROCHIP_PFSOC
 config OPENTITAN
     bool
     select IBEX
+    select SIFIVE_PLIC
     select UNIMP
=20
 config SHAKTI_C
--=20
2.38.1


