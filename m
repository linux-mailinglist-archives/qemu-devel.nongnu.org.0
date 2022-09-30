Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717075F0CC8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 15:52:07 +0200 (CEST)
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGQw-0003pQ-HX
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 09:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oeGKf-0004Ua-Nn
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:45:40 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:37654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oeGKd-0008VW-NW
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:45:37 -0400
Received: by mail-lf1-x12f.google.com with SMTP id k10so6962266lfm.4
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=WXDP4sj33TPU6Pt7LSo9YH4LquEuVtB4BXiG3T21z/A=;
 b=VjyjbQdCRS7YiJXQUBfGD6HE6f3tOY+hWd39Mp3/cwN7B5lIkWHv1Bym2Fgt1FHsEK
 ODV7MI6esxBDjdOom8iEV5gzS4JjUTgqllS42z7hffgg95ncjadeTi6JwNwLG6xoVr+C
 vF1nhWFKD3rms2NviK0BoADT5Ozwy/LvQBm6oPIDU1CaqYOHSHcYB6tI7Lh21kUIG7l6
 p37flJcMgkUeGD4Gyd4QxHZFRlM7HdlPBXY5XKIPzdAzGVzYNCPmD4MOrnVDnJydoMf5
 Mie+q5ARGqQ7/Zh39slxOQZjkENg+esk7KvnuNPFo5tEwf27Xm6cMhym/zaPXoK1Cwdn
 9U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WXDP4sj33TPU6Pt7LSo9YH4LquEuVtB4BXiG3T21z/A=;
 b=ddOMmyZj+aURwTbCxxnxzu6dhoLctI2Bfvrp+jNuHXYIC7aDUa09iEKSyRZqyTCkal
 Uuzv6wf4VPEx21gPQwc+dyidZE52V67ApP/JeLFUGSjdxhAAVzqCG5DxwoCSiYP4nJ3G
 BV3VnN4SBG3UNQKu0dNHP51UhjCBrsRyrlVvYnVGjqm5PltDZ2y7CfZZMcs9f/Fx28b3
 0EeQgE4XcFxDQp25AQRxMg7wYX5XWzIyRb5ZM4zqhHOx6lfvcsU4aJ1/DKclOqYpfDmz
 wbsFqFqrlEu9hOxjxd2/rNs8TPtmPabaNkCBt+ONmzEgYFWFcggcSRbSUbmdvXRob2Az
 TKWA==
X-Gm-Message-State: ACrzQf2Zvjb2aKLg5QAS2pgQ1CEqsS/m0ntnXjgd1RcH2Xq7XVdx26ZW
 lNNUP7XDA/FJMaP85WopNjr/bGfDReiKRUBi3BA=
X-Google-Smtp-Source: AMsMyM4GQr4S4gT/dU098KMbSEKpu69AcgHiDQtnNLNdhe8JlOlVyM4NwsM3EvLHVYtya42IUJmQXVNr0He6QNw0EQA=
X-Received: by 2002:a05:6512:3ca0:b0:49f:f620:b826 with SMTP id
 h32-20020a0565123ca000b0049ff620b826mr3731323lfv.375.1664545533664; Fri, 30
 Sep 2022 06:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220929134150.1377690-1-marcandre.lureau@redhat.com>
 <5d7e7c01-7739-9a04-9a4a-becb3c550885@linaro.org>
 <CAJ+F1CLNzwTOB2-wxbnJw9VaCVBFUkgC5c-nYaczL14RLVwaCg@mail.gmail.com>
 <2a7907c0-752a-e262-7088-83958ede1916@linaro.org>
In-Reply-To: <2a7907c0-752a-e262-7088-83958ede1916@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Sep 2022 17:45:21 +0400
Message-ID: <CAJ+F1CLDCNm_Wv6POaAexzd=2Bsebt-2y6RMEX_3+j5mJDAmUA@mail.gmail.com>
Subject: Re: [PATCH] win32: set threads name
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="0000000000003f236205e9e53503"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003f236205e9e53503
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 30, 2022 at 5:35 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/30/22 01:08, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, Sep 29, 2022 at 9:53 PM Richard Henderson <
> richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> wrote:
> >
> >     On 9/29/22 06:41, marcandre.lureau@redhat.com <mailto:
> marcandre.lureau@redhat.com> wrote:
> >      >   void qemu_thread_naming(bool enable)
> >      >   {
> >      >       /* But note we don't actually name them on Windows yet */
> >      >       name_threads =3D enable;
> >      >
> >      > -    fprintf(stderr, "qemu: thread naming not supported on this
> host\n");
> >      > +    if (enable && !load_set_thread_description()) {
> >      > +        fprintf(stderr, "qemu: thread naming not supported on
> this host\n");
> >      > +    }
> >      >   }
> >
> >     Comment is out of date, and I think it would be better to *not* set
> name_threads if not
> >     supported, rather than...
> >
> >
> > Comment removed.
> >
> >
> >
> >      > +static bool
> >      > +set_thread_description(HANDLE h, const char *name)
> >      > +{
> >      > +  HRESULT hr;
> >      > +  g_autofree wchar_t *namew =3D NULL;
> >      > +
> >      > +  if (!load_set_thread_description() || !name) {
> >      > +      return false;
> >      > +  }
> >
> >     ... have to re-query load_set_thread_description later.
> >
> >
> > The load_set_thread_description() function is actually a "one-time"
> function, it doesn't
> > re-load.
>
> You're calling it again.  That has some cost in the mutex/spinlock that's
> behind that
> one-time operation, when you're already making the call to
> set_thread_description conditional.
>

That seems pretty marginal given the frequencies of this call, when we are
creating threads.

So you suggest simply setting "name_threads" to false when loading the
function failed?


>
> > Right, maybe it should warn if it failed to set the name?
>
> After you've already printed an error in qemu_thread_naming()?  Doesn't
> seem useful.  Or
> did you mean in the case we think it should work, but didn't?
>

During qemu_thread_create(), if set_thread_description() failed.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000003f236205e9e53503
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 30, 2022 at 5:35 PM Ric=
hard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.=
henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 9/30/22 01:08, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Thu, Sep 29, 2022 at 9:53 PM Richard Henderson &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.=
org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_=
blank">richard.henderson@linaro.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 9/29/22 06:41, <a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> &lt;mailto:=
<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.=
lureau@redhat.com</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0void qemu_thread_naming(bool enab=
le)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* But note we don&=
#39;t actually name them on Windows yet */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0name_threads =3D en=
able;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 fprintf(stderr, &quot;qemu: th=
read naming not supported on this host\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 if (enable &amp;&amp; !load_se=
t_thread_description()) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, =
&quot;qemu: thread naming not supported on this host\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Comment is out of date, and I think it would be bet=
ter to *not* set name_threads if not<br>
&gt;=C2=A0 =C2=A0 =C2=A0supported, rather than...<br>
&gt; <br>
&gt; <br>
&gt; Comment removed.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +static bool<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +set_thread_description(HANDLE h, const char =
*name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 HRESULT hr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 g_autofree wchar_t *namew =3D NULL;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 if (!load_set_thread_description() ||=
 !name) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0... have to re-query load_set_thread_description la=
ter.<br>
&gt; <br>
&gt; <br>
&gt; The load_set_thread_description() function is actually a &quot;one-tim=
e&quot; function, it doesn&#39;t <br>
&gt; re-load.<br>
<br>
You&#39;re calling it again.=C2=A0 That has some cost in the mutex/spinlock=
 that&#39;s behind that <br>
one-time operation, when you&#39;re already making the call to set_thread_d=
escription conditional.<br></blockquote><div><br></div><div>That seems pret=
ty marginal given the frequencies of this call, when we are creating thread=
s.<br></div><div><br></div><div>So you suggest simply setting &quot;name_th=
reads&quot; to false when loading the function failed?<br></div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Right, maybe it should warn if it failed to set the name?<br>
<br>
After you&#39;ve already printed an error in qemu_thread_naming()?=C2=A0 Do=
esn&#39;t seem useful.=C2=A0 Or <br>
did you mean in the case we think it should work, but didn&#39;t?<br></bloc=
kquote><div><br></div><div>During qemu_thread_create(), if set_thread_descr=
iption() failed.<br></div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000003f236205e9e53503--

