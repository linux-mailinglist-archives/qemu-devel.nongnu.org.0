Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E44B3E860E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 00:29:14 +0200 (CEST)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDaFE-00009r-Ob
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 18:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaER-0007vc-NG
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:28:23 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:36460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaEP-0005EI-QU
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:28:23 -0400
Received: by mail-qt1-x82f.google.com with SMTP id w10so457523qtj.3
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vDY0Y9P5BM8gRJhylyRWxLdTc4V7q/Y3fzKvHj8UIrg=;
 b=L5rmDYLWJRxNORffeox5rBTJaEUJoM50Shz1F8xaBdT8Jj+H/TWM24IuMdrYUhGw91
 d6Di4dXGJ2INkc29y1llZI71UtOvjUyPIaXNd+VDcanzynbnBoGyRcxrDIYMjjUCiLhY
 jYe8pgitMcGkWzvgrAK/quUV9Kxaa4Fw6dr2uXyRSgfTH+Lo6Rhu/CbhAvfwknNIQ2X1
 XWGpXOmEifpM9UdCzboErTkeuft5HWaCZ2auNua0qSYzdYRtSjfv7L8ielH9079MrKtA
 5jaQ49bLDbAVHtBca0ly872yHqMOkgdLaYvzX4DtsKZktZZyloropCq+PecSHYVpXcJW
 5N1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDY0Y9P5BM8gRJhylyRWxLdTc4V7q/Y3fzKvHj8UIrg=;
 b=Nzzb+m4G9bBfWDIRJ6oKfrSwdP7gDy2flnzSmTpnVZr3rOsuZulIyaDzezMdpiYE9J
 gCxKOPgzUrwK+7fVYaYU7RUEQzUQ44oixB15dN5dZYcJPmvFtMS8ni2aFJRQ4SC6OBYK
 /p1zUpN92ijQPP4FKOAzeXkjVEBrGl/KLFna3Ke/UW0eJFVv6e2isW9me2/VsgRjLHsB
 dtkRs//uU21ThQOv6+3UmUdeQGtJ0a3zGB0HKWoeSlyCL2xo7KwZaLC1DLtqmPiXUeFA
 tXhMuWwqG6yioRbzJA4IS6Pn0uKCr/IViDHwDIvK0XSdjNH/OxDiuqORNaFoSeg++o31
 XjNw==
X-Gm-Message-State: AOAM532LDjOuopsB8yyDPq7K+CN2T+Rb6DskO+IwBhXWuUGy2krZxECE
 qMIosoH+j/har3dSwGbj0D7Lw46jlnBbtaYRfUWRrQ==
X-Google-Smtp-Source: ABdhPJxBrCcq3sJcMYh4I0p9Fkfy56FUlD10tM6AOhcQusOu/PvjbJue9CMtOZi3lZmhxfTKqaOtIR7RXeFBDDiRZ+0=
X-Received: by 2002:ac8:4c8b:: with SMTP id j11mr19303099qtv.244.1628634500355; 
 Tue, 10 Aug 2021 15:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-35-imp@bsdimp.com>
 <3ef92fcb-aa6c-9366-9b9a-4fbf30793427@linaro.org>
In-Reply-To: <3ef92fcb-aa6c-9366-9b9a-4fbf30793427@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 10 Aug 2021 16:28:09 -0600
Message-ID: <CANCZdfpR1phGh6AymfNB9mJGMp5hdSA+Xn52HbyH3gRFsXwneg@mail.gmail.com>
Subject: Re: [PATCH for 6.2 34/49] bsd-user: Fix initializtion of task state
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000dcec8805c93c0477"
Received-SPF: none client-ip=2607:f8b0:4864:20::82f;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x82f.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dcec8805c93c0477
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 10, 2021 at 9:03 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > @@ -459,21 +435,11 @@ int main(int argc, char **argv)
> >           qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
> >       }
> >
> > -    target_set_brk(info->brk);
> > -    syscall_init();
> > -    signal_init();
> > -
> > -    /*
> > -     * Now that we've loaded the binary, GUEST_BASE is fixed.  Delay
> > -     * generating the prologue until now so that the prologue can take
> > -     * the real value of GUEST_BASE into account.
> > -     */
> > -    tcg_prologue_init(tcg_ctx);
> > -
> >       /* build Task State */
> > -    memset(ts, 0, sizeof(TaskState));
> > +    ts = g_new0(TaskState, 1);
> >       init_task_state(ts);
> >       ts->info = info;
> > +    ts->bprm = &bprm;
> >       cpu->opaque = ts;
> >
> >       target_set_brk(info->brk);
>
> It looks like some of this damage occurs in patch 22
> ("bsd-user: Move per-cpu code into target_arch_cpu.h")
> and could reasonably be squashed back.
>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

I took the easy way and folded them together. Thanks for the tip.

Warner

--000000000000dcec8805c93c0477
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 9:03 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; @@ -459,21 +435,11 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;entry=C2=A0 =C2=
=A0 =C2=A0 =C2=A00x&quot; TARGET_ABI_FMT_lx &quot;\n&quot;, info-&gt;entry)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 target_set_brk(info-&gt;brk);<br>
&gt; -=C2=A0 =C2=A0 syscall_init();<br>
&gt; -=C2=A0 =C2=A0 signal_init();<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* Now that we&#39;ve loaded the binary, GUEST_BAS=
E is fixed.=C2=A0 Delay<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* generating the prologue until now so that the p=
rologue can take<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* the real value of GUEST_BASE into account.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 tcg_prologue_init(tcg_ctx);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* build Task State */<br>
&gt; -=C2=A0 =C2=A0 memset(ts, 0, sizeof(TaskState));<br>
&gt; +=C2=A0 =C2=A0 ts =3D g_new0(TaskState, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0init_task_state(ts);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;info =3D info;<br>
&gt; +=C2=A0 =C2=A0 ts-&gt;bprm =3D &amp;bprm;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cpu-&gt;opaque =3D ts;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_set_brk(info-&gt;brk);<br>
<br>
It looks like some of this damage occurs in patch 22<br>
(&quot;bsd-user: Move per-cpu code into target_arch_cpu.h&quot;)<br>
and could reasonably be squashed back.<br>
<br>
Otherwise,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>I took the easy way and folded them together. Thank=
s for the tip.</div><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000dcec8805c93c0477--

