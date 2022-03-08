Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397534D1A18
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 15:11:45 +0100 (CET)
Received: from localhost ([::1]:48074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRaYy-0002Uo-Ad
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 09:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nRaXV-0001i5-Uv
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:10:13 -0500
Received: from [2607:f8b0:4864:20::a2b] (port=43835
 helo=mail-vk1-xa2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nRaXT-0000aq-QD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:10:13 -0500
Received: by mail-vk1-xa2b.google.com with SMTP id s195so7812032vkb.10
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77mBmcJKjcECUUhQCIBxcO1N51y+M4OMQisC5DP5rU4=;
 b=MQcurMvPUpcddQqSq3BGUeaGyJ+uUFfoM/6FTVjTEvS+/QO2SJ/SP+42i0lnnGoB8R
 QcCKCEApFd41EkKZ0mcGwD5sXRPjcv4eFd2fNcMAmluN3WDhwp91ZVMEn4SVy8UwcvTQ
 SY8enD5v6xZcEVbzrxwXuhFkN3anHw/h0OnEa0HrFWAetWbpTyuhiMcWQ0hQtvdhbAzk
 yfk+nwLZMG6QGZzrjHkspIEInQxAKlGIzap8kZlH58udhP70J9QfwetV5SK+zM1r/Ny7
 Ru1aq0/zoGHiyilR+vyLF2WI2lx6ml67PEdoLcrncgPYvGk5Y86GPo/MAJQNI81dSuOh
 ZLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77mBmcJKjcECUUhQCIBxcO1N51y+M4OMQisC5DP5rU4=;
 b=SWyMjEDd7A3RUbQgG3qQLczrCYnsEpVyBWzd+FsewFsiv+H+dIMyJpZr5MM5lC3jzl
 goyegjjtE0zrSn2LbvO1h3AU2lryeNLJJs4tKk7aatioQbJfn2voFcp/i/v/yVMLVxqC
 2819chmLpxf9GYgEgjlrWMbP++FkjzK3eLM7yvrGX35KX6sZs9n9mTBmrFdGvxZX4u30
 TbqsvFhEFFz/FTzSrTypBwIZKVoZx67CzOXUhxpTKlYrfzLf1nH1gD3gW2pbUmwWLd7N
 tR7TO7bski9v/wgkj8NBR7hAmoD2Ft6Zm4HhIZN282nbBItVOdrEkk4xBwrGYg32Bfy5
 sasg==
X-Gm-Message-State: AOAM532UyZZWxmLCKRItSUH0NfPXBl3nOo1KuFeAtANhhML7Zk8FIX9o
 sOw3Xjel/fn3xeNINzhM7eOiyZWmRv0lggVvYq9nkA==
X-Google-Smtp-Source: ABdhPJyxLDRrwn+0ukfDbDrFMdSSyNyN/sSSzYbXZUlsCSA7ppfyxPE1U+4rTzPa1xpOxwfuJ84R081eF18Ounp89IM=
X-Received: by 2002:ac5:c193:0:b0:336:e9e3:f571 with SMTP id
 z19-20020ac5c193000000b00336e9e3f571mr6683195vkb.26.1646748605990; Tue, 08
 Mar 2022 06:10:05 -0800 (PST)
MIME-Version: 1.0
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
In-Reply-To: <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 8 Mar 2022 07:09:55 -0700
Message-ID: <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
Subject: Re: Question about atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b1dcdd05d9b5893b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b1dcdd05d9b5893b
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 7, 2022 at 10:00 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/7/22 18:18, Warner Losh wrote:
> > I have a question related to the user-mode emulation and atomics. I
> asked on IRC, but
> > thinking about it, I think it may be too complex to discuss in that
> medium...
> >
> > In FreeBSD we have a system call that uses host atomic operations to
> interact memory that
> > userland also interacts with using atomic operations.
> >
> > In bsd-user we call the kernel with a special flag for dealing with
> 32-bit processes
> > running on a 64-bit kernel. In this case, we use 32-bit-sized atomics to
> set variables in
> > the address space of the bsd-user guest. This is used when running armv7
> binaries on amd64
> > hosts.
> >
> > First question: Is this expected to work? I know I'm a bit vague, so as
> a followup
> > question: If there's restrictions on this, what might they be? Do some
> classes of atomic
> > operations work, while others may fail or need additional cooperation?
> Are there any
> > conformance tests I could compile for FreeBSD/armv7 to test the
> hypothesis that atomic
> > operations are misbehaving?
>
> Yes, qatomic_foo is expected to work.  It's what we use across threads,
> and it is expected
> to work "in kernel mode", i.e. within cpu_loop().
>

Even when the writers are done in the context of system calls to the kernel?


> There are compile-time restrictions on the set of atomic operations,
> mostly based on what
> the host supports.  But anything that actually compiles is expected to
> work (there are a
> set of ifdefs if you need something more than the default).
>
> Beyond that, there is start_exclusive() / end_exclusive() which will
> stop-the-world and
> make sure that the current thread is the only one running.
>

So anything that happens in the BSD host kernel would need to be confined
to the one
and only on running thread? It also assumes only one thread is scheduled
and running
and that might be a source of 'brokeness' if there's an issue in the BSD
implementation
of the mechanisms that are used for that. And if the system call does this
w/o using
the start_exclusive/end_exclusive stuff, is that a problem?


> > Thanks for any help you might be able to give.
>
> Show the code in question?
>

Which code? The test cases that are failing, or the bsd-user code in the
branch I suspect?

Warner

--000000000000b1dcdd05d9b5893b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 7, 2022 at 10:00 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 3/7/22 18:18, Warner Losh wrote:<br>
&gt; I have a question related to the user-mode emulation and atomics. I as=
ked on IRC, but <br>
&gt; thinking about it, I think it may be too complex to discuss in that me=
dium...<br>
&gt; <br>
&gt; In FreeBSD we have a system call that uses host atomic operations to i=
nteract memory that <br>
&gt; userland also interacts with using atomic operations.<br>
&gt; <br>
&gt; In bsd-user we call the kernel with a special flag for dealing with 32=
-bit processes <br>
&gt; running on a 64-bit kernel. In this case, we use 32-bit-sized atomics =
to set variables in <br>
&gt; the address space of the bsd-user guest. This is used when running arm=
v7 binaries on amd64 <br>
&gt; hosts.<br>
&gt; <br>
&gt; First question: Is this expected to work? I know I&#39;m a bit vague, =
so as a followup <br>
&gt; question: If there&#39;s restrictions on this, what might they be? Do =
some classes of atomic <br>
&gt; operations work, while others may fail or need additional cooperation?=
 Are there any <br>
&gt; conformance tests I could compile for FreeBSD/armv7 to test the hypoth=
esis that atomic <br>
&gt; operations are misbehaving?<br>
<br>
Yes, qatomic_foo is expected to work.=C2=A0 It&#39;s what we use across thr=
eads, and it is expected <br>
to work &quot;in kernel mode&quot;, i.e. within cpu_loop().<br></blockquote=
><div><br></div><div>Even when the writers are done in the context of syste=
m calls to the kernel?</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
There are compile-time restrictions on the set of atomic operations, mostly=
 based on what <br>
the host supports.=C2=A0 But anything that actually compiles is expected to=
 work (there are a <br>
set of ifdefs if you need something more than the default).<br>
<br>
Beyond that, there is start_exclusive() / end_exclusive() which will stop-t=
he-world and <br>
make sure that the current thread is the only one running.<br></blockquote>=
<div><br></div><div>So anything that happens in the BSD host kernel would n=
eed to be confined to the one</div><div>and only on running thread? It also=
 assumes only one thread is scheduled and running</div><div>and that might =
be a source of &#39;brokeness&#39; if there&#39;s an issue in the BSD imple=
mentation</div><div>of the mechanisms that are used for that. And if the sy=
stem call does this w/o using</div><div>the start_exclusive/end_exclusive s=
tuff, is that a problem?</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
&gt; Thanks for any help you might be able to give.<br>
<br>
Show the code in question?<br></blockquote><div><br></div><div>Which code? =
The test cases that are failing, or the bsd-user code in the branch I suspe=
ct?</div><div><br></div><div>Warner</div></div></div>

--000000000000b1dcdd05d9b5893b--

