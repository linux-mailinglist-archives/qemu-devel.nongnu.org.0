Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC63D2C982E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 08:33:58 +0100 (CET)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk0Af-0006rn-Gg
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 02:33:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kk09J-0006R0-Lu
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 02:32:33 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kk09H-0007G2-LK
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 02:32:33 -0500
Received: by mail-ej1-x644.google.com with SMTP id x16so2044741ejj.7
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 23:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Ao6dwwXlwkUoP9koyEPFzOMHi10cNla2PBJsBdyhiQ=;
 b=W9twJUPqsuR2jdCPaXcCiuTAxUYzREIafuj9XGxxX61R7Bfr5Ki34xhAtKiWp7kNbN
 eH9mh2v0lg2gOt2jDAoE0FN6R7QqMssHXpm23/k2orMuNHUQglNn4X1UhnIDpj8eFqpY
 h8EdqLghuOXMUunrom0iTximfIndZGn5pLM3LYm7nNxwxp1JvRnrPCZ7/0T2EUQIh82Y
 0Uu1zaTeCPcp0dDLdlM2TiTJ+YsifzJ5qoeAJU9opGnUzdPn1u5vxmTmokv/6+I0s1xB
 metLTMXmXUKbaZfT4FwsVaEtEEen6z02PNq5X7GtGiKOyfoJ5QwBADwB9dZrlkftSnHf
 8OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Ao6dwwXlwkUoP9koyEPFzOMHi10cNla2PBJsBdyhiQ=;
 b=Y5XVVfQa7l4E0IZJbL+8NONsv0Ndw9Xmmqykz6kuDyJ4FCNuYuhDxDYDwtEatrcVBl
 5KfFBk7/2wQsZLbGTT4vJ6lZPbzXeg/p7trhklcGhNJF7K0b0MhLo9r17As2JpGKPaDz
 VqpYMm0zeHbr4o50zoMFhz0OqGwj3m9jqmwGGPymw8d17IolbK3OW8IlVrYocgEYn4Ls
 Dkm7iTNAhMqUcPZgPW5orIH68yYm0/u6jvQUTWnlTq+mPsCJvoM/bUAzVYNepwXhObIx
 KENyQ9NTIDsuznZ1tdQ+hJ0pAVfUT0gPmHISpIP/EwELK+OV1Hcd3yrs75LYoxivlvGf
 J06A==
X-Gm-Message-State: AOAM531xq0X0Gi8h6OzNh4arErTQiCC7FSZGYDwH5VV6+Pp+6+pFRwh9
 TFskcPsc+Y3493DOGcSj1QGMSaaHdArVFpQmiWs=
X-Google-Smtp-Source: ABdhPJwW6E4O2DnbxVbepqAsJq3WTp1PyhjvkVNa5A965GIihGC92HStC1jEdhRDUV3foLSNck607CfqWaFz9yOQy78=
X-Received: by 2002:a17:906:9452:: with SMTP id
 z18mr1685108ejx.389.1606807949931; 
 Mon, 30 Nov 2020 23:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20201127183619.8958-1-info@metux.net>
 <CAFEAcA_KQ3q-=AG=b77WDbtrBRXCUKDoMkn9en12Bz48B-GjgQ@mail.gmail.com>
 <b04a421d-9844-70b7-9c5e-3a302ca94da9@metux.net>
In-Reply-To: <b04a421d-9844-70b7-9c5e-3a302ca94da9@metux.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 1 Dec 2020 11:32:18 +0400
Message-ID: <CAJ+F1CJHZ4Z4JfjrA2qSRsuo0FgeXqMv35wW5ATq1n5wUjfzEA@mail.gmail.com>
Subject: Re: [PATCH] python 3.5 compatibility
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Content-Type: multipart/alternative; boundary="00000000000013f80a05b562211b"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x644.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000013f80a05b562211b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Nov 30, 2020 at 10:29 PM Enrico Weigelt, metux IT consult <
lkml@metux.net> wrote:

> On 27.11.20 20:15, Peter Maydell wrote:
>
> Hi,
>
> > Could you say which "stable distros" you have in mind, and whether
> > they are covered by our "supported build platforms" policy
> > https://www.qemu.org/docs/master/system/build-platforms.html  ?
>
> I'm running on Devuan Ascii.
>
> And packaging python-3.6 just for a few pieces of one application (qemu)
> is far too much work.
>

It might be necessary to keep that distro alive, as python 3.5 is EOL:

https://www.python.org/downloads/release/python-3510/

(fwiw, upcoming meson version will also depend on >=3D 3.6)


> --mtx
>
> --
> ---
> Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt u=
nd manipuliert
> werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren
> GPG/PGP-Schl=C3=BCssel zu.
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000013f80a05b562211b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 30, 2020 at 10:29 PM Enrico Weige=
lt, metux IT consult &lt;<a href=3D"mailto:lkml@metux.net">lkml@metux.net</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 27.11.20 20:15, Peter Maydell wrote:<br>
<br>
Hi,<br>
<br>
&gt; Could you say which &quot;stable distros&quot; you have in mind, and w=
hether<br>
&gt; they are covered by our &quot;supported build platforms&quot; policy<b=
r>
&gt; <a href=3D"https://www.qemu.org/docs/master/system/build-platforms.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/sy=
stem/build-platforms.html</a>=C2=A0 ?<br>
<br>
I&#39;m running on Devuan Ascii.<br>
<br>
And packaging python-3.6 just for a few pieces of one application (qemu)<br=
>
is far too much work.<br></blockquote><div><br></div><div>It might be neces=
sary to keep that distro alive, as python 3.5 is EOL:<br></div><div><br></d=
iv><div><a href=3D"https://www.python.org/downloads/release/python-3510/">h=
ttps://www.python.org/downloads/release/python-3510/</a></div><div><br> </d=
iv><div>(fwiw, upcoming meson version will also depend on &gt;=3D 3.6)<br><=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
--mtx<br>
<br>
-- <br>
---<br>
Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt und=
 manipuliert<br>
werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren<br=
>
GPG/PGP-Schl=C3=BCssel zu.<br>
---<br>
Enrico Weigelt, metux IT consult<br>
Free software and Linux embedded engineering<br>
<a href=3D"mailto:info@metux.net" target=3D"_blank">info@metux.net</a> -- +=
49-151-27565287<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000013f80a05b562211b--

