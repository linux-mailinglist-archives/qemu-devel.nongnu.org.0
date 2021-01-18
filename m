Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F562F97D2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:19:07 +0100 (CET)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1K8I-0001jA-Kf
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1K7Q-0001Ir-8Y
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:18:12 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l1K7N-0002fq-Lc
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:18:12 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DJwQ50V6Pzl6Gc;
 Mon, 18 Jan 2021 10:16:29 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 18 Jan 2021 10:17:44 +0800
To: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
From: shiliyang <shiliyang@huawei.com>
Subject: [PATCH V4 0/4] bsd-user: Fix some code style problems
Message-ID: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
Date: Mon, 18 Jan 2021 10:17:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=shiliyang@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series fixes error style problems found by checkpatch.pl.

V3->V4:
Fix code style problems with branch bsd-user-rebase-3.1.

V2->V3:
Make the patch into a series.

V1->V2:
Add cover letter message.
Fix some style error in patch file before.

Liyang Shi (4):
  bsd-user: "foo * bar" should be "foo *bar"
  bsd-user: suspect code indent for conditional statements
  bsd-user: do not use C99 // comments
  bsd-user: space required after semicolon

 bsd-user/bsdload.c |  4 ++--
 bsd-user/elfload.c | 32 ++++++++++++++++----------------
 bsd-user/mmap.c    | 25 +++++++++++++------------
 3 files changed, 31 insertions(+), 30 deletions(-)

-- 
2.29.1.59.gf9b6481aed

