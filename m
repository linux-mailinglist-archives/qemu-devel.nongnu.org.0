Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4D214BEF5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 18:53:51 +0100 (CET)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwV3e-0004AU-1P
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 12:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iwV1q-0002XF-R2
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:52:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iwV1p-0003wC-HC
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:51:58 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:37602)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iwV1p-0003ty-9b
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:51:57 -0500
Received: by mail-ot1-x332.google.com with SMTP id d3so12563152otp.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ua/tkmadg/51CBS18E4Vj9FG7LbC+pKCsq7+VT4z6Vs=;
 b=sapxPwi/+DiXx3xyFDaMqs1pZnbs/e4bmNXRh4E8MooU/ryL2YSiIoVJhqfaa5Z0ne
 dbKBNDPdgjhDw+CZJ5/GId1s7cyU3jpmsFHv5X8X6fD9M5BqeHfDGfACuEEEnNdJc/wa
 RxjDnC3enMpWWZ6i+rDtWPfK1X+hpBMMZXXSvWm9QYLOaeMKo7gsLYcjYCyZoDfZt0cb
 RuYyS10ux5vfUkiE18Mv6beu2XuLBiRAOC0mLommIVl+qBpMJLodbHlnVYwtgqi531k7
 +YinsdXVoFRwyOp3H8uKUx6nyOHLflZEXRUd8PGnZh+YaluI2SyDuGNk8HyFKn3Z3jZt
 B7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ua/tkmadg/51CBS18E4Vj9FG7LbC+pKCsq7+VT4z6Vs=;
 b=lzRK9H9F3BqMRqnCu89Ak8SGzErTZ9bpkq5EmXZRsmAMnl6Azkbs+M3JmDtqvmn/ko
 QoX6OwV1LCmU4DJp6lVi/q0bs6lDDMM9gOyaJY41sZYg4cwlBnIkISTQdKDVGkuYgeil
 br8DzFYhTkPOpou/YJw73BJbGNvr6YYHFOUotYVddeqHLFPIzEPbbck9DfgOLvIXEBgs
 2D80ueWawHcIx04PCf62Z2dSP73Ismdr4anVF/nN1L73N60WEmKAbMgAvWlhNUVNJVlw
 35ST6rXphDBOv+UxgQLV9IeWRbkqJoEMDJNkqh+aet7Qj7821vtjIutWN9ifQfFDiOO4
 WYyQ==
X-Gm-Message-State: APjAAAWMtaW8e2d5GQZIFj5d1T75XSxAjIfFl6EcQA0NUvwSQ+0xd4TH
 MwqR1tD3tMbAiqzyU8Pprp+HqujS2mmYBSzBOv0=
X-Google-Smtp-Source: APXvYqzIn9FbzNnWeMRyCHQOFzaEZCBVNxukH1PvgFWglrcLpGfAjmvQQLs9+bMEAFJBEI/UMrNiqStoZ3IB7hsAiW8=
X-Received: by 2002:a9d:831:: with SMTP id 46mr5711792oty.295.1580233915308;
 Tue, 28 Jan 2020 09:51:55 -0800 (PST)
MIME-Version: 1.0
References: <CAL1e-=j5WJkV=X+KkfBuS3pjf6z3aJrtu4xpYeVbjEUYiWxxTQ@mail.gmail.com>
 <CAFEAcA8E9s2wZWVxanUDXu=5qcjn6XY5_6t8vUO+LjuJnA7nOQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8E9s2wZWVxanUDXu=5qcjn6XY5_6t8vUO+LjuJnA7nOQ@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 28 Jan 2020 18:51:37 +0100
Message-ID: <CAL1e-=j=nVJd9Q3JmZsimgSPy=noYhqE8hz4r5RjwgTPw9WwuA@mail.gmail.com>
Subject: Re: [GSoC/Outreachy QEMU proposal] Extend support for ioctls in QEMU
 linux-user mode
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002f1e30059d36e167"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::332
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
Cc: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002f1e30059d36e167
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

15:38 Uto, 28.01.2020. Peter Maydell <peter.maydell@linaro.org> =D1=98=D0=
=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> On Thu, 23 Jan 2020 at 15:33, Aleksandar Markovic
> <aleksandar.m.mail@gmail.com> wrote:
> > PART III:
> >
> >   a) Develop unit tests for selected ioctls that are already supported
in QEMU.
>
> These should probably just be part of the external Linux Test Project
> test suite.
>

I like the idea! This would free the student from reinventing the wheel
(ioctl test framework) - most probably resulting in more work done during
the project.

I am just not sure how this stands with GSoC/Outreachy rules. The project
would touch two open source project. Stefan?

> Incidentally a related topic would be to look at recent
> new syscalls added to the kernel and see which ones we
> could/should add support for. But maybe you're interested
> in ioctls specifically.
>

I am personally interested in both. However, learning about syscalls and
implementation of support for them in QEMU would require more ramp-up time
from student (as is the case for any new employee in a similar situation
for that matter). In the worst case, the student would spend much more time
on learning than on productive work. My impression is at it is better to
leave the student focused on just one area - ioctl support.

Thanks, Peter, for comments and ideas!

Aleksandar

> thanks
> -- PMM

--0000000000002f1e30059d36e167
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">15:38 Uto, 28.01.2020. Peter Maydell &lt;<a href=3D"mailto:p=
eter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; =D1=98=D0=B5 =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; On Thu, 23 Jan 2020 at 15:33, Aleksandar Markovic<br>
&gt; &lt;<a href=3D"mailto:aleksandar.m.mail@gmail.com">aleksandar.m.mail@g=
mail.com</a>&gt; wrote:<br>
&gt; &gt; PART III:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0a) Develop unit tests for selected ioctls that are al=
ready supported in QEMU.<br>
&gt;<br>
&gt; These should probably just be part of the external Linux Test Project<=
br>
&gt; test suite.<br>
&gt;</p>
<p dir=3D"ltr">I like the idea! This would free the student from reinventin=
g the wheel (ioctl test framework) - most probably resulting in more work d=
one during the project.</p>
<p dir=3D"ltr">I am just not sure how this stands with GSoC/Outreachy rules=
. The project would touch two open source project. Stefan?</p>
<p dir=3D"ltr">&gt; Incidentally a related topic would be to look at recent=
<br>
&gt; new syscalls added to the kernel and see which ones we<br>
&gt; could/should add support for. But maybe you&#39;re interested<br>
&gt; in ioctls specifically.<br>
&gt;</p>
<p dir=3D"ltr">I am personally interested in both. However, learning about =
syscalls and implementation of support for them in QEMU would require more =
ramp-up time from student (as is the case for any new employee in a similar=
 situation for that matter). In the worst case, the student would spend muc=
h more time on learning than on productive work. My impression is at it is =
better to leave the student focused on just one area - ioctl support.</p>
<p dir=3D"ltr">Thanks, Peter, for comments and ideas!</p>
<p dir=3D"ltr">Aleksandar</p>
<p dir=3D"ltr">&gt; thanks<br>
&gt; -- PMM<br>
</p>

--0000000000002f1e30059d36e167--

