Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0511C39B7DF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 13:28:07 +0200 (CEST)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp7zi-0001iH-5E
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 07:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lp7ya-0000NV-9q
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 07:26:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lp7yY-0005ve-9R
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 07:26:56 -0400
Received: by mail-ej1-x62d.google.com with SMTP id g20so14030356ejt.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 04:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hTMwjlD5zF3D4lnSUr4kCcDJIRKHz5AISad1ppcTRws=;
 b=Fhn9VEA3s5HCS0HRGddus2hEgYcDE/OgZleInaos6SjhpV89kNAp5t96Caqwxpwssi
 zaG29IiQXkVIuzDiCJbl5xfbVSHBIR+GVX+1jO7oi3GOsM3iQOfW1mH0DQGtxiJmz+1p
 JLkc1fFzTrpdo9XHG98PH1ta1S/EbeUOgYXeggJGNb33woUrxDKpJcjD0xAIVtBUDcx6
 f7G+duQXSw0s2DYZMq26aS66fZ1ZBer5sI51R0khSWHI3Os2gGHGmQy3bDtbqaXwm/eJ
 VZ/XlMG/YVwVL3piewsy88AGqVZ8tjcNpNfbyq4aQV1Hzj8xgkduWzFdm7sMao6czdwH
 YCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hTMwjlD5zF3D4lnSUr4kCcDJIRKHz5AISad1ppcTRws=;
 b=U/OS+2FINcRee+wC/Y3bozSPIAtoAgCynMr00ApClCLHNpwmoNrk3kDxpAG4Ukn+eZ
 zV3Mfy33AVXqkhQD4Ujvhb5seC0BKEOMWuMizdhcfn5tsBcJcGAF+WhTndNGE5JOkodz
 IEL1y0ZEkH2w8OLcogQAnvlNRdwmq0V2WcRP2ym7/4marlTcNa9w9tVd287oar/XM2TL
 H5V1kdEFHNAjxMt2bcgtEzNuluU8/qjqgBKjVBn4TSUkvOx1lMGvqQj7K458JOO6XfGa
 eVVFHRa8ZvHpSbyaZlLzCoJjtadQyjyzU2G1AgV21C65zfnw7HqhXL2VYwMA/Jo20F9r
 Ig9Q==
X-Gm-Message-State: AOAM532d5SltYG8xB5KX8LafROubSM8q/wn7Zh/giKqsincgnNZIdY+h
 UJKJK4+t+11wKLwXoQlerXJ2xEDa23kR6mLWmo0=
X-Google-Smtp-Source: ABdhPJybnYugJ8B6aQXG/KrsIfPA9l0V87QRTIai4XUaP7XRXAapCLXlSsRhFRcDjJfSDb2JKBwUMs5DbJHK5+K5XWk=
X-Received: by 2002:a17:906:e88:: with SMTP id
 p8mr3752367ejf.105.1622806012807; 
 Fri, 04 Jun 2021 04:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210514173110.1397741-1-berrange@redhat.com>
 <YLnnqWIyNnO7V5+C@redhat.com>
In-Reply-To: <YLnnqWIyNnO7V5+C@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 4 Jun 2021 15:26:41 +0400
Message-ID: <CAJ+F1CJBgocFFqSHDaWKgrtJ73UgvFGYsEsA+3tG_=DYHbYJbg@mail.gmail.com>
Subject: Re: [PATCH 0/4] docs: add user facing docs for secret passing and
 authorization controls
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000eece9505c3eef77f"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62d.google.com
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

--000000000000eece9505c3eef77f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2021 at 12:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> ping for any reviewers for docs
>
> On Fri, May 14, 2021 at 06:31:06PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > These are an important of the overall QEMU network backend security
> > controls but never previously documented aside from in blog posts.
> >
> > Daniel P. Berrang=C3=A9 (4):
> >   docs: document how to pass secret data to QEMU
> >   docs: document usage of the authorization framework
> >   docs: recommend SCRAM-SHA-256 SASL mech instead of SHA-1 variant
> >   sasl: remove comment about obsolete kerberos versions
> >
> >  docs/system/authz.rst        | 263 +++++++++++++++++++++++++++++++++++
> >  docs/system/index.rst        |   2 +
> >  docs/system/secrets.rst      | 162 +++++++++++++++++++++
> >  docs/system/vnc-security.rst |   7 +-
> >  qemu.sasl                    |  15 +-
> >  5 files changed, 437 insertions(+), 12 deletions(-)
> >  create mode 100644 docs/system/authz.rst
> >  create mode 100644 docs/system/secrets.rst
>

lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>
> > --
> > 2.31.1
> >
> >
>
> Regards,
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

--000000000000eece9505c3eef77f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 4, 2021 at 12:44 PM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">ping for any reviewers for docs<br>
<br>
On Fri, May 14, 2021 at 06:31:06PM +0100, Daniel P. Berrang=C3=A9 wrote:<br=
>
&gt; These are an important of the overall QEMU network backend security<br=
>
&gt; controls but never previously documented aside from in blog posts.<br>
&gt; <br>
&gt; Daniel P. Berrang=C3=A9 (4):<br>
&gt;=C2=A0 =C2=A0docs: document how to pass secret data to QEMU<br>
&gt;=C2=A0 =C2=A0docs: document usage of the authorization framework<br>
&gt;=C2=A0 =C2=A0docs: recommend SCRAM-SHA-256 SASL mech instead of SHA-1 v=
ariant<br>
&gt;=C2=A0 =C2=A0sasl: remove comment about obsolete kerberos versions<br>
&gt; <br>
&gt;=C2=A0 docs/system/authz.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 263 +++++++++=
++++++++++++++++++++++++++<br>
&gt;=C2=A0 docs/system/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02=
 +<br>
&gt;=C2=A0 docs/system/secrets.rst=C2=A0 =C2=A0 =C2=A0 | 162 ++++++++++++++=
+++++++<br>
&gt;=C2=A0 docs/system/vnc-security.rst |=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 qemu.sasl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 15 +-<br>
&gt;=C2=A0 5 files changed, 437 insertions(+), 12 deletions(-)<br>
&gt;=C2=A0 create mode 100644 docs/system/authz.rst<br>
&gt;=C2=A0 create mode 100644 docs/system/secrets.rst<br></blockquote><div>=
<br></div><div>lgtm</div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a hr=
ef=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&g=
t;=C2=A0 <br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; <br>
&gt; -- <br>
&gt; 2.31.1<br>
&gt; <br>
&gt; <br>
<br>
Regards,<br>
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

--000000000000eece9505c3eef77f--

