Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9D6573D4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 09:17:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pARbS-0003Yl-K5; Wed, 28 Dec 2022 03:15:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pARbP-0003YF-Sh
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 03:15:55 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pARbN-0005mf-Oz
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 03:15:55 -0500
Received: by mail-ot1-x331.google.com with SMTP id
 p17-20020a9d6951000000b00678306ceb94so9502919oto.5
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 00:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5yvCM65ZrSMLC6WZKMmO6L8WkLVVczNpFGzI7D0fMy0=;
 b=TXwui5OjHkOUoO9c6dESTL1YlGSkJ90/jJsuqfiOa68JA1gNct5LHh6pogZ+gsPKoA
 WALYU0TOvPHMTsWTsL9hoslOyR5NzZ/N1JoQOifNo6y54SiwiAIwEUPCrhc5xZ6uP26s
 UtZ3KHpuVCEwqhrHPGb03AGAObZlw8Jm4Lz4CbwH7Z365hVgwG0jtXAGq71jViYUAXUb
 lrnGTpZqKPx1I2CnsRXp7jY+Mwsw8q4FL5wQYUR6Q8pUXsj8+JPJO2cw+s7l2+wzhY7q
 YSMY5QKHCfsjua69Iwu2+M8VjLDoG704mTDggT61mbDohb0K099zF+v13eGhNkkvWVZN
 PELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5yvCM65ZrSMLC6WZKMmO6L8WkLVVczNpFGzI7D0fMy0=;
 b=P70ENPfBUUNuSgebPpX3nfVs9q1KfwAYS30fbMmtUveC25hq5Y+PNxfSsib1bMMuP/
 A3Mj9/RO/q+zhptU/MjHMVSuLmoYDsXrSARfOG9qfns2X4LdeJLl9aeGnvgR01m6t+jn
 zRC73OAjZmnMpC/OpR28ecGGLXQoUDq1NJNgc6GMi1ZZZ7egULSwYq25Es6FGj+yHznA
 wtT5oEFAxcmIRtoo9UMgmRc2KN5CMFMK7vH5PXgSNP/pX2XwWB3M2T6A0l+e5mCbzqrQ
 5DRGSfThAVx2C9Gdq4gl8JHCMuJKM8Tkcx17nB0aboVAb20uYu5IhWPVj+VurGXNCD0D
 fruw==
X-Gm-Message-State: AFqh2kpghjPLRSgphOngjmh8SbBeH9loKM6t0XB9EY69V+dKBnSSPcCd
 JsYyk1ePjGlOv7M7qRVU5VKK3JWXMC0N5DZG2tg=
X-Google-Smtp-Source: AMrXdXvC7hX6CyQ9NtIem5F5l4pofa+1W/rLXqhsoYF2cTIMKOdPK/+XIVnj2IIqIlX4pCOswJ1xet7tR991jO/LmLM=
X-Received: by 2002:a05:6830:20d2:b0:670:9b57:eb30 with SMTP id
 z18-20020a05683020d200b006709b57eb30mr2051102otq.179.1672215352384; Wed, 28
 Dec 2022 00:15:52 -0800 (PST)
MIME-Version: 1.0
References: <20221225121357.498040-1-cyruscyliu@gmail.com>
 <4cef8c93-00ee-d1ad-77f5-7a328795e58c@t-online.de>
In-Reply-To: <4cef8c93-00ee-d1ad-77f5-7a328795e58c@t-online.de>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 28 Dec 2022 16:15:42 +0800
Message-ID: <CAAKa2jnYD3_i7ETrvPi4jyjqZx0vn-CtUPW1trjDjM_Qw6y50w@mail.gmail.com>
Subject: Re: [PATCH] hw/audio/c97: fix abort in audio_calloc()
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000111f6a05f0defa51"
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000111f6a05f0defa51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Volker,


> Did you see my patches at
> https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg02895.html ?
> Patches 01/11 and 02/11 prevent the disturbing error message from
> audio_calloc and later patches remove the audio_calloc function.
>
Oh, I missed these. Thank you for pointing it out.


> I think the subject of your patch isn't correct. Your patch doesn't fix
> an abort in audio_calloc. In
> https://gitlab.com/qemu-project/qemu/-/issues/1393 you correctly notice
> this was already fixed.

Fair enough.


> > Section 5.10.2 of the AC97 specification (
> https://hands.com/~lkcl/ac97_r23.pdf)
> > shows the feasibility to support for rates other than 48kHZ.
> Specifically,
> > AC97_PCM_Front_DAC_Rate (reg 2Ch) should be from 8kHZ to 48kHZ.
>
> I think you misread section 5.10.2 of the AC97 Revision 2.3
> specification. Section 5.10 is about S/PDIF concurrency. It doesn't say
> anything about the lowest sample rate limit without concurrent S/PDIF
> transmission. The emulated SigmaTel STAC9700 codec doesn't even have a
> S/PDIF output. But I have an example for sample rates lower than 8kHz.
> The Texas Instruments LM4546B is an AC97 codec which supports sample
> rates from 4kHz - 48kHz.
>
Thank you for pointing it out! Now, I understand better!


> The STAC9700 is a 48kHz fixed rate codec. You won't find anything about
> the highest or lowest sample rate in its data sheet. Someone added the
> VRA and VRM modes in QEMU and the guest drivers don't seem to mind.
>
> I would like to keep the ability to select a 1Hz sample rate, as there
> is no reason to artificially limit the lowest supported sample rate. See
> https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03987.html
>
> I would support a patch to limit the VRA and VRM modes to the highest
> supported rate of 48kHz. This is a technical limit for single data rate.
>
> > Before Volker R=C3=BCmelin fixed it in 12f4abf6a245 and 0cbc8bd4694f, a=
n
> adversary
> > could leverage this to crash QEMU.
> >
> > Fixes: e5c9a13e2670 ("PCI AC97 emulation by malc.")
> > Reported-by: Volker R=C3=BCmelin<vr_qemu@t-online.de>
> > Reported-by: Qiang Liu<cyruscyliu@gmail.com>
> > Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1393
> > Signed-off-by: Qiang Liu<cyruscyliu@gmail.com>
> > ---
> >   hw/audio/ac97.c | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> > index be2dd701a4..826411e462 100644
> > --- a/hw/audio/ac97.c
> > +++ b/hw/audio/ac97.c
> > @@ -625,9 +625,14 @@ static void nam_writew(void *opaque, uint32_t addr=
,
> uint32_t val)
> >           break;
> >       case AC97_PCM_Front_DAC_Rate:
> >           if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) =
{
> > -            mixer_store(s, addr, val);
> > -            dolog("Set front DAC rate to %d\n", val);
> > -            open_voice(s, PO_INDEX, val);
> > +            if (val >=3D 8000 && val <=3D 48000) {
> > +                mixer_store(s, addr, val);
> > +                dolog("Set front DAC rate to %d\n", val);
> > +                open_voice(s, PO_INDEX, val);
> > +            } else {
> > +                dolog("Attempt to set front DAC rate to %d, but valid
> is"
> > +                      "8-48kHZ\n", val);
>
> This is not correct. If you limit the sample rate, you should echo back
> the closest supported sample rate. See AC'97 2.3 Section 5.8.3. It's not
> a guest error if the guest writes an unsupported sample rate to the
> Audio Sample Rate Control Registers, which means it's also not necessary
> to log this.
>
> With best regards,
> Volker
>

I rethink and want to say that a low sample rate could be a problem. Have
checked the missed patch
https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg02895.html, I
think you have addressed my concern. Thank all your suggestions again!
Let's close this discussion and I will close the issue.

Best,
Qiang

--000000000000111f6a05f0defa51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Volker,</div><div class=3D"gmail_quote"><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Did you see my patches at <br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg0289=
5.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archi=
ve/html/qemu-devel/2022-12/msg02895.html</a> ?<br>
Patches 01/11 and 02/11 prevent the disturbing error message from <br>
audio_calloc and later patches remove the audio_calloc function.<br></block=
quote><div>Oh, I missed these. Thank you for pointing it out.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I think the subject of your patch isn&#39;t correct. Your patch doesn&#39;t=
 fix <br>
an abort in audio_calloc. In <br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1393" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/issues/1393=
</a> you correctly notice <br>
this was already fixed.</blockquote><div>Fair enough.</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Section 5.10.2 of the AC97 specification (<a href=3D"https://hands.com=
/~lkcl/ac97_r23.pdf" rel=3D"noreferrer" target=3D"_blank">https://hands.com=
/~lkcl/ac97_r23.pdf</a>)<br>
&gt; shows the feasibility to support for rates other than 48kHZ. Specifica=
lly,<br>
&gt; AC97_PCM_Front_DAC_Rate (reg 2Ch) should be from 8kHZ to 48kHZ.<br>
<br>
I think you misread section 5.10.2 of the AC97 Revision 2.3 <br>
specification. Section 5.10 is about S/PDIF concurrency. It doesn&#39;t say=
 <br>
anything about the lowest sample rate limit without concurrent S/PDIF <br>
transmission. The emulated SigmaTel STAC9700 codec doesn&#39;t even have a =
<br>
S/PDIF output. But I have an example for sample rates lower than 8kHz. <br>
The Texas Instruments LM4546B is an AC97 codec which supports sample <br>
rates from 4kHz - 48kHz.<br></blockquote><div>Thank you for pointing it out=
! Now, I understand better!</div><div>=C2=A0<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
The STAC9700 is a 48kHz fixed rate codec. You won&#39;t find anything about=
 <br>
the highest or lowest sample rate in its data sheet. Someone added the <br>
VRA and VRM modes in QEMU and the guest drivers don&#39;t seem to mind.<br>
<br>
I would like to keep the ability to select a 1Hz sample rate, as there <br>
is no reason to artificially limit the lowest supported sample rate. See <b=
r>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg0398=
7.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/archi=
ve/html/qemu-devel/2022-10/msg03987.html</a><br>
<br>
I would support a patch to limit the VRA and VRM modes to the highest <br>
supported rate of 48kHz. This is a technical limit for single data rate.<br=
>
<br>
&gt; Before Volker R=C3=BCmelin fixed it in 12f4abf6a245 and 0cbc8bd4694f, =
an adversary<br>
&gt; could leverage this to crash QEMU.<br>
&gt;<br>
&gt; Fixes: e5c9a13e2670 (&quot;PCI AC97 emulation by malc.&quot;)<br>
&gt; Reported-by: Volker R=C3=BCmelin&lt;<a href=3D"mailto:vr_qemu@t-online=
.de" target=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
&gt; Reported-by: Qiang Liu&lt;<a href=3D"mailto:cyruscyliu@gmail.com" targ=
et=3D"_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt; Resolves:<a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1393=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu=
/-/issues/1393</a><br>
&gt; Signed-off-by: Qiang Liu&lt;<a href=3D"mailto:cyruscyliu@gmail.com" ta=
rget=3D"_blank">cyruscyliu@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/audio/ac97.c | 11 ++++++++---<br>
&gt;=C2=A0 =C2=A01 file changed, 8 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c<br>
&gt; index be2dd701a4..826411e462 100644<br>
&gt; --- a/hw/audio/ac97.c<br>
&gt; +++ b/hw/audio/ac97.c<br>
&gt; @@ -625,9 +625,14 @@ static void nam_writew(void *opaque, uint32_t add=
r, uint32_t val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case AC97_PCM_Front_DAC_Rate:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mixer_load(s, AC97_Extende=
d_Audio_Ctrl_Stat) &amp; EACS_VRA) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mixer_store(s, addr, val);<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog(&quot;Set front DAC r=
ate to %d\n&quot;, val);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 open_voice(s, PO_INDEX, val=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (val &gt;=3D 8000 &amp;&=
amp; val &lt;=3D 48000) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mixer_store(s=
, addr, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog(&quot;S=
et front DAC rate to %d\n&quot;, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 open_voice(s,=
 PO_INDEX, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dolog(&quot;A=
ttempt to set front DAC rate to %d, but valid is&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;8-48kHZ\n&quot;, val);<br>
<br>
This is not correct. If you limit the sample rate, you should echo back <br=
>
the closest supported sample rate. See AC&#39;97 2.3 Section 5.8.3. It&#39;=
s not <br>
a guest error if the guest writes an unsupported sample rate to the <br>
Audio Sample Rate Control Registers, which means it&#39;s also not necessar=
y <br>
to log this.<br>
<br>
With best regards,<br>
Volker<br></blockquote><div><br></div><div>I rethink=C2=A0and want to say t=
hat a low sample=C2=A0rate could be a problem. Have checked the missed patc=
h=C2=A0<a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2022-12/=
msg02895.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.or=
g/archive/html/qemu-devel/2022-12/msg02895.html</a>, I think you have addre=
ssed my concern. Thank all your suggestions again! Let&#39;s close this dis=
cussion and I will close the issue.</div><div><br></div><div>Best,</div><di=
v>Qiang</div></div></div>

--000000000000111f6a05f0defa51--

