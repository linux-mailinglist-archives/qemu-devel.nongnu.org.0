Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157BE5301F0
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 10:59:04 +0200 (CEST)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nshQU-00040V-Mn
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 04:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshNz-0001Ju-2B; Sun, 22 May 2022 04:56:30 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:44601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nshNx-0005zC-AM; Sun, 22 May 2022 04:56:26 -0400
Received: by mail-qk1-x72e.google.com with SMTP id i68so9693678qke.11;
 Sun, 22 May 2022 01:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GpTJ9NhcSHbC2SHkP7WV6bExeaXGM4BHG+yCGKJddeQ=;
 b=jG4n9CHyGJMFS+yGKvpKSRqr0nTOP66YpWYgOqBGFou03w6Jwe2WuW8lJblslmzTAA
 btcutjlgWqONp9RG9uSJKYf329ADogHvywBZnpHdzDwHUbIIPLmPPK7lKQG66Ck+kNPK
 oAbs58Xlo0rfh0EBpipWWXAVa5akUfcHUQRg+7XCLALAA9TQW3+xzh1ChE6pUoeTtpBw
 vWGFvUzX0aZpEojE5gdlcJDTbqv5y60hrCJdlBGZG9ktL2b+Nu/hWeJjLX61Dk2NkBfm
 9U8hF6IrWTLw258KusNUek7P8Bg1F+PE2Y3J6U7Bho6k0tV7465nHgwM/f+jvJ+r//1g
 UJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GpTJ9NhcSHbC2SHkP7WV6bExeaXGM4BHG+yCGKJddeQ=;
 b=tMWgAPirIm8+Q2g1xhAZ5zodoky9F30g5N5CLXK86J16kYH0F4CodJHrHMVIvlHd1p
 4MJAPhDO1eN+9JIKlZRRnq93QNToqBo/LgCtjoON4q2TEp+gb1Cl5oKJbr+CgQW7UXp7
 qX2nrly39NW+YmcJUBeHnGqFpfMDlwXUWZnfXuyLQ2JTjOgDTlATC0RCzMPH9qXKkS2c
 cNuG65B1stzb9JHKFrI0xOeeDFfYhLJ+WDhISCheJn2+buM15qqxSu+m1HJ+f/DULDbq
 +QnHSQbMOnEdz4MuXOISpM4Wf7ruypP/uOVhnbhFVBK58yxKGene9eUeLD7kJsZFV+0r
 yx4Q==
X-Gm-Message-State: AOAM533bV8Bg9wXr875j93gUuFCCyls7yp2q3D1QC2f1G1er3q+dO4FN
 30cYxK2y8mPQPFi0OkTffhnSz5KUWjqQIBFzP3g=
X-Google-Smtp-Source: ABdhPJyz2HOMPmla/KhvVjUX5fs79QskTKIbuqZM939XJTBgq2QZjVGOQOOtedjqU7Z4TJ+0yZKHMdX0R3d4OZpx9Qc=
X-Received: by 2002:a05:620a:43a3:b0:6a3:241f:c0a3 with SMTP id
 a35-20020a05620a43a300b006a3241fc0a3mr10895790qkp.457.1653209783713; Sun, 22
 May 2022 01:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220520174537.5827-1-shentey@gmail.com>
 <20220520174537.5827-2-shentey@gmail.com>
 <09cf8b54-189b-b03f-1ddd-e414c9c9c9aa@ilande.co.uk>
In-Reply-To: <09cf8b54-189b-b03f-1ddd-e414c9c9c9aa@ilande.co.uk>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sun, 22 May 2022 10:56:06 +0200
Message-ID: <CAG4p6K5pZGwD+rProrOrG6UPuLXQEEMAMWzRjP_4d4-5d6J89w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/i386/microvm-dt: Determine mc146818rtc's IRQ
 number from QOM property
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e5c6a105df95e5d9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=shentey@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e5c6a105df95e5d9
Content-Type: text/plain; charset="UTF-8"

On Sat, May 21, 2022 at 11:20 AM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 20/05/2022 18:45, Bernhard Beschow wrote:
>
> > Since commit 3b004a16540aa41f2aa6a1ceb0bf306716766914 'hw/rtc/
> > mc146818rtc: QOM'ify IRQ number' mc146818rtc's IRQ number is
> > configurable. Fix microvm-dt to respect its value.
> >
> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >   hw/i386/microvm-dt.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> > index 9c3c4995b4..a5db9e4e5a 100644
> > --- a/hw/i386/microvm-dt.c
> > +++ b/hw/i386/microvm-dt.c
> > @@ -208,7 +208,7 @@ static void dt_add_isa_serial(MicrovmMachineState
> *mms, ISADevice *dev)
> >   static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
> >   {
> >       const char compat[] = "motorola,mc146818";
> > -    uint32_t irq = RTC_ISA_IRQ;
> > +    uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", NULL);
> >       hwaddr base = RTC_ISA_BASE;
> >       hwaddr size = 8;
> >       char *nodename;
>
> Rather than using NULL as the last parameter to object_property_get_uint()
> I think
> using &error_abort to force an explicit failure if the irq property
> doesn't exist
> would be better.
>

Ack. I'll then also fix dt_add_isa_serial() in a dedicated commit for
consistency.

Otherwise:
>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
>
> ATB,
>
> Mark.
>

--000000000000e5c6a105df95e5d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, May 21, 2022 at 11:20 AM Mark Cave-Ayland &lt;<a href=3D"mai=
lto:mark.cave-ayland@ilande.co.uk">mark.cave-ayland@ilande.co.uk</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 20/05/20=
22 18:45, Bernhard Beschow wrote:<br>
<br>
&gt; Since commit 3b004a16540aa41f2aa6a1ceb0bf306716766914 &#39;hw/rtc/<br>
&gt; mc146818rtc: QOM&#39;ify IRQ number&#39; mc146818rtc&#39;s IRQ number =
is<br>
&gt; configurable. Fix microvm-dt to respect its value.<br>
&gt; <br>
&gt; Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.co=
m" target=3D"_blank">shentey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/i386/microvm-dt.c | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c<br>
&gt; index 9c3c4995b4..a5db9e4e5a 100644<br>
&gt; --- a/hw/i386/microvm-dt.c<br>
&gt; +++ b/hw/i386/microvm-dt.c<br>
&gt; @@ -208,7 +208,7 @@ static void dt_add_isa_serial(MicrovmMachineState =
*mms, ISADevice *dev)<br>
&gt;=C2=A0 =C2=A0static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADe=
vice *dev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char compat[] =3D &quot;motorola,mc146=
818&quot;;<br>
&gt; -=C2=A0 =C2=A0 uint32_t irq =3D RTC_ISA_IRQ;<br>
&gt; +=C2=A0 =C2=A0 uint32_t irq =3D object_property_get_uint(OBJECT(dev), =
&quot;irq&quot;, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr base =3D RTC_ISA_BASE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr size =3D 8;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *nodename;<br>
<br>
Rather than using NULL as the last parameter to object_property_get_uint() =
I think <br>
using &amp;error_abort to force an explicit failure if the irq property doe=
sn&#39;t exist <br>
would be better.<br></blockquote><div><span style=3D"color:rgb(0,0,0)"><br>=
</span></div><div><span style=3D"color:rgb(0,0,0)">Ack. I&#39;ll then also =
fix dt_add_isa_serial() in a dedicated commit for consistency.</span></div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Otherwise:<br>
<br>
Reviewed-by: Mark Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande=
.co.uk" target=3D"_blank">mark.cave-ayland@ilande.co.uk</a>&gt;<br>
<br>
<br>
ATB,<br>
<br>
Mark.<br>
</blockquote></div></div>

--000000000000e5c6a105df95e5d9--

