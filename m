Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B568747C3B6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:24:20 +0100 (CET)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzhw3-0000RN-6Y
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:24:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mzhty-0006gr-Kw; Tue, 21 Dec 2021 11:22:10 -0500
Received: from [2607:f8b0:4864:20::731] (port=46011
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mzhtw-0003YE-RY; Tue, 21 Dec 2021 11:22:10 -0500
Received: by mail-qk1-x731.google.com with SMTP id e16so2219096qkl.12;
 Tue, 21 Dec 2021 08:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBgPa9+S2cIQi3UZ6+n8PdSrBkEHDMAAaJsU2zyY/KA=;
 b=mS3yfS8EYGy00ufgd16CnE8IPgOY6jYhXt27sSCRXAIHv1dr05OwzaN3f/EKHprVij
 YccUdb6yyAZpBr1xFoS8PFUL1j354Uhc2MoU769UC5kH6yjaP/GVgHlh3B8oYswx3MF8
 l1LRNYnK1MhJtBeD7xGB2C+kEih3luMTJ3mCAViZ4xGhxEw0kdomHp35v0H4dWvViUys
 GFJpMTsShEKjJhRVagJJZZn5KHD+4lKa+ldAgaC3VmxrnuX2v2CuZrgDBaY9a+6YIRWI
 sCviAxqybOsXez0KGteVQHcEChDZ1tV2ue25gtkLvEBhkJpWRx3FzMxsaMJ8Z2x0DQMi
 22iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBgPa9+S2cIQi3UZ6+n8PdSrBkEHDMAAaJsU2zyY/KA=;
 b=Yn67n48mcIoUlBibJCGs5z5O7PkoW00quUIDiRipFRTjO8u9RU2w38S1bk10jcaqcS
 Rn9h8uWbLG4eIMocEVi//m+O38D8XHAFar3EiPl6AZGHXxtfrc1sPJz1C5YdWHVAKQCz
 G45bHVNWR2nRgAwR8pB2aLxa+1KrMQumqP0ra7ZejDiDyDY3NrwoGH8n+xdgtPV1bfl9
 LBxjJNlE9zdV+POVKfUVlSdwn4rx6ywLoMqUzHK0XIA1ApL8XKPhue2yjvUoxE/6oFbH
 g6fweJQfnoV3u/XCGrd8+x59UB3wuom9BPqB7UtCR99sQCWGUJCpj6els6gsLurSpNv3
 BuOA==
X-Gm-Message-State: AOAM531Ktp7Rbe/FHeNnsxb6rHqTTKLZHEEM2CxZGbLFa28yJW9vtYb4
 wcxzl663tvbDejAZ4q5xclYy4aBN7SiWjQ0OTgsdOG0EUs4=
X-Google-Smtp-Source: ABdhPJxq0lhn2GpV4uDh3W6Mz1CgGker/HkOwba2DMk+GlY/ATJoO7qVgOA120IKyRgy0Loai8KIs3C8290KwNypEO0=
X-Received: by 2002:a05:620a:454b:: with SMTP id
 u11mr2515430qkp.599.1640103727563; 
 Tue, 21 Dec 2021 08:22:07 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT2fC_bTkoNd=21MrdoC1hKk_jejDBdc8KiNvr86aOyAwA@mail.gmail.com>
 <0f468714-96bd-1e5a-0e40-b7fd5f920964@redhat.com>
 <CAP4GjT0a+eROFs6w1X=WTLsGkVsaTO2QC6f4wq96X386xpNW0g@mail.gmail.com>
 <CAP4GjT2LryD0fUSwCygxwGK3Z5u_yvacm5kKqRWtDGbZEmLbCg@mail.gmail.com>
In-Reply-To: <CAP4GjT2LryD0fUSwCygxwGK3Z5u_yvacm5kKqRWtDGbZEmLbCg@mail.gmail.com>
From: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Date: Tue, 21 Dec 2021 17:21:56 +0100
Message-ID: <CAP4GjT2ZK0Yc3did19XOr+V89poyemNV-bKh2g=8e4cCJ0qbHA@mail.gmail.com>
Subject: Re: QOM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001385c905d3aa68ec"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=abhijeetinamdar3005@gmail.com; helo=mail-qk1-x731.google.com
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

--0000000000001385c905d3aa68ec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

How did we decide the NUM_IRQ_LINES 64 for stellaris?


BR.
Abhijeet.




On Tue, 21 Dec, 2021, 13:22 abhijeet inamdar, <abhijeetinamdar3005@gmail.co=
m>
wrote:

> As we have almost 80 irq lines and 40-45 NVIC_irq's.
>
> Where can I define them?
>
> BR.
> Abhijeet.
>
> On Tue, 21 Dec, 2021, 13:18 abhijeet inamdar, <
> abhijeetinamdar3005@gmail.com> wrote:
>
>> Oh,
>>
>> In that case I have to define my irq set for a machine to handle the
>> exception and interrupts.
>>
>> BR.
>> Abhijeet.
>>
>> On Tue, 21 Dec, 2021, 12:59 Philippe Mathieu-Daud=C3=A9, <philmd@redhat.=
com>
>> wrote:
>>
>>> Hi Abhijeet,
>>>
>>> On 12/21/21 12:27, abhijeet inamdar wrote:
>>> > Hi,
>>> >
>>> > 1)What does QOM stand for?
>>>
>>> QOM: "QEMU Object Model"
>>>
>>> See https://qemu-project.gitlab.io/qemu/devel/qom.html
>>>
>>> > 2)Can anyone tell what this error means?
>>> >
>>> > (qemu) Unexpected error in object_property_find() at
>>> > /home/ocp/vcpu-playground/vcpu_on_qemu/qemu-4.2.0/qom/object.c:1177:
>>> > qemu-system-arm: Property '.sysbus-irq[0]' not found
>>> > Aborted (core dumped).
>>>
>>> I suppose you are trying to connect a device gpio/irq output line
>>> to another device input, likely using sysbus_connect_irq().
>>>
>>> The API is "connect the N-th output line from the SysBus device
>>> to this qemu_irq handler", where qemu_irq is the input line.
>>>
>>> Apparently your SysBus device doesn't have any output line
>>> registered. These are registered using sysbus_init_irq().
>>> The first call register the first output IRQ, and so on.
>>>
>>> Some objects have their QOM interface documented, for
>>> example to use the ARM GIC see:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/blob/master/include/hw/intc/arm_=
gic.h#L22
>>>
>>> Hope that helps.
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>>

--0000000000001385c905d3aa68ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">How did =
we decide the NUM_IRQ_LINES 64 for stellaris?=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">BR.</div><div dir=
=3D"auto">Abhijeet.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, 21 Dec, 2021, 13:22 abhijeet inam=
dar, &lt;<a href=3D"mailto:abhijeetinamdar3005@gmail.com">abhijeetinamdar30=
05@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"auto">As we have almost 80 irq lines and 40-45 NVIC_irq&#39;s.=C2=A0<d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Where can I define them?</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">BR.</div><div dir=3D"auto">Abh=
ijeet.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, 21 Dec, 2021, 13:18 abhijeet inamdar, &lt;<a href=3D"ma=
ilto:abhijeetinamdar3005@gmail.com" target=3D"_blank" rel=3D"noreferrer">ab=
hijeetinamdar3005@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"auto">Oh,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"=
auto">In=C2=A0that case I have to define my irq set for a machine to handle=
 the exception and interrupts.=C2=A0</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">BR.</div><div dir=3D"auto">Abhijeet.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 21 Dec, 2021=
, 12:59 Philippe Mathieu-Daud=C3=A9, &lt;<a href=3D"mailto:philmd@redhat.co=
m" rel=3D"noreferrer noreferrer" target=3D"_blank">philmd@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Abhijeet,<br>
<br>
On 12/21/21 12:27, abhijeet inamdar wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; 1)What does QOM stand for?<br>
<br>
QOM: &quot;QEMU Object Model&quot;<br>
<br>
See <a href=3D"https://qemu-project.gitlab.io/qemu/devel/qom.html" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer" target=3D"_blank">https://qemu-=
project.gitlab.io/qemu/devel/qom.html</a><br>
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
tc/arm_gic.h#L22" rel=3D"noreferrer noreferrer noreferrer noreferrer" targe=
t=3D"_blank">https://gitlab.com/qemu-project/qemu/-/blob/master/include/hw/=
intc/arm_gic.h#L22</a><br>
<br>
Hope that helps.<br>
<br>
Regards,<br>
<br>
Phil.<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--0000000000001385c905d3aa68ec--

