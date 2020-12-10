Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9742D63F0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:48:14 +0100 (CET)
Received: from localhost ([::1]:33978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knQ33-0003oW-6i
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knPz0-000267-UQ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1knPyy-0006cN-Dj
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607622237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvRugQ2vZYh7KPEoUIRH7EV7CLXtVyLdPmyQ3SrwY78=;
 b=cyFuvnIR6QAGYvMr0mN8J+HG3boqpBJ3C49pw7KUoIdgNdFCQlkAbOHQbBD7Tdf2ugykQ7
 EwFWuWUozMbOQKf0Ol4MPs6AePsr/uSioyESvQc7F5H1sx1wbwXeSb1Qiv6UHiFuBVSPEB
 GqWWWl1NTb5LWy3t4r0+DGN79C0vQNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-gADnXVVTMNu-lQxK3j48KQ-1; Thu, 10 Dec 2020 12:43:56 -0500
X-MC-Unique: gADnXVVTMNu-lQxK3j48KQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9466C1005513;
 Thu, 10 Dec 2020 17:43:53 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-58.ams2.redhat.com
 [10.36.115.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 806605D9DD;
 Thu, 10 Dec 2020 17:43:47 +0000 (UTC)
Subject: Re: [PATCH v14 05/13] qapi: create BlockdevOptionsCor structure for
 COR driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-6-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e3621773-9000-31e6-5f41-9a7bfd5ccbbe@redhat.com>
Date: Thu, 10 Dec 2020 18:43:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204220758.2879-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I don’t like this patch’s subject very much, because I find the 
implementation of the @bottom option to be more noteworthy than the 
addition of the QAPI structure.


On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> Create the BlockdevOptionsCor structure for COR driver specific options
> splitting it off form the BlockdevOptionsGenericFormat. The only option
> 'bottom' node in the structure denotes an image file that limits the
> COR operations in the backing chain.
> We are going to use the COR-filter for a block-stream job and will pass
> a bottom node name to the COR driver. The bottom node is the first
> non-filter overlay of the base. It was introduced because the base node
> itself may change due to possible concurrent jobs.
> 
> Suggested-by: Max Reitz <mreitz@redhat.com>
> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>    [vsementsov: fix bdrv_is_allocated_above() usage]
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json | 21 +++++++++++++++-
>   block/copy-on-read.c | 57 ++++++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 75 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 8ef3df6767..04055ef50c 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -3942,6 +3942,25 @@
>     'data': { 'throttle-group': 'str',
>               'file' : 'BlockdevRef'
>                } }
> +
> +##
> +# @BlockdevOptionsCor:
> +#
> +# Driver specific block device options for the copy-on-read driver.
> +#
> +# @bottom: the name of a non-filter node (allocation-bearing layer) that limits
> +#          the COR operations in the backing chain (inclusive).

This seems to me like something’s missing.  Perhaps technically there 
isn’t, but “limits the COR operations” begs the question (to me) “Limits 
them in what way?” (to which the answer is: No data below @bottom is 
copied).

Could you make it more verbose?  Perhaps something like “The name of a 
non-filter node (allocation-bearing layer) that limits the COR 
operations in the backing chain (inclusive), so that no data below this 
node will be copied by this filter”?

> +#          For the block-stream job, it will be the first non-filter overlay of
> +#          the base node. We do not involve the base node into the COR
> +#          operations because the base may change due to a concurrent
> +#          block-commit job on the same backing chain.

I think the default behavior should be mentioned here somewhere, i.e. 
that no limit is applied, so that data from all backing layers may be 
copied.

> +#
> +# Since: 5.2

*6.0

> +##
> +{ 'struct': 'BlockdevOptionsCor',
> +  'base': 'BlockdevOptionsGenericFormat',
> +  'data': { '*bottom': 'str' } }
> +
>   ##
>   # @BlockdevOptions:
>   #

[...]

> diff --git a/block/copy-on-read.c b/block/copy-on-read.c
> index 618c4c4f43..67f61983c0 100644
> --- a/block/copy-on-read.c
> +++ b/block/copy-on-read.c

[...]

> @@ -51,7 +56,17 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
>           ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>               bs->file->bs->supported_zero_flags);
>   
> +    if (bottom_node) {
> +        bottom_bs = bdrv_lookup_bs(NULL, bottom_node, errp);
> +        if (!bottom_bs) {
> +            error_setg(errp, "Bottom node '%s' not found", bottom_node);
> +            qdict_del(options, "bottom");
> +            return -EINVAL;
> +        }

Should we verify that bottom_bs is not a filter, as required by the schema?

Max


