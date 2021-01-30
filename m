Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7DC30976E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 18:58:22 +0100 (CET)
Received: from localhost ([::1]:33346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5uVo-0007tU-Ke
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 12:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5uTk-0007Am-TY
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 12:56:12 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5uTi-0003Fi-4X
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 12:56:12 -0500
Received: by mail-ej1-x636.google.com with SMTP id l9so17885396ejx.3
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=modwiz-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=USunrJubF3lHC9N8qi3jxtaV1tEkA7G4FdSjfwYr1bs=;
 b=DI75TN5Wu+XgS/f7FMD2YGcY/eFdb4Xjo2w+oNB6aVfafoWmDk92q4xkoTxSJHP+ty
 s6oOzNEoMYQbtlKeKK94N1WH/zIyDI/J0O93EEhaNi7dvObvZ+6I5aPWoSnm8XUCkQiO
 msbjYqyRos+t1W1aZZxOiq/hN6Z0G9Q631pbiUpTnRJfGrLGSpdIlOtoDVNWLXS6OYxr
 Pbx8FwoNAkIxkQSuqCibxCLVLypCuoKXJnL1RSOmGovRLzmYV97TU6BIbotOM0dR/s0G
 ja05jeug3Q5drwO2WStMm/GJCXn++yIS50J1pW0Z9WQGOD/dn2GzjMk9dM8pW41/UWEq
 8uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USunrJubF3lHC9N8qi3jxtaV1tEkA7G4FdSjfwYr1bs=;
 b=A71UaYcajNVhdWFS7g2+Ccbv88IASdQ3oF+Cvwo5Nr1SGmVeAorS9O6hqI8kbVdMZT
 Fo2Heq+liW7CgCY668IsbGxKvIGmA45pe93LRWwPLte5vJYakUy3W+iNsK+zzvcHBAkz
 Fvp+VbbraiBO7/aihQigDe9H7q015sQ50cHNb1+glzG95kycrFe+GFCv04jX4Z0GG3eU
 zqJKZ2eixO2EnNzjYJWqa7xDyPFThzxKJL/paFwfH0Dg1/u3dSkhJx5u+FjoQgVrkQnA
 eRHwm01doh+qFQQTGrdtf+8s0cdOGL2Z0SwD5CoQA6e4pIIyJeP54zHfND9PJic8KuO9
 3yKg==
X-Gm-Message-State: AOAM533gW78ADt10GZ9j9AnXhneSuudn2lR+5EBZjpR6XptJMmqcG2H4
 dOYGspA2sfxYhZdKGrBV/wEFVw90f+tRNXA7pk6W5Q==
X-Google-Smtp-Source: ABdhPJwpgsj74AGqbASLkZPB8vEtkhh1TEqEkdLQc7asMQm4YwXZX76LpUUkdBKFmhnWUpeoyM7NHxoLmnofIakIK3c=
X-Received: by 2002:a17:907:2da0:: with SMTP id
 gt32mr2594514ejc.78.1612029368607; 
 Sat, 30 Jan 2021 09:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20210129195631.1577922-1-iris@modwiz.com>
 <CAJ+F1C+KgEqoNXP8mD=Ebbk=gZRHYOccYr_pxQs+HwyKcA6R+Q@mail.gmail.com>
 <CAN6Exg2gm935eoHcLvwMLZ3qd7LSXhx8YzYhXNBQG4r80guO_w@mail.gmail.com>
In-Reply-To: <CAN6Exg2gm935eoHcLvwMLZ3qd7LSXhx8YzYhXNBQG4r80guO_w@mail.gmail.com>
From: Iris Johnson <iris@modwiz.com>
Date: Sat, 30 Jan 2021 11:55:57 -0600
Message-ID: <CAN6Exg3N2jnTHLG=KnORUNBMtwjgAc5y7dX62dQGa+8vaU2XrQ@mail.gmail.com>
Subject: Re: [PATCH] chardev/char-io: Fix polling by not removing polls when
 buffers are full
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e23bd705ba21d5a7"
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=iris@modwiz.com; helo=mail-ej1-x636.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e23bd705ba21d5a7
Content-Type: text/plain; charset="UTF-8"

I was working on preparing this test case for the virt machine (I've been
using a test machine based around the exynos UART).

While looking at the uart code for the virt to find which serial peripheral
it uses (and the register layout), I noticed that the pl011
uart code calls qemu_chr_fe_accept_input, in fact it looks like every uart
except the exynos UART that I was using has this call.

Somehow while I was debugging this issue I missed that call. (In fact
adding a call like that was my backup patch to this one),
In light of the discovery I'll send a follow up patch that adds this
functionality into the exynos4210_uart code instead of modifying
the chardev handling itself.

You can safely disregard this patch. Sorry about the confusion.

Iris

On Sat, Jan 30, 2021 at 9:54 AM Iris Johnson <iris@modwiz.com> wrote:

> > I don't think this works well enough: if the source isn't removed, but
>
> > fd_can_read() returns 0, there is a potential busy loop on the next
>> > fd_read().
>>
>
> This shouldn't happen. The sources all get set to non-blocking mode, the
> only
> blocking code is the poll itself. If fd_can_read() returns 0, then the
> next time
> fd_read() is called, it will attempt to read zero bytes. The backend logic
> checks the
> results of the same method that fd_can_read() calls and sets its read size
> to that amount, in the case of a full buffer it will read 0 bytes and
> return.
>
> > My understanding is that if data is read from the frontend, the loop
>> > will be re-entered and io_watch_poll_prepare will set the callback
>> > again.
>>
>
> This just doesn't happen. The issue is that between the poll being added
> (and
> some but not all data being read) and the frontend code getting triggered
> by
> the guest, the IO loop runs again and the poll is removed, it then runs
> again
> with the poll removed (since the poll is removed during setup) and it's now
> just going to block because the input fd in question has been "temporarily
> removed". Except that nothing in the fd set it polls on is now connected to
> the guest clearing the buffer.
>
> Meanwhile the guest reads the data during what can be a potentially
> infinite block (if nothing else sets the timeout, in my case something
> in the uart peripheral sets a 1000ms timeout so I could read a byte
> every second or so in the guest). The guest will now be spinning until
> the poll is re-added, meanwhile the poll is blocking on a timeout or
> another
> fd becoming ready because the buffers are small, the fd in question has
> already been removed from the set by the time the guest has a chance
> to clear the buffer.
>
>
>> > Could you provide a simple use-case or reproducer where we can
>> > evaluate how your patch improves the situation?
>
>
> I can do this, but I don't have anything ready immediately, my test case
> isn't
> ideal for others to reproduce. But I can attach one later today when I
> have that done.
>
> Thanks,
> Iris Johnson
>

--000000000000e23bd705ba21d5a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was working on preparing this test case for the virt mac=
hine (I&#39;ve been using a test machine based around the exynos UART).<div=
><br></div><div>While looking at the uart code for the virt to find which s=
erial peripheral it uses (and the register layout), I noticed that the pl01=
1</div><div>uart code calls=C2=A0qemu_chr_fe_accept_input, in fact it looks=
 like every uart except the exynos UART that I was using has this call.</di=
v><div><br></div><div>Somehow while I was debugging this issue I missed tha=
t call. (In fact adding a call like that was my backup patch to this one),<=
/div><div>In light of the discovery I&#39;ll send a follow up patch that ad=
ds this functionality into the exynos4210_uart code instead of modifying</d=
iv><div>the chardev handling itself.</div><div><br></div><div>You can safel=
y disregard this patch. Sorry about the confusion.</div><div><br></div><div=
>Iris</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sat, Jan 30, 2021 at 9:54 AM Iris Johnson &lt;<a href=3D"mail=
to:iris@modwiz.com">iris@modwiz.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; I don&#39;t thin=
k this works well enough: if the source isn&#39;t removed, but</blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">&gt; fd_can_read() return=
s 0, there is a potential busy loop on the next<br>&gt; fd_read().<br></blo=
ckquote><div>=C2=A0</div><div>This shouldn&#39;t happen. The sources all ge=
t set to non-blocking mode, the only=C2=A0</div><div>blocking code is the p=
oll itself. If fd_can_read() returns 0, then the next time</div><div>fd_rea=
d() is called, it will attempt to read zero bytes. The backend=C2=A0logic c=
hecks the</div><div>results of the same method that fd_can_read() calls and=
 sets its read size</div><div>to that amount, in the case of a full buffer =
it will read 0 bytes and return.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">&gt; My understanding is that if data is read f=
rom the frontend, the loop<br>&gt; will be re-entered and io_watch_poll_pre=
pare will set the callback<br>&gt; again.<br></blockquote><div><br></div><d=
iv>This just doesn&#39;t happen. The issue is that between the poll being a=
dded (and</div><div>some but not all data being read) and the frontend code=
 getting triggered by</div><div>the guest, the IO loop runs again and the p=
oll is removed, it then runs again</div><div>with the poll removed (since t=
he poll is removed during setup) and it&#39;s now</div><div>just going to b=
lock because the input fd in question has been &quot;temporarily</div><div>=
removed&quot;. Except that nothing in the fd set it polls on is now connect=
ed to</div><div>the guest clearing the buffer.</div><div><br></div><div>Mea=
nwhile the guest reads the data during what can be a potentially=C2=A0=C2=
=A0</div><div>infinite block (if nothing else sets the timeout, in my case =
something</div><div>in the uart peripheral sets a 1000ms timeout so I could=
 read a byte</div><div>every second or so in the guest). The guest will now=
 be spinning until</div><div>the poll is re-added, meanwhile the poll is bl=
ocking on a timeout or another</div><div>fd becoming ready because the buff=
ers are small, the fd in question has</div><div>already been removed from t=
he set by the time the guest has a chance</div><div>to clear the buffer.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; =
Could you provide a simple use-case or reproducer where we can<br>&gt; eval=
uate how your patch improves the situation?</blockquote><div>=C2=A0</div><d=
iv>I can do this, but I don&#39;t have anything ready immediately, my test =
case isn&#39;t</div><div>ideal for others to reproduce. But I can attach on=
e later today when I have that done.</div><div><br></div><div>Thanks,</div>=
<div>Iris Johnson</div></div></div>
</blockquote></div>

--000000000000e23bd705ba21d5a7--

