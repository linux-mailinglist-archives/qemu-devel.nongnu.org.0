Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490382D7252
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 09:55:57 +0100 (CET)
Received: from localhost ([::1]:35148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kneDU-0000xI-8e
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 03:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kneC3-0000QR-4p
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:54:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kneC1-0004Cw-Em
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 03:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607676864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gw2NO1rqmnj3c+de8JlMOa+Sgc9+mjMojGCaZSSiC4c=;
 b=SAYA4gAF/hWczqhj3JQE+4k7+jz7r3gsr4VPUdKV2IBf1Y3FHAzpUNvoC1xSL5Doxfdd6c
 FP3tb86flPFLhxCfwiyjKhky2qde/oYakGDl8KuWrwfXRAvtqNpBbueswrNDesg9CmCfwb
 13gFJ1YpppTygPrU/FYJ+HVxWTCSiyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-q7Y1FNbyNoWz5hV8Zkz4_g-1; Fri, 11 Dec 2020 03:54:20 -0500
X-MC-Unique: q7Y1FNbyNoWz5hV8Zkz4_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B1A510054FF;
 Fri, 11 Dec 2020 08:54:19 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5766D5B4D1;
 Fri, 11 Dec 2020 08:54:12 +0000 (UTC)
Subject: Re: [PATCH v14 05/13] qapi: create BlockdevOptionsCor structure for
 COR driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-6-vsementsov@virtuozzo.com>
 <e3621773-9000-31e6-5f41-9a7bfd5ccbbe@redhat.com>
 <42e4cd28-e073-b8d6-4853-ddf3a47dec59@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <e8c8b0a0-f764-7f5a-6adc-9deded872794@redhat.com>
Date: Fri, 11 Dec 2020 09:54:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <42e4cd28-e073-b8d6-4853-ddf3a47dec59@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10.12.20 19:30, Vladimir Sementsov-Ogievskiy wrote:
> 10.12.2020 20:43, Max Reitz wrote:
>> I don’t like this patch’s subject very much, because I find the 
>> implementation of the @bottom option to be more noteworthy than the 
>> addition of the QAPI structure.
>>
>>
>> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>
>>> Create the BlockdevOptionsCor structure for COR driver specific options
>>> splitting it off form the BlockdevOptionsGenericFormat. The only option
>>> 'bottom' node in the structure denotes an image file that limits the
>>> COR operations in the backing chain.
>>> We are going to use the COR-filter for a block-stream job and will pass
>>> a bottom node name to the COR driver. The bottom node is the first
>>> non-filter overlay of the base. It was introduced because the base node
>>> itself may change due to possible concurrent jobs.
>>>
>>> Suggested-by: Max Reitz <mreitz@redhat.com>
>>> Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>    [vsementsov: fix bdrv_is_allocated_above() usage]
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   qapi/block-core.json | 21 +++++++++++++++-
>>>   block/copy-on-read.c | 57 ++++++++++++++++++++++++++++++++++++++++++--
>>>   2 files changed, 75 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index 8ef3df6767..04055ef50c 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -3942,6 +3942,25 @@
>>>     'data': { 'throttle-group': 'str',
>>>               'file' : 'BlockdevRef'
>>>                } }
>>> +
>>> +##
>>> +# @BlockdevOptionsCor:
>>> +#
>>> +# Driver specific block device options for the copy-on-read driver.
>>> +#
>>> +# @bottom: the name of a non-filter node (allocation-bearing layer) 
>>> that limits
>>> +#          the COR operations in the backing chain (inclusive).
>>
>> This seems to me like something’s missing.  Perhaps technically there 
>> isn’t, but “limits the COR operations” begs the question (to me) 
>> “Limits them in what way?” (to which the answer is: No data below 
>> @bottom is copied).
>>
>> Could you make it more verbose?  Perhaps something like “The name of a 
>> non-filter node (allocation-bearing layer) that limits the COR 
>> operations in the backing chain (inclusive), so that no data below 
>> this node will be copied by this filter”?
> 
> Sounds good for me.
> 
>>
>>> +#          For the block-stream job, it will be the first non-filter 
>>> overlay of
>>> +#          the base node. We do not involve the base node into the COR
>>> +#          operations because the base may change due to a concurrent
>>> +#          block-commit job on the same backing chain.
>>
> 
> I now see that paragraph conflicts with further introduce of "bottom" 
> for stream job itself. I think it may be safely dropped. It's a wrong 
> place to describe how block-stream works.
> 
>> I think the default behavior should be mentioned here somewhere, i.e. 
>> that no limit is applied, so that data from all backing layers may be 
>> copied.
> 
> agree
> 
>>
>>> +#
>>> +# Since: 5.2
>>
>> *6.0
>>
>>> +##
>>> +{ 'struct': 'BlockdevOptionsCor',
>>> +  'base': 'BlockdevOptionsGenericFormat',
>>> +  'data': { '*bottom': 'str' } }
>>> +
>>>   ##
>>>   # @BlockdevOptions:
>>>   #
>>
>> [...]
>>
>>> diff --git a/block/copy-on-read.c b/block/copy-on-read.c
>>> index 618c4c4f43..67f61983c0 100644
>>> --- a/block/copy-on-read.c
>>> +++ b/block/copy-on-read.c
>>
>> [...]
>>
>>> @@ -51,7 +56,17 @@ static int cor_open(BlockDriverState *bs, QDict 
>>> *options, int flags,
>>>           ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>>>               bs->file->bs->supported_zero_flags);
>>> +    if (bottom_node) {
>>> +        bottom_bs = bdrv_lookup_bs(NULL, bottom_node, errp);
>>> +        if (!bottom_bs) {
>>> +            error_setg(errp, "Bottom node '%s' not found", 
>>> bottom_node);
>>> +            qdict_del(options, "bottom");
>>> +            return -EINVAL;
>>> +        }
>>
>> Should we verify that bottom_bs is not a filter, as required by the 
>> schema?
>>
> 
> yes, thanks for the catch!
> 
> 
> Hmm.. Interesting, we don't freeze the backing chain in cor filter open. 
> And I think we shouldn't. But then, bottom node may disappear. We should 
> handle it without a crash.
> 
> I suggest:
> 
> 1. document, that if bottom node disappear from the backing chain of the 
> filter, it continues to work like without any specified "bottom" node
> 
> 2. do bdrv_ref/bdrv_unref of bottom_bs, to not work with dead pointer
> 
> 3. check in cor_co_preadv_part() is bottom_bs is still in backing chain 
> or not

Hm, right.

Alternatively, we could also freeze the chain until the bottom node and 
then allow changing the @bottom node through reopen.  Then it would have 
to be manually unset before the bottom node is allowed to disappear from 
the chain.

Would freezing the chain pose a problem?

Max


