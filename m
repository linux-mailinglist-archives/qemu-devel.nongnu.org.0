Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A260C2B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 06:38:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onBdu-00085I-Vc; Tue, 25 Oct 2022 00:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1onBds-00084t-66
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:34:20 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com>)
 id 1onBdp-0000gc-Hb
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 00:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666672457; x=1698208457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JRQyyYjmjxj8qhCTr74r1M15DhiJSKiwH38cniHS6o8=;
 b=gEWqVkoqz0e4Eq5i8Wo4jUy6oVYN7+WnFzV8jP2E1gvrUkqdUmX7gEE1
 OKU7FzSRhVYObnx7fcZaXmeNE4xbteOA18lREm4UOwJ7afTicKVcB7fZD
 vsuIm2lTi4SYgEtWqpgomMzE92cFJ2dDIR4muXw3tzyMinN+EbvnQl2UZ
 mhiQD1SzHWYE3usxBZnI9rdJBVZQLkYAoAaM/KwvXkh7HnysQSOvML7Wi
 cAvZ9zWbovOwG13w3IeWklwhuOPp39QHPU5/ae9uWpLsfxZu1OLF/QLik
 w1QnVa8fYpNQXx2byoY62cWXL8s2uO4oyF8JE1EfoL+2cZuLC5e7ha4Jn g==;
X-IronPort-AV: E=Sophos;i="5.95,211,1661788800"; d="scan'208";a="318978926"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 Oct 2022 12:34:11 +0800
IronPort-SDR: PUCIxUhJWvPZSLx3vMvxM9CZckgZzM1WgCRfYJ7sBtKHXndoZAsYcZ9MMutK4jUGyUFI2t3RkJ
 nd5S1pd3uR+9qIHBA3vYqx1OwMwjeDF5F9WTGi88sBCYyvx8J71VCty9n/SOzAG7Co4gVBMqtv
 2y8nlruEMVggJht0/ZbxdgX2rBfZuWpD6ret9vFzfVAVKCxbIl07EQYFQzV3O7HTNjss7Ljn2S
 4Gzu9YLvYfOLStloRFDsehzua+orBeQB0j5IOmqrCLYO4lMs6PYG2daOkZawul96VG8zM2uts9
 w6twrP15wWzAOs7odfBhuVQe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 20:53:35 -0700
IronPort-SDR: U6dsaW3XIF1oVB36H8U2ZrWP4zcLdll3uLXHL8fso0MUyrHE5ykZhUGezb84YhqpnSv+IKsky+
 5crZvgkbjqTb/G1dmAdX9yJotTXIIiB2uI5MyKJQH/qMHu+/x86BYtfweOR9+Cq5Dfhndb8M84
 8gmE8OvnWCUzPrLzxB95aNrLKCOittWjJjzrlgXX9Hplai0fPFuRJDS9emVNJry10YeZc+xFhJ
 h+Gp+f7Of+aywXfhh3VoIxv9L4lMiSuE4lYZx2TP3eV6Ofp83iU/NKAt+FiT50BkOOqVDe83T/
 +V8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 21:34:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MxJxG6qgXz1RvTr
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 21:34:10 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1666672450;
 x=1669264451; bh=JRQyyYjmjxj8qhCTr74r1M15DhiJSKiwH38cniHS6o8=; b=
 c2X7Z3t0Zm6soDtl2QMl4ZHT44lmO9xxawMo+dudxRX7rYTmIDQN0lJjsTqvmTQW
 LCJ8A14XQTZxFlnhregn+ULMJ16/q16lSGBjk5JS3pWRum6FG8aeyXgw8YSUjuie
 POXRYwTdxgEcSwgmkGgi5WXJPkDmPbRjkiMiJhyMBL4xY4Lb2Q/83h1K+SD4TRMW
 qU05F2raknFDQGUow+Lk1Hga4kEWD86fLxIwGmfX6T+nljKTzIeWWzhrTamD0oVh
 jbRrxeumv8A62tKv8IyzVEXCYHgv5cKn5ZWkX0uVV3OErw1aThOAkHfVAH1FfVC1
 UygyXjiipTNoTpPGN74xRw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Pi5x6dtltQIV for <qemu-devel@nongnu.org>;
 Mon, 24 Oct 2022 21:34:10 -0700 (PDT)
Received: from oni.wdc.com (unknown [10.225.165.78])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MxJxC3dGzz1RvLy;
 Mon, 24 Oct 2022 21:34:07 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v1 0/2] hw/riscv/opentitan: bump opentitan version
Date: Tue, 25 Oct 2022 14:33:34 +1000
Message-Id: <20221025043335.339815-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=290a5aa6e=wilfred.mallawa@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

This patch provides updates to the OpenTitan model to bump to RTL
version <d072ac505f82152678d6e04be95c72b728a347b8>.

A unique change here is the merger of hwip `padctrl` into `pinmux`, to
reflect this change, any references to `padctrl` are removed.
Additionally, an unimplemented device for `aon_timer` is added and IRQ
numbers are updated.=20

Patch was tested by running the latest master of
TockOS as of this patch.

Changelog V1:
  - Added a comment specifying what
git SHA of OT we are targeting in [1/2].

Wilfred Mallawa (2):
  hw/riscv/opentitan: bump opentitan
  hw/riscv/opentitan: add aon_timer base unimpl

 hw/riscv/opentitan.c         | 24 ++++++++++++++++--------
 include/hw/riscv/opentitan.h | 10 +++++-----
 2 files changed, 21 insertions(+), 13 deletions(-)

--=20
2.37.3


