Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2525EBAEC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:47:00 +0200 (CEST)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4Mt-0001Lt-4D
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47j-0004zu-DS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47f-0001F1-R3
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260275; x=1695796275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GpWNsywmIiVnPWbPCFwnpmmYH4mspYVpr/PGb/mfhdE=;
 b=bu2Qj3g2G/+doJwhVnB4HBaJI8RswiUuvmYmgmq9rRkVCrGY8lA4B1ty
 mB+hclpAmtL4Buz6jvc/dNKngzw0+dYZVQy5RcwxPDNy+ulCkAG/uxbIT
 lHvRf+I5lQPXP0AExisl7igB9inVSW+oedrdpOu6Aot1X582eFN9Q9d1q
 ignSzxUmPnUlhcXrpgqe4YZU4GAKfVW4YbHjKY51X0Oa7nqNivOyIolDy
 7FUpbYC/Kj0s9kjcHYceH2psC/pkAK4MrtLswFoVqilkICsIod8OJXlRV
 v69YbOJ68YGJE+B7SfLCSdQOjrEn8mtLpzhRQW178ZZlkovVfEiwfG5PU g==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530804"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:12 +0800
IronPort-SDR: d4K7jFtQ2+7DjFPuvrE5dxzMrbT93PT08iZBrKEATpxxl3fFPHQ7qTNKAPqC/CQ7VtkEXJS/EV
 MJDtkvhooY/E7FcdJ3FQ/Lza/PMvCFSgom4HP833jp/B5kZJfUCzBhQqCh1H+GWalLrTL0gLNb
 W1e5QsH9YTy5wR0Y/+2rXm4UerAfUsA1/qBAf5gN3FefNp6j4vhETSBXwCQkQ4ysnzkB/nztma
 c744fH52scd6HcScNnzSJfsC1v8Hnt2i+mC9AO2aeNXWSiOp/0HybAh/Idtymz6VU+gcOyC6KY
 n8goSqi8WCvMN7Aly+HPVjLk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:09 -0700
IronPort-SDR: FMN1ksKI+C/rF/BbT1fIPvMMu9OY+9Cv5nMeuqhbe3khDeyKBoAJMZrOuqfCwOvAv9IIgJ1tc2
 wkzMlWima0ndRtJcc2LwFG2CKHQq4yXVYdhWLLbWxc5IrmBT+sX0RVCa+2TBdvnjp3PXF8S7Fa
 Yz6rT6MYfD2iWOWMDR7Td9UHlZmMhziBF/p+H/DOvornB3UrtrZMB4XaP01k2NBBE+CtKMyfin
 vGs8W613QK03n9g/ixeWRvK5yP2TUhhyWCDPCJufNY7r7l51i+REX+ls3II80Fag4yGQep86Iq
 HH0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sD4mnLz1RvTp
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260272; x=1666852273; bh=GpWNsywmIiVnPWbPCF
 wnpmmYH4mspYVpr/PGb/mfhdE=; b=MSi7xVf/OvgIJJNasZD18gHl3evyPtsQC7
 OkqZCxPWYG6PQ6ZFli4dRHgH0COOJ6bg+xjr1uDHp5aquj0i7RBbka03zZyrtOVR
 6BE8F1ysjdMiP+qC3w0Twf+dKvaojHBwJduFJFFlRqgpiOiaaxN1h2XoRkYek1oE
 iufYBKNCXCap/VxQ+dcLcRgP7BjVA5k9Ldxrg7fAqglAbC8YKOcwm5PTdQlgUTwR
 n+RK6DuZu7nGqspQhTZVLTNck+gtVdWwlCjyRam7TMPZ4JV3gVvXyVBRWQb17UOM
 yL0uvl8I/LVIyp/iV5gHUqH8YsCblBwgl/98xwkd/AK89bCaPgkg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bMM8hIDhf3PD for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sB6VF4z1Rwrq;
 Mon, 26 Sep 2022 23:31:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 02/22] hw/ssi: ibex_spi: update reg addr
Date: Tue, 27 Sep 2022 16:30:44 +1000
Message-Id: <20220927063104.2846825-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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


