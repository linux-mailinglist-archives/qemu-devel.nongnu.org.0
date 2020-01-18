Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5ED1417E2
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jan 2020 15:10:53 +0100 (CET)
Received: from localhost ([::1]:40662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isooO-0004eH-CU
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 09:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isomV-0003HZ-GD
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:08:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isomS-0000RD-C2
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:08:55 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26446
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isomS-0000Qu-7r
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 09:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579356531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acaehvqFXPFMXgtntQcHdZtFbTbCxMhB9wKeq9UgstQ=;
 b=WF9TSN1ixLVhPCKHE0eGUMttkFFdvxSkYOGv1R4AnnabkM8xcEhy67FpO/H5Mp4Pc/ZoK+
 KfImyaIukAQS/wmgu9XV4N+Su/NAL5kt08POjrmGxjqge+hFuXdBNJpBwbzhE5CcPt4CfR
 DVngVXi6ifEqiizgMfoCiRb32eS6OY4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-VNUmmUVTMe6wXR5NwzCuzw-1; Sat, 18 Jan 2020 09:08:46 -0500
Received: by mail-wm1-f71.google.com with SMTP id w205so2892366wmb.5
 for <qemu-devel@nongnu.org>; Sat, 18 Jan 2020 06:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vxQA79pIPKP3QDwFzCqgqjHORU6gVBFkdrvMXKo6xvQ=;
 b=sRB33bgGGWH3YR/xufruwihqrsy/tGYf6W9F1uRfGEQTbKnOeC3902fL9O9VZpnxZc
 1+g3C1VqUTHoPyC2FfDszt5Rd1purLczVEt9lpd+ZJlk3kMTJ5vTq0tfYW6WDPgDNLzM
 EszqINWe5EY8ssdDRNDSCYT+BKMjBKxYpsEcnfQAlU6McMCSZjuXPrbP0s85SIOYB21C
 4cDD3hz2TYM64z2pDQ9FXLiSESGG+53HMxewri0MgCsJhmd3byx3lP7P1ieyS0HJMTkm
 AUuq5Vmy0lJFRXVuodhAIZgPIvVz8EFe2WHX+gXgbwt5wFs4s01EHzd/4BG9meiz8DSF
 aqHQ==
X-Gm-Message-State: APjAAAW4dOWc1XbS408lK+hgRhHdc8zNX/K9uj47JRlnj7kmI1DDSggO
 Ugnrp4/Ife4G0QZ5eh59lqHkCYtNZ6BM5h4Oi9OcYK/t7d5B/3S/NZ9bgKNg1NmYHMcXIbup3u5
 W9LVXoIcHSg92PCE=
X-Received: by 2002:adf:ee52:: with SMTP id w18mr8691303wro.416.1579356524548; 
 Sat, 18 Jan 2020 06:08:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGVGCKHmO6loJPKISTF2nhPhIJDWYEInQp8SmAHc7MkWMw5q2oX8+L1vAAJ+i4q7jUONabRg==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr8691278wro.416.1579356524287; 
 Sat, 18 Jan 2020 06:08:44 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id b21sm3256996wmd.37.2020.01.18.06.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 06:08:43 -0800 (PST)
Subject: Re: [PATCH] mailmap: Add more entries to sanitize 'git log' output
To: Markus Armbruster <armbru@redhat.com>
References: <20191218185723.7738-1-philmd@redhat.com>
 <87h80ts0ii.fsf@dusky.pond.sub.org>
 <aef8102c-23d5-7cdc-7183-673c116a44b2@redhat.com>
 <87tv4sq4hn.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <73f18b1d-c680-4db7-a682-9f65aeac79a9@redhat.com>
Date: Sat, 18 Jan 2020 15:08:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87tv4sq4hn.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: VNUmmUVTMe6wXR5NwzCuzw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/20 2:27 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> On 1/18/20 8:10 AM, Markus Armbruster wrote:
>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>
>>>> Most of these developers have the Signed-off-by tag properly
>>>> written, but not the author/commiter name. Fix this.
>>>> Also we incorrectly wrote Arei Gonglei name, update and reorder.
>>>>
>>>> git-log does not use this file by default until you specify the
>>>> --use-mailmap flag:
>>>>
>>>>     $ git log --use-mailmap
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>>    .mailmap | 29 ++++++++++++++++++++++++++++-
>>>>    1 file changed, 28 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/.mailmap b/.mailmap
>>>> index 3816e4effe..1a859d9e65 100644
>>>> --- a/.mailmap
>>>> +++ b/.mailmap
>>>> @@ -56,6 +56,10 @@ Aaron Lindsay <aaron@os.amperecomputing.com>
>>>>    Alexey Gerasimenko <x1917x@gmail.com>
>>>>    Alex Ivanov <void@aleksoft.net>
>>>>    Andreas F=C3=A4rber <afaerber@suse.de>
>>>> +Andreas F=C3=A4rber <andreas.faerber@web.de>
>>>> +Andreas F=C3=A4rber <andreas.faerber@web.de> <andreas.faerber>
>>>> +Arei Gonglei <arei.gonglei@huawei.com>
>>>> +Arei Gonglei <arei.gonglei@huawei.com> <root@ceth6.(none)>
>>>
>>> I can't find this one in git-log.
>>
>> I was first surprised:
>>
>> $ git log -1 3b08098b40
>> commit 3b08098b409c0fb28f85436ba1adeb1d401ec8f7
>> Author:     Gonglei <arei.gonglei@huawei.com>
>> AuthorDate: Wed Dec 3 18:25:46 2014 +0000
>> Commit:     root <root@ceth6.(none)>
>> CommitDate: Mon Dec 22 14:39:21 2014 +0800
>>
>>      bootdevice: add validate check for qemu_boot_set()
>>
>>      Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>>      Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>
>> After thinking for a bit I remembered I once changed my default format:
>>
>> $ git config format.pretty
>> fuller
>=20
> Aha!  Could've thought of this myself...
>=20
>> I suppose I should add this in the commit description.
>=20
> Can't hurt.

OK will do, thank for the review!

> [...]
>>>>    Shin'ichiro Kawasaki <kawasaki@juno.dti.ne.jp>
>>>>    Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>>>> +Siwei Zhuang <siwei.zhuang@data61.csiro.au>
>>>
>>> It's actually spelled Siwei.Zhuang@data61.csiro.au in git-log.
>>> Shouldn't matter.
>>
>> Correct:
>>
>> $ git shortlog -e 6478dd745d~..6478dd745d
>> Zhuang, Siwei (Data61, Kensington NSW) <Siwei.Zhuang@data61.csiro.au> (1=
):
>>        hw/riscv: Add optional symbol callback ptr to riscv_load_kernel()
>>
>> $ git shortlog -e 6478dd745d~..6478dd745d
>> Siwei Zhuang <Siwei.Zhuang@data61.csiro.au> (1):
>>        hw/riscv: Add optional symbol callback ptr to riscv_load_kernel()
>=20
> Suggest to adjust case if you respin.
>=20
>> Thanks for caring checking all entries!
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>=20
> [...]
>=20


