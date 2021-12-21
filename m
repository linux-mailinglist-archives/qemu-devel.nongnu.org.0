Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E94647BF9A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 13:21:35 +0100 (CET)
Received: from localhost ([::1]:54484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mze97-0000oI-S2
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 07:21:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mze6K-0006Fp-1u; Tue, 21 Dec 2021 07:18:40 -0500
Received: from [2607:f8b0:4864:20::735] (port=38455
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <abhijeetinamdar3005@gmail.com>)
 id 1mze6I-0007M5-5Q; Tue, 21 Dec 2021 07:18:39 -0500
Received: by mail-qk1-x735.google.com with SMTP id l25so12299407qkl.5;
 Tue, 21 Dec 2021 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ALv5Yszcb5jO+SnOx4Ob1l/NuY4J0kVeKu2swnuyrCw=;
 b=GDwSR9j31KuyR08izwaLYvxM6oBOVNRHG4JIodtykLrzcyh9sS+4Cqh3xCz6Vfk1rf
 h4rPPp//F9HtYbCT9gyqjC01XV8PQ2/GHQlfDbpP/MU45wwjpIC7ZlZpW5z/DrT8y4XF
 XVP9kmgITe2Z8LSgcN8HyBTGe/NM6zwx+GqtYzaLDHIRn413kdCYVYoB0x/Wq0rYzNwq
 5iXHHCt6vBB+f8uFQpIty0t0LbnEgw+BYL4UVN22Y+YVmScSPQLPSPvsK8Y+/TSAGpbv
 5KJaZqmoavK5m9RYVA4GA51ezfJNrxC9izWQRPjB7AArpW0Osbwexwt0SBvrYKe+5VZb
 I6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ALv5Yszcb5jO+SnOx4Ob1l/NuY4J0kVeKu2swnuyrCw=;
 b=us8HDqEFKSZClYTXky6I7amugTwHaDw3TT4khGmwrx0CJRF6uRx63W8ts+FV/cEh7l
 3vVQvf9v5ZqyjZdUZkmuoVqhyHn2s+HF6JtlHFtgp8Lmh2YdMJXXfi1OwDj/ud7Oa/P0
 dV6OxGYYeAr50umF5Lpf8UXHAJzbmaUDFbt1N1idVYCXDMRrGT9dA0IcZOiaeknetF1q
 lMmzuBl2LnziDhQKc4MULOkkHjU9mMysZTTkQMwtGoRzzFpCJmuVzbJ8mwjr1rox3m3I
 /vGzHUScwT9lMQl1f947XXbeh35HYTeHHXAnO6MBPduMCeJnZIQkWFEnKEprY/Ak1aPt
 8o0Q==
X-Gm-Message-State: AOAM530WKXG9Ye08gjnWMWuG4M2UkGvkS6s5C3UhlWcxQJ4weNM6YUgD
 wAtiBpEFdLAlJtMIjMzL9wU/dt10BUL+URqwk04=
X-Google-Smtp-Source: ABdhPJxcSApnpxggVUAYqiTliPO3gWoIEfBga7ytGMLbKmHpJBtYC8HYhUvHDGGj29sGLp6bimHVcJf5mBnCI1sdKcA=
X-Received: by 2002:a05:620a:24cf:: with SMTP id
 m15mr1714421qkn.623.1640089116666; 
 Tue, 21 Dec 2021 04:18:36 -0800 (PST)
MIME-Version: 1.0
References: <CAP4GjT2fC_bTkoNd=21MrdoC1hKk_jejDBdc8KiNvr86aOyAwA@mail.gmail.com>
 <0f468714-96bd-1e5a-0e40-b7fd5f920964@redhat.com>
In-Reply-To: <0f468714-96bd-1e5a-0e40-b7fd5f920964@redhat.com>
From: abhijeet inamdar <abhijeetinamdar3005@gmail.com>
Date: Tue, 21 Dec 2021 13:18:25 +0100
Message-ID: <CAP4GjT0a+eROFs6w1X=WTLsGkVsaTO2QC6f4wq96X386xpNW0g@mail.gmail.com>
Subject: Re: QOM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000032ee5605d3a70198"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=abhijeetinamdar3005@gmail.com; helo=mail-qk1-x735.google.com
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

--00000000000032ee5605d3a70198
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh,

In that case I have to define my irq set for a machine to handle the
exception and interrupts.

BR.
Abhijeet.

On Tue, 21 Dec, 2021, 12:59 Philippe Mathieu-Daud=C3=A9, <philmd@redhat.com=
>
wrote:

> Hi Abhijeet,
>
> On 12/21/21 12:27, abhijeet inamdar wrote:
> > Hi,
> >
> > 1)What does QOM stand for?
>
> QOM: "QEMU Object Model"
>
> See https://qemu-project.gitlab.io/qemu/devel/qom.html
>
> > 2)Can anyone tell what this error means?
> >
> > (qemu) Unexpected error in object_property_find() at
> > /home/ocp/vcpu-playground/vcpu_on_qemu/qemu-4.2.0/qom/object.c:1177:
> > qemu-system-arm: Property '.sysbus-irq[0]' not found
> > Aborted (core dumped).
>
> I suppose you are trying to connect a device gpio/irq output line
> to another device input, likely using sysbus_connect_irq().
>
> The API is "connect the N-th output line from the SysBus device
> to this qemu_irq handler", where qemu_irq is the input line.
>
> Apparently your SysBus device doesn't have any output line
> registered. These are registered using sysbus_init_irq().
> The first call register the first output IRQ, and so on.
>
> Some objects have their QOM interface documented, for
> example to use the ARM GIC see:
>
> https://gitlab.com/qemu-project/qemu/-/blob/master/include/hw/intc/arm_gi=
c.h#L22
>
> Hope that helps.
>
> Regards,
>
> Phil.
>
>

--00000000000032ee5605d3a70198
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oh,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto">In=
=C2=A0that case I have to define my irq set for a machine to handle the exc=
eption and interrupts.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">BR.</div><div dir=3D"auto">Abhijeet.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 21 Dec, 2021, 12:59 =
Philippe Mathieu-Daud=C3=A9, &lt;<a href=3D"mailto:philmd@redhat.com">philm=
d@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Abhi=
jeet,<br>
<br>
On 12/21/21 12:27, abhijeet inamdar wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; 1)What does QOM stand for?<br>
<br>
QOM: &quot;QEMU Object Model&quot;<br>
<br>
See <a href=3D"https://qemu-project.gitlab.io/qemu/devel/qom.html" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://qemu-project.gitlab.io/qemu=
/devel/qom.html</a><br>
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
tc/arm_gic.h#L22" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
itlab.com/qemu-project/qemu/-/blob/master/include/hw/intc/arm_gic.h#L22</a>=
<br>
<br>
Hope that helps.<br>
<br>
Regards,<br>
<br>
Phil.<br>
<br>
</blockquote></div>

--00000000000032ee5605d3a70198--

