Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD95E37587A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:32:44 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legvb-0004af-OF
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1legYG-0007IN-GF
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:08:36 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:42999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1legYC-0004az-8q
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:08:36 -0400
Received: by mail-qv1-xf30.google.com with SMTP id g17so3308365qvl.9
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8ygmeKuwAJqY/WErT34Q5bBh/N1hC8PImpra/Q1Pm8=;
 b=cFaCNFGCf15Pe4RbH88Sgh8AgKLuP+OCkbw+XClWxK6maz+JtPbAJUjDdwqwFuC+7H
 j0W1VAdIOj+G1s7uFRzzDHMaphcIGuhgoR0SMsbji8sz7XP126ERx2BGkXIIa+zDHlep
 lmKxathEAJxjFxZfj80Cy76GaxFwHLxCN4Bfp0AL/M1or0bHXF/znh2OKKV9pZI2MBvS
 KD8qN/kH390C6MTbrbDG6WvWdD6aqrK3uvQZ0tO/mweOV5wxjBF/kXOYLN9FyoXZ99P+
 qoTZGO1/qMfnvh+M6RFBPdblAicLDeMmLEVdUebjMTn2ftB/QYXQS2yMPSiBiqODtIIb
 7WkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8ygmeKuwAJqY/WErT34Q5bBh/N1hC8PImpra/Q1Pm8=;
 b=AexuPp55idDxNvWYog4qXP9LPRCa5VrrRlmWrpb6TaV/xXlFMF5hHQddK5pnEg9aZD
 F63LpC/RqRZO1J++3IbFWzsS5bPVnY4xJ8vPyz7e3tZ3hycQoJa70oj/TUIxH7ew9AEA
 BvZjlmJVUw6jkrIqZi2TVI39k/HgHVyXcYLV+9gM7soUqpukTbUdwRvVPEG8vaE7yIZi
 tV2ev5G7vp6eYdOIzKrjnm38oczFUW/525motpDKtMNFV9jynEd6s460JEXT3FkXZuBi
 R2aChg9MAfLFFFSAR3JWvJfqqMo1XCaYT/hW6v92jGp5ng6vacIyNYbMycW+OV4wk5Ps
 hQeA==
X-Gm-Message-State: AOAM532IkgbEiTR6dnO1d0K/cwIoGOmuIRi6R6rL94FLOWA+f/pjwQ6T
 QYdyeShk6cxK7N7O9BANMCKpjiJsEdKl4WOfgV4Z7g==
X-Google-Smtp-Source: ABdhPJy1nyntLMwk5HaOaPWWhgCgFZhznEgxKWH7sY3KbN7eFcnxi5kQtHW1gUkqpurncqDz7R13DTrLA0Ys0A6HAkI=
X-Received: by 2002:a05:6214:90d:: with SMTP id
 dj13mr5307366qvb.62.1620317310902; 
 Thu, 06 May 2021 09:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-5-philmd@redhat.com>
 <CANCZdfoJWEbPFvZ0605riUfnpVRAeC6Feem5_ahC7FUfO71-AA@mail.gmail.com>
 <39f12704-af5c-2e4f-d872-a860d9a870d7@redhat.com>
 <CANCZdfqW0XTa18F+JxuSnhpictWxVJUsu87c=yAwMp6YT60FMg@mail.gmail.com>
 <CAFEAcA-V1DWhsFYuh-y5F2_PbO50KFoCm-XPrcMEYN1V2WHDfA@mail.gmail.com>
In-Reply-To: <CAFEAcA-V1DWhsFYuh-y5F2_PbO50KFoCm-XPrcMEYN1V2WHDfA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 6 May 2021 10:08:20 -0600
Message-ID: <CANCZdfoLrGyGM4LNokAF=t7MTQxyv4JhP4qgif9fhkJR5PNibw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] bsd-user/syscall: Replace alloca() by g_new()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000bd769f05c1ab85c7"
Received-SPF: none client-ip=2607:f8b0:4864:20::f30;
 envelope-from=wlosh@bsdimp.com; helo=mail-qv1-xf30.google.com
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
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bd769f05c1ab85c7
Content-Type: text/plain; charset="UTF-8"

On Thu, May 6, 2021 at 9:59 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 6 May 2021 at 15:57, Warner Losh <imp@bsdimp.com> wrote:
> > malloc, on the other hand, involves taking out a number of mutexes
> > and similar things to obtain the memory, which may not necessarily
> > be safe in all the contexts system calls can be called from. System
> > calls are, typically, async safe and can be called from signal handlers.
> > alloca() is async safe, while malloc() is not. So changing the calls
> > from alloca to malloc makes calls to system calls in signal handlers
> > unsafe and potentially introducing buggy behavior as a result.
>
> malloc() should definitely be fine in this context. The syscall
> emulation is called after the cpu_loop() in bsd-user has called
> cpu_exec(). cpu_exec() calls into the JIT, which will malloc
> all over the place if it needs to in the course of JITting things.
>

Gotcha. That's the context I was trying to chase down via other
vectors.


> This code should never be being called from a (host) signal handler.
> In upstream the signal handling code for bsd-user appears to
> be missing entirely. For linux-user when we take a host signal
> we merely arrange for the guest to take a guest signal, we
> don't try to execute guest code directly from the host handler.
>

OK. Then that makes sense to me now. I'll look through the
bsd-user stuff in our branch...


> (There are some pretty hairy races in emulated signal handling:
> we did a big overhaul of the linux-user code in that area a
> while back. If your bsd-user code doesn't have the 'safe_syscall'
> stuff it probably needs it. But that's more about races between
> "guest code wants to execute a syscall" and "incoming signal"
> where we could fail to exit EINTR from an emulated syscall if
> the signal arrives in a bad window.)
>

Those have not yet been moved over entirely. And it was looking
through those patches that gave me a health respect (fear?) of
issues with mixing of host/guest signals...

Warner

--000000000000bd769f05c1ab85c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 6, 2021 at 9:59 AM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Thu, 6 May 2021 at 15:57, Warner Losh &lt;<a href=3D"mailto:imp@bsd=
imp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt; malloc, on the other hand, involves taking out a number of mutexes<br>
&gt; and similar things to obtain the memory, which may not necessarily<br>
&gt; be safe in all the contexts system calls can be called from. System<br=
>
&gt; calls are, typically, async safe and can be called from signal handler=
s.<br>
&gt; alloca() is async safe, while malloc() is not. So changing the calls<b=
r>
&gt; from alloca to malloc makes calls to system calls in signal handlers<b=
r>
&gt; unsafe and potentially introducing buggy behavior as a result.<br>
<br>
malloc() should definitely be fine in this context. The syscall<br>
emulation is called after the cpu_loop() in bsd-user has called<br>
cpu_exec(). cpu_exec() calls into the JIT, which will malloc<br>
all over the place if it needs to in the course of JITting things.<br></blo=
ckquote><div><br></div><div>Gotcha. That&#39;s the context I was trying to =
chase down via other</div><div>vectors.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
This code should never be being called from a (host) signal handler.<br>
In upstream the signal handling code for bsd-user appears to<br>
be missing entirely. For linux-user when we take a host signal<br>
we merely arrange for the guest to take a guest signal, we<br>
don&#39;t try to execute guest code directly from the host handler.<br></bl=
ockquote><div><br></div><div>OK. Then that makes sense to me now. I&#39;ll =
look through the</div><div>bsd-user stuff in our branch...</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
(There are some pretty hairy races in emulated signal handling:<br>
we did a big overhaul of the linux-user code in that area a<br>
while back. If your bsd-user code doesn&#39;t have the &#39;safe_syscall&#3=
9;<br>
stuff it probably needs it. But that&#39;s more about races between<br>
&quot;guest code wants to execute a syscall&quot; and &quot;incoming signal=
&quot;<br>
where we could fail to exit EINTR from an emulated syscall if<br>
the signal arrives in a bad window.)<br></blockquote><div><br></div><div>Th=
ose have not yet been moved over entirely. And it was looking</div><div>thr=
ough those patches that gave me a health respect (fear?) of</div><div>issue=
s with mixing of host/guest signals...</div><div><br></div><div>Warner</div=
><div><br></div></div></div>

--000000000000bd769f05c1ab85c7--

