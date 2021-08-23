Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3DF3F4385
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 05:02:32 +0200 (CEST)
Received: from localhost ([::1]:49214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI0EJ-0003Fc-0P
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 23:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mI0CB-0001IG-BP
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 23:00:19 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mI0C8-0001pk-EB
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 23:00:19 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GtH5k4LP5zYsX4;
 Mon, 23 Aug 2021 10:59:38 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 11:00:08 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 11:00:08 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <libvir-list@redhat.com>
Subject: [PATCH v2 0/3] docs/about: some documentation clean-up/fix
Date: Mon, 23 Aug 2021 11:00:02 +0800
Message-ID: <20210823030005.165668-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Cornelia
 Huck <cohuck@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series makes some clean-up and fix for docs/about, including removing
the duplicated section, unifying the subject format, and adding the missed
release record in the subject.

v1->v2:
- update the commit message, combined with Cornelia's comment
- add the missing release record in the subject (patch #3)
- v1: https://lore.kernel.org/qemu-devel/20210820015628.173532-1-wangyanan55@huawei.com/

Yanan Wang (3):
  docs/about: Remove the duplicated doc
  docs/about: Unify the subject format
  docs/about: Add the missing release record in the subject

 docs/about/deprecated.rst       | 56 ++++++++++++++++-----------------
 docs/about/removed-features.rst | 45 ++++++++++----------------
 2 files changed, 44 insertions(+), 57 deletions(-)

-- 
2.19.1


