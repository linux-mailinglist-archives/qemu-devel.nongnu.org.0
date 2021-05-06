Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF1375631
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:06:08 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefZn-0004zN-2j
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefWl-0003c3-Tr
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:02:59 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:43679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lefWi-0007zq-Oq
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:02:59 -0400
Received: by mail-qk1-x72d.google.com with SMTP id a22so4618609qkl.10
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MabAK/g5cNmzXRETy3iDaApe00pbCdj4KZbN8L2M0u4=;
 b=RVBa/ODySJagWuX0iXnRDS3Frmi4+iSDYoJU+4VY+lkI2jiGAIr6T7dvUpnlLU8ETU
 DsN2sYMqvUxazR2R5E4RYxUcNM8B4P82Fj2rxLDgu0nbvijiL9MdKe05UAXjw6Wa3mK6
 eEhe/uEZZuNXasK+C7CmQoD/9ji22em2kHfongFTtc5Rg0yASAnagX+Scot1TxaMu2kG
 o4zR6gugu6lBDE58pmAlX3pGTN4w1ZwdP7rKcvm4YPgOSqU5tjGqVyjM57Qhk/9FWxNd
 SLAE0HSCQDN6PT1bWGUPx1vRxE8sFV05IMYcHibhLc55EIiiFvUljIxosOe58KTaHpep
 UpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MabAK/g5cNmzXRETy3iDaApe00pbCdj4KZbN8L2M0u4=;
 b=sNtHjijbPR++bLi/mt7yCTTos0M6HD0SOXB3nf7dMjMR/oEj368LZ1mNCwdzeqQvH9
 l6CH8QBqXJphX0pt63ap1LEYXm/4dd9OGxwzkxA7O4ZSm7nsU5HeN3D/cvKMFanJ6GRh
 bKfJdoPCkIFTgoTGyd+ReawhpSl8zbFB1jzn/7LxobvQlYQN2U1P6XJ0a6UFWandAP4B
 ID1jeMR5KB1KgFVrC/cs4Fpd7+mi7kymXSAL617rjU3g9UVLzEpXf/wmFymd0lZ8XZP9
 r0C2S6LPH0dbMQbVj3oWqBD8xC37qJUpGCasFBTFPYsPkMnN6sNm7Gq1cj9zmS6j6fe0
 gKRg==
X-Gm-Message-State: AOAM533TMCGOWAMIXWokUVuwEdorN/mz1XNCtxvxrsR5fvxM7LXlNBBh
 wDf5t6MBcC9s6w9Hohbc5dg/3CEskhK1BLYUdnRK8A==
X-Google-Smtp-Source: ABdhPJyq8Xf9IQT/m6wGxmV64FmuX9THavvxcdNC45y4FY5uRbj+gKx3J16lZhCaMT3LmPgxG921QmmdALrcP2uftb4=
X-Received: by 2002:a37:c444:: with SMTP id h4mr2147609qkm.206.1620313375405; 
 Thu, 06 May 2021 08:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <CANCZdfqiHxQoG+g3bq_KL01yWCHUbF5qxJWN=sD37h7UJFMZ7g@mail.gmail.com>
 <476d8b44-cba3-4bf2-d93c-d35736d316c6@redhat.com>
In-Reply-To: <476d8b44-cba3-4bf2-d93c-d35736d316c6@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 09:02:44 -0600
Message-ID: <CANCZdfpix=43UEXh2ojvtcHEKpNmciCgtjHvDYSkxnOUwqbYuA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] misc: Replace alloca() by g_malloc()
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002a962b05c1aa9b29"
Received-SPF: none client-ip=2607:f8b0:4864:20::72d;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x72d.google.com
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
Cc: kvm-devel <kvm@vger.kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002a962b05c1aa9b29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 6, 2021 at 8:28 AM Eric Blake <eblake@redhat.com> wrote:

> On 5/6/21 9:22 AM, Warner Losh wrote:
> > On Thu, May 6, 2021 at 7:39 AM Philippe Mathieu-Daud=C3=A9 <philmd@redh=
at.com
> >
> > wrote:
> >
> >> The ALLOCA(3) man-page mentions its "use is discouraged".
> >> Replace few calls by equivalent GLib malloc().
> >>
> >
> > Except g_alloc and g_malloc are not at all the same, and you can't drop
> in
> > replace one with the other.
> >
> > g_alloc allocates stack space on the calling frame that's automatically
> > freed when the function returns.
> > g_malloc allocates space from the heap, and calls to it must be matched
> > with calls to g_free().
> >
> > These patches don't do the latter, as far as I can tell, and so introdu=
ce
> > memory leaks unless there's something I've missed.
>
> You missed the g_autofree, whose job is to call g_free() on all points
> in the control flow where the malloc()d memory goes out of scope
> (equivalent in expressive power to alloca()d memory going out of scope).
>  Although the code is arguably a bit slower (as heap manipulations are
> not as cheap as stack manipulations), in the long run that speed penalty
> is worth the safety factor (since stack manipulations under user control
> are inherently unsafe).
>

Yea, I had missed that. Too many years of reviewing patches that
came in for other projects that didn't use that feature. Outside of the
bsd-user context, I'd agree with you that things are safer this way.
But emulating system calls has other considerations, that I've gone
into in another thread.

So please accept my apology for not noticing the g_autofree
in these. It definitely makes what I said here incorrect and
it should be ignored...

Warner

--0000000000002a962b05c1aa9b29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 8:28 AM Eric B=
lake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/6/21 9:=
22 AM, Warner Losh wrote:<br>
&gt; On Thu, May 6, 2021 at 7:39 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<b=
r>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; The ALLOCA(3) man-page mentions its &quot;use is discouraged&quot;=
.<br>
&gt;&gt; Replace few calls by equivalent GLib malloc().<br>
&gt;&gt;<br>
&gt; <br>
&gt; Except g_alloc and g_malloc are not at all the same, and you can&#39;t=
 drop in<br>
&gt; replace one with the other.<br>
&gt; <br>
&gt; g_alloc allocates stack space on the calling frame that&#39;s automati=
cally<br>
&gt; freed when the function returns.<br>
&gt; g_malloc allocates space from the heap, and calls to it must be matche=
d<br>
&gt; with calls to g_free().<br>
&gt; <br>
&gt; These patches don&#39;t do the latter, as far as I can tell, and so in=
troduce<br>
&gt; memory leaks unless there&#39;s something I&#39;ve missed.<br>
<br>
You missed the g_autofree, whose job is to call g_free() on all points<br>
in the control flow where the malloc()d memory goes out of scope<br>
(equivalent in expressive power to alloca()d memory going out of scope).<br=
>
=C2=A0Although the code is arguably a bit slower (as heap manipulations are=
<br>
not as cheap as stack manipulations), in the long run that speed penalty<br=
>
is worth the safety factor (since stack manipulations under user control<br=
>
are inherently unsafe).<br></blockquote><div><br></div><div>Yea, I had miss=
ed that. Too many years of reviewing patches that</div><div>came in for oth=
er projects that didn&#39;t use that feature. Outside of the</div><div>bsd-=
user context, I&#39;d agree with you that things are safer this way.</div><=
div>But emulating system calls has other considerations, that I&#39;ve gone=
</div><div>into in another thread.</div><div><br></div><div>So please accep=
t my apology for not noticing the g_autofree</div><div>in these. It definit=
ely=C2=A0makes what I said here incorrect and</div><div>it should be ignore=
d...</div><div><br></div><div>Warner</div></div></div>

--0000000000002a962b05c1aa9b29--

