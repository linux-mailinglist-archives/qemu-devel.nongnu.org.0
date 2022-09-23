Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F295E865D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 01:44:44 +0200 (CEST)
Received: from localhost ([::1]:47230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obsLb-0000Yg-Gw
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 19:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1obsJU-0007FJ-Vf
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 19:42:32 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:41548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1obsJT-0003N8-1s
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 19:42:32 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id k2so1423120vsk.8
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 16:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jn4KdjsCboXNykDe0uR9Yd7ixztgUOADRPuP7Ji2sqw=;
 b=WRmTJTLcWrpeOtMZ7nTuh0lqifgG1KSWdZKBUr48/p2MaTvWxU9RBKNGDFBwaAKiIC
 IvsPJnlw2cK3A6kDqBAWbOGwd9Bo76SjRNRW5OQfVgTPH2A4UpAxV21fs9+jWAXB64mW
 wsH2/RydoauG7AvYv6f7foZaO9hHxe45841vUQd+gLY20cqK+/zFvNfN7SkoJDl/whN+
 LHPAVuoYbwIn4QckBrLIe3SO/cfjgF481FPYDpzG6WsFMbbutq36THUVhgkH8Nz2Uiby
 Ta86h2R/eZHqPF0+5MHKmQ8Vtc+mJb7cJD2DVOeXKebRO3t0sqyICFfZrDZsQiEimEw/
 rEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jn4KdjsCboXNykDe0uR9Yd7ixztgUOADRPuP7Ji2sqw=;
 b=ewa25SxMWH9QoZE+L61fWd5p+0oRt+55VprnX5I2fKu9Hr+eIEyT4BDIWUUG4aGvkZ
 89GskwWQdzUwqyY/jpo7d26gM8QMrzoyX05U1fc8PcK54bdROZYMBZA8dol7zc8i0lr1
 PCEIXrQPt0W6Tzt+u1MXiD8cadTI4tumQIwh7x50kiJFfKN7Ean+2VLzLbZtScwxhglk
 Wnfl9A2eLOM0EQhnxyG/i3+y72BiqgEJ4ygYKHfSS82sH25Ule7Nd6CyWVHxgYKN9kO2
 Sseke2i29jSOVopSrnvK5X5Q8uo8JYGKBdtLEVVE2N4/ewUvumswHKg1LrXvnL8pf9Gm
 ZGLQ==
X-Gm-Message-State: ACrzQf3gVZnhbZy5pF7EjbplFJ5Bmv1SprqFJzyWAxIjbIjA+6jsXbJy
 QHlGlCHv4P1J8hns3GIC2yiJ2WGuEHpFp7bxEJBlWA==
X-Google-Smtp-Source: AMsMyM7kGEBrwAJSby/X7Z+YjXbznKIKOot9i05zx9wTuYK90WtQ/P8xYTx0w7iuQcBERswPFgleJDxQhcREIMjDiKE=
X-Received: by 2002:a67:e281:0:b0:398:8b:12df with SMTP id
 g1-20020a67e281000000b00398008b12dfmr4875605vsf.66.1663976549293; 
 Fri, 23 Sep 2022 16:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
 <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
In-Reply-To: <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 23 Sep 2022 16:42:18 -0700
Message-ID: <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Jason Wang <jasowang@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="00000000000022f74d05e960bb63"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=venture@google.com; helo=mail-vs1-xe2e.google.com
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

--00000000000022f74d05e960bb63
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 22, 2022 at 8:21 PM Jason Wang <jasowang@redhat.com> wrote:

> On Thu, Sep 22, 2022 at 8:35 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >
> > On Thu, 22 Sept 2022 at 00:47, Patrick Venture <venture@google.com>
> wrote:
> > >
> > > The MAC address set from Qemu wasn't being saved into the register
> space.
> > >
> > > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > > Signed-off-by: Patrick Venture <venture@google.com>
> >
> > > @@ -112,6 +115,18 @@ static void emc_reset(NPCM7xxEMCState *emc)
> > >
> > >      emc->tx_active = false;
> > >      emc->rx_active = false;
> > > +
> > > +    /* Set the MAC address in the register space. */
> > > +    uint32_t value = (emc->conf.macaddr.a[0] << 24) |
> > > +        (emc->conf.macaddr.a[1] << 16) |
> > > +        (emc->conf.macaddr.a[2] << 8) |
> > > +        emc->conf.macaddr.a[3];
> > > +    npcm7xx_emc_write(emc, REG_CAMM_BASE * sizeof(uint32_t), value,
> > > +                      sizeof(uint32_t));
> > > +
> > > +    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5]
> << 16);
> > > +    npcm7xx_emc_write(emc, REG_CAML_BASE * sizeof(uint32_t), value,
> > > +                      sizeof(uint32_t));
> >
> > If I understand correctly, the issue here is that
> emc->regs[REG_CAMM_BASE]
> > and emc->regs[REG_CAML_BASE] aren't being reset correctly. If so,
> > I think the better approach is to simply reset them here, without
> > going through the register-write function, the same way we already
> > do for the handful of other registers which have non-zero reset values.
> > That's the way other devices seem to do it.
> >
> > A question to which I don't know the answer: if the guest writes to
> > the device to change the MAC address, should that persist across
> > reset, or should reset revert the device to the original MAC address
> > as specified by the user on the command line or whatever ? At the
> > moment you have the former behaviour (and end up storing the MAC
> > address in two places as a result -- it would be neater to either
> > keep it in only one place, or else have emc->regs[] be the current
> > programmed MAC address and emc->conf.macaddr the value to reset to).
> >
> > I'm not sure we're consistent between device models about that,
> > eg the e1000 seems to reset to the initial MAC addr, but the
> > imx_fec keeps the guest-set value over resets. Jason, is there
> > a recommended "right way" to handle guest-programmable MAC addresses
> > over device reset ?
>
> I think it depends on the NIC.
>
> E1000 has a EEPROM interface for providing the MAC address for the
> ethernet controller before it can be accessed by the driver during
> reset. For modern Intel NICs like E810, it has similar semantics but
> using NVM instead of EEPROM. So the current e1000 behaviour seems to
> be correct (treat the initiali MAC as the one stored in the EEPROM).
>
> I guess most NIC should behave the same as having a persistent storage
> for MAC for the controller during reset, but I'm not sure this is the
> case for imx_fec.
>

So the first time the NIC is realized, it should take the value from the
command line.  Then later if the guest OS updates it, it should always on
reset use that provided value?


>
> (Anyhow, if we change the behaviour we need keep migration compatibility)
>
> Thanks
>
> >
> > thanks
> > -- PMM
> >
>
>

--00000000000022f74d05e960bb63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 8:21 PM Jason=
 Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu,=
 Sep 22, 2022 at 8:35 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@=
linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 22 Sept 2022 at 00:47, Patrick Venture &lt;<a href=3D"mailto:v=
enture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The MAC address set from Qemu wasn&#39;t being saved into the reg=
ister space.<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" ta=
rget=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@goog=
le.com" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt;<br>
&gt; &gt; @@ -112,6 +115,18 @@ static void emc_reset(NPCM7xxEMCState *emc)<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 emc-&gt;tx_active =3D false;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 emc-&gt;rx_active =3D false;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Set the MAC address in the register space. */<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t value =3D (emc-&gt;conf.macaddr.a[0] &lt;=
&lt; 24) |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (emc-&gt;conf.macaddr.a[1] &lt;&lt; =
16) |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (emc-&gt;conf.macaddr.a[2] &lt;&lt; =
8) |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 emc-&gt;conf.macaddr.a[3];<br>
&gt; &gt; +=C2=A0 =C2=A0 npcm7xx_emc_write(emc, REG_CAMM_BASE * sizeof(uint=
32_t), value,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sizeof(uint32_t));<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D (emc-&gt;conf.macaddr.a[4] &lt;&lt; 24) =
| (emc-&gt;conf.macaddr.a[5] &lt;&lt; 16);<br>
&gt; &gt; +=C2=A0 =C2=A0 npcm7xx_emc_write(emc, REG_CAML_BASE * sizeof(uint=
32_t), value,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 sizeof(uint32_t));<br>
&gt;<br>
&gt; If I understand correctly, the issue here is that emc-&gt;regs[REG_CAM=
M_BASE]<br>
&gt; and emc-&gt;regs[REG_CAML_BASE] aren&#39;t being reset correctly. If s=
o,<br>
&gt; I think the better approach is to simply reset them here, without<br>
&gt; going through the register-write function, the same way we already<br>
&gt; do for the handful of other registers which have non-zero reset values=
.<br>
&gt; That&#39;s the way other devices seem to do it.<br>
&gt;<br>
&gt; A question to which I don&#39;t know the answer: if the guest writes t=
o<br>
&gt; the device to change the MAC address, should that persist across<br>
&gt; reset, or should reset revert the device to the original MAC address<b=
r>
&gt; as specified by the user on the command line or whatever ? At the<br>
&gt; moment you have the former behaviour (and end up storing the MAC<br>
&gt; address in two places as a result -- it would be neater to either<br>
&gt; keep it in only one place, or else have emc-&gt;regs[] be the current<=
br>
&gt; programmed MAC address and emc-&gt;conf.macaddr the value to reset to)=
.<br>
&gt;<br>
&gt; I&#39;m not sure we&#39;re consistent between device models about that=
,<br>
&gt; eg the e1000 seems to reset to the initial MAC addr, but the<br>
&gt; imx_fec keeps the guest-set value over resets. Jason, is there<br>
&gt; a recommended &quot;right way&quot; to handle guest-programmable MAC a=
ddresses<br>
&gt; over device reset ?<br>
<br>
I think it depends on the NIC.<br>
<br>
E1000 has a EEPROM interface for providing the MAC address for the<br>
ethernet controller before it can be accessed by the driver during<br>
reset. For modern Intel NICs like E810, it has similar semantics but<br>
using NVM instead of EEPROM. So the current e1000 behaviour seems to<br>
be correct (treat the initiali MAC as the one stored in the EEPROM).<br>
<br>
I guess most NIC should behave the same as having a persistent storage<br>
for MAC for the controller during reset, but I&#39;m not sure this is the<b=
r>
case for imx_fec.<br></blockquote><div><br></div><div>So the first time the=
 NIC is realized, it should take the value from the command line.=C2=A0 The=
n later if the guest OS updates it, it should always on reset use that prov=
ided value?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
(Anyhow, if we change the behaviour we need keep migration compatibility)<b=
r>
<br>
Thanks<br>
<br>
&gt;<br>
&gt; thanks<br>
&gt; -- PMM<br>
&gt;<br>
<br>
</blockquote></div></div>

--00000000000022f74d05e960bb63--

