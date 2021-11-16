Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9867F452F0B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:26:43 +0100 (CET)
Received: from localhost ([::1]:48590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmvfm-0001hu-6T
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:26:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmve6-0000Ny-2V
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:24:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmve3-00007n-Jj
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637058294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYCBT50pM1+aT4AefYskWbZE4kPs8+pGZB1BpqRuuss=;
 b=QtZhsXRMgT+oDUXwq74046gC4ayWqaqMWmEwMDxlC0X7AhQFz7mRszFj9wlNXvWP2J5jUi
 8wrVsnqPiPcnJpDj4pXpLDKLP/WJBTO2Dbs+3hDp/vH7YA6rwC0wdaTBac4kj0j879Jmnb
 jR2QIMVEqktHVjvld12n3LxSS2I77AY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-jDBpEDgWOeytbOl_uxN59g-1; Tue, 16 Nov 2021 05:24:50 -0500
X-MC-Unique: jDBpEDgWOeytbOl_uxN59g-1
Received: by mail-wr1-f72.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so4392860wrb.11
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 02:24:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYCBT50pM1+aT4AefYskWbZE4kPs8+pGZB1BpqRuuss=;
 b=IyWcX3ynun8wB+BRddRmS9OzPMqYWkLVTvovp4U24g8DCvW7/uGRRDD4bmodsUMmaj
 tS9uNOHZUau6ljM/YPS1uotLuQx723pqivh9qi3RV99cqRQsTu+ly4Y2YuT71icAc7sq
 nOaHSGYq3z6lcMqs1I70FpX2ZDt9LnhMvStDPMKba+Vsdr0Kh8ei/tspRao3MIusI656
 KZBWWylifo3YV4v5gvxIcsj87BPVtRM/xYALfpjs24i017ptC6Te6rSWsXYCL8jTB+ie
 /eSDJq/X0m0msxOU4CIT6Fx4J6fcgByAwObQaGjTbkk9N1YX5Sq2pwJb7yOA48MpDLag
 dOJA==
X-Gm-Message-State: AOAM530RimOgGv4DOJzotqIn5huLktl+ZrNIKDuhC6uGnJAkdUpUmRuJ
 ZVMwZjCdERA7Ml3WjEXRBSZIfF61ALUjfPh4LI9OSx299XekpfK0GC6islbV8HiJabGbAP2JF+e
 mZ1So0Zv4yf/exJ4=
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr6333990wmq.155.1637058289689; 
 Tue, 16 Nov 2021 02:24:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyX+vFT1NJQkIyPUKrIYD73xp9L8CmErtFhvW0Sqig8SV/oagnXj/TQzyXyfC+plpNsYPycLA==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr6333942wmq.155.1637058289382; 
 Tue, 16 Nov 2021 02:24:49 -0800 (PST)
Received: from [192.168.149.186]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id d7sm16692443wrw.87.2021.11.16.02.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:24:49 -0800 (PST)
Message-ID: <74c3db67-50bd-bc1f-3977-108615ac402e@redhat.com>
Date: Tue, 16 Nov 2021 11:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 06/25] include/block/block_int: split header into I/O
 and global state API
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-7-eesposit@redhat.com>
 <3f91c9e4-fac9-f03c-a8a3-5940ac49434b@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <3f91c9e4-fac9-f03c-a8a3-5940ac49434b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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



On 12/11/2021 13:17, Hanna Reitz wrote:
> On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
>> Similarly to the previous patch, split block_int.h
>> in block_int-io.h and block_int-global-state.h
>>
>> block_int-common.h contains the structures shared between
>> the two headers, and the functions that can't be categorized as
>> I/O or global state.
>>
>> Assertions are added in the next patch.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   blockdev.c                             |    5 +
>>   include/block/block_int-common.h       | 1164 +++++++++++++++++++
>>   include/block/block_int-global-state.h |  319 +++++
>>   include/block/block_int-io.h           |  163 +++
>>   include/block/block_int.h              | 1478 +-----------------------
>>   5 files changed, 1654 insertions(+), 1475 deletions(-)
>>   create mode 100644 include/block/block_int-common.h
>>   create mode 100644 include/block/block_int-global-state.h
>>   create mode 100644 include/block/block_int-io.h
> 
> [...]
> 
>> diff --git a/include/block/block_int-common.h 
>> b/include/block/block_int-common.h
>> new file mode 100644
>> index 0000000000..79a3d801d2
>> --- /dev/null
>> +++ b/include/block/block_int-common.h
> 
> [...]
> 
>> +struct BlockDriver {
> 
> [...]
> 
>> +    /**
>> +     * Try to get @bs's logical and physical block size.
>> +     * On success, store them in @bsz and return zero.
>> +     * On failure, return negative errno.
>> +     */
>> +    /* I/O API, even though if it's a filter jumps on parent */
> 
> I don’t understand this...
> 
>> +    int (*bdrv_probe_blocksizes)(BlockDriverState *bs, BlockSizes *bsz);
>> +    /**
>> +     * Try to get @bs's geometry (cyls, heads, sectors)
>> +     * On success, store them in @geo and return 0.
>> +     * On failure return -errno.
>> +     * Only drivers that want to override guest geometry implement this
>> +     * callback; see hd_geometry_guess().
>> +     */
>> +    /* I/O API, even though if it's a filter jumps on parent */
> 
> ...or this comment.  bdrv_probe_blocksizes() and bdrv_probe_geometry() 
> are in block-global-state.h, so why are these methods part of the I/O 
> API?  (And I’m afraid I can’t parse “even though if it’s a filter jumps 
> on parent”.)
>

Ok this is weird. This comment should not have been there, please ignore 
it. It was just a note for myself while I was doing one the the many 
pass to split all these functions. This is not I/O and as you probably 
have already seen, I did not put in I/O. Also patch 19 takes care of the 
function pointers in BlockDriver, not this (but you discovered it already).

Apologies.

Emanuele

> Hanna
> 
>> +    int (*bdrv_probe_geometry)(BlockDriverState *bs, HDGeometry *geo);
> 


