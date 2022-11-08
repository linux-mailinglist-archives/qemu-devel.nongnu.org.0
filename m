Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE3621C03
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 19:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTSs-00085d-DB; Tue, 08 Nov 2022 13:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osTSp-00081Y-15; Tue, 08 Nov 2022 13:36:48 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1osTSn-0007T5-21; Tue, 08 Nov 2022 13:36:46 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 09BEF5FF7F;
 Tue,  8 Nov 2022 21:36:30 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b535::1:28] (unknown
 [2a02:6b8:b081:b535::1:28])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FAXVq93aFT-aSN0EsAh; Tue, 08 Nov 2022 21:36:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1667932589; bh=AAWxBvw+vTFVtUfxxWaz61wwtMUHpDeFnz9evPnQdCs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=RmyuK1Wa0lebRTxHshsjyt0PpjqnnRoiv93RjHX9vvsLVF8SWqLsbDBz4kYF9BH7l
 wCNRcZ/8aQIECh/ryfwd/9j81PnFX1SnR+jiRBenOiKD1x+R7V2FmjDsglkKNqPD/U
 72f91s5I3G79uam1qgdFZ6r8KFHTJcRKLcizyoYU=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <0950214f-167a-9176-0ae3-15518d4e9d5a@yandex-team.ru>
Date: Tue, 8 Nov 2022 21:36:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 03/17] migration: Block migration comment or code is
 wrong
Content-Language: en-US
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221103161620.13120-4-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

On 11/3/22 19:16, Avihai Horon wrote:
> From: Juan Quintela <quintela@redhat.com>
> 
> And it appears that what is wrong is the code. During bulk stage we
> need to make sure that some block is dirty, but no games with
> max_size at all.

:) That made me interested in, why we need this one block, so I decided to search through the history.

And what I see? Haha, that was my commit 04636dc410b163c "migration/block: fix pending() return value" [1], which you actually revert with this patch.

So, at least we should note, that it's a revert of [1].

Still that this will reintroduce the bug fixed by [1].

As I understand the problem is (was) that in block_save_complete() we finalize only dirty blocks, but don't finalize the bulk phase if it's not finalized yet. So, we can fix block_save_complete() to finalize the bulk phase, instead of hacking with pending in [1].

Interesting, why we need this one block, described in the comment you refer to? Was it an incomplete workaround for the same problem, described in [1]? If so, we can fix block_save_complete() and remove this if() together with the comment from block_save_pending().

> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   migration/block.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/block.c b/migration/block.c
> index b3d680af75..39ce4003c6 100644
> --- a/migration/block.c
> +++ b/migration/block.c
> @@ -879,8 +879,8 @@ static void block_save_pending(void *opaque, uint64_t max_size,
>       blk_mig_unlock();
>   
>       /* Report at least one block pending during bulk phase */
> -    if (pending <= max_size && !block_mig_state.bulk_completed) {
> -        pending = max_size + BLK_MIG_BLOCK_SIZE;
> +    if (!pending && !block_mig_state.bulk_completed) {
> +        pending = BLK_MIG_BLOCK_SIZE;
>       }
>   
>       trace_migration_block_save_pending(pending);

-- 
Best regards,
Vladimir


