Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2E426538
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 09:29:25 +0200 (CEST)
Received: from localhost ([::1]:53208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYkJo-0007UH-73
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 03:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYkH1-0005eR-J4
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 03:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYkGy-0004me-Cp
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 03:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633677986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o5Fc2VV5g+s6Rv/OsPLK+WK8DrwD7Bqx3ZguLwAztts=;
 b=gtw8REK4hWVRO69wBkQVclcmbATAx7Ez6mjN+6RcKIX8L2bwrh55bgkCOaLAeyljG9Gz4z
 1qbJasC/tMTvo1mLMhVBC/9bhRw9OorwsfF7WSCMfOlrp8I7JWgSyGyz5xI+Cpah/XuUJJ
 /M1ad1HPbnxBtaNJTppr/f936L1JjMY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-fYunH5YuPsuYdXAEMTAceA-1; Fri, 08 Oct 2021 03:26:25 -0400
X-MC-Unique: fYunH5YuPsuYdXAEMTAceA-1
Received: by mail-ed1-f71.google.com with SMTP id
 v9-20020a50d849000000b003db459aa3f5so5750291edj.15
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 00:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o5Fc2VV5g+s6Rv/OsPLK+WK8DrwD7Bqx3ZguLwAztts=;
 b=MC9zrn4CrdaeDp0S4wyOFR5UUiUH40o5GmqDtVtMTRCaiEWnKTrfQpBD101m6y2qvl
 l5fZjds1c16EXSM26og3zpNp+z/nft/gvhZL0hvagQBqeLfXRvWmd6UqJEfBrr9POM9Z
 PJebAogff/bEWvt2QOaR+v/6FsD17zU361A3rJqv+EkmXQrFL89d7IRadNjA/VCjJgOh
 5t/JRG9sjjDQAfsXkKDA9FQnAkzanaqAc46/qIm8kv2pZAkp/24XHHAAOfbJfd8dPHb9
 P3QBq5eF2xQUKPGVwNIeuBMuYmQ/z/QWMEy6D4OGIPm+KxNT/MyvntT2gE1ya4UGybjZ
 b33A==
X-Gm-Message-State: AOAM532dWsFUqYwwfGo6Sbjy5kVyTSYxjI94JbwLi3gSS3tKDAdRsraN
 aZPqqE/DeiYe5AMkRRk6PumLXtXkbeFrexZNlV2k7IgmQHb3WzrO5zxSQ5fdjqtVdfUN55Ix8Gr
 7NolTg0bZGNW/ClOKlEUIuVn/V+hYJI9PcSPUKRyAPImF7r3Z5lcw7iz+kSVv9aHHGcg=
X-Received: by 2002:a17:906:942:: with SMTP id
 j2mr2260001ejd.303.1633677983668; 
 Fri, 08 Oct 2021 00:26:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFxoZqeFC3gu6SoAHklSPNXwINJaqrTwn3336FNAHESgDtXihi76G1/qtLvJLEgCpfBJmrjQ==
X-Received: by 2002:a17:906:942:: with SMTP id
 j2mr2259957ejd.303.1633677983331; 
 Fri, 08 Oct 2021 00:26:23 -0700 (PDT)
Received: from localhost.localdomain ([213.55.224.75])
 by smtp.gmail.com with ESMTPSA id l25sm663236eda.36.2021.10.08.00.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 00:26:22 -0700 (PDT)
Subject: Re: [RFC PATCH v2 04/25] include/block/block: split header into I/O
 and global state API
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-5-eesposit@redhat.com> <YV7db8LeJfp0v775@redhat.com>
 <YV7vwBNSWTQGXOB6@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <7b37f097-8f91-d8c2-f813-a0ce896da2d8@redhat.com>
Date: Fri, 8 Oct 2021 09:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV7vwBNSWTQGXOB6@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/10/2021 15:01, Stefan Hajnoczi wrote:
> On Thu, Oct 07, 2021 at 12:43:43PM +0100, Daniel P. Berrangé wrote:
>> On Tue, Oct 05, 2021 at 10:31:54AM -0400, Emanuele Giuseppe Esposito wrote:
>>> Similarly to the previous patch, split block.h
>>> in block-io.h and block-global-state.h
>>>
>>> block-common.h contains the structures shared between
>>> the two headers, and the functions that can't be categorized as
>>> I/O or global state.
>>
>> This is nice from a code organization POV, but it doesn't do all
>> that much from a code reviewer / author POV as I doubt anyone
>> will remember which header file the respective APIs/structures/
>> constants are in, without having to look it up each time.

Another thing to consider is with regards the function pointers API 
split I do in patches 19-25. There we don't even have a file separation,
so if someone misses the head comment separating I/O from GS, a new 
function can end up under the wrong API.

Maybe as Stefan suggests below we can at least split the function 
pointers in two separate structs, with bdrv_state_* and bdrv_io_* struct 
naming conventions.

But anyways thank you for the suggestions, I will add them to my TODO list.

Emanuele

>>
>> It would make life easier if we had distinct namning conventions
>> for APIs/struct/contsants in the respective headers.
>>
>> eg instead of  "bdrv_" have "bdrv_state_" and "bdrv_io_" as
>> the two naming conventions for -global-state.h and -io.h
>> respectively, nad only use the bare 'bdrv_' for -common.h
>>
>> Yes, this would be major code churn, but I think it'd make
>> the code clearer to understand which will be a win over the
>> long term.
>>
>> NB, I'm not suggesting doing a rename as part of this patch
>> though. Any rename would have to be separate, and likely
>> split over many patches to make it manageable.
> 
> Yes. Taking it one step further, BlockDriverState could be split into
> two struct so that I/O code doesn't even have access to the struct
> needed to invoke GS APIs. This is a type-safe way of enforcing the API
> split.
> 
> Unfortunately that's a lot of code churn and I think the separation is
> not very clean. For example, block drivers need to forward requests to
> their children, so they need to traverse the graph (which we think of as
> global state).
> 
> Stefan
> 


