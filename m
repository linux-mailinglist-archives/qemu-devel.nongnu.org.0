Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C4D33234B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:45:15 +0100 (CET)
Received: from localhost ([::1]:34804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZrV-0003oC-Vi
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lJZpP-0002zt-Rb
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:43:03 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lJZpM-0004il-BE
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:43:03 -0500
Received: by mail-ej1-x632.google.com with SMTP id lr13so26482798ejb.8
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YDP3a5Ry+S8jW1KUXSyVYnd/WEBTlzs9Loq/BnY7RdI=;
 b=sjBhEq8+7A9wj2ex2RAkNT7TEnY6Xw+RpJOgAA6EQJQwtnB0gd7Ngt+aWHyPmYW35e
 AEU1kBFNO+BEHc/jv1Hy9piH0ETJilKcFfwxaKSzAbgoW5pdRO3QgAYD+vWhcaWBwxpn
 7J7UCYFZqXQnSn3VDj+gknhzf106cZmYrF2DKac4fUcPYwadg96o+go+0TDcg4KzOXDc
 sWitrmLfYBtpivn+kx4bvsbOywXb1DmD/Bzt+GLr7Ws8thTmcJsCOSxoYirub6mNJdj2
 WW8u/iQ45l0xRBRnquPaeXZjZcNEJ4ggDuw/oQsRDhKYAwOZUXZyQkASMsoPCxRcPX0B
 dfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YDP3a5Ry+S8jW1KUXSyVYnd/WEBTlzs9Loq/BnY7RdI=;
 b=LG4wXNvLCkKoCPqN6AV9vcO2eSi0NTo3h5OAQ1FbLzA/2ezBWAoFiy6LhoJICg8ctW
 gfGHCm+/JcaDc3ccIfg6ke+rFTYqEYgQy3l+cnjIVO0iUosXEtwF8KWT36PdO7cIsro6
 sSfBeJk6eOdtem/rBfamgOWJol65NQ4fbFNMekRIm7XJXtAjgZxmc2bsxIX4XOr+ON3o
 ZBSPIZhzAS9nzVlUqoNxkHMeSK7sptFtmPcGdLtNDaHRKhv5y79ASzjUNPqHGCFpdOkl
 BZnECr5IQldpUmysZCDyGa85+ed96grYDF76d00oVuDtbzqXA7ZyHgdeZKBoUJwvSVnD
 IKeA==
X-Gm-Message-State: AOAM5308C9cBxD6LZ5TjhV0Iyzs6UnpvUgCWsh7ZqeaEVj89JSBe/Jof
 BizeYdo3Js4wER1s03T6SqcnwjvzRoh9Zhq9Wlg=
X-Google-Smtp-Source: ABdhPJz5+1mFFzxtTpSRO5y7lQIw6DxVuR+WXRE1N7y/oUrNvFx7cotXzXJXcjcasY1UMTyJ8buba6YbIKqZza+n5ss=
X-Received: by 2002:a17:906:cf90:: with SMTP id
 um16mr19945770ejb.389.1615286577955; 
 Tue, 09 Mar 2021 02:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20210309032637.41778-1-j@getutm.app> <YEdBce6TWCVpSph9@redhat.com>
 <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
 <537a6a0e-431b-3920-c8dc-290e4e3d8895@redhat.com>
 <YEdOJIUp5wsVo0ao@redhat.com>
In-Reply-To: <YEdOJIUp5wsVo0ao@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 Mar 2021 14:42:46 +0400
Message-ID: <CAJ+F1CJ30dgGMj-R54jonrHsieAYZRk4foOOYgspkKbQ=3P3Uw@mail.gmail.com>
Subject: Re: [PATCH] coroutine: add libucontext as external library
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b0860b05bd183647"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b0860b05bd183647
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Mar 9, 2021 at 2:36 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Tue, Mar 09, 2021 at 11:24:08AM +0100, Paolo Bonzini wrote:
> > On 09/03/21 10:59, Joelle van Dyne wrote:
> > > Does it make a difference if this is provided as an option and not as
> > > a replacement? Would it make sense to add some warning at configure
> > > time? Right now none of the concurrency backends are supported on iOS
> > > and it's possible support will go away on macOS as well in the future=
.
> > > QEMU would not be able to run at all.
> >
> > The alternative is to use a handwritten backend, it would be necessary
> > anyway for CET support.
> >
> > You can find the patches at
> > https://patchew.org/QEMU/20190504120528.6389-1-pbonzini@redhat.com/
>
> It sure would be nice if someone could take the QEMU coroutine impls
> and spin them out into a "libcoroutine" for reuse. We use coroutines
> across QEMU, SPICE-GTK, GTK-VNC and all have different featureset and
> QEMU's seems the best in general, especially as you start adding the
> CET stuff.
>

I tried it years ago: https://github.com/elmarco/gcoroutine/ (there were
patches for spice-gtk & qemu at that time)

If I remember correctly, there were objections because we wanted to have an
implementation close to QEMU, so we could easily extend it, or add custom
optimizations.

Everybody loves submodules now, right? Maybe it's worth another try.



--=20
Marc-Andr=C3=A9 Lureau

--000000000000b0860b05bd183647
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Mar 9, 2021 at 2:36 PM Daniel P. Berr=
ang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Tue, Mar 09, 2021 at 11:24:08AM +0100, Paolo Bonzini wrote:<br>
&gt; On 09/03/21 10:59, Joelle van Dyne wrote:<br>
&gt; &gt; Does it make a difference if this is provided as an option and no=
t as<br>
&gt; &gt; a replacement? Would it make sense to add some warning at configu=
re<br>
&gt; &gt; time? Right now none of the concurrency backends are supported on=
 iOS<br>
&gt; &gt; and it&#39;s possible support will go away on macOS as well in th=
e future.<br>
&gt; &gt; QEMU would not be able to run at all.<br>
&gt; <br>
&gt; The alternative is to use a handwritten backend, it would be necessary=
<br>
&gt; anyway for CET support.<br>
&gt; <br>
&gt; You can find the patches at<br>
&gt; <a href=3D"https://patchew.org/QEMU/20190504120528.6389-1-pbonzini@red=
hat.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/201=
90504120528.6389-1-pbonzini@redhat.com/</a><br>
<br>
It sure would be nice if someone could take the QEMU coroutine impls<br>
and spin them out into a &quot;libcoroutine&quot; for reuse. We use corouti=
nes<br>
across QEMU, SPICE-GTK, GTK-VNC and all have different featureset and<br>
QEMU&#39;s seems the best in general, especially as you start adding the<br=
>
CET stuff.<br></blockquote><div><br></div><div>I tried it years ago: <a hre=
f=3D"https://github.com/elmarco/gcoroutine/">https://github.com/elmarco/gco=
routine/</a> (there were patches for spice-gtk &amp; qemu at that time)<br>=
</div><div><br></div><div>If I remember correctly, there were objections be=
cause we wanted to have an implementation close to QEMU, so we could easily=
 extend it, or add custom optimizations. <br></div><div><br></div><div>Ever=
ybody loves submodules now, right? Maybe it&#39;s worth another try.<br></d=
iv><br></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000b0860b05bd183647--

