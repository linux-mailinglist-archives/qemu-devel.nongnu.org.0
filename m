Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8741454AD9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:21:11 +0100 (CET)
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNgM-0006Sx-Id
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:21:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNV4-0001mf-Q1
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:09:31 -0500
Received: from [2607:f8b0:4864:20::936] (port=35641
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNV3-0003gM-6q
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:09:30 -0500
Received: by mail-ua1-x936.google.com with SMTP id l24so7080616uak.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=soWZMHZPBTQGuoCtexNTjGXPciiu8q/kJdYM/2JXJfc=;
 b=IICA8Pbj/d+JRp3FNUpn/DuNuKN5Ii9p70vZ9hma2AOTsCCZcl63hCFVDlHYYLtcPm
 VFqIvGpkO7wlhV2Z3r3f1zwjHbZ7YCOqUdN7Ywx9IrvTZqBkDRY5njSrqjBmkQFK4cWa
 ntFDzDwy7CoImyF6Ymb/wMfQCrxNxgdAfsRAPreD+DuQp272zlPLVhcEQJsFeecQTxVI
 PxIjYDl+310D1vy8noF5JucPv+8Pgxtb4Keav5Tz7hFcPAdEKfnaechLw/f8nbTpFSfn
 N1K/4l5G3eIMwbRMqlgVneMpBzOMmqSeBe/87afL/LjCKSvlqX5uz9Fh7zpUFbVM0Lqy
 Dzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=soWZMHZPBTQGuoCtexNTjGXPciiu8q/kJdYM/2JXJfc=;
 b=m353FzUS7t9S6/sVAAQ6YF2r0OU0xHn01UMM6TYZHYU0xmFcnJ4kXtwqWhYXuwhOBX
 GPWu6CbfgZv1uMq8kDDx/X9r+R49Dk5fhv0ok5UN6dWKXQRdsqtGvb9mvh6kaZG3K8pS
 gUcphElr+mXhqv/+WQROmQC8FF0ifeSyZW8cwwqYLHrWb548ZlQJq/pPeCLHCHZFcrK+
 l4c9isg+Rr4ltoFWjyOkiVeoXldjfOod1WGXUFXWRT3Ury1ORCprOW7lxV54RdWqHiYJ
 3F4ZVhsL12rft4OFOe9FELaMYQxE6Jq2/OqMpUmPZRWtGZ9yOPR/kOuds1dzPSW8nx/e
 ha7Q==
X-Gm-Message-State: AOAM532ZNSDS8AU+Y6LKjg4wPpv7G4JcyfaV3IEdRysl+FuOHu+oDcva
 Rpk+EDJaa2dBiHJuCJ74x5LhBJUHG5Jl6Nq42DdVrA==
X-Google-Smtp-Source: ABdhPJyzf6mNU3WHX7p8kYgbPkqWJ+RtRO1zER73NXLotAAZ3rdqIzOB8+Dt8sBu675qPk0s2DAK8utqzIckL8Kvm1A=
X-Received: by 2002:a05:6102:5f2:: with SMTP id
 w18mr72644246vsf.6.1637165362687; 
 Wed, 17 Nov 2021 08:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-4-richard.henderson@linaro.org>
 <CANCZdfoaw3X=ArOz2+tdZJ+gLRS7Wizzyc7MFHXrJyGH0nPVww@mail.gmail.com>
 <13e5e214-ff3d-3f17-27c7-c4dac8f8dc91@linaro.org>
In-Reply-To: <13e5e214-ff3d-3f17-27c7-c4dac8f8dc91@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 09:09:12 -0700
Message-ID: <CANCZdfo53QYD_rTV5X6WaMJ3Kh11+RHS47aR4dK7whjVgXvqoQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] linux-user/safe-syscall.inc.S: Move to common-user
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e1c4d505d0fe430f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::936;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e1c4d505d0fe430f
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 5:49 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/16/21 10:03 PM, Warner Losh wrote:
> > I had to add this:
> >
> > diff --git a/meson.build b/meson.build
> > index 0a88bff8d2..349e7a988f 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2880,6 +2880,8 @@ foreach target : target_dirs
> >       endif
> >       if 'CONFIG_BSD_USER' in config_target
> >         base_dir = 'bsd-user'
> > +      target_inc += include_directories('bsd-user/host/' /
> config_host['ARCH'])
> > +      target_inc += include_directories('common-user/host/' /
> config_host['ARCH'])
>
> I get an error for adding bsd-user/host/ at this point, because
> bsd-user/host/arch does
> not yet exist.  But I can certainly add common-user/host/ now.
>

That makes sense... It's in my staging area because git sometimes leaves it
behind when I
switch between the bsd-user fork and the qemu upstream and/or my working
branches.

Warner

--000000000000e1c4d505d0fe430f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 5:49 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 11/16/21 10:03 PM, Warner Losh wrote:<br>
&gt; I had to add this:<br>
&gt; <br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 0a88bff8d2..349e7a988f 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -2880,6 +2880,8 @@ foreach target : target_dirs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;CONFIG_BSD_USER&#39; in config_targe=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_dir =3D &#39;bsd-user&#39;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0target_inc +=3D include_directories(&#39;bsd-use=
r/host/&#39; / config_host[&#39;ARCH&#39;])<br>
&gt; + =C2=A0 =C2=A0 =C2=A0target_inc +=3D include_directories(&#39;common-=
user/host/&#39; / config_host[&#39;ARCH&#39;])<br>
<br>
I get an error for adding bsd-user/host/ at this point, because bsd-user/ho=
st/arch does <br>
not yet exist.=C2=A0 But I can certainly add common-user/host/ now.<br></bl=
ockquote><div><br></div><div>That makes sense... It&#39;s in my staging are=
a because git sometimes leaves it behind when I</div><div>switch between th=
e bsd-user fork and the qemu upstream and/or my working branches.</div><div=
><br></div><div>Warner</div></div></div>

--000000000000e1c4d505d0fe430f--

