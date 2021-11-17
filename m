Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD6145438E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 10:23:03 +0100 (CET)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnH9h-0007u5-SU
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 04:23:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9488079f4=alistair.francis@opensource.wdc.com>)
 id 1mnH7a-00061b-9e
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:20:50 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9488079f4=alistair.francis@opensource.wdc.com>)
 id 1mnH7X-0000eR-9T
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637140847; x=1668676847;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kugED11/4MZD61ZPMdB1j8rH4CSGFeTG3jPua8fszkw=;
 b=Xg3uDNdx9pV1GRurixrLc2ckVGv8pPctivGapc2LYG909Hu6pwde5RP3
 TQvYnsos52R5ZigZctsCsdEHPFUhnDZrKWnkgQiQEuT7RRPcq4rJ9JVup
 vqZdHflK7wkQSytHzlfLDudiF0koVCf9SbOMEabKShPdMN/FNBk8vLLCk
 w9ol0nNfInpjrmykiwW/I5Gnnf5kOsd2YFvTFzNCTQn/mVcx/jzigAAND
 uWc3WsgrHTa7lr5oIewsdRbDwNPwJCs7bAr2EpdIXggCAymSQhXdeDteC
 AGbx1bgFZlWBgb5uEzJgkq782JhvwzykexFv+tNengC9YBg67vvR6xNTF A==;
X-IronPort-AV: E=Sophos;i="5.87,241,1631548800"; d="scan'208";a="184819101"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Nov 2021 17:20:41 +0800
IronPort-SDR: BU/WzMurJTVIUx2pS3EQ1lVkB+T1hTZ7vj4xaLtovW+rK2tM3mpbSsf9LK1L4mjRKXPr9B50C5
 xt9nNDDoH7v4YmC4htVYlO+MCHTJKLZiRBprDUHW69kk7eaD6PhxjYwwGe8fuW3wEGX5ebnDC+
 23erMm5Q/fUfFMBG9FwaqT5IfRT01NWS9GKTaIpVcBv69+OdNeGTppktpvF+atu54mfidWg6vD
 OW4cJMdFWCAp6rUsImNuqEyXO3MBeY4jn2seWYUOdtXdFx5UyM4t4K+rbb40IqLgb94U9Z+T2T
 3leA76NShI4GvSpW5wV9Tbcs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 00:54:10 -0800
IronPort-SDR: 7iQ83M9XoOVjNJIcFADBmBcRrdy7gTa7lMVTlKe7UIVm9Cx2gpQ6/TVWtDSmfNGWvuRswrRqp4
 sq6BcowEamfM8J/3qlsE0GpYS/dmv9ptE4lUrxADjervci1Kfa3CE0wnq5UkepcWqlNOF9gfOW
 j3CBFoWEImZd05qeQJpI8P9vJhX+ZRP1mjSBdtDlDCdXC4V+bV4N6SjB+y2srFnBpSxw7rzEnu
 BXv6GjWy6DlIQma6HNdwPNz35UukGZLSMpVsE7EMRfRurrQl0IdJwMjyqeZCKXyMqzIqnOovIU
 mu8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 01:20:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HvHTh631fz1RtVp
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 01:20:40 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1637140840; x=1639732841; bh=kugED11/4MZD61ZPMdB1j8rH4CSGFeTG
 3jPua8fszkw=; b=KE1jKkZzDpzjUokNV9vh4fpJ4NZuSC/XC9KyDWxnTgwinZcJ
 6TwjqHFQu36EFPezx8XbEOsabQeCOMNxXbPEeBASuI2baQYf/o4Q4xrRMpfRzmX7
 TTIkEe11kWhu5CX9vztC8I8hj6Uz6zHQ93SNsgE2J5IoI/ncfu0+Xe+77onFvQ8o
 pD8V0UxeyHzRsg1aZXQMOemhDUQ6onhwSTMJdDZr9i7rcPOi/tAFGOAxreDm6HMu
 WxK6mUvzvMz3G9w+W7Sjo/XSxhm7kf7IZ3SRshL49c84MNqI00rL0hdhPjEpRPZX
 bDpQxdwOJEseURmo7IxYB+0ij5nHh5LLlKRORQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1YUuaC2lv9Gq for <qemu-devel@nongnu.org>;
 Wed, 17 Nov 2021 01:20:40 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.57])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HvHTd6bshz1RtVl;
 Wed, 17 Nov 2021 01:20:37 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 0/2] riscv-to-apply queue
Date: Wed, 17 Nov 2021 19:20:29 +1000
Message-Id: <20211117092031.99019-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9488079f4=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

The following changes since commit 8d5fcb1990bc64b62c0bc12121fe510940be56=
64:

  Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into s=
taging (2021-11-17 07:41:08 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20211117-1

for you to fetch changes up to c94c239496256f1f1cb589825d052c2f3e26ebf6:

  meson.build: Merge riscv32 and riscv64 cpu family (2021-11-17 19:18:22 =
+1000)

----------------------------------------------------------------
Sixth RISC-V PR for QEMU 6.2

 - Fix build for riscv hosts
 - Soft code alphabetically

----------------------------------------------------------------
Bin Meng (1):
      target/riscv: machine: Sort the .subsections

Richard Henderson (1):
      meson.build: Merge riscv32 and riscv64 cpu family

 meson.build            |  6 ++++
 target/riscv/machine.c | 92 +++++++++++++++++++++++++-------------------=
------
 2 files changed, 52 insertions(+), 46 deletions(-)

