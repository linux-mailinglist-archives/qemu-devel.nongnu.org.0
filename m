Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F344BA2F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 03:12:24 +0100 (CET)
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkd67-0001FE-CC
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 21:12:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkd4C-00006B-G8
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 21:10:26 -0500
Received: from [2607:f8b0:4864:20::934] (port=46925
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mkd48-0002Zy-OS
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 21:10:23 -0500
Received: by mail-ua1-x934.google.com with SMTP id az37so1575303uab.13
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 18:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Dc33lvd0X9QS8SjlkLazbkKatAV5j2/wn10u4PoRwo=;
 b=ITVb1OSjQuaaalKh1GXjFdzg7EextTYnJslVcFuap1CwP0bWR46Exo4QOadkKs/tJt
 Trca6jNHh831KPTMCjNmYXZYL4idimptGMIflEIzk3XnF/TrsJ24ouS5Kydsi0hwz4Ys
 UCitFjv3y1wUDuPOzxC3AC9CFaZCHetyhHUZkeK3sXBP0cz6Wu5KI6rkn3vvntqwrNg/
 JMm404SsRHyIxfnn99x25gn1DQkmi/lxLMuOtfIWKqUxvqiGfpxtSpxTNHfSkWKClsV/
 g+34wXiIY0J/8EEtbc5E4HbepLJ782JwZ8OlCsy9gtl3r+1sPUfr9lxkAa+RoLVoVH1A
 ml/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Dc33lvd0X9QS8SjlkLazbkKatAV5j2/wn10u4PoRwo=;
 b=fPrHYIOiOd4X2Cx5xXrZ2pvT8j5WMJUuDM1fJaZxfk4rMcFFIt9+drozbnuRmKb+ic
 q+umQnCQlmhTfoz8jrrqGYAsfZjYfBwFrV+Zc2KxjIiGAnJrs7BRWJsWYf/sirXn+0bm
 AKhEkUhF22rm5uQXtQUNsOBsfGlz1cOZQojH2qF+AcKSfd4izsC8fcmiQ8elT8AXMOsC
 CzpGnfgq76ZKqCgbZEkksoDPlXj0HOL6lHJcxkfKyakq36D5cWU2XRI+ldmnxY7ogMaL
 NAi+1HgcLH/nQgmDI5eBnjcJM9Kk8Y+dOv7rq2evDbMip1mvWGjhU9mxvt/hv1/gkn1J
 TThw==
X-Gm-Message-State: AOAM532MGtvyc0iSKCbf/W1M/CSnieN0NiSVtReMeorcRT+2BsXuCByq
 HATCAnDZgjiRf1Cm8ySPFgQHEacDbJVQGXs2Q3Ni4w==
X-Google-Smtp-Source: ABdhPJx15cmLYdjsu01Utut6u0r7Q4U1riTSSOT1vO8sOG1Ii4VnyAq4CWDvND/WM5+CgGUaB+tgvJ3j1T2Adbdh5pg=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr20147834vsh.30.1636510218492; 
 Tue, 09 Nov 2021 18:10:18 -0800 (PST)
MIME-Version: 1.0
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-5-imp@bsdimp.com>
 <0511aedf-1ecd-666d-034f-55d50306e115@linaro.org>
 <CANCZdfohHLKjstby1t3vA3u=MU2qdt_FXNTSpWyUPbbyd2p5aw@mail.gmail.com>
 <22fa61a3-c8ba-e0fe-36b8-86ba1c90ca84@linaro.org>
In-Reply-To: <22fa61a3-c8ba-e0fe-36b8-86ba1c90ca84@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 9 Nov 2021 19:10:06 -0700
Message-ID: <CANCZdfrD1RSH9t4rPw1A8O1nNRmu0Scffr35B=t6mBe+RBDinA@mail.gmail.com>
Subject: Re: [RFC 4/4] common-user: Allow return codes to be adjusted after
 sytsem call
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000003eb26705d065ba9e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::934;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x934.google.com
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003eb26705d065ba9e
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 9, 2021 at 1:11 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/8/21 7:49 PM, Warner Losh wrote:
> >      >       /* code path for having successfully executed the syscall */
> >      > +     ADJUST_SYSCALL_RETCODE
> >      >       ret
> >      >
> >      >   0:
> >
> >     Not sure about this, really.  Is it really that much cleaner to
> insert this than create
> >     separate 10-line files, with the adjustment included?
> ...
> > The adjustments have all been 3 lines (gmail seems to hate my
> formatting):
> >
> > +#define        ADJUST_SYSCALL_RETCODE \
> > +    jnb 2f;                    \
> > +    neg %rax;                  \
> > +    2:
> >
> > which is significantly easier to maintain than having to monitor these
> files for changes
> > and copying over the changes that happen.
> ...
> > The other alternative I considered was having a #ifdef __FreeBSD__ ..
> #endif in all those
> > files, but I thought that even more intrusive.
>
> Actually, the ifdef sounds surprisingly attractive to me.  Is it ENOCOFFEE?
>
> What I find awkward about ADJUST_SYSCALL_RETCODE is that when you're
> looking at the
> definition, you have no reference to the context, and vice versa.  Not
> that it can't be
> worked out, but it seems like the same amount of code either way, and
> clearer when it's
> together.
>
> We've already split the host cpu apart, which is the major point of
> ifdeffery, so it
> doesn't seem like we'll wind up with a large amount of ifdefs here; we're
> not likely to
> see mynewos-user wanting to share this code any time soon.
>
> I feel sufficiently fuzzy on this to solicit other opinions though.
>

I'm OK with #ifdef. The macro hides the ifdef in a general way... but
there's
always a problem generalizing from one example...

If nobody has a better idea, I'll respin with the #ifdefs in a day or two.
That would also
give good sharing and be a couple of steps down the road towards getting a
series of
signals patches queued up...

Warner

--0000000000003eb26705d065ba9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 9, 2021 at 1:11 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/8/21 7:49 PM, Warner Losh wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for ha=
ving successfully executed the syscall */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0ADJUST_SYSCALL_RETCODE<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Not sure about this, really.=C2=A0 Is it really tha=
t much cleaner to insert this than create<br>
&gt;=C2=A0 =C2=A0 =C2=A0separate 10-line files, with the adjustment include=
d?<br>
...<br>
&gt; The adjustments have all been 3 lines (gmail seems to hate my formatti=
ng):<br>
&gt; <br>
&gt; +#define =C2=A0 =C2=A0 =C2=A0 =C2=A0ADJUST_SYSCALL_RETCODE \<br>
&gt; + =C2=A0 =C2=A0jnb 2f; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; + =C2=A0 =C2=A0neg %rax; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt; + =C2=A0 =C2=A02:<br>
&gt; <br>
&gt; which is significantly easier to maintain than having to monitor these=
 files for changes <br>
&gt; and copying over the changes that happen.<br>
...<br>
&gt; The other alternative I considered was having a #ifdef __FreeBSD__ .. =
#endif in all those <br>
&gt; files, but I thought that even more intrusive.<br>
<br>
Actually, the ifdef sounds surprisingly attractive to me.=C2=A0 Is it ENOCO=
FFEE?<br>
<br>
What I find awkward about ADJUST_SYSCALL_RETCODE is that when you&#39;re lo=
oking at the <br>
definition, you have no reference to the context, and vice versa.=C2=A0 Not=
 that it can&#39;t be <br>
worked out, but it seems like the same amount of code either way, and clear=
er when it&#39;s <br>
together.<br>
<br>
We&#39;ve already split the host cpu apart, which is the major point of ifd=
effery, so it <br>
doesn&#39;t seem like we&#39;ll wind up with a large amount of ifdefs here;=
 we&#39;re not likely to <br>
see mynewos-user wanting to share this code any time soon.<br>
<br>
I feel sufficiently fuzzy on this to solicit other opinions though.<br></bl=
ockquote><div><br></div><div>I&#39;m OK with #ifdef. The macro hides the if=
def in a general way... but there&#39;s</div><div>always a problem generali=
zing from one example...</div><div><br></div><div>If nobody has a better id=
ea, I&#39;ll respin with the #ifdefs in a day or two. That would also</div>=
<div>give good sharing and be a couple of steps down the road towards getti=
ng a series of</div><div>signals patches queued up...<br></div><div><br></d=
iv><div>Warner</div></div></div>

--0000000000003eb26705d065ba9e--

