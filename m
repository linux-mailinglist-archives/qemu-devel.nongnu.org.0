Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F45443CB6C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:02:00 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjV7-0004ak-Pc
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7e985780aaab93d2c5be9b62d8d386568dfb071e@lizzy.crudebyte.com>)
 id 1mfizb-0006SC-Vt
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:29:24 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:52823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7e985780aaab93d2c5be9b62d8d386568dfb071e@lizzy.crudebyte.com>)
 id 1mfizZ-0008Dk-Uu
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:Message-Id:References:In-Reply-To:Content-ID:
 Content-Description; bh=kvL3euASem+5VpmDilkpgw3Fqtyxt5ETY9ApBOGCvwo=; b=XHeY4
 ktoz1s3sk9XfuDZzV5aQFTD3INDoCJaomWqqdQgP9jkDToz/4oc1dE58wgJG9zn8+prvXtW7j5MUA
 BBM5hvFh1U3TIiUHobATcbx2KrrLUnv3xdDPt5LvH1XHSlGzifhwRp+A1v9PmQPN5bWNRdBN4EIZe
 pmnIqbrZdRk7yxUUNE+hNN89KLwE8JdLjWm0k9KsWn1VilMQS6h5+moq7XDETxZUY5I4gqBt9q6b5
 IoepXPfVfDz7TDl8HCxks1qmLgmBc1FwNdFx2DU7VTgUs7fklIvrtq8vzouNMwhgFJs+KowmcoaSu
 lEwjssGDexfHAzJmp3jIRTZUm1fRw==;
Message-Id: <cover.1635340713.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Oct 2021 15:18:33 +0200
Subject: [PULL 0/8] 9p queue 2021-10-27
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=7e985780aaab93d2c5be9b62d8d386568dfb071e@lizzy.crudebyte.com;
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

The following changes since commit 931ce30859176f0f7daac6bac255dae5eb21284e:

  Merge remote-tracking branch 'remotes/dagrh/tags/pull-virtiofs-20211026' into staging (2021-10-26 07:38:41 -0700)

are available in the Git repository at:

  https://github.com/cschoenebeck/qemu.git tags/pull-9p-20211027

for you to fetch changes up to 7e985780aaab93d2c5be9b62d8d386568dfb071e:

  9pfs: use P9Array in v9fs_walk() (2021-10-27 14:45:22 +0200)

----------------------------------------------------------------
9pfs: performance fix and cleanup

* First patch fixes suboptimal I/O performance on guest due to previously
  incorrect block size being transmitted to 9p client.

* Subsequent patches are cleanup ones intended to reduce code complexity.

----------------------------------------------------------------
Christian Schoenebeck (8):
      9pfs: fix wrong I/O block size in Rgetattr
      9pfs: deduplicate iounit code
      9pfs: simplify blksize_to_iounit()
      9pfs: introduce P9Array
      fsdev/p9array.h: check scalar type in P9ARRAY_NEW()
      9pfs: make V9fsString usable via P9Array API
      9pfs: make V9fsPath usable via P9Array API
      9pfs: use P9Array in v9fs_walk()

 fsdev/9p-marshal.c |   2 +
 fsdev/9p-marshal.h |   3 +
 fsdev/file-op-9p.h |   2 +
 fsdev/p9array.h    | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/9p.c       |  70 +++++++++++++----------
 5 files changed, 208 insertions(+), 29 deletions(-)
 create mode 100644 fsdev/p9array.h

