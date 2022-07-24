Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4A57F6B6
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jul 2022 21:38:44 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFhR4-0000yx-Ru
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 15:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oFhP8-00083G-Vg
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 15:36:43 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oFhP7-0008TF-Aw
 for qemu-devel@nongnu.org; Sun, 24 Jul 2022 15:36:42 -0400
Received: by mail-yb1-xb36.google.com with SMTP id e69so16638684ybh.2
 for <qemu-devel@nongnu.org>; Sun, 24 Jul 2022 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V67EhhT6QOQjrWZQykLW/t0/nJHKHq/m2tK15znPOvQ=;
 b=Fk8J6bIj3G8vaO41vyf4/56XKwXwLHAbSny4mNkGuuKasCrUlzQsmKTXq5cObWroQq
 CZVAILy87kqEnP4AfZsCmTlx0iMtQQrqfOtHArf8NZhA8fz0w/lYU/E2Yt1oela+LfMZ
 Or+t8w2Pbb42/u7Y/bRg3HE6kSZlD15QLFlWqxw1RDhL9Um9tp30KZcy7xA1BGuOjlV4
 y6u6WjNGHLTffyz3v3VYPqDRxcVSPZXnPWZG5bV6hJwMdSLpyrKUyorwPZ4dq2qWpGvu
 lZhvzo3D6fcdWQIS8rwKlnlmAoIK0v8VXS0wKa7jfDXYxmw8SqJhi0f5XhDh8hDvvKhV
 oU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V67EhhT6QOQjrWZQykLW/t0/nJHKHq/m2tK15znPOvQ=;
 b=jly4L95JfhQTZrDJrR1Jz7MD4FvaeXg9+O4Sc9tfaGsLS9q8e+OKX1XYKb4vh+WC6v
 IE0Mpd5VWP4clkBG9uduyfUZ0TB765XtZ5+47uLFZOjFfkf1pI996sTmawA7Fvm0Uwrv
 MuxvYD5Kc5fvlSZWPoBx3/QzdQABOWu6t8h9iJNkB/gvb/exzj0KFZ7o3X0WD0TofOKy
 +OkPqHpxreMxYmtRnwieQw3sAq57Juv6X8x/smN7FT9zU7PZ8l+GmeEfq6TgTZNu/kha
 dI/RaiZrSXvwbGsJvDAaYZx85PurXFepnuB/1jDXIwOMQlnnu63WUopCEbknJmxsLBn7
 acrQ==
X-Gm-Message-State: AJIora+AMcQP4GW6ECG5cOQmxrexMaWdHpV3NIfzaqqcvQ/WM9mnDFd5
 0laOFx7jnfyNFdUhg8bpVdaTsSiFw6AhiLqala+wt0b7FL4=
X-Google-Smtp-Source: AGRyM1vbmQq4dCzRFijXPAt/5OFLirolrVgI9g18WAbm/6q9PApvCNZKzcADr7vT5fWHmyG7ozN6ngt0x9b61/He3S0=
X-Received: by 2002:a25:2486:0:b0:670:d0fe:ddef with SMTP id
 k128-20020a252486000000b00670d0feddefmr7141206ybk.642.1658691399786; Sun, 24
 Jul 2022 12:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
 <4BB551D8-F877-4382-A4B9-D6913580AAE1@ict.ac.cn>
 <CAJSP0QUf4K=N7ZDAXrB3WvUxx4DoA4Sg0hSTri1WKGTnsMtN2g@mail.gmail.com>
 <DC2847BE-EE1B-4496-9270-C04A4DDF3A7F@ict.ac.cn>
In-Reply-To: <DC2847BE-EE1B-4496-9270-C04A4DDF3A7F@ict.ac.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 24 Jul 2022 15:36:26 -0400
Message-ID: <CAJSP0QVPqzck4RTiQmjHpeAvZ1PEZCjjvdpwSdJ836Zw6HG22w@mail.gmail.com>
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Klaus Birkelund Jensen <its@irrelevant.dk>, 
 Keith Busch <kbusch@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000ad290f05e4922f91"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ad290f05e4922f91
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 24, 2022, 11:21 Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> at 9:29 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> >
> > Nice, perf(1) is good for that. You can enable trace events and add
> > kprobes/uprobes to record timestamps when specific functions are entered.
> >
>
> Thanks Stefan,
>
> One last question: Currently we can achieve hundreds of KIOPS. That means
> perf can easily capture millions of trace events per second. I found perf
> has quite high overhead at such a rate of trace events. Do you have any
> advices on tracing high IOPS tasks?


I don't. BTW uprobes are expensive but kprobes are cheaper.

Stefan

>

--000000000000ad290f05e4922f91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Jul 24, 2022, 11:21 Jinhao Fan &lt;<a href=3D"=
mailto:fanjinhao21s@ict.ac.cn">fanjinhao21s@ict.ac.cn</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">at 9:29 PM, Stefan Hajnoczi &lt;<a href=
=3D"mailto:stefanha@gmail.com" target=3D"_blank" rel=3D"noreferrer">stefanh=
a@gmail.com</a>&gt; wrote:<br>
<br>
&gt; <br>
&gt; Nice, perf(1) is good for that. You can enable trace events and add<br=
>
&gt; kprobes/uprobes to record timestamps when specific functions are enter=
ed.<br>
&gt; <br>
<br>
Thanks Stefan,<br>
<br>
One last question: Currently we can achieve hundreds of KIOPS. That means<b=
r>
perf can easily capture millions of trace events per second. I found perf<b=
r>
has quite high overhead at such a rate of trace events. Do you have any<br>
advices on tracing high IOPS tasks?</blockquote></div></div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I don&#39;t. BTW uprobes are expensive but k=
probes are cheaper.</div><div dir=3D"auto"></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Stefan</div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000ad290f05e4922f91--

