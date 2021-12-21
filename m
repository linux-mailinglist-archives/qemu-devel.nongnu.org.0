Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6810F47BFA0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 13:24:15 +0100 (CET)
Received: from localhost ([::1]:32898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzeBi-0005KO-7z
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 07:24:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mzeA0-0003HX-DX; Tue, 21 Dec 2021 07:22:33 -0500
Received: from [2607:f8b0:4864:20::72b] (port=36718
 helo=mail-qk1-x72b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mze9y-0007tH-Hw; Tue, 21 Dec 2021 07:22:28 -0500
Received: by mail-qk1-x72b.google.com with SMTP id d21so12313197qkl.3;
 Tue, 21 Dec 2021 04:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=daZ8kCLE3GK//vTn9Nvv8NG/2EQkH9tYBqubHQjuTks=;
 b=LUXBleZu786KMbKRq6a4PCKFjfps+pci7dTf5QL/5CjdzGXpzrtOz+MQTvpDRWWqcx
 wgZMoTfyAs1sseahIU2RdolbFK3orG96V+NLEqlWcCRovTkuP7rG9kolMG33yW50bZwH
 /N/QK2y0lgZctyYan6FWezipr3wUWfV3ag4FgOysFJyPHaZT1t0JWlYOxhokyPXVixDB
 OYG4DFiUu0eCPWNrXNfPEOgM3oIpeRogaozelFGyC/RcfWpxpZaTDeGZQLP8bI5nCxjW
 ApRHVcruA2v/ZVsIyc6PIMNKT/FK2P+02gW1ZOHKEQqaopGVepyZxfz6iJJfd7CEYdcs
 1XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=daZ8kCLE3GK//vTn9Nvv8NG/2EQkH9tYBqubHQjuTks=;
 b=tHjdQFMtwhm9LjoRKlrdDRVxHuNUVlHH5EFah6AgIkhHj6EEz3X/uvVv+19Z7eYSvx
 Hcf57Qnfc0Y3fisO5YYy4vxGXy1KwjjoERqEFPhP5lAcERtdmbyaGYMibFxIMSNLd87V
 G9lXVVArbuA8dAIJKt6QFtNVXdNPlgJ6oz4Bib5ByqD/6OhK6Ig9ZUEgRXDLMr7SXdXx
 lMmLn/8Bf+aEVFimfBf02Qn6k0cO39sG161J2/dBXrU2MpCBbd77M10Qh99uzggm0yFz
 wIG4z2hXo88FCwASH4ZY2/2uSaNgqcIvRp86WeJQvW3q8lyaOd9fd4Ps2XCG/plzALWJ
 vX9A==
X-Gm-Message-State: AOAM530KVoAIdfc66RRou+/3WZqvjr1jTG0eK5bl9DSqWKhUAikw+69H
 bCB3YDCpIMoinYm6K0okLkIfXMzURX7wXRSEk6g=
X-Google-Smtp-Source: ABdhPJw+vHVGC+Pi4bBjmj4lQQMo1+OGYmZXT9QpP561YKHR2lBasXXTS2xQnKP6K+PyojVzjs9z9KqcjR/QBCMdTcI=
X-Received: by 2002:a05:620a:2912:: with SMTP id
 m18mr1693678qkp.692.1640089345334; 
 Tue, 21 Dec 2021 04:22:25 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT2fC_bTkoNd=21MrdoC1hKk_jejDBdc8KiNvr86aOyAwA@mail.gmail.com>
 <0f468714-96bd-1e5a-0e40-b7fd5f920964@redhat.com>
 <CAP4GjT0a+eROFs6w1X=WTLsGkVsaTO2QC6f4wq96X386xpNW0g@mail.gmail.com>
In-Reply-To: <CAP4GjT0a+eROFs6w1X=WTLsGkVsaTO2QC6f4wq96X386xpNW0g@mail.gmail.com>
From: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Date: Tue, 21 Dec 2021 13:22:13 +0100
Message-ID: <CAP4GjT2LryD0fUSwCygxwGK3Z5u_yvacm5kKqRWtDGbZEmLbCg@mail.gmail.com>
Subject: Re: QOM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d4219405d3a70e4c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=abhijeetinamdar3005@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d4219405d3a70e4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As we have almost 80 irq lines and 40-45 NVIC_irq's.

Where can I define them?

BR.
Abhijeet.

On Tue, 21 Dec, 2021, 13:18 abhijeet inamdar, <abhijeetinamdar3005@gmail.co=
m>
wrote:

> Oh,
>
> In that case I have to define my irq set for a machine to handle the
> exception and interrupts.
>
> BR.
> Abhijeet.
>
> On Tue, 21 Dec, 2021, 12:59 Philippe Mathieu-Daud=C3=A9, <philmd@redhat.c=
om>
> wrote:
>
>> Hi Abhijeet,
>>
>> On 12/21/21 12:27, abhijeet inamdar wrote:
>> > Hi,
>> >
>> > 1)What does QOM stand for?
>>
>> QOM: "QEMU Object Model"
>>
>> See https://qemu-project.gitlab.io/qemu/devel/qom.html
>>
>> > 2)Can anyone tell what this error means?
>> >
>> > (qemu) Unexpected error in object_property_find() at
>> > /home/ocp/vcpu-playground/vcpu_on_qemu/qemu-4.2.0/qom/object.c:1177:
>> > qemu-system-arm: Property '.sysbus-irq[0]' not found
>> > Aborted (core dumped).
>>
>> I suppose you are trying to connect a device gpio/irq output line
>> to another device input, likely using sysbus_connect_irq().
>>
>> The API is "connect the N-th output line from the SysBus device
>> to this qemu_irq handler", where qemu_irq is the input line.
>>
>> Apparently your SysBus device doesn't have any output line
>> registered. These are registered using sysbus_init_irq().
>> The first call register the first output IRQ, and so on.
>>
>> Some objects have their QOM interface documented, for
>> example to use the ARM GIC see:
>>
>> https://gitlab.com/qemu-project/qemu/-/blob/master/include/hw/intc/arm_g=
ic.h#L22
>>
>> Hope that helps.
>>
>> Regards,
>>
>> Phil.
>>
>>

--000000000000d4219405d3a70e4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">As we have almost 80 irq lines and 40-45 NVIC_irq&#39;s.=
=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto">Where can I define them=
?</div><div dir=3D"auto"><br></div><div dir=3D"auto">BR.</div><div dir=3D"a=
uto">Abhijeet.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Tue, 21 Dec, 2021, 13:18 abhijeet inamdar, &lt;<a hr=
ef=3D"mailto:abhijeetinamdar3005@gmail.com">abhijeetinamdar3005@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Oh,=
=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto">In=C2=A0that case I hav=
e to define my irq set for a machine to handle the exception and interrupts=
.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">BR.</div><div di=
r=3D"auto">Abhijeet.</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, 21 Dec, 2021, 12:59 Philippe Mathieu-Daud=
=C3=A9, &lt;<a href=3D"mailto:philmd@redhat.com" target=3D"_blank" rel=3D"n=
oreferrer">philmd@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">Hi Abhijeet,<br>
<br>
On 12/21/21 12:27, abhijeet inamdar wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; 1)What does QOM stand for?<br>
<br>
QOM: &quot;QEMU Object Model&quot;<br>
<br>
See <a href=3D"https://qemu-project.gitlab.io/qemu/devel/qom.html" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">https://qemu-project.git=
lab.io/qemu/devel/qom.html</a><br>
<br>
&gt; 2)Can anyone tell what this error means?=C2=A0<br>
&gt; <br>
&gt; (qemu) Unexpected error in object_property_find() at<br>
&gt; /home/ocp/vcpu-playground/vcpu_on_qemu/qemu-4.2.0/qom/object.c:1177:<b=
r>
&gt; qemu-system-arm: Property &#39;.sysbus-irq[0]&#39; not found<br>
&gt; Aborted (core dumped).<br>
<br>
I suppose you are trying to connect a device gpio/irq output line<br>
to another device input, likely using sysbus_connect_irq().<br>
<br>
The API is &quot;connect the N-th output line from the SysBus device<br>
to this qemu_irq handler&quot;, where qemu_irq is the input line.<br>
<br>
Apparently your SysBus device doesn&#39;t have any output line<br>
registered. These are registered using sysbus_init_irq().<br>
The first call register the first output IRQ, and so on.<br>
<br>
Some objects have their QOM interface documented, for<br>
example to use the ARM GIC see:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/blob/master/include/hw/in=
tc/arm_gic.h#L22" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank=
">https://gitlab.com/qemu-project/qemu/-/blob/master/include/hw/intc/arm_gi=
c.h#L22</a><br>
<br>
Hope that helps.<br>
<br>
Regards,<br>
<br>
Phil.<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000d4219405d3a70e4c--

