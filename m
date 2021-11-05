Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C33E4460A7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 09:28:14 +0100 (CET)
Received: from localhost ([::1]:43990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miua4-0007MO-3G
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 04:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1miuZ9-0006e0-3e
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 04:27:15 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1miuZ5-0004qy-Bk
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 04:27:14 -0400
Received: by mail-ed1-x52e.google.com with SMTP id v11so27862110edc.9
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hYqASvZAcSZyVckQ/NAwEhba5Kmwt3Oy62Q2hokHKNU=;
 b=UBcH8b6JSGkrAXsIqY9OJJawkJImyV0FKwh2MvemC3gcjz4D1XSIcMjce36o6vNMzY
 mnv5P6ucx4XC/Z3rfEDczdtQcLUoqPr0QMH1z0m6HyrAf3gvINDnsz7R8dWliRpqJh4a
 guysW60xM2jhlt7D4COEbUuYUPl+KUDgShhFxXj228y7i5yDHxYUha/Dv4Y3ezr2vf2j
 rwkeXb9dCElPPybJ9bCqYCDyIkwi3OW2a7wU7MJL44ekeRI7HcoTTrxgsu6K4K/Y68zz
 ji8DbvAm9fYTyKoGQOxzKZUqNDXKvOvq+tKBK9iDbqL5CGtFB6eq323w5wJvVxHc6AnC
 EFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hYqASvZAcSZyVckQ/NAwEhba5Kmwt3Oy62Q2hokHKNU=;
 b=MNJmstXP6IWko88Y2B2exDP+2TSITXA9lnPl4w0FUrIurLpWgEwPIAURbMlc89Me9L
 yqwEUIofnYNma4Mw2evDfmSzcMyy0nGZR+ESNO9cJHwW89t2vTdSZW8QwzF4jIWIfKjC
 zu5k4wmjU6ofCflKNM5h3jlkjAOMu3sOdTnLPG5KObCsdJPzqE1fcuxPk+GlpYJCm8AR
 z+5T4qD61gPqwJ8c7C9pWf9A5NGwlFfaGCetoxceFf0Zd2L2ZUTenk9VIf+qesR5xMb+
 UeagMmaXYSyxjDapbSJ9KAScAFaSDklXe6XIpXCZQIibHTw59v9nGYXyTZBE/M+I2FP2
 vBzA==
X-Gm-Message-State: AOAM5336rQDfAtC29pYn+iFlnBcb4GdF/PHP6NmqSfk/f1OpQzK4uA5W
 AS/sLBwtWR5kMfQYdL1sT21jmaTDXmw7Ye22Phhgbg==
X-Google-Smtp-Source: ABdhPJzahVBZBDgES9BGzaEwzyVmHNX080Yywrd+D+OZjeOtdIlj0HLu5y4j3eWsAF25FkCyv34FI1NDZnDxL+Tn8og=
X-Received: by 2002:a17:906:1450:: with SMTP id
 q16mr73398685ejc.213.1636100828135; 
 Fri, 05 Nov 2021 01:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
 <CAHFG_=V6QEsD63LgBDpJUZkd9rrJ0hoo7aYd7MQ_z2YS6k9UhQ@mail.gmail.com>
 <CAPnjgZ0pbLLjvmD37aSYqjQ28kLgrU0Pox+hQLTH15+wcX+5ow@mail.gmail.com>
In-Reply-To: <CAPnjgZ0pbLLjvmD37aSYqjQ28kLgrU0Pox+hQLTH15+wcX+5ow@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Fri, 5 Nov 2021 09:26:57 +0100
Message-ID: <CAHFG_=XWoKYj5MM+quN=QLjMfXrkhzHWng1yY3xjqLsRAbEXoQ@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000ad9b2905d006686b"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Jerry Van Baren <vanbaren@cideas.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ad9b2905d006686b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Nov 2021 at 03:02, Simon Glass <sjg@chromium.org> wrote:

> Hi Fran=C3=A7ois,
>
> On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog <francois.ozog@linaro.org=
>
> wrote:
> >
> > Hi Simon,
> >
> > On Tue, 2 Nov 2021 at 15:59, Simon Glass <sjg@chromium.org> wrote:
> >>
> >> Hi Fran=C3=A7ois,
> >>
> >> On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog <francois.ozog@linaro.=
org>
> wrote:
> >> >
> >> > Hi Simon,
> >> >
> >> > this seems a great endeavor. I'd like to better understand the scope
> of it.
> >> >
> >> > Is it to be used as part of what could become a U-Boot entry ABI
> scheme? By that I mean giving some fixed aspects
> >> > to U-Boot entry while letting boards to have flexibility (say for
> instance that the first 5 architecture ABI
> >> > parameter registers are reserved for U-Boot), and the Passage is
> about specifying either those reserved registers
> >> > or one of them?
> >>
> >> The goal is to provide a standard entry scheme for all firmware
> >> binaries. Whether it achieves that (or can with some mods) is up for
> >> discussion.
> >>
> > If you say
> > a) define a U-Boot entry ABI and providing a firmware-to-firmware
> information passing facility which would be part of all firmware ABIs (as
> the projects decide to define their own ABI) it looks good.
> > but If you say
>
> It is an ABI to be adopted by U-Boot but also other firmware. For
> example, if TF-A calls U-Boot it should use standard passage. If
> U-Boot calls TF-A or Optee it should use standard passage.
>
> > b) define a standard entry scheme (register map, processor state, MMU
> state, SMMU state, GIC state...) that does not look realistic.
>
> No I don't mean that. This data structure could be used in any state,
> so long as the two registers are set correctly.
>
> > I think you mean a) but just want to be sure.
>
> Yes I think so.
>
> >>
> >> Re the registers, do you think we need 5?
> >>
>
> I don't :-)
>
> >> >
> >> > Thinking entry ABI, here is what I observed on Arm:
> >> >
> >> > Linux has two entry ABIs:
> >> > - plain: x0 =3D dtb;
> >> >           command line =3D dtb:/chosen/bootargs; initrd =3D
> dtb:/chosen/linux,initrd-*
> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
> >> >            dtb =3D EFI_UUID config table; initrd =3D
> efi:<loadfile2(INITRD vendor media UUID); command line =3D efi:
> image_protocol::load_options
> >> >
> >> > U-Boot (proper) has plenty of schemes:
> >> > - dtb is passed as either x0, x1, fixed memory area (Qemu which is
> bad in itself), or other registers
> >> > - additional information passing: board specific register scheme, SM=
C
> calls
> >> > - U-Boot for RPI boards implement a Linux shaped entry ABI to be
> launched by Videocore firmware
> >> >
> >> > Based on all the above, I would tend to think that RPI scheme is a
> good idea but also
> >> > shall not prevent additional schemes for the boards.
> >>
> >> I was not actually considering Linux since I believe/assume its entry
> >> scheme is fixed and not up for discussion.
> >>
> >> I also did not think about the EFI case. As I understand it we cannot
> >> touch it as it is used by UEFI today. Maybe it is even in the
> >> standard?
> >
> > It is in the spec and we are making it evolve, or its understanding
> evolve (jurisprudence) for instance on initrd standard handling.
>
> Well perhaps we could merge it with standard passage. But EFI is not
> going to want to use a bloblist, it will want to use a HOB.
>
> >>
> >>
> >> Really I am hoping we can start afresh...?
> >>
> >> >
> >> > What about a U-Boot Arm entry ABI like:
> >> > - plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserved>, oth=
er
> registers are per platform, SMC calls allowed too
> >>
> >> Hmm we don't actually need the dtb as it is available in the bloblist.
> >
> > If you don't have x0=3Ddtb, then you will not be able to use U-Boot on
> RPI4.
> > Unless you want to redo everything the RPI firmware is doing.
>
> That's right, RPI cannot support standard passage. It is not
> open-source firmware so it isn't really relevant to this discussion.
> It will just do what it does and have limited functionality, with
> work-arounds to deal with the pain, as one might expect.
>
> So you are seeing two "all-or-nothing" options:
<specific>: U-Boot entry is board specific as it is today
<purepassage>: A new form where the only parameter is a head of bloblist,
one of those blobs contain a DT
 You propose to mandate a DT for all boards make sense in that environment.
For RPI4, you just ignore everything the prior boot loader does because it
is not <passage> compliant.

This reinforces my opposition to the mandatory DT proposal.

a third option is I think way more attractive:
<optpassage>: shaped after the architecture Linux entry (ie. first
parameter is dtb) [+ passage head (i.e. second parameter is pointer to
passage head)]

This way, you make U-Boot entry clean in RPI4, Apple M1, Qemu, SystemReady
contexts
and get a well deserved standardized information passing between prior
loaders and U-Boot.

The three options are possible though, you could select a U-Boot entry
CONFIG option for:
<specific>
<optpassage>
<purepassage>

But despite it would be technically feasible, I don't think it is goes in
the right direction.

>>
> >> But I added an offset to it as a convenience.
> >>
> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  (when U=
-Boot
> is launched as an EFI app)
> >> >        dtb =3D EFI_UUID config table, + Passage =3D Passage UUID con=
fig
> table
> >>
> >> I don't understand the last line. Where is the passage info /
> >> bloblist? Do you mean it goes in the HOB list with a UUID? I suppose
> >> that is the most EFI-compatible way.
> >
> > The Passage config table  could just contain the "head" of the
> bloblist/Passage information.
>
> If UEFI wants to deal with standard passage, that is...
>
> >>
> >>
> >> What do you think about the idea of using an offset into the bloblist
> >> for the dtb?
> >
> > It is possible but as I said, failing to mimic Linux entry ABI would
> miss the opportunity to just boot without changes on RPI4.
>
> See above. Broadcom could look at open-sourcing their bootloader if they
> wish.
>
> >>
> >> Also, can we make the standard passage ABI a build-time
> >> option, so it is deterministic?
> >>
> > Looks good. I would look into stating that for SystemReady we would
> advise to use that option and make it standard for Trusted Substrate
> (Linaro recipes that we upstreaming to make SystemReady compliance easy a=
nd
> consistent across platforms).
>
> OK. I mean that if the option is enabled, then standard passage must
> be provided / emitted or things won't work. If the option is disabled,
> then standard passage is not used. In other words, we are looking for
> magic values in registers, etc, just enabling/disabling it at
> build-time.
>
> >>
> >> >
> >> > We could further leverage Passage to pass Operating Systems
> parameters that could be removed from device tree (migration of /chosen t=
o
> Passage). Memory inventory would still be in DT but allocations for CMA o=
r
> GPUs would be in Passage. This idea is to reach a point where  device tre=
e
> is a "pristine" hardware description.
> >>
> >> I'm worried about this becoming a substitute for devicetree. Really my
> >> intent is to provide a way to pass simple info, whereas what you talk
> >> about there seems like something that should be DT, just that it might
> >> need suitable bindings.
> >>
> > I see your point and I agree It should not be a substitute.
> > here is an expanded version of what I had in mind when I wrote those
> lines.
> > cma, initrd and other Linux kernel parameters can be conveyed either
> through command line or DT.
> > When using the non UEFI Linux entry ABI, you need to use the DT to pass
> those parameters.
> > When using the UEFI Linux entry ABI, you *can* (not must) use the
> command line to pass all information, leaving the DT passed to the OS
> without any /chosen.
> > When introducing Passage, I was wondering if we could pass command line
> to Linux and, same as UEFI, leave the DT free from /chosen.
> > I am not sure it is a good goal though. I may be too pushing for a DT
> free from parameters.
>
> We could. Are there benefits to that?
>
> I doubt we would pass the standard passage to Linux as a bloblist. I
> imagine something like this. The bloblist sits in memory with some
> things in it, including a devicetree, perhaps an SMBIOS table and a
> TPM log. But when U-Boot calls Linux it puts the address/size of those
> individual things in the devicetree. They don't move and are still
> contiguous in memory, but the bloblist around them is forgotten. Linux
> doesn't know that the three separate things it is picking up are
> actually part of a bloblist structure, since it doesn't care about
> that. Even a console log could work the same way. That way we don't
> end up trying to teach Linux about bloblist when it already has a
> perfectly good means to accept these items.
>
> For ACPI I see things a similar way. The ACPI tables can point to
> things that *happen* to be in a bloblist, but without any knowledge of
> that needed in Linux, grub, etc.
>
> >>
> >> As you know I have more expansive views about what should be in DT.
> >
> > I think both of us are huge supporters of DT format and self describing
> capabilities.
> > I am inclined to put rules into what fits into what lands in the DT tha=
t
> is passed to the OS.
> > I am a fan of having DT used more in ad-hoc files.
>
> Me too.
>
> >>
> >> >
> >> > Cheers
> >> >
> >> > PS: as Ilias mentions, this patch set contains bug fixes, non
> immediately related additional functions (DM stats). It would be great to
> carve those out to fast path them and keep this one with the very core of
> your idea.
> >>
> >> The DM stats is used in 'passage: Report the devicetree source'. I
> >> know it is sideways but I think it is better to make the output line
> >> more useful than just reporting the devicetree source.
> >>
> > I believe the DM stats has merits in its own. You could upstream this
> independently and then Passage would be yet another "customer" of the
> feature.
>
> I could, but it would just be a debug feature so people might not
> think it worth the code space. With the devicetree source it is more
> compelling.
>
> >>
> >> The first patch is indeed unrelated. I will pick it up so we can drop
> >> it for the next rev.
> >>
> [..]
>
> Regards,
> Simon
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000ad9b2905d006686b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 5 Nov 2021 at 03:02, Simon Gl=
ass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex">Hi Fran=C3=A7ois,<br>
<br>
On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:franc=
ois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Hi Simon,<br>
&gt;<br>
&gt; On Tue, 2 Nov 2021 at 15:59, Simon Glass &lt;<a href=3D"mailto:sjg@chr=
omium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog &lt;<a href=3D"mai=
lto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a=
>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Simon,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; this seems a great endeavor. I&#39;d like to better understan=
d the scope of it.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Is it to be used as part of what could become a U-Boot entry =
ABI scheme? By that I mean giving some fixed aspects<br>
&gt;&gt; &gt; to U-Boot entry while letting boards to have flexibility (say=
 for instance that the first 5 architecture ABI<br>
&gt;&gt; &gt; parameter registers are reserved for U-Boot), and the Passage=
 is about specifying either those reserved registers<br>
&gt;&gt; &gt; or one of them?<br>
&gt;&gt;<br>
&gt;&gt; The goal is to provide a standard entry scheme for all firmware<br=
>
&gt;&gt; binaries. Whether it achieves that (or can with some mods) is up f=
or<br>
&gt;&gt; discussion.<br>
&gt;&gt;<br>
&gt; If you say<br>
&gt; a) define a U-Boot entry ABI and providing a firmware-to-firmware info=
rmation passing facility which would be part of all firmware ABIs (as the p=
rojects decide to define their own ABI) it looks good.<br>
&gt; but If you say<br>
<br>
It is an ABI to be adopted by U-Boot but also other firmware. For<br>
example, if TF-A calls U-Boot it should use standard passage. If<br>
U-Boot calls TF-A or Optee it should use standard passage.<br>
<br>
&gt; b) define a standard entry scheme (register map, processor state, MMU =
state, SMMU state, GIC state...) that does not look realistic.<br>
<br>
No I don&#39;t mean that. This data structure could be used in any state,<b=
r>
so long as the two registers are set correctly.<br>
<br>
&gt; I think you mean a) but just want to be sure.<br>
<br>
Yes I think so.<br>
<br>
&gt;&gt;<br>
&gt;&gt; Re the registers, do you think we need 5?<br>
&gt;&gt;<br>
<br>
I don&#39;t :-)<br>
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thinking entry ABI, here is what I observed on Arm:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Linux has two entry ABIs:<br>
&gt;&gt; &gt; - plain: x0 =3D dtb;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command line =3D dtb:=
/chosen/bootargs; initrd =3D dtb:/chosen/linux,initrd-*<br>
&gt;&gt; &gt; - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb =3D EFI_UUID con=
fig table; initrd =3D efi:&lt;loadfile2(INITRD vendor media UUID); command =
line =3D efi: image_protocol::load_options<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; U-Boot (proper) has plenty of schemes:<br>
&gt;&gt; &gt; - dtb is passed as either x0, x1, fixed memory area (Qemu whi=
ch is bad in itself), or other registers<br>
&gt;&gt; &gt; - additional information passing: board specific register sch=
eme, SMC calls<br>
&gt;&gt; &gt; - U-Boot for RPI boards implement a Linux shaped entry ABI to=
 be launched by Videocore firmware<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Based on all the above, I would tend to think that RPI scheme=
 is a good idea but also<br>
&gt;&gt; &gt; shall not prevent additional schemes for the boards.<br>
&gt;&gt;<br>
&gt;&gt; I was not actually considering Linux since I believe/assume its en=
try<br>
&gt;&gt; scheme is fixed and not up for discussion.<br>
&gt;&gt;<br>
&gt;&gt; I also did not think about the EFI case. As I understand it we can=
not<br>
&gt;&gt; touch it as it is used by UEFI today. Maybe it is even in the<br>
&gt;&gt; standard?<br>
&gt;<br>
&gt; It is in the spec and we are making it evolve, or its understanding ev=
olve (jurisprudence) for instance on initrd standard handling.<br>
<br>
Well perhaps we could merge it with standard passage. But EFI is not<br>
going to want to use a bloblist, it will want to use a HOB.<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Really I am hoping we can start afresh...?<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; What about a U-Boot Arm entry ABI like:<br>
&gt;&gt; &gt; - plain: x0=3Ddtb, x1=3D&lt;Passage defined&gt;, x2-x5 =3D &l=
t;reserved&gt;, other registers are per platform, SMC calls allowed too<br>
&gt;&gt;<br>
&gt;&gt; Hmm we don&#39;t actually need the dtb as it is available in the b=
loblist.<br>
&gt;<br>
&gt; If you don&#39;t have x0=3Ddtb, then you will not be able to use U-Boo=
t on RPI4.<br>
&gt; Unless you want to redo everything the RPI firmware is doing.<br>
<br>
That&#39;s right, RPI cannot support standard passage. It is not<br>
open-source firmware so it isn&#39;t really relevant to this discussion.<br=
>
It will just do what it does and have limited functionality, with<br>
work-arounds to deal with the pain, as one might expect.<br>
<br></blockquote><div>So you are seeing two &quot;all-or-nothing&quot; opti=
ons:</div><div>&lt;specific&gt;: U-Boot entry is board specific as it is to=
day</div><div>&lt;purepassage&gt;: A new form where the only parameter is a=
 head of bloblist, one of those blobs contain a DT</div><div>=C2=A0You prop=
ose to mandate a DT for all boards make sense in that environment.</div><di=
v>For RPI4, you just ignore everything the prior boot loader does because i=
t is not &lt;passage&gt; compliant.</div><div><br></div><div>This reinforce=
s my opposition to the mandatory DT proposal.</div><div><br></div><div>a th=
ird option is I think way more attractive:</div><div>&lt;optpassage&gt;: sh=
aped after the architecture Linux entry (ie. first parameter is dtb) [+ pas=
sage head (i.e. second parameter is pointer to passage head)]</div><div><br=
></div><div>This way, you make U-Boot entry clean in RPI4, Apple M1, Qemu, =
SystemReady contexts=C2=A0</div><div>and get a well deserved standardized i=
nformation passing between prior loaders and U-Boot.</div><div><br></div><d=
iv>The three options are possible though, you could select a U-Boot entry C=
ONFIG option for:</div><div>&lt;specific&gt;</div><div>&lt;optpassage&gt;</=
div><div>&lt;purepassage&gt;</div><div><br></div><div>But despite it would =
be technically feasible, I don&#39;t think it is goes in the right directio=
n.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-c=
olor:rgb(204,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; But I added an offset to it as a convenience.<br>
&gt;&gt;<br>
&gt;&gt; &gt; - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;=
=C2=A0 (when U-Boot is launched as an EFI app)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb =3D EFI_UUID config table, + P=
assage =3D Passage UUID config table<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t understand the last line. Where is the passage info /<=
br>
&gt;&gt; bloblist? Do you mean it goes in the HOB list with a UUID? I suppo=
se<br>
&gt;&gt; that is the most EFI-compatible way.<br>
&gt;<br>
&gt; The Passage config table=C2=A0 could just contain the &quot;head&quot;=
 of the bloblist/Passage information.<br>
<br>
If UEFI wants to deal with standard passage, that is...<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; What do you think about the idea of using an offset into the blobl=
ist<br>
&gt;&gt; for the dtb?<br>
&gt;<br>
&gt; It is possible but as I said, failing to mimic Linux entry ABI would m=
iss the opportunity to just boot without changes on RPI4.<br>
<br>
See above. Broadcom could look at open-sourcing their bootloader if they wi=
sh.<br>
<br>
&gt;&gt;<br>
&gt;&gt; Also, can we make the standard passage ABI a build-time<br>
&gt;&gt; option, so it is deterministic?<br>
&gt;&gt;<br>
&gt; Looks good. I would look into stating that for SystemReady we would ad=
vise to use that option and make it standard for Trusted Substrate (Linaro =
recipes that we upstreaming to make SystemReady compliance easy and consist=
ent across platforms).<br>
<br>
OK. I mean that if the option is enabled, then standard passage must<br>
be provided / emitted or things won&#39;t work. If the option is disabled,<=
br>
then standard passage is not used. In other words, we are looking for<br>
magic values in registers, etc, just enabling/disabling it at<br>
build-time.<br>
<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We could further leverage Passage to pass Operating Systems p=
arameters that could be removed from device tree (migration of /chosen to P=
assage). Memory inventory would still be in DT but allocations for CMA or G=
PUs would be in Passage. This idea is to reach a point where=C2=A0 device t=
ree is a &quot;pristine&quot; hardware description.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m worried about this becoming a substitute for devicetree. R=
eally my<br>
&gt;&gt; intent is to provide a way to pass simple info, whereas what you t=
alk<br>
&gt;&gt; about there seems like something that should be DT, just that it m=
ight<br>
&gt;&gt; need suitable bindings.<br>
&gt;&gt;<br>
&gt; I see your point and I agree It should not be a substitute.<br>
&gt; here is an expanded version of what I had in mind when I wrote those l=
ines.<br>
&gt; cma, initrd and other Linux kernel parameters can be conveyed either t=
hrough command line or DT.<br>
&gt; When using the non UEFI Linux entry ABI, you need to use the DT to pas=
s those parameters.<br>
&gt; When using the UEFI Linux entry ABI, you *can* (not must) use the comm=
and line to pass all information, leaving the DT passed to the OS without a=
ny /chosen.<br>
&gt; When introducing Passage, I was wondering if we could pass command lin=
e to Linux and, same as UEFI, leave the DT free from /chosen.<br>
&gt; I am not sure it is a good goal though. I may be too pushing for a DT =
free from parameters.<br>
<br>
We could. Are there benefits to that?<br>
<br>
I doubt we would pass the standard passage to Linux as a bloblist. I<br>
imagine something like this. The bloblist sits in memory with some<br>
things in it, including a devicetree, perhaps an SMBIOS table and a<br>
TPM log. But when U-Boot calls Linux it puts the address/size of those<br>
individual things in the devicetree. They don&#39;t move and are still<br>
contiguous in memory, but the bloblist around them is forgotten. Linux<br>
doesn&#39;t know that the three separate things it is picking up are<br>
actually part of a bloblist structure, since it doesn&#39;t care about<br>
that. Even a console log could work the same way. That way we don&#39;t<br>
end up trying to teach Linux about bloblist when it already has a<br>
perfectly good means to accept these items.<br>
<br>
For ACPI I see things a similar way. The ACPI tables can point to<br>
things that *happen* to be in a bloblist, but without any knowledge of<br>
that needed in Linux, grub, etc.<br>
<br>
&gt;&gt;<br>
&gt;&gt; As you know I have more expansive views about what should be in DT=
.<br>
&gt;<br>
&gt; I think both of us are huge supporters of DT format and self describin=
g capabilities.<br>
&gt; I am inclined to put rules into what fits into what lands in the DT th=
at is passed to the OS.<br>
&gt; I am a fan of having DT used more in ad-hoc files.<br>
<br>
Me too.<br>
<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; PS: as Ilias mentions, this patch set contains bug fixes, non=
 immediately related additional functions (DM stats). It would be great to =
carve those out to fast path them and keep this one with the very core of y=
our idea.<br>
&gt;&gt;<br>
&gt;&gt; The DM stats is used in &#39;passage: Report the devicetree source=
&#39;. I<br>
&gt;&gt; know it is sideways but I think it is better to make the output li=
ne<br>
&gt;&gt; more useful than just reporting the devicetree source.<br>
&gt;&gt;<br>
&gt; I believe the DM stats has merits in its own. You could upstream this =
independently and then Passage would be yet another &quot;customer&quot; of=
 the feature.<br>
<br>
I could, but it would just be a debug feature so people might not<br>
think it worth the code space. With the devicetree source it is more<br>
compelling.<br>
<br>
&gt;&gt;<br>
&gt;&gt; The first patch is indeed unrelated. I will pick it up so we can d=
rop<br>
&gt;&gt; it for the next rev.<br>
&gt;&gt;<br>
[..]<br>
<br>
Regards,<br>
Simon<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=3D"ltr">=
<div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cellpadding=
=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px" valign=
=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro-logo-we=
b.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0" cellsp=
acing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&quot;Sans =
Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:rgb(87,8=
7,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=
=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)">|</sp=
an>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=3D"fon=
t-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;font-siz=
e:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a value=
=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><br><a =
href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87);text-=
decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0<span =
style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td></tr>=
</tbody></table></td></tr></tbody></table></div></div></div></div></div><di=
v><div><br style=3D"font-size:small"></div></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--000000000000ad9b2905d006686b--

