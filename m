Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99F2F5AC7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 07:45:04 +0100 (CET)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzwNS-0005V1-Sf
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 01:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzwLZ-0004vv-Ri
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:43:05 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzwLX-0000do-9X
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:43:05 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DGZV740c1z7VCl;
 Thu, 14 Jan 2021 14:41:51 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 14 Jan 2021 14:42:42 +0800
Subject: Re: [PATCH V3 0/4] bsd-user: Fix some code style problems
To: Warner Losh <imp@bsdimp.com>
References: <b820b729-88a8-1103-b7a7-b66b637947d9@huawei.com>
 <CANCZdfr9Fd+Ne3cGqhHfna+iAD9bwe=ScbzN1C+uads8RqJDsQ@mail.gmail.com>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <ae6378f4-e82d-c0c7-40e8-2d5ebe4f125e@huawei.com>
Date: Thu, 14 Jan 2021 14:42:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfr9Fd+Ne3cGqhHfna+iAD9bwe=ScbzN1C+uads8RqJDsQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=shiliyang@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/14 6:03, Warner Losh wrote:
> While these changes look good, can you submit this against the bsd-user repository? White space changes like this in mainline make rebasing harder than needed.
> 
> https://github.com/qemu-bsd-user/qemu-bsd-user <https://github.com/qemu-bsd-user/qemu-bsd-user> branch bsd-user-rebase-3.1and we'll make sure they get via our coming pull requests..
> 
> Warner
> 
> On Wed, Jan 13, 2021 at 2:31 AM shiliyang <shiliyang@huawei.com <mailto:shiliyang@huawei.com>> wrote:
> 
>     This patch series fixes error style problems found by checkpatch.pl <http://checkpatch.pl>.
> 
>     V2->V3:
>     Make the patch into a series.
> 
>     V1->V2:
>     Add cover letter message.
>     Fix some style error in patch file before.
> 
>     Liyang Shi (4):
>       bsd-user: "foo * bar" should be "foo *bar"
>       bsd-user: suspect code indent for conditional statements
>       bsd-user: space required after semicolon
>       bsd-user: do not use C99 // comments
> 
>      bsd-user/bsdload.c |  6 +++---
>      bsd-user/elfload.c | 38 +++++++++++++++++++-------------------
>      bsd-user/qemu.h    | 14 +++++++-------
>      bsd-user/syscall.c |  6 +++---
>      4 files changed, 32 insertions(+), 32 deletions(-)
> 
>     -- 
>     2.29.1.59.gf9b6481aed
> 
> 

OK, I get it, thanks!

Best regards.

