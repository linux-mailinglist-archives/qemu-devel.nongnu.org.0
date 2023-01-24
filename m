Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A81567940A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 10:22:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKFU7-0000j9-BI; Tue, 24 Jan 2023 04:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKFTW-0000i9-Tl
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:20:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pKFTU-00080G-TC
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674552013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2dWWSVoS42wbM/MS+WH5H0m60GGDAk2YPBnz3Z9glKs=;
 b=BQdHbduYSg20ebEwkEAw2fXU38J6kdCVI3iMuy+QrYpe8o/rxfcaUC0NVLjgB3QW5LBRmO
 MBO6L0+F7NS7SRtC7B1UmlyYEfL2ls6/WGudVLAFnQ5b7fkr07vjcmuzzvAbloMwRH+cUD
 vj8CITYRqWaZV9Gr7gyUpxT4ImWi4zQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-558-PhRgtlUhMtiOcaG-KMMtcw-1; Tue, 24 Jan 2023 04:20:12 -0500
X-MC-Unique: PhRgtlUhMtiOcaG-KMMtcw-1
Received: by mail-qk1-f198.google.com with SMTP id
 q21-20020a05620a0d9500b0070572ccdbf9so10631364qkl.10
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 01:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2dWWSVoS42wbM/MS+WH5H0m60GGDAk2YPBnz3Z9glKs=;
 b=PdySd0ABX8AV8gIjRc364w5CX/owN0RRPLFnjKWV1az3daxuXmtUQt95Zz5bpSPkyO
 a2TlahNOSTtjglgr/P5J/nbCKs+QQYIEAee1KahzQ6L+pdH4hwjOEfwxAj9vPIcMhFgU
 Dq3ek7hD2kSjqDo41BfFFMP8mm/U824cPFWV+daPfnvK97Remd0a0MHCC0FBzUKf7/2K
 KUu0mQIwcws/YEBKdvoPyrEaebJxUpzu41yniFQk4R8TF3+Z0PSgJoh5OUbsWQPZ1RVa
 GpxGKJ72kJjRJC6ojcwVqaQ68IcPO563vu9FclV149KKktz7YGkuE9ybX/DdI0YAWLp7
 8faA==
X-Gm-Message-State: AFqh2krgDye0wVOgJjHU8hX3UUhdgULOXp6N/4vxrXeNhO7uJ1DpX0Er
 veoYjPDYPVPMEkN9hbGvgs1J1MHRkuKJjbCJADmrmvPJSw3eeWfZ0dyGS66rLlQcFnZUPIq9gwZ
 jCwP8sVTOwcWZTEQ=
X-Received: by 2002:ac8:48d9:0:b0:3b6:2f49:1acc with SMTP id
 l25-20020ac848d9000000b003b62f491accmr37622966qtr.16.1674552011434; 
 Tue, 24 Jan 2023 01:20:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMtKNqWxdUeT6Crdros/vlrCAMJFLIzxSkAd1kUPmOHuOlGN98frvsRaVoduFEi3WHDZ6B5Q==
X-Received: by 2002:ac8:48d9:0:b0:3b6:2f49:1acc with SMTP id
 l25-20020ac848d9000000b003b62f491accmr37622948qtr.16.1674552011180; 
 Tue, 24 Jan 2023 01:20:11 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-158.web.vodafone.de.
 [109.43.179.158]) by smtp.gmail.com with ESMTPSA id
 c23-20020ac85197000000b003ab1ee36ee7sm908640qtn.51.2023.01.24.01.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 01:20:10 -0800 (PST)
Message-ID: <2bce671f-d91a-72ab-d38f-2e284d9d3ee2@redhat.com>
Date: Tue, 24 Jan 2023 10:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Biswapriyo Nath <nathbappai@gmail.com>
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
 <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
 <Y860hPT+o15BGQYq@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: MSYS2 and libfdt
In-Reply-To: <Y860hPT+o15BGQYq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/01/2023 17.23, Daniel P. Berrangé wrote:
> On Fri, Jan 20, 2023 at 05:57:29PM +0400, Marc-André Lureau wrote:
>> Hi Thomas
>>
>> On Fri, Jan 20, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 19/01/2023 09.56, Marc-André Lureau wrote:
>>>> Hi
>>>>
>>>> On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>>>>>
>>>>>     Hi all,
>>>>>
>>>>> in some spare minutes, I started playing with a patch to try to remove the
>>>>> dtc submodule from the QEMU git repository - according to
>>>>> https://repology.org/project/dtc/versions our supported build platforms
>>>>> should now all provide the minimum required version.
>>>>>
>>>>> However, I'm hitting a problem with Windows / MSYS2 in the CI jobs: The
>>>>> libfdt is packaged as part of the dtc package there:
>>>>>
>>>>>     https://packages.msys2.org/package/dtc
>>>>>
>>>>> ... meaning that it is added with a usr/include and usr/lib path prefix
>>>>> instead of mingw64/include and mingw64/lib like other packages are using
>>>>> (see e.g.
>>>>> https://packages.msys2.org/package/mingw-w64-x86_64-zlib?repo=mingw64). Thus
>>>>> the compiler does not find the library there. Also there does not seem to be
>>>>> a difference between a i686 (32-bit) and x86_64 (64-bit) variant available
>>>>> here? Does anybody know how libfdt is supposed to be used with MSYS2 ?
>>>>
>>>> The msys environment is a bit special, it's not an environment for a
>>>> particular build target, my understanding is that it holds common
>>>> files/tools.
>>>>
>>>> dtc should be added to https://github.com/msys2/MINGW-packages for it
>>>> to be available as a target dependency.
>>>
>>> Do you have already any experience in requesting a new package there? Could
>>> you maybe do it? ... since I don't have a proper MinGW installation here, it
>>> would be very cumbersome for me right now.
>>>
>>
>> Here you go (although let see what CI has to say):
>> https://github.com/msys2/MINGW-packages/pull/15168
>>
>> The msys2 maintainers are usually very quick and helpful, in my experience.

Great, I just gave it a try, and it seems to be working, indeed:

https://gitlab.com/thuth/qemu/-/jobs/3649509495#L668

Thank you very much Marc-André and Biswapriyo!

> And it merged 1 day after you posted it. So yes, the msys2 maintainers
> are indeed very quick & helpful :-)
> 
> So in theory we can try to drop the submodule for dtc now

Ok, I'll give my patch another try to see whether all the other systems have 
a usable version of libfdt available, too.

  Thomas


