Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E705059D149
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:32:02 +0200 (CEST)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNSD-0001L9-VS
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9p-0008HQ-7k
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:13:01 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:25193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9n-0000l6-55
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661235177; x=1692771177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pKcENyi+KrJBbejZ9NVBAhqC+/2XPVYWc3tv7k6K+3A=;
 b=DsxsAv+3LkGB6Wow0S/iA3EP1YlWpn3WcJCZjVUpWolae2S8/7nBjDca
 WPhwKLZwDeItZN6lFN4QYmbZEcvx6RfuxhoBByjdEpIs5feurA6Co2RKG
 GI5MnoFK9pVU9MBCSOFnyinxcgpFWrNi1DO5h52fjIOZtDcUszhKR0GEB
 5FV62EMDZ2V/l6futtQkoqOArMnCo1wMDBGrgBhm/ZXGQ1NA8UV81Hc/5
 4yOaGR8jn0V/ZW3u+U+1EZ8MLYIdS9tgN609tfskBlyTd0yLxAvX7/if9
 alOCvkuL2wtfD+nBEoaHjVwxj9eOO5M3Kz5+DMddhGluFs2bsQj0CRwQY Q==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654531200"; d="scan'208";a="209393018"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2022 14:12:56 +0800
IronPort-SDR: 16FLQRxsGwyKDsNH8vEdCiS4gBv+hI+niDUmwZIFoWqBo3nKq3fQjK48+F5ie0WR5ej1u2DE4n
 lC8Jv6fjGeiUeacUVBaNcXOahfH90L/lr5apn41OkLdHOylCT/PlEINzxL64zppmUp5sKctDNp
 qCxlXhvRCYAwb3zHdLfqF4oczAJioEhQqhDXEQmmGZ/ekrQZFN8WD75jYmI1h3/RpwYNwk9Aty
 HyCeC/LDP0DxhyzRhY2uGI2Lg0JbdnKdqR9tQaVjWYDbla8zifrhLvVtD3VCT+OhfXP+H0Rw8B
 jYXaQVj5Uo1rRJ/uAVwQasYw
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 22:28:16 -0700
IronPort-SDR: gcxr2jss61xNPLDLsD1egfvy73J8wcSHP1EWrsHUJOD2tkslrBbRtjHGubbHZpi7fRhU6u0IZk
 7EAnWnMi6t2LVMQ5WVtX5Fi9s79GVoiI2Wt31ni4KJT2wyhoBK8/BMn+LxkMePZ5yDxBiYO2C2
 2eVtBjkelWcMB99cLpwLl1WFrIbWyksvtDf4XavSdGuLDgpteyrNC4TuJUyML8FW2rsxBwqOPt
 OzHATWTRQjFzcBfLJe7h0M+Btkkjrfb1Z4jYq+bN1H9+ynioGmnBaQV+n2RysvmCzvxJPJhjyN
 abI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 23:12:58 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MBf6L1D8Jz1Rwnl
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:12:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661235177; x=1663827178; bh=pKcENyi+KrJBbejZ9N
 VBAhqC+/2XPVYWc3tv7k6K+3A=; b=rLs2zzoxjxkjAC+8893rCg9un0JdCNaeAx
 sR464uerRsnDaRxZbqF+80P/ZJBWU4m94IBijB6RlZxxQh9NUIqNN98K90cKvvtJ
 AR4mcYdvN6AM/gqCmGn+q+vx7e46w7MB9P4KZ10e6tiffyTXQdhGKVCAtEXSEcdt
 Q4/mBFCCPzlifdiFFRoqGLdcOVKyceBNM5VDGYEu1KZLJ6R2moIuSqnPfcgA0fdJ
 e54eASS4oDs5oUDVlv5c8zUoOHvfBJOexsaMhY6N/DNzwGC8Lapc+WpzfLCWUnT7
 Kri3yO8eOphhpKySuSdoIii0b0BEMEz6giWfzQIoUAbI9oyV4j4Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id q-bewjKMSstS for <qemu-devel@nongnu.org>;
 Mon, 22 Aug 2022 23:12:57 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MBf6G6Sbmz1RtVk;
 Mon, 22 Aug 2022 23:12:54 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 4/4] hw/ssi: ibex_spi: update reg addr
Date: Tue, 23 Aug 2022 16:12:04 +1000
Message-Id: <20220823061201.132342-5-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
References: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2270691b0=wilfred.mallawa@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
---
 hw/ssi/ibex_spi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 40d401ad47..0becad34e0 100644
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
2.37.2


