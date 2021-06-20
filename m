Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFEF3ADF29
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 17:10:24 +0200 (CEST)
Received: from localhost ([::1]:50006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luz5b-00085m-66
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 11:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenta@lithdew.net>) id 1luz4p-0007QB-7j
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 11:09:35 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kenta@lithdew.net>) id 1luz4m-0004Tw-6q
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 11:09:34 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id j15so7801258vsf.2
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lithdew-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yOHejcRoolrzs9geVsAnwQx8shREcYcaYz16bDdR49Q=;
 b=RPfVw6DXQq/G7sNF0+B11DD2lncb/XkReqSd39emtd7Z74gMRxSyD3FMAxMYkOW64T
 uIAN8l+iJQPuRZJ6jJqrE6N12oH2rq/7ZOHyaW8F0ylgZoIIZ4ju/kDyVk1nxMtINiQH
 xyZU6xnZ4psCXf06uRP7MqEO+qtKKqo74Ce7CgBmrLWLYBXOKlg4jrKOcyhBsRIMAP7y
 LNS6eb58IfCJjwKYTknvv2ha+CQ61b4W/k3b1A4SxLT1g6Jur72redzz/XDriIww9L5V
 7UKMv3ZOAAQRaVU4csOyAGuI32tsNIBDrl4YfOWFvHBoMHxz4kMvb4ad/Wysy44G/F3D
 yOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yOHejcRoolrzs9geVsAnwQx8shREcYcaYz16bDdR49Q=;
 b=k8jDC9LA3dQ2PEborGm4+kAuptncAH+baY0WUAQTMTFucOxsnsv2fMnKlK8XEwjty+
 AlMt/B+ItyWyW8KnwQBcfR6NvxMC6YP+rdalH6ovdRHONWblqDN8StIOFEvZfUtO1HLW
 biTExrT8WlCtV7sVWCKkQvJGmKkIunhgOfte4tw04w+VPvbAEF+mx9cgnihextprHvP+
 nv/7DSIllh3BEFaY4FGAsHolrl+wEsEXyRaiZPvsgDxMjeLevqxBBQVOmFua/ysUSTYM
 +nt9uKEiCYuovu2mwQmUgrMtyAFZ9UssAOcEsOGP4/gxLgss7h1db1VggZDIXcbadYj8
 LmGQ==
X-Gm-Message-State: AOAM5337SZfbqobkNSnonHvZJOjq9S3oeO8M+hhWBfkIZ+TNsH7dEuSJ
 amNqUYVzPIcDulcu12XYOZMPNqL2njPIuoULw3ZLWw==
X-Google-Smtp-Source: ABdhPJwYGfCgaR171wP+tcLR1PIp2ge6Ye6pfF1aX9UyS7E8H+cotJ8oFgIIrXLirAnRAEHiTUS9Zx8QILQz0WDZ8Yw=
X-Received: by 2002:a05:6102:2159:: with SMTP id
 h25mr13619670vsg.19.1624201769741; 
 Sun, 20 Jun 2021 08:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210516091536.1042693-1-kenta@lithdew.net>
 <aee50099-14a8-1c6b-6142-a4363f75812d@vivier.eu>
 <CAO4V76-aCeNq8OpTptSxywj+pV22EHNF-osWtR3onWMvGSSX+Q@mail.gmail.com>
 <03b2fce0-ad6a-bdb9-0171-f4562b640b70@vivier.eu>
In-Reply-To: <03b2fce0-ad6a-bdb9-0171-f4562b640b70@vivier.eu>
From: Kenta Iwasaki <kenta@lithdew.net>
Date: Mon, 21 Jun 2021 00:09:18 +0900
Message-ID: <CAO4V768DsTFXtWH-oUvJ6mv7Gb9pLbrgWo2dA78E75S68ifBDw@mail.gmail.com>
Subject: Re: [PATCH] linux-user/syscall: zero-init msghdr in
 do_sendrecvmsg_locked
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="0000000000008781da05c533f121"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=kenta@lithdew.net; helo=mail-vs1-xe2b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008781da05c533f121
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No worries, though I would also like to apologize as I find that the
explanation I gave in my last email was a little all over the place.

To clarify my last e-mail, I believe the current msghdr struct layout in
QEMU is libc-agnostic, but not kernel agnostic. Rather, the current msghdr
struct layout defined in QEMU follows the definition of the Linux kernel's
own struct layout of msghdr, which isn't compliant with POSIX.

Zeroing the bytes in the patch I provided, which is a trick used in musl
libc as well to be both kernel-agnostic and libc-agnostic, would make
QEMU's struct layout definition of msghdr be both kernel-agnostic to all
kernels adhering to the POSIX standard, and libc-agnostic as well.

Best regards,
Kenta Iwasaki

On Sun, 20 Jun 2021 at 23:56, Laurent Vivier <laurent@vivier.eu> wrote:

> Le 16/05/2021 =C3=A0 14:57, Kenta Iwasaki a =C3=A9crit :
> > Sure,
> >
> > The bytes of `msghdr` need to be cleared because the `msghdr` struct
> layout specified in QEMU
> > appears to generalize between the definitions of `msghdr` across
> different libc's and kernels. To
> > appropriately generalize `msghdr` across libc's and kernels would eithe=
r:
> >
> > 1. require specializing code in do_sendrecvmsg_locked() for each
> individual libc and kernel version, or
> > 2. zeroing out all bytes of `msghdr`, b/c certain libc or kernel
> versions may misinterpret the
> > undefined padding bytes that come from misalignment in the struct as
> actual syscall params.
> >
> > The patch I provided would be going for route #2, given that it's a
> simpler fix for the underlying
> > problem for the short term.
> >
> > What I believe is the background behind why the struct layout has been =
a
> problem is because, since
> > the beginning, the Linux kernel has always specified the layout of
> `msghdr` differently from POSIX.
> > Given that this implies incompatibility between kernels on how `msghdr`
> is specified, different libc
> > projects such as musl and glibc provide different workarounds by laying
> out `msghdr` differently
> > amongst one another.
> >
> > A few projects running tests/applications through QEMU have been bitten
> by this, and a solution that
> > one of the projects discovered was that patching QEMU to zero-initializ=
e
> the bytes msghdr the same
> > way my patch does allow for compatibility between different `msghdr`
> layouts across glibc, musl, and
> > the Linux kernel:
> https://github.com/void-linux/void-packages/issues/23557#issuecomment-718=
392360
> > <
> https://github.com/void-linux/void-packages/issues/23557#issuecomment-718=
392360
> >
> >
> > For some additional useful context, here's a link pointing changes musl
> libc made to laying out
> > `msghdr` b/c of Linux incorrectly laying out `msghdr` against the POSIX
> standard:
> >
> http://git.musl-libc.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e=
3b39fbb021c5a64
> > <
> http://git.musl-libc.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e=
3b39fbb021c5a64
> >
> >
> > Also, here is a link to the `msghdr` struct layout in musl libc's
> bleeding edge branch as of
> > now: https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n22
> > <https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n22>
> >
> > As for my rationale for sending in this patch, it is because I'm
> currently implementing
> > cross-platform networking in the standard library for the Zig
> programming language, and have run
> > into this exact same problem with EMSGSIZE being returned by sendmsg()
> when tests are run through
> > QEMU on x86_64-linux-musl.
> >
> > My discussions with the Zig community about it alongside debug logs
> regarding the exact parameters
> > being fed to the sendmsg() syscall can be found
> > here: https://github.com/ziglang/zig/pull/8750#issuecomment-841641576
> > <https://github.com/ziglang/zig/pull/8750#issuecomment-841641576>
> >
> > Hope this gives enough context about the problem and patch, but please
> do let me know if there is
> > any more information that I could provide which would help.
>
> Thank you for the explanation and sorry for the delay.
>
> As we use directly the kernel syscall rather than the libc wrapper we
> should not use here the msghdr
> definition from the libc but the one from the kernel.
>
> The one we receive is also the one from the kernel as we trap the kernel
> syscall not the libc call.
>
> So the code should be libc-agnostic...
>
> The reference implementation in our case is 'struct user_msghdr' from the
> kernel, and we need to
> duplicate it in QEMU to be able to use it.
>
> Thanks,
> LAurent
>
>

--0000000000008781da05c533f121
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No worries, though I would also like to apologize as I fin=
d that the explanation I gave in my last email was a little all over the pl=
ace.<div><br></div><div>To clarify my last e-mail, I believe the current ms=
ghdr struct layout in QEMU=C2=A0is libc-agnostic, but not kernel agnostic. =
Rather, the current msghdr struct layout defined in QEMU follows the defini=
tion of the Linux kernel&#39;s own struct layout of msghdr, which isn&#39;t=
 compliant with POSIX.</div><div><br></div><div>Zeroing the bytes in the pa=
tch I provided, which is a trick used in musl libc as well to be both kerne=
l-agnostic and libc-agnostic, would make QEMU&#39;s struct layout definitio=
n of msghdr be both kernel-agnostic to all kernels adhering to the POSIX st=
andard, and libc-agnostic as well.</div><div><br></div><div>Best regards,</=
div><div>Kenta Iwasaki</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, 20 Jun 2021 at 23:56, Laurent Vivier =
&lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 16/05/2021 =C3=
=A0 14:57, Kenta Iwasaki a =C3=A9crit=C2=A0:<br>
&gt; Sure,<br>
&gt; <br>
&gt; The bytes of `msghdr` need to be cleared because the `msghdr` struct l=
ayout specified in QEMU<br>
&gt; appears to generalize between the definitions of `msghdr` across diffe=
rent libc&#39;s and kernels. To<br>
&gt; appropriately=C2=A0generalize `msghdr` across libc&#39;s and kernels w=
ould either:<br>
&gt; <br>
&gt; 1. require specializing code in do_sendrecvmsg_locked() for each indiv=
idual libc and kernel version, or<br>
&gt; 2. zeroing out all bytes of `msghdr`, b/c certain libc or kernel versi=
ons may misinterpret the<br>
&gt; undefined padding bytes that come from misalignment in the struct as a=
ctual syscall params.<br>
&gt; <br>
&gt; The patch I provided would be going for route #2, given that it&#39;s =
a simpler fix for the underlying<br>
&gt; problem for the short term.<br>
&gt; <br>
&gt; What I believe is the background behind why the struct layout has been=
 a problem is because, since<br>
&gt; the beginning, the Linux kernel has always specified the layout of `ms=
ghdr` differently from POSIX.<br>
&gt; Given that this implies incompatibility between kernels on how `msghdr=
` is specified, different libc<br>
&gt; projects such as musl and glibc provide different workarounds by layin=
g out `msghdr` differently<br>
&gt; amongst one another.<br>
&gt; <br>
&gt; A few projects running tests/applications through QEMU have been bitte=
n by this, and a solution that<br>
&gt; one of the projects discovered was that patching QEMU to zero-initiali=
ze the bytes msghdr the same<br>
&gt; way my patch does allow for compatibility between different `msghdr` l=
ayouts across glibc, musl, and<br>
&gt; the Linux kernel: <a href=3D"https://github.com/void-linux/void-packag=
es/issues/23557#issuecomment-718392360" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/void-linux/void-packages/issues/23557#issuecomment-718=
392360</a><br>
&gt; &lt;<a href=3D"https://github.com/void-linux/void-packages/issues/2355=
7#issuecomment-718392360" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/void-linux/void-packages/issues/23557#issuecomment-718392360</a>&gt;=
<br>
&gt; <br>
&gt; For some additional useful context, here&#39;s a link pointing changes=
 musl libc made to laying out<br>
&gt; `msghdr` b/c of Linux incorrectly laying out `msghdr` against the POSI=
X standard:<br>
&gt; <a href=3D"http://git.musl-libc.org/cgit/musl/commit/?id=3D7168790763c=
deb794df52be6e3b39fbb021c5a64" rel=3D"noreferrer" target=3D"_blank">http://=
git.musl-libc.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e3b39fbb02=
1c5a64</a><br>
&gt; &lt;<a href=3D"http://git.musl-libc.org/cgit/musl/commit/?id=3D7168790=
763cdeb794df52be6e3b39fbb021c5a64" rel=3D"noreferrer" target=3D"_blank">htt=
p://git.musl-libc.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e3b39f=
bb021c5a64</a>&gt;<br>
&gt; <br>
&gt; Also, here is a link to the `msghdr` struct layout in musl libc&#39;s =
bleeding edge branch as of<br>
&gt; now:=C2=A0<a href=3D"https://git.musl-libc.org/cgit/musl/tree/include/=
sys/socket.h#n22" rel=3D"noreferrer" target=3D"_blank">https://git.musl-lib=
c.org/cgit/musl/tree/include/sys/socket.h#n22</a><br>
&gt; &lt;<a href=3D"https://git.musl-libc.org/cgit/musl/tree/include/sys/so=
cket.h#n22" rel=3D"noreferrer" target=3D"_blank">https://git.musl-libc.org/=
cgit/musl/tree/include/sys/socket.h#n22</a>&gt;<br>
&gt; <br>
&gt; As for my rationale for sending in this patch, it is because I&#39;m c=
urrently implementing<br>
&gt; cross-platform networking in the standard library for the Zig programm=
ing language, and have run<br>
&gt; into this exact same problem with EMSGSIZE being returned by sendmsg()=
 when tests are run through<br>
&gt; QEMU on x86_64-linux-musl.<br>
&gt; <br>
&gt; My discussions with the Zig community about it alongside debug logs re=
garding the exact parameters<br>
&gt; being fed to the sendmsg() syscall can be found<br>
&gt; here:=C2=A0<a href=3D"https://github.com/ziglang/zig/pull/8750#issueco=
mment-841641576" rel=3D"noreferrer" target=3D"_blank">https://github.com/zi=
glang/zig/pull/8750#issuecomment-841641576</a><br>
&gt; &lt;<a href=3D"https://github.com/ziglang/zig/pull/8750#issuecomment-8=
41641576" rel=3D"noreferrer" target=3D"_blank">https://github.com/ziglang/z=
ig/pull/8750#issuecomment-841641576</a>&gt;<br>
&gt; <br>
&gt; Hope this gives enough context about the problem and patch, but please=
 do let me know if there is<br>
&gt; any more information that I could provide which would help.<br>
<br>
Thank you for the explanation and sorry for the delay.<br>
<br>
As we use directly the kernel syscall rather than the libc wrapper we shoul=
d not use here the msghdr<br>
definition from the libc but the one from the kernel.<br>
<br>
The one we receive is also the one from the kernel as we trap the kernel sy=
scall not the libc call.<br>
<br>
So the code should be libc-agnostic...<br>
<br>
The reference implementation in our case is &#39;struct user_msghdr&#39; fr=
om the kernel, and we need to<br>
duplicate it in QEMU to be able to use it.<br>
<br>
Thanks,<br>
LAurent<br>
<br>
</blockquote></div>

--0000000000008781da05c533f121--

