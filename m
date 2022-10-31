Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8290613251
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 10:14:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQsG-0004Ye-57; Mon, 31 Oct 2022 05:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsD-0004YS-7F
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:25 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1opQsA-0000GI-Uq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:14:24 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 780F3DA08F3;
 Mon, 31 Oct 2022 10:14:19 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 6C5CE46001C; Mon, 31 Oct 2022 10:14:19 +0100 (CET)
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [PULL 0/4] Patches for Windows
Date: Mon, 31 Oct 2022 10:14:02 +0100
Message-Id: <20221031091406.382872-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 75d30fde55485b965a1168a21d016dd07b50ed32:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-10-30 15:07:25 -0400)

are available in the Git repository at:

  https://gitlab.com/stweil/qemu.git tags/pull-qemu-20221031

for you to fetch changes up to 588fec8a4c3fe9e0d1cb3f7ea6fdd46221e42814:

  block/nfs: Fix 32-bit Windows build (2022-10-31 10:06:11 +0100)

----------------------------------------------------------------
Patches for Windows

----------------------------------------------------------------
Bin Meng (4):
      scripts/nsis.py: Drop the unnecessary path separator
      scripts/nsis.py: Fix destination directory name when invoked on Windows
      scripts/nsis.py: Automatically package required DLLs of QEMU executables
      block/nfs: Fix 32-bit Windows build

 block/nfs.c     |  8 ++++++++
 meson.build     |  1 +
 scripts/nsis.py | 60 +++++++++++++++++++++++++++++++++++++++++++++++----------
 3 files changed, 59 insertions(+), 10 deletions(-)

