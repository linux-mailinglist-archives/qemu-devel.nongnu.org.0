Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689683FEDB8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:24:41 +0200 (CEST)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLlln-0007Ts-7u
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f83df00900816476cca41bb536e4d532b297d76e@lizzy.crudebyte.com>)
 id 1mLlFp-0000pW-Dn
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:51:40 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <f83df00900816476cca41bb536e4d532b297d76e@lizzy.crudebyte.com>)
 id 1mLlFn-0006qs-Gm
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:51:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=E0XQugDAKJtuz5puPoYs5SWOYs/FlsZ113QoE5YQUk0=; b=aGZLC
 2Yetp3PHjYn35WBi3nRSt/feTaREHFdsGJ9leUhmitT5zBcWn80IkUCkzFOmsvQ1ClHqZO5KD4js1
 iLnqOOgxSlk8wS6RGLR/BzQxq/SW3NAHrERmmyTqt8Qg8DXSpSB3cqVx2v7/xER0R4FLoSssjFbsP
 ttjsPGMxmK9DOgWIDB9M5spn+PYy1kVo4iz/25D0KY0JswDa7ccD0WJx2ciR6YxhwSPmBbS74SjZ3
 Pk1OVWPnjeNXCC0X8qDqM94397GXatSd0cxQvpfX/Ez+nOi5cNF4eWLPBfDi2pePUmxqitJn+xa3k
 fVn4CEMFPikeGJesNjlPAiDG/JyNQ==;
Message-Id: <cover.1630582967.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 02 Sep 2021 13:42:47 +0200
Subject: [PULL 0/3] 9p queue 2021-09-02
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=f83df00900816476cca41bb536e4d532b297d76e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 59a89510b62ec23dbeab8b02fa4e3526e353d8b6:

  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-09-01-1' into staging (2021-09-02 08:51:31 +0100)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20210902

for you to fetch changes up to f83df00900816476cca41bb536e4d532b297d76e:

  9pfs: fix crash in v9fs_walk() (2021-09-02 13:26:22 +0200)

----------------------------------------------------------------
9pfs: misc patches

* Fix an occasional crash when handling 'Twalk' requests.

* Two code cleanup patches.

----------------------------------------------------------------
Christian Schoenebeck (3):
      hw/9pfs: avoid 'path' copy in v9fs_walk()
      hw/9pfs: use g_autofree in v9fs_walk() where possible
      9pfs: fix crash in v9fs_walk()

 hw/9pfs/9p.c   | 15 +++++++--------
 hw/9pfs/coth.h |  4 +++-
 2 files changed, 10 insertions(+), 9 deletions(-)

