Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C12654F84
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 12:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fzM-0007dP-3P; Fri, 23 Dec 2022 06:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6ca60cd7a388a776d72739e5a404e65c19460511@lizzy.crudebyte.com>)
 id 1p8fzJ-0007dF-QS
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:18 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6ca60cd7a388a776d72739e5a404e65c19460511@lizzy.crudebyte.com>)
 id 1p8fzI-0007aA-3x
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=yx967taGVM9tcgatp6wpDVZ6MPWi66B1TWkf8GEHtAw=; b=fEhuV
 h2vc9DSNJzAf4mWhMkSssKE+istLEGWFIFhsCUlwtJVjxiVlEWkCrFWni+pnY66iQqAvsUtMyMTyM
 OviMbFeHYp5DSfnCIJ4K6h/B8cDLsuXLHm8l1EbyG8MheGKkaxoYWEe37XjMz2Kw8zvhsH7BiRWCr
 Mv71CEwrXs/OdpNyFWGkca1V2MmCJw5WLoXjVKh2uZ3KtxpDgNFhSdEkbLqPmNeP3Np5XkCMF36qf
 T9LmvXm6lHdSAj+d/fQKdHcVyHNBpMazHvqPiTntqXgWXvbIWZQSCwj/oKq5iipNG9X3y0Acjc2Dc
 OdVaUITsfHzSVuoxvSkVmxESZpmvQ==;
Message-Id: <cover.1671793476.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 23 Dec 2022 12:04:36 +0100
Subject: [PULL 0/5] 9p queue 2022-12-23
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>,
    Bin Meng <bin.meng@windriver.com>,
    Markus Armbruster <armbru@redhat.com>,
    Philippe Mathieu-Daudé <philmd@linaro.org>,
    Wilfred Mallawa <wilfred.mallawa@wdc.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6ca60cd7a388a776d72739e5a404e65c19460511@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:

  Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging (2022-12-21 18:08:09 +0000)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20221223

for you to fetch changes up to 6ca60cd7a388a776d72739e5a404e65c19460511:

  hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper (2022-12-23 11:48:13 +0100)

----------------------------------------------------------------
9pfs: Windows host prep, cleanup

* Next preparatory patches for upcoming Windows host support.

* Cleanup patches.

----------------------------------------------------------------
Bin Meng (3):
      qemu/xattr.h: Exclude <sys/xattr.h> for Windows
      hw/9pfs: Drop unnecessary *xattr wrapper API declarations
      hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper

Christian Schoenebeck (1):
      MAINTAINERS: Add 9p test client to section "virtio-9p"

Greg Kurz (1):
      9pfs: Fix some return statements in the synth backend

 MAINTAINERS          |  1 +
 hw/9pfs/9p-local.c   | 32 ++++++++++++++++----------------
 hw/9pfs/9p-synth.c   | 12 ++++++------
 hw/9pfs/9p-util.h    | 26 +++++++++++---------------
 include/qemu/xattr.h |  4 +++-
 5 files changed, 37 insertions(+), 38 deletions(-)

