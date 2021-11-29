Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3F461BDF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 17:36:44 +0100 (CET)
Received: from localhost ([::1]:40616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrjdz-0003Jl-Ji
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 11:36:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olivier.heriveaux@ledger.fr>)
 id 1mrjch-0002Mi-4S
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:35:23 -0500
Received: from [2a00:1450:4864:20::233] (port=46653
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <olivier.heriveaux@ledger.fr>)
 id 1mrjce-0004Qz-Az
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:35:22 -0500
Received: by mail-lj1-x233.google.com with SMTP id e11so35488594ljo.13
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 08:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ledger.fr; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=69n8nWHU2/ZqQENjZoeWKHlT6wJanKn5qutQopApahc=;
 b=JhGNP8bdbdAjzri8+HHK4YPMhJeisXFHdi5hN3VWWNmnW1p/9cuRQRZtIEsnDwTAsW
 5+zasuvZCFbC/M12YG9xqXnLg7HeDWT203N3eDRzDTl/VHeKhHTixCGAGVAMA4sUwfvB
 sBPCA4KvrO58n7Oy2bhfIcj7SC8vRNf0+XprXlZ42Q9nlomo4j8aGjVQkeF3BNo9FxrL
 qJAq5x5jRDRNdAUC/Bx1Z43t+kfdY7/tRJ5lWcAFikpRES+XFIQlgFQkce1MjB4RJXnE
 wJW06X+c4Cy6mprqbm5St0B8MbN9+2rugh4IcN3RPGUBaUd0Plrk0NXm3d60NsveHhNG
 muGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=69n8nWHU2/ZqQENjZoeWKHlT6wJanKn5qutQopApahc=;
 b=NaO1OEIzDc1s5OW+1aftRmJgWUw/kcsqPCeIGZLLA06B4G7xzbKpcwUwVKizXT04h7
 XjhIT6Q+84/K0dC+OazAp7SraGEliO1OA4O/8xYWJrEyBMffl08cqZsjIC32t5DGyGUy
 iw+upAxT1A2rSoGz+h6kT2Jj8xuhUdmGr4zuMGSRsmIeNMJocJyLHIWwYOxeT9MD4BE6
 uqv7VRQE9LCgJPRd32O2n0RkFJf6agqfLnHdMF70WpccNduSmL+DkWjaNkfKK0lqA/zv
 UpZTOW73bHml+filAyy/I8ej7OEhD6eAVFRmVB8O8GvN8MpmA9+PrFKvSRB8X4+Lh2f5
 P1Mg==
X-Gm-Message-State: AOAM533eq8J/5lWaWpgXl2JhgdVbqBS9jgybgKjuSWoTMok2N/3/6BDm
 B14n+/QjOt7n7eHOio4K+8TbuBLwpRznHSNLey7r7eUuC9cyUabDyze0ee8rdxDpianfNIAgeE6
 pKqG+pEsznLOU1pY6/2vfUeKm
X-Google-Smtp-Source: ABdhPJzC+d7xWLJ/N156Hp8uNERkMDP50mloUFXRQGCgx5LWWa52pCeC2wHTx1ar/Ie9Ywt+ah5h1SZzkPh289k43tU=
X-Received: by 2002:a2e:3a18:: with SMTP id h24mr52551666lja.372.1638203717356; 
 Mon, 29 Nov 2021 08:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20211128120723.4053-1-olivier.heriveaux@ledger.fr>
 <CAFEAcA8WBZPBoMDBcfv05p-EZOFCUGZkVt5aZJrYAtfCviryjA@mail.gmail.com>
In-Reply-To: <CAFEAcA8WBZPBoMDBcfv05p-EZOFCUGZkVt5aZJrYAtfCviryjA@mail.gmail.com>
From: Olivier Heriveaux <olivier.heriveaux@ledger.fr>
Date: Mon, 29 Nov 2021 17:35:06 +0100
Message-ID: <CAC_ssAHqNiR1b6fr6Tyb1GBNbHLkys5_HDcae8z6ic6_+sx1Lw@mail.gmail.com>
Subject: Re: [PATCH] Fix STM32F2XX USART data register readout
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alistair@alistair23.me
Content-Type: multipart/alternative; boundary="000000000000a4a7c405d1f00689"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::233;
 envelope-from=olivier.heriveaux@ledger.fr; helo=mail-lj1-x233.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000a4a7c405d1f00689
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If I understand correctly (I'm not a QEmu internals expert), yes this is
what happens.
Maybe stm32f2xx_usart_can_receive() is also called but since the
USART_SR_RXNE flag is reset before the USART_DR is read, it does not
prevent reading the next character.

Best regards,
Olivier H=C3=A9riveaux

Le lun. 29 nov. 2021 =C3=A0 11:46, Peter Maydell <peter.maydell@linaro.org>=
 a
=C3=A9crit :

> On Sun, 28 Nov 2021 at 12:07, Olivier H=C3=A9riveaux
> <olivier.heriveaux@ledger.fr> wrote:
> >
> > Fix issue where the data register may be overwritten by next character
> > reception before being read and returned.
> >
> > Signed-off-by: Olivier H=C3=A9riveaux <olivier.heriveaux@ledger.fr>
> > ---
> >  hw/char/stm32f2xx_usart.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> > index 8df0832424..fde67f4f03 100644
> > --- a/hw/char/stm32f2xx_usart.c
> > +++ b/hw/char/stm32f2xx_usart.c
> > @@ -103,10 +103,11 @@ static uint64_t stm32f2xx_usart_read(void *opaque=
,
> hwaddr addr,
> >          return retvalue;
> >      case USART_DR:
> >          DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char)
> s->usart_dr);
> > +        retvalue =3D s->usart_dr & 0x3FF;
> >          s->usart_sr &=3D ~USART_SR_RXNE;
> >          qemu_chr_fe_accept_input(&s->chr);
> >          qemu_set_irq(s->irq, 0);
> > -        return s->usart_dr & 0x3FF;
> > +        return retvalue;
> >      case USART_BRR:
> >          return s->usart_brr;
> >      case USART_CR1:
> > --
> > 2.17.1
>
> The bug happens because qemu_chr_fe_accept_input() can cause
> stm32f2xx_usart_receive() to be called, right ?
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I'll put this in my list of patches to take via target-arm.next for the
> 7.0 release.
>
> thanks
> -- PMM
>

--=20

Les informations contenues dans ce message =C3=A9lectronique ainsi que cell=
es=20
contenues dans les documents attach=C3=A9s sont strictement confidentielles=
 et=20
sont destin=C3=A9es =C3=A0 l'usage exclusif du (des) destinataire(s) nomm=
=C3=A9(s).
Toute=20
divulgation, distribution ou reproduction, m=C3=AAme partielle, en est=20
strictement interdite sauf autorisation =C3=A9crite et expresse de l=E2=80=
=99=C3=A9metteur.
Si vous recevez ce message par erreur, veuillez le notifier imm=C3=A9diatem=
ent =C3=A0=20
son =C3=A9metteur par retour, et le d=C3=A9truire ainsi que tous les docume=
nts qui y=20
sont attach=C3=A9s.


The information contained in this email and in any=20
document enclosed is strictly confidential and is intended solely for the=
=20
use of the individual or entity to which it is addressed.
Partial or total=20
disclosure, distribution or reproduction of its contents is strictly=20
prohibited unless expressly approved in writing by the sender.
If you have=20
received this communication in error, please notify us immediately by=20
responding to this email, and then delete the message and its attached=20
files from your system.


--000000000000a4a7c405d1f00689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If I understand correctly (I&#39;m not a QEmu internals ex=
pert), yes this is what happens.<div>Maybe=C2=A0stm32f2xx_usart_can_receive=
() is also called but since the USART_SR_RXNE flag is reset before the USAR=
T_DR is read, it does not prevent reading the next character.</div><div><br=
></div><div>Best regards,</div><div>Olivier H=C3=A9riveaux</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun=
. 29 nov. 2021 =C3=A0=C2=A011:46, Peter Maydell &lt;<a href=3D"mailto:peter=
.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; a =C3=A9crit=C2=A0:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 28 Nov 20=
21 at 12:07, Olivier H=C3=A9riveaux<br>
&lt;<a href=3D"mailto:olivier.heriveaux@ledger.fr" target=3D"_blank">olivie=
r.heriveaux@ledger.fr</a>&gt; wrote:<br>
&gt;<br>
&gt; Fix issue where the data register may be overwritten by next character=
<br>
&gt; reception before being read and returned.<br>
&gt;<br>
&gt; Signed-off-by: Olivier H=C3=A9riveaux &lt;<a href=3D"mailto:olivier.he=
riveaux@ledger.fr" target=3D"_blank">olivier.heriveaux@ledger.fr</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 hw/char/stm32f2xx_usart.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c<br>
&gt; index 8df0832424..fde67f4f03 100644<br>
&gt; --- a/hw/char/stm32f2xx_usart.c<br>
&gt; +++ b/hw/char/stm32f2xx_usart.c<br>
&gt; @@ -103,10 +103,11 @@ static uint64_t stm32f2xx_usart_read(void *opaqu=
e, hwaddr addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return retvalue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case USART_DR:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;Value: 0x%&quot; PRIx=
32 &quot;, %c\n&quot;, s-&gt;usart_dr, (char) s-&gt;usart_dr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 retvalue =3D s-&gt;usart_dr &amp; 0x3FF;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;usart_sr &amp;=3D ~USART_SR_RX=
NE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_chr_fe_accept_input(&amp;s-&gt;=
chr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq(s-&gt;irq, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;usart_dr &amp; 0x3FF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return retvalue;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case USART_BRR:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;usart_brr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case USART_CR1:<br>
&gt; --<br>
&gt; 2.17.1<br>
<br>
The bug happens because qemu_chr_fe_accept_input() can cause<br>
stm32f2xx_usart_receive() to be called, right ?<br>
<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
I&#39;ll put this in my list of patches to take via target-arm.next for the=
<br>
7.0 release.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

<br>
<div><hr></div><div><font face=3D"Arial" size=3D"1" color=3D"#808080">Les i=
nformations contenues dans ce message =C3=A9lectronique ainsi que celles co=
ntenues dans les documents attach=C3=A9s sont strictement confidentielles e=
t sont destin=C3=A9es =C3=A0 l&#39;usage exclusif du (des) destinataire(s) =
nomm=C3=A9(s).</font></div><div><font face=3D"Arial" size=3D"1" color=3D"#8=
08080">Toute divulgation, distribution ou reproduction, m=C3=AAme partielle=
, en est strictement interdite sauf autorisation =C3=A9crite et expresse de=
 l=E2=80=99=C3=A9metteur.</font></div><div><font face=3D"Arial" size=3D"1" =
color=3D"#808080">Si vous recevez ce message par erreur, veuillez le notifi=
er imm=C3=A9diatement =C3=A0 son =C3=A9metteur par retour, et le d=C3=A9tru=
ire ainsi que tous les documents qui y sont attach=C3=A9s.</font></div><div=
><font face=3D"Arial" size=3D"1" color=3D"#808080"><br></font></div><div><f=
ont face=3D"Arial" size=3D"1" color=3D"#808080">The information contained i=
n this email and in any document enclosed is strictly confidential and is i=
ntended solely for the use of the individual or entity to which it is addre=
ssed.</font></div><div><font face=3D"Arial" size=3D"1" color=3D"#808080">Pa=
rtial or total disclosure, distribution or reproduction of its contents is =
strictly prohibited unless expressly approved in writing by the sender.</fo=
nt></div><div><font face=3D"Arial" size=3D"1" color=3D"#808080">If you have=
 received this communication in error, please notify us immediately by resp=
onding to this email, and then delete the message and its attached files fr=
om your system.</font></div><div style=3D"font-family:Arial,Helvetica,sans-=
serif;font-size:1.3em"><hr></div>
--000000000000a4a7c405d1f00689--

