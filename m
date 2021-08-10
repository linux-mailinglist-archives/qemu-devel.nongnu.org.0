Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507193E5118
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 04:39:15 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDHfe-000588-Bt
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 22:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDHel-0004TU-0x
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 22:38:19 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDHej-0000CP-Ka
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 22:38:18 -0400
Received: by mail-qt1-x82d.google.com with SMTP id y9so4036305qtv.7
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 19:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TSQc+ue6E/IB/daCZWhM2oLN4qCHpZu5BHyiV689V34=;
 b=CCgQOWCxUx6TbPUX6GTSCF4E2vtNjRN039Jt4uMGqdBmJOswEUDU5I37d0MV7azluo
 6UpGC87U2kYb9O0cNBSiVtWSbm6CvReyRxuPZfK3/QhafGxelwCeTCmBcphydM5lIoUQ
 SWLbUdthOpkYV/mnTZVUnaNAlhDe4tHMlGnbx32LnpQesl/gGuiYBnxnDRYRCosdFzQM
 vsIg6mrq820oIp1KZa8EBTT4mKr6E2Yl3DPSqG1y/V/Kquhga/sykR/PHJM8fgdvpGBZ
 FAgsUyYKjFJAB88esAcBNXo0oYcE2ydpUw1gZNyHmIhUVkLaa0Ev7ikxtEmLwFElRolD
 axaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TSQc+ue6E/IB/daCZWhM2oLN4qCHpZu5BHyiV689V34=;
 b=dB4Gmrt8Fy0vSzeykmjKqtGrbIog2OTVqJmDEyBNkIpm3zfhXQArIGla8Vu7gLg/MF
 vANzjIL+qTFOBWYbFZqNKh3yhRmjzrG1b6iL9vfWjiEJlFMtZvrF6pmGkOfiOFbUu7UL
 sQO01/y7FQf2x5LYuK1AOgzdHVzWY3lnCtPdZDUFVRc/OtRtrwbxBn6tEzhwyM8mw3Ea
 dO032Vmf5EgPGM9Gy/SAtYK4cPwrVbLGuEUu51OT1LzZmYVvP/MidVQGhBfuDI620pNV
 AHT1XhAsSBOUE8H0jywNDWO+AIxTFP0I+Y27tQHvcVktnwclBXvoKrgjgUknm4fiQlEF
 G6WA==
X-Gm-Message-State: AOAM531mHT7gAxG1NffqCdZg3onFw1sSw+5s7kWl/t/cE45iHFOSqYKS
 qVkYCL512gIzHe5tvIUUShaytlnOVnAgSh1X3Was7g==
X-Google-Smtp-Source: ABdhPJxkXTU0q30oBIamXKSARKlGRTzst1ryyAspvYBvxW3N4V4RRsXzq9rVtnEESYu8Za8kkXRemw5jUaTpzC8WB/E=
X-Received: by 2002:ac8:777a:: with SMTP id h26mr13062081qtu.235.1628563096246; 
 Mon, 09 Aug 2021 19:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-26-imp@bsdimp.com>
 <392c25d5-e37d-cb85-85de-7692bc049599@linaro.org>
In-Reply-To: <392c25d5-e37d-cb85-85de-7692bc049599@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 9 Aug 2021 20:38:05 -0600
Message-ID: <CANCZdfog=U7v5_LDEXgt-dvKsbeJUz2Z0A2q3jhsJgmbf-0BZA@mail.gmail.com>
Subject: Re: [PATCH for 6.2 25/49] bsd-user: define max args in terms of pages
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d8ae9a05c92b64bb"
Received-SPF: none client-ip=2607:f8b0:4864:20::82d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d8ae9a05c92b64bb
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 9, 2021 at 2:33 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > From: Warner Losh <imp@FreeBSD.org>
> >
> > For 32-bit platforms, pass in up to 256k of args. For 64-bit, bump that
> > to 512k.
> >
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/qemu.h | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > +#define TARGET_ARG_MAX (512 * 1024)
> > +#else
> > +#define TARGET_ARG_MAX (256 * 1024)
>
> For the to-do list: qemu/units.h has KiB for clarity.
>

OK. Will change. Thanks!

Warner

--000000000000d8ae9a05c92b64bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 9, 2021 at 2:33 PM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; From: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; For 32-bit platforms, pass in up to 256k of args. For 64-bit, bump tha=
t<br>
&gt; to 512k.<br>
&gt; <br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h | 14 ++++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 10 insertions(+), 4 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
&gt; +#define TARGET_ARG_MAX (512 * 1024)<br>
&gt; +#else<br>
&gt; +#define TARGET_ARG_MAX (256 * 1024)<br>
<br>
For the to-do list: qemu/units.h has KiB for clarity.<br></blockquote><div>=
<br></div><div>OK. Will change. Thanks!</div><div><br></div><div>Warner=C2=
=A0</div></div></div>

--000000000000d8ae9a05c92b64bb--

