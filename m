Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34BA2415
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 20:21:00 +0200 (CEST)
Received: from localhost ([::1]:53214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3P2Y-0006NZ-U4
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 14:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.kiszka@web.de>) id 1i3Oun-0003p5-KE
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 14:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.kiszka@web.de>) id 1i3Oum-0004HF-EJ
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 14:12:57 -0400
Received: from mout.web.de ([212.227.15.4]:51735)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.kiszka@web.de>) id 1i3Oum-0004G4-2D
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 14:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1567102364;
 bh=onuNtjLS1iADOPsRdI94d1m+OTeb78rMJmiFiS1g8S0=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=C0JDbXIiWP8E34fvgg1ahbYQKOeNe/sYxjDmi95K6NKjRH5AzaeRMNNzatb/lH2/F
 sO157TEhC0fwz9lZlXWSwv9PrIXGrKLep+xRyPlrlRNQgV5sjMrv2vkc2gUBr/KBOG
 keZCsawm584L5ONmTF2lMn92xZzSY2+0i0SFU8Qg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [139.25.68.37] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LnjRP-1igqep08hL-00ht5U; Thu, 29
 Aug 2019 20:12:44 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <f056c7e5-fa74-469c-87f8-0f0925301b2d@web.de>
 <90ea3127-5e26-ed2a-4ad7-d30445bcf53a@web.de>
 <20190827194948.GB7077@habkost.net>
 <055f099e-c9a7-1d75-7dcc-0d8916988cc6@redhat.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <b5878351-cf0f-81c3-5965-eec20b59996e@web.de>
Date: Thu, 29 Aug 2019 20:12:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <055f099e-c9a7-1d75-7dcc-0d8916988cc6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3H62EK7spS7GGpqZDga2KzOQT/daEH0sotuF8q26ueeIh9fwcNn
 iuKIkiMDqvD0fp8AT2uCw+mbXxkIVzn3O8JaFPwbu9T+XG+WRDJBUCpoRzvWF0GIAUZj4OS
 93mRFOyD8+Wj0Jbnwy4/8M8P+zxFN+Q5a/tdQXk/7sKKhirPCKdwWRTtFFT9DakVJx+ZnSb
 lviHLbeTu+71h3qG1RaCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G1Zwa/t8fj4=:z3NP7p8m26LPel7pUL03I2
 Ap6I/8r4gxbkJF8sPFCuPYW6NRUlkvEHgXM2L+aFSNvd/SaMaOgKDgws05lU270ThmwAg+e2R
 U9+pvQbUuqMtMFuXgB2z+FFvGI3GstbVfCwm+hNQvIVvhfzhm++xsNvjT+h85lCLnc3Q5+bqa
 CreA0qkPWsywVOTRuUv/EuvojU2v1emW7Fh3/TYpdA/bzcToDOzOC6lDLmKd+T7TAdnmyBRC/
 G+kEAmlKpNg3v1y8MqtboADiDjLGCMnyHp20ZDC3+Mos4pdFkGGEPEVf6LSiCcwawviTnqHq2
 hFoxqFL7oqyxK7hMw6WKgtJxm9/1i+jKETRcu4NtjxUsMBHYxrqsdmtmtNDYftRtyPWumP8C3
 IruBbphd9P5TsBRn5QEieXuKGijMTS5xvUJ1DC0kLhDLNjfI134q/Bkhsl46GNlVpFiNn9P+y
 Z1soe4HynQmsRYr/278SlQbxWVzaTAbIIQISeoDsD/SMQ3OMRtS6URuuSq1RtrVxOLZo3uRFT
 HSIXBwdeHmzd21T7rgw4ctSofgAx4G9/xD08Nuj53ceDb/q/pA9of5nNv5NEWrAnnZmPMv25Z
 F+GYH7XZoxoKPJJUf0iL06yNe3MZai8X7+tPPuxirfnb5eVqRYKQEUQjYV1emhKbdwUS5rLqf
 e+REaW+Ra+bFN6OuDyLDdh5PFSretT/6zTuhYoJCB3LsCcNScH9tcZ5DaI4O5nYvfEWpsL4bv
 hRq9lPMclB8eEEndsMwbuIyKxgyisZ6WQySgjOVwmKzRxPyf8G5JZuLP1RLedYcA3fCVWYChR
 49w8lxyoWZ6gRljdYjVIqEpWjAPzlwl7E0aaanpVmE8CQ7tBtkJx9ZTRrSRPituQhEw6aR5WX
 Sing/ckPtFOJrZitPg8HHhD9v8HBgJVW1rIQLCmyNhKKyZv4cRho39o4FPpaIFul3bS9D70rw
 4l9jrubllwONbmP8sKsRzsQejw6be/YE5wchD8Ub2U9giv6L81LmG/yU3LRgccKFbwEpA07gh
 lS//nZZp8/VdygYgR0PfUCCw3lCZkUAUNZduvlWD2MSuI0EKMx31nxi+s8nBgG2seu2m117JE
 o1f6YkR8wKwkuhA7hc5v4KDOXq3VMQk5bVbm5VKpeGprhttSjlL+kfxOHOFaNF68V/Dzmg5PL
 7BpoK6mCMpHf5kouWkXTTvD2iofGJle6lTitt1qZszAN6UnQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.15.4
Subject: Re: [Qemu-devel] [PATCH] i386/vmmouse: Properly reset state
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.08.19 20:00, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Jan,
>
> On 8/27/19 9:49 PM, Eduardo Habkost wrote:
>> On Sun, Aug 25, 2019 at 04:58:18PM +0200, Jan Kiszka wrote:
>>> On 21.07.19 10:58, Jan Kiszka wrote:
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> nb_queue was not zeroed so that we no longer delivered events if a
>>>> previous guest left the device in an overflow state.
>>>>
>>>> The state of absolute does not matter as the next vmmouse_update_hand=
ler
>>>> call will align it again.
>>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>> ---
>>>>    hw/i386/vmmouse.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
>>>> index 5d2d278be4..e335bd07da 100644
>>>> --- a/hw/i386/vmmouse.c
>>>> +++ b/hw/i386/vmmouse.c
>>>> @@ -257,6 +257,7 @@ static void vmmouse_reset(DeviceState *d)
>>>>        VMMouseState *s =3D VMMOUSE(d);
>>>>
>>>>        s->queue_size =3D VMMOUSE_QUEUE_SIZE;
>>>> +    s->nb_queue =3D 0;
>
> Don't we also need to reset the status in case vmmouse_get_status() is
> called directly after reset?
>
>           s->status =3D 0;
>

Thanks for checking. We call vmmouse_disable() here, and that sets status =
to
0xffff anyway.

Jan

> With it:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
>>>>
>>>>        vmmouse_disable(s);
>>>>    }
>>>> --
>>>> 2.16.4
>>>>
>>>>
>>>
>>> Ping - or who is looking after this?
>>
>> Despite being in hw/i386, I think we can say vmmouse.c doesn't
>> have a maintainer.  Last time someone changed vmmouse.c in a
>> meaningful way (not just adapting to API changes or removing
>> duplicate code) was in 2012.
>>
>
> Well it does has a few:
>
> $ ./scripts/get_maintainer.pl -f hw/i386/vmmouse.c
> "Michael S. Tsirkin" <mst@redhat.com> (supporter:PC)
> Marcel Apfelbaum <marcel.apfelbaum@gmail.com> (supporter:PC)
> Paolo Bonzini <pbonzini@redhat.com> (maintainer:X86 TCG CPUs)
> Richard Henderson <rth@twiddle.net> (maintainer:X86 TCG CPUs)
> Eduardo Habkost <ehabkost@redhat.com> (maintainer:X86 TCG CPUs)
>
> However the correct section should rather be "PC Chipset".
>
>> But the change makes sense to me, so:
>>
>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>
>> I'll queue it.
>>

