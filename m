Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F5268E10E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 20:22:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPTX7-0000lq-LS; Tue, 07 Feb 2023 14:21:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pPTX5-0000jm-73
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:21:35 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pPTX3-00073R-2a
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 14:21:34 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so13941794wmb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 11:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mLqXn/LlfcMwf4LMPpskGKbQWRj+C8qtdVq1ht52hiI=;
 b=Q118mYL7FuX+ai0x0CXiI/aLq6QjG9HYD4Rr3HvEK3CTreOkypJUzlZhYsK5lpbOaz
 pX3d5FikUx8jP7mC+cHsOFX+L7GPz7236bA3T/Ul0K2mgzfC+APknUoFly1brd97agf9
 4RPfc59e4YzyVbpABSDZmF3iremlRJ4JafjQIziFA7T5Qf5Iw82lg79IrOxihTBGHkBE
 DqcALnje6BRMpFpO0YptcKQnDPf2YEbZuAkcyXjDW+Ku4k2NcYuVxmaDAaV4PmT0rX5O
 faXU+RIphsG+BBEIL6HRkLAi55Fr8J4jVoLar+m8YI068qDVDZNgjiO2+Uxwjgq1upGx
 KjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mLqXn/LlfcMwf4LMPpskGKbQWRj+C8qtdVq1ht52hiI=;
 b=oHaELG5Ww5uvxv0LPH+7QSg9OlALE+m1BgxJV35kor0qtCcdJ9IgnwO87weRiblhHC
 W+y+wPccrMOGeeas0X+Y4ytZLj24hlfRalXPHcS8IYQmjzdQf7BUlqI6kbM5ESCeLdvI
 jM0x/0+rFKWVCBRJnh4c/duGlYitC1YjGVfCznoxltSSzUptH4/Qm8LUkS6obmpLPDbT
 SAsskY6j101Gf0+NN/gD3QXXsEelEtaHPISp5Ve8qYd1vpukGzYFZq3c0A2x++SnH1ph
 5juOy9eb27NhckDj0/FMsmqy9OxnaWDYg7lpRq+xGKXogoUZg1WtQJ7fgO7QKL7B3BMO
 XO6g==
X-Gm-Message-State: AO0yUKV9CKPAwvzmd7N2jAnro07jyR8QuYajQsvSLxzUJoGa/RdbYVB+
 Mf3UYITdyFzdebkEC/M9lxtm6gbzYf5uFFRgPrySeA==
X-Google-Smtp-Source: AK7set9faqlwUiL44QAGSVgNdjMesnELRnNUj5ZX/nWoooyL+d6+pWd4F2AOw0GHUvovht1Bo9jVQEmvRF1HYIzS2Ig=
X-Received: by 2002:a05:600c:2045:b0:3dc:5ad2:86ed with SMTP id
 p5-20020a05600c204500b003dc5ad286edmr7997wmg.33.1675797690466; Tue, 07 Feb
 2023 11:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20230206233428.2772669-1-wuhaotsh@google.com>
 <20230206233428.2772669-3-wuhaotsh@google.com>
 <de4b4eb1-0f77-fb20-5e8e-be751f4a32a5@linaro.org>
 <CAGcCb13Asc1GztkXEVwMPmh=7Ty1XGyeL9j=hO652uVYnyWNUg@mail.gmail.com>
In-Reply-To: <CAGcCb13Asc1GztkXEVwMPmh=7Ty1XGyeL9j=hO652uVYnyWNUg@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 7 Feb 2023 11:21:18 -0800
Message-ID: <CAGcCb12jxNqFW096UBcfs=aiQgEY5Jeo6=76wZu6-42wV8r2rQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/ssi: Add Nuvoton PSPI Module
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="0000000000000ebc2d05f4210e3e"
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=wuhaotsh@google.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000000ebc2d05f4210e3e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2023 at 10:46 AM Hao Wu <wuhaotsh@google.com> wrote:

> Thanks for your review!
>
> On Mon, Feb 6, 2023 at 11:13 PM Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org>
> wrote:
>
>> On 7/2/23 00:34, Hao Wu wrote:
>> > Nuvoton's PSPI is a general purpose SPI module which enables
>> > connections to SPI-based peripheral devices.
>> >
>> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
>> > Reviewed-by: Chris Rauer <crauer@google.com>
>> > ---
>> >   MAINTAINERS                |   6 +-
>> >   hw/ssi/meson.build         |   2 +-
>> >   hw/ssi/npcm_pspi.c         | 216 +++++++++++++++++++++++++++++++++++=
++
>> >   hw/ssi/trace-events        |   5 +
>> >   include/hw/ssi/npcm_pspi.h |  53 +++++++++
>> >   5 files changed, 278 insertions(+), 4 deletions(-)
>> >   create mode 100644 hw/ssi/npcm_pspi.c
>> >   create mode 100644 include/hw/ssi/npcm_pspi.h
>>
>>
>> > +static const MemoryRegionOps npcm_pspi_ctrl_ops =3D {
>> > +    .read =3D npcm_pspi_ctrl_read,
>> > +    .write =3D npcm_pspi_ctrl_write,
>> > +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>> > +    .valid =3D {
>> > +        .min_access_size =3D 1,
>> > +        .max_access_size =3D 2,
>>
>> I'm not sure about ".max_access_size =3D 2". The datasheet does
>> not seem public. Does that mean the CPU bus can not do a 32-bit
>> access to read two consecutive 16-bit registers? (these fields
>> restrict the guest accesses to the device).
>>
>> > +        .unaligned =3D false,
>> > +    },
>>
>> You might want instead (which is how you implemented the r/w
>> handlers):
>>
>>      .impl.min_access_size =3D 2,
>>      .impl.max_access_size =3D 2,
>>
> Thanks for the reminder. The datasheet suggests it's either 8-bit or
> 16-bit accesses. But I think using your suggestion makes sense
> and will be more widely adapted.
>
>>
>> > +};
>>
>>
>> > +static void npcm_pspi_realize(DeviceState *dev, Error **errp)
>> > +{
>> > +    NPCMPSPIState *s =3D NPCM_PSPI(dev);
>> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>> > +    Object *obj =3D OBJECT(dev);
>> > +
>> > +    s->spi =3D ssi_create_bus(dev, "pspi");
>>
>> FYI there is an ongoing discussion about how to model QOM tree. If
>> this bus isn't shared with another controller, the "embed QOM child
>> in parent" style could be preferred. If so, the bus would be created
>> as:
>>
>>        object_initialize_child(obj, "pspi", &s->spi, TYPE_SSI_BUS);
>>
> I was just following some existing code here. I think I can use the new
> style.
>
I've tried to use this and got the following error:
**
ERROR:../qom/object.c:511:object_initialize_with_type: assertion failed:
(size >=3D type->instance_size)
Bail out! ERROR:../qom/object.c:511:object_initialize_with_type: assertion
failed: (size >=3D type->instance_size)

I think the problem is that we define s->spi as SSIBus* instead of SSIBus.
But if we define it as SSIBus, we'll
get an incomplete type error. Fixing it will require refactoring
hw/ssi/ssi.c which I'm not sure if we want to do
it right now. This code is consistent with other code in hw/ssi so I guess
we can leave it here for now and wait
for a future refactor.

>
>> > +    memory_region_init_io(&s->mmio, obj, &npcm_pspi_ctrl_ops, s,
>> > +                          "mmio", 4 * KiB);
>> > +    sysbus_init_mmio(sbd, &s->mmio);
>> > +    sysbus_init_irq(sbd, &s->irq);
>> > +}
>>
>>
>> > diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
>> > index c707d4aaba..16ea9954c4 100644
>> > --- a/hw/ssi/trace-events
>> > +++ b/hw/ssi/trace-events
>>
>> > +# npcm_pspi.c
>> > +npcm_pspi_enter_reset(const char *id, int reset_type) "%s reset type:
>> %d"
>> > +npcm_pspi_ctrl_read(const char *id, uint64_t addr, uint16_t data) "%s
>> offset: 0x%04" PRIx64 " value: 0x%08" PRIx16
>> > +npcm_pspi_ctrl_write(const char *id, uint64_t addr, uint16_t data) "%=
s
>> offset: 0x%04" PRIx64 " value: 0x%08" PRIx16
>>
>> Since the region is 4KiB and the implementation is 16-bit, the formats
>> could be simplified as offset 0x%03 and value 0x%04. The traces will
>> then be more digestible to human eyes.
>>
> I'll do this.
>
>>
>> Modulo the impl.access_size change:
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>
>>

--0000000000000ebc2d05f4210e3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 7, 2023 at 10:46 AM Hao W=
u &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div dir=3D"ltr">Thanks for your review!</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 6, 2023 at 11:13 =
PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" tar=
get=3D"_blank">philmd@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 7/2/23 00:34, Hao Wu wrote:<br>
&gt; Nuvoton&#39;s PSPI is a general purpose SPI module which enables<br>
&gt; connections to SPI-based peripheral devices.<br>
&gt; <br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" targ=
et=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0hw/ssi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0hw/ssi/npcm_pspi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 216 =
+++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/ssi/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 +<br>
&gt;=C2=A0 =C2=A0include/hw/ssi/npcm_pspi.h |=C2=A0 53 +++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 278 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/ssi/npcm_pspi.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 include/hw/ssi/npcm_pspi.h<br>
<br>
<br>
&gt; +static const MemoryRegionOps npcm_pspi_ctrl_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D npcm_pspi_ctrl_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D npcm_pspi_ctrl_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_LITTLE_ENDIAN,<br>
&gt; +=C2=A0 =C2=A0 .valid =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 2,<br>
<br>
I&#39;m not sure about &quot;.max_access_size =3D 2&quot;. The datasheet do=
es<br>
not seem public. Does that mean the CPU bus can not do a 32-bit<br>
access to read two consecutive 16-bit registers? (these fields<br>
restrict the guest accesses to the device).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .unaligned =3D false,<br>
&gt; +=C2=A0 =C2=A0 },<br>
<br>
You might want instead (which is how you implemented the r/w<br>
handlers):<br>
<br>
=C2=A0 =C2=A0 =C2=A0.impl.min_access_size =3D 2,<br>
=C2=A0 =C2=A0 =C2=A0.impl.max_access_size =3D 2,<br></blockquote><div>Thank=
s for the reminder. The datasheet suggests it&#39;s either 8-bit or</div><d=
iv>16-bit accesses. But I think using your suggestion makes sense</div><div=
>and will be more widely adapted.=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt; +};<br>
<br>
<br>
&gt; +static void npcm_pspi_realize(DeviceState *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCMPSPIState *s =3D NPCM_PSPI(dev);<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);<br>
&gt; +=C2=A0 =C2=A0 Object *obj =3D OBJECT(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;spi =3D ssi_create_bus(dev, &quot;pspi&quot;);<br=
>
<br>
FYI there is an ongoing discussion about how to model QOM tree. If<br>
this bus isn&#39;t shared with another controller, the &quot;embed QOM chil=
d<br>
in parent&quot; style could be preferred. If so, the bus would be created<b=
r>
as:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, &quot;pspi&quot;, &=
amp;s-&gt;spi, TYPE_SSI_BUS);<br></blockquote><div>I was just following som=
e existing code here. I think I can use the new style.=C2=A0</div></div></d=
iv></blockquote><div>I&#39;ve tried to use this and got the following error=
:</div>**<br>ERROR:../qom/object.c:511:object_initialize_with_type: asserti=
on failed: (size &gt;=3D type-&gt;instance_size)<br><div>Bail out! ERROR:..=
/qom/object.c:511:object_initialize_with_type: assertion failed: (size &gt;=
=3D type-&gt;instance_size)</div><div><br></div><div>I think the problem is=
 that we define s-&gt;spi as SSIBus* instead of SSIBus. But if we define it=
 as SSIBus, we&#39;ll</div><div>get an incomplete type error. Fixing it wil=
l require refactoring hw/ssi/ssi.c which I&#39;m not sure if we want to do<=
/div><div>it right now. This code is consistent with other code in hw/ssi s=
o I guess we can leave it here for now and wait</div><div>for a future refa=
ctor.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;mmio, obj, &amp;npcm_p=
spi_ctrl_ops, s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;mmio&quot;, 4 * KiB);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;mmio);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;irq);<br>
&gt; +}<br>
<br>
<br>
&gt; diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events<br>
&gt; index c707d4aaba..16ea9954c4 100644<br>
&gt; --- a/hw/ssi/trace-events<br>
&gt; +++ b/hw/ssi/trace-events<br>
<br>
&gt; +# npcm_pspi.c<br>
&gt; +npcm_pspi_enter_reset(const char *id, int reset_type) &quot;%s reset =
type: %d&quot;<br>
&gt; +npcm_pspi_ctrl_read(const char *id, uint64_t addr, uint16_t data) &qu=
ot;%s offset: 0x%04&quot; PRIx64 &quot; value: 0x%08&quot; PRIx16<br>
&gt; +npcm_pspi_ctrl_write(const char *id, uint64_t addr, uint16_t data) &q=
uot;%s offset: 0x%04&quot; PRIx64 &quot; value: 0x%08&quot; PRIx16<br>
<br>
Since the region is 4KiB and the implementation is 16-bit, the formats<br>
could be simplified as offset 0x%03 and value 0x%04. The traces will<br>
then be more digestible to human eyes.<br></blockquote><div>I&#39;ll do thi=
s.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Modulo the impl.access_size change:<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000000ebc2d05f4210e3e--

