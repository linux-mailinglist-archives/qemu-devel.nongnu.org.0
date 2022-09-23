Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77595E7AF5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:39:12 +0200 (CEST)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obhxX-0000OL-6L
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obhQy-00042o-9B
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obhQv-00010E-Es
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663934724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UlmmKlS+Nqd5l5N+XOo9RbLBuMDrkZwwBhzhMmV9Lds=;
 b=AQQk6jJAS7T5LQBQvgf+8d/AezGlivp6RxckExsxs5w0khTWeQ3VQePrTGu+5mZbSw8Hnw
 5FNhQTydmQBtmY2WUqphkAouNlZtlxptSB8ehHq8f143YusjgCl30Vl9xZFKz786UqOb5z
 JyilQ9x6Bn7YWI94IHLRJouT0BgDpnk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-mPLZkzdyO5KS5yq5FdwJWw-1; Fri, 23 Sep 2022 08:05:22 -0400
X-MC-Unique: mPLZkzdyO5KS5yq5FdwJWw-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so3533393wmb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 05:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UlmmKlS+Nqd5l5N+XOo9RbLBuMDrkZwwBhzhMmV9Lds=;
 b=7ahREqnxLkCk7eCUTV4kM89zUiqD9tH+uUxLGTQjx2KlZgmTZj+nrMuZcEM9scRNvq
 dAKhFQy+QbMa4QABA4PiR6z/Pny82KtutWFor4lJcsXMN50BAVnWRA70doOerDUaovvT
 toDUmTm9qjV2PKg+wuVx3S8Y6zdA6mYAl9alp8cb8stAGu5b68TJhxSK2y8li6Fl7rFs
 ncfMe0Btb5JIYqI3lKj5kbcriu0eGI3uJzn9gdPv606Lu8ZnX1BNjKYenLDeKGiYwVqY
 skNMEuX6y6mLqvR4AXvKNKjCKCPn8cgGfOI8qXo9qbXHe1+g/bFg8we50+W2VapTOvpR
 ZnwQ==
X-Gm-Message-State: ACrzQf2TDiXcwFME3fijEw0goBshuzC9DxekSSFqbVDu4U4ogPL6qAt/
 n7UuHIx8evMwlDwuT3CgbOj3Ww7dxk7PVUrDWAsWHyrkKnLwob0BE11FXSMxjdWTa2Uxa+NwJXh
 PjY9S0aSxDQtHVe4=
X-Received: by 2002:a05:600c:898:b0:3b4:8110:7fab with SMTP id
 l24-20020a05600c089800b003b481107fabmr12246599wmp.19.1663934721567; 
 Fri, 23 Sep 2022 05:05:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oLzUZlUGXIbagG6j8W/K2LxZBd/pCP/80270jJx5Z4I3xeRZ1XydtCv8aN3pNS5hmVC0/iw==
X-Received: by 2002:a05:600c:898:b0:3b4:8110:7fab with SMTP id
 l24-20020a05600c089800b003b481107fabmr12246582wmp.19.1663934721369; 
 Fri, 23 Sep 2022 05:05:21 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de.
 [109.43.179.37]) by smtp.gmail.com with ESMTPSA id
 c9-20020adffb09000000b0022a3517d3besm7542929wrr.5.2022.09.23.05.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 05:05:20 -0700 (PDT)
Message-ID: <c2116731-be09-f4c9-2ccc-8d0d6095e880@redhat.com>
Date: Fri, 23 Sep 2022 14:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <98dcb657-8862-5868-3979-55fc49864904@redhat.com>
 <e8041184-cfdd-d429-0377-db6b46d4d0ef@redhat.com>
 <6bf799d5-18a1-f01c-b227-a7dc98c2c8cf@redhat.com>
 <Yy16Mz7+yLCV5jH8@zx2c4.com>
 <e6fad3bc-66e9-faea-194c-30277c0aa90f@redhat.com>
 <CAHmME9r+s_kBb2vyWe5xqtMd6NCbe=O8sH2=T2r15ZFU=bcKvA@mail.gmail.com>
 <bcd4e3c8-268d-139b-a1a6-0a2e11bd1986@redhat.com>
 <CAHmME9rRa1qXV4tE=vhE0CTryfqYpp_2xgUCKB5bRzmjMhNqZA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAHmME9rRa1qXV4tE=vhE0CTryfqYpp_2xgUCKB5bRzmjMhNqZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 23/09/2022 13.46, Jason A. Donenfeld wrote:
> Hi David,
> 
> On Fri, Sep 23, 2022 at 1:35 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> On 23.09.22 13:19, Jason A. Donenfeld wrote:
>>> On Fri, Sep 23, 2022 at 12:47 PM David Hildenbrand <david@redhat.com> wrote:
>>>> You must be fortunate if "one afternoon" is not a significant time
>>>> investment. For me it is a significant investment.
>>>
>>> For me too, to say the least of the multiple afternoons I've spent on
>>> this patch set. Getting back to technical content:
>>>
>>>> and sort out the remaining issues. I thought we (Thomas included) had an
>>>> agreement that that's the way we are going to do it. Apparently I was wrong.
>>>> Most probably I lived in the kernel space too long such that we don't
>>>> rush something upstream. For that reason *I* sent out a patch with
>>>> Here I am, getting told by Thomas that we now do it differently now.
>>>> What I really tried to express here is: if Thomas wants to commit things
>>>> differently now, maybe he can just separate the cleanup parts. I really
>>>> *don't want* to send out a multi-patch series to cleanup individual
>>>> parts -- that takes significantly more time. Especially not if something
>>>> is not committed yet.
>>>
>>> To recap what's been fixed in your v8.1, versus what's been refactored
>>> out of style preference:
>>>
>>> 1) It handles the machine versioning.
>>> 2) It throws an exception on length alignment in KIMD mode:
>>> +    /* KIMD: length has to be properly aligned. */
>>> +    if (type == S390_FEAT_TYPE_KIMD && !QEMU_IS_ALIGNED(len, 128)) {
>>> +        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>> +    }
>>> 3) It asserts if type is neither KIMD vs KLMD, with:
>>> +    g_assert(type == S390_FEAT_TYPE_KIMD || type == S390_FEAT_TYPE_KLMD);
>>>
>>
>> One important part is
>>
>> 4) No memory modifications before all inputs were read
> 
> Ahhh, which v8's klmd doesn't do, since it updates the parameter block
> before doing the last block. Is this a requirement of the spec? If
> not, then it doesn't matter. But if so, v8's approach is truly
> hopeless, and we'd be remiss to not go with your refactoring that
> accomplishes this.

Ok, great, if you're fine with the rework, I'll go with David's v8.1 
instead. (keeping an entry on my TODO list to rework that ugly generic "msa" 
helper function one day - this really kept me being confused for much of my 
patch review time)

  Thomas


