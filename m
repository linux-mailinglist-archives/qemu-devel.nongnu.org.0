Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A9539F056
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:01:35 +0200 (CEST)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqWg2-0001vy-57
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWeh-00011c-0b
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWed-0005eh-OF
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623139206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/N3r0SgaDAiK8/sGLITjMZ16ISKDJvgIXIP6O6lXPA=;
 b=Xkh4chOeB3ktET0ApW986Q0lQZovD3VxuIYsCHA8ATBjXMI3YMIw5w0gjkzcgc/3/y3NEi
 i9OU50hHK9ybJxHR1FPDwjgSJbsX1HtU02HRMDZEiHjAqhx86FyzLitWlTU6fUlqnnDnKj
 qG25fv/dVNOwM6d2aASjptFiTwk8QCw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-C4JA_bntMaySlYRHIA24rQ-1; Tue, 08 Jun 2021 04:00:05 -0400
X-MC-Unique: C4JA_bntMaySlYRHIA24rQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so9077863wrc.16
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 01:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n/N3r0SgaDAiK8/sGLITjMZ16ISKDJvgIXIP6O6lXPA=;
 b=edvSPdQZE6UD+YThI00jjwsEgynKB4glmLsIVDS4kARisQJjR7PR2ohXsZ/t71xxgD
 LpF7YwdD/CKh/Qxwn6b3toQxeel7aL/tl8ppL4jGKOWEQsL4T8BZTCMwZ5Cobl4z50KQ
 +xHpQwpBwVtBQ5yxedkbsuB0LK4qahUcAmYcNz5xCmT1usFjVm4FcJvZaHVAF6YqDbSO
 x6MfUfsIIAzjMVSpFcvUZ1mSl66xqE5Ig+2z6HQ9thvkhLCk8aPkp/saDDXMJw7GqoXB
 JhdHaW2Iq9PObdCaNGm5uq7WxCTs/arGAIqDv4xu/OLrsSagwHWBnueR5+LJ2bsKSwA/
 Aw+w==
X-Gm-Message-State: AOAM533hrjVX5gykBr1UFGtfH1SCgc8d/JbLlPrZGhg7rakD4mMgxMwl
 zbqVkMu1Oi/4UdIr9qyfHDDe8M4wvCjkK/WCcDEn37Yo8ip7QMRyWCF9aQ17p/W5svNoxQLbQym
 IBjq8BppJ6CsHhd2JHQe5NJcespbWqijvcFh+VL7SiaASRICDwOcZUloG2xbnO2Y0C6o=
X-Received: by 2002:a05:600c:1546:: with SMTP id
 f6mr2912365wmg.47.1623139203588; 
 Tue, 08 Jun 2021 01:00:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLeuOYrSUf7EsRCW6xkTwth3PfQPqSSn6HObsIFtF1moercl0k6rSOiaRWqzRkgjseQOy6aw==
X-Received: by 2002:a05:600c:1546:: with SMTP id
 f6mr2912338wmg.47.1623139203291; 
 Tue, 08 Jun 2021 01:00:03 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 89sm20512923wrq.14.2021.06.08.01.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 01:00:02 -0700 (PDT)
Subject: Re: [PATCH v4 1/6] blkdebug: refactor removal of a suspended request
To: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-2-eesposit@redhat.com>
 <20210604161610.6we6yk2e77borfif@redhat.com>
 <b804f4ce-ff75-ba06-d3f4-fb288e38515d@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <077c6de4-26fa-6e61-3797-882aa79a0919@redhat.com>
Date: Tue, 8 Jun 2021 10:00:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b804f4ce-ff75-ba06-d3f4-fb288e38515d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/06/2021 11:23, Paolo Bonzini wrote:
> On 04/06/21 18:16, Eric Blake wrote:
>> On Fri, Jun 04, 2021 at 12:07:36PM +0200, Emanuele Giuseppe Esposito 
>> wrote:
>>> Extract to a separate function.  Do not rely on FOREACH_SAFE, which is
>>> only "safe" if the *current* node is removed---not if another node is
>>> removed.  Instead, just walk the entire list from the beginning when
>>> asked to resume all suspended requests with a given tag.
>>> -    QLIST_FOREACH_SAFE(r, &s->suspended_reqs, next, next) {
>>> +retry:
>>> +    QLIST_FOREACH(r, &s->suspended_reqs, next) {
>>>           if (!strcmp(r->tag, tag)) {
>>> +            QLIST_REMOVE(r, next);
>>
>> Isn't the whole point of using QLIST_FOREACH_SAFE the ability to call
>> QLIST_REMOVE on an element in that list while still iterating?
>>
>>>               qemu_coroutine_enter(r->co);
>>> +            if (all) {
>>> +                goto retry;
>>> +            }
>>>               return 0;
>>
>> Oh, I see - you abandon the iteration in all control flow paths, so
>> the simpler loop is still okay.  Still, this confused me enough on
>> first read that it may be worth a comment, maybe:
>>
>> /* No need for _SAFE, because iteration stops on first hit */
> 
> This is a bit confusing too because it sounds like not using _SAFE is an 
> optimization, but it's actually wrong (see commit message).
> 

What about:

/* No need for _SAFE, since a different coroutine can remove another 
node (not the current one) in this list, and when the current one is 
removed the iteration starts back from beginning anyways. */

Alternatively, no comment at all.

Thank you,
Emanuele


