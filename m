Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DE659B6DA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:52:49 +0200 (CEST)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPukL-0004lv-1p
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPub6-0001eM-T4
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:43:16 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:43028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=225a36311=wilfred.mallawa@opensource.wdc.com>)
 id 1oPub5-0003CL-2d
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661125395; x=1692661395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NkXq9BEmisYvxPBBnnF+3nWPoQ4uRWizUP6v4tzOoqo=;
 b=F8arwkJyiPS3Dq4K97wWCzH1FzH0fZnuimIhT9EhX149aseBGwcf593P
 PsYS3sJvwTJCSj1FTRpMF0fSSO7uxiAOBDhOhBfq21kNtOdK5hc5W5qog
 bJ7I0Njjmr5Rd8qQkXK6KxP66HDOsm/smgB3ptlqGw/GDXF0fw00ZPwss
 qHzy2U+FUqKPEthpdwRVsSPk7TeLKE/lZ6Mws66zri/lkbvqQzbXjVEDD
 jQEiNCh636DVT/5RxRXVGeuiV512cK+xyyZcpnhldzagLxbyLof866u2z
 XIfGXopcwlxyrr8E8Ae0yuM+uLGK220Uwfj8U2vrKO0pLZq6Mok9iuTah Q==;
X-IronPort-AV: E=Sophos;i="5.93,253,1654531200"; d="scan'208";a="209788379"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Aug 2022 07:43:08 +0800
IronPort-SDR: SOpHG2nqlYkzgrzAdVNaOM3s5IV5Q6cUFGm9x/18aNMwzWksdqjhQqr8O06NLA7XZxO6iQuyUS
 23oCMH7CU4MHs2+sYoyIPZz62GJgHlLrfOrrHRjNAXmBcQJxPOyEzZ55QIofgyoK/eK/btExhM
 u56pMJfOCfyxbxQFjz4lumTnBXr1coEMs2kPZW66ouLAb03D9RLFTAlrBvg+JWasOgKlcC0L0k
 GZu3hOWX9M7PMAeR/jOoXU1frpdbKy+469p/ws5ZTAr7wMmYV5io0XO20NJPRnDEvHI9aqhGxW
 i2Bn5NA1pYECgftjVF4UvHvS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 15:58:30 -0700
IronPort-SDR: L3qNgtUWIORMGdfczgmUhLDPAOUf+ZKFE/XfqhU394TFeOgY4vzYVj+6vplp3htVoxyBHDP/Go
 B+RQmEsLALzqmBf3q6vCCn+qfwlWb84N8Oohx9FDkRvuX2M0U7bGa/tDazqdXSkSn9OTd9/4/5
 Fl/Tmilv2BO+No1Yd8UQfHYSbIiZtb4ViX7czbnjeOwb8ASKcYEwCnTMUV8DUlihPYQKsZ9BUx
 pkcwhdDJeKbaPSihOsVKCBXAafg+tKFprQiw2i9j71dL8WM+jMSJ6DmpkRt62ropUXgPf28yEy
 J8I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Aug 2022 16:43:08 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M9sVz6q9qz1Rwnm
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:43:07 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1661125387; x=1663717388; bh=NkXq9BEmisYvxPBBnn
 F+3nWPoQ4uRWizUP6v4tzOoqo=; b=FfF95BDFbFITx1aVl5x8mJUYtNy/j7oyJm
 5EpKFFrTUWCeAZSHkem5PpKV/Jewa8QfSjidB18e2N21/SYdlKRNFLIXFCI4/Wna
 TIyVSUN3cHG1hj8gNRWpDCE3H27SV9DeDTWOl9LGLi2y3ucuoUCvmI5RBT2XSnw6
 ypKfs8zS+hiNDVoEuUtCJmKOcsBNBo/6AKkzezdIU9VczVSE8/f2zYr/aBZfGiux
 udRSdfefimCX7Y9N0QPHLBU1lsAaCrt+hiFKQHDg0Hgo77nDRS8k24Q9fIvnLCjK
 tM7jBuqb/FrkektE95cTVPDAH0HC9uJxg9fQ/vprEWSCh8gs1OUA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CRUE9yEF9-me for <qemu-devel@nongnu.org>;
 Sun, 21 Aug 2022 16:43:07 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M9sVw1qqwz1RtVk;
 Sun, 21 Aug 2022 16:43:03 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 4/4] hw/ssi: ibex_spi: update reg addr
Date: Mon, 22 Aug 2022 09:42:01 +1000
Message-Id: <20220821234200.34052-5-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
References: <20220821234200.34052-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=225a36311=wilfred.mallawa@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 3809febb0c..bafff8ca1f 100644
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


