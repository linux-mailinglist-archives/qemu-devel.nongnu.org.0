Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C9F43F3BC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 02:13:14 +0200 (CEST)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgFWE-0002lU-3S
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 20:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgFQX-0000Tt-7T
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 20:07:21 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:40636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mgFQU-0000Ob-JZ
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 20:07:20 -0400
Received: by mail-ua1-x92f.google.com with SMTP id e2so14870108uax.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 17:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K51mCMm+68kFPdXojNgqY/rrH8VYnBt16Se+htBKma8=;
 b=i1XHzszyVemG91Kdudk3F1Eo2iDdUdAWiozIDPwj09DajoUrr42raTrY5NkgxpNUvc
 egK1ur6Gbi1ZsXFDPSOTgNHytsTYT0/d40pLzMfJ0bg4Iy6w8jqa7V0ZoY2QbE5uDeZJ
 6IPU2GiVDzJhPiHlFj8QgqhwN7u8SmPP6ON4C8yEouPmRsIZ6NTMNHIC1FO3PyTDbomL
 sMY/DPlPPmfOPJpwjAjQZARu5M69wok04KwDkpP1X9nDys5IeEjmjYUKbfstWtRmxuLc
 3SGkFSyhod2T7W6kzCOnma6huG/lwNRFNbnfmaiekHpD6fXevZRRVyKbNF3UWUCU9WV1
 uVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K51mCMm+68kFPdXojNgqY/rrH8VYnBt16Se+htBKma8=;
 b=WP5S10fqYW4e8FZyDNb3N/4d/+oVd0TGGFnQKaV8nzUnpQbuwOulR2bps2CVIcdWiE
 2TciMyALAI8sBLhc3ditBO6jUpVtiusc4yTdS9e4+cmXSUgkyDp0k/g7aaJJQhR0s+y9
 vP9orlCgu3mFcIzMQU9QEz1oukDDZfkMlSVFlYfu9zoT84uOxeD6C60VAIFSDr3oAF52
 BaD/UwcQ44Uk763ebCSGo0JJGuzD1qTleeSDASetN3rJAVnGGsUGaGJj11vfEfLySy3X
 cHsg854EqfkmeJViTg9tEz91AOYnB2BFZAINOlsHeHwk8ApePA6sR/MB2NPAREjioYOf
 Gjog==
X-Gm-Message-State: AOAM530Riss8mBgA7y4Ey4RaUpklXjEKtOXdEKO2yG+8iWJ4R6jfIo8R
 BvtXfl26RayVAhjN5gR/0/LLFJDvfvicBB6g9065NA==
X-Google-Smtp-Source: ABdhPJzKGIZlXMvYfIvCD3ww4TlBx790ofkkLJENH0bv52qMieUyigsvNvDkUiRvHjHlIra4Sb6qUNv+a65DsqK96v4=
X-Received: by 2002:a05:6102:5494:: with SMTP id
 bk20mr9236895vsb.6.1635466036468; 
 Thu, 28 Oct 2021 17:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-23-imp@bsdimp.com>
 <344ac222-daa9-c752-8c6a-21773efb8656@linaro.org>
In-Reply-To: <344ac222-daa9-c752-8c6a-21773efb8656@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 28 Oct 2021 18:07:05 -0600
Message-ID: <CANCZdfo8b2uO=g_mGbZx8241nB8qytAsAD-E4nh7MLDCt9KGgw@mail.gmail.com>
Subject: Re: [PATCH 22/24] bsd-user/arm/target_arch_signal.h: arm set_mcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000025719405cf729c87"
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

--00000000000025719405cf729c87
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 11:53 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 10/19/21 9:44 AM, Warner Losh wrote:
> > +    regs->regs[15] = tswap32(gr[TARGET_REG_PC]);
> > +    cpsr = tswap32(gr[TARGET_REG_CPSR]);
> > +    cpsr_write(regs, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
>
> Hmm.  What's the expected behaviour if the saved CPSR state does not match
> the PC state
> wrt thumb?
>
> I'm ok if this should fail in spectacular ways, I just wanna know.
>
> I *think* what will happen at the moment is that qemu will go into a
> whacky state in which
> the translator will read and interpret unaligned data.
>
> I have a pending patch set for arm to raise unaligned exceptions for
> mis-aligned pc.  For
> arm32 mode, this is fine, and we'll raise the exception.  But for thumb
> mode, this is
> architecturally impossible, and the translator will assert.
>
> The assert is going to be a problem.  There are a couple of options:
>
> (1) TARGET_REG_PC wins: unset PC[0] and adjust CPSR[T] to match.
>
> (2) CPSR_T wins: unset pc[0] if CPSR[T] is set, unchanged otherwise.  (In
> the Arm ARM
> psueodcode, pc[0] is hardwired to 0 in thumb mode.)
>
> (3) Don't worry about matching PC[0] and CPSR[T], but do prevent an
> impossible situation
> and unset PC[0] always.  If PC[1] is set, and CPSR[T] is unset, then we'll
> raise unaligned
> when the cpu restarts.
>

Consider this program:
#include <signal.h>
#include <stdio.h>
#include <unistd.h>
int g;
void fortytwo(int arg) { g = 42; }
int main(int argc, char **argv) {
        g = 123;
        signal(SIGALRM, fortytwo); alarm(1); pause();
        printf("G is %d\n", g);
}

Built for 'arm' I get
G is 42
Build -mthumb I get
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault

So even without your new assert, there are some issues I need to look into
before I can
get to this very interesting case :(. These are all good questions, though.
I clearly have
some work to do here...

And, finally, you're missing the mc_vfp_* handling.
>

Yes. We don't really support that at the moment, but I'll look into how
hard that might be
to add.

Warner

--00000000000025719405cf729c87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 11:53 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 10/19/21 9:44 AM, Warner Losh wrote:<br>
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
. I clearly have</div><div>some work to do here...</div><div><br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">And, finally, you&#39;re miss=
ing the mc_vfp_* handling.<br></blockquote><div><br></div><div>Yes. We don&=
#39;t really support that at the moment, but I&#39;ll look into how hard th=
at might be</div><div>to add.</div><div><br></div><div>Warner</div></div></=
div>

--00000000000025719405cf729c87--

