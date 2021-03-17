Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79FB33F0E4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:10:50 +0100 (CET)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVwn-0006SJ-SH
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMVvJ-0005an-Gy
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:09:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMVvH-0004Gx-Pt
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615986554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZP9hWOCMObFvrBuDSNyfH5w21qCWfRoNuFS3Nz6Efo=;
 b=cAQqe61W7OQBAQjFpoOMEOUbVBEhzZn9xtjSbZ+cNJgKIuGsQcSqF5bKgvkBxIzgo01G6w
 3eW68Whxns8Qc6BtSyADP2NHcESzS6/5QZG3LGnXYFQU28uH70L4w1XA1I41Yd89yepNfu
 DkoMAuJlhqWg76QuJoBOJ30fnmgaCps=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-lCDJOZbyO6Kqt7rAskZ1iQ-1; Wed, 17 Mar 2021 09:09:13 -0400
X-MC-Unique: lCDJOZbyO6Kqt7rAskZ1iQ-1
Received: by mail-wr1-f70.google.com with SMTP id z17so18370272wrv.23
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ZP9hWOCMObFvrBuDSNyfH5w21qCWfRoNuFS3Nz6Efo=;
 b=bli2NHojwXIBPKhdNWCgMya+7m8J++3iWUTqdh/8xgHksTbyAi3FrWlE+FHb9UEEuD
 eK2L/IAdus1Z5i8bMjU3qQONAbUqfZ1l6XI3XlwXNv5HTMWOgXnyOEHRq94QVF5lJGOL
 wIQYHjq2W779Pd6e9DCNTMZEKr0ORjNqbwB8j9vmovL4qQ+hLDj1V5xRRJ+aJ6pn7C4T
 bitahR4Envx1bNSnvaYZ9H16MMIkZ/m/s3usofXRFfq/S0PLbFYo7INr9fS/TRit9YI7
 UmijzLyDlCZDA1ox0tCiIT5TWZ88smsyCwC5L+b+pg5K+6fh4JGLkXFY4zfivF78zmhR
 r8AQ==
X-Gm-Message-State: AOAM533ICHMbRGX204rOl2zSVqY9sSOzfmZyagKA3Rj8YjR/od4IW9A6
 fDhPLFr0BeR97/e//xeMdm1mpufDSeRPxWeUV2WZC/bGGluNhRB1YbE9IiMKgJ4x+AIjEIoqbX0
 zor3z+ByXTfkdXEI=
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr4364163wrs.241.1615986552162; 
 Wed, 17 Mar 2021 06:09:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFesakAoO0qZ7Tzr5mGR1+eBMBus1Nk812NAa4KBXhrwT+jgG9idXgXKf7JuEbcHmYNop7gw==
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr4364127wrs.241.1615986551842; 
 Wed, 17 Mar 2021 06:09:11 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 1sm2448357wmj.2.2021.03.17.06.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 06:09:11 -0700 (PDT)
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
 <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
 <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
 <CAFEAcA_zYaOXw5yaXWEjgBy6YeTpB5FRBCO96To-bv9xpQzbMQ@mail.gmail.com>
 <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4fbceae2-7a0f-49cc-3a91-e4fa6be8c6af@redhat.com>
Date: Wed, 17 Mar 2021 14:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Gavin Shan <gshan@redhat.com>, Luc Michel <luc@lmichel.fr>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, avocado-devel <avocado-devel@redhat.com>,
 Shan Gavin <shan.gavin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Beraldo

On 3/17/21 1:54 PM, Andrew Jones wrote:
> On Wed, Mar 17, 2021 at 11:14:56AM +0000, Peter Maydell wrote:
>> On Wed, 17 Mar 2021 at 10:59, Gavin Shan <gshan@redhat.com> wrote:
>>>
>>> Hi Peter,
>>>
>>> On 3/17/21 9:40 PM, Peter Maydell wrote:
>>>> On Wed, 17 Mar 2021 at 10:37, Gavin Shan <gshan@redhat.com> wrote:
>>>>> On 3/17/21 8:09 PM, Peter Maydell wrote:
>>>>>> On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
>>>>>>>
>>>>>>>    static const VMStateDescription vmstate_pl011 = {
>>>>>>>        .name = "pl011",
>>>>>>>        .version_id = 2,
>>>>>>>        .minimum_version_id = 2,
>>>>>>> +    .post_load = pl011_post_load,
>>>>>>>        .fields = (VMStateField[]) {
>>>>>>>            VMSTATE_UINT32(readbuff, PL011State),
>>>>>>>            VMSTATE_UINT32(flags, PL011State),
>>>>>>> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
>>>>>>>            VMSTATE_INT32(read_trigger, PL011State),
>>>>>>>            VMSTATE_END_OF_LIST()
>>>>>>>        },
>>>>>>> -    .subsections = (const VMStateDescription * []) {
>>>>>>> -        &vmstate_pl011_clock,
>>>>>>> -        NULL
>>>>>>> -    }
>>>>>>>    };
>>>>>>
>>>>>> Doesn't dropping the subsection break migration compat ?
>>>>>>
>>>>>
>>>>> It's why this patch needs to be backported to stable branches.
>>>>> In that way, we won't have migration compatible issue.
>>>>
>>>> No, migration has to work from the existing already
>>>> shipped 5.1, 5.2, etc releases to 6.0 (assuming you use
>>>> the correct "virt-5.2" &c versioned machine type.)
>>>>
>>>
>>> Commit aac63e0e6ea3 ("hw/char/pl011: add a clock input") is merged
>>> to v5.2.0. The migration failure happens during migration from v6.0
>>> to v5.1 with machine type as "virt-5.1", instead of migrating from
>>> v5.1 to v6.0. One question is if we need support backwards migration?
>>
>> Upstream doesn't care about backwards migration. AIUI
>> RedHat as a downstream care about the backwards-migration
>> case in some specific situations, but I don't know if that
>> would include this one.
> 
> Right, we do prefer to be able to support "ping-pong" migrations. For
> example, if we start a virt-5.1 machine on a 5.1 build of QEMU, and then
> migrate it to a 5.2 build of QEMU, we'd like to also be able to go back
> to the 5.1 build.
> 
> I agree this patch is not the right approach. I think the right approach
> is to introduce a compat property and make the "new" section dependent
> on it. And then update the hw_compat_* arrays. Gavin, please take a look
> at "Connecting subsections to properties" of docs/devel/migration.rst.
> 
> I'm also curious what the state of mach-virt's machine types are for
> migration. It'd be nice to exhaustively test both forward migration of
> all machine types and ping-pong migrations of all machine types.

FYI this test has been suggested to the Avocado team few times.
They might already have a ticket to track any progress.

> We can
> then consider each issue we find (the pessimist in me suggests we'll find
> more than this pl011 issue) and how/if we want to resolve them.


