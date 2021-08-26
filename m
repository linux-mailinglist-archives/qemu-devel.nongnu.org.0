Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55493F832A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 09:36:10 +0200 (CEST)
Received: from localhost ([::1]:41566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ9vl-0005Zh-KN
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 03:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mJ9ut-0004vB-E3
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 03:35:15 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mJ9uq-0000ob-H2
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 03:35:15 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u3so4103401ejz.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 00:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zNTdMonULW2mXgMEnlhIE3NdFb4xIqm9vGvPXujiswU=;
 b=l/sHka0aMHbv6byfTOEO/bqx7gjEZWwf65c2kOmEZy4q5OfezVLU/iU3h41hjRaSar
 tA2V34pNSgbyz67cXWBry4rvyNx3eEMiHdFZUq/MkAqg7TTpLvYUZ0ph05VAZLSs/Ria
 PSD8X8FuFgGd7HRmyv08Qs9lzjW4tUi6wKPCSXFws3SXDard0i06P2e2huPg/1hceEyl
 N2ERy+joXOkizIhMw4k5gy7yhZj34ea7MbE6RIV2zbtaKauVbl+cKADJxYq5t5vdO8w4
 MRD4L5R1O1RdiOd/001a7nZBjUd5KPZOT2Txn0X+PUEn8JhwAKCTt0VqtQUrZ/ivUn96
 pQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zNTdMonULW2mXgMEnlhIE3NdFb4xIqm9vGvPXujiswU=;
 b=LnAtLOEl2xP7xGvtZ2C/CH1hds4Kjukgaf7HxT3Rg0mr07kx2SPid3/x+3fnwe3vr7
 PSI+DUjLTiW17IdmFz7leRWbtA1Q4MEa+5nqfEC7ITIDtYKf8vsnWLyHTesjLdSMVy83
 U4T6+vjh+d72oVxksHL2vk/OuLujZp3uvp6alIKYMczwI1dP4FrCgIUgRsb7gRrmQzzK
 8Czw0Ub28AyTpLWPF0GOcsuJX8wWeklTONyeRa0PlvSGVDzidOnx7Se6cO+1dVAOlY3k
 vZkPiMgpbU2zSlpD0pANNRdNuwR31Dx3dGPy2wNpmbAG6epNSS1fgFU6y35LMDQYXJAO
 1LCg==
X-Gm-Message-State: AOAM532yULl/e7fmmC7Yybwz69MkLVsPyYdHaid4Resy0P2vbu/DU6og
 bZ5tPNaVlbnvUxj5PwBpIYaoGF2YaJpDwQmaFzU=
X-Google-Smtp-Source: ABdhPJxzvwjdRxG7GduUbhx3bHBw2+WYbmxvN8ZWSlgme/0tPZjN2/11PaT3AQaA7VsAzKKGn5M0TPobYhz4NhnOPy0=
X-Received: by 2002:a17:906:4a8e:: with SMTP id
 x14mr2836250eju.389.1629963311117; 
 Thu, 26 Aug 2021 00:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210825124309.223622-1-marcandre.lureau@redhat.com>
 <c79fb3c7-e6cc-adea-b694-ffe1f25c0d59@amsat.org>
 <CAFEAcA8YNwe-PCt2VuY4Fhjbyqnm2G7BpZDs6wyXNFh3pmee2Q@mail.gmail.com>
 <CAJ+F1CKx=24Hssrz=yz+D8Q2nTXcgaLeMFdB5tfHfdWRAZ-p+g@mail.gmail.com>
 <CAFEAcA-_Xcep33jG91M3j=bySpWS60zKyydm-jO8nn8nKg_6aQ@mail.gmail.com>
 <CAJ+F1CKo2hVhwKs+fH-W5rq04gCPiwjxe5HfFsg16gvTnH5U-A@mail.gmail.com>
 <YScGLe9HTm404Jc8@yekko>
In-Reply-To: <YScGLe9HTm404Jc8@yekko>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 26 Aug 2021 11:34:59 +0400
Message-ID: <CAJ+F1C+fxCyW+SrORudyoBi=ZYQD_v2MkAdRbaVgW-gh9580QA@mail.gmail.com>
Subject: Re: [PATCH] RFC: build-sys: drop dtc submodule
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: multipart/alternative; boundary="00000000000027fbcb05ca7168eb"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000027fbcb05ca7168eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 26, 2021 at 7:11 AM David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Thu, Aug 26, 2021 at 12:11:17AM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Aug 26, 2021 at 12:00 AM Peter Maydell <peter.maydell@linaro.or=
g
> >
> > wrote:
> >
> > > On Wed, 25 Aug 2021 at 20:55, Marc-Andr=C3=A9 Lureau
> > > <marcandre.lureau@gmail.com> wrote:
> > > > fdt_check_full was added in 1.4.7:
> > > > https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.4.7
> > > >
> > > > Only ubuntu appears to be lagging a bit behind. I wonder if they
> would
> > > consider an update.
> > >
> > > I doubt it. You would need to wait until that actually falls off
> > > our supported list. You also have a couple of years to wait until
> > > Debian oldstable is no longer on our supported list.
> > >
> > > Maybe, I don't know why debian oldstable would have received a new
> version
> > plus fixes, and not ubuntu.
> >
> > It seems we could have our own fallback copy of fdt_check_full() though=
..
> > I'll give that a try.
>
> We could, but fdt_check_full() is actually a pretty complex function.
>
>
Yeah, that would be used for those who don't have >=3D 1.4.7.

Alternatively we could lower the fdt_check_full to fdt_check_header in this
case? It seems it is used to verify the DT from SLOF. It may be trusted I
suppose, or a malformed DT may only impact the guest?


> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>


--=20
Marc-Andr=C3=A9 Lureau

--00000000000027fbcb05ca7168eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 26, 2021 at 7:11 AM Dav=
id Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au">david@gibson.d=
ropbear.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Thu, Aug 26, 2021 at 12:11:17AM +0400, Marc-Andr=C3=A9 Lure=
au wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Thu, Aug 26, 2021 at 12:00 AM Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;=
<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, 25 Aug 2021 at 20:55, Marc-Andr=C3=A9 Lureau<br>
&gt; &gt; &lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blan=
k">marcandre.lureau@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; fdt_check_full was added in 1.4.7:<br>
&gt; &gt; &gt; <a href=3D"https://git.kernel.org/pub/scm/utils/dtc/dtc.git/=
tag/?h=3Dv1.4.7" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.or=
g/pub/scm/utils/dtc/dtc.git/tag/?h=3Dv1.4.7</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Only ubuntu appears to be lagging a bit behind. I wonder if =
they would<br>
&gt; &gt; consider an update.<br>
&gt; &gt;<br>
&gt; &gt; I doubt it. You would need to wait until that actually falls off<=
br>
&gt; &gt; our supported list. You also have a couple of years to wait until=
<br>
&gt; &gt; Debian oldstable is no longer on our supported list.<br>
&gt; &gt;<br>
&gt; &gt; Maybe, I don&#39;t know why debian oldstable would have received =
a new version<br>
&gt; plus fixes, and not ubuntu.<br>
&gt; <br>
&gt; It seems we could have our own fallback copy of fdt_check_full() thoug=
h..<br>
&gt; I&#39;ll give that a try.<br>
<br>
We could, but fdt_check_full() is actually a pretty complex function.<br>
<br></blockquote><div><br></div><div>Yeah, that would be used for those who=
 don&#39;t have &gt;=3D 1.4.7.</div><div><br></div><div>Alternatively we co=
uld lower the fdt_check_full to fdt_check_header in this case? It seems it =
is used to verify the DT from SLOF. It may be trusted I suppose, or a malfo=
rmed DT may only impact the guest?<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
-- <br>
David Gibson=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | I&#39;ll have my music baroque, and my code<br>
david AT <a href=3D"http://gibson.dropbear.id.au" rel=3D"noreferrer" target=
=3D"_blank">gibson.dropbear.id.au</a>=C2=A0 | minimalist, thank you.=C2=A0 =
NOT _the_ _other_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | _way_ _around_!<br>
<a href=3D"http://www.ozlabs.org/~dgibson" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.ozlabs.org/~dgibson</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000027fbcb05ca7168eb--

