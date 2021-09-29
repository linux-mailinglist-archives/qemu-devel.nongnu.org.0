Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8458541C647
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:05:10 +0200 (CEST)
Received: from localhost ([::1]:48832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaCq-0004ex-CG
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVa6p-0008N1-Ur
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:58:55 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVa6n-0007vv-SF
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:58:55 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id u32so5514842ybd.9
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nEUzRpobHJ0BevXyjehBle8OtjIiQpNaGkV5LtlPW5A=;
 b=aM5al2xrXfAayHsegw67b2SxmWS5DGOfveA9dD4MDf2oqDInMpZpGjVhtAgx6eHxnU
 IE6o6XzzbUSTqn7gWAhjb6ZNcKnTfzG8gMjFNI0srLESC21dHvUabz4sbV5Jm/qxaRr3
 2QhAvGxMzB1pFaUrjZ/a/QZM03TcyyH0ffpZuPrQsKy+//eQA8KZIoPg+uzGljhVyxP9
 kdLZOlKfcE/wOpPFeWBwyvz883ApzOvgfDsiD+i7QCm6qft8IvULVV/WwiH+N5J9rrYS
 ze+aAUxw3Er52rE0aMQemeC6xGI2KjAsNOW5+Aj/B7gIjGPFetyazseRjiuzd8WtmxsP
 Kw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nEUzRpobHJ0BevXyjehBle8OtjIiQpNaGkV5LtlPW5A=;
 b=XMMw5k5LdDQLaxrca/X1t3Umda1VbQP7b6bCYjtZP/bRSvSQ2aLXCv0bS+y2D5ymBG
 vu2jf6kTDDOMvLZ0a5vZl2oPXtyrjnRI2xmMUzmnDK35oxFyf83eGyuLse10lvHrgD2A
 Hu0em+KjhZAtMDdJMVIpmHnyRqEM0h6LKtDWYGuCkJ2I8+c4DDpSap+4bgsnpNBZNvLr
 p8RF3nu8moRcJklSEoQ/dkNrWCZA9GEWRDh67q1Wob0Eacwtqp7e7DSaW2lk+aDq/I41
 FWO5EVwjj5KgDCLsjX7vAGTAtBsAsb3G6DhkUJpZ+DK9xt7m28A6/PDYSyTmQLd5j27L
 QKsw==
X-Gm-Message-State: AOAM5333fMyb+yw08YF7ScnLoZV6xR3wEA5XJhdznZRg4D/J+s1/eypy
 vU2zntSXPZ5D/dPginUat6rCtQoJZYqd0ukTOng9QA==
X-Google-Smtp-Source: ABdhPJxFsvmMru4tXpIzEDmQxB38cGpLsVZYt5k8w6m5qp9svCZLGQzJwxjQ58NGwegQoE4ILcOqZtB29NMi8JzE0QM=
X-Received: by 2002:a25:21c2:: with SMTP id
 h185mr13384362ybh.495.1632923932473; 
 Wed, 29 Sep 2021 06:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210927215545.3930309-1-eblake@redhat.com>
 <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
 <97e67c45-21f9-2630-7173-991d01871116@redhat.com>
In-Reply-To: <97e67c45-21f9-2630-7173-991d01871116@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Wed, 29 Sep 2021 09:58:39 -0400
Message-ID: <CAFXwXrnZzyUBSikVr6uFLHQeD5hWcXDq+eG=uwBC5xQ8FVivmg@mail.gmail.com>
Subject: Re: [PULL 00/20] NBD patches through 2021-09-27
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f0d1e305cd22ba28"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f0d1e305cd22ba28
Content-Type: text/plain; charset="UTF-8"

On Wed, 29 Sep 2021, 08:42 Paolo Bonzini, <pbonzini@redhat.com> wrote:

> On 29/09/21 10:59, Peter Maydell wrote:
> > This seems to break the gitlab cross-i386-system build,
> > which now fails to link qemu-nbd because it is trying
> > to link the x86-64 libselinux.so into a 32-bit binary:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/1630661323
> >
> > cc -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,--as-needed
> > -Wl,--no-undefined -pie -Wl,--whole-archive libblockdev.fa libblock.fa
> > libcrypto.fa libauthz.fa libqom.fa libio.fa -Wl,--no-whole-archive
> > -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m32 -m32
> > -fstack-protector-strong -Wl,--start-group libqemuutil.a
> > libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa
> > @block.syms /usr/lib/libgnutls.so /usr/lib64/libselinux.so -lutil
> > -L/usr/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0 -L/usr/lib -lgio-2.0
> > -lgobject-2.0 -lglib-2.0 -lm -pthread -L/usr/lib -lgmodule-2.0
> > -lglib-2.0 /usr/lib/libpixman-1.so /usr/lib/libzstd.so
> > /usr/lib/libz.so -Wl,--end-group
> > /usr/bin/ld: /usr/lib64/libselinux.so: error adding symbols: file in
> > wrong format
> > collect2: error: ld returned 1 exit status
>
> Missing libselinux-devel.i686 in
> tests/docker/dockerfiles/fedora-i386-cross.docker, I think?
>

But additionally, incorrect package probing, I think.

r~

>

--000000000000f0d1e305cd22ba28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div data-smartmail=3D"gmail_signature">On Wed, 29 S=
ep 2021, 08:42 Paolo Bonzini, &lt;<a href=3D"mailto:pbonzini@redhat.com">pb=
onzini@redhat.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On 29/09/21 10:59, Peter Maydell wrote:<br>
&gt; This seems to break the gitlab cross-i386-system build,<br>
&gt; which now fails to link qemu-nbd because it is trying<br>
&gt; to link the x86-64 libselinux.so into a 32-bit binary:<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/1630661323" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/jobs/1630661323</a><br>
&gt; <br>
&gt; cc -o qemu-nbd qemu-nbd.p/qemu-nbd.c.o -Wl,--as-needed<br>
&gt; -Wl,--no-undefined -pie -Wl,--whole-archive libblockdev.fa libblock.fa=
<br>
&gt; libcrypto.fa libauthz.fa libqom.fa libio.fa -Wl,--no-whole-archive<br>
&gt; -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -m32 -m32<br>
&gt; -fstack-protector-strong -Wl,--start-group libqemuutil.a<br>
&gt; libblockdev.fa libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa=
<br>
&gt; @block.syms /usr/lib/libgnutls.so /usr/lib64/libselinux.so -lutil<br>
&gt; -L/usr/lib -lgio-2.0 -lgobject-2.0 -lglib-2.0 -L/usr/lib -lgio-2.0<br>
&gt; -lgobject-2.0 -lglib-2.0 -lm -pthread -L/usr/lib -lgmodule-2.0<br>
&gt; -lglib-2.0 /usr/lib/libpixman-1.so /usr/lib/libzstd.so<br>
&gt; /usr/lib/libz.so -Wl,--end-group<br>
&gt; /usr/bin/ld: /usr/lib64/libselinux.so: error adding symbols: file in<b=
r>
&gt; wrong format<br>
&gt; collect2: error: ld returned 1 exit status<br>
<br>
Missing libselinux-devel.i686 in <br>
tests/docker/dockerfiles/fedora-i386-cross.docker, I think?<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">But additionally=
, incorrect package probing, I think.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">r~</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000f0d1e305cd22ba28--

