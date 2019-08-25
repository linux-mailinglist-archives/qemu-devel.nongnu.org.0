Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2ED9C492
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 17:05:37 +0200 (CEST)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1u5H-0002i4-CC
	for lists+qemu-devel@lfdr.de; Sun, 25 Aug 2019 11:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49888)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.kiszka@web.de>) id 1i1tyY-0001vn-KL
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 10:58:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.kiszka@web.de>) id 1i1tyX-0005uH-O9
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 10:58:38 -0400
Received: from mout.web.de ([212.227.17.11]:49127)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.kiszka@web.de>) id 1i1tyX-0005nw-Bx
 for qemu-devel@nongnu.org; Sun, 25 Aug 2019 10:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566745105;
 bh=WU6VhO79hD5gewC9QLl9xD4QkWHlpphrOQjpN7vfT8k=;
 h=X-UI-Sender-Class:Subject:From:To:References:Date:In-Reply-To;
 b=eVYx9Xx+V7ssw5Tvm30Nj1zkdQF+w5ngzoXlFGU2L07KgaNRxZ7YGnJkLrohKaRgi
 eVeZ8z8jMR4OXlP5S1VgYBsv9AUmqt2qU/MdkAVVgYv8FtkEmtElbJ21xv71ZBy9Tz
 85c1TBE3A6Eh9hv05piuD2ZtJIlYlBWf86YtakZc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LyDph-1iGOd9263p-015Xw2; Sun, 25
 Aug 2019 16:58:25 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
References: <f056c7e5-fa74-469c-87f8-0f0925301b2d@web.de>
Message-ID: <90ea3127-5e26-ed2a-4ad7-d30445bcf53a@web.de>
Date: Sun, 25 Aug 2019 16:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f056c7e5-fa74-469c-87f8-0f0925301b2d@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iHM/3HaElcQOtD7YkcIHIJej3PXUx+aaBZPtgsJpYr+NW19KAHe
 nd7GpYfodttAz4VpIkehfZrZgS17URZMA4xQIZVK+hoFnwOWSLTRvyqHD1Wm7WHpDM1yIWd
 vthYKcNFoQPahXsRh2eGSw6CE+IR8fCnj/nA5FMsIyoMYMq6jJ8bAZUkJqOkFWCFM5HnAwJ
 rQtwW0HvXEOzNZRsVgBAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1onk8D612uA=:+wFhJhHrp40CaoSds61qPs
 AACzfIAQwlJ6ldr75DsU3r5fD4mASKSBCJ2yLeMQKQ92njexZCJ7B2PL8dOZOTiVeE+nsMeDy
 2Yd84KAtAyXtHp+sGwPkBH4GshIk8Z21gii1Y3dFxyOFCQ4bC6oDGHX0C3c8rdbKTP5Vh/uPj
 Gz2J2qEs22jnd2kL3RB4GY45L6oeKZNjjanzQbfzE/x2PRWYiUbrqDJrvSHoV9mIE6sPYViAr
 6jJq6JZ0I3Wuvumj0sfQ2lZAfpEyhhU8NSgYSfrEP/dZFCeoZgq4iQrT4ChZ1Ym7FbeM24dcP
 DrA77rRpeBdMwuRXa5WD55bYJOdTsuvdcrefJUJ7MGEdscGa5PsZvrfC0WeSh0qlhVfLskQ1F
 eITupDjI2ymEJkYUjySNyeB+LAMtmGVhiz6keJS1i5F92A9pnapCyvZjJWgp4ejEqJP4uyrqI
 8QFstfSmOk6OguFPlfuAOL8dFQ2FKjal4nBRfuQKjzDcNI2KisOmHYzLN9Fnqy1oJUfPDymZF
 Io38XtS6ZLnBkTDKjBpDWJe0wQK7cJzVz8TklFLku11zvjSLa2SHCvHr+5JRB8mWfILmV+N6W
 mHrNiY3PgzvV++SWhnclWGK16moaHJ9Oz4zLlfG9WW7OCreZb9GxRHBynp6nZLXy/aB5UhfMZ
 JxcH+exPImoc23aairLUcwrO9LcNyGwE7GKUbgHvIGwwD89KZt4nXqU2T1aTVgh2Ucv7Al3Z+
 DKMZJYHyjMZl84kjN8G/WO+NDlzhVF6Gi6HbEqRlVMcXgf20gnpz3z/UYQ06OEauBaO80Svxy
 Do8HQiMJ3IxrEnmx/rMm4bAcSA3D0WJE20tphTNbm8ti0LJ+phqksNwywydx/nxao8BXS4nI+
 lYF26rJK9hANkA3YrZhT6Z9uvsfDCw7Ix9GgJDrYMCVXqCFTvnSLYn58oP+/KXcHThZXNgDr5
 tw1NFaOhKKuLUw5dzNSr2pvupVEfNVyPI+eMNncMPMRdzbS8yx16uyOnebs50OeCh3KBgtAaw
 nELGcNSyCxicAO+PRaRVhwa1aJH4cpWCASWyvg1I2QOJ4mk5KOlxtfa8KhDzrkyx3+8CDMClw
 0oM3PKYetqPOxG7ypM16XbdbaXVXC9j+bxlm57WgEM3wIJBtALfV2ZZbD76MRZlTQhVyu6WKb
 ewZUEPCCK/wb1zqMlzHW5dBoCDoJHDM8cpWUvjg3iKQl8/VQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.11
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.07.19 10:58, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> nb_queue was not zeroed so that we no longer delivered events if a
> previous guest left the device in an overflow state.
>
> The state of absolute does not matter as the next vmmouse_update_handler
> call will align it again.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>   hw/i386/vmmouse.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/hw/i386/vmmouse.c b/hw/i386/vmmouse.c
> index 5d2d278be4..e335bd07da 100644
> --- a/hw/i386/vmmouse.c
> +++ b/hw/i386/vmmouse.c
> @@ -257,6 +257,7 @@ static void vmmouse_reset(DeviceState *d)
>       VMMouseState *s =3D VMMOUSE(d);
>
>       s->queue_size =3D VMMOUSE_QUEUE_SIZE;
> +    s->nb_queue =3D 0;
>
>       vmmouse_disable(s);
>   }
> --
> 2.16.4
>
>

Ping - or who is looking after this?

Jan

