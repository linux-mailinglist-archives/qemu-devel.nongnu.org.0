Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8C375854
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:19:15 +0200 (CEST)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legiZ-0000xP-0C
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1legZg-0000Tg-FI
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:10:04 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:44619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1legZe-0005Bw-07
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:10:04 -0400
Received: by mail-qt1-x831.google.com with SMTP id y12so4400842qtx.11
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NCd+sbLxL8J5MsAiRpj4Zr+jMkmIwW9j++dtwqp++EY=;
 b=GL7lAfB6rTGJKOZi9HlViVXtzGEuEDzkk8gvpGQiIVWv4oxTDJUTnGa87tahTjbe29
 nKdOJdY4/MDCRl94V5FiFKUjnLHf2N4yPkxKWQDJMBxVLNoCHtcat9MW6aFEW3k0ry1+
 n0d3ws7vLL6+nPTyEkvOm8w4w31Nnm5zJDx5mHVIwYtkydDu2+ty9h7z6i5MMVpXyenI
 uPidLVUANgi+XahamsOmiR5fftj3QakhRGFuCtpniFFoEjmP+plghcotFKAOo4gp1W8M
 k7kiHePlVet1txhFs1pDrQzDbSbQnuGiRRG3HMwHY+kBQ5cRlHgI+QBNH4xjefeRaL1V
 fH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NCd+sbLxL8J5MsAiRpj4Zr+jMkmIwW9j++dtwqp++EY=;
 b=eUB93J9sPdkK9jGnNMwksNK5vOcUlzHhpWFCFRXSOe0OqsVT2g2Aznt+RNpb5sP2fg
 izX2piE2C/AEmYVQYiL0msSojCX3lwyDUnT0Pk9Nnri7bI0RWF6y+2FCU0wax0wOnoo4
 pUu82yPVDWjUqMNtuto1I0Uis4xlPrvoWDc5Mc4FEVWtVaF4ERAekkiKg3cz37mzgsae
 esZZR8kjEO4WRAZoyXv7wTscSRSat4JMIbF4cB3KvuMCFvcEB9UT2I4wNE3m1Wd6qOGT
 kfKdPF1nedlzKEvR2rFSKOiq7WSpFObX3ud57MHc8jicuH6VvMjgWm9epEkfeR5HeDpv
 hclA==
X-Gm-Message-State: AOAM533zHPEcrLl2US3OfL9F1wQxXJuo6Yi6kAHf//NSnZM6Rj5gYFFy
 IdF5m5GecWHlmK8+cZXYfVaFrmDbMAGXPDJd3nCyeA==
X-Google-Smtp-Source: ABdhPJzoBpjYcTPGFGY9cqM0Isa4Jivf1NGg2QrqoVRH/0xXGKPAyON7Nw6XJqmInefyOQhvf1tz0B9rJSmKyl610VU=
X-Received: by 2002:ac8:5547:: with SMTP id o7mr4848674qtr.49.1620317400901;
 Thu, 06 May 2021 09:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
 <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
 <7a96d45e-2bdc-f699-96f7-3fbf607cb06b@redhat.com>
 <CANCZdfrcv9ZUcBv7z+z3JPCjy0uzzY07VLmC4dqr5r8ba_QPLw@mail.gmail.com>
 <adfc5da4-a615-24d7-0c67-f04d4eaec9a6@redhat.com>
 <CAFEAcA98KHKcGam1nukspYOQvPNXyq+hfsNbATpNvmDGoODN1A@mail.gmail.com>
In-Reply-To: <CAFEAcA98KHKcGam1nukspYOQvPNXyq+hfsNbATpNvmDGoODN1A@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 10:09:50 -0600
Message-ID: <CANCZdfoKiNAUpsRsWsWz8Yc22fs24+uQXkoN1yqRpbGFkQwFAw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001abe1705c1ab8b84"
Received-SPF: none client-ip=2607:f8b0:4864:20::831;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x831.google.com
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
Cc: kvm-devel <kvm@vger.kernel.org>, Kyle Evans <kevans@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001abe1705c1ab8b84
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 10:04 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 6 May 2021 at 16:46, Eric Blake <eblake@redhat.com> wrote:
> >
> > On 5/6/21 10:30 AM, Warner Losh wrote:
> >
> > >
> > > But for the real answer, I need to contact the original authors of
> > > this part of the code (they are no longer involved day-to-day in
> > > the bsd-user efforts) to see if this scenario is possible or not. If
> > > it's easy to find out that way, we can either know this is safe to
> > > do, or if effort is needed to make it safe. At present, I've seen
> > > enough and chatted enough with others to be concerned that
> > > the change would break proper emulation.
> >
> > Do we have a feel for the maximum amount of memory being used by the
> > various alloca() replaced in this series?  If so, can we just
> > stack-allocate an array of bytes of the maximum size needed?
>
> In *-user the allocas are generally of the form "guest passed
> us a random number, allocate that many structs/whatevers". (In this
> specific bsd-user example it's the writev syscall and it's "however
> many struct iovecs the guest passed".) So there is no upper limit.
>
> The right thing to do here is probably to use g_try_malloc() and return
> ENOMEM or whatever on failure. The use of alloca, at least in the
> linux-user code, is purely old lazy coding based on "in practice
> real world guest binaries don't allocate very many of these so
> we can get away with shoving them on the stack".
>

I'll convert the ones in our fork to use that pattern prior to
upstreaming.

Warner

--0000000000001abe1705c1ab8b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 10:04 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, 6 May 2021 at 16:46, Eric Blake &lt;<a href=3D"mailto:eblake@=
redhat.com" target=3D"_blank">eblake@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5/6/21 10:30 AM, Warner Losh wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; But for the real answer, I need to contact the original authors o=
f<br>
&gt; &gt; this part of the code (they are no longer involved day-to-day in<=
br>
&gt; &gt; the bsd-user efforts) to see if this scenario is possible or not.=
 If<br>
&gt; &gt; it&#39;s easy to find out that way, we can either know this is sa=
fe to<br>
&gt; &gt; do, or if effort is needed to make it safe. At present, I&#39;ve =
seen<br>
&gt; &gt; enough and chatted enough with others to be concerned that<br>
&gt; &gt; the change would break proper emulation.<br>
&gt;<br>
&gt; Do we have a feel for the maximum amount of memory being used by the<b=
r>
&gt; various alloca() replaced in this series?=C2=A0 If so, can we just<br>
&gt; stack-allocate an array of bytes of the maximum size needed?<br>
<br>
In *-user the allocas are generally of the form &quot;guest passed<br>
us a random number, allocate that many structs/whatevers&quot;. (In this<br=
>
specific bsd-user example it&#39;s the writev syscall and it&#39;s &quot;ho=
wever<br>
many struct iovecs the guest passed&quot;.) So there is no upper limit.<br>
<br>
The right thing to do here is probably to use g_try_malloc() and return<br>
ENOMEM or whatever on failure. The use of alloca, at least in the<br>
linux-user code, is purely old lazy coding based on &quot;in practice<br>
real world guest binaries don&#39;t allocate very many of these so<br>
we can get away with shoving them on the stack&quot;.<br></blockquote><div>=
<br></div><div>I&#39;ll convert the ones in our fork to use that pattern pr=
ior to</div><div>upstreaming.</div><div><br></div><div>Warner=C2=A0</div></=
div></div>

--0000000000001abe1705c1ab8b84--

