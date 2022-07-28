Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A7C583624
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 03:06:33 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGryy-0005uH-56
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 21:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2015eeb89=alistair.francis@opensource.wdc.com>)
 id 1oGrsv-0001Qk-94
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:00:17 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:38251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2015eeb89=alistair.francis@opensource.wdc.com>)
 id 1oGrss-00019M-HD
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1658970014; x=1690506014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rjnX6XfFTWnG6HQ6YHiIYF8KQvCFntMH/qL29/1CD3o=;
 b=G7nxHLeMv1gJQo62L4UhKdrGmLChWd8AlHsK2vKLB7z4IKbvl+bs+iKk
 yNE87GufPRE6xo54J1ce/IQhx3+GScbh1IY9hPz/9TrLLXZOLW6nRUF7D
 4/yva7GXQiLU9QGvfRiAafm6HeCd297TZitpjlAruBl/hjSu0IFRAaMxb
 hbxvN4H8o1pEGxRILau9PI2/q11dZSf43bVZE5CX+V/MkDavMTug8uK/z
 4eSd7Z4NpKeQ4gLfX2cFh5wQ/bnNEJyWE2nA4WGHpy6K1DtPihmhb8zaT
 X7zia0eL5uWWJPd+YbyovL1YgKtb9m5lJUfU8nxo74UB7jCk0+O1aKvGY w==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654531200"; d="scan'208";a="207719356"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2022 09:00:08 +0800
IronPort-SDR: K0yzUf6jBUa+P1utBa/W6wdJPG7iuRbNQNohUIEebx4DlOFmfGCLr6TV7zCYyCvZUF7aS7H38k
 JtLSFxfTTtV3EobZ8/B8W+ZYKZ0l31ZhpYZtO0c8QyHpqE5odg5my/tY7Yp6/mzNlUE6IWZtmx
 RCzsr8QnUz5fTTagC9eHfyCdawjOxIDbMoKdF8QvlEy7T1c3ZmMQeyFUjVn+ZRoz2YJDOVrXCG
 9VqLUpJOp4Y1W+BliEC6jCZNTbTDTXJIDxllwLm68x83ToJrnqCDuKCSMRzQWLnNQR6B4QOa6R
 up5gVX2mAOqYbW0ceBdmQH8H
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 17:16:16 -0700
IronPort-SDR: 9zZO77CCROC7yy95K3kTBwbVJXTqK7voh+ZjekfemHhJfQAL60ozsVNiTNHBjFINRY/IatQakO
 BMkurzETn2tMFtRkkbk8o44pQugLpptS+gI+l4Gh/iqxMljAz0jtT0pKj+8PdMP/GrIhavcOho
 cp6UeIHKPOC3hkF17q8+QbDnZb5j4kRcDo8sUJkgzwA7/bdwQFJudiocGaXQErGN/JLkYtgAW+
 bDVHSfek7leKYmovQv2gIn4il2iKRGdN96SLPl3MKk7exKuc0wDkCuId8b4rfop0fUY3nPFgZb
 rgY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 18:00:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LtXPN0rxHz1Rwnm
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 18:00:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1658970007;
 x=1661562008; bh=rjnX6XfFTWnG6HQ6YHiIYF8KQvCFntMH/qL29/1CD3o=; b=
 IdBiVMYJW2LW5W6TqgEYW3LKeBUuHGQ+rrhfVpTiljljbfXfZWYrloSNv6XWF4sF
 fcKw5oARJSPonjJVBez3qmsoTGdzDB6v5dHz+ktnMXL+BnDBob+SC9P88BV5PyOC
 x3HNMr87DhY2oOQT0tgXqJqDgnLz1zigxcfzFkHZxQHyCFQtGCuTesGBcs7D5ghG
 CFElShAqX711ge8Hn8DXp6I4M7Kv6FS74X/+ppSD8TI1eJWCvwccXwrJwA8Mp+mH
 JN3J64SJZv1z+mdwO6SAcUEjMhfVqF01+4nbv3vZhxJ/k/A9urLfBUiI7OKUDY/t
 PrUwpM7KtJNPUbW2K1ualA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GmgzfQRIU3xA for <qemu-devel@nongnu.org>;
 Wed, 27 Jul 2022 18:00:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LtXPL1PQkz1RtVk;
 Wed, 27 Jul 2022 18:00:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 0/2] riscv-to-apply queue
Date: Thu, 28 Jul 2022 10:59:58 +1000
Message-Id: <20220728010000.2764631-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2015eeb89=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 7b17a1a841fc2336eba53afade9cadb14bd3dd=
9a:

  Update version for v7.1.0-rc0 release (2022-07-26 18:03:16 -0700)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220728

for you to fetch changes up to 54f218363052be210e77d2ada8c0c1e51b3ad6cd:

  hw/intc: sifive_plic: Fix multi-socket plic configuraiton (2022-07-28 0=
9:08:44 +1000)

----------------------------------------------------------------
Sixth RISC-V PR for QEMU 7.1

This is a PR to go in for RC1. It fixes a segfault that occurs
when using multiple sockets on the RISC-V virt board. It also
includes a small fix to allow both Zmmul and M extensions.

* Allow both Zmmul and M extension
* Fix multi-socket plic configuraiton

----------------------------------------------------------------
Atish Patra (1):
      hw/intc: sifive_plic: Fix multi-socket plic configuraiton

Palmer Dabbelt (1):
      RISC-V: Allow both Zmmul and M

 hw/intc/sifive_plic.c | 4 ++--
 target/riscv/cpu.c    | 5 -----
 2 files changed, 2 insertions(+), 7 deletions(-)

