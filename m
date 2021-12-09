Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C1846E15F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 04:53:30 +0100 (CET)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvAUq-0006Fs-LT
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 22:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mvATM-0005O3-CS
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 22:51:56 -0500
Received: from [2607:f8b0:4864:20::935] (port=34628
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mvATI-000491-Cu
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 22:51:56 -0500
Received: by mail-ua1-x935.google.com with SMTP id n6so8509274uak.1
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 19:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/pA2v/bg1UyJIpIbW0CB/MR7f0a2T/2fKRlanTuhQCU=;
 b=PbcIqphYh20mxQKYJdnKftJVMcDgPeOppqCMxQliwwaDwwm7gJmwtylnXC7AuyohXN
 khC8vXMt6kvODMn0M99vsix972fPctc/WgaWHAKMTg0dJhL8H6IXxzG4+CH6oZyd8XdA
 cdjowkpp3doZGUUSDaTjJUYolYIrq1+5EGj2GU+1n8mvCBnuhPF01DV99me8wCAMSDuO
 jva1aupnxzCyxcBs5loBQpjpgc0jCQZa7FCQJR5QlFIL75ePenQx4/3HQg3AJUtdnqwL
 a19FAnswaQ08bJibP/GiCoBEC8VwX857mt2PZYk/lUmt2duC5CaN5xHRCr/ZIkBkfUQ9
 2PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/pA2v/bg1UyJIpIbW0CB/MR7f0a2T/2fKRlanTuhQCU=;
 b=FzWkKp+qAx7RtIO6E3wXpRJON1rPYlJZ4UIXZGSHgpdldLuqfZhHeMlAbW2wNXfmmF
 58BIdrJMWNg5dtDxJCaqfxyJ7r8bw/L8cONcmCi+aT5aoSJ1Rn/18y5m2jbl/lgsHghK
 +cJ6Ha9YjsL7Vj/hjeXPD9LBJG10MP/p2Vq5VXQKR9kZzIVCj6+An/7+XL5sFiIHQhaG
 WveHPYgrmPmHaFbpaVm67Dan+UD+n4JpQeulW+ZDqw0m6g79rFnAVqCzm9TGiwbdcGiq
 IHKuBSeuISBpsDjTGjmSblU+0jMz816DtGUIK8t597TAekaBfduSpyAed6m2HrnMlAaF
 UXog==
X-Gm-Message-State: AOAM530a9JOct082A2Z7uJKHuzT6/jYDP4suODeu6S2ip7ueV0cdvWnu
 fvHJjnkha8S335R7DEjPbeN7NkLI45ELegAGw0RkNA==
X-Google-Smtp-Source: ABdhPJzwhNCBcu+emkwJD9HwsctK1GUEKD2eOdX+DWnMcdUwCRrrXuhCKSPaXmGUlW6xXLhQr3r+ybdwgTno89riaeA=
X-Received: by 2002:a67:d508:: with SMTP id l8mr4148465vsj.42.1639021910642;
 Wed, 08 Dec 2021 19:51:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638982480.git.lagarcia@br.ibm.com>
 <e20319dcf0ec37bedd915c740c3813eb0e58ead4.1638982486.git.lagarcia@br.ibm.com>
 <da9c1d2d-ce52-5114-eefc-cbf3eb7c475f@gmail.com> <YbFW7JjNLvr5aVKI@yekko>
In-Reply-To: <YbFW7JjNLvr5aVKI@yekko>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 8 Dec 2021 20:51:39 -0700
Message-ID: <CANCZdfqkFZVfE3HdF38LhBzcguaZFFYMQ=DmVhnEPwYu=sCahw@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: rSTify ppc-spapr-hcalls.txt
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: multipart/alternative; boundary="000000000000c3646405d2ae8667"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, lagarcia@linux.ibm.com,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, clg@kaod.org,
 Leonardo Garcia <lagarcia@br.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c3646405d2ae8667
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 8, 2021 at 6:51 PM David Gibson <david@gibson.dropbear.id.au>
wrote:

> On Wed, Dec 08, 2021 at 03:54:40PM -0300, Daniel Henrique Barboza wrote:
> >
> >
> > On 12/8/21 13:59, lagarcia@linux.ibm.com wrote:
> > > From: Leonardo Garcia <lagarcia@br.ibm.com>
> > >
> > > Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> > > ---
> > >   docs/specs/ppc-spapr-hcalls.txt | 92
> ++++++++++++++++++++-------------
> > >   1 file changed, 57 insertions(+), 35 deletions(-)
> > >
> > > diff --git a/docs/specs/ppc-spapr-hcalls.txt
> b/docs/specs/ppc-spapr-hcalls.txt
> > > index 93fe3da91b..c69dae535b 100644
> > > --- a/docs/specs/ppc-spapr-hcalls.txt
> > > +++ b/docs/specs/ppc-spapr-hcalls.txt
> > > @@ -1,9 +1,15 @@
> > > -When used with the "pseries" machine type, QEMU-system-ppc64
> implements
> > > -a set of hypervisor calls using a subset of the server "PAPR"
> specification
> > > -(IBM internal at this point), which is also what IBM's proprietary
> hypervisor
> > > -adheres too.
> > > +sPAPR hypervisor calls
> > > +----------------------
> > > -The subset is selected based on the requirements of Linux as a guest.
> > > +When used with the ``pseries`` machine type, ``qemu-system-ppc64``
> implements
> > > +a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux on
> Power
> > > +Architecture Reference document (LoPAR)
> > > +<
> https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.pdf
> >`_.
> > > +This document is a subset of the Power Architecture Platform
> Reference (PAPR+)
> > > +specification (IBM internal only), which is what PowerVM, the IBM
> proprietary
> > > +hypervisor, adheres to.
> > > +
> > > +The subset in LoPAR is selected based on the requirements of Linux as
> a guest.
> > >   In addition to those calls, we have added our own private hypervisor
> > >   calls which are mostly used as a private interface between the
> firmware
> > > @@ -12,13 +18,14 @@ running in the guest and QEMU.
> > >   All those hypercalls start at hcall number 0xf000 which correspond
> > >   to an implementation specific range in PAPR.
> > > -- H_RTAS (0xf000)
> > > +H_RTAS (0xf000)
> > > +^^^^^^^^^^^^^^^
> > > -RTAS is a set of runtime services generally provided by the firmware
> > > -inside the guest to the operating system. It predates the existence
> > > -of hypervisors (it was originally an extension to Open Firmware) and
> > > -is still used by PAPR to provide various services that aren't
> performance
> > > -sensitive.
> > > +RTAS stands for Run-Time Abstraction Sercies and is a set of runtime
> services
> > > +generally provided by the firmware inside the guest to the operating
> system. It
> > > +predates the existence of hypervisors (it was originally an extension
> to Open
> > > +Firmware) and is still used by PAPR and LoPAR to provide various
> services that
> > > +are not performance sensitive.
> > >   We currently implement the RTAS services in QEMU itself. The actual
> RTAS
> > >   "firmware" blob in the guest is a small stub of a few instructions
> which
> > > @@ -26,22 +33,25 @@ calls our private H_RTAS hypervisor call to pass
> the RTAS calls to QEMU.
> > >   Arguments:
> > > -  r3 : H_RTAS (0xf000)
> > > -  r4 : Guest physical address of RTAS parameter block
> > > +  ``r3``: ``H_RTAS (0xf000)``
> > > +
> > > +  ``r4``: Guest physical address of RTAS parameter block.
> > >   Returns:
> > > -  H_SUCCESS   : Successfully called the RTAS function (RTAS result
> > > -                will have been stored in the parameter block)
> > > -  H_PARAMETER : Unknown token
> > > +  ``H_SUCCESS``: Successfully called the RTAS function (RTAS result
> will have
> > > +  been stored in the parameter block).
> > > -- H_LOGICAL_MEMOP (0xf001)
> > > +  ``H_PARAMETER``: Unknown token.
> > > -When the guest runs in "real mode" (in powerpc lingua this means
> > > -with MMU disabled, ie guest effective == guest physical), it only
> > > -has access to a subset of memory and no IOs.
> > > +H_LOGICAL_MEMOP (0xf001)
> > > +^^^^^^^^^^^^^^^^^^^^^^^^
> > > -PAPR provides a set of hypervisor calls to perform cacheable or
> > > +When the guest runs in "real mode" (in powerpc lingua this means with
> MMU
> >
> > What's up with 'lingua'? As you already know "lingua" is Brazilian
> portuguese for "tongue"
> > and it's so weird to be used in this context.
> >
> > The one English word that I can think of that is closer to "lingua" and
> would make sense here
> > is 'lingo'. But that is a slang for 'jargon' and not appropriate for a
> technical document
> > either. "langua" as a short form of "language" seems weird as well. I
> really believe 'jargon'
> > is a more suitable word here.
>
> As a native speaker: "lingo" would make sense here, though its tone is
> a little informal.  "jargon" could also work, but "terminology" would
> probably better match the tone of the document.
>
> I expect this hasn't been noticed before, because I think most English
> speakers would read "lingua" as a typo for "lingo", maybe only barely
> registering that it was not the standard spelling.  ("lingo" is, of
> course, cognate with lingua and similar words from romance langauges).
>

My google search turns up exactly 1 other hit for 'powerpc lingua' so it's
not a wide spread thing.
In fact, it is in our archives when this commit was made to the text file
as near as I can tell.

As such, the phrase should be 'in powerpc terminology' or 'in powerpc
jargon' to make
sense to a native English speaker. 'linga' doesn't make  sense in English
(though we
do have the loan phrase 'lingua franca' meaning 'the common language'
derived from the
common language of the Levant made up of a hodge-podge of other languages.
Another
phrase that would make sense, but is a bit of an uncommon usage, is
'powerpc parlance'
which might capture the right nuance of meaning here better than the other
suggestions.


> > This was added by c73e3771ea79ab and I really believe this is an
> unintended typo/mistake. If
> > you're feeling generous feel free to send an extra patch (you can send
> an independent patch,
> > or another patch on top of this series, your call) changing this
> 'lingua' instance to something
> > more appropriate.
>

Yes. The original review for that was the only other place google can find
this turn of phrase.
I'd thought it might be a pun on lingua franca (eg 'lingua powerpc' was an
in joke in that
community, but google says no).

Warner



> > Since this is not this patch fault:
> >
> > Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >
> >
> >
> >
> > > +disabled, i.e. guest effective address equals to guest physical
> address), it
> > > +only has access to a subset of memory and no I/Os.
> > > +
> > > +PAPR and LoPAR provides a set of hypervisor calls to perform
> cacheable or
> > >   non-cacheable accesses to any guest physical addresses that the
> > >   guest can use in order to access IO devices while in real mode.
> > > @@ -58,21 +68,33 @@ is used by our SLOF firmware to invert the screen.
> > >   Arguments:
> > > -  r3: H_LOGICAL_MEMOP (0xf001)
> > > -  r4: Guest physical address of destination
> > > -  r5: Guest physical address of source
> > > -  r6: Individual element size
> > > -        0 = 1 byte
> > > -        1 = 2 bytes
> > > -        2 = 4 bytes
> > > -        3 = 8 bytes
> > > -  r7: Number of elements
> > > -  r8: Operation
> > > -        0 = copy
> > > -        1 = xor
> > > +  ``r3 ``: ``H_LOGICAL_MEMOP (0xf001)``
> > > +
> > > +  ``r4``: Guest physical address of destination.
> > > +
> > > +  ``r5``: Guest physical address of source.
> > > +
> > > +  ``r6``: Individual element size, defined by the binary logarithm of
> the
> > > +  desired size. Supported values are:
> > > +
> > > +    ``0`` = 1 byte
> > > +
> > > +    ``1`` = 2 bytes
> > > +
> > > +    ``2`` = 4 bytes
> > > +
> > > +    ``3`` = 8 bytes
> > > +
> > > +  ``r7``: Number of elements.
> > > +
> > > +  ``r8``: Operation. Supported values are:
> > > +
> > > +    ``0``: copy
> > > +
> > > +    ``1``: xor
> > >   Returns:
> > > -  H_SUCCESS   : Success
> > > -  H_PARAMETER : Invalid argument
> > > +  ``H_SUCCESS``: Success.
> > > +  ``H_PARAMETER``: Invalid argument.
> > > \ No newline at end of file
> > >
> >
>
> --
> David Gibson                    | I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_
> _other_
>                                 | _way_ _around_!
> http://www.ozlabs.org/~dgibson
>

--000000000000c3646405d2ae8667
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 8, 2021 at 6:51 PM David =
Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id.au">david@gibson.drop=
bear.id.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Dec 08, 2021 at 03:54:40PM -0300, Daniel Henrique Barboz=
a wrote:<br>
&gt; <br>
&gt; <br>
&gt; On 12/8/21 13:59, <a href=3D"mailto:lagarcia@linux.ibm.com" target=3D"=
_blank">lagarcia@linux.ibm.com</a> wrote:<br>
&gt; &gt; From: Leonardo Garcia &lt;<a href=3D"mailto:lagarcia@br.ibm.com" =
target=3D"_blank">lagarcia@br.ibm.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Leonardo Garcia &lt;<a href=3D"mailto:lagarcia@br.=
ibm.com" target=3D"_blank">lagarcia@br.ibm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0docs/specs/ppc-spapr-hcalls.txt | 92 ++++++++++++++++=
++++-------------<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 57 insertions(+), 35 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spa=
pr-hcalls.txt<br>
&gt; &gt; index 93fe3da91b..c69dae535b 100644<br>
&gt; &gt; --- a/docs/specs/ppc-spapr-hcalls.txt<br>
&gt; &gt; +++ b/docs/specs/ppc-spapr-hcalls.txt<br>
&gt; &gt; @@ -1,9 +1,15 @@<br>
&gt; &gt; -When used with the &quot;pseries&quot; machine type, QEMU-system=
-ppc64 implements<br>
&gt; &gt; -a set of hypervisor calls using a subset of the server &quot;PAP=
R&quot; specification<br>
&gt; &gt; -(IBM internal at this point), which is also what IBM&#39;s propr=
ietary hypervisor<br>
&gt; &gt; -adheres too.<br>
&gt; &gt; +sPAPR hypervisor calls<br>
&gt; &gt; +----------------------<br>
&gt; &gt; -The subset is selected based on the requirements of Linux as a g=
uest.<br>
&gt; &gt; +When used with the ``pseries`` machine type, ``qemu-system-ppc64=
`` implements<br>
&gt; &gt; +a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux =
on Power<br>
&gt; &gt; +Architecture Reference document (LoPAR)<br>
&gt; &gt; +&lt;<a href=3D"https://cdn.openpowerfoundation.org/wp-content/up=
loads/2020/07/LoPAR-20200812.pdf" rel=3D"noreferrer" target=3D"_blank">http=
s://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812.p=
df</a>&gt;`_.<br>
&gt; &gt; +This document is a subset of the Power Architecture Platform Ref=
erence (PAPR+)<br>
&gt; &gt; +specification (IBM internal only), which is what PowerVM, the IB=
M proprietary<br>
&gt; &gt; +hypervisor, adheres to.<br>
&gt; &gt; +<br>
&gt; &gt; +The subset in LoPAR is selected based on the requirements of Lin=
ux as a guest.<br>
&gt; &gt;=C2=A0 =C2=A0In addition to those calls, we have added our own pri=
vate hypervisor<br>
&gt; &gt;=C2=A0 =C2=A0calls which are mostly used as a private interface be=
tween the firmware<br>
&gt; &gt; @@ -12,13 +18,14 @@ running in the guest and QEMU.<br>
&gt; &gt;=C2=A0 =C2=A0All those hypercalls start at hcall number 0xf000 whi=
ch correspond<br>
&gt; &gt;=C2=A0 =C2=A0to an implementation specific range in PAPR.<br>
&gt; &gt; -- H_RTAS (0xf000)<br>
&gt; &gt; +H_RTAS (0xf000)<br>
&gt; &gt; +^^^^^^^^^^^^^^^<br>
&gt; &gt; -RTAS is a set of runtime services generally provided by the firm=
ware<br>
&gt; &gt; -inside the guest to the operating system. It predates the existe=
nce<br>
&gt; &gt; -of hypervisors (it was originally an extension to Open Firmware)=
 and<br>
&gt; &gt; -is still used by PAPR to provide various services that aren&#39;=
t performance<br>
&gt; &gt; -sensitive.<br>
&gt; &gt; +RTAS stands for Run-Time Abstraction Sercies and is a set of run=
time services<br>
&gt; &gt; +generally provided by the firmware inside the guest to the opera=
ting system. It<br>
&gt; &gt; +predates the existence of hypervisors (it was originally an exte=
nsion to Open<br>
&gt; &gt; +Firmware) and is still used by PAPR and LoPAR to provide various=
 services that<br>
&gt; &gt; +are not performance sensitive.<br>
&gt; &gt;=C2=A0 =C2=A0We currently implement the RTAS services in QEMU itse=
lf. The actual RTAS<br>
&gt; &gt;=C2=A0 =C2=A0&quot;firmware&quot; blob in the guest is a small stu=
b of a few instructions which<br>
&gt; &gt; @@ -26,22 +33,25 @@ calls our private H_RTAS hypervisor call to p=
ass the RTAS calls to QEMU.<br>
&gt; &gt;=C2=A0 =C2=A0Arguments:<br>
&gt; &gt; -=C2=A0 r3 : H_RTAS (0xf000)<br>
&gt; &gt; -=C2=A0 r4 : Guest physical address of RTAS parameter block<br>
&gt; &gt; +=C2=A0 ``r3``: ``H_RTAS (0xf000)``<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 ``r4``: Guest physical address of RTAS parameter block.<b=
r>
&gt; &gt;=C2=A0 =C2=A0Returns:<br>
&gt; &gt; -=C2=A0 H_SUCCESS=C2=A0 =C2=A0: Successfully called the RTAS func=
tion (RTAS result<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 will hav=
e been stored in the parameter block)<br>
&gt; &gt; -=C2=A0 H_PARAMETER : Unknown token<br>
&gt; &gt; +=C2=A0 ``H_SUCCESS``: Successfully called the RTAS function (RTA=
S result will have<br>
&gt; &gt; +=C2=A0 been stored in the parameter block).<br>
&gt; &gt; -- H_LOGICAL_MEMOP (0xf001)<br>
&gt; &gt; +=C2=A0 ``H_PARAMETER``: Unknown token.<br>
&gt; &gt; -When the guest runs in &quot;real mode&quot; (in powerpc lingua =
this means<br>
&gt; &gt; -with MMU disabled, ie guest effective =3D=3D guest physical), it=
 only<br>
&gt; &gt; -has access to a subset of memory and no IOs.<br>
&gt; &gt; +H_LOGICAL_MEMOP (0xf001)<br>
&gt; &gt; +^^^^^^^^^^^^^^^^^^^^^^^^<br>
&gt; &gt; -PAPR provides a set of hypervisor calls to perform cacheable or<=
br>
&gt; &gt; +When the guest runs in &quot;real mode&quot; (in powerpc lingua =
this means with MMU<br>
&gt; <br>
&gt; What&#39;s up with &#39;lingua&#39;? As you already know &quot;lingua&=
quot; is Brazilian portuguese for &quot;tongue&quot;<br>
&gt; and it&#39;s so weird to be used in this context.<br>
&gt; <br>
&gt; The one English word that I can think of that is closer to &quot;lingu=
a&quot; and would make sense here<br>
&gt; is &#39;lingo&#39;. But that is a slang for &#39;jargon&#39; and not a=
ppropriate for a technical document<br>
&gt; either. &quot;langua&quot; as a short form of &quot;language&quot; see=
ms weird as well. I really believe &#39;jargon&#39;<br>
&gt; is a more suitable word here.<br>
<br>
As a native speaker: &quot;lingo&quot; would make sense here, though its to=
ne is<br>
a little informal.=C2=A0 &quot;jargon&quot; could also work, but &quot;term=
inology&quot; would<br>
probably better match the tone of the document.<br>
<br>
I expect this hasn&#39;t been noticed before, because I think most English<=
br>
speakers would read &quot;lingua&quot; as a typo for &quot;lingo&quot;, may=
be only barely<br>
registering that it was not the standard spelling.=C2=A0 (&quot;lingo&quot;=
 is, of<br>
course, cognate with lingua and similar words from romance langauges).<br><=
/blockquote><div><br></div><div>My google search turns up exactly 1 other h=
it for &#39;powerpc lingua&#39; so it&#39;s not a wide spread thing.</div><=
div>In fact, it is in our archives when this commit was made to the text fi=
le as near as I can tell.</div><div><br></div><div>As such, the phrase shou=
ld be &#39;in powerpc terminology&#39; or &#39;in powerpc jargon&#39; to ma=
ke</div><div>sense to a native English speaker. &#39;linga&#39; doesn&#39;t=
 make=C2=A0 sense in English (though we</div><div>do have the loan phrase &=
#39;lingua franca&#39; meaning &#39;the common language&#39; derived from t=
he</div><div>common language of the Levant made up of a hodge-podge of othe=
r=C2=A0languages. Another</div><div>phrase that would make sense, but is a =
bit of an uncommon usage, is &#39;powerpc parlance&#39;</div><div>which mig=
ht capture the right nuance of meaning here better than the other suggestio=
ns.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; This was added by c73e3771ea79ab and I really believe this is an unint=
ended typo/mistake. If<br>
&gt; you&#39;re feeling generous feel free to send an extra patch (you can =
send an independent patch,<br>
&gt; or another patch on top of this series, your call) changing this &#39;=
lingua&#39; instance to something<br>
&gt; more appropriate.<br></blockquote><div><br></div><div>Yes. The origina=
l review for that was the only other place google can find this turn of phr=
ase.</div><div>I&#39;d thought it might be a pun on lingua franca (eg &#39;=
lingua powerpc&#39; was an in joke in that</div><div>community, but google =
says no).</div><div><br></div><div>Warner</div><div>=C2=A0</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Since this is not this patch fault:<br>
&gt; <br>
&gt; Reviewed-by: Daniel Henrique Barboza &lt;<a href=3D"mailto:danielhb413=
@gmail.com" target=3D"_blank">danielhb413@gmail.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt; +disabled, i.e. guest effective address equals to guest physical =
address), it<br>
&gt; &gt; +only has access to a subset of memory and no I/Os.<br>
&gt; &gt; +<br>
&gt; &gt; +PAPR and LoPAR provides a set of hypervisor calls to perform cac=
heable or<br>
&gt; &gt;=C2=A0 =C2=A0non-cacheable accesses to any guest physical addresse=
s that the<br>
&gt; &gt;=C2=A0 =C2=A0guest can use in order to access IO devices while in =
real mode.<br>
&gt; &gt; @@ -58,21 +68,33 @@ is used by our SLOF firmware to invert the sc=
reen.<br>
&gt; &gt;=C2=A0 =C2=A0Arguments:<br>
&gt; &gt; -=C2=A0 r3: H_LOGICAL_MEMOP (0xf001)<br>
&gt; &gt; -=C2=A0 r4: Guest physical address of destination<br>
&gt; &gt; -=C2=A0 r5: Guest physical address of source<br>
&gt; &gt; -=C2=A0 r6: Individual element size<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D 1 byte<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D 2 bytes<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 2 =3D 4 bytes<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 3 =3D 8 bytes<br>
&gt; &gt; -=C2=A0 r7: Number of elements<br>
&gt; &gt; -=C2=A0 r8: Operation<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D copy<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =3D xor<br>
&gt; &gt; +=C2=A0 ``r3 ``: ``H_LOGICAL_MEMOP (0xf001)``<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 ``r4``: Guest physical address of destination.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 ``r5``: Guest physical address of source.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 ``r6``: Individual element size, defined by the binary lo=
garithm of the<br>
&gt; &gt; +=C2=A0 desired size. Supported values are:<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 ``0`` =3D 1 byte<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 ``1`` =3D 2 bytes<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 ``2`` =3D 4 bytes<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 ``3`` =3D 8 bytes<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 ``r7``: Number of elements.<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 ``r8``: Operation. Supported values are:<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 ``0``: copy<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 ``1``: xor<br>
&gt; &gt;=C2=A0 =C2=A0Returns:<br>
&gt; &gt; -=C2=A0 H_SUCCESS=C2=A0 =C2=A0: Success<br>
&gt; &gt; -=C2=A0 H_PARAMETER : Invalid argument<br>
&gt; &gt; +=C2=A0 ``H_SUCCESS``: Success.<br>
&gt; &gt; +=C2=A0 ``H_PARAMETER``: Invalid argument.<br>
&gt; &gt; \ No newline at end of file<br>
&gt; &gt; <br>
&gt; <br>
<br>
-- <br>
David Gibson=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | I&#39;ll have my music baroque, and my code<br>
david AT <a href=3D"http://gibson.dropbear.id.au" rel=3D"noreferrer" target=
=3D"_blank">gibson.dropbear.id.au</a>=C2=A0 | minimalist, thank you.=C2=A0 =
NOT _the_ _other_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | _way_ _around_!<br>
<a href=3D"http://www.ozlabs.org/~dgibson" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.ozlabs.org/~dgibson</a><br>
</blockquote></div></div>

--000000000000c3646405d2ae8667--

