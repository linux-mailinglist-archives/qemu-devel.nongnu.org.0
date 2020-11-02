Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9952A2D6F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 15:54:55 +0100 (CET)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZbEU-0005uj-Ne
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 09:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kZbB0-0003wM-I6
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 09:51:18 -0500
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:12148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kZbAy-0008Ag-Kb
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 09:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1604328676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VYe8Nw9tlBA8T+IdMSfAkXhMnrcsIZd0xQD6GPGdT44=;
 b=BScjE7AQ7qTMmDTFwDTMXKOiugpXQSISCAcWCTUGPj2P4FA+vhT9VY5J
 B5XIn3NMh2gmoJ421XlVmwulsxXgv5gXRCrRdeEHKxkQaFwh+/EzBb0p5
 0SxKlRNRseNtRRcXRohyFhHmGpRMf9qQEBdxKgWlgrV7olhypr7TMvbAk Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 979c64Tij3E+/hS7kAp+6g5hstx69zr1ZTGK5F/XMxfLCeQJ72rzgwkNoDTEUoC4yiWjApBCGz
 aHa8gzcajTpADW81pimNx8UxwO4j1726ZNvmB0F3HkmFE4CJD6ttPYgTzlSaYfxtVNZhukkpCD
 G46J1ofuZQPlwu1NKs0TBQATJh0jrfO1LeCAxRF3znOaoAH6Jf1y3irrkcFue7P7NvAAfPCQsh
 nwAjA3i7Ke4m4/9HXfeSytDu6G7RfZLJLikguH7z7tWHtC0fGncJyCQZUidRpSkcvlP1/V40N/
 Fhc=
X-SBRS: None
X-MesageID: 30625594
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,445,1596513600"; d="scan'208";a="30625594"
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: [PULL 0/1] xen queue 2020-11-02
Date: Mon, 2 Nov 2020 14:44:53 +0000
Message-ID: <20201102144454.995592-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=anthony.perard@citrix.com; helo=esa1.hc3370-68.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 09:48:45
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to: Anthony PERARD <anthony.perard@citrix.com>
From: Anthony PERARD via <qemu-devel@nongnu.org>

The following changes since commit 2c6605389c1f76973d92b69b85d40d94b8f1092c:

  Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20201101.0' into staging (2020-11-02 09:54:00 +0000)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20201102

for you to fetch changes up to 045b1d4dbb44da67f1f86efa75b02843c0e951ef:

  xen: rework pci_piix3_xen_ide_unplug (2020-11-02 11:56:55 +0000)

----------------------------------------------------------------
xen patch

- Rework Xen disk unplug to work with newer command line
  options.

----------------------------------------------------------------
Anthony PERARD (1):
      xen: rework pci_piix3_xen_ide_unplug

 hw/ide/piix.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

