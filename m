Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045859D11D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 08:17:27 +0200 (CEST)
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQNE6-00035B-6q
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 02:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9N-0007oZ-ER
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:12:34 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:20223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2270691b0=wilfred.mallawa@opensource.wdc.com>)
 id 1oQN9J-0000gh-NY
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 02:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1661235149; x=1692771149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mYalqw0j3WMi5ZUrlGCkQL8FhyTQmY05Blnj0TnoUUk=;
 b=PVestPNbZA296t0J5GWSkt8S7UNwG5DCRz5ShFlY/pcQq0zS0ieIaLKW
 Tm9n36qtqNt7x9m7AxeFr34lTabsZkKjvL8xoh9XAUzIW6PyI7LXr/Rcx
 rBoNXK2BLvpVyifXuDI2KvnS1I0HyIzhVGSm1yGn8AQZf+etzgI5QAcLj
 utoBkE9FWK5pr7ajJxzzPBLo4HFk7VzT32eZXoY7a53FXG+Y5z9RtwX+Q
 0RQpn7mK1D6CQ+qKdSJ6NjtuO1c83THotuLdaQIhLTH8NtmDz+VbqGdYO
 jI8nBMog8AFT0Fhn0C9YLqQkJZ9nWc17x027J6d9bPWmgJkdUFtUd897I w==;
X-IronPort-AV: E=Sophos;i="5.93,256,1654531200"; d="scan'208";a="321495659"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Aug 2022 14:12:23 +0800
IronPort-SDR: YuGzdX1PkU2h6mQguXQq5N90yHItb/7ALnWy2SYZ62oz3e+hfQpYegJ1omm4H7Wc3Pwmyi4PP7
 yCowrtmFLvEgtRoDyTWY18hi/qoVfnkRlt+0ea4oedbnsP8e+vNoandB+mgHh68Jg4KxJYnAsR
 rMDfWkUia0G7H6iqI/vxzYKyXbV9AIR8XBTSS3V50SNVZ6HR31y33pIKI1XYM9lS9fnRxxVpqh
 xB5HX35UlDVAQPJsHmSTy48dE1i+SEkDh6Mm8MRMKx8lsMgyEgPKz9Ff6m7QeugPyeRPieEepo
 KUCxb4TdqGK+Jtt6mQfu4eo3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 22:33:03 -0700
IronPort-SDR: UbwDdcnnMhTttyLvUhcAHOkoJlqK14bwDZm7RLYYSPos0Ad1COixy7Ut5Z8AdKNTpyPyVe/D80
 HB8Gqz9hQXgtL6xRA7wVg4SHadzkJBlOxJaSflOSfADdbenmy5GXe2XRSRPdgeYCfOOXfanZSR
 zaF/A9JqcbQeFS7qkEU/tL0iEceLlzGIjAUyIS3ZpxE1uQ7QqTeNJMKflKEO+Cbb1GHuZItL0y
 60LQ3kocCIlkku3cYr4UsqUVIyUWxqedG4UY6WHp3S4X4E4qyC0SsB+u3RLW0VHhNScV0637e7
 4eI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2022 23:12:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MBf5g4pbzz1Rw4L
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 23:12:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1661235143;
 x=1663827144; bh=mYalqw0j3WMi5ZUrlGCkQL8FhyTQmY05Blnj0TnoUUk=; b=
 V77SfRIEtjmYZuedo7L/2Gw+hayjPG1mjsnuSKwZ5Imq6S1c3cKB/kWrz91BE/Rd
 EjMmuG/pQY1AuXjfoHXBAz2kwlJoctLG7JbCGQlH1XHNKjJYTaVcyJdoP/TF2koc
 PKEJHXsw46aApMvHTRjQeQnkJNJmsRpBa5PL3QI5807ZozGBL9IfSmUsklpq2t5t
 JFwlB4IWth/rBVYkeB+v48zT+eYg4blyaTvxZ3zwyBwrUINhWHwi2+T614yOC2UN
 bGnU+UaWJaRz/FK9JjKddBV+E949wSX5+ao4q21H7U3OjMs/F7mB+dbuIXrGyiiu
 /E1xvPkHE6T0dFMOkNeSgQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Czy4onhxgK1D for <qemu-devel@nongnu.org>;
 Mon, 22 Aug 2022 23:12:23 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MBf5d09hNz1RtVk;
 Mon, 22 Aug 2022 23:12:20 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v4 0/4] hw/ssi: ibex_spi: cleanup and fixup bugs
Date: Tue, 23 Aug 2022 16:11:58 +1000
Message-Id: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=2270691b0=wilfred.mallawa@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

Patch V4 fixes up:
    - Fixup missing register field clearing on tx/rx_fifo_reset() in [2/4=
]

Testing:
    - Tested with Opentitan unit tests for TockOS...[OK]

Wilfred Mallawa (4):
  hw/ssi: ibex_spi: fixup typos in ibex_spi_host
  hw/ssi: ibex_spi: fixup coverity issue
  hw/ssi: ibex_spi: fixup/add rw1c functionality
  hw/ssi: ibex_spi: update reg addr

 hw/ssi/ibex_spi_host.c         | 174 ++++++++++++++++++++-------------
 include/hw/ssi/ibex_spi_host.h |   4 +-
 2 files changed, 106 insertions(+), 72 deletions(-)

--=20
2.37.2


