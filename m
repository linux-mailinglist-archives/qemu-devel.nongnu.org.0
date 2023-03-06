Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CD6AC222
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:03:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBQ7-00017h-Pl; Mon, 06 Mar 2023 09:02:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4224746ab=anthony.perard@citrix.com>)
 id 1pZBPj-0000wb-P3
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:02:14 -0500
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4224746ab=anthony.perard@citrix.com>)
 id 1pZBPf-0006ad-K4
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1678111323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kUxhabpuMOeaoaOWLwVmQ4tndtrFEhdcEDUSlnac/LM=;
 b=JUWWw2sguSZAiYrhx7dup62+OKiVXIZvwAQaDQoFlC4Of/fLP//VlSnu
 m5bDagTV6jzIkd0PHaJ7SnNrzvNy/Q0Tf7miykH448hOL0bidE7a+RV//
 BQyA43Vqf65tLjc3YV5iupxNOQGHqGoCM2NDYgWJIVXurS4LMh+7YnoIz I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100081120
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:3UafT6mGskcGcZlMmYNWGXPo5gzoJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWzqDbq6LNjH2LYp3YYW1oUkH7ZXSx9U2G1Zt+C81EyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5AGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 e0ddR0IcTeMu+mvzOy+U8Vgrf4SFuC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/A/
 jqWpj2jWnn2MvS/9z640FyGwdWevijeAdtLDrmp7cdD1Qj7Kms7V0RNCArTTeOColezXs8aJ
 0EK9y4Gq680+0q2CN7nUHWFTGWs50BGHYAKSqtjtV/Lk/CPi+qEOoQaZi9ENfEjq+g5eTcz2
 gGMhv/lLgZeipTAHBpx6YyohT+1PCEUK0oLaikFURYJ7rHfnW0jsv7cZo09SfDo17UZDRm1m
 mnX93Zm293/mOZRj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 lBexKByD8hUV/lhcRBhp81cdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 x+L5VoLucIPYSfCgUpLj2WZUZlC8EQdPY69CqC8giRmOfCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS9yNEiT9xLvH711+eZylkgDKZb7GciTI+KPjeDPOxZ4iN4tbDOzUwzOxPrc/FSIr
 Y8CZpPiJtc2eLSWXxQ7OLU7dTgiRUXXz7io8KS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:9jY78anudXlR8Fh7FZ2AUhifVSrpDfIo3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyFJwTOssJbyK
 d8Y+xfJbTLfD9HZB/BkWuF+gAbsby6zJw=
X-IronPort-AV: E=Sophos;i="5.98,238,1673931600"; d="scan'208";a="100081120"
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 0/2] xen queue
Date: Mon, 6 Mar 2023 14:00:42 +0000
Message-ID: <20230306140044.44076-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=prvs=4224746ab=anthony.perard@citrix.com;
 helo=esa1.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:

  configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20230306

for you to fetch changes up to 3856734d80fbf46683e4080117ed961f5ab1300b:

  hw/xen/xen_pt: fix uninitialized variable (2023-03-06 11:27:37 +0000)

----------------------------------------------------------------
Xen queue:

- fix for graphic passthrough with 'xenfv' machine
- fix uninitialized variable

----------------------------------------------------------------
Chuck Zmudzinski (1):
      xen/pt: reserve PCI slot 2 for Intel igd-passthru

Marek Marczykowski-Górecki (1):
      hw/xen/xen_pt: fix uninitialized variable

 hw/i386/pc_piix.c           |  1 +
 hw/xen/xen_pt.c             | 64 +++++++++++++++++++++++++++++++++++++--------
 hw/xen/xen_pt.h             | 20 ++++++++++++++
 hw/xen/xen_pt_config_init.c |  2 +-
 hw/xen/xen_pt_stub.c        |  4 +++
 5 files changed, 79 insertions(+), 12 deletions(-)

