Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB0359280E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 05:21:29 +0200 (CEST)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNQfQ-0002mm-CP
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 23:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQcF-0004ai-Nq
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 23:18:12 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:63401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQcB-0007Sq-P0
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 23:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660533487; x=1692069487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MdQobky66vKbHGU/y2zi8zZA1scl005jHEY18jAZWQg=;
 b=Ep2Vof+9jru6b+WPBpyRMRbgQzJTtOoH/IByDIE9Eb9etQWN2/l/dRoh
 q+N9sw7TIxCu6ApLAMR7E/mEDkCOn7+lIrWcvAJINGgP5uBPB7dqmCQ74
 8aLDzfUIqGK+/8q3wcnT9wC5kBRKpqbVaZFp9VI2VRabaSptAhPHZSnpN
 LjofdVQnP916GfbA+GLav6PtUZv9NKWBGTDQWoURDBpK18CkMoFfcMNoT
 IcuGlq8XUxPD+Bz7Rkj8ObqiWXKIocbhFqZHjoKcTYDU2v+slHtqZRhzs
 Q0/q0xrAyDG2i5bs0YWE7KEvXTdf/25G8FHqarQ77JNZraOesQjIICx1F g==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654531200"; d="scan'208";a="312972253"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2022 11:17:54 +0800
IronPort-SDR: nUJZMSFXiT4rMABMAB7Z25P/buLh2kiVOKXejMPbAGuLIYrNLsO0ogRscyQsFD5qoPnZigoic7
 Fg9GNj4L1GamIxRhwa/iv0bvb8bhxVoP1BZcvvt7Ic2Ap5mrYc9nQNsuLAe5fMpr2eq+3Lk7AC
 y16Ak6S95s5kaN6ODy2OyP3irAPA7LOqcaV7h1Zf4/MVpV9VhGFBPPZaVA/TtbJynPdvDgjiKO
 DtoyxX3JmFSOWSsCOrvAs58zO/2D9oS98FZ9ZTvcAcO6CHurAnV/nwzCSN4DP1ZusEuPwr5Wlv
 r9UIkSAEBnwyuCQBmI6B044/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 19:38:43 -0700
IronPort-SDR: uXWwA489jyYRogxEyVtAorgAX9qy1MrwW4TUinBujmk0pV8spjEUIduAJWKQU3NEm6GBJ+eVAT
 jPmAljFSOehNu7YVMmrwS9phTYMUId92f0kH19IkANAnfPzviFEPDBH8OeTi7gq6/yGEyMilC3
 56leFzyKnPFcCO+tJPeHlRnaDDyG3qmPqZ3WbJv9gA+xm39ZF8ofYue5C/PzJus597PvlCkXRI
 RBacbHoIcmFjKCn8wW1ltVQrgmYj2PJwpQXeZ3N+7pDJqo1weXVDFFDPIZUubOm0/d7vLZ7R/L
 Aus=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 20:17:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M5fc16xJ7z1Rwnm
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 20:17:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1660533473; x=1663125474; bh=MdQobky66vKbHGU/y2
 zi8zZA1scl005jHEY18jAZWQg=; b=saNCRPPmJf+X9QKgQUB35vObqRxbzAqT/r
 B1HaWcDHnwAG02MZ39FHlGB+bx7lsgJe5xTPEP88oip9iO4eHRt/zrMjuRQIf8TF
 S3FoQZmrmtDH95jR/KHQM95ja1YOt+WdkxpxebgmdE+Nj/eJMg70nhzeS2n8nxbP
 2I4RdviqgjO0Rqe3oTxk7+tkbVIGpYT1VcDvFGmZpxc/x/oqmSABEKlaSOelEI2k
 CIlt2XC+BaqerZCP9CMn5RZex5z3ybWFH1HCVgBQ7u+kN9nW8kcY/8h7LrBqiW76
 4MpuFsmsWCvCt5kFvqMQ+POeaUd5liAKU82ErD2RlY1yu/QCcKDQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id P1WAE2Ol4IKu for <qemu-devel@nongnu.org>;
 Sun, 14 Aug 2022 20:17:53 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M5fbz2sXZz1RtVk;
 Sun, 14 Aug 2022 20:17:51 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v2 4/4] hw/ssi: ibex_spi: update reg addr
Date: Mon, 15 Aug 2022 13:16:25 +1000
Message-Id: <20220815031624.170857-5-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
References: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=219596703=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
---
 hw/ssi/ibex_spi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/ibex_spi_host.c b/hw/ssi/ibex_spi_host.c
index 19dd094d76..3b8dcbce05 100644
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
2.37.1


