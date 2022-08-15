Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77477592807
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 05:19:03 +0200 (CEST)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNQd4-0006mT-1O
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 23:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQb0-0003ZA-Mx
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 23:16:54 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:1255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=219596703=wilfred.mallawa@opensource.wdc.com>)
 id 1oNQax-0007JJ-81
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 23:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660533411; x=1692069411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RLgExAGTAe/A4djJXCQYBsF1VwKpdUXA7qTwU2KoB4U=;
 b=cLbA7qkKOpskm8YVKYVbfv2fuGxKDFnzoJ8HWUJgDUEbucSWvy3PvzXB
 LIwFGklJndfm99wS+KlM2idXC6xRwf0EaJPjbymBuLnTe+EqWylwPclw7
 jKGQ8RTwGxnk19iwQJdwPkapTsaL4wy/jNAHLLC7l7eULvtiMPs1NHCXG
 hoxGS8xPF+T+ADa2zvzS1DUWRQ5fHP60tqpQh+MNDQFo0GCFb1+3t/S/1
 efOdZ0I3OUDCiCMG5JHKf5kFsWQJt0f89nfUVzSteuUKCK0ICEtxY/YZh
 RqK7LJXJKGyLROAMrhPa5Awou1BUPDL+lX8n1E9JTYnZguUzfuZdlWi6X w==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654531200"; d="scan'208";a="209232497"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2022 11:16:45 +0800
IronPort-SDR: qnu+OGHCnj34PtiVe6oBZZR22tv2pRXadCKU71CwxWWX2kUStr5AS1ap36t8ooIQj1KZ1+okc0
 oViip4CC3SnJEd1JzqhnsMYRoPBpAEWhac7/1BGVsICo5t2rvLp+M82Sx3b+8xFy5TSZ9IXUl6
 29KLlFaMnoh+0xEGQj5RwtFJKEhjdh2IrNTMI1/gbzsUjI8DoofiAHAzmwDzszo5gU2aggqS++
 I7jgznjF9w97UmPuDKx/iZgqPTfhnjDze8YWnZ9uCItj6iyyr2TB23RKf5Qi21JHEE1vY29iuo
 DhitBS7CtAU1FqXKGs6QhEkN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 19:37:35 -0700
IronPort-SDR: iyBQLkFzgEEN+3GowRm/MBUjta4OGGD/i1w2WXFgcwPAaE5M7Ufzpn7oTU+a4GOD1E3ZoioWG1
 mGLeNSa8d85r/tsEPBNwei/luwaQZFLYuKBcWncbk3M1u47HuNeD/uafvlx2a+nt3HnZ1pJvZS
 5KMQ3/I6YY6ZDEjJsoTz+wrczMFe7KCE5zBIa/hvtsMTOJYCvkw2GUyYMsY95m1MfzK4AuDL1Y
 OrjfybwbXlQJkbePOO1jW+DmJsR0GR/i/5SmZWU3aBbSjurUdhayI5o/yxsNI7UTJpv/gKTUmi
 PFY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Aug 2022 20:16:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4M5fZj3Qf6z1Rw4L
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 20:16:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1660533405;
 x=1663125406; bh=RLgExAGTAe/A4djJXCQYBsF1VwKpdUXA7qTwU2KoB4U=; b=
 VDbvDNi7o0SUWf53MhC8fYtG4g5nfALDcLzXzetvyK+zm94a+wlk/y2P+h4B9mYH
 hh00Nfqrn4mVowTW50h3bnQXKrz6UsBAlECTaVe6ueC1JQ0eitpN8Ef+TvX1B4m4
 uUw2nzsHT9LBLwdTcSoSEZ/qcupC6zOZw/d+836rAHNFz2/dF8/6B101JIXF+ZwB
 XgeOr0U9PeZc0jtWckiOh1ssONne5T/l3pFIMJ4oe2k1U5Jw2L5H1M7izYbVNb5W
 UtTF0oPr04VesXEI4qCeUQVZxEzdvzD4E5Fw48/r5uOBR3pmu67rRAECWHnwrYtG
 1mdifkcrZp67CS7DVbhg7Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id sqZWBgsScUW3 for <qemu-devel@nongnu.org>;
 Sun, 14 Aug 2022 20:16:45 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4M5fZf34twz1RtVk;
 Sun, 14 Aug 2022 20:16:41 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com,
	qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v2 0/4]  hw/ssi: ibex_spi: cleanup and fixup bugs
Date: Mon, 15 Aug 2022 13:16:21 +1000
Message-Id: <20220815031624.170857-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=219596703=wilfred.mallawa@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

This patch series (note V2) cleans up the ibex_spi driver,
fixes the specified coverity issue,
implements register rw1c functionality and
updates an incorrect register offset.

In V2, the following changes are made.
 - New patch [4/4] to isolate the register address offset update.
 - Adding the `ibex_spi` tag to commits
 - Split the register update to a seperate patch
 - Address all style suggestions made, to improve readability

Testing:
  - Tested with Opentitan unit tests for TockOS. [OK]

Wilfred Mallawa (4):
  hw/ssi: ibex_spi: fixup typos in ibex_spi_host
  hw/ssi: ibex_spi: fixup coverity issue
  hw/ssi: ibex_spi: fixup/add rw1c functionality
  hw/ssi: ibex_spi: update reg addr

 hw/ssi/ibex_spi_host.c         | 170 ++++++++++++++++++++-------------
 include/hw/ssi/ibex_spi_host.h |   4 +-
 2 files changed, 103 insertions(+), 71 deletions(-)

--=20
2.37.1


