Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E93C4616
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 10:43:04 +0200 (CEST)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2rWo-0002R1-W6
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 04:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rVk-0001c2-42
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:41:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1m2rVh-0007zX-3u
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 04:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626079311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvNUFOlJEPXaNu/r47bV5L/W3fUGYfmBKpdh+sE9tUc=;
 b=d8+nBeeYXNcr1mZB6mrRv/J36cGTCBijCPRcw3/GRjnNDXPw16/50m8tlIyG56VF+qdTnk
 5H3acwiIdYA/OEXxz015LEKgw1fS2kPYRAmHwYnmRpu5O/zposEuNY/1xE0REJjgnKC4pv
 07CqGqMN2585IFYPWYH+WfcFwiw+04w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-5CQD1h6HOBKtNVmBLJSgpg-1; Mon, 12 Jul 2021 04:41:50 -0400
X-MC-Unique: 5CQD1h6HOBKtNVmBLJSgpg-1
Received: by mail-ej1-f71.google.com with SMTP id
 u12-20020a17090617ccb029051ab3a0d553so493408eje.6
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 01:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gvNUFOlJEPXaNu/r47bV5L/W3fUGYfmBKpdh+sE9tUc=;
 b=reR+fA7DXYdUAHQch9yq/3RuBeXUa0L5T18UkH59ZHijpWGc3sPPFi4/xVeAE9Im9y
 y1SHYaEzM5j2H0BcYiJvGu95+UCGeEYKY+3Fah9fxTWEFZGWQSAixW5c7MgH6U3Ewm5T
 R4O0FmHq8ow7EZNVP/VF/OXTqJW0lkMMZcJ+gZ5ZF6zOyRDPvWQpba9rn/0YcHAjQNKI
 n43BCiCqcNXCa7T7BBj2G2lo329rTd5iSf/E7CSJ1iXaT2iO/bw/SOvE9AH0a+1TMclx
 PA6K8vRYr9MYznmSvAAUz66SxieTW2rhLJBZ+8fa7QLlNdOULycQllz3uLWy8m20HaOZ
 F2UA==
X-Gm-Message-State: AOAM532URs9qJTwMsp+o30plRNUVqRKTICoISqJw5807b7Z+famMf0wB
 nltxux1yN2QdRH2BK5eMBZRKwogHEvbOGmvMwVjlj2O6hV//3GIFtUgKA8iWRFENa1dcNUy2W6s
 8fRcHHLcJ0R8udMw=
X-Received: by 2002:a05:6402:111a:: with SMTP id
 u26mr62852664edv.260.1626079308894; 
 Mon, 12 Jul 2021 01:41:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKJZJJ++sO0lHk/pN0rHJOurqW8JyljTH8bmUOYUync7WEiu/fE3hMWVVg5QOf+cV/cZJKqQ==
X-Received: by 2002:a05:6402:111a:: with SMTP id
 u26mr62852637edv.260.1626079308715; 
 Mon, 12 Jul 2021 01:41:48 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 l26sm7557374edt.40.2021.07.12.01.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:41:48 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
To: Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
 <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
Date: Mon, 12 Jul 2021 10:41:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.631, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 08/07/2021 15:04, Stefan Hajnoczi wrote:
> On Thu, Jul 08, 2021 at 01:32:12PM +0200, Paolo Bonzini wrote:
>> On 08/07/21 12:36, Stefan Hajnoczi wrote:
>>>> What is very clear from this patch is that it
>>>> is strictly related to the brdv_* and lower level calls, because
>>>> they also internally check or even use the aiocontext lock.
>>>> Therefore, in order to make it work, I temporarly added some
>>>> aiocontext_acquire/release pair around the function that
>>>> still assert for them or assume they are hold and temporarly
>>>> unlock (unlock() - lock()).
>>>
>>> Sounds like the issue is that this patch series assumes AioContext locks
>>> are no longer required for calling the blk_*()/bdrv_*() APIs? That is
>>> not the case yet, so you had to then add those aio_context_lock() calls
>>> back in elsewhere. This approach introduces unnecessary risk. I think we
>>> should wait until blk_*()/bdrv_*() no longer requires the caller to hold
>>> the AioContext lock before applying this series.
>>
>> In general I'm in favor of pushing the lock further down into smaller and
>> smaller critical sections; it's a good approach to make further audits
>> easier until it's "obvious" that the lock is unnecessary.  I haven't yet
>> reviewed Emanuele's patches to see if this is what he's doing where he's
>> adding the acquire/release calls, but that's my understanding of both his
>> cover letter and your reply.
> 
> The problem is the unnecessary risk. We know what the goal is for
> blk_*()/bdrv_*() but it's not quite there yet. Does making changes in
> block jobs help solve the final issues with blk_*()/bdrv_*()?

Correct me if I am wrong, but it seems to me that the bdrv_*()/blk_*() 
operation mostly take care of building, modifying and walking the bds 
graph. So since graph nodes can have multiple AioContext, it makes sense 
that we have a lock when modifying the graph, right?

If so, we can simply try to replace the AioContext lock with a graph 
lock, or something like that. But I am not sure of this.

Emanuele
> 
> If yes, then it's a risk worth taking. If no, then spending time
> developing interim code, reviewing those patches, and risking breakage
> doesn't seem worth it. I'd rather wait for blk_*()/bdrv_*() to be fully
> complete and then see patches that delete aio_context_acquire() in most
> places or add locks in the remaining places where the caller was relying
> on the AioContext lock.
> 
> Stefan
> 


