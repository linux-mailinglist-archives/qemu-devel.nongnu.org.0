Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F84072A2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 22:36:56 +0200 (CEST)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOnGZ-00050P-CV
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 16:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mOnFI-0004JO-2C
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 16:35:36 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:41813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mOnFG-0008Ex-Bp
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 16:35:35 -0400
Received: by mail-ua1-x92a.google.com with SMTP id f24so1961318uav.8
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 13:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=75I3uS+rDbiffmpWIWQmCAOqR89eVG3MKBVrc5JYY5I=;
 b=1aug0ufTtyLEoPtvyiCCqq4PeCS8CrB9E1ZmhAFwRcJ4tvlCikBvkWstiJP27Tom0j
 3UOvCRELrF5L2eDNfLNN5YNzAX9hOn7M52zpoD/cOas0zcq/W5y7oqoCw4Fm3nPDDxTM
 9Jc8Mk4rZhgb6ec7TsL4pPF5vZLpHj/nkW2J48BQK9/nBED5azG0R3tYEn6VCymLAuL2
 8jz+lf4nCUU+gAS+s8a3km2Bf+WAlr9O/2uRZaDuxwoUXgTeKJ71naqcsUzES9eXWE0m
 hqAKFiKOBxAt19Xa53ben1xkkQpIn2VPX2DEDTN+GFv748/OJXFaXCLJGUUdIYtp/hje
 1M0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=75I3uS+rDbiffmpWIWQmCAOqR89eVG3MKBVrc5JYY5I=;
 b=OYt5Q48+MtbIuQCCHdMV9M/9GtDhWN176/LqXCjmdrkkhdgjSwRQFmBDn1pkmD5SzS
 VgaYNpGyHGZnhVxNs8xTuuSc/7qFnkK2Rob34cjmXnRUA+VSN1gdYSOOpDE8+SvZu68u
 vzvZI358yGiu0I4MQvtgeh1ZCOowvciIHR6HHMkQiRKgvMPc6KMq2fHq80kv6/UoClxd
 3AVoI0mjRGNvoh8LHjILtWUPefMCspaV6PmmuwkjTZH/6dOJFsa1JopgUM2LGwhiVg48
 GwwKhlOnj4UP40sQZXjzOGoCY11/JWWx3pdKojqqheusv9EzuE1k0oJoZk1dVZcFpnG+
 nwuw==
X-Gm-Message-State: AOAM5320+EX2cC+8ia1gNdXuBl1jzxBkT54Eg+IRzNwjsZERDsGTJCjx
 t5Sd1QWzoNSLGPbrh8hMYPQXrSBUdhSVzo8ABqhyCw==
X-Google-Smtp-Source: ABdhPJy4YmjQwpW8YiaWxfW4sLk2pOe9PYJ8OhzDzpj5qU0bkuSDTh7LJSwvKqqzDXm9u2idUdYYMVKfJLMHdQjTKXY=
X-Received: by 2002:a9f:31c8:: with SMTP id w8mr7671947uad.77.1631306133164;
 Fri, 10 Sep 2021 13:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210907215332.30737-1-imp@bsdimp.com>
 <CAFEAcA9kF08A1PyPmBXfWykWZwP4+MoPOvTn4diu13Dkq04SVg@mail.gmail.com>
 <CANCZdfqpoqgyqWoX=y_GFfjhphGbZjWk2yS=ZTcrAiZa9Q3BJw@mail.gmail.com>
 <344864f6-38f5-1478-5945-20c82f21d426@amsat.org>
In-Reply-To: <344864f6-38f5-1478-5945-20c82f21d426@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 10 Sep 2021 14:35:22 -0600
Message-ID: <CANCZdfr5tqM0s4+2OxYS7X+76itQfR4E0+Fw=+Nd2AoUR3uPsQ@mail.gmail.com>
Subject: Re: [PULL 00/42] bsd-user updates to run hello world
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000096663405cbaa0e0d"
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000096663405cbaa0e0d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 9, 2021 at 10:31 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 9/9/21 5:12 PM, Warner Losh wrote:
> >
> >
> > On Thu, Sep 9, 2021, 9:01 AM Peter Maydell <peter.maydell@linaro.org
> > <mailto:peter.maydell@linaro.org>> wrote:
> >
> >     On Tue, 7 Sept 2021 at 22:56, <imp@bsdimp.com
> >     <mailto:imp@bsdimp.com>> wrote:
> >     >
> >     > From: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> >     >
> >     > The following changes since commit
> >     f214d8e0150766c31172e16ef4b17674f549d852:
> >     >
> >     >   Merge remote-tracking branch
> >     'remotes/pmaydell/tags/pull-target-arm-20210826' into staging
> >     (2021-08-26 18:03:57 +0100)
> >     >
> >     > are available in the Git repository at:
> >     >
> >     >   https://gitlab.com/bsdimp/qemu.git
> >     <https://gitlab.com/bsdimp/qemu.git> tags/bsd-user-pull-20210907-ta=
g
> >     >
> >     > for you to fetch changes up to
> >     dc96376e46a52ac63a27ea185c3f0a6fd54e3c82:
> >     >
> >     >   bsd-user: Update mapping to handle reserved and starting
> >     conditions (2021-09-07 08:26:53 -0600)
> >
> >     >  slirp                                         |    2 +-
> >
> >     A bogus submodule update seems to have crept in here...
> >
> >
> > So I need to fix this and resubmit?
>
> Yes, but since there is no change in most of the commits, you don't
> need to repost the whole, once pushed the new tag, you can just
> post the the cover letter (which triggers Peter's scripts) and the
> fixed "[PULL 07/42] bsd-user: move arch specific defines out of
> elfload.c" which updated the submodule.
>

Done. Thanks!

Warner

--00000000000096663405cbaa0e0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 9, 2021 at 10:31 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 9/9/21 5:12 PM, Warner Losh wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Sep 9, 2021, 9:01 AM Peter Maydell &lt;<a href=3D"mailto:peter=
.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blan=
k">peter.maydell@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 7 Sept 2021 at 22:56, &lt;<a href=3D"mailto=
:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank">imp@bsdimp.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a> &lt;mailto:<a href=3D"mailto=
:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The following changes since commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0f214d8e0150766c31172e16ef4b17674f549d852:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0Merge remote-tracking branch<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;remotes/pmaydell/tags/pull-target-arm-20210826=
&#39; into staging<br>
&gt;=C2=A0 =C2=A0 =C2=A0(2021-08-26 18:03:57 +0100)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; are available in the Git repository at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/bsdi=
mp/qemu.git" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/bsdimp=
/qemu.git</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.com/bsdimp/qemu.git" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/bsdimp/qemu.git</a>=
&gt; tags/bsd-user-pull-20210907-tag<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; for you to fetch changes up to<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc96376e46a52ac63a27ea185c3f0a6fd54e3c82:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0bsd-user: Update mapping to handle=
 reserved and starting<br>
&gt;=C2=A0 =C2=A0 =C2=A0conditions (2021-09-07 08:26:53 -0600)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0A bogus submodule update seems to have crept in her=
e...<br>
&gt; <br>
&gt; <br>
&gt; So I need to fix this and resubmit?<br>
<br>
Yes, but since there is no change in most of the commits, you don&#39;t<br>
need to repost the whole, once pushed the new tag, you can just<br>
post the the cover letter (which triggers Peter&#39;s scripts) and the<br>
fixed &quot;[PULL 07/42] bsd-user: move arch specific defines out of<br>
elfload.c&quot; which updated the submodule.<br></blockquote><div><br></div=
><div>Done. Thanks!</div><div><br></div><div>Warner</div></div></div>

--00000000000096663405cbaa0e0d--

