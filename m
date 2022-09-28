Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4201F5ED423
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 07:11:13 +0200 (CEST)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odPLj-0005Sh-Ub
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 01:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com>)
 id 1odPK9-0003ZB-8t
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 01:09:33 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:60015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com>)
 id 1odPK6-0005vk-Mr
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 01:09:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664341770; x=1695877770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EBCB0u0v1hk4WKN8ssQnjB19ZfAevYgCFVsNwtv6Wcs=;
 b=nBx76Mrw8FfWw2lBWfrcDKfI9FJl+UETx4VBXL/nf83krG9Mvitjt/UD
 Wb+4mjBlZ42as936mXwveUqTB3q18a8zMF2Uwhd6He+S/Tyidy/EY0FPQ
 sj6PFmkp1QIZnZHl259joglH6yIfZCYwtGtWTKl86d+NXu2TVd+aFxrUz
 K7qXs12VNIHHR29TbO8tyPl5fjnPE4/82cbE5FIcIYivWCd8vOtOmbGqB
 s8C/3NzcdJCUPyDGukEFgMHWxf9Nw2j03m+L/wsWX+TIks8RTHmjl4Xam
 Fc2y2mPhZZ63RS2C3MpXlG4l6HRRmaYHBVthn3fxd00m/sSZK7oWEGhbH w==;
X-IronPort-AV: E=Sophos;i="5.93,351,1654531200"; d="scan'208";a="210817934"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Sep 2022 13:09:21 +0800
IronPort-SDR: RhNn6OKWs+KIoJtPDxeZcQOqRgLa/4KawGY0JSva0JD7Bnl0yNapc6G/sC0wlgzQoeJ4Lk+6bh
 VVjU2YGqQkKooEVJ8g0FOo1K4qbcViEJYuu21ZPvazsL0RdFSdj4EErrGcHzoBafXuZ1UYsOXU
 l/ORg1XWGlXY6eQl97L9Hc/en+2TYjhLjR1leAXtzz2U9mMyZbCLXZACtqHTf7OhqrM1oB5qQ/
 sEk2NvKUXbqFSy9ACu7oUtUSuKnviiQQXieJhAmp0qWD4xUAm46LYre+CAH/DBzlTI76h97snF
 XpSFgiaN1U2DmuMOjInzCi4J
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 21:29:17 -0700
IronPort-SDR: 64Kt40Lr6wnBXxFdiMoypf9H7/R7cjj09WAegz1KZoKMMBbZrcFeAh9+vNDZ4kyQFczOq05Qix
 WMKCzW5UYXZuTs3XuGTHVK5S39ryamNXOfjCCibUs5/LyP02gpAxkaL+duEaXI0I5hZXGA4ICU
 l+y/r3nxOuG/e1OYJ1Sil0Asbw5WAYBo8/OmCrk1xnRySp6QG90d+3W80Iz3ignJ9oOIwS0ewV
 URvrN7nW9Q475Ls3/wpG25QMxaYEcbhM0y4kLO8RNK6rSJ+mjWJgAjC59fB2UJaABqutaj0uMB
 Rm4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 22:09:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mcl0K0XsNz1RvTr
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 22:09:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1664341760;
 x=1666933761; bh=EBCB0u0v1hk4WKN8ssQnjB19ZfAevYgCFVsNwtv6Wcs=; b=
 McVHDImLLLYz5uNngkBsNdE6yPmjCT5B9Uw0D2OMxl0bkl7y/5oG8vP70zeo9T9I
 mZS8IrU53av3HfB2vgbvyVF1MDYo5Le+F1Z3KKRX2UG576oHzb0Jh58DLIfgZpL2
 2K2zupQcvelHd9p4HXy/Uxv5Uu1R+Jg78jq4x1AwrMoGYFIzI7dkA2AfpvipiRJy
 AVsM5JvjxcmJkc5R8Lvhn+8IuExCnZ8dq1fOn+LE/2UezykMB8fCVb2sbH2L05Z3
 0OiFHnCimSWw8ELycN7JNqqz2/EV9FHZPvTJiULE4Ku0o7iI8OKQgJA4uHn2YBO+
 cIMsnsBgU123UneHcxdcyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id TGM514M4iA76 for <qemu-devel@nongnu.org>;
 Tue, 27 Sep 2022 22:09:20 -0700 (PDT)
Received: from fedora.home (unknown [10.225.165.54])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mcl0F4kfvz1RvLy;
 Tue, 27 Sep 2022 22:09:17 -0700 (PDT)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v1 0/2] Add OpenTitan lifecycle controller
Date: Wed, 28 Sep 2022 15:08:26 +1000
Message-Id: <20220928050827.319293-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=2630fb27d=wilfred.mallawa@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

This series of patches:
        - Add OpenTitan lifecycle controller with basic functionality
        - Connects it to OpenTitan

Currently in OpenTitan, we skip the `boot_rom` since is has become more
complex and we do not have all the support in QEMU to use it. One of the
missing pieces to getting the `boot_rom` working is the lifecycle
controller. There's a particular `magic_value` that is kept in the
`LC_STATE` register which is checked by the `boot_rom`.

With this basic implementation of the device, we can get past the
lifecycle controller in the `boot_rom` check stage. Testing was done
using TockOS (running QEMU with `-d in_asm`) to see how far in the boot
rom we get.

End goal is to add support to all device models in QEMU that are
required by the OpenTitan `boot_rom` such that we can use it as the
`bios`.

Wilfred Mallawa (2):
  hw/misc: add ibex lifecycle controller
  riscv/opentitan: connect lifecycle controller

 hw/misc/ibex_lc_ctrl.c         | 287 +++++++++++++++++++++++++++++++++
 hw/misc/meson.build            |   3 +
 hw/misc/trace-events           |   5 +
 hw/riscv/opentitan.c           |  10 +-
 include/hw/misc/ibex_lc_ctrl.h | 121 ++++++++++++++
 include/hw/riscv/opentitan.h   |   2 +
 6 files changed, 426 insertions(+), 2 deletions(-)
 create mode 100644 hw/misc/ibex_lc_ctrl.c
 create mode 100644 include/hw/misc/ibex_lc_ctrl.h

--=20
2.37.3


