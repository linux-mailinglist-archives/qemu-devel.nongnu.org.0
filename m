Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337BD405A0B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:14:04 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLkY-00050p-W0
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mOLjd-0004KR-Rd
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:13:06 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mOLjc-0002ux-79
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:13:05 -0400
Received: by mail-lj1-x22e.google.com with SMTP id r3so3525672ljc.4
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wQM03n2tbo/3ecFQK8LdFU64h69PcVMMsVjyoi4KRSg=;
 b=Xr1fIJQBmJ13hWJ4ojM40FQ9tiojNgVVkAbltz7iPvswvemk/DPsUqxQkFkO6cdDhK
 ezS9Au1NhbJPipeTaO5tBZ/siG3YgShU88lNNi6hX0rQhlzvSGZHpHOo6bYVHsWMojik
 xiKZVLfJb6JSIEHzzQ+KGMFf8YZaC+aIg8iEgQr717urU99ib0Wj8DZUaMxrWnpumGnL
 eD0l/qeAqX7OYv5O8vb1D5g4oIyVHN9OAX2D+vYOgJG3gOpXWkdfinYEW772Wa+ria5M
 zPeqhdO9WNvi6Dt8Jq6fCdsvzzdu7ASf+YD+/B48iElCXK2yaW5nqTGcYrAREFCqQ2bS
 sFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wQM03n2tbo/3ecFQK8LdFU64h69PcVMMsVjyoi4KRSg=;
 b=dn9YGtffMcvVklZ+LD8tFsEA7PoLTTptR+TUIg79jD0EzLuvcGJJ91SUNrcmZ5Kyv5
 YZayARRmCQIHDaPM1/APbagDctHty2tMyyakdwBDCgg6T31aACWIwLr6u52kW2kpPeZX
 LAaCfh7XtH1WriopwEM4N5n1P8jJXoXHlNEp5CBquIuYxI3BCm4awcXi2ebckUd6B9Tf
 xSijCrRvuM/fMllukLK1EknAxoVWQnqg9LPgOVii3pGFIIe3hB662Rx2+RttH/g+lYKR
 dLkbpVGo5vX1BtnRcIlGJkUIFj5p4NdzuDb7GDLvy1U5g+8ToLXtSPRqJI6J5U69RKLN
 8CAA==
X-Gm-Message-State: AOAM533OIi0gQZphiFW1zOAE/EnPWh/jBSYAQVB/1pRz6z3fqscQszBK
 OVERjh0TkpswU2Zflk9J8kl3v9nrqx6JchJHw76erB0QLk4=
X-Google-Smtp-Source: ABdhPJzq+nuBrUoDztI5yOQYGeyfgfkRzIEcaM28eU6xgDqXLt4FwUl1TayBWUoTHh0MjSdnEg/+GjBP7zn8NpmRI7Y=
X-Received: by 2002:a2e:8119:: with SMTP id d25mr277183ljg.486.1631200377152; 
 Thu, 09 Sep 2021 08:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210907215332.30737-1-imp@bsdimp.com>
 <CAFEAcA9kF08A1PyPmBXfWykWZwP4+MoPOvTn4diu13Dkq04SVg@mail.gmail.com>
In-Reply-To: <CAFEAcA9kF08A1PyPmBXfWykWZwP4+MoPOvTn4diu13Dkq04SVg@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 9 Sep 2021 09:12:45 -0600
Message-ID: <CANCZdfqpoqgyqWoX=y_GFfjhphGbZjWk2yS=ZTcrAiZa9Q3BJw@mail.gmail.com>
Subject: Re: [PULL 00/42] bsd-user updates to run hello world
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000009d56e05cb916f48"
Received-SPF: none client-ip=2a00:1450:4864:20::22e;
 envelope-from=wlosh@bsdimp.com; helo=mail-lj1-x22e.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000009d56e05cb916f48
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 9, 2021, 9:01 AM Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 7 Sept 2021 at 22:56, <imp@bsdimp.com> wrote:
> >
> > From: Warner Losh <imp@bsdimp.com>
> >
> > The following changes since commit
> f214d8e0150766c31172e16ef4b17674f549d852:
> >
> >   Merge remote-tracking branch
> 'remotes/pmaydell/tags/pull-target-arm-20210826' into staging (2021-08-26
> 18:03:57 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bsdimp/qemu.git tags/bsd-user-pull-20210907-tag
> >
> > for you to fetch changes up to dc96376e46a52ac63a27ea185c3f0a6fd54e3c82:
> >
> >   bsd-user: Update mapping to handle reserved and starting conditions
> (2021-09-07 08:26:53 -0600)
>
> >  slirp                                         |    2 +-
>
> A bogus submodule update seems to have crept in here...
>

So I need to fix this and resubmit?

My loath of modules is coming to a middle... they update in the rebase, but
don't reset without magic commands. :(

Warner

>

--00000000000009d56e05cb916f48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Sep 9, 2021, 9:01 AM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Tue, 7 Sept 2021 at 22:56, &lt=
;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank" rel=3D"noreferrer">imp=
@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_bla=
nk" rel=3D"noreferrer">imp@bsdimp.com</a>&gt;<br>
&gt;<br>
&gt; The following changes since commit f214d8e0150766c31172e16ef4b17674f54=
9d852:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/pmaydell/tags/pu=
ll-target-arm-20210826&#39; into staging (2021-08-26 18:03:57 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/bsdimp/qemu.git" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://gitlab.com/bsdimp/qemu.git</a>=
 tags/bsd-user-pull-20210907-tag<br>
&gt;<br>
&gt; for you to fetch changes up to dc96376e46a52ac63a27ea185c3f0a6fd54e3c8=
2:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0bsd-user: Update mapping to handle reserved and starting c=
onditions (2021-09-07 08:26:53 -0600)<br>
<br>
&gt;=C2=A0 slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
<br>
A bogus submodule update seems to have crept in here...<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">So I need to fix thi=
s and resubmit?</div><div dir=3D"auto"><br></div><div dir=3D"auto">My loath=
 of modules is coming to a middle... they update in the rebase, but don&#39=
;t reset without magic commands. :(</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Warner</div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000009d56e05cb916f48--

