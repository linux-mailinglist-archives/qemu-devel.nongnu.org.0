Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFC039F568
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:44:02 +0200 (CEST)
Received: from localhost ([::1]:34206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa9J-0004Xi-VG
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lqa47-0005IH-UE
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:38:39 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lqa46-00009a-22
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:38:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id g20so32145715ejt.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vi86xr/Q+WrsTdXv4exGJJ7urNIZbrdiA75YHHjJXYo=;
 b=OUR5MflmR3KXZrgHsQhh0ebwPhCppJd4t5HlwYrgpcTaqFyTv8y9Y/95esRIMac2ve
 j2gcIjYOdL5hJ1SqyPIYVHlBP/dxxkVRvdfwMB04k0SKYvtMlsoXXT5ta++qQ42oktJ6
 Gk+F7KMY+xbQWEvHqFDRRuuo3mgsKsCwXBjfSWRDXmGsPTuQVpKm145AHVuepYUeC5d2
 cRzrbu/yr7dfYefZ4QKwPklmO2UzB3rtfpm4WgDV94l/0Awz+FZguiqwWWlZS9XtqH+k
 0BHzNMXKYXgmHD2I41ZgAn4myOGLTuRxVlc3sMC24JEQlp0MgpiPFttvhkZpPKBQ7Ak8
 eVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vi86xr/Q+WrsTdXv4exGJJ7urNIZbrdiA75YHHjJXYo=;
 b=sF8urg3AYoJgEhCaObuIpG6Iu9CQc44aiO1XJdFo9Llnq2eGcKv7IRHD97IbzM42oI
 1H7G0iH9xBppUWirG9DEDfdriUEHkBkwCgQ4V5ffMHi4eV8jpy0Qcl/FQGR70MINz7aW
 bWHzQKTrnhEt0lkya+XRJ9RVY3nL6fqsCImW/pI4gsO5sUY6/PDt8Go0ure5virIGUe3
 VehkziXLYCxo0ZEFpYCbbdWwcMJYDCCHCGVdkRxr6KIo4VR6bHjY/c6sTU8gf7AjbbYE
 y5KN7gxVsOiBRNHWWfKzRQEc2Zf7ZRcwwl2Bditw59ixwn1ZWWHnnarYtz/dnzmpwsmE
 GOiw==
X-Gm-Message-State: AOAM530hOXm4Aj9QheqGM/xPmo1Hq0daXmd7EcsbynOnTr/TPf6gI/UX
 D0UoHmty56u92JJvy3La1a2gTrKWWw2eZfdlJOM=
X-Google-Smtp-Source: ABdhPJwOa3w55tezVSpDP8NySXPdreWKer8DZNLpD0mwpg1lA9c7dYS+LR1gQ0XarnxHtHMolQKVGTSQ0H1mavpT6zA=
X-Received: by 2002:a17:907:7b9e:: with SMTP id
 ne30mr23180592ejc.389.1623152316136; 
 Tue, 08 Jun 2021 04:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
 <20210517163040.2308926-2-marcandre.lureau@redhat.com>
 <20210607141835.jh3vevk6oqgyd5vx@redhat.com>
In-Reply-To: <20210607141835.jh3vevk6oqgyd5vx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Jun 2021 15:38:24 +0400
Message-ID: <CAJ+F1CLFXPsF4LM8b98K4OGXY9N2WJ5ump_HN9SrTKp62VZKLQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] qapi: replace List[str] by QAPISchemaIfCond
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000383f4405c43f99e7"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000383f4405c43f99e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 7, 2021 at 6:19 PM Eric Blake <eblake@redhat.com> wrote:

> On Mon, May 17, 2021 at 08:30:32PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Wrap the 'if' condition in a higher-level object. Not only this allows
> > more type safety but also further refactoring without too much churn.
>
> Grammar suggestion:
>
> Not only does this provide more type safety, but it also enables
> further refactoring without too much churn.
>
>
done, thanks

>
> > The following patches will change the syntax of the schema 'if'
> > conditions to be predicate expressions, and will generate code for
> > different target languages (C, and Rust in another series).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Tested-by: John Snow <jsnow@redhat.com>
> > ---
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000383f4405c43f99e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jun 7, 2021 at 6:19 PM Eric Blake &lt=
;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, May 17, 2021=
 at 08:30:32PM +0400, <a href=3D"mailto:marcandre.lureau@redhat.com" target=
=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Wrap the &#39;if&#39; condition in a higher-level object. Not only thi=
s allows<br>
&gt; more type safety but also further refactoring without too much churn.<=
br>
<br>
Grammar suggestion:<br>
<br>
Not only does this provide more type safety, but it also enables<br>
further refactoring without too much churn.<br>
<br></blockquote><div><br></div><div>done, thanks</div><div> <br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; The following patches will change the syntax of the schema &#39;if&#39=
;<br>
&gt; conditions to be predicate expressions, and will generate code for<br>
&gt; different target languages (C, and Rust in another series).<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
" target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
&gt; Tested-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D=
"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000383f4405c43f99e7--

