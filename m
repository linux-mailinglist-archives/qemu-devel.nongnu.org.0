Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51850A05A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 15:07:49 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhWXE-00018W-HD
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 09:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhWSl-0004WE-Bi
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:03:11 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhWSg-0005yb-0Y
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:03:10 -0400
Received: by mail-qv1-xf33.google.com with SMTP id a10so3582536qvm.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PiHGKdeI2Y8OPjbt2Yzy07w5bgP2XCf04YhkHTLl+4M=;
 b=b0Hb7AMfVl9t1W227445ofR8iwyodng/JK5FZa/5WX/9MRQrJ5CpHyWbpGZf8pK1AV
 0kilOjTM/Xu9+5V3GSubYzHYbj7YtJnw7HfstBJj8Zx89hcB1d/Rl0rViAoHheblV3m7
 vqQOQZ3aYG7oMGrxfOK7R3pzgC7MuZeCi93iRf8cdJUFarFjWJwGG184U06612S67rgi
 HyvvTWBqXJh495J8sxHN2zbdoI+8eqZZGJoTuJWXffucheXDIRVPGyiIj/iOsLj9C1p0
 IzJmt2gzvz7xmTbTRrPQYdsTNZFjy8Ibmz+ZelxX6+VHf4st8gOWV+doJIpr6YH7weaK
 Pm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PiHGKdeI2Y8OPjbt2Yzy07w5bgP2XCf04YhkHTLl+4M=;
 b=IqxEO4rVAA752AzxewpMWXAKMOZ6M7kMgm4JwU7IM+R6luWsAZATskPIzVyIuI1lYM
 tnlMvufAYUTOsWgq5pi6SkfuDrbJb4fXFbNIi9CyERdxDZ/WdZCXYq555uYl0lA7SZ9J
 pSTBRRhRzaPQiQCe/lpi6A60+6sejiqz6wBZfxY9RuZ3inP6L8pqeoEE3JMYlNCX+uH0
 wvb5O7NQjvbI00dSnUz1FE57T4OJEm5ykOIQYXXCv5XlJtkMrbqduUuN3ELNbsbudkhQ
 Wn9MW4fKFA1BGvAOvSLlEZ/SJKxu5NC0ITf8I73Suo+mA234DyOOJ6BqhxDsN0kjU0mW
 Sjvg==
X-Gm-Message-State: AOAM533Uv70Dfo4WOo9l/5NqQ+E64aWPWAgvpgUGwsUvu8Dk5FqIvzvA
 nRwyDvCJKHlTtSH4AAIrTKXlzlbmWpOCjcNGiaU=
X-Google-Smtp-Source: ABdhPJz93o3g1ZXfmdkJxQon8UjXhkFV2FUfm9ciutcMukIWrpqPV5InD1tj9171pesrkH17SNwbdJA1fSz3RFJywGU=
X-Received: by 2002:a05:6214:258e:b0:44b:76d7:b10c with SMTP id
 fq14-20020a056214258e00b0044b76d7b10cmr4841803qvb.8.1650546184368; Thu, 21
 Apr 2022 06:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-30-marcandre.lureau@redhat.com>
 <YmApvsZiI8z2iVPX@redhat.com>
In-Reply-To: <YmApvsZiI8z2iVPX@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 17:02:52 +0400
Message-ID: <CAJ+F1CKvb1FiXtU9P6mYoR+SDn89qpsykdRpDhqzaGA+Wk=rGw@mail.gmail.com>
Subject: Re: [PATCH 29/41] tests: run-time skip test-qga if TSAN is enabled
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000136bd05dd29bb36"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000136bd05dd29bb36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 8:24 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Apr 20, 2022 at 05:26:12PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This allows to make sure the test is still built, and gives more
> > accurate report details.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/unit/test-qga.c  | 7 +++++++
> >  tests/unit/meson.build | 2 +-
> >  2 files changed, 8 insertions(+), 1 deletion(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Can you review "[PATCH 26/41] compiler.h: add
QEMU_SANITIZE_{ADDRESS,THREAD}", it depends on it.

thanks


>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000136bd05dd29bb36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:24 PM Dan=
iel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, Apr 20, 2022 at 05:26:12PM +0400, <a href=3D"mailto:marcand=
re.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wro=
te:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; This allows to make sure the test is still built, and gives more<br>
&gt; accurate report details.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 tests/unit/test-qga.c=C2=A0 | 7 +++++++<br>
&gt;=C2=A0 tests/unit/meson.build | 2 +-<br>
&gt;=C2=A0 2 files changed, 8 insertions(+), 1 deletion(-)<br>
<br>
Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><br=
></div>Can you review &quot;[PATCH 26/41] compiler.h: add QEMU_SANITIZE_{AD=
DRESS,THREAD}&quot;, it depends on it.</div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote">thanks</div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000136bd05dd29bb36--

