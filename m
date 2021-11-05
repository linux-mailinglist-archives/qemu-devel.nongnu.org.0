Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D144671E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:38:13 +0100 (CET)
Received: from localhost ([::1]:50524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2EG-0000zz-GF
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mj27d-0008Qi-8q
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:31:21 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mj27Y-0002Fx-AC
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:31:19 -0400
Received: by mail-ed1-x531.google.com with SMTP id m14so34282991edd.0
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bm7ANq00JCCoK2FuqL3PJZr/z3m/qjIDwAcSKhDav74=;
 b=b3KAoRiuAzEG7vtzNkfrmn/Z6vi8ive2uNuri3S/0gKWDNqQ7/6Q2nHSZn3iJTdTlM
 YsMz8RpiSlrojJ0ahnLTECUrQuV+kEcwJwcpxrS6e3qpodYiLnoKhg45rurFJuFbfguf
 sX6caux1ZcRZ0GWhYjWBl7NP2lywTO39x3hCFYA4I4cMTy6qUPC28azFk1psqMc+iQ3D
 hcvLDxGM5+kGdpKQpHaIlISJhpEwe591XpFbeVmLPXLKvy+3N0+Xnfj/EJ9RCQAn+4k2
 5z2YKmoeGrmssvOnl2PovbP/rVtzpmc686CDhtI9hJzP6KmZ+9nsuuyIRtJkionYIwvP
 Jv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bm7ANq00JCCoK2FuqL3PJZr/z3m/qjIDwAcSKhDav74=;
 b=S/4hhmm/L2cbuPJEqeafvYIRSyp5Hkj7FPrqeH6P0f1yjkCCaOZ5hN1SFJI3d/uSMV
 QKhhUT6zuPUHfVPlGpDve/vjIKEky6J3aqM7RGDfscjpMk3UG2bzc1kQ2keIq6nn5pOd
 rPaZ24gMSrtEbf0C5OhAte888jdFKpkx5FBXfhq8RKiiBOH2iX33A5JL7ZlAZmHlRrGO
 QyPzgfVQa+TcRBk30KJNB0AJ1fypqlc2cncU3yQlaXWSWJsNt8pI3Kqw0MaqAsmQmy0A
 4F7eWl7lQWMY4DD7LSZkl9MLRgIP7TeQmLXdW2cENH+e1ctV2zUtq+799Tr8NCnhM+KZ
 rrtw==
X-Gm-Message-State: AOAM530XDQ6KK7Iji8V3Yyobh6kW4QkIhSFAy+rH0kXkrCAhr57p0DUY
 oPdLGIKiTzIvxWEC3FgmPfeYvIksbRy6J4dt9ta1Gw==
X-Google-Smtp-Source: ABdhPJzQw5sPSbn+fMJABhL7RQZWM3aHxZn3TftcIPCe73XdCB9PxQ7PO5/jSsf87KXpw0cgfZnM5UW5jL1OehE93Nw=
X-Received: by 2002:a17:906:3a0e:: with SMTP id
 z14mr64903737eje.111.1636129874190; 
 Fri, 05 Nov 2021 09:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
 <CAHFG_=V6QEsD63LgBDpJUZkd9rrJ0hoo7aYd7MQ_z2YS6k9UhQ@mail.gmail.com>
 <CAPnjgZ0pbLLjvmD37aSYqjQ28kLgrU0Pox+hQLTH15+wcX+5ow@mail.gmail.com>
 <CAHFG_=XWoKYj5MM+quN=QLjMfXrkhzHWng1yY3xjqLsRAbEXoQ@mail.gmail.com>
 <CAPnjgZ2LXjsSnu5+no5cYFtKE8+V_+NqeUmWupsafZoNX8oRnA@mail.gmail.com>
In-Reply-To: <CAPnjgZ2LXjsSnu5+no5cYFtKE8+V_+NqeUmWupsafZoNX8oRnA@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Fri, 5 Nov 2021 17:31:03 +0100
Message-ID: <CAHFG_=VbajOOdpvbvMy_uFUE7ZGucWf9b0Cxyx9vZhvSsg4OvA@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000f5387805d00d2b4c"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Marek Vasut <marex@denx.de>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jerry Van Baren <vanbaren@cideas.com>, Bin Meng <bmeng.cn@gmail.com>,
 Pavel Herrmann <morpheus.ibis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f5387805d00d2b4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Le ven. 5 nov. 2021 =C3=A0 17:12, Simon Glass <sjg@chromium.org> a =C3=A9cr=
it :

> Hi Fran=C3=A7ois,
>
> On Fri, 5 Nov 2021 at 02:27, Fran=C3=A7ois Ozog <francois.ozog@linaro.org=
>
> wrote:
> >
> >
> >
> > On Fri, 5 Nov 2021 at 03:02, Simon Glass <sjg@chromium.org> wrote:
> >>
> >> Hi Fran=C3=A7ois,
> >>
> >> On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog <francois.ozog@linaro.=
org>
> wrote:
> >> >
> >> > Hi Simon,
> >> >
> >> > On Tue, 2 Nov 2021 at 15:59, Simon Glass <sjg@chromium.org> wrote:
> >> >>
> >> >> Hi Fran=C3=A7ois,
> >> >>
> >> >> On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog <francois.ozog@lina=
ro.org>
> wrote:
> >> >> >
> >> >> > Hi Simon,
> >> >> >
> >> >> > this seems a great endeavor. I'd like to better understand the
> scope of it.
> >> >> >
> >> >> > Is it to be used as part of what could become a U-Boot entry ABI
> scheme? By that I mean giving some fixed aspects
> >> >> > to U-Boot entry while letting boards to have flexibility (say for
> instance that the first 5 architecture ABI
> >> >> > parameter registers are reserved for U-Boot), and the Passage is
> about specifying either those reserved registers
> >> >> > or one of them?
> >> >>
> >> >> The goal is to provide a standard entry scheme for all firmware
> >> >> binaries. Whether it achieves that (or can with some mods) is up fo=
r
> >> >> discussion.
> >> >>
> >> > If you say
> >> > a) define a U-Boot entry ABI and providing a firmware-to-firmware
> information passing facility which would be part of all firmware ABIs (as
> the projects decide to define their own ABI) it looks good.
> >> > but If you say
> >>
> >> It is an ABI to be adopted by U-Boot but also other firmware. For
> >> example, if TF-A calls U-Boot it should use standard passage. If
> >> U-Boot calls TF-A or Optee it should use standard passage.
> >>
> >> > b) define a standard entry scheme (register map, processor state, MM=
U
> state, SMMU state, GIC state...) that does not look realistic.
> >>
> >> No I don't mean that. This data structure could be used in any state,
> >> so long as the two registers are set correctly.
> >>
> >> > I think you mean a) but just want to be sure.
> >>
> >> Yes I think so.
> >>
> >> >>
> >> >> Re the registers, do you think we need 5?
> >> >>
> >>
> >> I don't :-)
> >>
> >> >> >
> >> >> > Thinking entry ABI, here is what I observed on Arm:
> >> >> >
> >> >> > Linux has two entry ABIs:
> >> >> > - plain: x0 =3D dtb;
> >> >> >           command line =3D dtb:/chosen/bootargs; initrd =3D
> dtb:/chosen/linux,initrd-*
> >> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
> >> >> >            dtb =3D EFI_UUID config table; initrd =3D
> efi:<loadfile2(INITRD vendor media UUID); command line =3D efi:
> image_protocol::load_options
> >> >> >
> >> >> > U-Boot (proper) has plenty of schemes:
> >> >> > - dtb is passed as either x0, x1, fixed memory area (Qemu which i=
s
> bad in itself), or other registers
> >> >> > - additional information passing: board specific register scheme,
> SMC calls
> >> >> > - U-Boot for RPI boards implement a Linux shaped entry ABI to be
> launched by Videocore firmware
> >> >> >
> >> >> > Based on all the above, I would tend to think that RPI scheme is =
a
> good idea but also
> >> >> > shall not prevent additional schemes for the boards.
> >> >>
> >> >> I was not actually considering Linux since I believe/assume its ent=
ry
> >> >> scheme is fixed and not up for discussion.
> >> >>
> >> >> I also did not think about the EFI case. As I understand it we cann=
ot
> >> >> touch it as it is used by UEFI today. Maybe it is even in the
> >> >> standard?
> >> >
> >> > It is in the spec and we are making it evolve, or its understanding
> evolve (jurisprudence) for instance on initrd standard handling.
> >>
> >> Well perhaps we could merge it with standard passage. But EFI is not
> >> going to want to use a bloblist, it will want to use a HOB.
> >>
> >> >>
> >> >>
> >> >> Really I am hoping we can start afresh...?
> >> >>
> >> >> >
> >> >> > What about a U-Boot Arm entry ABI like:
> >> >> > - plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserved>, =
other
> registers are per platform, SMC calls allowed too
> >> >>
> >> >> Hmm we don't actually need the dtb as it is available in the
> bloblist.
> >> >
> >> > If you don't have x0=3Ddtb, then you will not be able to use U-Boot =
on
> RPI4.
> >> > Unless you want to redo everything the RPI firmware is doing.
> >>
> >> That's right, RPI cannot support standard passage. It is not
> >> open-source firmware so it isn't really relevant to this discussion.
> >> It will just do what it does and have limited functionality, with
> >> work-arounds to deal with the pain, as one might expect.
> >>
> > So you are seeing two "all-or-nothing" options:
> > <specific>: U-Boot entry is board specific as it is today
> > <purepassage>: A new form where the only parameter is a head of
> bloblist, one of those blobs contain a DT
> >  You propose to mandate a DT for all boards make sense in that
> environment.
> > For RPI4, you just ignore everything the prior boot loader does because
> it is not <passage> compliant.
>
> It's not that. It's just that it is closed-source, so not relevant to
> the discussion here. They could open-source it and then we could
> consider it, but it has been closed-source for years now, so why would
> we think that would happen?
>
> >
> > This reinforces my opposition to the mandatory DT proposal.
> >
> > a third option is I think way more attractive:
> > <optpassage>: shaped after the architecture Linux entry (ie. first
> parameter is dtb) [+ passage head (i.e. second parameter is pointer to
> passage head)]
> >
> > This way, you make U-Boot entry clean in RPI4, Apple M1, Qemu,
> SystemReady contexts
> > and get a well deserved standardized information passing between prior
> loaders and U-Boot.
> >
> > The three options are possible though, you could select a U-Boot entry
> CONFIG option for:
> > <specific>
> > <optpassage>
> > <purepassage>
> >
> > But despite it would be technically feasible, I don't think it is goes
> in the right direction.
>
> OK. Do you think we need a separate devicetree pointer, rather than
> forcing it to be inside the created bloblist?
>
> I'd like to understand what problem you are solving with this. I am
> trying to figure out a firmware-to-firmware mini-ABI (just a few
> register values) that can be used in open-source projects. The ABI is
> not intended to be used with Linux (I am unsure of the benefit it
> would give and whether it is feasible to change the current one).
>
> You are talking about the Linux entry mechanism. What relevance does
> that have for firmware?
>
> I understand that some projects already implement the Linux mechanism,
> but that is because they expect to jump straight to Linux, not have
> U-Boot in the path. So IMO standard passage offers no benefit to them.
>
> To address them in turn:
> - rpi4 - closed source, who cares?
> - Apple M1 - we could probably expand it to pass a bloblist, but it
> would be confusing unless we share registers, as you suggest
> - Qemu - I already tried to update that and got pushback...do you
> really think those guys are going to want to add a bloblist? So again,
> who cares?
> - SystemReady - not sure what this means in practice, but it would be
> good if SystemReady could use standard passage
>
> So let's say we have an optional standard-passage thing and we use
> registers such that it is similar to Linux and EFI and just expands on
> them.
>
> The first problem is that Linux and EFI seem to be completely
> incompatible. Can that be changed, perhaps on the EFI side? If not,
> we need two separate protocols.
>
> I'll ignore EFI for now. So we might have:
>
> r0 =3D 0
> r1 =3D machine number (0?)
> r2 =3D dtb pointer
> r3 =3D bloblist pointer, 0 if missing
> r14 =3D return address
>
> or
>
> x0 =3D dtb
> x1 =3D bloblist pointer, 0 if missing
> x30 =3D return address
>
That=E2=80=99s essentially what I proposed!
you do not force the DTB to be found in the bloblist, and shape the U-Boot
entry after the Linux entry ABI. Good !
I was saving a few registers for future ABI evolution so that boards can be
guaranteed to have their board specific registers properly protected. The 5
registers, leaving 3 undefined was just =C2=AB why not =C2=BB. We could als=
o have a
cookie in x1: high 48 bits magic low 16 ABI version, x2=3Dbloblist pointer.


> For EFI, we could add a blob to the bloblist containing the system
> table and handle, perhaps? Otherwise:
>
> x2 - efi handle
> x3 - system table
>
> Is that along the lines of what you are thinking?
>
No, efi entry is only x0=3Defi handle, x1=3Dsystem table . I was trying to =
find
a way to have passage when U-Boot is loaded as a UEFI app (your other patch
set to make U-Boot a more integrated UEFi app). Let=E2=80=99s say that a U-=
Boot
aware DXE driver/protocol actually populate such a table, it could be a
communication channel between that driver and U-Boot.

>
> But still, please respond above so I can understand what problem you
> are worried about.
>
> Regards,
> Simon
>
>
> >
> >> >>
> >> >> But I added an offset to it as a convenience.
> >> >>
> >> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  (whe=
n
> U-Boot is launched as an EFI app)
> >> >> >        dtb =3D EFI_UUID config table, + Passage =3D Passage UUID
> config table
> >> >>
> >> >> I don't understand the last line. Where is the passage info /
> >> >> bloblist? Do you mean it goes in the HOB list with a UUID? I suppos=
e
> >> >> that is the most EFI-compatible way.
> >> >
> >> > The Passage config table  could just contain the "head" of the
> bloblist/Passage information.
> >>
> >> If UEFI wants to deal with standard passage, that is...
> >>
> >> >>
> >> >>
> >> >> What do you think about the idea of using an offset into the blobli=
st
> >> >> for the dtb?
> >> >
> >> > It is possible but as I said, failing to mimic Linux entry ABI would
> miss the opportunity to just boot without changes on RPI4.
> >>
> >> See above. Broadcom could look at open-sourcing their bootloader if
> they wish.
> >>
> >> >>
> >> >> Also, can we make the standard passage ABI a build-time
> >> >> option, so it is deterministic?
> >> >>
> >> > Looks good. I would look into stating that for SystemReady we would
> advise to use that option and make it standard for Trusted Substrate
> (Linaro recipes that we upstreaming to make SystemReady compliance easy a=
nd
> consistent across platforms).
> >>
> >> OK. I mean that if the option is enabled, then standard passage must
> >> be provided / emitted or things won't work. If the option is disabled,
> >> then standard passage is not used. In other words, we are looking for
> >> magic values in registers, etc, just enabling/disabling it at
> >> build-time.
> >>
> >> >>
> >> >> >
> >> >> > We could further leverage Passage to pass Operating Systems
> parameters that could be removed from device tree (migration of /chosen t=
o
> Passage). Memory inventory would still be in DT but allocations for CMA o=
r
> GPUs would be in Passage. This idea is to reach a point where  device tre=
e
> is a "pristine" hardware description.
> >> >>
> >> >> I'm worried about this becoming a substitute for devicetree. Really
> my
> >> >> intent is to provide a way to pass simple info, whereas what you ta=
lk
> >> >> about there seems like something that should be DT, just that it
> might
> >> >> need suitable bindings.
> >> >>
> >> > I see your point and I agree It should not be a substitute.
> >> > here is an expanded version of what I had in mind when I wrote those
> lines.
> >> > cma, initrd and other Linux kernel parameters can be conveyed either
> through command line or DT.
> >> > When using the non UEFI Linux entry ABI, you need to use the DT to
> pass those parameters.
> >> > When using the UEFI Linux entry ABI, you *can* (not must) use the
> command line to pass all information, leaving the DT passed to the OS
> without any /chosen.
> >> > When introducing Passage, I was wondering if we could pass command
> line to Linux and, same as UEFI, leave the DT free from /chosen.
> >> > I am not sure it is a good goal though. I may be too pushing for a D=
T
> free from parameters.
> >>
> >> We could. Are there benefits to that?
> >>
> >> I doubt we would pass the standard passage to Linux as a bloblist. I
> >> imagine something like this. The bloblist sits in memory with some
> >> things in it, including a devicetree, perhaps an SMBIOS table and a
> >> TPM log. But when U-Boot calls Linux it puts the address/size of those
> >> individual things in the devicetree. They don't move and are still
> >> contiguous in memory, but the bloblist around them is forgotten. Linux
> >> doesn't know that the three separate things it is picking up are
> >> actually part of a bloblist structure, since it doesn't care about
> >> that. Even a console log could work the same way. That way we don't
> >> end up trying to teach Linux about bloblist when it already has a
> >> perfectly good means to accept these items.
> >>
> >> For ACPI I see things a similar way. The ACPI tables can point to
> >> things that *happen* to be in a bloblist, but without any knowledge of
> >> that needed in Linux, grub, etc.
> >>
> >> >>
> >> >> As you know I have more expansive views about what should be in DT.
> >> >
> >> > I think both of us are huge supporters of DT format and self
> describing capabilities.
> >> > I am inclined to put rules into what fits into what lands in the DT
> that is passed to the OS.
> >> > I am a fan of having DT used more in ad-hoc files.
> >>
> >> Me too.
> >>
> >> >>
> >> >> >
> >> >> > Cheers
> >> >> >
> >> >> > PS: as Ilias mentions, this patch set contains bug fixes, non
> immediately related additional functions (DM stats). It would be great to
> carve those out to fast path them and keep this one with the very core of
> your idea.
> >> >>
> >> >> The DM stats is used in 'passage: Report the devicetree source'. I
> >> >> know it is sideways but I think it is better to make the output lin=
e
> >> >> more useful than just reporting the devicetree source.
> >> >>
> >> > I believe the DM stats has merits in its own. You could upstream thi=
s
> independently and then Passage would be yet another "customer" of the
> feature.
> >>
> >> I could, but it would just be a debug feature so people might not
> >> think it worth the code space. With the devicetree source it is more
> >> compelling.
> >>
> >> >>
> >> >> The first patch is indeed unrelated. I will pick it up so we can dr=
op
> >> >> it for the next rev.
> >> >>
> >> [..]
> >>
> >> Regards,
> >> Simon
> >
> >
> >
> > --
> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
> > T: +33.67221.6485
> > francois.ozog@linaro.org | Skype: ffozog
> >
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000f5387805d00d2b4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon,</div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 5 nov. 2021 =C3=A0 17:12, Simo=
n Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Fran=C3=A7ois,=
<br>
<br>
On Fri, 5 Nov 2021 at 02:27, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:franc=
ois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, 5 Nov 2021 at 03:02, Simon Glass &lt;<a href=3D"mailto:sjg@chr=
omium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog &lt;<a href=3D"mai=
lto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a=
>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Simon,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, 2 Nov 2021 at 15:59, Simon Glass &lt;<a href=3D"mailt=
o:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog &lt;<a hr=
ef=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@lina=
ro.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Hi Simon,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; this seems a great endeavor. I&#39;d like to better =
understand the scope of it.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Is it to be used as part of what could become a U-Bo=
ot entry ABI scheme? By that I mean giving some fixed aspects<br>
&gt;&gt; &gt;&gt; &gt; to U-Boot entry while letting boards to have flexibi=
lity (say for instance that the first 5 architecture ABI<br>
&gt;&gt; &gt;&gt; &gt; parameter registers are reserved for U-Boot), and th=
e Passage is about specifying either those reserved registers<br>
&gt;&gt; &gt;&gt; &gt; or one of them?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The goal is to provide a standard entry scheme for all fi=
rmware<br>
&gt;&gt; &gt;&gt; binaries. Whether it achieves that (or can with some mods=
) is up for<br>
&gt;&gt; &gt;&gt; discussion.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; If you say<br>
&gt;&gt; &gt; a) define a U-Boot entry ABI and providing a firmware-to-firm=
ware information passing facility which would be part of all firmware ABIs =
(as the projects decide to define their own ABI) it looks good.<br>
&gt;&gt; &gt; but If you say<br>
&gt;&gt;<br>
&gt;&gt; It is an ABI to be adopted by U-Boot but also other firmware. For<=
br>
&gt;&gt; example, if TF-A calls U-Boot it should use standard passage. If<b=
r>
&gt;&gt; U-Boot calls TF-A or Optee it should use standard passage.<br>
&gt;&gt;<br>
&gt;&gt; &gt; b) define a standard entry scheme (register map, processor st=
ate, MMU state, SMMU state, GIC state...) that does not look realistic.<br>
&gt;&gt;<br>
&gt;&gt; No I don&#39;t mean that. This data structure could be used in any=
 state,<br>
&gt;&gt; so long as the two registers are set correctly.<br>
&gt;&gt;<br>
&gt;&gt; &gt; I think you mean a) but just want to be sure.<br>
&gt;&gt;<br>
&gt;&gt; Yes I think so.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Re the registers, do you think we need 5?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t :-)<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Thinking entry ABI, here is what I observed on Arm:<=
br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Linux has two entry ABIs:<br>
&gt;&gt; &gt;&gt; &gt; - plain: x0 =3D dtb;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command line=
 =3D dtb:/chosen/bootargs; initrd =3D dtb:/chosen/linux,initrd-*<br>
&gt;&gt; &gt;&gt; &gt; - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn a=
ddress;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb =3D EFI=
_UUID config table; initrd =3D efi:&lt;loadfile2(INITRD vendor media UUID);=
 command line =3D efi: image_protocol::load_options<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; U-Boot (proper) has plenty of schemes:<br>
&gt;&gt; &gt;&gt; &gt; - dtb is passed as either x0, x1, fixed memory area =
(Qemu which is bad in itself), or other registers<br>
&gt;&gt; &gt;&gt; &gt; - additional information passing: board specific reg=
ister scheme, SMC calls<br>
&gt;&gt; &gt;&gt; &gt; - U-Boot for RPI boards implement a Linux shaped ent=
ry ABI to be launched by Videocore firmware<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Based on all the above, I would tend to think that R=
PI scheme is a good idea but also<br>
&gt;&gt; &gt;&gt; &gt; shall not prevent additional schemes for the boards.=
<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I was not actually considering Linux since I believe/assu=
me its entry<br>
&gt;&gt; &gt;&gt; scheme is fixed and not up for discussion.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I also did not think about the EFI case. As I understand =
it we cannot<br>
&gt;&gt; &gt;&gt; touch it as it is used by UEFI today. Maybe it is even in=
 the<br>
&gt;&gt; &gt;&gt; standard?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It is in the spec and we are making it evolve, or its underst=
anding evolve (jurisprudence) for instance on initrd standard handling.<br>
&gt;&gt;<br>
&gt;&gt; Well perhaps we could merge it with standard passage. But EFI is n=
ot<br>
&gt;&gt; going to want to use a bloblist, it will want to use a HOB.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Really I am hoping we can start afresh...?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; What about a U-Boot Arm entry ABI like:<br>
&gt;&gt; &gt;&gt; &gt; - plain: x0=3Ddtb, x1=3D&lt;Passage defined&gt;, x2-=
x5 =3D &lt;reserved&gt;, other registers are per platform, SMC calls allowe=
d too<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hmm we don&#39;t actually need the dtb as it is available=
 in the bloblist.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If you don&#39;t have x0=3Ddtb, then you will not be able to =
use U-Boot on RPI4.<br>
&gt;&gt; &gt; Unless you want to redo everything the RPI firmware is doing.=
<br>
&gt;&gt;<br>
&gt;&gt; That&#39;s right, RPI cannot support standard passage. It is not<b=
r>
&gt;&gt; open-source firmware so it isn&#39;t really relevant to this discu=
ssion.<br>
&gt;&gt; It will just do what it does and have limited functionality, with<=
br>
&gt;&gt; work-arounds to deal with the pain, as one might expect.<br>
&gt;&gt;<br>
&gt; So you are seeing two &quot;all-or-nothing&quot; options:<br>
&gt; &lt;specific&gt;: U-Boot entry is board specific as it is today<br>
&gt; &lt;purepassage&gt;: A new form where the only parameter is a head of =
bloblist, one of those blobs contain a DT<br>
&gt;=C2=A0 You propose to mandate a DT for all boards make sense in that en=
vironment.<br>
&gt; For RPI4, you just ignore everything the prior boot loader does becaus=
e it is not &lt;passage&gt; compliant.<br>
<br>
It&#39;s not that. It&#39;s just that it is closed-source, so not relevant =
to<br>
the discussion here. They could open-source it and then we could<br>
consider it, but it has been closed-source for years now, so why would<br>
we think that would happen?<br>
<br>
&gt;<br>
&gt; This reinforces my opposition to the mandatory DT proposal.<br>
&gt;<br>
&gt; a third option is I think way more attractive:<br>
&gt; &lt;optpassage&gt;: shaped after the architecture Linux entry (ie. fir=
st parameter is dtb) [+ passage head (i.e. second parameter is pointer to p=
assage head)]<br>
&gt;<br>
&gt; This way, you make U-Boot entry clean in RPI4, Apple M1, Qemu, SystemR=
eady contexts<br>
&gt; and get a well deserved standardized information passing between prior=
 loaders and U-Boot.<br>
&gt;<br>
&gt; The three options are possible though, you could select a U-Boot entry=
 CONFIG option for:<br>
&gt; &lt;specific&gt;<br>
&gt; &lt;optpassage&gt;<br>
&gt; &lt;purepassage&gt;<br>
&gt;<br>
&gt; But despite it would be technically feasible, I don&#39;t think it is =
goes in the right direction.<br>
<br>
OK. Do you think we need a separate devicetree pointer, rather than<br>
forcing it to be inside the created bloblist?<br>
<br>
I&#39;d like to understand what problem you are solving with this. I am<br>
trying to figure out a firmware-to-firmware mini-ABI (just a few<br>
register values) that can be used in open-source projects. The ABI is<br>
not intended to be used with Linux (I am unsure of the benefit it<br>
would give and whether it is feasible to change the current one).<br>
<br>
You are talking about the Linux entry mechanism. What relevance does<br>
that have for firmware?<br>
<br>
I understand that some projects already implement the Linux mechanism,<br>
but that is because they expect to jump straight to Linux, not have<br>
U-Boot in the path. So IMO standard passage offers no benefit to them.<br>
<br>
To address them in turn:<br>
- rpi4 - closed source, who cares?<br>
- Apple M1 - we could probably expand it to pass a bloblist, but it<br>
would be confusing unless we share registers, as you suggest<br>
- Qemu - I already tried to update that and got pushback...do you<br>
really think those guys are going to want to add a bloblist? So again,<br>
who cares?<br>
- SystemReady - not sure what this means in practice, but it would be<br>
good if SystemReady could use standard passage<br>
<br>
So let&#39;s say we have an optional standard-passage thing and we use<br>
registers such that it is similar to Linux and EFI and just expands on<br>
them.<br>
<br>
The first problem is that Linux and EFI seem to be completely<br>
incompatible. Can that be changed, perhaps on the EFI side? If not,<br>
we need two separate protocols.<br>
<br>
I&#39;ll ignore EFI for now. So we might have:<br>
<br>
r0 =3D 0<br>
r1 =3D machine number (0?)<br>
r2 =3D dtb pointer<br>
r3 =3D bloblist pointer, 0 if missing<br>
r14 =3D return address<br>
<br>
or<br>
<br>
x0 =3D dtb<br>
x1 =3D bloblist pointer, 0 if missing<br>
x30 =3D return address<br>
</blockquote><div dir=3D"auto">That=E2=80=99s essentially what I proposed!<=
/div><div dir=3D"auto">you do not force the DTB to be found in the bloblist=
, and shape the U-Boot entry after the Linux entry ABI. Good !</div><div di=
r=3D"auto">I was saving a few registers for future ABI evolution so that bo=
ards can be guaranteed to have their board specific registers properly prot=
ected. The 5 registers, leaving 3 undefined was just =C2=AB why not =C2=BB.=
 We could also have a cookie in x1: high 48 bits magic low 16 ABI version, =
x2=3Dbloblist pointer.</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
For EFI, we could add a blob to the bloblist containing the system<br>
table and handle, perhaps? Otherwise:<br>
<br>
x2 - efi handle<br>
x3 - system table<br>
<br>
Is that along the lines of what you are thinking?<br>
</blockquote><div dir=3D"auto">No, efi entry is only x0=3Defi handle, x1=3D=
system table . I was trying to find a way to have passage when U-Boot is lo=
aded as a UEFI app (your other patch set to make U-Boot a more integrated U=
EFi app). Let=E2=80=99s say that a U-Boot aware DXE driver/protocol actuall=
y populate such a table, it could be a communication channel between that d=
river and U-Boot.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
But still, please respond above so I can understand what problem you<br>
are worried about.<br>
<br>
Regards,<br>
Simon<br>
<br>
<br>
&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; But I added an offset to it as a convenience.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn a=
ddress;=C2=A0 (when U-Boot is launched as an EFI app)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb =3D EFI_UUID config t=
able, + Passage =3D Passage UUID config table<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I don&#39;t understand the last line. Where is the passag=
e info /<br>
&gt;&gt; &gt;&gt; bloblist? Do you mean it goes in the HOB list with a UUID=
? I suppose<br>
&gt;&gt; &gt;&gt; that is the most EFI-compatible way.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The Passage config table=C2=A0 could just contain the &quot;h=
ead&quot; of the bloblist/Passage information.<br>
&gt;&gt;<br>
&gt;&gt; If UEFI wants to deal with standard passage, that is...<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; What do you think about the idea of using an offset into =
the bloblist<br>
&gt;&gt; &gt;&gt; for the dtb?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It is possible but as I said, failing to mimic Linux entry AB=
I would miss the opportunity to just boot without changes on RPI4.<br>
&gt;&gt;<br>
&gt;&gt; See above. Broadcom could look at open-sourcing their bootloader i=
f they wish.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Also, can we make the standard passage ABI a build-time<b=
r>
&gt;&gt; &gt;&gt; option, so it is deterministic?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; Looks good. I would look into stating that for SystemReady we=
 would advise to use that option and make it standard for Trusted Substrate=
 (Linaro recipes that we upstreaming to make SystemReady compliance easy an=
d consistent across platforms).<br>
&gt;&gt;<br>
&gt;&gt; OK. I mean that if the option is enabled, then standard passage mu=
st<br>
&gt;&gt; be provided / emitted or things won&#39;t work. If the option is d=
isabled,<br>
&gt;&gt; then standard passage is not used. In other words, we are looking =
for<br>
&gt;&gt; magic values in registers, etc, just enabling/disabling it at<br>
&gt;&gt; build-time.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; We could further leverage Passage to pass Operating =
Systems parameters that could be removed from device tree (migration of /ch=
osen to Passage). Memory inventory would still be in DT but allocations for=
 CMA or GPUs would be in Passage. This idea is to reach a point where=C2=A0=
 device tree is a &quot;pristine&quot; hardware description.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I&#39;m worried about this becoming a substitute for devi=
cetree. Really my<br>
&gt;&gt; &gt;&gt; intent is to provide a way to pass simple info, whereas w=
hat you talk<br>
&gt;&gt; &gt;&gt; about there seems like something that should be DT, just =
that it might<br>
&gt;&gt; &gt;&gt; need suitable bindings.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; I see your point and I agree It should not be a substitute.<b=
r>
&gt;&gt; &gt; here is an expanded version of what I had in mind when I wrot=
e those lines.<br>
&gt;&gt; &gt; cma, initrd and other Linux kernel parameters can be conveyed=
 either through command line or DT.<br>
&gt;&gt; &gt; When using the non UEFI Linux entry ABI, you need to use the =
DT to pass those parameters.<br>
&gt;&gt; &gt; When using the UEFI Linux entry ABI, you *can* (not must) use=
 the command line to pass all information, leaving the DT passed to the OS =
without any /chosen.<br>
&gt;&gt; &gt; When introducing Passage, I was wondering if we could pass co=
mmand line to Linux and, same as UEFI, leave the DT free from /chosen.<br>
&gt;&gt; &gt; I am not sure it is a good goal though. I may be too pushing =
for a DT free from parameters.<br>
&gt;&gt;<br>
&gt;&gt; We could. Are there benefits to that?<br>
&gt;&gt;<br>
&gt;&gt; I doubt we would pass the standard passage to Linux as a bloblist.=
 I<br>
&gt;&gt; imagine something like this. The bloblist sits in memory with some=
<br>
&gt;&gt; things in it, including a devicetree, perhaps an SMBIOS table and =
a<br>
&gt;&gt; TPM log. But when U-Boot calls Linux it puts the address/size of t=
hose<br>
&gt;&gt; individual things in the devicetree. They don&#39;t move and are s=
till<br>
&gt;&gt; contiguous in memory, but the bloblist around them is forgotten. L=
inux<br>
&gt;&gt; doesn&#39;t know that the three separate things it is picking up a=
re<br>
&gt;&gt; actually part of a bloblist structure, since it doesn&#39;t care a=
bout<br>
&gt;&gt; that. Even a console log could work the same way. That way we don&=
#39;t<br>
&gt;&gt; end up trying to teach Linux about bloblist when it already has a<=
br>
&gt;&gt; perfectly good means to accept these items.<br>
&gt;&gt;<br>
&gt;&gt; For ACPI I see things a similar way. The ACPI tables can point to<=
br>
&gt;&gt; things that *happen* to be in a bloblist, but without any knowledg=
e of<br>
&gt;&gt; that needed in Linux, grub, etc.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; As you know I have more expansive views about what should=
 be in DT.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I think both of us are huge supporters of DT format and self =
describing capabilities.<br>
&gt;&gt; &gt; I am inclined to put rules into what fits into what lands in =
the DT that is passed to the OS.<br>
&gt;&gt; &gt; I am a fan of having DT used more in ad-hoc files.<br>
&gt;&gt;<br>
&gt;&gt; Me too.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Cheers<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; PS: as Ilias mentions, this patch set contains bug f=
ixes, non immediately related additional functions (DM stats). It would be =
great to carve those out to fast path them and keep this one with the very =
core of your idea.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The DM stats is used in &#39;passage: Report the devicetr=
ee source&#39;. I<br>
&gt;&gt; &gt;&gt; know it is sideways but I think it is better to make the =
output line<br>
&gt;&gt; &gt;&gt; more useful than just reporting the devicetree source.<br=
>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; I believe the DM stats has merits in its own. You could upstr=
eam this independently and then Passage would be yet another &quot;customer=
&quot; of the feature.<br>
&gt;&gt;<br>
&gt;&gt; I could, but it would just be a debug feature so people might not<=
br>
&gt;&gt; think it worth the code space. With the devicetree source it is mo=
re<br>
&gt;&gt; compelling.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The first patch is indeed unrelated. I will pick it up so=
 we can drop<br>
&gt;&gt; &gt;&gt; it for the next rev.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; [..]<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Simon<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development<=
br>
&gt; T: +33.67221.6485<br>
&gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois=
.ozog@linaro.org</a> | Skype: ffozog<br>
&gt;<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><table style=3D"font-size:small" border=3D"0" cel=
lpadding=3D"0" cellspacing=3D"0"><tbody><tr><td style=3D"padding-right:10px=
" valign=3D"top"><img src=3D"https://static.linaro.org/common/images/linaro=
-logo-web.png"></td><td valign=3D"top"><table border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0"><tbody><tr><td style=3D"font-family:Arial,Helvetica,&qu=
ot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:0px;color:=
rgb(87,87,87)" valign=3D"top"><span style=3D"font-weight:bold">Fran=C3=A7oi=
s-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=A0<span style=3D"color:rgb(161,161,161)=
">|</span>=C2=A0<i>Director Business Development</i></td></tr><tr><td style=
=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:nowrap;f=
ont-size:9pt;padding-top:2px;color:rgb(87,87,87)" valign=3D"top">T:=C2=A0<a=
 value=3D"+393384075993" style=3D"color:rgb(17,85,204)">+33.67221.6485</a><=
br><a href=3D"mailto:francois.ozog@linaro.org" style=3D"color:rgb(87,87,87)=
;text-decoration:none" target=3D"_blank">francois.ozog@linaro.org</a>=C2=A0=
<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0Skype:=C2=A0ffozog</td=
></tr></tbody></table></td></tr></tbody></table></div></div></div></div></d=
iv><div><div><br style=3D"font-size:small"></div></div></div></div></div></=
div></div></div></div></div></div></div></div></div></div></div></div>

--000000000000f5387805d00d2b4c--

