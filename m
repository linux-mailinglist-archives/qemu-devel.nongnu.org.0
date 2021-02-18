Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87F31E43C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:14:37 +0100 (CET)
Received: from localhost ([::1]:60884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYpw-0002F2-DP
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYc1-0006Zs-KH
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:13 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbz-0008KW-TU
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613612; x=1645149612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ydw6Pj9MuImavJe/k1p7sgoEroop5J0cgSgSSKjwk+Y=;
 b=V9h1R+HD7gNMMEdZm4PGrogR4Utj4Hlk/1DXmYbZ+YfXBe5DpLqAaUIu
 jb51M5yn4LWCkCn5bI7ylzcw9RPaigzRUwqG65paN9WJ9Ey5JTTWKHSY2
 37HESZR3k7dHogGSFA04oIoM8RQzH2WX2/1KIE9Pq8RYN7BQTPfB3qZqF
 bsfA11OlkRi0iH5lBtvlA9CrbgzE5Moq4A4nAG0Mk2xe/hLfuLfvgZj+C
 ufLxfl/hwUI2h3jY0tkbrukF+1AdSf9i1TjZn1z9R92rnMQXeM7ls+beK
 7anWwiCt6HkQv89PVEFm2JHtL+FkJd/+ibN9Kt0KPY4aaz8YTzE6S+/HT Q==;
IronPort-SDR: +eDfqAkjbhkMs2MNniWMP0ZXlj4cKqhq0O4s+YOkEOxcR9ku+5aZ/+IuaBTOTXPDZ2AjIE0hAw
 gB9Nxgp2cuSaLodojtqpFBgvwc5cieZjmut2baxlEFpeQ/qpzqOQ37Xi+urLlH88HPswHZupMI
 ZZgT0mPd3RT63pLfn85mOafklC7fLJxQow+EHzoPfjtNNHk6UrPX+rWTUKNxGTSuwd8+ZaqEVO
 r42GG+OKmTErR2DB634n09UYgAJ4lgmuEnJ8W9rT4fdv8/r6c3ud++K2ujLlQEv764lMumTVQW
 6FQ=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392133"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 09:59:59 +0800
IronPort-SDR: 3MWY9MB8dlVze4a4CSe9ixSQ400Q5K/FvhrkqVBM9DgTG159m0NS0U86+JFsNvG6GFG7k2k5OT
 6S6x7tLS45540nmIrRoydIScRNo+XaF/quy3CkG2+lBpcxz1L0Vq25Ps1tdtOWD5E3P8mThHxQ
 O+eG/E38JyLvwdXRjHVHR/QkVdHHQsfqezwngaee++BnI7HFVYR0Vr/wxCHmI/n7Ppbe+/bZZD
 /HsQ1dSSFuFzwwtfD3rIfaoGW2JfuKeDIzwkO/m1HDGJ0Zzodk2n27YBEukPcfXVLsh+pUwu+3
 Uo3E44pDmyzAf/rXBHdswSoK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:29 -0800
IronPort-SDR: 3U8MF3bf9x3TFghyu0eg/XSIbrV4+z9plnRsThK/wl508nHmwrIlw+QjpDdMw9NLxurTNxXzSc
 gI6p+V7cnTgFceS6UstFsH5EDgYVl4744YfJMUaDgjFaeZm9NtzK/H0alQ4Odn3CzkV5ZJPUeO
 phtA4evs4p6PP0p0v3ZnNHrXdC4Kf5Q7WzYTDXl+5dPaNHD5sE5uMtcw70MsCV9KqSk3Nu1/Zu
 y5yOrkrCpgDJKDawTA5ukxlE0EjF10q3Dn5tdbBlV8nd5VQSiczfeTT/rZ6nabVDDeY+WvQiY0
 0Ac=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 10/19] hw/riscv: sifive_u: Change SIFIVE_U_GEM_IRQ to decimal
 value
Date: Wed, 17 Feb 2021 17:59:25 -0800
Message-Id: <20210218015934.1623959-11-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

All other peripherals' IRQs are in the format of decimal value.
Change SIFIVE_U_GEM_IRQ to be consistent.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-7-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/sifive_u.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index de1464a2ce..2656b39808 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -127,7 +127,7 @@ enum {
     SIFIVE_U_PDMA_IRQ6 = 29,
     SIFIVE_U_PDMA_IRQ7 = 30,
     SIFIVE_U_QSPI0_IRQ = 51,
-    SIFIVE_U_GEM_IRQ = 0x35
+    SIFIVE_U_GEM_IRQ = 53
 };
 
 enum {
-- 
2.30.0


