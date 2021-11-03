Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935B0444A87
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:54:38 +0100 (CET)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miODN-00041T-Fe
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1miOBU-0002Qb-Kz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:52:40 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:43874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1miOBS-0008Ey-OM
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:52:40 -0400
Received: by mail-lj1-x22f.google.com with SMTP id d23so6164687ljj.10
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 14:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KpJGUIyZCpeEVL9h9sds8BInAYV2efoTpkM/pTG6bzk=;
 b=mfCG1pwTEJELBX2f/RQjt9l1v5Gdoqrlkoay/keqWybSYHG6EEI4wmvEa9oDR88c1J
 91RfVIun4FQBoocgUw+iVHqLxzW70itETGSrgGto28wZrHWEXqQZd8BPMCq0/SiZS5Ht
 a+6QTKdkTpre6YVe0/b0MUkHkUI3It2KLZOZwv35/qaDfh63AK5pDsO+8yPmVpfTmpGI
 5zdVrUm4+vOC+yBXFtjjtHrPAWElBnW9DsHxG5xl6RdKKWOpAtZ+vfM40z8RhMb2oNZO
 PUMYs3loXOOdJZ15pI9lPHNCNf44AmloIQKyqFQWO+aY3e5EIArX96M9M95mrw0x4kus
 IKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KpJGUIyZCpeEVL9h9sds8BInAYV2efoTpkM/pTG6bzk=;
 b=ANRPtW72KoVSfZUdYtmSYcLLCfml3T+UFsP7Cgv5tKRpWD8PHy5gA/M8UaD+Szj9CY
 SAOrzGnqIXPkjaYOqJgk/OVEYBN3bDS5/TOM3ksYyUlA1fCQDqGPx+IJ+cW6TuTz9yE/
 ojgYCO/FGFaCe2DtTpA/kUlS/X8V4t4mnx1Wz3m5JBMir0zvJciensvHNJth/oDZ2SSm
 0PTN4vo6fOBQehJ/7kfNNJZuMjuejn8611V7lTH2rG/eN+nMKO7wMKX6FhUa2ly8O2GL
 qvuLSM7TcL/YGV8xUAoe1biRnpsJPeFdKXuaPrf3afmU/nZpyMnt1TaFw9c5xZyZ7IEp
 znSQ==
X-Gm-Message-State: AOAM531ISx6sjGJ9zXxKGCTiILjBEhQoXTyaxlbdoAIL5oMC8kJK93CY
 DxTI29EExkBaeZ3abrhTCTs2OpuCCtM4iah98u9dWQ==
X-Google-Smtp-Source: ABdhPJxnKgNOcDg9kSkeJ8Sked+qexT54ofkCDH5xE2/QQr+YkoG/gYRMlEJr5gSPqHfN2OwuMozkjrUGVz/15WIOjY=
X-Received: by 2002:a2e:a789:: with SMTP id c9mr28554036ljf.207.1635976356760; 
 Wed, 03 Nov 2021 14:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-6-wuhaotsh@google.com>
 <CAFEAcA8mwXkPSMubBjmqzFkK6ghmyW_ngz9AejeoF-GKkqSL6A@mail.gmail.com>
 <CAGcCb13jV8r6nRspELZOai_HYJ4t6E1OfOYSx7-wCjaAX8Fodg@mail.gmail.com>
 <1567de73-332b-dcf6-9a8e-fea0cd071f9a@redhat.com>
In-Reply-To: <1567de73-332b-dcf6-9a8e-fea0cd071f9a@redhat.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 3 Nov 2021 14:52:20 -0700
Message-ID: <CAGcCb11p1fg_WSRsYzaOE3kD_GUx_gf3KLmfrTFsrJKaiCMbaQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hw/nvram: Update at24c EEPROM init function in
 NPCM7xx boards
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, KFTING@nuvoton.com, 
 hskinnemoen@google.com, Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009bbbea05cfe96df3"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x22f.google.com
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

--0000000000009bbbea05cfe96df3
Content-Type: text/plain; charset="UTF-8"

Thanks for the comment. I'll upload a new version using IF_OTHER as
discussed in that thread.

I don't know if adding the assertion for type != IF_NONE is a good idea now
so I didn't add that.
If you think that's good I can add it as well.

On Wed, Nov 3, 2021 at 2:13 AM Thomas Huth <thuth@redhat.com> wrote:

> On 01/11/2021 18.47, Hao Wu wrote:
> >
> >
> > On Mon, Nov 1, 2021 at 10:41 AM Peter Maydell <peter.maydell@linaro.org
> > <mailto:peter.maydell@linaro.org>> wrote:
> >
> >     On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com
> >     <mailto:wuhaotsh@google.com>> wrote:
> >      >
> >      > We made 3 changes to the at24c_eeprom_init function in
> >      > npcm7xx_boards.c:
> >      >
> >      > 1. We allow the function to take a I2CBus* as parameter. This
> allows
> >      >    us to attach an EEPROM device behind an I2C mux which is not
> >      >    possible with the old method.
> >      >
> >      > 2. We make at24c EEPROMs are backed by drives so that we can
> >      >    specify the content of the EEPROMs.
> >      >
> >      > 3. Instead of using i2c address as unit number, This patch assigns
> >      >    unique unit numbers for each eeproms in each board. This avoids
> >      >    conflict in providing multiple eeprom contents with the same
> address.
> >      >    In the old method if we specify two drives with the same unit
> number,
> >      >    the following error will occur: `Device with id 'none85'
> exists`.
> >      >
> >      > Signed-off-by: Hao Wu <wuhaotsh@google.com <mailto:
> wuhaotsh@google.com>>
> >      > ---
> >      >  hw/arm/npcm7xx_boards.c | 15 ++++++++++-----
> >      >  1 file changed, 10 insertions(+), 5 deletions(-)
> >      >
> >      > diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> >      > index a656169f61..cdb52b9922 100644
> >      > --- a/hw/arm/npcm7xx_boards.c
> >      > +++ b/hw/arm/npcm7xx_boards.c
> >      > @@ -107,13 +107,18 @@ static I2CBus
> *npcm7xx_i2c_get_bus(NPCM7xxState
> >     *soc, uint32_t num)
> >      >      return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]),
> >     "i2c-bus"));
> >      >  }
> >      >
> >      > -static void at24c_eeprom_init(NPCM7xxState *soc, int bus,
> uint8_t addr,
> >      > -                              uint32_t rsize)
> >      > +static void at24c_eeprom_init(I2CBus *i2c_bus, int bus, uint8_t
> addr,
> >      > +                              uint32_t rsize, int unit_number)
> >      >  {
> >      > -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
> >      >      I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> >      >      DeviceState *dev = DEVICE(i2c_dev);
> >      > +    BlockInterfaceType type = IF_NONE;
> >
> >     Why make this a variable? We only use it in one place...
> >
> > You're right, we can actually inline it.
>
> Actually, please do *not* use IF_NONE for such stuff. See the discussion
> here for details:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00970.html
>
>   Thomas
>
>

--0000000000009bbbea05cfe96df3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the comment. I&#39;ll upload a new version usin=
g IF_OTHER as discussed in that thread.<div><br></div><div>I don&#39;t know=
 if adding the assertion for type !=3D IF_NONE is a good idea now so I didn=
&#39;t add that.</div><div>If you think that&#39;s good I can add it as wel=
l.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Nov 3, 2021 at 2:13 AM Thomas Huth &lt;<a href=3D"mailto:th=
uth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 01/11/2021 18.47, Hao =
Wu wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Nov 1, 2021 at 10:41 AM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blan=
k">peter.maydell@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, 21 Oct 2021 at 19:40, Hao Wu &lt;<a href=3D=
"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:wuhaotsh@google.com" t=
arget=3D"_blank">wuhaotsh@google.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; We made 3 changes to the at24c_eeprom_init fu=
nction in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; npcm7xx_boards.c:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1. We allow the function to take a I2CBus* as=
 parameter. This allows<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 us to attach an EEPROM device be=
hind an I2C mux which is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 possible with the old method.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2. We make at24c EEPROMs are backed by drives=
 so that we can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 specify the content of the EEPRO=
Ms.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 3. Instead of using i2c address as unit numbe=
r, This patch assigns<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 unique unit numbers for each eep=
roms in each board. This avoids<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 conflict in providing multiple e=
eprom contents with the same address.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 In the old method if we specify =
two drives with the same unit number,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 the following error will occur: =
`Device with id &#39;none85&#39; exists`.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:w=
uhaotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a> &lt;mailto:<a=
 href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.com<=
/a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 hw/arm/npcm7xx_boards.c | 15 ++++++++++=
-----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 1 file changed, 10 insertions(+), 5 del=
etions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm=
/npcm7xx_boards.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index a656169f61..cdb52b9922 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/hw/arm/npcm7xx_boards.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/hw/arm/npcm7xx_boards.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -107,13 +107,18 @@ static I2CBus *npcm7xx_=
i2c_get_bus(NPCM7xxState<br>
&gt;=C2=A0 =C2=A0 =C2=A0*soc, uint32_t num)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 return I2C_BUS(qdev_get_c=
hild_bus(DEVICE(&amp;soc-&gt;smbus[num]),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;i2c-bus&quot;));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -static void at24c_eeprom_init(NPCM7xxState *=
soc, int bus, uint8_t addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rsi=
ze)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static void at24c_eeprom_init(I2CBus *i2c_bu=
s, int bus, uint8_t addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rsi=
ze, int unit_number)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 I2CBus *i2c_bus =3D npcm7xx_i2=
c_get_bus(soc, bus);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 I2CSlave *i2c_dev =3D i2c=
_slave_new(&quot;at24c-eeprom&quot;, addr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 DeviceState *dev =3D DEVI=
CE(i2c_dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 BlockInterfaceType type =3D IF=
_NONE;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Why make this a variable? We only use it in one pla=
ce...<br>
&gt; <br>
&gt; You&#39;re right, we can actually inline it.<br>
<br>
Actually, please do *not* use IF_NONE for such stuff. See the discussion <b=
r>
here for details:<br>
<br>
=C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg=
00970.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/arch=
ive/html/qemu-devel/2021-11/msg00970.html</a><br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div>

--0000000000009bbbea05cfe96df3--

