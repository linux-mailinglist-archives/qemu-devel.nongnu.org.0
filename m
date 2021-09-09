Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631BF40441A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 05:56:32 +0200 (CEST)
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOBAs-0000HF-Id
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 23:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=879ac4819=alistair.francis@opensource.wdc.com>)
 id 1mOB9X-000712-LK
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:55:07 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:13241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=879ac4819=alistair.francis@opensource.wdc.com>)
 id 1mOB9U-00067t-VB
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 23:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631159703; x=1662695703;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7F9IXXP60JX52d85pljg43t1k6mm8CfBsugYwM02zpI=;
 b=CYT66NumVcnjvCWTA+p4OE6LscKBgm3EDabHEtJmJzhQgRwP3Y/PRNKr
 tb2lUHZ75fUKkTUcLsgTeDlZPz2e6D3wepOOLFVTkrK86mCYTtC+Qt0Ss
 1oEOtXMe7WrMGiNcMakFPl+ZaMvX+N/oxRis+y5kpF1NQ6i6jz/pP8Bhf
 Ma5vqaZB04SuntMVSsLziIqh1pbZJ54ZuevGszX5x5Gfj2jSNfNQthcoG
 9BrjEXgApXR8ttfZCpe3lw9S3yUPkT1YQOmf6q6JOMrmIS3xi1//RWap/
 zamIJwHKRBzSC8XwH08riamPh1NuNkfuwZKA4Q39hdxkDkzb+HOd5egjt Q==;
X-IronPort-AV: E=Sophos;i="5.85,279,1624291200"; d="scan'208";a="179540902"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Sep 2021 11:55:00 +0800
IronPort-SDR: s+y/mrMCqn9LBq0k//W4KSo9jCdJf1ifTtSSK93zLfOZl3k7wXWB7+OW59y5jvnXZ/mmiwsK8k
 /QHQ8CUPDTDwzud0jL6gSphYMjXawXB28p7vPq6qlXuZ6np+I+Z7iPfdYlSUX7V88Bp8YXzJCV
 4FP6A+H4DQlDzr1dKZb5ZIidec6aQWxvVRGrxPkGFZPQrwsswDFVeU4ZTX9fupYvdSkjTK9rm5
 QkOB2pQF3VyEoLeXKrxediSh8rZiDE6uwydPb9iqoDDCFdbWRJY3GbZSRjNOlo1S54WNYDFuuP
 CuLxFdN4oDjpBn08KZUTYPls
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 20:29:58 -0700
IronPort-SDR: +5969ns3uoJq+Ui42IGF4E9oz94O7x1JsIuv3wq6MXEpJV83EMVByPNYmDVcESuQ8pPPayqW86
 +cKoyOzYimaz7YBmco54tGNhl4sidOObZwcCAdCC47i1yVC2znwhFEBSzWhMc0jyJOCAJBdIal
 bIkqS+yE3i+aKASqesZRI8mUc93I4vKKqgZ5aAw3j1V4prYHiXXFMuSuiqSVDc5E44mqZmiyoJ
 Bwb31vrlgJ6LosHu04VkjaT6LnB0J1w0TZnJ5Gbv5R65dGphy6j5vOcABVcriToVaY68Lb5YwF
 8Yw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 20:55:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H4lWn0zmDz1RvlX
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 20:55:01 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631159700;
 x=1633751701; bh=7F9IXXP60JX52d85pljg43t1k6mm8CfBsugYwM02zpI=; b=
 Y88uXAA0m5hcZHG7CPepqJJL9m+4L6sx7fGhFFyYgW/nNUG5gJO+gh7ezQrjffa/
 PFOKBGlWH4AXHTYA6vl93MrWsBdV7kPaqb7oQaQOud6qMwj4bb3RL8xdkADBRDDf
 jywpSDhYWedexkYWRoO53SeQ7IciWhO1O03I2pTaFRNk4dJJpRtQDAR9xGs/pyFL
 fPDbxlZ4V677wwHTxljOzjqVv9wRt62A3i10zxzNbBzXzWGJM5DGyu/MnCSSC6a+
 CYal3frRXol3uHrH569oqg7SRgAo+sJxITAag6ZnaiZ4pFRxAaiKDiM+Ekyurczw
 UYDTN1dtWOoZ2z1JuQKZHQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id j6_3HvqGMgTM for <qemu-devel@nongnu.org>;
 Wed,  8 Sep 2021 20:55:00 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.20])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H4lWh1SjBz1RvlP;
 Wed,  8 Sep 2021 20:54:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v3 0/2]  Add the SiFive PWM device
Date: Thu,  9 Sep 2021 13:54:49 +1000
Message-Id: <cover.1631159656.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=879ac4819=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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


This series adds a the SiFive PWM device and connects it to the
sifive_u machine. This has been tested as a timer with seL4.

v3:
 - Small fixups
v2:
 - Address Bin's comments
 - Expose PWM via the device tree


Alistair Francis (2):
  hw/timer: Add SiFive PWM support
  sifive_u: Connect the SiFive PWM device

 docs/system/riscv/sifive_u.rst |   1 +
 include/hw/riscv/sifive_u.h    |  14 +-
 include/hw/timer/sifive_pwm.h  |  62 +++++
 hw/riscv/sifive_u.c            |  55 +++-
 hw/timer/sifive_pwm.c          | 468 +++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig               |   1 +
 hw/timer/Kconfig               |   3 +
 hw/timer/meson.build           |   1 +
 hw/timer/trace-events          |   6 +
 9 files changed, 609 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/timer/sifive_pwm.h
 create mode 100644 hw/timer/sifive_pwm.c

--=20
2.31.1


