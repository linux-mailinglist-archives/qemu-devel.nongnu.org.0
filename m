Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417E2326DC8
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 17:16:32 +0100 (CET)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG2Gc-0002Uw-Ky
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 11:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lG2EL-0001cP-JQ
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 11:14:09 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akalita@cs.stonybrook.edu>)
 id 1lG2DY-00038D-Cg
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 11:14:09 -0500
Received: by mail-ot1-x335.google.com with SMTP id 105so12171779otd.3
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 08:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stonybrook.edu; s=sbu-gmail;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=econRSnBiWt5OTEBzrNe5J8a7B37VAq1zf5GwG6W33I=;
 b=QZeD+LDtC8ABotdPQ5XiglzFtjbG4SF0TFCWh+xkmiFnLg5sG2KjISVt8SpsN8HrUG
 ctyC2dwuufga/tL8Xeaa7STCnTzIiPq/6g90fthHBxjs9tuhYFXS9y06BCEPO8FqI+R6
 Nr3NSr3WAjSm5toT/9rssVuMIW4VVKgTucpkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=econRSnBiWt5OTEBzrNe5J8a7B37VAq1zf5GwG6W33I=;
 b=RFLPwnSyyjhSpbzImlLeIafHm+lXtTyb/B9ALLUqk6mxD2yQjFR/Z1z6kTkvqR/eXh
 qgruzha2SWNfd3QTqKgOIDSK0Ym9EDwHQFmpZ1/Aw/r4GFaYLPOR8FIRjz56veL8ooID
 b6Wcw2I+iH2vwqITc4h+EI2BX2vzXrB57SoKytHXb7wQtzpO+rFvXSTYXEHcOm+iP8Ke
 +Fzize6SxGwgGSrAJKE/73IomX9O+unyAQg1MEjl/H7mEbaq/f6q7NSrYW+nFFcspw0r
 Zd3iIufDkYOIwo8ApjXRXqyWxBh6s5RdNpqlOEBV4UPycXtSNlRkcCWZZDH7JW5TcHCb
 Jeog==
X-Gm-Message-State: AOAM5316qejA6mdn/40+me0dHSqvY5o0FIYGfHEznt3CTRDYs16YhCbd
 YFZ3rYIWLsDneqHacPn3F+S0tqZRFK2HvqlDJzi/xg==
X-Google-Smtp-Source: ABdhPJxwNpaSkYHKM5zy1W/6s/7y22HlwVgSzxjUn/i+g3Rsofo+BWA3rVGamDMKhwIqXA3TNBrNm8vov5MImUk6v38=
X-Received: by 2002:a05:6830:1d41:: with SMTP id
 p1mr6667850oth.126.1614442396057; 
 Sat, 27 Feb 2021 08:13:16 -0800 (PST)
MIME-Version: 1.0
References: <CAJGDS+F0Mtv+XFXeR4wOP35UjmfKt+fiMAfraT7mg9J-4t+SiA@mail.gmail.com>
 <e4677d3d-b221-3bba-185c-5a43faf6aab7@redhat.com>
 <ffdcad8a-389a-ed22-0991-940ddeb3c8ed@ispras.ru>
In-Reply-To: <ffdcad8a-389a-ed22-0991-940ddeb3c8ed@ispras.ru>
From: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>
Date: Sat, 27 Feb 2021 21:43:03 +0530
Message-ID: <CAJGDS+Gu=Lf8Jscu95SQu5BhAWDM0mk072H77094E89u5JmK4g@mail.gmail.com>
Subject: Re: QEMU Clock record and replay
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Content-Type: multipart/alternative; boundary="00000000000087155405bc53a93e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=akalita@cs.stonybrook.edu; helo=mail-ot1-x335.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000087155405bc53a93e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Pavel.

You answered all of my questions. The clock record-replay functionality is
much clearer now.

Best Regards,
Arnab

On Fri, Feb 26, 2021 at 11:54 AM Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru=
>
wrote:

> On 25.02.2021 18:43, Philippe Mathieu-Daud=C3=A9 wrote:
> > Cc'ing Pavel/Alex.
> >
> > On 2/25/21 4:09 PM, Arnabjyoti Kalita wrote:
> >> Hello all,
> >>
> >> I am trying to understand how the clock values are recorded and replay=
ed
> >> in QEMU (when it runs in TCG mode). I have been specifically following
> >> the document that has been provided here -
> >> https://github.com/qemu/qemu/blob/master/docs/replay.txt
> >> <https://github.com/qemu/qemu/blob/master/docs/replay.txt>
> >>
> >> I have the following 4 questions to ask-
> >>
> >> - Why are clock values being replayed off a cache and not directly off
> >> the file as seen here -
> >> https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45?
> >> <https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45
> ?>?
>
> The cache was needed when replay does not follow the record behavior.
> E.g., included additional deadline calculations or timer checks.
> I'm not sure, that it is still needed, and I'll check it during future
> refactoring session.
>
> >> - I have a requirement to record and replay host clock values. Can it =
so
> >> happen that if incorrect values of the host clock are replayed, then t=
he
> >> timers in the guest start expiring incorrectly, during replay?
>
> This is a bug, when the host clock is replayed incorrectly.
>
> >> - Let's say we record the clock values when the guest starts in KVM
> >> mode, and we replay the clock values when the guest starts in TCG mode=
.
> >> Does the record-replay functionality change a lot?
>
> Only if you want to replay just the clock.
> But replaying whole execution includes instruction counting and thread
> synchronization.
>
> >> - Also, I couldn't understand the specific purpose of replaying the
> >> 'virtual real time clock' ? Do I still need to record and replay the
> >> 'virtual real time clock' if we record the clock values in KVM mode, a=
nd
> >> replay the clock values in TCG mode?
>
> This clock is used for icount-related timers. For now icount is required
> for record replay. If you want to replay only host clock, you don't need
> this one.
>
> Pavel Dovgalyuk
>

--00000000000087155405bc53a93e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Thank you Pavel.<br><br></div>You answered =
all of my questions. The clock record-replay functionality is much clearer =
now.<br><br></div>Best Regards,<br></div>Arnab<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 26, 2021 at 1=
1:54 AM Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru">pa=
vel.dovgalyuk@ispras.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 25.02.2021 18:43, Philippe Mathieu-Daud=C3=A9 wro=
te:<br>
&gt; Cc&#39;ing Pavel/Alex.<br>
&gt; <br>
&gt; On 2/25/21 4:09 PM, Arnabjyoti Kalita wrote:<br>
&gt;&gt; Hello all,<br>
&gt;&gt;<br>
&gt;&gt; I am trying to understand how the clock values are recorded and re=
played<br>
&gt;&gt; in QEMU (when it runs in TCG mode). I have been specifically follo=
wing<br>
&gt;&gt; the document that has been provided here -<br>
&gt;&gt; <a href=3D"https://github.com/qemu/qemu/blob/master/docs/replay.tx=
t" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu/blob/m=
aster/docs/replay.txt</a><br>
&gt;&gt; &lt;<a href=3D"https://github.com/qemu/qemu/blob/master/docs/repla=
y.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu/bl=
ob/master/docs/replay.txt</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; I have the following 4 questions to ask-<br>
&gt;&gt;<br>
&gt;&gt; - Why are clock values being replayed off a cache and not directly=
 off<br>
&gt;&gt; the file as seen here -<br>
&gt;&gt; <a href=3D"https://github.com/qemu/qemu/blob/stable-5.0/replay/rep=
lay-time.c#L45" rel=3D"noreferrer" target=3D"_blank">https://github.com/qem=
u/qemu/blob/stable-5.0/replay/replay-time.c#L45</a>?<br>
&gt;&gt; &lt;<a href=3D"https://github.com/qemu/qemu/blob/stable-5.0/replay=
/replay-time.c#L45" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45</a>?&gt;?<br>
<br>
The cache was needed when replay does not follow the record behavior.<br>
E.g., included additional deadline calculations or timer checks.<br>
I&#39;m not sure, that it is still needed, and I&#39;ll check it during fut=
ure<br>
refactoring session.<br>
<br>
&gt;&gt; - I have a requirement to record and replay host clock values. Can=
 it so<br>
&gt;&gt; happen that if incorrect values of the host clock are replayed, th=
en the<br>
&gt;&gt; timers in the guest start expiring incorrectly, during replay?<br>
<br>
This is a bug, when the host clock is replayed incorrectly.<br>
<br>
&gt;&gt; - Let&#39;s say we record the clock values when the guest starts i=
n KVM<br>
&gt;&gt; mode, and we replay the clock values when the guest starts in TCG =
mode.<br>
&gt;&gt; Does the record-replay functionality change a lot?<br>
<br>
Only if you want to replay just the clock.<br>
But replaying whole execution includes instruction counting and thread <br>
synchronization.<br>
<br>
&gt;&gt; - Also, I couldn&#39;t understand the specific purpose of replayin=
g the<br>
&gt;&gt; &#39;virtual real time clock&#39; ? Do I still need to record and =
replay the<br>
&gt;&gt; &#39;virtual real time clock&#39; if we record the clock values in=
 KVM mode, and<br>
&gt;&gt; replay the clock values in TCG mode?<br>
<br>
This clock is used for icount-related timers. For now icount is required<br=
>
for record replay. If you want to replay only host clock, you don&#39;t nee=
d <br>
this one.<br>
<br>
Pavel Dovgalyuk<br>
</blockquote></div>

--00000000000087155405bc53a93e--

