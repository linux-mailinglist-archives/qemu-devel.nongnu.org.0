Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AFA40C6E3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:58:19 +0200 (CEST)
Received: from localhost ([::1]:43890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQVQY-000869-JF
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mQVO5-0006P0-Qf
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:55:47 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:4558
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1mQVNq-0006fd-NW
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:55:42 -0400
IronPort-Data: =?us-ascii?q?A9a23=3A0SxHfavcpWcyHzNjy6QRAEqkEOfnVIpcMUV32f8?=
 =?us-ascii?q?akzHdYEJGY0x3y2IcWDqDP/iCMWf1eowiOouxpxhT75KHyoU2TAA4/yFgHilAw?=
 =?us-ascii?q?SbnLY7Hdx+vZUt+DSFioHpPtpxYMp+ZRCwNZie0SiyFb/6x8BGQ6YnSHuClUL+?=
 =?us-ascii?q?dZ3gqLeNZYHxJZSxLyrdRbrFA0YDR7zOl4bsekuWHULOX82cc3lE8t8pvnChSU?=
 =?us-ascii?q?MHa41v0iLCRicdj5zcyn1FNZH4WyDrYw3HQGuG4FcbiLwrPIS3Qw4/Xw/stIov?=
 =?us-ascii?q?NfrfTeUtMTKPQPBSVlzxdXK3Kbhpq/3R0i/hkcqFHLxo/ZzahxridzP1JtI6wS?=
 =?us-ascii?q?AUoN6vklvkfUgVDDmd1OqguFLrveCHj7JbPnx2YG5fr67A0ZK0sBqUA9/p6Gyd?=
 =?us-ascii?q?L/O0UJTQJRhSCgeusx/S8UOYErt0uKdSuMI4Bt3VIyzbfAvA7B5fZTM3i6dBZ2?=
 =?us-ascii?q?D09nNxmB/vSZ8MFLzFoaXzoegBOPEsaDJsWhuqkhnDjNTZfrTqoSQAfi4TI5FU?=
 =?us-ascii?q?pluGzb5yOIZrXLfi5V32w/grul1kVyDlDXDBH9Qe4zw=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AI9q0DqABG1cRrwnlHelI55DYdb4zR+YMi2TC?=
 =?us-ascii?q?1yhKJyC9Ffbo7vxG/c5rsyMc5wxhOk3I9erhBEDEewK6yXcX2/h0AV7BZniEhI?=
 =?us-ascii?q?LAFugLhuGO/9SjIUzDH4VmuZuIHZIQNDS9NykesS/l2njEL/8QhMmA7LuzhfrT?=
 =?us-ascii?q?i1NkTQRRYalm6AtjYzzraXFedU1XA4YjDpqA6o5irzqkQ34eacO2HT0rRO7Gzu?=
 =?us-ascii?q?e77q7OUFoXAQI98gmSgXeN4L7+KRKR2RATSHdu7N4ZgBD4rzA=3D?=
X-IronPort-AV: E=Sophos;i="5.85,295,1624291200"; d="scan'208";a="114524886"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 15 Sep 2021 21:55:23 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 553724D0DC6E;
 Wed, 15 Sep 2021 21:55:20 +0800 (CST)
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 15 Sep 2021 21:55:19 +0800
Received: from [192.168.122.212] (10.167.225.141) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Wed, 15 Sep 2021 21:55:19 +0800
Subject: Re: [PULL 0/5] Migration.next patches
To: Peter Maydell <peter.maydell@linaro.org>, Juan Quintela
 <quintela@redhat.com>
References: <20210914115157.35868-1-quintela@redhat.com>
 <CAFEAcA9W-2xvnT7pWQahC8gqAg=BXZbwXNSpJytDKymWfJGU=A@mail.gmail.com>
From: "Li, Zhijian" <lizhijian@cn.fujitsu.com>
Message-ID: <5a206cea-1937-1ff5-1657-7981ddb9637f@cn.fujitsu.com>
Date: Wed, 15 Sep 2021 21:55:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9W-2xvnT7pWQahC8gqAg=BXZbwXNSpJytDKymWfJGU=A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-yoursite-MailScanner-ID: 553724D0DC6E.AC774
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


on 2021/9/14 21:19, Peter Maydell wrote:
> On Tue, 14 Sept 2021 at 12:56, Juan Quintela <quintela@redhat.com> wrote:
>> The following changes since commit c6f5e042d89e79206cd1ce5525d3df219f13c3cc:
>>
>>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210913-3' into staging (2021-09-13 21:06:15 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/juanquintela/qemu.git tags/migration.next-pull-request
>>
>> for you to fetch changes up to d634d0e7b0225f97f45cecb72ca90bd0e7bdb211:
>>
>>    migration/ram: Don't passs RAMState to migration_clear_memory_region_dirty_bitmap_*() (2021-09-14 13:45:06 +0200)
>>
>> ----------------------------------------------------------------
>> Migration Pull request (take 2)
>>
>> This pull request includes:
>> - Remove RAMState unused parameter for several prototypes (dropped)
>> - RDMA fix
>> - give an error when using RDMA and multifd
>> - Implement yank for multifd send side
>>
>> Please, Apply.
>>
> Hi; this fails to build on FreeBSD:
>
> ../src/migration/rdma.c:1146:23: error: use of undeclared identifier
> 'IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE'
>      int advice = wr ? IBV_ADVISE_MR_ADVICE_PREFETCH_WRITE :
>                        ^
> ../src/migration/rdma.c:1147:18: error: use of undeclared identifier
> 'IBV_ADVISE_MR_ADVICE_PREFETCH'
>                   IBV_ADVISE_MR_ADVICE_PREFETCH;
>                   ^
> ../src/migration/rdma.c:1150:11: warning: implicit declaration of
> function 'ibv_advise_mr' is invalid in C99
> [-Wimplicit-function-declaration]
>      ret = ibv_advise_mr(pd, advice,
>            ^
> ../src/migration/rdma.c:1151:25: error: use of undeclared identifier
> 'IBV_ADVISE_MR_FLAG_FLUSH'
>                          IBV_ADVISE_MR_FLAG_FLUSH, &sg_list, 1);
>                          ^
> 1 warning and 3 errors generated.
>
> Looking at the code, none of the proposed ways to detect
> whether the host has this function seem to have been implemented:
> did you push the wrong branch ?


Yes, this errors should be fixed in my V3 patches: [PATCH v3 0/2] enable fsdax rdma migration
And i recalled that the 1st pull request included 7 patches, 2 are deleted in this time?

Thanks
Zhijina


>
> thanks
> -- PMM
>



