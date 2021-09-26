Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D9A418A9E
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 21:02:51 +0200 (CEST)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUZQI-0003cN-41
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 15:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUZNu-0002oI-D5
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 15:00:27 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:37832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUZNs-0001iC-KE
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 15:00:22 -0400
Received: by mail-vs1-xe34.google.com with SMTP id q66so15771294vsa.4
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VxhBYPMb+rhmElNtksAqmPj6+mwSbTV1yq9m88cuvyY=;
 b=xY6UB0vIuRPYUMb9Gf8/gR9eVT8101FgT7MnWsWspCOsmGmzv3+Piel7+i0lHTGCvK
 3duVDobkGBv5/EPycromeqThQUsfhuX8vUG85WWR6z86Afs/RPzr6TcwZgzdSBggAE1M
 BcCXSKlpl0kIOuPI70h0DRVlOz3UuwOKv1fAu45k0ViWs5u0r+0do9L88NIm42yVML+V
 cxlR9mosG1eqIyRRLzIbj4kVUSDyXxPXZ6JJ3tCOMaqJ4HEb4bbfhGlYB7XK4Y7crgvf
 Fh8y1iRd3p94tEtYUm2CxIIwQTxiWEIkE0NVKthCBK1qBMkrBAaVPoCgea6V5Idp/btb
 /ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VxhBYPMb+rhmElNtksAqmPj6+mwSbTV1yq9m88cuvyY=;
 b=CvasaxGeMPTc9CQK5jcKThfz2RPFcVpW3i3utYkideF1D7RTiWwPvJTba3UVSoo/JL
 PQPWB3S7VQDNRNeNjQMKiNliBqAEq1tjaovjPuTn78RMTuuzckIh3mpJQdWQMhisO1Ui
 W8QlAFMaV4JcJ3EDJIOld91pfvz06Ijz9wIMz4uA8WDsn/sPkK3elRmozr/7o8YZ85rG
 EF8AYToG1Z1SIE1pttJyeGAiq7Mpj5bv0Eyy4bLW+BdkKZBrlwJT9/iQuOXNvrFuRXaM
 OOSfJFMSVie/wtJ04vvHm/nV3dWinfc0ncg/j44HGKS1eIdSYST/XksqpVesuKxSGeqk
 +G8w==
X-Gm-Message-State: AOAM531ak9sxJQyBuHvkQk1lxFSiPjX4vDyWsArtrfmZg5Gw0Vu4ZCfu
 5TcBLyuDRujc5x7k/hAlNNYonQAdbeLW3ipqdJUfDA==
X-Google-Smtp-Source: ABdhPJwAjYQQuOsfljXMisXBf4C7CIH6JEB8+Hf8f+K0DwGhzDTSNXFMlxWVX+0RIVLjMJZBYnFhATK2B04L60rAuDo=
X-Received: by 2002:a05:6102:cd3:: with SMTP id
 g19mr16524233vst.12.1632682819432; 
 Sun, 26 Sep 2021 12:00:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <1f21d9a3-fe08-22e7-45f9-27dae0c1c6ba@linaro.org>
 <CANCZdfpdy9EFgr-ushGeEnPZFEPD2_sOc4vii+2by9ksbC3YVg@mail.gmail.com>
 <CAAdtpL7bsDbd9GeSqBgJyr6JnBdF9vi01qk9z582Tuwv8-MpBA@mail.gmail.com>
In-Reply-To: <CAAdtpL7bsDbd9GeSqBgJyr6JnBdF9vi01qk9z582Tuwv8-MpBA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 26 Sep 2021 13:00:08 -0600
Message-ID: <CANCZdfpDRVv2WcLyBrVd=YXwEW-cuGMW4QUpx8kkfC9B2xoRHQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000007bc3fa05ccea97b3"
Received-SPF: none client-ip=2607:f8b0:4864:20::e34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe34.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007bc3fa05ccea97b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 26, 2021 at 12:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> On Sun, Sep 26, 2021 at 8:14 PM Warner Losh <imp@bsdimp.com> wrote:
> > On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
> >> On 9/21/21 11:14 PM, Warner Losh wrote:
> >> > Create dummy signal queueing function so we can start to integrate
> other
> >> > architectures (at the cost of signals remaining broken) to tame the
> >> > dependency graph a bit and to bring in signals in a more controlled
> >> > fashion.
> >> >
> >> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> >> > ---
> >> >   bsd-user/qemu.h   | 1 +
> >> >   bsd-user/signal.c | 8 ++++++++
> >> >   2 files changed, 9 insertions(+)
>
> >> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info=
)
> >> > +{
> >> > +    return 1;
> >> > +}
> >>
> >> Both here and in linux-user, there are no error conditions.  We should
> change the return
> >> to void.
> >
> >
> > In this stubbed out version, there's no errors. But bsd-user can return
> -EAGAIN when
> > alloc_sigqueue fails (which it can if there are no free qemu_sigqueue
> structures in
> > the preallocated list0. However, having said that, nothing checks the
> return value
> > so it's as if it is void... So I'll change it to void here...
>
> kinda related:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg836833.html


Not sure how I missed this... too many filters I guess.

I've sent a reply, but the right thing to do is to eliminate *that* wart
too. I'm always
torn between 'oh, linux-user went in a different direction that I like
better' for something
and adopting it and 'oh, more churn in upstreaming, I'll never get done and
how do I make
sure I don't break anything'...

Warner

--0000000000007bc3fa05ccea97b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 26, 2021 at 12:34 PM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Sun, Sep 26, 2021 at 8:14 PM Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt; On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.=
org</a>&gt; wrote:<br>
&gt;&gt; On 9/21/21 11:14 PM, Warner Losh wrote:<br>
&gt;&gt; &gt; Create dummy signal queueing function so we can start to inte=
grate other<br>
&gt;&gt; &gt; architectures (at the cost of signals remaining broken) to ta=
me the<br>
&gt;&gt; &gt; dependency graph a bit and to bring in signals in a more cont=
rolled<br>
&gt;&gt; &gt; fashion.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om" target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0| 1 +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0bsd-user/signal.c | 8 ++++++++<br>
&gt;&gt; &gt;=C2=A0 =C2=A02 files changed, 9 insertions(+)<br>
<br>
&gt;&gt; &gt; +int queue_signal(CPUArchState *env, int sig, target_siginfo_=
t *info)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 return 1;<br>
&gt;&gt; &gt; +}<br>
&gt;&gt;<br>
&gt;&gt; Both here and in linux-user, there are no error conditions.=C2=A0 =
We should change the return<br>
&gt;&gt; to void.<br>
&gt;<br>
&gt;<br>
&gt; In this stubbed out version, there&#39;s no errors. But bsd-user can r=
eturn -EAGAIN when<br>
&gt; alloc_sigqueue fails (which it can if there are no free qemu_sigqueue =
structures in<br>
&gt; the preallocated list0. However, having said that, nothing checks the =
return value<br>
&gt; so it&#39;s as if it is void... So I&#39;ll change it to void here...<=
br>
<br>
kinda related:<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg836833.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg836833.html</a></blockquote><div><br></div><div>Not sure=
 how I missed this... too many filters I guess.</div><div><br></div><div>I&=
#39;ve sent a reply, but the right thing to do is to eliminate *that* wart =
too. I&#39;m always</div><div>torn between &#39;oh, linux-user went in a di=
fferent direction that I like better&#39; for something</div><div>and adopt=
ing it and &#39;oh, more churn in upstreaming, I&#39;ll never get done and =
how do I make</div><div>sure I don&#39;t break anything&#39;...</div><div><=
br></div><div>Warner</div></div></div>

--0000000000007bc3fa05ccea97b3--

