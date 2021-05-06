Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5732374F7D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:43:47 +0200 (CEST)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXje-0004Do-Qx
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXiR-0003Zn-Mk
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:42:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXiO-0003oV-MT
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620283347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/3yhCG4GGyE4XmYdHDLNwYVR35GFb19r+0DDPuFGM8=;
 b=hVncA0iWb0oq1HS69GUQmyt2kmPqlB+6rHuAd6G4vKaWpLPPRWZ5VyIh4sH8EDGDWCRKYg
 Jeak26tW8JEIuBaaOAFGHou+CWxD69fZ6A5xJddqbOHA2Ypm8k6aFx8tL8+9KMARXVRzrj
 992ZcbZ8DWWpq+s9b4jG6TV7AzvNIOI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-nPZPlLS1Pe-hGxNBJyCUxw-1; Thu, 06 May 2021 02:42:26 -0400
X-MC-Unique: nPZPlLS1Pe-hGxNBJyCUxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so975780wmc.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 23:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/3yhCG4GGyE4XmYdHDLNwYVR35GFb19r+0DDPuFGM8=;
 b=XVqHlomWsQ1aI1oDn18wUUa0xlqM+YXkWDBP0vpUOYvedKq9/6z7WJTufYTJey4Kf6
 WoBPYGTNQ7JIPnHHhYxXYDdg0WZ9iEXhYkXB3e50c2nufkJNGaxaqZVu2ooIGRtcPlIs
 S1HFn5xpwXw4OP0A2HFqreCJXC0ZJPvqGuuuJos/ui4ygq5Jeb4U7rSOWJuX+JTQJ2cM
 NOm62Wv5f3BqBUCSBzE8gwyDVoQXClkZGjU7l0ghQVCvoQAPo7CzGFdIS+2b7/epoQKL
 e0c/sg56heqo3bq7waHQ/tYl2qe1WOB3SpcylL5+BM8byob0KJGccMrzBmiyiOOj7KuA
 Q6RA==
X-Gm-Message-State: AOAM5329XVKKWfsDdpDpuL/zuTGnwHDD/oVwxAgHD97u0UKwu9BOzCIo
 Cj5Ib+zNiwytJ7EjY3ArgK9JNNeGTh9PD0x/k2vBWQFjn8XQzjdM32flDEy6JwqHkV+gyBp5qTP
 WXLBEfkFIinh6h/E=
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr2313858wmh.42.1620283345059;
 Wed, 05 May 2021 23:42:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfiSr0VkHg1TyrS/lUewjP0l3hM7qXmEcT9hgWOyKjek+Yx6yQMD/AXMFlcwG7Let2AyK1ag==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr2313825wmh.42.1620283344860;
 Wed, 05 May 2021 23:42:24 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id g19sm1867689wme.48.2021.05.05.23.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 23:42:24 -0700 (PDT)
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
To: Keith Busch <kbusch@kernel.org>, Eric Blake <eblake@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
 <20210505212238.GA1186879@dhcp-10-100-145-180.wdc.com>
 <285e17d3-93fb-7317-8aba-689fda772f84@redhat.com>
 <c72ab9cd-e958-ee21-ef18-bd84c9dfd39c@redhat.com>
 <20210506021556.GA1187168@dhcp-10-100-145-180.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <43f60568-6fa2-0fd4-5672-48e5b767de80@redhat.com>
Date: Thu, 6 May 2021 08:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506021556.GA1187168@dhcp-10-100-145-180.wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 4:15 AM, Keith Busch wrote:
> On Wed, May 05, 2021 at 06:09:10PM -0500, Eric Blake wrote:
>> On 5/5/21 5:07 PM, Philippe Mathieu-Daudé wrote:
>>> +Eric
>>>
>>> On 5/5/21 11:22 PM, Keith Busch wrote:
>>>> On Wed, May 05, 2021 at 11:10:31PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
>>>>> a constant! Help it by using a definitions instead.
>>>>
>>>> I don't understand.
>>>
>>> Neither do I TBH...
>>>
>>>> It's labeled 'const', so any reasonable compiler
>>>> will place it in the 'text' segment of the executable rather than on the
>>>> stack. While that's compiler specific, is there really a compiler doing
>>>> something bad with this? If not, I do prefer the 'const' here if only
>>>> because it limits the symbol scope ('static const' is also preferred if
>>>> that helps).
>>>
>>> Using: gcc version 10.2.1 20201125 (Red Hat 10.2.1-9) (GCC)
>>>
>>> Both static+const / const trigger:
>>>
>>> hw/block/nvme.c: In function ‘nvme_map_sgl’:
>>> hw/block/nvme.c:818:5: error: ISO C90 forbids variable length array
>>> ‘segment’ [-Werror=vla]
>>>   818 |     NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
>>>       |     ^~~~~~~~~~~~~~~~~
>>> cc1: all warnings being treated as errors
>>
>> C99 6.7.5.2 paragraph 4:
>> "If the size is an integer constant expression and the element type has
>> a known constant size, the array type is not a variable length array
>> type; otherwise, the array type is a variable length array type."
>>
>> 6.6 paragraph 6:
>> "An integer constant expression shall have integer type and shall only
>> have operands that are integer constants, enumeration constants,
>> character constants, sizeof expressions whose results are integer
>> constants, and floating constants that are the immediate operands of
>> casts. Cast operators in an integer constant expression shall only
>> convert arithmetic types to integer types, except as part of an operand
>> to the sizeof operator."
>>
>> Notably absent from that list are 'const int' variables, which even
>> though they act as constants (in that the name always represents the
>> same value), do not actually qualify as such under C99 rules.  Yes, it's
>> a pain.  What's more, 6.6 paragraph 10:
>>
>> "An implementation may accept other forms of constant expressions."
>>
>> which means it _should_ be possible for the compiler to do what we want.
>>  But just because it is permitted does not make it actually work. :(
> 
> Thank you, that makes sense. In this case, we are talking about an
> integer constant expression for the value of a 'const' symbol. That
> seems like perfect fodder for a compiler to optimize. I understand it's
> not obligated to do that, but I assumed it would.
> 
> Anyway, Philippe, I have no objection if you want to push forward with
> this series.

Thanks both. I'll amend Eric explanation in the commit description.

Regards,

Phil.


