Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6AA5AEEB0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 17:27:08 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVaTj-0002Ay-3K
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 11:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oVaGp-0004XL-JK
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 11:13:47 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkng@rivosinc.com>) id 1oVaGi-0003OM-F5
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 11:13:47 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 65so1442704pfx.0
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 08:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=DKejRoIJjEg+BPd+a6EeNsvlb2lWTh6g8+v8qmrUDjI=;
 b=gADHg1l2kl22wj2E/VA4iO9qfk3Ao3lnLLdliFXF3JfEBECaFm8xfid1Fgvc0YFPa2
 CW4qKA3yXsYq0IDlGM9ksF0PPsunsZXylz0JBWTwHAtF0rabhsNU7vtHYoe8dBZJRtBX
 R1r/6uSOxp/TaP3n34BJuo2I+mP6endtAZXcewEPHh7GJlpjClBMq/EBYV7PB0LxbC/8
 d05pfupygwL0enrG6Rb/5d2kDFz10jXZAm9sbYd/URjHi00R0gkQqWBgwj61tBvy9IsY
 u9U8VP0dXNZNH5ck7ZPsZQ5NEvPHTIPaFPJJ02VWAV+AsXnaimX/t01N/rBXnxOEkF5z
 9VSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=DKejRoIJjEg+BPd+a6EeNsvlb2lWTh6g8+v8qmrUDjI=;
 b=hDt7gYTbENhnukjM3KEPg8Cd8CTVxnTnFCq3u1RYBb596e4QFtD31JHjjKI8xKa9ZK
 qR/cddaSQP261ESj7s2LpBeM17B8faRh6AX6KF/ZgAkft2PITZBHUk/P5JCFkprFiO68
 kvkpRg5MEwjSQCb9GCbCDk4s9mBmk3mNhbteb8lc2f/EF2hvUTHK8SDz2I3qUiT+gpzD
 956yQLwpBl+0fJwSY6eR0qnWh5x9pKooIfgQzQHbToL7ngfAMEMGTdt6eoJT/5wYZndT
 eQ5LxdCzlk06Qrqzf+SjdkD5DhKtUrEnL02Ryn30ysz8KRfb3Lun/JPtosAEeZDTOa5G
 wAOw==
X-Gm-Message-State: ACgBeo1QwmbpxAwscnAs1ZJMwBVBm95aeYlUkyF6MX7Ci/FXN4I8Ip3k
 owt2salmNlE0W71omWT7svz7sojyUN9sEVT5dJXt3Q==
X-Google-Smtp-Source: AA6agR4ya01aulXflO3ork1c5pFLp7Z81I6Y2Z7AZdX5v7XkyWdmQObScsA5X6OmaN94Rg6nK75lsRJPiVo5NhHDvsE=
X-Received: by 2002:a65:6a83:0:b0:42b:344a:3546 with SMTP id
 q3-20020a656a83000000b0042b344a3546mr47336849pgu.612.1662477214396; Tue, 06
 Sep 2022 08:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAB88-qPD2OAxeg4WA65utUmFj4Y=SceeFTuStpZS4pPWevdBXA@mail.gmail.com>
 <20220905131544.2xlaycrcyviufo5y@kamzik>
In-Reply-To: <20220905131544.2xlaycrcyviufo5y@kamzik>
From: Tyler Ng <tkng@rivosinc.com>
Date: Tue, 6 Sep 2022 08:13:28 -0700
Message-ID: <CAB88-qPOGVksP1ekqTjcGHbi2_iVzsW-b9wokgREEQJ8LgfU=Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/intc: sifive_plic.c: Fix interrupt priority index.
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Alistair.Francis@wdc.com, 
 bin.meng@windriver.com, palmer@dabbelt.com, thuth@redhat.com, 
 pbonzini@redhat.com, lvivier@redhat.com
Content-Type: multipart/alternative; boundary="000000000000cfd11d05e803a3e1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=tkng@rivosinc.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000cfd11d05e803a3e1
Content-Type: text/plain; charset="UTF-8"

Here's the patch SHA that introduced the
offset: 0feb4a7129eb4f120c75849ddc9e50495c50cb63

-Tyler

On Mon, Sep 5, 2022 at 6:15 AM Andrew Jones <ajones@ventanamicro.com> wrote:

> On Thu, Sep 01, 2022 at 03:50:06PM -0700, Tyler Ng wrote:
> > Fixes a bug in which the index of the interrupt priority is off by 1.
> > For example, using an IRQ number of 3 with a priority of 1 is supposed
> to set
> > plic->source_priority[2] = 1, but instead it sets
> > plic->source_priority[3] = 1. When an interrupt is claimed to be
> > serviced, it checks the index 2 instead of 3.
> >
> > Signed-off-by: Tyler Ng <tkng@rivosinc.com>
>
> Fixes tag?
>
> Thanks,
> drew
>
> > ---
> >  hw/intc/sifive_plic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> > index af4ae3630e..e75c47300a 100644
> > --- a/hw/intc/sifive_plic.c
> > +++ b/hw/intc/sifive_plic.c
> > @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr
> > addr, uint64_t value,
> >      SiFivePLICState *plic = opaque;
> >
> >      if (addr_between(addr, plic->priority_base, plic->num_sources <<
> 2)) {
> > -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> > +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 0;
> >
> >          plic->source_priority[irq] = value & 7;
> >          sifive_plic_update(plic);
> > --
> > 2.30.2
> >
>

--000000000000cfd11d05e803a3e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Here&#39;s the patch SHA that introduced the offset:=C2=A0=
0feb4a7129eb4f120c75849ddc9e50495c50cb63<div><br></div><div>-Tyler</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, Sep 5, 2022 at 6:15 AM Andrew Jones &lt;<a href=3D"mailto:ajones@venta=
namicro.com">ajones@ventanamicro.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Thu, Sep 01, 2022 at 03:50:06PM -070=
0, Tyler Ng wrote:<br>
&gt; Fixes a bug in which the index of the interrupt priority is off by 1.<=
br>
&gt; For example, using an IRQ number of 3 with a priority of 1 is supposed=
 to set<br>
&gt; plic-&gt;source_priority[2] =3D 1, but instead it sets<br>
&gt; plic-&gt;source_priority[3] =3D 1. When an interrupt is claimed to be<=
br>
&gt; serviced, it checks the index 2 instead of 3.<br>
&gt; <br>
&gt; Signed-off-by: Tyler Ng &lt;<a href=3D"mailto:tkng@rivosinc.com" targe=
t=3D"_blank">tkng@rivosinc.com</a>&gt;<br>
<br>
Fixes tag?<br>
<br>
Thanks,<br>
drew<br>
<br>
&gt; ---<br>
&gt;=C2=A0 hw/intc/sifive_plic.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c<br>
&gt; index af4ae3630e..e75c47300a 100644<br>
&gt; --- a/hw/intc/sifive_plic.c<br>
&gt; +++ b/hw/intc/sifive_plic.c<br>
&gt; @@ -178,7 +178,7 @@ static void sifive_plic_write(void *opaque, hwaddr=
<br>
&gt; addr, uint64_t value,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SiFivePLICState *plic =3D opaque;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (addr_between(addr, plic-&gt;priority_base, pli=
c-&gt;num_sources &lt;&lt; 2)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t irq =3D ((addr - plic-&gt;priori=
ty_base) &gt;&gt; 2) + 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t irq =3D ((addr - plic-&gt;priori=
ty_base) &gt;&gt; 2) + 0;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plic-&gt;source_priority[irq] =3D va=
lue &amp; 7;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sifive_plic_update(plic);<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt; <br>
</blockquote></div>

--000000000000cfd11d05e803a3e1--

