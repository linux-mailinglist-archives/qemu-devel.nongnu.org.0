Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18DD4185CE
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 05:08:31 +0200 (CEST)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUKWk-0001So-Ei
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 23:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUKVO-0000kq-Qs
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 23:07:06 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:34400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mUKVL-0000t7-NA
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 23:07:06 -0400
Received: by mail-vk1-xa31.google.com with SMTP id z202so5599948vkd.1
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 20:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vGH/Mj1Mp3R1MKNtCJkJX5JTqF3tMANxJAbBDozfw2g=;
 b=y9U7nLzFPfzDtEf7YESy/L8r8fehuchgO4soOwF3VpQ/hqeCr8s7v/Ec+K0DQ8yAcA
 SiBG7TXcrWY4qIZpK8ZVYi32IOgnbBjK5XXFM5oOUiXGaTBeueliePkTXHKsxE5nmCV2
 3AJK2n8L3uf43I+TkCPorWKdQd9L2BwPu1kBislixhYQ2H2mBa/C9WsuUl5TIfLBEPCX
 /G9uLtIewF/R/Zzke0++G37W/GFwvjszxoeROFCj/Xn9sTsz82o0/ZGk691YWkNAOi+p
 RXMVA5aZBX1G0n7mcNnr7lhSxEc4G0+xxFbNce4UYBLisu0dD6GgDUk8bzPuj9s7cJyF
 ETjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vGH/Mj1Mp3R1MKNtCJkJX5JTqF3tMANxJAbBDozfw2g=;
 b=sStRQiMdFBqcArnXKsxO4XI1N0/eeYy3VdaPYGGVPp7yeluZNaUN6LNWNfOD6sBNCs
 AvBtampdpBMRAuKialhOMkdVS1gO80nHpLxa0j1814uR31viPXIstBFujRedVHHc8uTW
 /GgIGCmMqa/6x1EFQlxhvZ5TKRF1kVfnVb/nrq/UlwraoXHbU3fEolxhUGszmkS9SGh2
 IU82YG7Hsz7hfHL86z6PSofx4B59vQl/dCwhXlWMx/KzdKnLAeenKf1VWe3Y5TRHiByI
 6u5Ul7Gn8kGb0V2kLmGXJrLwhtcP/EYjbZMwnwESaL5Tb8HRwC4aXjDA5VJI2RRi72sp
 VdSg==
X-Gm-Message-State: AOAM531/Ps61+QoyvZ1v5bPz0A4jdihDZyBtYI+oFtgLjJovwQBETTW/
 XktWTXUN3m7mq9rkPg3ktccB5bkPXOQtUXCrH2OG0PKA+SzCQGWn
X-Google-Smtp-Source: ABdhPJxGLidnY8KAP+Qrmy4c8DaK/LS4MhI04G85MkFslBiBB9OZVtbS71/0JVOm7GvwXGGo19op9TUocV6O8s6h4PM=
X-Received: by 2002:a05:6122:9a1:: with SMTP id
 g33mr12906523vkd.23.1632625620605; 
 Sat, 25 Sep 2021 20:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-15-imp@bsdimp.com>
 <dde592d4-35fc-8f33-009b-cc6a0e4460ad@amsat.org>
 <CANCZdfo-YTGs3gLi1T+BKa5a1EhQ1ZpfhbR_x27n0uOKt3xE5A@mail.gmail.com>
In-Reply-To: <CANCZdfo-YTGs3gLi1T+BKa5a1EhQ1ZpfhbR_x27n0uOKt3xE5A@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 25 Sep 2021 21:06:49 -0600
Message-ID: <CANCZdfosi+ROGvyV34A4HYUnAyj7c1Mef=mrdCmRnPYRS0Gnxg@mail.gmail.com>
Subject: Re: [PATCH 14/14] bsd-user/signal: Create a dummy signal queueing
 function
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000002afa2905ccdd46e8"
Received-SPF: none client-ip=2607:f8b0:4864:20::a31;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa31.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002afa2905ccdd46e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 25, 2021 at 8:53 AM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Sat, Sep 25, 2021, 4:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
> wrote:
>
>> On 9/22/21 08:14, Warner Losh wrote:
>> > Create dummy signal queueing function so we can start to integrate oth=
er
>> > architectures (at the cost of signals remaining broken) to tame the
>> > dependency graph a bit and to bring in signals in a more controlled
>> > fashion.
>> >
>> > Signed-off-by: Warner Losh <imp@bsdimp.com>
>> > ---
>> >   bsd-user/qemu.h   | 1 +
>> >   bsd-user/signal.c | 8 ++++++++
>> >   2 files changed, 9 insertions(+)
>> >
>> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
>> > index 5a2fd87e44..85d1f8fd2a 100644
>> > --- a/bsd-user/qemu.h
>> > +++ b/bsd-user/qemu.h
>> > @@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env=
);
>> >   void signal_init(void);
>> >   long do_sigreturn(CPUArchState *env);
>> >   long do_rt_sigreturn(CPUArchState *env);
>> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
>> >   abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
>> abi_ulong sp);
>> >
>> >   /* mmap.c */
>> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
>> > index ad6d935569..4e7f618944 100644
>> > --- a/bsd-user/signal.c
>> > +++ b/bsd-user/signal.c
>> > @@ -19,6 +19,14 @@
>> >   #include "qemu/osdep.h"
>> >
>> >   #include "qemu.h"
>> > +/*
>> > + * Queue a signal so that it will be send to the virtual CPU as soon =
as
>> > + * possible.
>> > + */
>> > +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
>> > +{
>> > +    return 1;
>>
>> Shouldn't we abort() here or at least call qemu_log_mask(LOG_UNIMP)?
>>
>
> Sure. This code is just a placeholder for the moment so that I can prepar=
e
> the full signal.c later, but still be able to submit my next 3 patch seri=
es
> which add aarch64, arm and riscv64. It can be anything you'd like without
> generating conflicts.
>
> When I spin the next version I'll have at least an abort here.
>

I'll add the log_unimp stuff too. In debugging something else, I've learned
how to use qemu_log and will convert a few things as well (though I'm not
yet sure the sequencing of those upstream).

Warner


> Warner
>
> > +}
>> >
>> >   void signal_init(void)
>> >   {
>> >
>>
>

--0000000000002afa2905ccdd46e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 25, 2021 at 8:53 AM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto=
"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sat, Sep 25, 2021, 4:50 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 9/22/21 08:=
14, Warner Losh wrote:<br>
&gt; Create dummy signal queueing function so we can start to integrate oth=
er<br>
&gt; architectures (at the cost of signals remaining broken) to tame the<br=
>
&gt; dependency graph a bit and to bring in signals in a more controlled<br=
>
&gt; fashion.<br>
&gt; <br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" rel=
=3D"noreferrer" target=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0bsd-user/signal.c | 8 ++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 9 insertions(+)<br>
&gt; <br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index 5a2fd87e44..85d1f8fd2a 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -209,6 +209,7 @@ void process_pending_signals(CPUArchState *cpu_env=
);<br>
&gt;=C2=A0 =C2=A0void signal_init(void);<br>
&gt;=C2=A0 =C2=A0long do_sigreturn(CPUArchState *env);<br>
&gt;=C2=A0 =C2=A0long do_rt_sigreturn(CPUArchState *env);<br>
&gt; +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);=
<br>
&gt;=C2=A0 =C2=A0abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss=
_addr, abi_ulong sp);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* mmap.c */<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index ad6d935569..4e7f618944 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -19,6 +19,14 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu.h&quot;<br>
&gt; +/*<br>
&gt; + * Queue a signal so that it will be send to the virtual CPU as soon =
as<br>
&gt; + * possible.<br>
&gt; + */<br>
&gt; +int queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return 1;<br>
<br>
Shouldn&#39;t we abort() here or at least call qemu_log_mask(LOG_UNIMP)?<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sur=
e. This code is just a placeholder for the moment so that I can prepare the=
 full signal.c later, but still be able to submit my next 3 patch series wh=
ich add aarch64, arm and riscv64. It can be anything you&#39;d like without=
 generating conflicts.</div><div dir=3D"auto"><br></div><div dir=3D"auto">W=
hen I spin the next version I&#39;ll have at least an abort here.</div></di=
v></blockquote><div><br></div><div>I&#39;ll add the log_unimp stuff too. In=
 debugging something else, I&#39;ve learned</div><div>how to use qemu_log a=
nd will convert a few things as well (though I&#39;m not</div><div>yet sure=
 the sequencing of those upstream).</div><div><br></div><div>Warner<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"auto"><div dir=3D"auto">Warner</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt; +}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void signal_init(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; <br>
</blockquote></div></div></div>
</blockquote></div></div>

--0000000000002afa2905ccdd46e8--

