Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F52DCB69
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 04:47:36 +0100 (CET)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpkGN-00022g-1V
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 22:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kpkER-0001X8-3x; Wed, 16 Dec 2020 22:45:35 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kpkEO-0004TF-Ej; Wed, 16 Dec 2020 22:45:34 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CxHtM0kw0zM5X7;
 Thu, 17 Dec 2020 11:44:27 +0800 (CST)
Received: from [10.108.234.244] (10.108.234.244) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 11:45:09 +0800
To: <alex.bennee@linaro.org>, <peter.maydell@linaro.org>
References: 
Subject: Re:[PATCH v2 0/5] Fix some style problems in contrib
From: "zhouyang (T)" <zhouyang789@huawei.com>
Message-ID: <f82ef80a-e3d9-0514-d238-f1b454b32c93@huawei.com>
Date: Thu, 17 Dec 2020 11:44:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.234.244]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhouyang789@huawei.com; helo=szxga05-in.huawei.com
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
Cc: qemu-trivial@nongnu.org, "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 qemu-devel@nongnu.org, hunongda <hunongda@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kindly ping

>v1 -> v2:
>Changed the "From:" and "Signed-off-by:" lines from "zhouyang (T)"
>to my real name "zhouyang".
>
>I found some style problems while check the code using checkpatch.pl
>and fixed them, please review.
>
>zhouyang (5):
>  contrib: Don't use '#' flag of printf format
>  contrib: Fix some code style problems, ERROR: "foo * bar" should be
>    "foo *bar"
>  contrib: Add spaces around operator
>  contrib: space required after that ','
>  contrib: Open brace '{' following struct go on the same line
>
> contrib/ivshmem-server/main.c |  2 +-
> contrib/plugins/hotblocks.c   |  2 +-
> contrib/plugins/hotpages.c    |  2 +-
> contrib/plugins/howvec.c      | 19 +++++++++----------
> contrib/plugins/lockstep.c    |  6 +++---
> 5 files changed, 15 insertions(+), 16 deletions(-)
>
>--
>2.23.0


