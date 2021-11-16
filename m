Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650545363D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:46:13 +0100 (CET)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn0ex-0000xf-Tr
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:46:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mn0ce-00081D-RD
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:43:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mn0ca-0006Kt-Ep
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637077419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DwvP/aJcpXuCwA1pkaNEJKGpIYyotsjgjDekEbaFOY=;
 b=GGzk0WH3jFE04wjj2kDttssl/sts+gB5rWI9uPr9TM+j9ENMRGIznRmlVBkyXgrqdXk3Di
 3taFz4RkCyl8EISHMMJaZ8tpxM6s9BxOs+1zYE9+HceXRr5xqKTeLRn+8t8tiEbaRDP+Ta
 ZTWyf19JB40D9L9zm+34ROq1U9gTXCE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-UTvtWj9qO0SCAO_-erbbLw-1; Tue, 16 Nov 2021 10:43:38 -0500
X-MC-Unique: UTvtWj9qO0SCAO_-erbbLw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so7511175wmj.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 07:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6DwvP/aJcpXuCwA1pkaNEJKGpIYyotsjgjDekEbaFOY=;
 b=tzLb7dV5OqVUNg8keq28Dny+H+GFdkAXkO5gPXeF74ztIMcrPX4lVOIH0zHaPWpzFV
 IYA11aOTvfpkJw3rUCiS4AfiwoG0B6rdnvzKCAYauxoIONq2AyjTkHHbC1Uve1NdAorv
 MKOFah2Ma1noUiIkj1AZqIMTJNxZcfjQRo8GtdyJUsWjfyJ7J+QclqdwjGVBPqd8LJKz
 zcBN1PR7zjldY5TEcZrZZlHHG/4gGMe3P114PRTbuYMZZBtYi/lhFzAz7CEH+vfRL0Ry
 dqDhFQ9usNd6vnCUoOlYuhYe6PnFUrWJRfT0h6Ra2503mlnb/ChFcmZReUUBCO/mcPkW
 O/cA==
X-Gm-Message-State: AOAM533B2Ij/AGjio5IgLcrwuW9H6Z63qOSmNV2FUN+Ia8KDU9jAGLGc
 +2o1CppAPARsUS/5AwzDixS/gWcwBzsbFKHsdFrBxyUYmvndcoItxOCHloLW7aBG0RxOziUvlsR
 lkwL3eK1aW6IlsHw=
X-Received: by 2002:a05:600c:6022:: with SMTP id
 az34mr9184728wmb.22.1637077417330; 
 Tue, 16 Nov 2021 07:43:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1Mc/D9YA/CBDNFOFR/xE3u+SYhEGyIdyqtXZT7GjNaN/+ODBbh/BkXMACayTVlaBPtmzPbA==
X-Received: by 2002:a05:600c:6022:: with SMTP id
 az34mr9184669wmb.22.1637077417039; 
 Tue, 16 Nov 2021 07:43:37 -0800 (PST)
Received: from [192.168.149.186]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id m20sm3154146wmq.11.2021.11.16.07.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 07:43:36 -0800 (PST)
Message-ID: <96f488d9-534f-5e4d-7b1d-c16c4587bd34@redhat.com>
Date: Tue, 16 Nov 2021 16:43:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 07/25] assertions for block_int global state API
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-8-eesposit@redhat.com>
 <3a330894-9276-7357-ab6d-4386151661f7@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <3a330894-9276-7357-ab6d-4386151661f7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/11/2021 14:51, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block.c                         | 17 +++++++++++++++++
>>   block/backup.c                  |  1 +
>>   block/block-backend.c           |  3 +++
>>   block/commit.c                  |  2 ++
>>   block/dirty-bitmap.c            |  1 +
>>   block/io.c                      |  6 ++++++
>>   block/mirror.c                  |  4 ++++
>>   block/monitor/bitmap-qmp-cmds.c |  6 ++++++
>>   block/stream.c                  |  2 ++
>>   blockdev.c                      |  7 +++++++
>>   10 files changed, 49 insertions(+)
>>
>> diff --git a/block.c b/block.c
>> index 672f946065..41c5883c5c 100644
>> --- a/block.c
>> +++ b/block.c
> 
> [...]
> 
>> @@ -7473,6 +7488,7 @@ static bool append_strong_runtime_options(QDict 
>> *d, BlockDriverState *bs)
>>    * would result in exactly bs->backing. */
>>   bool bdrv_backing_overridden(BlockDriverState *bs)
>>   {
>> +    assert(qemu_in_main_thread());
>>       if (bs->backing) {
>>           return strcmp(bs->auto_backing_file,
>>                         bs->backing->bs->filename);
> 
> This function is in block_int-common.h, though.

Can go as GS, since it is under BQL.

(Actually, it is only used in block.c, so if you want I can put it as 
static). Otherwise, I will just move it to GS.

I agree with the rest.

Thank you,
Emanuele

> 
> [...]
> 
>> diff --git a/block/io.c b/block/io.c
>> index c5d7f8495e..f271ab3684 100644
>> --- a/block/io.c
>> +++ b/block/io.c
> 
> [...]
> 
>> @@ -3419,6 +3423,7 @@ int coroutine_fn 
>> bdrv_co_copy_range_from(BdrvChild *src, int64_t src_offset,
>>   {
>>       trace_bdrv_co_copy_range_from(src, src_offset, dst, dst_offset, 
>> bytes,
>>                                     read_flags, write_flags);
>> +    assert(qemu_in_main_thread());
>>       return bdrv_co_copy_range_internal(src, src_offset, dst, 
>> dst_offset,
>>                                          bytes, read_flags, 
>> write_flags, true);
>>   }
> 
> This is a block_int-io.h function.
> 
>> @@ -3435,6 +3440,7 @@ int coroutine_fn bdrv_co_copy_range_to(BdrvChild 
>> *src, int64_t src_offset,
>>   {
>>       trace_bdrv_co_copy_range_to(src, src_offset, dst, dst_offset, 
>> bytes,
>>                                   read_flags, write_flags);
>> +    assert(qemu_in_main_thread());
>>       return bdrv_co_copy_range_internal(src, src_offset, dst, 
>> dst_offset,
>>                                          bytes, read_flags, 
>> write_flags, false);
>>   }
> 
> This, too.
> 
> Hanna
> 


