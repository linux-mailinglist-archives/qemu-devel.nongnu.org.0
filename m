Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DBD581D00
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 03:18:40 +0200 (CEST)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGVh9-0004yS-9m
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 21:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oGSoC-0001WI-KE
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 18:13:44 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jon.alduan@gmail.com>)
 id 1oGSoA-0004yH-Ht
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 18:13:44 -0400
Received: by mail-ed1-x533.google.com with SMTP id i13so10156127edj.11
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 15:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wvWiRtyhM97Z+ojhY8xJlfLnWGNRI3ROU07f01abgIQ=;
 b=UQ2HpJzl9CTCZ52lcfDQUrkHb+9zn8fKzU6L7U+h2gFZYddyHS11yOhvB3ounvpO4Y
 ShlEZGsXifjuMckhcnc7DxTImlv2Z5YoYmL626tavx5pLcEaPmcnNy3i9Yjaw/dGrhwC
 iADaiZ1Z3aBvPVgOJGNkzs3oYtyPxPo0VSNnUHOhRn/rp9UpqWHgk8Ic5TRhaGOeWLou
 hCiBWOV7SbjUkODjl/ikvTNutGyKyIGrf5DanBbO7++P37T3O+hS2VekIyM0wa7lfFsH
 Xcd1OCJLVfvffeXLWDWqipmyT9eUCxvD/yL1dXPpMhkS1ZENl+6wEpt8igkmiliPlLoY
 2mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvWiRtyhM97Z+ojhY8xJlfLnWGNRI3ROU07f01abgIQ=;
 b=khWDFZren80Up6CyRADhWdgLLCCkO57CF6QE1JkQgggwQqyBPC1turviQlGzYpqdyX
 BBIJ9XR4mkWvgh+UEdfRAm1rVWlhUNnmULG0JBMA5J6U6DqR7bwIrK1nq28EN9cxZiCR
 qB1fU9asXSr8NbYh2UeZvl19z231LJqbbzkPwSMpz3e3zz+zKy1wxvhtGt83ecImeAas
 z3fYsSx49L83Eg2b9XghxLHCn6WeUCxFywq+J4EQVEd+uJy+iU4Vzi4/mc1mFiOzTMU8
 tB0WdaDv42NvAJpDvkXg9qnr9vd2SNiwv23S+TAJqoZFs+t7HpvWsvmiQjb31+9xdBfy
 rt0g==
X-Gm-Message-State: AJIora/MdSWNunDlPhTfF99gSkkXfjhxA1P9+g/qE3Jhwny4HonFUldP
 NO6p2jY2+a0O3np1x+OCsIepuiNuD6Y+t0ZHveQ=
X-Google-Smtp-Source: AGRyM1shUV22TOmeiNX+h0aENqXbEHqfttbrRSF8W3BVQ4tM681ZrfetubhI2mPyqwTuVlthvCSW2j3q7jIbrCc64fg=
X-Received: by 2002:a05:6402:249b:b0:43c:8ce6:8890 with SMTP id
 q27-20020a056402249b00b0043c8ce68890mr2820440eda.74.1658873619065; Tue, 26
 Jul 2022 15:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
 <Yt561CDN+UjmaDK3@redhat.com>
 <CAFEAcA8d5J-WBp6Z=ECiUtP8wCfjv_XZo5GfYAr+x+mH3GpQww@mail.gmail.com>
In-Reply-To: <CAFEAcA8d5J-WBp6Z=ECiUtP8wCfjv_XZo5GfYAr+x+mH3GpQww@mail.gmail.com>
From: Jon Alduan <jon.alduan@gmail.com>
Date: Wed, 27 Jul 2022 00:13:27 +0200
Message-ID: <CAL7npF_fpy2NzBqRZzEYyHQpNfEXgd7OedJDZX4pN48eUF76Pw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000caafa405e4bc9cb4"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jon.alduan@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Jul 2022 21:16:46 -0400
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

--000000000000caafa405e4bc9cb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

I can say so far, your patch solved the issue! Great thanks for that!

Regarding the libc version:
From my WSL2 Ubuntu 21.04 x86_64:
$ ls -l /lib32/libc*
-rwxr-xr-x 1 root root 2042632 Mar 31  2021 /lib32/libc-2.33.so

My gcc version 10 does use the same libc version.
As already mentioned, I can also reproduce this on a VM with Ubuntu 20.04
and libc-2.31.
In addition, originally, this issue was first reproduced with an own
buildroot RootFS and containing libc-2.28.

As you see, the libcs are not that old. What about the virtual environment?
I could not check this hypothesis, but I hope to do so soon.

Thank you again and best regards
Jon

El lun, 25 jul 2022 a las 14:45, Peter Maydell (<peter.maydell@linaro.org>)
escribi=C3=B3:

> On Mon, 25 Jul 2022 at 12:13, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
> wrote:
> >
> > On Mon, Jul 25, 2022 at 12:00:35PM +0100, Peter Maydell wrote:
> > > For handling guest POSIX timers, we currently use an array
> > > g_posix_timers[], whose entries are a host timer_t value, or 0 for
> > > "this slot is unused".  When the guest calls the timer_create syscall
> > > we look through the array for a slot containing 0, and use that for
> > > the new timer.
> > >
> > > This scheme assumes that host timer_t values can never be zero.  This
> > > is unfortunately not a valid assumption -- for some host libc
> > > versions, timer_t values are simply indexes starting at 0.  When
> > > using this kind of host libc, the effect is that the first and second
> > > timers end up sharing a slot, and so when the guest tries to operate
> > > on the first timer it changes the second timer instead.
> >
> > For sake of historical record, could you mention here which specific
> > libc impl / version highlights the problem.
>
> Jon, which host libc are you seeing this with?
>
> thanks
> -- PMM
>


--=20
j.A

--000000000000caafa405e4bc9cb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Peter,</div><div><br></div><div>I can say so fa=
r, your patch solved the issue! Great thanks for that!</div><div><br></div>=
<div>Regarding the libc version:</div><div>From my WSL2 Ubuntu 21.04 x86_64=
:</div><div></div><div>$ ls -l /lib32/libc*<br>-rwxr-xr-x 1 root root 20426=
32 Mar 31 =C2=A02021 /lib32/<a href=3D"http://libc-2.33.so">libc-2.33.so</a=
><br></div><div><br></div><div>My gcc version 10 does use the same libc ver=
sion.</div><div>As already mentioned, I can also reproduce this on a VM wit=
h Ubuntu 20.04 and libc-2.31.</div><div>In addition, originally, this issue=
 was first reproduced with an own buildroot RootFS and containing libc-2.28=
.</div><div><br></div><div>As you see, the libcs are not that old. What abo=
ut the virtual environment? I could not check this hypothesis, but I hope t=
o do so soon.</div><div><br></div><div>Thank you again and best regards</di=
v><div>Jon<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">El lun, 25 jul 2022 a las 14:45, Peter Maydell (&lt;<a =
href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;) =
escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Mon, 25 Jul 2022 at 12:13, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:=
berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; On Mon, Jul 25, 2022 at 12:00:35PM +0100, Peter Maydell wrote:<br>
&gt; &gt; For handling guest POSIX timers, we currently use an array<br>
&gt; &gt; g_posix_timers[], whose entries are a host timer_t value, or 0 fo=
r<br>
&gt; &gt; &quot;this slot is unused&quot;.=C2=A0 When the guest calls the t=
imer_create syscall<br>
&gt; &gt; we look through the array for a slot containing 0, and use that f=
or<br>
&gt; &gt; the new timer.<br>
&gt; &gt;<br>
&gt; &gt; This scheme assumes that host timer_t values can never be zero.=
=C2=A0 This<br>
&gt; &gt; is unfortunately not a valid assumption -- for some host libc<br>
&gt; &gt; versions, timer_t values are simply indexes starting at 0.=C2=A0 =
When<br>
&gt; &gt; using this kind of host libc, the effect is that the first and se=
cond<br>
&gt; &gt; timers end up sharing a slot, and so when the guest tries to oper=
ate<br>
&gt; &gt; on the first timer it changes the second timer instead.<br>
&gt;<br>
&gt; For sake of historical record, could you mention here which specific<b=
r>
&gt; libc impl / version highlights the problem.<br>
<br>
Jon, which host libc are you seeing this with?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">j.A</div>

--000000000000caafa405e4bc9cb4--

