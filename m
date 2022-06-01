Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD253A5F9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 15:34:27 +0200 (CEST)
Received: from localhost ([::1]:58780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwOUU-0002hn-4j
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 09:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwOPS-0000Q2-Nz
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nwOPO-0000ec-VC
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 09:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654090149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z+b3FAmn8oPv1ij7VRlLlO2ybOemGY/YduHNSU7g7I=;
 b=SmuszuZhI8aai2aIBNyfOjjE92yTG7hdCTtGC7nivASp/n26YkSzLpl7t/hyXN13JjQIQs
 Enw89XRF3zDi8+wMucRlu/bxeEZQcUTr7wa57ygdjHjyZ1jYDgsR6eB0PggrjYA0aS8LKh
 bG3iDQKZDFVfinLAyjcYslOVvjfNK4A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-nzIV7WwiNp6rsxDERcLM6g-1; Wed, 01 Jun 2022 09:29:08 -0400
X-MC-Unique: nzIV7WwiNp6rsxDERcLM6g-1
Received: by mail-wm1-f70.google.com with SMTP id
 i30-20020a1c541e000000b0039c1bf9739fso905786wmb.6
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 06:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8Z+b3FAmn8oPv1ij7VRlLlO2ybOemGY/YduHNSU7g7I=;
 b=p81wPo0Lyx823tYEqFe8Gn/HtCC+YDAmW6VZvUhs/8hWfTmVnsRGSHa80BZFnWCtdI
 2WxmODXMAWTysI7rYNjDRG1biR42inVsqA96eBb/DmWUP065bj+uPz+4D+EdlWRl8AoR
 57fpKZgTvk0r1q96YH9+xqa4X/PQG8BciKQPNy/UmCV5qYziBWz3ARpmMQQbQSYihWZm
 3Ww3utPEf7l+Fd3KZ72ECoznEpgNWAsiS326D07+fEcxTiLT1MEGvJzdgve6EfUhu5Ms
 Biypt31GMCYMQl+j0s0TdBE20yY4OTYb0Nd6YzYVavQaxkBkeiHCWE6kOIjK5qZtooY0
 1tIw==
X-Gm-Message-State: AOAM533ZWTEFbBlABY5ssvm1+4jEUI7pMn4l29HpoSu1ro4hS7NLr3CX
 6ElYVARuHgN5/6Yk8yVWyVs5l/ZpraBGUuZte/P20dP7xs8en+HAR/NG1Dp8CsndJ6eGPw5Ffy5
 XKebnkOTqeY1Jc80=
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr53790062wrr.142.1654090147286; 
 Wed, 01 Jun 2022 06:29:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6C0vJsg6TmMOLzeL6V6hYJZdLVt5LVckkkZtOF8UWFHKL/RnixSdmvuq2poLuwpXN4q9PBw==
X-Received: by 2002:adf:fc01:0:b0:20c:ff9a:2c53 with SMTP id
 i1-20020adffc01000000b0020cff9a2c53mr53790043wrr.142.1654090146996; 
 Wed, 01 Jun 2022 06:29:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2600:951d:63df:c091:3b45?
 (p200300cbc7052600951d63dfc0913b45.dip0.t-ipconnect.de.
 [2003:cb:c705:2600:951d:63df:c091:3b45])
 by smtp.gmail.com with ESMTPSA id
 184-20020a1c02c1000000b0039482d95ab7sm2129791wmc.24.2022.06.01.06.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 06:29:06 -0700 (PDT)
Message-ID: <b7eff284-fb61-6a66-dd9a-893b64dd5311@redhat.com>
Date: Wed, 1 Jun 2022 15:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Tong Zhang <ztong0001@gmail.com>, Tong Zhang <t.zhang2@samsung.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Francisco Londono <f.londono@samsung.com>
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
 <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
 <CAA5qM4ARbFV_cc+R6R-q_mdv0hbmki5pK03U5XGYH7xfvEoOMQ@mail.gmail.com>
 <0b54d6c7-f56d-1ad2-80b7-d75d1033d67e@redhat.com>
 <YpdoqgpGloiPIxBk@stefanha-x1.localdomain>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YpdoqgpGloiPIxBk@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.06.22 15:24, Stefan Hajnoczi wrote:
> On Wed, Jun 01, 2022 at 10:00:50AM +0200, David Hildenbrand wrote:
>> On 01.06.22 02:20, Tong Zhang wrote:
>>> Hi David,
>>>
>>> On Mon, May 30, 2022 at 9:19 AM David Hildenbrand <david@redhat.com> wrote:
>>>>
>>>> On 27.04.22 22:51, Tong Zhang wrote:
>>>>> assert(dbs->acb) is meant to check the return value of io_func per
>>>>> documented in commit 6bee44ea34 ("dma: the passed io_func does not
>>>>> return NULL"). However, there is a chance that after calling
>>>>> aio_context_release(dbs->ctx); the dma_blk_cb function is called before
>>>>> the assertion and dbs->acb is set to NULL again at line 121. Thus when
>>>>> we run assert at line 181 it will fail.
>>>>>
>>>>>   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
>>>>>
>>>>> Reported-by: Francisco Londono <f.londono@samsung.com>
>>>>> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
>>>>> ---
>>>>>  softmmu/dma-helpers.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
>>>>> index 7820fec54c..cb81017928 100644
>>>>> --- a/softmmu/dma-helpers.c
>>>>> +++ b/softmmu/dma-helpers.c
>>>>> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
>>>>>      aio_context_acquire(dbs->ctx);
>>>>>      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>>>>>                              dma_blk_cb, dbs, dbs->io_func_opaque);
>>>>> -    aio_context_release(dbs->ctx);
>>>>>      assert(dbs->acb);
>>>>> +    aio_context_release(dbs->ctx);
>>>>>  }
>>>>>
>>>>>  static void dma_aio_cancel(BlockAIOCB *acb)
>>>>
>>>> I'm fairly new to that code, but I wonder what prevents dma_blk_cb() to
>>>> run after you reshuffled the code?
>>>>
>>>
>>> IMO if the assert is to test whether io_func returns a non-NULL value
>>> shouldn't it be immediately after calling io_func.
>>> Also... as suggested by commit 6bee44ea346aed24e12d525daf10542d695508db
>>>   >     dma: the passed io_func does not return NULL
>>
>> Yes, but I just don't see how it would fix the assertion you document in
>> the patch description. The locking change to fix the assertion doesn't
>> make any sense to me, and most probably I am missing something important :)
> 
> The other thread will invoke dma_blk_cb(), which modifies dbs->acb, when
> it can take the lock. Therefore dbs->acb may contain a value different
> from our io_func()'s return value by the time we perform the assertion
> check (that's the race).
> 
> This patch makes sense to me. Can you rephrase your concern?

The locking is around dbs->io_func().

aio_context_acquire(dbs->ctx);
dbs->acb = dbs->io_func()
aio_context_release(dbs->ctx);


So where exactly would the lock that's now still held stop someone from
modifying dbs->acb = NULL at the beginning of the function, which seems
to be not protected by that lock?

Maybe I'm missing some locking magic due to the lock being a recursive lock.

-- 
Thanks,

David / dhildenb


