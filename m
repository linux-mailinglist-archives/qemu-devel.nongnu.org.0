Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A3D3656F1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:57:26 +0200 (CEST)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYo4L-0003qJ-Le
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYntJ-0004kP-LE
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lYntG-00012P-Sw
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618915554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VrRlOLqL+egLgP6+Ay0HwWT+JD0UdzVq2cUtZ1gv2E=;
 b=Cnj4LxtVQ7+aSmHXanBBDbvcEzwOK7+R8oVGOBwd1pGvYaXTS2KffTFKvawdcMA+5vqJHw
 5Yw3tak3X6FXdmG13bqnZlGQyX29hOz6A/UYY88112yF4f3JNbxk9v1v9WeChgcx1lRqcS
 cpfWXryMFCB8LKKPltYcpvw3O/gTgdo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-18d8y-xBMeimFlORI65bcQ-1; Tue, 20 Apr 2021 06:45:52 -0400
X-MC-Unique: 18d8y-xBMeimFlORI65bcQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 y13-20020adfdf0d0000b02901029a3bf796so10689972wrl.15
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0VrRlOLqL+egLgP6+Ay0HwWT+JD0UdzVq2cUtZ1gv2E=;
 b=XxGzDRSm5cQxNjVwErGmUh8ALTL+jRy3shxoU64uML8RqGOm/BZ0qn3huCATdyv9PC
 1XO+2tP/VOtcwd02tUGgRR4rXqNSWiOzVc/ZTcXzT/3kQOCxdkJM2yu2lSTf3jfIfYQB
 e2vqsXtHThpaijI6MNt18lzgv/coprPrJKT/YBtqzaPzcThoVI8roDNViVirppRBSweN
 DkJe+ts8gSTPVaVZ6N3gbEI1Y1NPXk6i0pXJPVfZOC5R4XAB0fnRr6BpEjPidO4s8ch6
 8j+bQajnLN3dYdfetM+CmcZJ2RF2ZQIhYBwvkmXMwCUKqXH5YbDkFuyZ0/mZ6dZavBjw
 zaSA==
X-Gm-Message-State: AOAM533aPQkOG3995i+f4+NZvDZ6TUNiLfJf6Kq3Om6Ek+sYSjffREMx
 U4YKmeWinwQz1uqpboOliX8OKYpcRBZwsJkldTBFC3+nvPh1H3yi7iUvmLyaBH8VYpEH+g9oGep
 wvJsePQ7/xxIlLr0=
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr3953776wmk.112.1618915551624; 
 Tue, 20 Apr 2021 03:45:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKCL3/Cy3teniNVq2HSNW4uHrbwSdcYGFiA8qC64r0oHGvAvVhRLt2dwHfBOg/tazCxrTfog==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr3953759wmk.112.1618915551436; 
 Tue, 20 Apr 2021 03:45:51 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q7sm14304696wrr.62.2021.04.20.03.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 03:45:51 -0700 (PDT)
Subject: Re: [PATCH v5 04/14] softmmu/memory: Pass ram_flags to
 qemu_ram_alloc_from_fd()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210413091421.7707-1-david@redhat.com>
 <20210413091421.7707-5-david@redhat.com>
 <83201a21-7f05-88dd-abc7-59576bce2fe9@redhat.com>
 <6ab168bd-113c-6fcb-658a-70f71aca4ab0@redhat.com>
 <063387fa-0123-5260-dfb5-caf482dfcd05@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <32d08d3a-1c81-10a1-31d5-1db842c85535@redhat.com>
Date: Tue, 20 Apr 2021 12:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <063387fa-0123-5260-dfb5-caf482dfcd05@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 12:36 PM, David Hildenbrand wrote:
> On 20.04.21 12:18, Philippe Mathieu-Daudé wrote:
>> Hi David,
>>
>> On 4/20/21 11:52 AM, Philippe Mathieu-Daudé wrote:
>>> On 4/13/21 11:14 AM, David Hildenbrand wrote:
>>>> Let's pass in ram flags just like we do with
>>>> qemu_ram_alloc_from_file(),
>>>> to clean up and prepare for more flags.
>>>>
>>>> Simplify the documentation of passed ram flags: Looking at our
>>>> documentation of RAM_SHARED and RAM_PMEM is sufficient, no need to be
>>>> repetitive.
>>>>
>>>> Reviewed-by: Peter Xu <peterx@redhat.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>   backends/hostmem-memfd.c | 7 ++++---
>>>>   hw/misc/ivshmem.c        | 5 ++---
>>>>   include/exec/memory.h    | 9 +++------
>>>>   include/exec/ram_addr.h  | 6 +-----
>>>>   softmmu/memory.c         | 7 +++----
>>>>   5 files changed, 13 insertions(+), 21 deletions(-)
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>
>> Actually it would be clearer to define the 0 value, maybe:
>>
>> #define RAM_NOFLAG     (0 << 0)
>>
> 
> This will also turn some code into
> 
> ram_flags = backend->share ? RAM_SHARED : RAM_NOFLAG;
> ram_flags |= backend->reserve ? RAM_NOFLAG : RAM_NORESERVE;

This is the callee view, withing the API, where you have all
the context.

> Looking at other flag users, I barely see any such usage.
> XKB_CONTEXT_NO_FLAGS, ALLOC_NO_FLAGS, and MEM_AFFINITY_NOFLAGS seem to
> be the only ones. That's why I tend to not do it unless there are strong
> opinions.

I'm more concerned about the caller perspective. What means this
magic '0' in the arguments? Then I have to check the prototype.
If the caller uses RAM_NO_FLAGS, I directly understand what is passed.

Anyway my comment fits the usual "can be cleaned later" case.

Thanks,

Phil.


