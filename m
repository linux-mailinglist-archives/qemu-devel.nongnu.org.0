Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20582EDD38
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 12:02:02 +0100 (CET)
Received: from localhost ([::1]:59598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRa7U-0001UO-Jk
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 06:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57221)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iRa6A-0000vA-S3
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 06:00:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iRa69-0005zv-GZ
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 06:00:38 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45053)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iRa69-0005zf-83
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 06:00:37 -0500
Received: by mail-ed1-x52f.google.com with SMTP id a67so653795edf.11
 for <qemu-devel@nongnu.org>; Mon, 04 Nov 2019 03:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xOBYOkOsu9JHb5HyNyM8fCvh3F2N2C2jpuiTrYPKWEo=;
 b=u+oqb2yHgo6AwgDlQMt6MA9GOxF5qu/7Kergi+GBeX2U9EexWEM6bFqVUVwl/i/a31
 6cuWli91xSbAZgMibR2txNyQpVSTwwQbtKRgmDJdWINH2/w3jaO1S73idWM5E/29Pf27
 TWJi/N7uLIPYPMt9Am47MRBCGH5AlJsT9AIDLGore5POVFM104MzOkvyIJzSSPFFZejZ
 3OCD3Jee6EVsb60celOM+7jXH3tdfqM8YcEBwm7NMPYjhPhlI3iKZQDCUd3jlnkVUa1v
 TRVtUCXp8cRjryCF2msjEAJyk/aZ+ZyU2WyE6oz9ujY060QDQeaKQzKVlXwgXHM6qXLI
 tT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xOBYOkOsu9JHb5HyNyM8fCvh3F2N2C2jpuiTrYPKWEo=;
 b=Q1mgucZDIyEp4Z619OXt1+4qUUK1BWVvxMcFmlvULEK7lvO+Oz6wAh07qskwtRGG0Q
 s1N5SMYuzBSSgrppULKQrCMAbfC0Qp5unFUIA+FPh7FOvhCvE+q8CbbtOdnCgGIZAoqq
 eUaI96qKa3x6Dt6WQAdXwTWL/lhFsGfJaMMkETYgqHcOL53x5cgVik9sAmeWarGGAt0M
 F/fLNh7EvoDkCE6jPRY/M6hLzjOyw0cqcTNDIC3QReuD87hCiO6ofEVAMCor84Bi5Q6+
 85cK0uGH+44b3xX9pZbCM5uOnvRVFh151b+evUNt7F4Ojtvd7qCr3s931ZvK6DLuShr+
 woTg==
X-Gm-Message-State: APjAAAVvuzmW/RUhwS8sq6fXX2B+3O1f7EeCO4Hn3PWF9C7HGeXuCFp5
 w4sLN2r5+jJBS+pfF2bvRVIyxAtJLaeFtoLNke4=
X-Google-Smtp-Source: APXvYqz+mAPMMC4hBjC3MpUTs8ER0vSGuanIEwcmDD16xBFjgKiICxmCKU4AK/8aFcmDWAmE04u6gHbJH4L4Ws6tUek=
X-Received: by 2002:a05:6402:142c:: with SMTP id
 c12mr28168379edx.96.1572865235564; 
 Mon, 04 Nov 2019 03:00:35 -0800 (PST)
MIME-Version: 1.0
References: <CAGbAg_D_FL-7GVppw_nYDV3i2Bu7Z1hm6eW74tvhvxEKXh0KcA@mail.gmail.com>
 <20191104100956.GD2987@redhat.com>
In-Reply-To: <20191104100956.GD2987@redhat.com>
From: Esteban Bosse <estebanbosse@gmail.com>
Date: Mon, 4 Nov 2019 12:00:23 +0100
Message-ID: <CAGbAg_D8Qfo0b3aLN7gtC1wsSW55rfSnT29kc==JkjtsiY9pOQ@mail.gmail.com>
Subject: Re: Wiki account
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a53cf805968339a7"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::52f
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a53cf805968339a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you very much :)

Estebanb

El lun., 4 nov. 2019 11:10, Daniel P. Berrang=C3=A9 <berrange@redhat.com>
escribi=C3=B3:

> On Sun, Nov 03, 2019 at 11:27:33AM +0100, Esteban Bosse wrote:
> > Hello,
> > I would like to have an wiki account.
> >
> > Preferred user: estebanb
>
> I've created this account and sent password details off-list.
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

--000000000000a53cf805968339a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thank you very much :)<div dir=3D"auto"><br></div><div di=
r=3D"auto">Estebanb=C2=A0</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">El lun., 4 nov. 2019 11:10, Daniel P. Berran=
g=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&=
gt; escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, Nov 03, =
2019 at 11:27:33AM +0100, Esteban Bosse wrote:<br>
&gt; Hello,<br>
&gt; I would like to have an wiki account.<br>
&gt; <br>
&gt; Preferred user: estebanb<br>
<br>
I&#39;ve created this account and sent password details off-list.<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div>

--000000000000a53cf805968339a7--

