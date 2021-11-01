Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE344210A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:48:43 +0100 (CET)
Received: from localhost ([::1]:41888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdIQ-0000ZG-FU
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mhbPU-0005sp-5D
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:47:52 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:38553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1mhbPR-000802-2T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:47:51 -0400
Received: by mail-lf1-x134.google.com with SMTP id x27so37829560lfu.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cOI7edm04zo0CgaYXL2bz6OtjJJlDjkbTWnIHiarVq8=;
 b=DbYthG/fHvqAMcqF49APPjHP/VPsc4YJhQg63l9z9PiipJXhpcDbRUyI2VTxqWbj/j
 DG9tliPE2Aa6gqYz73QribRLsVS/ONESmUS0n/bqGVUW8DYa50s4sfG6kQou1rCytrA8
 TNwROKS9ae6J5CIiWWT3KpqkXg7+c/3yAxhUHADJVohYs9Wvg5W/5bn+SHmGVkFgsRmx
 VQE8NDJAZRQ73vMu7V+hPSEuZW80sq+AWOSX0yqesiIzroe/RTk6zv9Ts4OPa/i9TK7y
 5NIwwcZrNQiODEb9SqxnR2MvueXy18KOSL9JntcjSiw+LqxlgytOavG68Go9Y2bG8LIE
 n14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cOI7edm04zo0CgaYXL2bz6OtjJJlDjkbTWnIHiarVq8=;
 b=YgbvkPI7bmnxRDeqIN+vTKl6nn0YZ7pkqFz7DJetAR0/FALwQcoQeRT6E9VI0lAMTS
 b0C+WQB8cRtt7n1Ldgqz4/FPbfEc1fWCzJl6/bHvZlZzR/GzQ5L75JBArxTKK41rMq0x
 Iml5YPi/AHZCBvbgFoTwnHlUR9MC9HSBaIyTV5UkZ0/3EJRYBJPPBtjwecPfUeyi77jn
 uXDtb3JiVfqXtEXGL1/aX8L1BOkvpw6uS/kJV/T59z/8JyvnYR57MmAK1B32hunhRJxs
 RD4Q6elyMpAd+p6NXEDlz5TCGTK1rwu/lc+1QKkOWXnwrjC49w2Edv8OXon8bW74xOKC
 MtLw==
X-Gm-Message-State: AOAM531FFriUOAAjM9M8W93Fcu3itQONcHatwRnnm4oVfqZMufAZXJEJ
 ZqWaCDmfoMMx3ZobtjuU+aK75oM46eiQZi+xdaSw7A==
X-Google-Smtp-Source: ABdhPJzkwFQY2B/0DdoS8FY7OOVsDimPXv29ymSoT/dKtwSZQNYmRWzD0hfvwQXIvk7Qc+8myFIlC9sQhzNZ7NpSaK8=
X-Received: by 2002:ac2:5f0d:: with SMTP id 13mr29574587lfq.334.1635788865273; 
 Mon, 01 Nov 2021 10:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-6-wuhaotsh@google.com>
 <CAFEAcA8mwXkPSMubBjmqzFkK6ghmyW_ngz9AejeoF-GKkqSL6A@mail.gmail.com>
In-Reply-To: <CAFEAcA8mwXkPSMubBjmqzFkK6ghmyW_ngz9AejeoF-GKkqSL6A@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 1 Nov 2021 10:47:23 -0700
Message-ID: <CAGcCb13jV8r6nRspELZOai_HYJ4t6E1OfOYSx7-wCjaAX8Fodg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, KFTING@nuvoton.com, hskinnemoen@google.com
Content-Type: multipart/alternative; boundary="0000000000003ebbae05cfbdc61d"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x134.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003ebbae05cfbdc61d
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 1, 2021 at 10:41 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > We made 3 changes to the at24c_eeprom_init function in
> > npcm7xx_boards.c:
> >
> > 1. We allow the function to take a I2CBus* as parameter. This allows
> >    us to attach an EEPROM device behind an I2C mux which is not
> >    possible with the old method.
> >
> > 2. We make at24c EEPROMs are backed by drives so that we can
> >    specify the content of the EEPROMs.
> >
> > 3. Instead of using i2c address as unit number, This patch assigns
> >    unique unit numbers for each eeproms in each board. This avoids
> >    conflict in providing multiple eeprom contents with the same address.
> >    In the old method if we specify two drives with the same unit number,
> >    the following error will occur: `Device with id 'none85' exists`.
> >
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  hw/arm/npcm7xx_boards.c | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> > index a656169f61..cdb52b9922 100644
> > --- a/hw/arm/npcm7xx_boards.c
> > +++ b/hw/arm/npcm7xx_boards.c
> > @@ -107,13 +107,18 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState
> *soc, uint32_t num)
> >      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]),
> "i2c-bus"));
> >  }
> >
> > -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
> > -                              uint32_t rsize)
> > +static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,
> > +                              uint32_t rsize, int unit_number)
> >  {
> > -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
> >      I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> >      DeviceState *dev = DEVICE(i2c_dev);
> > +    BlockInterfaceType type = IF_NONE;
>
> Why make this a variable? We only use it in one place...
>
You're right, we can actually inline it.

>
> -- PMM
>

--0000000000003ebbae05cfbdc61d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 1, 2021 at 10:41 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, 21 Oct 2021 at 19:40, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@g=
oogle.com" target=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; We made 3 changes to the at24c_eeprom_init function in<br>
&gt; npcm7xx_boards.c:<br>
&gt;<br>
&gt; 1. We allow the function to take a I2CBus* as parameter. This allows<b=
r>
&gt;=C2=A0 =C2=A0 us to attach an EEPROM device behind an I2C mux which is =
not<br>
&gt;=C2=A0 =C2=A0 possible with the old method.<br>
&gt;<br>
&gt; 2. We make at24c EEPROMs are backed by drives so that we can<br>
&gt;=C2=A0 =C2=A0 specify the content of the EEPROMs.<br>
&gt;<br>
&gt; 3. Instead of using i2c address as unit number, This patch assigns<br>
&gt;=C2=A0 =C2=A0 unique unit numbers for each eeproms in each board. This =
avoids<br>
&gt;=C2=A0 =C2=A0 conflict in providing multiple eeprom contents with the s=
ame address.<br>
&gt;=C2=A0 =C2=A0 In the old method if we specify two drives with the same =
unit number,<br>
&gt;=C2=A0 =C2=A0 the following error will occur: `Device with id &#39;none=
85&#39; exists`.<br>
&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/npcm7xx_boards.c | 15 ++++++++++-----<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c<br>
&gt; index a656169f61..cdb52b9922 100644<br>
&gt; --- a/hw/arm/npcm7xx_boards.c<br>
&gt; +++ b/hw/arm/npcm7xx_boards.c<br>
&gt; @@ -107,13 +107,18 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState =
*soc, uint32_t num)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return I2C_BUS(qdev_get_child_bus(DEVICE(&amp;soc-=
&gt;smbus[num]), &quot;i2c-bus&quot;));<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t add=
r,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rsize)<br>
&gt; +static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t addr,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rsize, int unit_number)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 I2CBus *i2c_bus =3D npcm7xx_i2c_get_bus(soc, bus);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 I2CSlave *i2c_dev =3D i2c_slave_new(&quot;at24c-ee=
prom&quot;, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceState *dev =3D DEVICE(i2c_dev);<br>
&gt; +=C2=A0 =C2=A0 BlockInterfaceType type =3D IF_NONE;<br>
<br>
Why make this a variable? We only use it in one place...<br></blockquote><d=
iv>You&#39;re right, we can actually inline it.=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
</blockquote></div></div>

--0000000000003ebbae05cfbdc61d--

