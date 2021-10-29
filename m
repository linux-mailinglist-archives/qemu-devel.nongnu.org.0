Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAED43F67D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:18:16 +0200 (CEST)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKHJ-0007RX-L3
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgJbb-0007mW-9I
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:35:03 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:43711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgJbW-000861-IA
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:35:02 -0400
Received: by mail-ua1-x930.google.com with SMTP id v3so15788406uam.10
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JigSUszdFF99eBpIfI2yBV3fuMe3T7frvlh/SubSsFA=;
 b=Q+9PLpLcxdZ+0EeAfaruo9AJaZIFfTomsAE2BOzfqpVrHmd44A3HUWcQBAZyHXzCuW
 MvzyEfP6WSsJXmhpf2qrP/q88Spf1C9nAZzk9uwvVOfOnhmfX4Ydo4fY3bMbcZNquyIf
 nXtCDX/CyOlFmpZMeop0FeAdMWQxa6lAZYvtj+9qdaGT3Tc0ylfaHgUZwwf4Vc2bwVwE
 1jTY/WkzE0+astw+WsIQ5ny6C29QcPlgL5f1LfS63ByqsugMf1Js6u/5xaUKHxFqBm8Q
 SD6e2SX0Fwlthmiz+5wYUXH82Pn94s9hRzz2zBV6i8yOfSdYTDVL+QTZbGGTT0jl7wp4
 jTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JigSUszdFF99eBpIfI2yBV3fuMe3T7frvlh/SubSsFA=;
 b=cLKQO6NyhgmzRyOXxYUeQh8IZY600F8O296UFEyK4OAxufXQTfC+QgUoUpV2Lyx7El
 KikyJohwG+RcyccPAL9TBfbg4d5ODTClaxyg2BderFfxuywQV5LTM0W3Dc/EqzbM8Aib
 Tc5qjD8f59to58erKkWMrxZEIK48oUnE3UmRY7AGLEF2X+5YPcehRapfOPuPmWfPVpBb
 hBB/kxGTZmvPFYipuRnBd1ZtK3msLtmxy7xh3xOsWA0uPKHEqWwxyo0w57kdq0AzZCOK
 D16zeez+qagISkNnt1tfsLZtzai9F52CAVH4TcVqNFQ4ii9Hs9tCqwTbM9GL3Ji1coCv
 Y6BA==
X-Gm-Message-State: AOAM5315gadFE9QCSOJuvnsJPSB1uzFu0QIiezRm6Gx4q9quxW4ITBMl
 7GTBsRWBUpo8I3XKOWiTTpWpI2naCnZ2TlHuuvq8dA==
X-Google-Smtp-Source: ABdhPJwFSUVUWWtGUbsxJpxXfl8/7hc6l3b8dZr9yaz9zmfxBVHNZQPMlTDUNFLLbOJxe+UxqZDoBRnlhSa0VG+ORjU=
X-Received: by 2002:ab0:7542:: with SMTP id k2mr9787803uaq.69.1635482097050;
 Thu, 28 Oct 2021 21:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-23-imp@bsdimp.com>
 <344ac222-daa9-c752-8c6a-21773efb8656@linaro.org>
 <CANCZdfo8b2uO=g_mGbZx8241nB8qytAsAD-E4nh7MLDCt9KGgw@mail.gmail.com>
In-Reply-To: <CANCZdfo8b2uO=g_mGbZx8241nB8qytAsAD-E4nh7MLDCt9KGgw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 22:34:47 -0600
Message-ID: <CANCZdfq2y52MxKzjmDAijP6rhZYJWoEXYMgR9g+XVm-bQtRzeA@mail.gmail.com>
Subject: Re: [PATCH 22/24] bsd-user/arm/target_arch_signal.h: arm set_mcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006e76ab05cf765913"
Received-SPF: none client-ip=2607:f8b0:4864:20::930;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x930.google.com
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
Cc: Stacey Son <sson@freebsd.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Klye Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006e76ab05cf765913
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 6:07 PM Warner Losh <imp@bsdimp.com> wrote:

>
>
> On Thu, Oct 28, 2021 at 11:53 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 10/19/21 9:44 AM, Warner Losh wrote:
>> > +    regs->regs[15] = tswap32(gr[TARGET_REG_PC]);
>> > +    cpsr = tswap32(gr[TARGET_REG_CPSR]);
>> > +    cpsr_write(regs, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
>>
>> Hmm.  What's the expected behaviour if the saved CPSR state does not
>> match the PC state
>> wrt thumb?
>>
>> I'm ok if this should fail in spectacular ways, I just wanna know.
>>
>> I *think* what will happen at the moment is that qemu will go into a
>> whacky state in which
>> the translator will read and interpret unaligned data.
>>
>> I have a pending patch set for arm to raise unaligned exceptions for
>> mis-aligned pc.  For
>> arm32 mode, this is fine, and we'll raise the exception.  But for thumb
>> mode, this is
>> architecturally impossible, and the translator will assert.
>>
>> The assert is going to be a problem.  There are a couple of options:
>>
>> (1) TARGET_REG_PC wins: unset PC[0] and adjust CPSR[T] to match.
>>
>> (2) CPSR_T wins: unset pc[0] if CPSR[T] is set, unchanged otherwise.  (In
>> the Arm ARM
>> psueodcode, pc[0] is hardwired to 0 in thumb mode.)
>>
>> (3) Don't worry about matching PC[0] and CPSR[T], but do prevent an
>> impossible situation
>> and unset PC[0] always.  If PC[1] is set, and CPSR[T] is unset, then
>> we'll raise unaligned
>> when the cpu restarts.
>>
>
> Consider this program:
> #include <signal.h>
> #include <stdio.h>
> #include <unistd.h>
> int g;
> void fortytwo(int arg) { g = 42; }
> int main(int argc, char **argv) {
>         g = 123;
>         signal(SIGALRM, fortytwo); alarm(1); pause();
>         printf("G is %d\n", g);
> }
>
> Built for 'arm' I get
> G is 42
> Build -mthumb I get
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> Segmentation fault
>
> So even without your new assert, there are some issues I need to look into
> before I can
> get to this very interesting case :(. These are all good questions,
> though. I clearly have
> some work to do here...
>

Turns out I just needed to filter things correctly, and the changes to
bsd-user/arm/target_arch_thread.h
made the thumb signals work. I've not yet written tests that run T32
instructions and get a A32
signal (or vice versa). I've also not tried to do the same with T32 and A32
threads (well, threads
executing in those two modes and switching between them). That is beyond
the scope of this
set of patches, though.

Real FreeBSD blindly sets these values and hopes the processor generates a
fault for invalid states.
With the filtering I added for the next round, we'll at least ensure that
PC[0] == CPSR[T]. This ensures
consistency, but I don't know how well it will fare in the real world.
FreeBSD's thumb support wrt
mcontext and thumb has only recently become more robust, but it doesn't
check in the kernel.


> And, finally, you're missing the mc_vfp_* handling.
>>
>
> Yes. We don't really support that at the moment, but I'll look into how
> hard that might be
> to add.
>

I've added it here and in get_mcontext too.

I'll also include an up-to-date copy of a pointer to the tip of the
bsd-user fork so you can
see the current state of thigns like signal.c, which I have penciled in for
after the aarch
and riscv64 patches that I have lined up (but haven't done the common
errors between the
archs yet). Since I'd either need to seen a super-large review or delay
things somewhat
for signal.c, I'd like to get the other architectures in since they are
almost ready unless there's
a compelling reason to do signal.c and all its dependencies next. But
that's getting a bit far
afield from this one patch....

And thank you for finding this and the other hard issues with this series!
It's been instructive
and gives me a few things to double check on the other, unsent series.

Warner

--0000000000006e76ab05cf765913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 6:07 PM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, Oct 28, 2021 at 11:53 AM Richard Henderson &l=
t;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">richard=
.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
&gt; +=C2=A0 =C2=A0 regs-&gt;regs[15] =3D tswap32(gr[TARGET_REG_PC]);<br>
&gt; +=C2=A0 =C2=A0 cpsr =3D tswap32(gr[TARGET_REG_CPSR]);<br>
&gt; +=C2=A0 =C2=A0 cpsr_write(regs, cpsr, CPSR_USER | CPSR_EXEC, CPSRWrite=
ByInstr);<br>
<br>
Hmm.=C2=A0 What&#39;s the expected behaviour if the saved CPSR state does n=
ot match the PC state <br>
wrt thumb?<br>
<br>
I&#39;m ok if this should fail in spectacular ways, I just wanna know.<br>
<br>
I *think* what will happen at the moment is that qemu will go into a whacky=
 state in which <br>
the translator will read and interpret unaligned data.<br>
<br>
I have a pending patch set for arm to raise unaligned exceptions for mis-al=
igned pc.=C2=A0 For <br>
arm32 mode, this is fine, and we&#39;ll raise the exception.=C2=A0 But for =
thumb mode, this is <br>
architecturally impossible, and the translator will assert.<br>
<br>
The assert is going to be a problem.=C2=A0 There are a couple of options:<b=
r>
<br>
(1) TARGET_REG_PC wins: unset PC[0] and adjust CPSR[T] to match.<br>
<br>
(2) CPSR_T wins: unset pc[0] if CPSR[T] is set, unchanged otherwise.=C2=A0 =
(In the Arm ARM <br>
psueodcode, pc[0] is hardwired to 0 in thumb mode.)<br>
<br>
(3) Don&#39;t worry about matching PC[0] and CPSR[T], but do prevent an imp=
ossible situation <br>
and unset PC[0] always.=C2=A0 If PC[1] is set, and CPSR[T] is unset, then w=
e&#39;ll raise unaligned <br>
when the cpu restarts.<br></blockquote><div><br></div><div>Consider this pr=
ogram:</div><div>#include &lt;signal.h&gt;<br>#include &lt;stdio.h&gt;<br>#=
include &lt;unistd.h&gt;<br>int g;<br>void=C2=A0fortytwo(int arg)=C2=A0{=C2=
=A0g =3D 42;=C2=A0}<br>int=C2=A0main(int argc, char **argv)=C2=A0{<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 g =3D 123;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 signal(S=
IGALRM, fortytwo);=C2=A0alarm(1);=C2=A0pause();<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;G is %d\n&quot;, g);<br>}<br></div><div><br></div><div>Bui=
lt for &#39;arm&#39; I get</div><div>G is 42</div><div>Build -mthumb I get<=
/div><div>qemu: uncaught target signal 11 (Segmentation fault) - core dumpe=
d<br>Segmentation fault<br></div><div><br></div><div>So even without your n=
ew assert, there are some issues I need to look into before I can</div><div=
>get to this very interesting case :(. These are all good questions, though=
. I clearly have</div><div>some work to do here...</div></div></div></block=
quote><div><br></div><div>Turns out I just needed to filter things correctl=
y, and the changes to bsd-user/arm/target_arch_thread.h</div><div>made the =
thumb signals work. I&#39;ve not yet written tests that run T32 instruction=
s and get a A32</div><div>signal (or vice versa). I&#39;ve also not tried t=
o do the same with T32 and A32 threads (well, threads</div><div>executing i=
n those two modes and switching between them). That is beyond the scope of =
this</div><div>set of patches, though.<br></div><div><br></div><div>Real Fr=
eeBSD blindly sets these values and hopes the processor generates a fault f=
or invalid states.</div><div>With the filtering I added for the next round,=
 we&#39;ll at least ensure that PC[0] =3D=3D CPSR[T]. This ensures</div><di=
v>consistency, but I don&#39;t know how well it will fare in the real world=
. FreeBSD&#39;s thumb support wrt</div><div>mcontext and thumb has only rec=
ently become more robust, but it doesn&#39;t check in the kernel.<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">And, finally, you&#39;re missing the mc_vfp_* handling.<br></blo=
ckquote><div><br></div><div>Yes. We don&#39;t really support that at the mo=
ment, but I&#39;ll look into how hard that might be</div><div>to add.</div>=
</div></div></blockquote><div><br></div><div>I&#39;ve added it here and in =
get_mcontext too.</div><div><br></div><div>I&#39;ll also include an up-to-d=
ate copy of a pointer to the tip of the bsd-user fork so you can</div><div>=
see the current state of thigns like signal.c, which I have penciled in for=
 after the aarch</div><div>and riscv64 patches that I have lined up (but ha=
ven&#39;t done the common errors between the</div><div>archs yet). Since I&=
#39;d either need to seen a super-large review or delay things somewhat</di=
v><div>for signal.c, I&#39;d like to get the other architectures in since t=
hey are almost ready unless there&#39;s</div><div>a compelling reason to do=
 signal.c and all its dependencies next. But that&#39;s getting a bit far</=
div><div>afield from this one patch....</div><div><br></div><div>And thank =
you for finding this and the other hard issues with this series! It&#39;s b=
een instructive</div><div>and gives me a few things to double check on the =
other, unsent series.<br></div><div><br></div><div>Warner<br></div></div></=
div>

--0000000000006e76ab05cf765913--

