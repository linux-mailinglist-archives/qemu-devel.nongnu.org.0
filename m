Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE75544FD4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:51:59 +0200 (CEST)
Received: from localhost ([::1]:39546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJVu-0001dU-MS
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1525abdf4=anthony.perard@citrix.com>)
 id 1nzIkD-0001Sm-8T
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:02:41 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:46741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1525abdf4=anthony.perard@citrix.com>)
 id 1nzIkA-000834-VO
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1654783358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tm58TKjl3SzrbwqM6a6QyPw1368Tng6ggDmDzdobK1U=;
 b=Zc+aN0cS37KDN+gjfKjuWZL0MM/uPtlu272s/Ouv2NTYhpTLBVKbkd1E
 4Q7OwppW4tle0fiykBE9Y+nniANXTOdWj6ozo5L2GZt3lvf5GwRP1cHqs
 1Hf76G/joVL4k7ntHFQyvq+45ZN3q7eBlqnV4erXRjsCCo9KIe3yC/s3p 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75787859
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+UfaC6ha5bP4FVmQPpvCR2sLX161yREKZh0ujC45NGQN5FlHY01je
 htvWmzUbPyMZmPwfopwaNzi8UxXvZLTmtA2GgprqS88Fiwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvd4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YToYeYPjwMkPaCV3DxN7E5Rn2bTaLHfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmcwPEuQPkwn1lE/Opk0p72Bg2LFVywJqkrPhrM02Enzw1kkuFTqGIWMIYHbLSlPpW6Bq
 2fbumj0HBweHNqYzzWD7zSrnOCnoM/gcNtMTvvirKcs2QDNgDxIYPELabelicSIzWCRA/9NE
 HA75hgrg5ET1Ue2Q9aoCnVUv0W4Ug4gt8t4SrNntF/QkPaEvG51FUBfEGcfNYVOWNseAGVzi
 wTXx46B6SlH6uX9dJ6LyluDQdpe0wAxJHRKWyILRBBtDzLL8NBq1UKnojqO/ceIYjzJ9dLYm
 WniQNAW3el7sCLy//zTEar7qzytvIPVaQU++x/aWGmohisgOtP5ONXzswiHs60YRGp8crVml
 CFc8/VyEchUVc3d/MBzaL5l8E6VCwatb2SH3A8H82gJ/DWx4X+zFb1tDMVFDB4xaK4sIGaxC
 GeK4F85zMICZxOCMP4oC79d/ux3lMAM4/y+DqCKBjePC7AsHDK6ENZGNRbKjzm8yxh1+Uz9U
 L/CGfuR4b8hIfwP5FKLqy01itfHGghWKbvveK3G
IronPort-HdrOrdr: A9a23:Wf/a/KFcOUk6wu/KpLqE5MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 eTdZUgpHvJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0wHEEGgL1/qF/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.91,287,1647316800"; d="scan'208";a="75787859"
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 0/3] xen queue 2022-06-09
Date: Thu, 9 Jun 2022 15:01:59 +0100
Message-ID: <20220609140202.45227-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=prvs=1525abdf4=anthony.perard@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

The following changes since commit 05911658cb46d907fb38cbc0b48d2b652237dc28:

  Merge tag 'vfio-updates-20220608.0' of https://gitlab.com/alex.williamson/qemu into staging (2022-06-08 13:38:54 -0700)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20220609

for you to fetch changes up to 6a8a8b62bdc8e3d7c5fc0f82ef4583707183b12f:

  include/hw/ide: Unexport pci_piix3_xen_ide_unplug() (2022-06-09 14:47:42 +0100)

----------------------------------------------------------------
Xen patches

- PIIX3-IDE Xen cleanup

----------------------------------------------------------------
Bernhard Beschow (3):
      hw/ide/piix: Remove redundant "piix3-ide-xen" device class
      hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
      include/hw/ide: Unexport pci_piix3_xen_ide_unplug()

 hw/i386/pc_piix.c          |  3 +--
 hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++++++++++-
 hw/ide/piix.c              | 42 ----------------------------------------
 include/hw/ide.h           |  3 ---
 4 files changed, 48 insertions(+), 48 deletions(-)

