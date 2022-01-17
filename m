Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E7490C72
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:24:18 +0100 (CET)
Received: from localhost ([::1]:55818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Unp-000774-8m
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:24:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9UmC-00060M-GK
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:22:36 -0500
Received: from [2607:f8b0:4864:20::931] (port=46915
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n9UmA-0000DG-Ce
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:22:36 -0500
Received: by mail-ua1-x931.google.com with SMTP id c36so31314011uae.13
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 08:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lVl2uz5rc8KYOGNuGY1BDy5ZfB91bfpbYiHaxU29TPE=;
 b=Gd7lJw4nqDDQY/LiROxtgQ5EdkBPiE0fMnr4XuCU6kiyH5fJMXR47iMYyAazm7Yz6/
 usRdprgLDTzQxBNNN6QiSJuCTARPvK2t/lIU68/XqxlL0k8efmrECTL1GwpEa0I16sW9
 Zlgl4VCjfgokrDibHcQ87M820ys0OAVIaIeXtsY7U+iRHIw8tZnOG9UjwnTRvM2tgyyK
 m/6LluP14oYa/TK6SGXPZ+apJi8AXMkBnqIpsIZORhGV1E2HK/4PTWU9hm/oL4H0FNMz
 UBM4Q8i2pyESTeETOOpobslt+LxSjfAK7nXik9HcS6i3clAmD/IeMQYTbvqp1bmbx8bF
 8gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lVl2uz5rc8KYOGNuGY1BDy5ZfB91bfpbYiHaxU29TPE=;
 b=2tNUmOQZnIUhMTcrMIRgnhc+ZDAs65gqiV4gnrrPpHGUGldbPVRCGueb2/qU4Mdy9A
 /Yw2aaXM5hO31uGSzmkPzcBbXHUs1tKvdHOMibAhQ9/28CCWQ0kIYwnwuWhyo2sTtq4Q
 IlV7gO1IbnGkunTB9X9hqMzPVooRPyQAMJo/chYrVsQhgvRCCxKYyFhUOkYWOetesJ19
 J6a+UdpLwp8L0etdpsL3aFiQV8aXdv6ufscZiamEhjCLqQwnI/duCbsxZZYW/vfFiP5Q
 66gujRpTRdm8C8pb44idkvCjzWOVt7YlUvkLOONJGbr/l4O9M3OwL2wuQAn8L9fnA8TW
 o0dA==
X-Gm-Message-State: AOAM530bH+2liJ9FKU2QepIumXZ4Kw+yTea7nQY94O0NIlaXzGagg9e8
 cbiZNr0ZsMQVXcv3OjUy3jU/qHAGzlbZ5yWONLRsVw==
X-Google-Smtp-Source: ABdhPJyi7V22p4bMUB89aIJbxlc+DrX9tmmhuT1BlAIcIJm7W4D2zmReIh9Eerte2PAP7Rw6cSK8dgSmEPXahkqcSQI=
X-Received: by 2002:a05:6102:ecf:: with SMTP id
 m15mr7116663vst.68.1642436552950; 
 Mon, 17 Jan 2022 08:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-23-imp@bsdimp.com>
 <CAFEAcA-wf3UDDocabE6Th4ixrVWd4Lsfy3pjvnHGwGfNupzK_w@mail.gmail.com>
In-Reply-To: <CAFEAcA-wf3UDDocabE6Th4ixrVWd4Lsfy3pjvnHGwGfNupzK_w@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 17 Jan 2022 09:22:22 -0700
Message-ID: <CANCZdfrGAgVzGDMSf4qqq4B2KAs_9Lu4sj4dn96HdhfmkgWqxw@mail.gmail.com>
Subject: Re: [PATCH 22/30] bsd-user/signal.c: Fill in queue_signal
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004e2c9705d5c98f90"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::931;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x931.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004e2c9705d5c98f90
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 1:37 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:51, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Fill in queue signal implementation, as well as routines allocate and
> > delete elements of the signal queue.
>
> See reply to patch 18 for why you probably don't want to do this.
>

I've kept the former bits (implementing queue_signal() function), but
removed
the rest.


> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
>
>
> > +    /*
> > +     * FreeBSD signals are always queued.  Linux only queues real time
> signals.
> > +     * XXX this code is not thread safe.  "What lock protects
> ts->sigtab?"
> > +     */
>
> ts->sigtab shouldn't need a lock, because it is per-thread,
> like all of TaskState. (The TaskState structure is pointed
> to by the CPUState 'opaque' field. CPUStates are per-thread;
> the TaskState for a new thread's new CPUState is allocated
> and initialized as part of the emulating of whatever the
> "create new thread" syscall is. For Linux this is in
> do_fork() for the CLONE_VM case. The TaskState for the
> initial thread is allocated in main.c.) We do need to deal
> with the fact that ts->sigtab can be updated by a signal
> handler (which always runs in the thread corresponding to
> that guest CPU): the linux-user process_pending_signals()
> has been written with that in mind.
>

Gotcha. That makes sense. Any reason that atomics aren't used
for this between the different routines?

Warner

--0000000000004e2c9705d5c98f90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 1:37 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, 9 Jan 2022 at 16:51, Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Fill in queue signal implementation, as well as routines allocate and<=
br>
&gt; delete elements of the signal queue.<br>
<br>
See reply to patch 18 for why you probably don&#39;t want to do this.<br></=
blockquote><div><br></div><div>I&#39;ve kept the former bits (implementing =
queue_signal() function), but removed</div><div>the rest.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* FreeBSD signals are always queued.=C2=A0 Linux =
only queues real time signals.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* XXX this code is not thread safe.=C2=A0 &quot;W=
hat lock protects ts-&gt;sigtab?&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
<br>
ts-&gt;sigtab shouldn&#39;t need a lock, because it is per-thread,<br>
like all of TaskState. (The TaskState structure is pointed<br>
to by the CPUState &#39;opaque&#39; field. CPUStates are per-thread;<br>
the TaskState for a new thread&#39;s new CPUState is allocated<br>
and initialized as part of the emulating of whatever the<br>
&quot;create new thread&quot; syscall is. For Linux this is in<br>
do_fork() for the CLONE_VM case. The TaskState for the<br>
initial thread is allocated in main.c.) We do need to deal<br>
with the fact that ts-&gt;sigtab can be updated by a signal<br>
handler (which always runs in the thread corresponding to<br>
that guest CPU): the linux-user process_pending_signals()<br>
has been written with that in mind.<br></blockquote><div><br></div><div>Got=
cha. That makes sense. Any reason that atomics aren&#39;t used</div><div>fo=
r this between the different routines?</div><div><br></div><div>Warner=C2=
=A0</div></div></div>

--0000000000004e2c9705d5c98f90--

