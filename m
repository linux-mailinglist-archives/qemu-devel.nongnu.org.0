Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A745D848
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:30:48 +0100 (CET)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqC1e-0003AI-LO
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:30:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mqC0i-00028a-So
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:29:48 -0500
Received: from [2607:f8b0:4864:20::92b] (port=45661
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mqC0f-0005Pq-Qt
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:29:48 -0500
Received: by mail-ua1-x92b.google.com with SMTP id ay21so11219404uab.12
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 02:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p2QLyrpZBHlr8yAK+mrqZnj+WuJw30RFf30uVAShMKg=;
 b=3EcHqIj/jquM8ua7f33kGIG9AFD0whZKftgL3Wjubp5OMf0ZKVEfM/pwdDjFSYv4VE
 EGHXxvFJ7bcQtbeiVES/rCs3GQueEChUQOCwknIDAk/rabf8tgsb8gA41ahZFAS1dZ+2
 YZ6+DYfo0lhRe2lI1s5fEo6hDUHTCOlyOmvpM3BgpyN4Wyf7gVC41HZpT1bj14aNmYRv
 iATuq+U6qvIDZNrx0RHycbjPbWrmcwRQzUtJ4586du9ikHuEj3WNujdsTQF7Fv+MXzhQ
 izjJelfHOBo1D4wYcYb9lZazJphukWRWmVeta+XuvHdJnZdqB1VNCQUYl9O0IG7/2AO8
 dx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p2QLyrpZBHlr8yAK+mrqZnj+WuJw30RFf30uVAShMKg=;
 b=UwTOZUhQdywCj5F2lZ4yMS8J+q7SH05GHpmA7wbTPkV6MAH6yHqaASnXl+0E6z3tSx
 jKgX5/z1Osd4W4jnNjrWS4G4IoA5SqwPA3HzEPifacgfcL5qfLo0kaiExX30Bz4FVeti
 oZszlxmIxjoKg2xbQavGZ6i4TawHlofzqffptUAiBtBtxrcrLNpgvNjYDX1recH8ykms
 utKiDvIfhKWrnDJDnccCIldY/yP73ONBpOmxXkXEIwYxitLk9uvFEYvRw2WqxSF8O/R7
 dxpLcR4/hL4LddP2wUVzG33Dt9veen9FIgkBuD+C0FA75ac8mGs8b9cG5zXLymfnGuya
 4piQ==
X-Gm-Message-State: AOAM531CXVvKMe0p5x2wMdfSDT2m2MP9UNjpDbd0+E0a0cuIGFmLFkoP
 I3PL+czEUElbeGkwpYeSFyVp9/t6+tcHzQtIcMDysA==
X-Google-Smtp-Source: ABdhPJy66/0ygdDNNmaiX8aIM3lYib1wPFFYTlfql4Va2kKFNVBaFF/bpgj5qupOZe30IA9Td/I6yj1suSu1DUiWdP0=
X-Received: by 2002:a05:6102:3e95:: with SMTP id
 m21mr7480325vsv.77.1637836184820; 
 Thu, 25 Nov 2021 02:29:44 -0800 (PST)
MIME-Version: 1.0
References: <CA+bd_6JS0t_COHiw2Y3Ej1gAeOGVTScNoS-=Seo+7udAe5wqZw@mail.gmail.com>
 <cc136013-2632-c149-d258-e2e7f964b07f@redhat.com>
In-Reply-To: <cc136013-2632-c149-d258-e2e7f964b07f@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 25 Nov 2021 03:29:34 -0700
Message-ID: <CANCZdfp=th2j0MkL1aKEkuxg9pp64bey7uSF4pt9vwVb8T_vMQ@mail.gmail.com>
Subject: Re: Give the fosshost.org VM a purpose or a retirement
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ff309b05d19a73c4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92b.google.com
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ff309b05d19a73c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 7:56 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 11/24/21 15:16, Cleber Rosa wrote:
> > Hi,
> >
> > Fosshost.org was kind enough to supply the QEMU project with a public
> > VM hosted by them.  The original use case we anticipated was to set up
> > a GitLab CI runner, because we assumed the VM was KVM capable, but
> > that turned out not to be the case.
> >
> > So, at this point, adding it as a GitLab CI runner would not add any
> > significant improvement over the shared runners already provided, and
> > it would require more maintenance effort.
> >
> > If there are any ideas for making use of this resource, and volunteers
> > to configure and maintain it, please let me know.
> >
> > Otherwise, it seems fair to relinquish the resource back to Fosshost.or=
g.
>
> Cc'ing Warner, since for FreeBSD testing we use Cirrus-CI (via
> libvirt-ci and have sometime hit GitLab timeout). Series [*]
> provides most of what is required to register a FreeBSD runner.
> It could be useful to run the user-mode tests.
>

Indeed. I'd forgotten about this series. I'll take a look at this and/or
the fosshost.org stuff...

Warner

--000000000000ff309b05d19a73c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 24, 2021 at 7:56 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 11/24/21 15:16, Cleber Rosa wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Fosshost.org was kind enough to supply the QEMU project with a public<=
br>
&gt; VM hosted by them.=C2=A0 The original use case we anticipated was to s=
et up<br>
&gt; a GitLab CI runner, because we assumed the VM was KVM capable, but<br>
&gt; that turned out not to be the case.<br>
&gt; <br>
&gt; So, at this point, adding it as a GitLab CI runner would not add any<b=
r>
&gt; significant improvement over the shared runners already provided, and<=
br>
&gt; it would require more maintenance effort.<br>
&gt; <br>
&gt; If there are any ideas for making use of this resource, and volunteers=
<br>
&gt; to configure and maintain it, please let me know.<br>
&gt; <br>
&gt; Otherwise, it seems fair to relinquish the resource back to Fosshost.o=
rg.<br>
<br>
Cc&#39;ing Warner, since for FreeBSD testing we use Cirrus-CI (via<br>
libvirt-ci and have sometime hit GitLab timeout). Series [*]<br>
provides most of what is required to register a FreeBSD runner.<br>
It could be useful to run the user-mode tests.<br></blockquote><div><br></d=
iv><div>Indeed. I&#39;d forgotten about this series. I&#39;ll take a look a=
t this and/or</div><div>the <a href=3D"http://fosshost.org">fosshost.org</a=
> stuff...</div><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000ff309b05d19a73c4--

