Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B93FF7D4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:27:57 +0200 (CEST)
Received: from localhost ([::1]:60034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLw7e-0007S7-Mf
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw5K-0005EH-7J
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:25:31 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:52015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLw5I-0004vc-Md
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630625129; x=1662161129;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4tEH87Tt64bZHfL5xDKXGkhl6bKUeaIy8Qiww6HvPQk=;
 b=VxogeAfjbp2sF6uyyH8jMf8yt434c7obMXEJ8tLogbVZyjEGpFY37t1s
 Y4WooK7cCpBJzDo70qk6uZ/YARPZLTdq9yMwlV1g22NYq7GI1FmpHyNji
 lHwa64JyZnyjEdWm/00/jca8nHYMVxOA1QXSjbZyK5EEltH5iVAlroTDp
 7dG6AmTvBqagMUpiy0gkMoWRiRrXRCRAxzJveAZ2L4OxLznxzKh9utMFa
 po39TaIE0zSCAegAhQ1bLHbVaalYJ3VpSJsoDQVRDuiB2afG9qc19K4EN
 VK1bO9g8lxzNy58sMi+xKe38ShjVAmnS7RxEmpBjG9P9oeMmrRH98yoDb w==;
X-IronPort-AV: E=Sophos;i="5.85,263,1624291200"; d="scan'208";a="179628320"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Sep 2021 07:25:24 +0800
IronPort-SDR: 7NH6jtOSZu4wLJ1xwW8jSYA/0QUq9F1bs9KPoJyfILkaxietXCbVh6bSn5pd3AztCN0Sj5ehOq
 xpScd1VAxD2XVzme2wkLti31kPIDIMzFCT3U8IiWPLv2DGBHoYpjKPOiqnDWGDn9bvd7VebLQ8
 yyL0LEPa4d3PUHttwp7dPkOsPrZwv/sxUIo4jZZQ9g9i4AzJp45piHWOrw3WY5ln4l57QB7qsT
 Xf1Ig5b0MtpB/18IVjTSQP5POoZLZ6zSQH2N+7hUkW/J4T9z6M4nWAaarEo/RO6qT1jwEmv8xJ
 9wG2392BVTrDz94/9U9xXsX/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:02:08 -0700
IronPort-SDR: sybq0T4HQIW9GdZLnB5IBXl/FHEUzJutv1eWyJrIeUIWsU8ry4eH9wCp5pQIZKURg9H//kProq
 Ks1dx25oRDfsGCE5rwZtIapYRqsCrYGhpaPq1AZZsM3K4R6wECOdxQQyRu6J50qYYp8RHJObBi
 xHKmqqXNvkTBU3E/RCF4Xt0+gE4sH8AKFJ1pdDFzi5efPh+7UbSofrRnaLqF1q6oqfoIU9Aabk
 myiQbSNQd7reeSopHCCOXOuf9/hgvi1CNdaCvxs7jTuTqSmvsjD913dF4VCLxkwOZUYZhNRM+s
 Ylw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 16:25:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0xqR0Yzfz1RvlV
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 16:25:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1630625118;
 x=1633217119; bh=4tEH87Tt64bZHfL5xDKXGkhl6bKUeaIy8Qiww6HvPQk=; b=
 oqyr4e73x1ip2fPL49oRim/nQeZyFmxU+BxY27BJSPIlALGkYT7Tc5gWqi6L/yNJ
 Pguo2bwM+w45Iri3hDGjF4ip3h4QOe0url0aZFVRzFlr8RBPmTfVKuNysHu1ICyP
 heJ48EwYiIPC5w0ZwfY/XJwVR6O6rWxLrrTFWkmuGPPw1iBRVE2+fRPet8Oxd6/t
 Aj9XoSCnM4phtTSUBc3agppOrGw0545Zj9cV0r6p6NYEawnG8lDmZEi/lXISdzFL
 llWGPXERXOXZfakYG5o0ceJENu1IHBRDfX1CpUhsDRDexeta8lDL9DPN3LEis7SC
 fZ1eeFSDUzCXETjIr9mKaw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yFmIpgqJvojv for <qemu-devel@nongnu.org>;
 Thu,  2 Sep 2021 16:25:18 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.17])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0xqF6Kvjz1RvlP;
 Thu,  2 Sep 2021 16:25:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v2 0/2]  Add the SiFive PWM device
Date: Fri,  3 Sep 2021 09:25:07 +1000
Message-Id: <cover.1630625094.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

v2:
 - Address Bin's comments
 - Expose PWM via the device tree


Alistair Francis (2):
  hw/timer: Add SiFive PWM support
  sifive_u: Connect the SiFive PWM device

 include/hw/riscv/sifive_u.h   |  14 +-
 include/hw/timer/sifive_pwm.h |  62 +++++
 hw/riscv/sifive_u.c           |  55 +++-
 hw/timer/sifive_pwm.c         | 468 ++++++++++++++++++++++++++++++++++
 hw/riscv/Kconfig              |   1 +
 hw/timer/Kconfig              |   3 +
 hw/timer/meson.build          |   1 +
 hw/timer/trace-events         |   6 +
 8 files changed, 608 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/timer/sifive_pwm.h
 create mode 100644 hw/timer/sifive_pwm.c

--=20
2.31.1


