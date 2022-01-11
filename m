Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7AE48B0C1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 16:23:41 +0100 (CET)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Izs-0007pU-2K
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 10:23:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n7Iye-0006xC-FV
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:22:24 -0500
Received: from [2607:f8b0:4864:20::a2e] (port=38738
 helo=mail-vk1-xa2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n7Iyc-000754-Nl
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 10:22:24 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id h16so3253878vkp.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 07:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKBjZY1jVvAZEVPfW6fyEMIEGxB03Mi57oPWEz6lJmg=;
 b=tJc3oNZFCD/Mw5TNihsxyLKmgv9P+5fJYc308+d/F8WeS3iVzWvT7OcKc2O6ClScgd
 FxS7YTxJBJIRXtH8k4Opqxr/vGG6HFAeG5+Qm2mJgWX6+XkuJgUmG2/0qBIPFV49GVMa
 oPQXUjNbLwhxG5+VYkOHINuwD6uKuvFR/dLYnzq0Y3rHN8yyolVMFr3iVKfB7CSHCZPO
 k0BBBmq08AeeSR6S11+ShGeeQr9TFOWyAXhNm9d5dlJdZHj0anCGXGzYG5z7Hg6BKW11
 lEl97ZN10I62VymHiQ+ZXPAWVRSgfUjyeXFHAbw10Wpj7EIfPNjaEVdYYPxJzWI/4jg7
 81IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKBjZY1jVvAZEVPfW6fyEMIEGxB03Mi57oPWEz6lJmg=;
 b=B+bairuH1ObMMb7rr0P1A+Dm33J4BCG+izUZL7VXM7gX7uGabK8cAZPJNEq6ahSrXi
 uoFA6gZbWClAF2QdMeWizugKcb6BmYw4BvSQk+aL9E49FtegljzI3vs0L15NFro8lK12
 6lXY++L3LoDnAcqsyXU3+bDQ+8qz3Kpy+ORR2N+3Ta4wMh6lM5XECUWg9ZcjJp4Ltiqv
 DGfGlCJgrOz+bZdPPdzvaTr7m/L0548lb8VQPa6kwSjlw9BUd7jrEocxbKsS3XhWA9uZ
 gnGKrALXR0aHCeSxEv4XdQKy8FACyObwXB5fibHFKNLpiBDDAciuKWrmzf2xltwR3bHP
 7wTQ==
X-Gm-Message-State: AOAM531MN5TMNCo0dAe3Mtx0MprMo+cj1y+YsMPy7IWlbMtxCgXKYpWK
 h61DkzyRZBCv2ytJ5ctvvX+9ti0bSlODCQTJfqA9Og==
X-Google-Smtp-Source: ABdhPJx24JU9GBLyXmKCnqy+mATGWzWiukn8hCo4IMb2YNvLXo/mjrMNbJ86efAygjuiEkRn4egCBN0R8/ruuySo3ok=
X-Received: by 2002:a05:6122:1805:: with SMTP id
 ay5mr2297526vkb.5.1641914541190; 
 Tue, 11 Jan 2022 07:22:21 -0800 (PST)
MIME-Version: 1.0
References: <c4b8b407-e270-b5eb-8f41-2b28d94059e3@amsat.org>
 <Yd2GLdR/4W9ANOat@redhat.com>
In-Reply-To: <Yd2GLdR/4W9ANOat@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 11 Jan 2022 08:22:10 -0700
Message-ID: <CANCZdfq+AC_L9mp8rOsA-623p0Vd3RtU0v20EY+a39qY=bvgVw@mail.gmail.com>
Subject: Re: cirrus-ci: FreeBSD failure (lttng-ust package not found)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000faccb105d5500429"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000faccb105d5500429
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 6:49 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Tue, Jan 11, 2022 at 02:11:14PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi Alex,
> >
> > I am getting this failure for the x64-freebsd-*-build jobs [1, 2]:
> >
> > pkg: No packages available to install matching 'lttng-ust' have been
> > found in the repositories
>
> It was being installed fine on FreeBSD 13 as recently as 5
> days ago
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/1944746050
>
> but then disappeared from FreeBSD 13 four days ago
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/1949284897
>
> and then disappeared from FreeBSD 12 yesterday
>
>   https://gitlab.com/qemu-project/qemu/-/jobs/1958443678
>
> Looking back at the older working builds I see
>
> [quote]
> =3D=3D>   NOTICE:
>
> The lttng-ust port currently does not have a maintainer. As a result, it =
is
> more likely to have unresolved issues, not be up-to-date, or even be
> removed in
> the future. To volunteer to maintain this port, please create an issue at=
:
>
> https://bugs.freebsd.org/bugzilla
> [/quote]
>
> I notice last year they marked it broken in >=3D 13:
>
>
> https://cgit.freebsd.org/ports/commit/?id=3Dabe5fefed2e24ef43a890f4d50ba7=
12c581c7cfe
>
> Overall it feels like we probably just need to drop this package
> from the build on FreeBSD
>

lttng-tools was marked broken. lttng-ust isn't marked broken, but seems to
have failed to
build in the last package run. I'm trying to track down the details.

Warner

--000000000000faccb105d5500429
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 11, 2022 at 6:49 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, Jan 11, 2022 at 02:11:14PM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:<br>
&gt; Hi Alex,<br>
&gt; <br>
&gt; I am getting this failure for the x64-freebsd-*-build jobs [1, 2]:<br>
&gt; <br>
&gt; pkg: No packages available to install matching &#39;lttng-ust&#39; hav=
e been<br>
&gt; found in the repositories<br>
<br>
It was being installed fine on FreeBSD 13 as recently as 5<br>
days ago<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/1944746050" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/=
jobs/1944746050</a><br>
<br>
but then disappeared from FreeBSD 13 four days ago<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/1949284897" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/=
jobs/1949284897</a><br>
<br>
and then disappeared from FreeBSD 12 yesterday<br>
<br>
=C2=A0 <a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/1958443678" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/=
jobs/1958443678</a><br>
<br>
Looking back at the older working builds I see<br>
<br>
[quote]<br>
=3D=3D&gt;=C2=A0 =C2=A0NOTICE:<br>
<br>
The lttng-ust port currently does not have a maintainer. As a result, it is=
<br>
more likely to have unresolved issues, not be up-to-date, or even be remove=
d in<br>
the future. To volunteer to maintain this port, please create an issue at:<=
br>
<br>
<a href=3D"https://bugs.freebsd.org/bugzilla" rel=3D"noreferrer" target=3D"=
_blank">https://bugs.freebsd.org/bugzilla</a><br>
[/quote]<br>
<br>
I notice last year they marked it broken in &gt;=3D 13:<br>
<br>
=C2=A0 <a href=3D"https://cgit.freebsd.org/ports/commit/?id=3Dabe5fefed2e24=
ef43a890f4d50ba712c581c7cfe" rel=3D"noreferrer" target=3D"_blank">https://c=
git.freebsd.org/ports/commit/?id=3Dabe5fefed2e24ef43a890f4d50ba712c581c7cfe=
</a><br>
<br>
Overall it feels like we probably just need to drop this package<br>
from the build on FreeBSD<br></blockquote><div><br></div><div>lttng-tools w=
as marked broken. lttng-ust isn&#39;t marked broken, but seems to have fail=
ed to</div><div>build in the last package run. I&#39;m trying to track down=
 the details.</div><div><br></div><div>Warner</div><div><br></div></div></d=
iv>

--000000000000faccb105d5500429--

