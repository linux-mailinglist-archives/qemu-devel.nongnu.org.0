Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C0449BFF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 19:52:01 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk9kO-0005ud-2N
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 13:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mk9iP-00057B-6Y
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 13:49:57 -0500
Received: from [2607:f8b0:4864:20::92a] (port=35526
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mk9iM-0007oH-P0
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 13:49:56 -0500
Received: by mail-ua1-x92a.google.com with SMTP id q13so33533073uaq.2
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 10:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y9p1x4PxaM3DCaIkQvBsp/yWMG9TcaB7psBbv4W7104=;
 b=lkuoQiIK1WF7VgmP73GeeSj1zcAnMv2fEfCCdq8cNwbAzV43yGaXQalP4yB+TH5+hi
 kfKmrG3hPf9TtlH0zTXGlZIzLRPbMHWfJomNA+LZVxOEmoyG2B2zCDPRi3qawDhLRj9p
 T8F8idPnchqZSsfvi7WXvRBgb+NxIEq0efTPwKkeAXkWlNmbm+m0xzWSj/zDNkE7xFqh
 fl1ODqdSTw/gkLliBHWE0B7sq9Odg7Bf+YUeeZKfj4j0sqr3COoFlaTkJJsjFktUZOpE
 QsakDJywyZoylO9rzRlGopRaVqnhUljR+SSYSFRXXEP83YEOV2xwp3wSG8NcdYiUKtz0
 vJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y9p1x4PxaM3DCaIkQvBsp/yWMG9TcaB7psBbv4W7104=;
 b=lQs1r02UnivVtRhUBzRMEmW3jgH+8xktNWJQy5kXAIOqCNRxPtH5fONdBo/gdtUQI8
 F4FQzq5QHkG6mRJIsWFSLJq0JJNLJE2anMOFauAUTEsb6t+ILZNSCvwdESI1mweGScnR
 HtGcp4kuCVSf36PAM2AZcTrRHwxmchdfy+IWhKCjjxP/fkh/C9o6MyJMBVnoEWv0VL4V
 DI6Itw0Zmsx9xLeeh9bLX0qCQmdDslnhz7wFk5H0CDItDH7wdQq8lXnrOuGw7YQp1y/M
 H2VkqZKNIEL99rdzeoRcSOoQThvAvcYxXHa4YwEys3OJ3KnLBXiHh0jJhsugvgZwkXDJ
 gcnQ==
X-Gm-Message-State: AOAM530XM5lEXL85d3pCyP46GuqXjIKmgdTwZygfulAwyud9bcM4KzR2
 PG7Kt2NIGfJc6TG2ng0TMTMg2ZZuRf+CSlzHUnz/jfcMbdwDHQ==
X-Google-Smtp-Source: ABdhPJx9ZClG7AIENgR2bvwkNRVzO37UZj55Ykv2zOgRf1OAhbNFp4avlR/G6SYWA69X6oPX+qbPkHcYww4FStqXN20=
X-Received: by 2002:a67:e050:: with SMTP id n16mr1848256vsl.44.1636397393214; 
 Mon, 08 Nov 2021 10:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-5-imp@bsdimp.com>
 <0511aedf-1ecd-666d-034f-55d50306e115@linaro.org>
In-Reply-To: <0511aedf-1ecd-666d-034f-55d50306e115@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 8 Nov 2021 11:49:42 -0700
Message-ID: <CANCZdfohHLKjstby1t3vA3u=MU2qdt_FXNTSpWyUPbbyd2p5aw@mail.gmail.com>
Subject: Re: [RFC 4/4] common-user: Allow return codes to be adjusted after
 sytsem call
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000055933105d04b750a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000055933105d04b750a
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 8, 2021 at 8:10 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 11/8/21 3:37 AM, Warner Losh wrote:
> > All the *-users generally use the Linux style of negative return codes
> > for errno. However, other systems, like FreeBSD, have a different
> > convention. Allow those systems to insert code after the syscall that
> > adjusts the return value of the system call to match the native linux
> > format.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   common-user/host/aarch64/safe-syscall.inc.S | 1 +
> >   common-user/host/arm/safe-syscall.inc.S     | 1 +
> >   common-user/host/i386/safe-syscall.inc.S    | 1 +
> >   common-user/host/ppc64/safe-syscall.inc.S   | 1 +
> >   common-user/host/riscv/safe-syscall.inc.S   | 1 +
> >   common-user/host/s390x/safe-syscall.inc.S   | 1 +
> >   common-user/host/x86_64/safe-syscall.inc.S  | 1 +
> >   linux-user/safe-syscall.S                   | 1 +
> >   8 files changed, 8 insertions(+)
> >
> > diff --git a/common-user/host/aarch64/safe-syscall.inc.S
> b/common-user/host/aarch64/safe-syscall.inc.S
> > index bc1f5a9792..81d83e8e79 100644
> > --- a/common-user/host/aarch64/safe-syscall.inc.S
> > +++ b/common-user/host/aarch64/safe-syscall.inc.S
> > @@ -64,6 +64,7 @@ safe_syscall_start:
> >       svc     0x0
> >   safe_syscall_end:
> >       /* code path for having successfully executed the syscall */
> > +     ADJUST_SYSCALL_RETCODE
> >       ret
> >
> >   0:
>
> Not sure about this, really.  Is it really that much cleaner to insert
> this than create
> separate 10-line files, with the adjustment included?
>

While the meat of these files is only around 10 lines, the files themselves
are more like 70 lines with a lot of extra marking to ensure proper
integration with toolchains. Such lines have a tendency, over time, to need
adjusting as new toolchains change the requirements slightly (clang
certainly has forced that in a number of places in FreeBSD's code base, and
every new version seems to require something). The adjustments have all
been 3 lines (gmail seems to hate my formatting):

+#define        ADJUST_SYSCALL_RETCODE \
+    jnb 2f;                    \
+    neg %rax;                  \
+    2:

which is significantly easier to maintain than having to monitor these
files for changes and copying over the changes that happen. Plus, as I'm
upstreaming the arch support, it's one more file I have to include in the
review, it's one more file that may get questions and advice I'll have to
answer with 'it's a verbatim copy of the linux version with these three
lines added, why do I need to make those stylistic changes'. All of which
takes extra time. The upstreaming is going much more slowly than I'd
anticipated (but on the up-side also finding more problems than I thought
were latent in the system), and we're still at about 30k lines (after
starting at about 36k lines, though some of that is due to deleting mips).
It's been running about a month per 1000 lines to get reviewed and
upstreamed. There's about 626 lines in these 6 files, so sharing them
seemed like it would save me a few weeks of upstreaming time as well
(though I'll be the first to admit that translating LoC metrics to time has
a dubious history).

The other alternative I considered was having a #ifdef __FreeBSD__ ..
#endif in all those files, but I thought that even more intrusive.

Warner

--00000000000055933105d04b750a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 8, 2021 at 8:10 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 11/8/21 3:37 AM, Warner Losh wrote:<br>
&gt; All the *-users generally use the Linux style of negative return codes=
<br>
&gt; for errno. However, other systems, like FreeBSD, have a different<br>
&gt; convention. Allow those systems to insert code after the syscall that<=
br>
&gt; adjusts the return value of the system call to match the native linux<=
br>
&gt; format.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0common-user/host/aarch64/safe-syscall.inc.S | 1 +<br>
&gt;=C2=A0 =C2=A0common-user/host/arm/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=
=A0| 1 +<br>
&gt;=C2=A0 =C2=A0common-user/host/i386/safe-syscall.inc.S=C2=A0 =C2=A0 | 1 =
+<br>
&gt;=C2=A0 =C2=A0common-user/host/ppc64/safe-syscall.inc.S=C2=A0 =C2=A0| 1 =
+<br>
&gt;=C2=A0 =C2=A0common-user/host/riscv/safe-syscall.inc.S=C2=A0 =C2=A0| 1 =
+<br>
&gt;=C2=A0 =C2=A0common-user/host/s390x/safe-syscall.inc.S=C2=A0 =C2=A0| 1 =
+<br>
&gt;=C2=A0 =C2=A0common-user/host/x86_64/safe-syscall.inc.S=C2=A0 | 1 +<br>
&gt;=C2=A0 =C2=A0linux-user/safe-syscall.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A08 files changed, 8 insertions(+)<br>
&gt; <br>
&gt; diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user=
/host/aarch64/safe-syscall.inc.S<br>
&gt; index bc1f5a9792..81d83e8e79 100644<br>
&gt; --- a/common-user/host/aarch64/safe-syscall.inc.S<br>
&gt; +++ b/common-user/host/aarch64/safe-syscall.inc.S<br>
&gt; @@ -64,6 +64,7 @@ safe_syscall_start:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0svc=C2=A0 =C2=A0 =C2=A00x0<br>
&gt;=C2=A0 =C2=A0safe_syscall_end:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully execute=
d the syscall */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ADJUST_SYSCALL_RETCODE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A00:<br>
<br>
Not sure about this, really.=C2=A0 Is it really that much cleaner to insert=
 this than create <br>
separate 10-line files, with the adjustment included?<br></blockquote><div>=
<br></div><div>While the meat of these files is only around 10 lines, the f=
iles themselves are more like 70 lines with a lot of extra marking to ensur=
e proper integration with toolchains. Such lines have a tendency, over time=
, to need adjusting as new toolchains change the requirements slightly (cla=
ng certainly has forced that in a number of places in FreeBSD&#39;s code ba=
se, and every new version seems to require something). The adjustments have=
 all been 3 lines (gmail seems to hate my formatting):</div><div><br></div>=
<div>+#define =C2=A0 =C2=A0 =C2=A0 =C2=A0ADJUST_SYSCALL_RETCODE \<br>+ =C2=
=A0 =C2=A0jnb 2f; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A0neg %rax; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>+ =C2=A0 =C2=A02:<br><br></div><div>whi=
ch is significantly easier to maintain than having to monitor these files f=
or changes and copying over the changes that happen. Plus, as I&#39;m upstr=
eaming the arch support, it&#39;s one more file I have to include in the re=
view, it&#39;s one more file that may get questions and advice I&#39;ll hav=
e to answer with &#39;it&#39;s a verbatim copy of the linux version with th=
ese three lines added, why do I need to make those stylistic changes&#39;. =
All of which takes extra time. The upstreaming is going much more slowly th=
an I&#39;d anticipated (but on the up-side also finding more problems than =
I thought were latent in the system), and we&#39;re still at about 30k line=
s (after starting at about 36k lines, though some of that is due to deletin=
g mips). It&#39;s been running about a month per 1000 lines to get reviewed=
 and upstreamed. There&#39;s about 626 lines in these 6 files, so sharing t=
hem seemed like it would save me a few weeks of upstreaming time as well (t=
hough I&#39;ll be the first to admit that translating LoC metrics to time h=
as a dubious history).</div><div><br></div><div>The other alternative I con=
sidered was having a #ifdef __FreeBSD__ .. #endif in all those files, but I=
 thought that even more intrusive.</div><div><br></div><div>Warner</div></d=
iv></div>

--00000000000055933105d04b750a--

