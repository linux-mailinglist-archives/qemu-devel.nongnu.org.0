Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1023CBBC9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 20:22:32 +0200 (CEST)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4STn-00040r-6q
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 14:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m4SSJ-0003JB-6S
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 14:20:59 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1m4SSE-0004XM-V3
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 14:20:58 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 t4-20020a05683014c4b02904cd671b911bso2719018otq.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 11:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z31sDMBu18ZNjblDN3KPwvVI3k+dnrNCCDieExRiBjI=;
 b=nyprU7RezkOesXSf+gydgzJlFero1OeidvNmQU7e0DkLFvI4Y6UHxRCiKps/S5QLAo
 KCR4AQeJtic0hZ3J3fxh8mowgUw4nUUgqQEq9g5OoJpxPq0QCodi99LtukTuulRMFRPO
 jKdtfLYxnVpLdzHgtyPQshbM/5M0BjhaD3XQKaEWB6NrB4KkCZ5pcMVZCqdZ6QAkTOEu
 LXosp2wn62cOCNfzNkidBPbIUiIr5ymmSgXcgiUR6FQIJt3+kfIbyAIR4kyOG6W45OBp
 3UsqPrDpWUmnqmbSXV57NYXnq1LgQ89Q79mL7BHDhvMRSD4duugGOeG5s2cYljWgQIo7
 6cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z31sDMBu18ZNjblDN3KPwvVI3k+dnrNCCDieExRiBjI=;
 b=HAu84jE8Xg4IULu42wGj09SU3ZnsrlOONyPnLRqrh0OHLYH40LfNY+SaVKYCq6j0TV
 ETOqGoAgnUW40j3uXBxeNC3ybIw7rDDD6PjTeyW3YJkwiK0McHdoZTC4KvFjeP/vvrBB
 KrzI0EVfctkS7hVcVELMmiXQ04owsLh7RJssxuVWaYQ5H6nVqxmO8HjpLMB8SBTevQOx
 0g8G2qTp8+uCUMRXLSkS+6IN4+ibtlvYJiZqjVxjQpaZ+RsE0eIalshklLUCrc91sjjD
 dRfTUriWHyRztQ8sMmSY57QM3g6DUlDPXszz9JJzsFr6Canqy4apR/5hd/CJdBu9fxr+
 DN+g==
X-Gm-Message-State: AOAM531Fz3oNKPzuW/BARqsrust912hvVWCbySA/Cb7DrbkHGx/eiZy6
 o7WYmr9Sdz6zYgquUz0LBD31OHCUb1lzTK0EREE=
X-Google-Smtp-Source: ABdhPJycmToNAN03sonxgPrE7rgCIwz1Sen4osGc5cKT2wpPzl0Rxn1bfm7rlI9w9djAEZrJigGxrRo0DuMPixFRohQ=
X-Received: by 2002:a9d:3e06:: with SMTP id a6mr9132349otd.50.1626459653610;
 Fri, 16 Jul 2021 11:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
 <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
 <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
 <CAK7rcp_S5Z5M3bDum3f_ppequ47PaYHs0Gp=LST5jnF_VsCkuA@mail.gmail.com>
 <CAK7rcp9uNpQcFepqMugg6qv2LWMY5O=TPBDp7uKAUs0whjmrbQ@mail.gmail.com>
 <CAFEAcA8rGR9=f9Nt+Z0FeFR_m77OvC4SrmJ91+fU5NjR4ATcKg@mail.gmail.com>
 <CAK7rcp-dc7d=4M6STfuWV9=pFTmO_0ST1Cd=7mLBmnxLsp-+NQ@mail.gmail.com>
 <CAFEAcA-riRg8A1mosMHjnD=tKAA_PMe2VGcinBO=YViDqJc7qQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-riRg8A1mosMHjnD=tKAA_PMe2VGcinBO=YViDqJc7qQ@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Fri, 16 Jul 2021 13:20:41 -0500
Message-ID: <CAK7rcp952ROfhNk124p0KiwdTifz+J2ibtE_qGuKRnc+wHzC0Q@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e5207b05c741a5cc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e5207b05c741a5cc
Content-Type: text/plain; charset="UTF-8"

Right, that's what I was thinking, that I shouldn't be building that for
the system target. That's why I started out with the question that I did,
because I was thinking that it probably hard codes it to user emulation.
Currently though, understanding qemu internals is not so clear to me as I'm
just becoming familiar with the code base.

On Fri, Jul 16, 2021 at 1:05 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 16 Jul 2021 at 18:50, Kenneth Adam Miller
> <kennethadammiller@gmail.com> wrote:
> > There's a lot of files and I don't want to muddy up the discussion with
> too many details.
>
> If you don't provide details, you get vague answers. Your choice :-)
>
> > And for sure, this is not a problem with the upstream qemu. I'm working
> on adding a target, and this is just what I'm experiencing. As for my
> target, it has includes that correspond to finds within sub-directories of
> qemu components, and I just mean that the include directives are only the
> file name (no path prefix), but such file can be found only in folders
> other than the include directory. One example is qemu.h; it is in
> linux-user. You can get the compilation to find exactly just that file, but
> it includes other files, and it isn't reasonable to edit anything outside
> of my own architecture implementation. I'm wondering if perhaps anything
> that makes an include to linux-user would need to be moved into the user
> target source set, because currently it is in the shared.
>
> The broad-strokes answer is "your code in target/whatever should generally
> not be including files that are neither in include/ nor in
> target/whatever".
> If you find yourself doing that you've probably structured something wrong
> (otherwise other targets would also have run into this).
>
> For linux-user/qemu.h in particular, the top level meson.build does
> add linux-user/ to the include path, but only for when it is building
> files for the linux-user targets. (It makes no sense to include that header
> file into code built for system emulation.)
>
> Of the 4 targets that #include "qemu.h" in target/whatever code, 3 of them
> (m68k, nios2, arm) do it only for their semihosting .c file, and there
> the #include "qemu.h" is inside an #ifdef CONFIG_USER_ONLY. (Semihosting
> is a bit of an odd thing which works differently for usermode and
> system emulation mode, which is why it needs this linux-user header.)
> The 4th is hexagon, and that is a bug in the hexagon code which is only
> going unnoticed because hexagon currently supports only the linux-user
> target and not system emulation.
>
> thanks
> -- PMM
>

--000000000000e5207b05c741a5cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Right, that&#39;s what I was thinking, that I shouldn&#39;=
t be building that for the system target. That&#39;s why I started out with=
 the question that I did, because I was thinking that it probably hard code=
s it to user emulation. Currently though, understanding qemu internals is n=
ot so clear to me as I&#39;m just becoming familiar with the code base.</di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Jul 16, 2021 at 1:05 PM Peter Maydell &lt;<a href=3D"mailto:peter.mayde=
ll@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Fri, 16 Jul 2021 at 18:50, Kennet=
h Adam Miller<br>
&lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_blank">kennet=
hadammiller@gmail.com</a>&gt; wrote:<br>
&gt; There&#39;s a lot of files and I don&#39;t want to muddy up the discus=
sion with too many details.<br>
<br>
If you don&#39;t provide details, you get vague answers. Your choice :-)<br=
>
<br>
&gt; And for sure, this is not a problem with the upstream qemu. I&#39;m wo=
rking on adding a target, and this is just what I&#39;m experiencing. As fo=
r my target, it has includes that correspond to finds within sub-directorie=
s of qemu components, and I just mean that the include directives are only =
the file name (no path prefix), but such file can be found only in folders =
other than the include directory. One example is qemu.h; it is in linux-use=
r. You can get the compilation to find exactly just that file, but it inclu=
des other files, and it isn&#39;t reasonable to edit anything outside of my=
 own architecture implementation. I&#39;m wondering if perhaps anything tha=
t makes an include to linux-user would need to be moved into the user targe=
t source set, because currently it is in the shared.<br>
<br>
The broad-strokes answer is &quot;your code in target/whatever should gener=
ally<br>
not be including files that are neither in include/ nor in target/whatever&=
quot;.<br>
If you find yourself doing that you&#39;ve probably structured something wr=
ong<br>
(otherwise other targets would also have run into this).<br>
<br>
For linux-user/qemu.h in particular, the top level meson.build does<br>
add linux-user/ to the include path, but only for when it is building<br>
files for the linux-user targets. (It makes no sense to include that header=
<br>
file into code built for system emulation.)<br>
<br>
Of the 4 targets that #include &quot;qemu.h&quot; in target/whatever code, =
3 of them<br>
(m68k, nios2, arm) do it only for their semihosting .c file, and there<br>
the #include &quot;qemu.h&quot; is inside an #ifdef CONFIG_USER_ONLY. (Semi=
hosting<br>
is a bit of an odd thing which works differently for usermode and<br>
system emulation mode, which is why it needs this linux-user header.)<br>
The 4th is hexagon, and that is a bug in the hexagon code which is only<br>
going unnoticed because hexagon currently supports only the linux-user<br>
target and not system emulation.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000e5207b05c741a5cc--

