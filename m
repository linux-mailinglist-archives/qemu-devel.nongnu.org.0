Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB44AD5DD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:54:45 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHO8y-0005q3-Lh
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHO5R-0002n3-7e
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHO5P-00028f-12
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:51:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644317462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDEF7hm5G+sdWL8PceHYUtuP8ZdpSA6n0rO8VhkmO8k=;
 b=dLYyV0VPCvc6Fl0k5JTjjddkzuNaV5nJq/W2JZjh6FNaSiXbUGgp7UDzlIbsfAp8G3hAS6
 Qdi0LS36hk/Da/vubMpU1nIgwTHlwpQBVDdN0jDSeTF/9yxibReKtDqIemJLb+T2xoL0R1
 yrcJZDk55JcuPtdRWJQMjkNa267YdSA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-I2eG7vd5M26EI8iSNm5s-w-1; Tue, 08 Feb 2022 05:50:56 -0500
X-MC-Unique: I2eG7vd5M26EI8iSNm5s-w-1
Received: by mail-qk1-f197.google.com with SMTP id
 d11-20020a37680b000000b0047d87e46f4aso10612489qkc.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dDEF7hm5G+sdWL8PceHYUtuP8ZdpSA6n0rO8VhkmO8k=;
 b=Ffr4tVhysSPu8N6cbOpUXm02k6zif8oXyk1TV6yRHbF0z+BKDNFWuRgdxsAyXVYWX0
 nrms3b5Npnhk+P2/nVHw38fEqhy/y0YdxN1Kb6/EciFQvQb5BUQ1zpBKNNY0a7RcmRPa
 7ZdegSBDp9sXgklRIpl3M8s7jZpqZ9uVtP8G7JAZXR1DezKvv3Zc45glV6LLFZm6OTuH
 f3YjSgnSWedOtzPAOlqd1BmuBgI9Ok5JLF0PZkRMOYcGs0iWbNhHqILcGgR8QC8hM2Z7
 /SNCZp1oOY41JS9zjmYyaT2UvgzWUrCKpyIcbTRn6d+qhd1J/3n3F1Wt/0giQS1YnmGn
 6bEw==
X-Gm-Message-State: AOAM531kip1PfIhjSVhqjGtbNwAic0FzOWEbJ/ZBSN2CPuMfMF7pZ9Vj
 FCy/MEV4U0mMqSSQ5C+72bfYFc3gi+ze9Q0pU6cIKs6ZXEMZVdVdNJAGxR6xAxiZ3aIahaYm0Wu
 h3pKBpWR226y3ILs=
X-Received: by 2002:a05:622a:5ce:: with SMTP id
 d14mr2423582qtb.650.1644317455641; 
 Tue, 08 Feb 2022 02:50:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtF5YTHfRE8/0I7Q6/GbPCRLTuvs7PubsMLe10sLLVqE/Q6Bhjc6Do/jnfEx38cxlavGmyRw==
X-Received: by 2002:a05:622a:5ce:: with SMTP id
 d14mr2423569qtb.650.1644317455434; 
 Tue, 08 Feb 2022 02:50:55 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id k4sm7118661qta.6.2022.02.08.02.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 02:50:55 -0800 (PST)
Message-ID: <28aca5b9-38cd-409c-e63f-3aa28cd1c0ff@redhat.com>
Date: Tue, 8 Feb 2022 11:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 02/33] include/block/block: split header into I/O and
 global state API
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-3-eesposit@redhat.com> <YfJ7pbLDuwP2hgnw@redhat.com>
 <ac8b0576-4c03-4eb6-9ef6-c0a6b20b6184@redhat.com>
 <Yff4Dl6bpHhTxAfB@redhat.com>
 <1653fd9d-e1e9-5f32-3bd1-62abecd09601@redhat.com>
 <feb30385-a222-166f-ad82-19307c980a0d@redhat.com>
 <bf72c7db-6f0a-e291-2f79-a061293dc810@redhat.com>
 <YgFOeOocta+pPE/y@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgFOeOocta+pPE/y@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 David Gibson <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/02/2022 17:53, Kevin Wolf wrote:
> Am 01.02.2022 um 11:30 hat Paolo Bonzini geschrieben:
>> On 2/1/22 10:45, Emanuele Giuseppe Esposito wrote:
>>>> That said, even if they are a different category, I think it makes sense
>>>> to leave them in the same header file as I/O functions, because I/O
>>>> functions are locked out between drained_begin and drained_end.
>>>
>>> Proposed category description:
>>> /*
>>>   * "Global OR I/O" API functions. These functions can run without
>>>   * the BQL, but only in one specific iothread/main loop.
>>>   *
>>>   * More specifically, these functions use BDRV_POLL_WHILE(bs), which
>>>   * requires the caller to be either in the main thread and hold
>>>   * the BlockdriverState (bs) AioContext lock, or directly in the
>>>   * home thread that runs the bs AioContext. Calling them from
>>>   * another thread in another AioContext would cause deadlocks.
>>>   *
>>>   * Therefore, these functions are not proper I/O, because they
>>>   * can't run in *any* iothreads, but only in a specific one.
>>>   */
>>>
>>> Functions that will surely go under this category:
>>>
>>> BDRV_POLL_WHILE
>>> bdrv_parent_drained_begin_single
>>> bdrv_parent_drained_end_single
>>> bdrv_drain_poll
>>> bdrv_drained_begin
>>> bdrv_do_drained_begin_quiesce
>>> bdrv_subtree_drained_begin
>>> bdrv_drained_end
>>> bdrv_drained_end_no_poll
>>> bdrv_subtree_drained_end
>>>
>>> (all generated_co_wrapper)
>>> bdrv_truncate
>>> bdrv_check
>>> bdrv_invalidate_cache
>>> bdrv_flush
>>> bdrv_pdiscard
>>> bdrv_readv_vmstate
>>> bdrv_writev_vmstate
>>>
>>>
>>> What I am not sure:
>>>
>>> * bdrv_drain_all_begin - bdrv_drain_all_end - bdrv_drain_all: these were
>>> classified as GS, because thay are always called from the main loop.
>>> Should they go in this new category?
>>
>> 1) They look at the list of BDS's, and 2) you can't in general be sure that
>> all BDS's are in *your* AioContext if you call them from a specific
>> AioContext.
>>
>> So they should be GS.
> 
> I agree, calling drain_all functions can only work from the main thread,
> so they are GS.
> 
>>> * how should I interpret "all the callers of BDRV_POLL_WHILE"?
>>> Meaning, if I consider also the callers of the callers, we end up
>>> covering much much more functions. Should I only consider the direct
>>> callers (ie the above)?
>>
>> In general it is safe to make a function GS even if it is potentially "GS or
>> I/O", because that _reduces_ the number of places you can call it from.
>> It's likewise safe to make it I/O-only, but probably it makes less sense.
> 
> Basically, we have a hierarchy of categories where you can always call
> functions in other categories with less restrictions, but never the
> opposite direction.

Added in the respective category documentation:
> 1. Common functions
 * These functions must never call any function from other categories
 * (I/O, "I/O or GS", Global State) except this one, but can be invoked by
 * all of them.

> 2. I/O functions
 * These functions can only call functions from I/O and common categories,
 * but can be invoked by GS, "I/O or GS" and I/O APIs.

> 3. I/O or GS functions
 * These functions can call any function from I/O, common and this
 * categories, but must be invoked only by other "I/O or GS" and GS APIs.

> 4. GS functions
 * These functions can call any function from this and other categories
 * (I/O, "I/O or GS", common), but must be invoked only by other GS APIs.

Emanuele
> 
> So common functions must never call any of the other categories. Global
> state functions can call functions in any category. And "I/O or GS"
> functions like BDRV_POLL_WHILE() can be called by other "I/O or GS" or
> just GS functions, but if it's ever (directly or indirectly) called by
> an I/O or common function, that would be a bug.
> 
> Kevin
> 


