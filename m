Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381F621C0E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:39:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTVB-0000co-9L; Tue, 08 Nov 2022 13:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osTV9-0000bs-Ri; Tue, 08 Nov 2022 13:39:11 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osTV8-000131-21; Tue, 08 Nov 2022 13:39:11 -0500
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 9365760881;
 Tue,  8 Nov 2022 21:38:57 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 uMHtpzDO39-csNObH4L; Tue, 08 Nov 2022 21:38:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667932736; bh=gOy4jM1JLAZWrUgoqAmpokNDM2jYj3zmKKsL7MnP+WI=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=TUpWWOwlbOyqpJ+Oh0qA64Rg1R9KY99lndWu6alLT1dxV1fKuvJo80bHxKVJSzBaT
 qfWXvHeBBKNSmQ0KTB+G/DjITUDPHLgCwM12vhTggVk/VqE65AzA0boot3J2KrXUI3
 4VUt0jmoCsH9yhwxbUnpm2WUaJDyin6ovpPUU9iQ=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <e06f3e3a-ffde-a891-4c6c-06f35d11ef2c@yandex-team.ru>
Date: Tue, 8 Nov 2022 21:38:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 03/17] migration: Block migration comment or code is
 wrong
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-4-avihaih@nvidia.com>
 <0950214f-167a-9176-0ae3-15518d4e9d5a@yandex-team.ru>
In-Reply-To: <0950214f-167a-9176-0ae3-15518d4e9d5a@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/8/22 21:36, Vladimir Sementsov-Ogievskiy wrote:
> On 11/3/22 19:16, Avihai Horon wrote:
>> From: Juan Quintela <quintela@redhat.com>
>>
>> And it appears that what is wrong is the code. During bulk stage we
>> need to make sure that some block is dirty, but no games with
>> max_size at all.
> 
> :) That made me interested in, why we need this one block, so I decided to search through the history.
> 
> And what I see? Haha, that was my commit 04636dc410b163c "migration/block: fix pending() return value" [1], which you actually revert with this patch.
> 
> So, at least we should note, that it's a revert of [1].
> 
> Still that this will reintroduce the bug fixed by [1].
> 
> As I understand the problem is (was) that in block_save_complete() we finalize only dirty blocks, but don't finalize the bulk phase if it's not finalized yet. So, we can fix block_save_complete() to finalize the bulk phase, instead of hacking with pending in [1].
> 
> Interesting, why we need this one block, described in the comment you refer to? Was it an incomplete workaround for the same problem, described in [1]? If so, we can fix block_save_complete() and remove this if() together with the comment from block_save_pending().
> 

PS: Don't we want to deprecate block migration? Is it really used in production?  block-mirror is a recommended way to migrate block devices.

-- 
Best regards,
Vladimir


