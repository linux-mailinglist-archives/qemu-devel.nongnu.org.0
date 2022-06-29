Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD751560D76
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 01:33:09 +0200 (CEST)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6hBD-0004ui-P5
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 19:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9V-0003Oj-Ju
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:31:23 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1723d02fc=alistair.francis@opensource.wdc.com>)
 id 1o6h9S-0004OD-SU
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 19:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656545478; x=1688081478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Be68EkZQO9ktIYjlhKsfGrMZq6JAr7Rlr8a7xiTOo6w=;
 b=qyBDibmep+r5jpaz4O3Ngd2lHqnHzFcY5MsM5T1m499e2WXdzOe4Cp5S
 4xNA5nAkixkcJx0WhYvHH8stX7C1Ubw2fVseB/x/ZK9Fe12K9msxO3IKD
 +zRSUyOUzC2ZkD/z6VKhch1gtguyLy9cPcL6rtyANi0yQhOnhWlCIGt1T
 CpRa7E0xAs4rFfnKcxN4pvpPvVOHX0FGTRBucZmgvPmttrp/e1twQO0fp
 z78hjvRhyYRx1wFtlQVmZsxKV77EZwzfl0ZEk4KjLnkLsBkuvOdcxkbGj
 +XHMQ617faUwDDsp4zkSBMx63mw02sv1sCIQfTSBg02Hzyw8VOUPVhwur Q==;
X-IronPort-AV: E=Sophos;i="5.92,232,1650902400"; d="scan'208";a="205161711"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2022 07:31:13 +0800
IronPort-SDR: CbPQVF4/IiBxc/1NtqKSqucxFa2QIVu0ug10mpqxHvgnIsqoqcnoE1MMXOBSAdvT0Vze13tWNe
 /OLH9LlDVf4v8/RlJD5zMIB+dvDWnzgkjMlKAsq0AO43LM+Rrdb37crvPfWnBN+4vIKPB5or8q
 z+xHI89cRQ/FvgAxdF5vTW3AuLzJFFPch8fV/5+vkHn4eK4zGlG045XivlLDC3XgTnL0RmAsJw
 Dce/tyEPkGJuVk1cNFZPdk3uRk3k6fRvlLzjEj7mfeaEqSgLPxbfa1DAcEiJTRpFZcizZxgOLo
 Kl7uPbIP9EtMXkfxhRYoqfyb
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 15:53:33 -0700
IronPort-SDR: rMAa5QjE9KnQ6ACLKG1ZKZXweeZkG3rCp+q0m+3q/p4VDgnaIxO3oK76xlvJcgwiY3/HU1k3Qo
 51SA5Kv+PXbll8fZmPQvTwVr5z4UQTJ5k6c/Ce2nxom/CHlAR9aHAhdq4RZJyGnSbfOvirQHYX
 EzCEu25Wm+nPt4zwf5lu2Mz8PpHZRdKTFMmk6rCZF2NuIunvMkEVMGznCPu814J/EEMPi5RV7v
 m2AB7YdukfdmF3zOOFCASWa59QSkIshsKdGucW8ozc7IWC18SaS9+6oBAHVJ38DgKdITZ9vsEe
 7gI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 16:31:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYHlh6R2Tz1Rws0
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 16:31:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :content-type:x-mailer:message-id:date:subject:to:from; s=dkim;
 t=1656545467; x=1659137468; bh=Be68EkZQO9ktIYjlhKsfGrMZq6JAr7Rl
 r8a7xiTOo6w=; b=nAmfSrfavCWsFEQnLWllPkyPjHRSilYzHKR9I3p1nCR9lGjk
 Tc/Kv4V7TppNHX8DGZTQ64ero94TJ+T7yPiDwnB1g70zfKopvvrvKkL1Ez4EM844
 xrtCQRh+LsWgpIjPK6duRIt7PdUndY/JZqkR03nwn4/YMvrdDKp0bQJN3kKqIU1G
 X8KnH5+k0OnYh7tGhjVVr3DPh87+wrCO8B46y5swp86ZkUD78GuRCW1F4dA79HGH
 lsTGhr7eTxd3+nv+qo9Ktz9cWI5HPDmXIn/xlq6V4BdRZkrIGT9oXDj680MPeZw3
 s5h5Y/Jn/kyjgruKo6UYL4vyfvk0KeuTGEXHgw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iY0hbR43IKZD for <qemu-devel@nongnu.org>;
 Wed, 29 Jun 2022 16:31:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.111])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYHlY50lFz1RtVk;
 Wed, 29 Jun 2022 16:31:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 alistair23@gmail.com, bmeng.cn@gmail.com
Subject: [PATCH 0/2] target/riscv: Fixes for Ibex and OpenTitan
Date: Thu, 30 Jun 2022 09:31:00 +1000
Message-Id: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1723d02fc=alistair.francis@opensource.wdc.com;
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

This fixes some issues discovered on the Ibex SoC when running OpenTitan =
tests.

Alistair Francis (2):
  target/riscv: Fixup MSECCFG minimum priv check
  target/riscv: Ibex: Support priv version 1.11

 target/riscv/cpu.c | 2 +-
 target/riscv/csr.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--=20
2.36.1


