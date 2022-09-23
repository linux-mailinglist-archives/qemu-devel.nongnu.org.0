Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100855E72BB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:14:38 +0200 (CEST)
Received: from localhost ([::1]:47370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba5F-0004mM-5q
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyK-0001ao-NL
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:30 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyE-0005cr-2s
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906042; x=1695442042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpWNsywmIiVnPWbPCFwnpmmYH4mspYVpr/PGb/mfhdE=;
 b=UjXGcbpFcXkaf6yAPVgx0Yi/MgsiYYHyxUN7OCic/8j9vRrE1tyUlyfp
 OMb2rdlsyABFsAdhnZAqsNEj9Gt7OOLIEyixoIidQNucgho+voogCd/pc
 cunr3dXgid8g6GBBk2eaDCULhlAd3lpk0lMSCsbdAFfZpMx+HlmFef3gg
 GleRoHIg55K3AY9jKpwJE8HpxMSd/xU3qUifJnjRHXDsmTu6XISoZurpB
 MXsA7Lmmnud6U81VN6zRx9I/3H29hhd9JnIfGBeHDITmLCqvmvAj+xg35
 GikEGh444JhWVDl+vorImaX70bVeate3fEVuBzNzvRovX2fxUN+nIVFsZ Q==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510438"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:18 +0800
IronPort-SDR: zxbYZKLkL4M4Gyg/218hyqfS5k4k44KQMHT1PXXnjLPYiAdco6BIKH5QqbBFGIj1l++MGFAjN3
 4DTGKjhW8WHkQG5bCtd1FpuH4KW4rR5xZWylSTuaMLg6rfD6jIdn/bqePj0iE7pPjk2Hpuhw8n
 j9xCK/s5c5BAWndFKL5oJkDUAJIivvT82BgESdSxF3pM7UvbEv1tWqdzo0tXMSzVFKqC9YSq9s
 joQt09Q1C6rpZr4qXMf6oHOKQD6jicOqK50Pdx8S/tarqoI/nt+ILLeV1IJFGLANocDbi5GH9J
 HkkL90jiSGneTTQYOFU5I3uf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:20 -0700
IronPort-SDR: TH0PA2ZO/7nJDmy6hHiD213BWdlxUQaUZdPBYn7WhFkQNRmLQjPU2MpLWshlFxp2SHvaxcLIBL
 8gimtzFSSnSI5nVCE47+DRZzPHoxj6hg8MhEUEBPi4W0l7mFoqA9/bcE5WoJOSdkWz6yGHy1NS
 MGXXWFveIxWRYiNk8/MBgbKqNGiFaq7IEwbkaPDgcKxCvf69NRIgBAZrtQUgSq4MaPZMRyQeP6
 qn9dl1N54ernvPaAWABgygG8hKo9BU+Ze4mlTVRf2hAjv6L0cfNp0riZ0trpZ7O5Mm9p4wD0sE
 g0E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYds201xJz1Rwrq
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1663906037; x=1666498038; bh=GpWNsywmIiVnPWbPCF
 wnpmmYH4mspYVpr/PGb/mfhdE=; b=gP45jlKC6d4bK628BG8UToidRSboMy5jBQ
 2Mm4brDvnD7vFAVqsIIgngmmwKIoBAB56WZhMdX2c+OlTOmWqVvnIwH5TFhBfUCr
 KbO14o4Kd7i8QY4P6o6n1WS1N4gqcFGIuc3ZYpSIGv6ugpE7FW57yhIjo5iIRoRB
 YEyca/qBhYOZo6+1UzcBGxiNkea7UNkFPlFWQBzJq3cldzXGqy9DlbmypjoJ7pqZ
 ZQwySzcxEdfE6ooIjAXAN59WafGfNleJnCySVylbeBraTT2reWjpUn54yFPIpug0
 9FtjePSlvPzhGf5QkWrXES4L1oeE8bU1hFyD4VUjqCoh8cL3kktQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DMJEwsmyTKVs for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdrz4QD7z1RvLy;
 Thu, 22 Sep 2022 21:07:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 02/12] hw/ssi: ibex_spi: update reg addr
Date: Fri, 23 Sep 2022 14:06:54 +1000
Message-Id: <20220923040704.428285-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Updates the `EVENT_ENABLE` register to offset `0x34` as per
OpenTitan spec [1].

[1] https://docs.opentitan.org/hw/ip/spi_host/doc/#Reg_event_enable

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220823061201.132342-5-wilfred.mallawa@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/ssi/ibex_spi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 601041d719..94d7da9cc2 100644
--- a/hw/ssi/ibex_spi_host.c
+++ b/hw/ssi/ibex_spi_host.c
@@ -93,7 +93,7 @@ REG32(ERROR_STATUS, 0x30)
     FIELD(ERROR_STATUS, CMDINVAL, 3, 1)
     FIELD(ERROR_STATUS, CSIDINVAL, 4, 1)
     FIELD(ERROR_STATUS, ACCESSINVAL, 5, 1)
-REG32(EVENT_ENABLE, 0x30)
+REG32(EVENT_ENABLE, 0x34)
     FIELD(EVENT_ENABLE, RXFULL, 0, 1)
     FIELD(EVENT_ENABLE, TXEMPTY, 1, 1)
     FIELD(EVENT_ENABLE, RXWM, 2, 1)
--=20
2.37.3


