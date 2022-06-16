Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8B54DFEE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:22:30 +0200 (CEST)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1na1-0004Ye-Bn
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb@lizzy.crudebyte.com>)
 id 1o1nLQ-000782-Sy
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:25 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:39177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb@lizzy.crudebyte.com>)
 id 1o1nLP-0003Gu-1q
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=lnrttqXuCbtP/iOQy+aFwAgw3k012aPCgS+OyXDngGs=; b=hJNTX
 aXFCdECSsqm7B8x1WYHFs3l+7isdmeupXdyXcR9+uhu05IVzwexKoRAd8g+QIZWyfihSZNg+QsH16
 tR6KR1ElNxVuvURH7BrDrk9lzboK+yqFiqspKa6AfYrlVbKX+izgfbOaSQksPaA5f1xD+zq5/sv9c
 aUi5IJFtZMDfQ8ezBfEegcSmbtwRQIqnqhO3W4uVtiebDxyCsLk27Nw7y7xNB7qr3f3ptq0uBntjw
 cWXO9BYRggohmrKOZjOh6qjbOirFmC88Uyv46GWmhEcAr8iBRQA3LcIDNwzO+rdFYF0fvbdyIzZEW
 CHkaNgQtzOG3csCvuz6qV4dnmJSYw==;
Message-Id: <cover.1655377203.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 16 Jun 2022 13:00:04 +0200
Subject: [PULL 0/7] 9p queue 2022-06-16
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 9ac873a46963098441be920ef7a2eaf244a3352d:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-06-15 09:47:24 -0700)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20220616

for you to fetch changes up to 0e43495d3b4a50fc5e22f7b71261fdd5b56fdfcb:

  tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent (2022-06-16 12:44:52 +0200)

----------------------------------------------------------------
9pfs: fix 'Twalk' protocol violation

Actual fix is patch 5, whereas patch 4 being preparatory, all other
patches are test cases to guard this Twalk issue.

----------------------------------------------------------------
Christian Schoenebeck (7):
      tests/9pfs: walk to non-existent dir
      tests/9pfs: Twalk with nwname=0
      tests/9pfs: compare QIDs in fs_walk_none() test
      9pfs: refactor 'name_idx' -> 'nwalked' in v9fs_walk()
      9pfs: fix 'Twalk' to only send error if no component walked
      tests/9pfs: guard recent 'Twalk' behaviour fix
      tests/9pfs: check fid being unaffected in fs_walk_2nd_nonexistent

 hw/9pfs/9p.c                 |  63 +++++++++-----
 tests/qtest/virtio-9p-test.c | 201 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 237 insertions(+), 27 deletions(-)

