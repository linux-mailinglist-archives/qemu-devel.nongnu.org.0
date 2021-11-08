Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B844499F1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:33:49 +0100 (CET)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7ae-0000ZT-R2
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:33:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mk7V0-0008Qd-Lm
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:27:58 -0500
Received: from [2a00:1450:4864:20::52e] (port=38576
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mk7Up-0003Jz-Pf
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:27:53 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z21so19528907edb.5
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z8UAAE77ZK6VR1SUbTcSK96RDAJSjEsLAEDeO7IpNPE=;
 b=typyS3yLSlvWb8vYkeMa7Pi8oUeGekiHwjUaBcafRwQ18OGa4IPCN19/ZUfm9BTdGX
 PRQqBc4selQOQ3npYJUYJw1G1ZgV6IYkk1BKA33zTX8EhObbj6j5FASgiBeaRhyHbduD
 IbDc+f4A87o0M52WiXSqX77ZFjsYr2SnRaQJConSnKt3jDC/CS+IRzRBeehBZN6tzx3z
 oW57yRq2gcVvHfeh8dwDkR1mfMrVR73lHpuF1MiveHzfNXILkC38NRlhKLRx6U8cSUFz
 TfDlQHOM7/nfB1zhXTPsbLTMp6u5LJc2BrT7witgTH2kz5y36QVCYrOpX6TfUer0bmcH
 nxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8UAAE77ZK6VR1SUbTcSK96RDAJSjEsLAEDeO7IpNPE=;
 b=CknflE5l8RZMhmBzrkmyxjEs9h9Tq8kecPhaSgHx7BxSguxYO/TlV1YugMMvQWJf12
 mn7FkSjJ8JXmoU5rXSQWYv/4bLCTXQ2LtN+OHHWTZk4YQcBbbZMXvoKrPbXAEZ83u6vt
 hBQJwGpTG2OV0Or7CF+vpeNzpWDBKPCVOIp+3x8Tm5kNt3w390sJc9LX8Gl2tJpGJhS2
 do3qzrHhnJqa85Cf/qAq/kbTZWi/JGD5k1m8/teoSReFw1lEHr72HdNGhHQhgHUTwq72
 TAgLRpOD3swCM9Og/JS7sfdSFPJDjQJ0ir7XnbQSLb01q3r5sUk3fm89npxdBj0kDOJu
 GNfw==
X-Gm-Message-State: AOAM530c4SVB93iOfcc8D7lk2pKsQM88GgkJx+dZmY31+hc0bDOM2D22
 O7JE00iMrvk5cXtXfV4iK1uGdqJ7y4+W05urnb8f8Z9nqgAmlw==
X-Google-Smtp-Source: ABdhPJxe9/z4nzC9/QGKzyr+JKqhnl2BmhrpWJmsd/NEHUO/CMGw33gp/CRx8rLSfI/Bxkx85Ws7qRhpILbwMM7tsAg=
X-Received: by 2002:a17:906:7d09:: with SMTP id
 u9mr625019ejo.120.1636388431193; 
 Mon, 08 Nov 2021 08:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20211101011734.1614781-1-sjg@chromium.org>
 <CAHFG_=X1DeBFkzwFBkirMkmHB0_OSa9OkQj+CvpG6dT5HZEWBA@mail.gmail.com>
 <CAPnjgZ1we6-nJ1RXz3TK67c7Pj9Znh++rBy-SYtECZURt8bLWw@mail.gmail.com>
 <CAHFG_=V6QEsD63LgBDpJUZkd9rrJ0hoo7aYd7MQ_z2YS6k9UhQ@mail.gmail.com>
 <CAPnjgZ0pbLLjvmD37aSYqjQ28kLgrU0Pox+hQLTH15+wcX+5ow@mail.gmail.com>
 <CAHFG_=XWoKYj5MM+quN=QLjMfXrkhzHWng1yY3xjqLsRAbEXoQ@mail.gmail.com>
 <CAPnjgZ2LXjsSnu5+no5cYFtKE8+V_+NqeUmWupsafZoNX8oRnA@mail.gmail.com>
 <CAHFG_=VbajOOdpvbvMy_uFUE7ZGucWf9b0Cxyx9vZhvSsg4OvA@mail.gmail.com>
 <CAPnjgZ2ximaTHshVEqUnjF6_qR+M5XifVAc8-+xHvKeVbFmf5g@mail.gmail.com>
In-Reply-To: <CAPnjgZ2ximaTHshVEqUnjF6_qR+M5XifVAc8-+xHvKeVbFmf5g@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Mon, 8 Nov 2021 17:20:20 +0100
Message-ID: <CAHFG_=XYsCrPoKG2fU7an-Dx9G76ttWFM1huYFD1cHp0O_E16Q@mail.gmail.com>
Subject: Re: [PATCH 00/31] passage: Define a standard for firmware data flow
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000002801ab05d0495ff1"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--0000000000002801ab05d0495ff1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Nov 2021 at 18:17, Simon Glass <sjg@chromium.org> wrote:

> ) to signal Hi Fran=C3=A7ois,
>
> On Fri, 5 Nov 2021 at 10:31, Fran=C3=A7ois Ozog <francois.ozog@linaro.org=
>
> wrote:
> >
> > Hi Simon,
> >
> > Le ven. 5 nov. 2021 =C3=A0 17:12, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
> >>
> >> Hi Fran=C3=A7ois,
> >>
> >> On Fri, 5 Nov 2021 at 02:27, Fran=C3=A7ois Ozog <francois.ozog@linaro.=
org>
> wrote:
> >> >
> >> >
> >> >
> >> > On Fri, 5 Nov 2021 at 03:02, Simon Glass <sjg@chromium.org> wrote:
> >> >>
> >> >> Hi Fran=C3=A7ois,
> >> >>
> >> >> On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog <francois.ozog@lina=
ro.org>
> wrote:
> >> >> >
> >> >> > Hi Simon,
> >> >> >
> >> >> > On Tue, 2 Nov 2021 at 15:59, Simon Glass <sjg@chromium.org> wrote=
:
> >> >> >>
> >> >> >> Hi Fran=C3=A7ois,
> >> >> >>
> >> >> >> On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog <
> francois.ozog@linaro.org> wrote:
> >> >> >> >
> >> >> >> > Hi Simon,
> >> >> >> >
> >> >> >> > this seems a great endeavor. I'd like to better understand the
> scope of it.
> >> >> >> >
> >> >> >> > Is it to be used as part of what could become a U-Boot entry
> ABI scheme? By that I mean giving some fixed aspects
> >> >> >> > to U-Boot entry while letting boards to have flexibility (say
> for instance that the first 5 architecture ABI
> >> >> >> > parameter registers are reserved for U-Boot), and the Passage
> is about specifying either those reserved registers
> >> >> >> > or one of them?
> >> >> >>
> >> >> >> The goal is to provide a standard entry scheme for all firmware
> >> >> >> binaries. Whether it achieves that (or can with some mods) is up
> for
> >> >> >> discussion.
> >> >> >>
> >> >> > If you say
> >> >> > a) define a U-Boot entry ABI and providing a firmware-to-firmware
> information passing facility which would be part of all firmware ABIs (as
> the projects decide to define their own ABI) it looks good.
> >> >> > but If you say
> >> >>
> >> >> It is an ABI to be adopted by U-Boot but also other firmware. For
> >> >> example, if TF-A calls U-Boot it should use standard passage. If
> >> >> U-Boot calls TF-A or Optee it should use standard passage.
> >> >>
> >> >> > b) define a standard entry scheme (register map, processor state,
> MMU state, SMMU state, GIC state...) that does not look realistic.
> >> >>
> >> >> No I don't mean that. This data structure could be used in any stat=
e,
> >> >> so long as the two registers are set correctly.
> >> >>
> >> >> > I think you mean a) but just want to be sure.
> >> >>
> >> >> Yes I think so.
> >> >>
> >> >> >>
> >> >> >> Re the registers, do you think we need 5?
> >> >> >>
> >> >>
> >> >> I don't :-)
> >> >>
> >> >> >> >
> >> >> >> > Thinking entry ABI, here is what I observed on Arm:
> >> >> >> >
> >> >> >> > Linux has two entry ABIs:
> >> >> >> > - plain: x0 =3D dtb;
> >> >> >> >           command line =3D dtb:/chosen/bootargs; initrd =3D
> dtb:/chosen/linux,initrd-*
> >> >> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;
> >> >> >> >            dtb =3D EFI_UUID config table; initrd =3D
> efi:<loadfile2(INITRD vendor media UUID); command line =3D efi:
> image_protocol::load_options
> >> >> >> >
> >> >> >> > U-Boot (proper) has plenty of schemes:
> >> >> >> > - dtb is passed as either x0, x1, fixed memory area (Qemu whic=
h
> is bad in itself), or other registers
> >> >> >> > - additional information passing: board specific register
> scheme, SMC calls
> >> >> >> > - U-Boot for RPI boards implement a Linux shaped entry ABI to
> be launched by Videocore firmware
> >> >> >> >
> >> >> >> > Based on all the above, I would tend to think that RPI scheme
> is a good idea but also
> >> >> >> > shall not prevent additional schemes for the boards.
> >> >> >>
> >> >> >> I was not actually considering Linux since I believe/assume its
> entry
> >> >> >> scheme is fixed and not up for discussion.
> >> >> >>
> >> >> >> I also did not think about the EFI case. As I understand it we
> cannot
> >> >> >> touch it as it is used by UEFI today. Maybe it is even in the
> >> >> >> standard?
> >> >> >
> >> >> > It is in the spec and we are making it evolve, or its
> understanding evolve (jurisprudence) for instance on initrd standard
> handling.
> >> >>
> >> >> Well perhaps we could merge it with standard passage. But EFI is no=
t
> >> >> going to want to use a bloblist, it will want to use a HOB.
> >> >>
> >> >> >>
> >> >> >>
> >> >> >> Really I am hoping we can start afresh...?
> >> >> >>
> >> >> >> >
> >> >> >> > What about a U-Boot Arm entry ABI like:
> >> >> >> > - plain: x0=3Ddtb, x1=3D<Passage defined>, x2-x5 =3D <reserved=
>,
> other registers are per platform, SMC calls allowed too
> >> >> >>
> >> >> >> Hmm we don't actually need the dtb as it is available in the
> bloblist.
> >> >> >
> >> >> > If you don't have x0=3Ddtb, then you will not be able to use U-Bo=
ot
> on RPI4.
> >> >> > Unless you want to redo everything the RPI firmware is doing.
> >> >>
> >> >> That's right, RPI cannot support standard passage. It is not
> >> >> open-source firmware so it isn't really relevant to this discussion=
.
> >> >> It will just do what it does and have limited functionality, with
> >> >> work-arounds to deal with the pain, as one might expect.
> >> >>
> >> > So you are seeing two "all-or-nothing" options:
> >> > <specific>: U-Boot entry is board specific as it is today
> >> > <purepassage>: A new form where the only parameter is a head of
> bloblist, one of those blobs contain a DT
> >> >  You propose to mandate a DT for all boards make sense in that
> environment.
> >> > For RPI4, you just ignore everything the prior boot loader does
> because it is not <passage> compliant.
> >>
> >> It's not that. It's just that it is closed-source, so not relevant to
> >> the discussion here. They could open-source it and then we could
> >> consider it, but it has been closed-source for years now, so why would
> >> we think that would happen?
> >>
> >> >
> >> > This reinforces my opposition to the mandatory DT proposal.
> >> >
> >> > a third option is I think way more attractive:
> >> > <optpassage>: shaped after the architecture Linux entry (ie. first
> parameter is dtb) [+ passage head (i.e. second parameter is pointer to
> passage head)]
> >> >
> >> > This way, you make U-Boot entry clean in RPI4, Apple M1, Qemu,
> SystemReady contexts
> >> > and get a well deserved standardized information passing between
> prior loaders and U-Boot.
> >> >
> >> > The three options are possible though, you could select a U-Boot
> entry CONFIG option for:
> >> > <specific>
> >> > <optpassage>
> >> > <purepassage>
> >> >
> >> > But despite it would be technically feasible, I don't think it is
> goes in the right direction.
> >>
> >> OK. Do you think we need a separate devicetree pointer, rather than
> >> forcing it to be inside the created bloblist?
> >>
> >> I'd like to understand what problem you are solving with this. I am
> >> trying to figure out a firmware-to-firmware mini-ABI (just a few
> >> register values) that can be used in open-source projects. The ABI is
> >> not intended to be used with Linux (I am unsure of the benefit it
> >> would give and whether it is feasible to change the current one).
> >>
> >> You are talking about the Linux entry mechanism. What relevance does
> >> that have for firmware?
> >>
> >> I understand that some projects already implement the Linux mechanism,
> >> but that is because they expect to jump straight to Linux, not have
> >> U-Boot in the path. So IMO standard passage offers no benefit to them.
> >>
> >> To address them in turn:
> >> - rpi4 - closed source, who cares?
> >> - Apple M1 - we could probably expand it to pass a bloblist, but it
> >> would be confusing unless we share registers, as you suggest
> >> - Qemu - I already tried to update that and got pushback...do you
> >> really think those guys are going to want to add a bloblist? So again,
> >> who cares?
> >> - SystemReady - not sure what this means in practice, but it would be
> >> good if SystemReady could use standard passage
> >>
> >> So let's say we have an optional standard-passage thing and we use
> >> registers such that it is similar to Linux and EFI and just expands on
> >> them.
> >>
> >> The first problem is that Linux and EFI seem to be completely
> >> incompatible. Can that be changed, perhaps on the EFI side? If not,
> >> we need two separate protocols.
> >>
> >> I'll ignore EFI for now. So we might have:
> >>
> >> r0 =3D 0
> >> r1 =3D machine number (0?)
> >> r2 =3D dtb pointer
> >> r3 =3D bloblist pointer, 0 if missing
> >> r14 =3D return address
> >>
> >> or
> >>
> >> x0 =3D dtb
> >> x1 =3D bloblist pointer, 0 if missing
> >> x30 =3D return address
> >
> > That=E2=80=99s essentially what I proposed!
> > you do not force the DTB to be found in the bloblist, and shape the
> U-Boot entry after the Linux entry ABI. Good !
> > I was saving a few registers for future ABI evolution so that boards ca=
n
> be guaranteed to have their board specific registers properly protected.
> The 5 registers, leaving 3 undefined was just =C2=AB why not =C2=BB. We c=
ould also
> have a cookie in x1: high 48 bits magic low 16 ABI version, x2=3Dbloblist
> pointer.
>
> Isn't 32 bits enough for a magic value?
>
> Also x3 might be nicer, to match ARM 32-bit, so:
>
> x0 =3D dtb
> x1 =3D ABI indicator bits 63:32 0xb00757a3, bits 31:1 =3D 0, bit 0 =3D 1
> (version 1) ? We don't need to decide how many bits for the version
> right now. Perhaps 8 is plenty
> x2 =3D 0
> x3 =3D bloblist pointer, 0 if missing
> x4 =3D 0
> x30 =3D return address
>
> sounds usable. Need more comments on this.


> For ARM:
>
> r0 =3D 0
> r1 =3D machine number (0xb00757xx to signal standard passage where xx is
> the ABI version?)*
> r2 =3D dtb pointer
> r3 =3D bloblist pointer (if r1 is 0xb00757xx), else 0
> r4 =3D 0
> r14 =3D return address
>
> * might be safe, looking at
>
> https://elixir.bootlin.com/linux/latest/source/arch/arm/kernel/setup.c#L1=
094
>
> Indeed. Need more comments on this.



> >
> >>
> >> For EFI, we could add a blob to the bloblist containing the system
> >> table and handle, perhaps? Otherwise:
> >>
> >> x2 - efi handle
> >> x3 - system table
> >>
> >> Is that along the lines of what you are thinking?
> >
> > No, efi entry is only x0=3Defi handle, x1=3Dsystem table . I was trying=
 to
> find a way to have passage when U-Boot is loaded as a UEFI app (your othe=
r
> patch set to make U-Boot a more integrated UEFi app). Let=E2=80=99s say t=
hat a
> U-Boot aware DXE driver/protocol actually populate such a table, it could
> be a communication channel between that driver and U-Boot.
>
> OK, I figured, so how about, for EFI on 64-bit:
>
> x0 =3D handle
> x1 =3D systable
> x2 =3D ABI indicator bits 63:32 0xb00757a3, bits 31:1 =3D 0, bit 0 =3D 1
> (version 1)
> x3 =3D bloblist pointer
> x4 =3D 0
> x30 =3D return address
>
> EFI 32-bit:
>
> r0 =3D handle
> r1 =3D systable
> r2 =3D 0xb00757a3
> r3 =3D bloblist pointer
> r4 =3D 0
> r14 =3D return address
>
> Let's be clear that this is for an existing UEFI implementation to boot
U-Boot.
If the implementation cannot be changed to add the information, a UEFI
driver or protocol may be used.
Could SPL may be tweaked to craft the bloblist based on whatever
information I that case?

(side comment: LinuxBoot has developed techniques to replace most of an
EDK2 implementation by Linux.
This entry ABI does not apply in this use case as it is defined by EDK2.)

Now on the how.

EFI API has already defined extension mechanism, so that may be difficult
to add.

let's put the bloblist pointer in a <configtable>:

 typedef struct {
1936  ///
1937  /// The 128-bit GUID value that uniquely identifies the system
configuration table.
1938  ///
1939
<https://dox.ipxe.org/structEFI__CONFIGURATION__TABLE.html#a50a67cc76cea0a0=
8e7fcfc868ea8a02f>
  EFI_GUID <https://dox.ipxe.org/structGUID.html> VendorGuid
<https://dox.ipxe.org/structEFI__CONFIGURATION__TABLE.html#a50a67cc76cea0a0=
8e7fcfc868ea8a02f>;
/* set to BLOB_LIST_GUID */
1940  ///
1941  /// A pointer to the table associated with VendorGuid.
1942  ///
1943
<https://dox.ipxe.org/structEFI__CONFIGURATION__TABLE.html#a1acfe9c046bb4d3=
a1e7d0e3c7c06f11b>
  VOID <https://dox.ipxe.org/Base_8h.html#a7f319bfc2492a2136964194204e7a8cf=
>
*VendorTable
<https://dox.ipxe.org/structEFI__CONFIGURATION__TABLE.html#a1acfe9c046bb4d3=
a1e7d0e3c7c06f11b>;
/* bloblist pointer */
1944 } EFI_CONFIGURATION_TABLE
<https://dox.ipxe.org/structEFI__CONFIGURATION__TABLE.html>;

U-Boot or a driver or a protocol can set the VendorTable to bloblist
pointer and add this to the list of configuration tables via
https://edk2-docs.gitbook.io/edk-ii-uefi-driver-writer-s-guide/5_uefi_servi=
ces/readme.2/5210_installconfigurationtable

The blobs should be already accounted for in the memory map as they were
pre-allocated before U-Boot entry. But that may be a topic to be checked.


Regards,
> Simon
>
> >>
> >>
> >> But still, please respond above so I can understand what problem you
> >> are worried about.
> >>
> >> Regards,
> >> Simon
> >>
> >>
> >> >
> >> >> >>
> >> >> >> But I added an offset to it as a convenience.
> >> >> >>
> >> >> >> > - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=3Dreturn address;  (=
when
> U-Boot is launched as an EFI app)
> >> >> >> >        dtb =3D EFI_UUID config table, + Passage =3D Passage UU=
ID
> config table
> >> >> >>
> >> >> >> I don't understand the last line. Where is the passage info /
> >> >> >> bloblist? Do you mean it goes in the HOB list with a UUID? I
> suppose
> >> >> >> that is the most EFI-compatible way.
> >> >> >
> >> >> > The Passage config table  could just contain the "head" of the
> bloblist/Passage information.
> >> >>
> >> >> If UEFI wants to deal with standard passage, that is...
> >> >>
> >> >> >>
> >> >> >>
> >> >> >> What do you think about the idea of using an offset into the
> bloblist
> >> >> >> for the dtb?
> >> >> >
> >> >> > It is possible but as I said, failing to mimic Linux entry ABI
> would miss the opportunity to just boot without changes on RPI4.
> >> >>
> >> >> See above. Broadcom could look at open-sourcing their bootloader if
> they wish.
> >> >>
> >> >> >>
> >> >> >> Also, can we make the standard passage ABI a build-time
> >> >> >> option, so it is deterministic?
> >> >> >>
> >> >> > Looks good. I would look into stating that for SystemReady we
> would advise to use that option and make it standard for Trusted Substrat=
e
> (Linaro recipes that we upstreaming to make SystemReady compliance easy a=
nd
> consistent across platforms).
> >> >>
> >> >> OK. I mean that if the option is enabled, then standard passage mus=
t
> >> >> be provided / emitted or things won't work. If the option is
> disabled,
> >> >> then standard passage is not used. In other words, we are looking f=
or
> >> >> magic values in registers, etc, just enabling/disabling it at
> >> >> build-time.
> >> >>
> >> >> >>
> >> >> >> >
> >> >> >> > We could further leverage Passage to pass Operating Systems
> parameters that could be removed from device tree (migration of /chosen t=
o
> Passage). Memory inventory would still be in DT but allocations for CMA o=
r
> GPUs would be in Passage. This idea is to reach a point where  device tre=
e
> is a "pristine" hardware description.
> >> >> >>
> >> >> >> I'm worried about this becoming a substitute for devicetree.
> Really my
> >> >> >> intent is to provide a way to pass simple info, whereas what you
> talk
> >> >> >> about there seems like something that should be DT, just that it
> might
> >> >> >> need suitable bindings.
> >> >> >>
> >> >> > I see your point and I agree It should not be a substitute.
> >> >> > here is an expanded version of what I had in mind when I wrote
> those lines.
> >> >> > cma, initrd and other Linux kernel parameters can be conveyed
> either through command line or DT.
> >> >> > When using the non UEFI Linux entry ABI, you need to use the DT t=
o
> pass those parameters.
> >> >> > When using the UEFI Linux entry ABI, you *can* (not must) use the
> command line to pass all information, leaving the DT passed to the OS
> without any /chosen.
> >> >> > When introducing Passage, I was wondering if we could pass comman=
d
> line to Linux and, same as UEFI, leave the DT free from /chosen.
> >> >> > I am not sure it is a good goal though. I may be too pushing for =
a
> DT free from parameters.
> >> >>
> >> >> We could. Are there benefits to that?
> >> >>
> >> >> I doubt we would pass the standard passage to Linux as a bloblist. =
I
> >> >> imagine something like this. The bloblist sits in memory with some
> >> >> things in it, including a devicetree, perhaps an SMBIOS table and a
> >> >> TPM log. But when U-Boot calls Linux it puts the address/size of
> those
> >> >> individual things in the devicetree. They don't move and are still
> >> >> contiguous in memory, but the bloblist around them is forgotten.
> Linux
> >> >> doesn't know that the three separate things it is picking up are
> >> >> actually part of a bloblist structure, since it doesn't care about
> >> >> that. Even a console log could work the same way. That way we don't
> >> >> end up trying to teach Linux about bloblist when it already has a
> >> >> perfectly good means to accept these items.
> >> >>
> >> >> For ACPI I see things a similar way. The ACPI tables can point to
> >> >> things that *happen* to be in a bloblist, but without any knowledge
> of
> >> >> that needed in Linux, grub, etc.
> >> >>
> >> >> >>
> >> >> >> As you know I have more expansive views about what should be in
> DT.
> >> >> >
> >> >> > I think both of us are huge supporters of DT format and self
> describing capabilities.
> >> >> > I am inclined to put rules into what fits into what lands in the
> DT that is passed to the OS.
> >> >> > I am a fan of having DT used more in ad-hoc files.
> >> >>
> >> >> Me too.
> >> >>
> >> >> >>
> >> >> >> >
> >> >> >> > Cheers
> >> >> >> >
> >> >> >> > PS: as Ilias mentions, this patch set contains bug fixes, non
> immediately related additional functions (DM stats). It would be great to
> carve those out to fast path them and keep this one with the very core of
> your idea.
> >> >> >>
> >> >> >> The DM stats is used in 'passage: Report the devicetree source'.=
 I
> >> >> >> know it is sideways but I think it is better to make the output
> line
> >> >> >> more useful than just reporting the devicetree source.
> >> >> >>
> >> >> > I believe the DM stats has merits in its own. You could upstream
> this independently and then Passage would be yet another "customer" of th=
e
> feature.
> >> >>
> >> >> I could, but it would just be a debug feature so people might not
> >> >> think it worth the code space. With the devicetree source it is mor=
e
> >> >> compelling.
> >> >>
> >> >> >>
> >> >> >> The first patch is indeed unrelated. I will pick it up so we can
> drop
> >> >> >> it for the next rev.
> >> >> >>
> >> >> [..]
> >> >>
> >> >> Regards,
> >> >> Simon
> >> >
> >> >
> >> >
> >> > --
> >> > Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Developmen=
t
> >> > T: +33.67221.6485
> >> > francois.ozog@linaro.org | Skype: ffozog
> >> >
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

--0000000000002801ab05d0495ff1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, 5 Nov 2021 at 18:17, Simon Gl=
ass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex">) to signal Hi Fran=C3=A7ois,<br>
<br>
On Fri, 5 Nov 2021 at 10:31, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:franc=
ois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Hi Simon,<br>
&gt;<br>
&gt; Le ven. 5 nov. 2021 =C3=A0 17:12, Simon Glass &lt;<a href=3D"mailto:sj=
g@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a =C3=A9crit :<b=
r>
&gt;&gt;<br>
&gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 5 Nov 2021 at 02:27, Fran=C3=A7ois Ozog &lt;<a href=3D"mai=
lto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a=
>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Fri, 5 Nov 2021 at 03:02, Simon Glass &lt;<a href=3D"mailt=
o:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, 2 Nov 2021 at 10:03, Fran=C3=A7ois Ozog &lt;<a hr=
ef=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@lina=
ro.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Hi Simon,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Tue, 2 Nov 2021 at 15:59, Simon Glass &lt;<a href=
=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wro=
te:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; On Mon, 1 Nov 2021 at 02:53, Fran=C3=A7ois Ozog =
&lt;<a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois.=
ozog@linaro.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Hi Simon,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; this seems a great endeavor. I&#39;d like t=
o better understand the scope of it.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Is it to be used as part of what could beco=
me a U-Boot entry ABI scheme? By that I mean giving some fixed aspects<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; to U-Boot entry while letting boards to hav=
e flexibility (say for instance that the first 5 architecture ABI<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; parameter registers are reserved for U-Boot=
), and the Passage is about specifying either those reserved registers<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; or one of them?<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The goal is to provide a standard entry scheme f=
or all firmware<br>
&gt;&gt; &gt;&gt; &gt;&gt; binaries. Whether it achieves that (or can with =
some mods) is up for<br>
&gt;&gt; &gt;&gt; &gt;&gt; discussion.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; If you say<br>
&gt;&gt; &gt;&gt; &gt; a) define a U-Boot entry ABI and providing a firmwar=
e-to-firmware information passing facility which would be part of all firmw=
are ABIs (as the projects decide to define their own ABI) it looks good.<br=
>
&gt;&gt; &gt;&gt; &gt; but If you say<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; It is an ABI to be adopted by U-Boot but also other firmw=
are. For<br>
&gt;&gt; &gt;&gt; example, if TF-A calls U-Boot it should use standard pass=
age. If<br>
&gt;&gt; &gt;&gt; U-Boot calls TF-A or Optee it should use standard passage=
.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; b) define a standard entry scheme (register map, pro=
cessor state, MMU state, SMMU state, GIC state...) that does not look reali=
stic.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; No I don&#39;t mean that. This data structure could be us=
ed in any state,<br>
&gt;&gt; &gt;&gt; so long as the two registers are set correctly.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; I think you mean a) but just want to be sure.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Yes I think so.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Re the registers, do you think we need 5?<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I don&#39;t :-)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Thinking entry ABI, here is what I observed=
 on Arm:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Linux has two entry ABIs:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - plain: x0 =3D dtb;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0com=
mand line =3D dtb:/chosen/bootargs; initrd =3D dtb:/chosen/linux,initrd-*<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=
=3Dreturn address;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dt=
b =3D EFI_UUID config table; initrd =3D efi:&lt;loadfile2(INITRD vendor med=
ia UUID); command line =3D efi: image_protocol::load_options<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; U-Boot (proper) has plenty of schemes:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - dtb is passed as either x0, x1, fixed mem=
ory area (Qemu which is bad in itself), or other registers<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - additional information passing: board spe=
cific register scheme, SMC calls<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - U-Boot for RPI boards implement a Linux s=
haped entry ABI to be launched by Videocore firmware<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Based on all the above, I would tend to thi=
nk that RPI scheme is a good idea but also<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; shall not prevent additional schemes for th=
e boards.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; I was not actually considering Linux since I bel=
ieve/assume its entry<br>
&gt;&gt; &gt;&gt; &gt;&gt; scheme is fixed and not up for discussion.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; I also did not think about the EFI case. As I un=
derstand it we cannot<br>
&gt;&gt; &gt;&gt; &gt;&gt; touch it as it is used by UEFI today. Maybe it i=
s even in the<br>
&gt;&gt; &gt;&gt; &gt;&gt; standard?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; It is in the spec and we are making it evolve, or it=
s understanding evolve (jurisprudence) for instance on initrd standard hand=
ling.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Well perhaps we could merge it with standard passage. But=
 EFI is not<br>
&gt;&gt; &gt;&gt; going to want to use a bloblist, it will want to use a HO=
B.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Really I am hoping we can start afresh...?<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; What about a U-Boot Arm entry ABI like:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - plain: x0=3Ddtb, x1=3D&lt;Passage defined=
&gt;, x2-x5 =3D &lt;reserved&gt;, other registers are per platform, SMC cal=
ls allowed too<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Hmm we don&#39;t actually need the dtb as it is =
available in the bloblist.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; If you don&#39;t have x0=3Ddtb, then you will not be=
 able to use U-Boot on RPI4.<br>
&gt;&gt; &gt;&gt; &gt; Unless you want to redo everything the RPI firmware =
is doing.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; That&#39;s right, RPI cannot support standard passage. It=
 is not<br>
&gt;&gt; &gt;&gt; open-source firmware so it isn&#39;t really relevant to t=
his discussion.<br>
&gt;&gt; &gt;&gt; It will just do what it does and have limited functionali=
ty, with<br>
&gt;&gt; &gt;&gt; work-arounds to deal with the pain, as one might expect.<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; So you are seeing two &quot;all-or-nothing&quot; options:<br>
&gt;&gt; &gt; &lt;specific&gt;: U-Boot entry is board specific as it is tod=
ay<br>
&gt;&gt; &gt; &lt;purepassage&gt;: A new form where the only parameter is a=
 head of bloblist, one of those blobs contain a DT<br>
&gt;&gt; &gt;=C2=A0 You propose to mandate a DT for all boards make sense i=
n that environment.<br>
&gt;&gt; &gt; For RPI4, you just ignore everything the prior boot loader do=
es because it is not &lt;passage&gt; compliant.<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s not that. It&#39;s just that it is closed-source, so not =
relevant to<br>
&gt;&gt; the discussion here. They could open-source it and then we could<b=
r>
&gt;&gt; consider it, but it has been closed-source for years now, so why w=
ould<br>
&gt;&gt; we think that would happen?<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This reinforces my opposition to the mandatory DT proposal.<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; a third option is I think way more attractive:<br>
&gt;&gt; &gt; &lt;optpassage&gt;: shaped after the architecture Linux entry=
 (ie. first parameter is dtb) [+ passage head (i.e. second parameter is poi=
nter to passage head)]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This way, you make U-Boot entry clean in RPI4, Apple M1, Qemu=
, SystemReady contexts<br>
&gt;&gt; &gt; and get a well deserved standardized information passing betw=
een prior loaders and U-Boot.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The three options are possible though, you could select a U-B=
oot entry CONFIG option for:<br>
&gt;&gt; &gt; &lt;specific&gt;<br>
&gt;&gt; &gt; &lt;optpassage&gt;<br>
&gt;&gt; &gt; &lt;purepassage&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; But despite it would be technically feasible, I don&#39;t thi=
nk it is goes in the right direction.<br>
&gt;&gt;<br>
&gt;&gt; OK. Do you think we need a separate devicetree pointer, rather tha=
n<br>
&gt;&gt; forcing it to be inside the created bloblist?<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d like to understand what problem you are solving with this.=
 I am<br>
&gt;&gt; trying to figure out a firmware-to-firmware mini-ABI (just a few<b=
r>
&gt;&gt; register values) that can be used in open-source projects. The ABI=
 is<br>
&gt;&gt; not intended to be used with Linux (I am unsure of the benefit it<=
br>
&gt;&gt; would give and whether it is feasible to change the current one).<=
br>
&gt;&gt;<br>
&gt;&gt; You are talking about the Linux entry mechanism. What relevance do=
es<br>
&gt;&gt; that have for firmware?<br>
&gt;&gt;<br>
&gt;&gt; I understand that some projects already implement the Linux mechan=
ism,<br>
&gt;&gt; but that is because they expect to jump straight to Linux, not hav=
e<br>
&gt;&gt; U-Boot in the path. So IMO standard passage offers no benefit to t=
hem.<br>
&gt;&gt;<br>
&gt;&gt; To address them in turn:<br>
&gt;&gt; - rpi4 - closed source, who cares?<br>
&gt;&gt; - Apple M1 - we could probably expand it to pass a bloblist, but i=
t<br>
&gt;&gt; would be confusing unless we share registers, as you suggest<br>
&gt;&gt; - Qemu - I already tried to update that and got pushback...do you<=
br>
&gt;&gt; really think those guys are going to want to add a bloblist? So ag=
ain,<br>
&gt;&gt; who cares?<br>
&gt;&gt; - SystemReady - not sure what this means in practice, but it would=
 be<br>
&gt;&gt; good if SystemReady could use standard passage<br>
&gt;&gt;<br>
&gt;&gt; So let&#39;s say we have an optional standard-passage thing and we=
 use<br>
&gt;&gt; registers such that it is similar to Linux and EFI and just expand=
s on<br>
&gt;&gt; them.<br>
&gt;&gt;<br>
&gt;&gt; The first problem is that Linux and EFI seem to be completely<br>
&gt;&gt; incompatible. Can that be changed, perhaps on the EFI side? If not=
,<br>
&gt;&gt; we need two separate protocols.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ll ignore EFI for now. So we might have:<br>
&gt;&gt;<br>
&gt;&gt; r0 =3D 0<br>
&gt;&gt; r1 =3D machine number (0?)<br>
&gt;&gt; r2 =3D dtb pointer<br>
&gt;&gt; r3 =3D bloblist pointer, 0 if missing<br>
&gt;&gt; r14 =3D return address<br>
&gt;&gt;<br>
&gt;&gt; or<br>
&gt;&gt;<br>
&gt;&gt; x0 =3D dtb<br>
&gt;&gt; x1 =3D bloblist pointer, 0 if missing<br>
&gt;&gt; x30 =3D return address<br>
&gt;<br>
&gt; That=E2=80=99s essentially what I proposed!<br>
&gt; you do not force the DTB to be found in the bloblist, and shape the U-=
Boot entry after the Linux entry ABI. Good !<br>
&gt; I was saving a few registers for future ABI evolution so that boards c=
an be guaranteed to have their board specific registers properly protected.=
 The 5 registers, leaving 3 undefined was just =C2=AB why not =C2=BB. We co=
uld also have a cookie in x1: high 48 bits magic low 16 ABI version, x2=3Db=
loblist pointer.<br>
<br>
Isn&#39;t 32 bits enough for a magic value?<br>
<br>
Also x3 might be nicer, to match ARM 32-bit, so:<br>
<br>
x0 =3D dtb<br>
x1 =3D ABI indicator bits 63:32 0xb00757a3, bits 31:1 =3D 0, bit 0 =3D 1<br=
>
(version 1) ? We don&#39;t need to decide how many bits for the version<br>
right now. Perhaps 8 is plenty<br>
x2 =3D 0<br>
x3 =3D bloblist pointer, 0 if missing<br>
x4 =3D 0<br>
x30 =3D return address<br>
<br></blockquote><div>sounds usable. Need more comments on this.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">
For ARM:<br>
<br>
r0 =3D 0<br>
r1 =3D machine number (0xb00757xx to signal standard passage where xx is<br=
>
the ABI version?)*<br>
r2 =3D dtb pointer<br>
r3 =3D bloblist pointer (if r1 is 0xb00757xx), else 0<br>
r4 =3D 0<br>
r14 =3D return address<br>
<br>
* might be safe, looking at<br>
<a href=3D"https://elixir.bootlin.com/linux/latest/source/arch/arm/kernel/s=
etup.c#L1094" rel=3D"noreferrer" target=3D"_blank">https://elixir.bootlin.c=
om/linux/latest/source/arch/arm/kernel/setup.c#L1094</a><br>
<br></blockquote><div>Indeed. Need more comments on this.</div><br class=3D=
"gmail-Apple-interchange-newline"><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt;&gt;<br>
&gt;&gt; For EFI, we could add a blob to the bloblist containing the system=
<br>
&gt;&gt; table and handle, perhaps? Otherwise:<br>
&gt;&gt;<br>
&gt;&gt; x2 - efi handle<br>
&gt;&gt; x3 - system table<br>
&gt;&gt;<br>
&gt;&gt; Is that along the lines of what you are thinking?<br>
&gt;<br>
&gt; No, efi entry is only x0=3Defi handle, x1=3Dsystem table . I was tryin=
g to find a way to have passage when U-Boot is loaded as a UEFI app (your o=
ther patch set to make U-Boot a more integrated UEFi app). Let=E2=80=99s sa=
y that a U-Boot aware DXE driver/protocol actually populate such a table, i=
t could be a communication channel between that driver and U-Boot.<br>
<br>
OK, I figured, so how about, for EFI on 64-bit:<br>
<br>
x0 =3D handle<br>
x1 =3D systable<br>
x2 =3D ABI indicator bits 63:32 0xb00757a3, bits 31:1 =3D 0, bit 0 =3D 1 (v=
ersion 1)<br>
x3 =3D bloblist pointer<br>
x4 =3D 0<br>
x30 =3D return address<br>
<br>
EFI 32-bit:<br>
<br>
r0 =3D handle<br>
r1 =3D systable<br>
r2 =3D 0xb00757a3<br>
r3 =3D bloblist pointer<br>
r4 =3D 0<br>
r14 =3D return address<br>
<br></blockquote><div>Let&#39;s be clear that this is for an existing UEFI =
implementation to boot U-Boot.</div><div>If the implementation cannot be ch=
anged to add the information, a UEFI driver or protocol may be used.</div><=
div>Could SPL may be tweaked to craft the bloblist based on whatever inform=
ation I that case?</div><div><br></div><div>(side comment: LinuxBoot has de=
veloped techniques to replace most of an EDK2 implementation by Linux.=C2=
=A0</div><div>This entry ABI does not apply in this use case as it is defin=
ed by EDK2.)<br></div><div><br></div><div>Now on the how.</div><div><br></d=
iv><div>EFI API has already defined extension mechanism, so that may be dif=
ficult to add.</div><div><br></div><div>let&#39;s put the bloblist pointer =
in a &lt;configtable&gt;:</div><div><br></div><div><div class=3D"gmail-line=
" style=3D"font-stretch:normal;font-size:13px;line-height:1;font-family:mon=
ospace,fixed;min-height:13px;white-space:pre-wrap;word-wrap:break-word;padd=
ing-left:53px;padding-bottom:0px;margin:0px;color:rgb(0,0,0);background-col=
or:rgb(251,252,253)">=C2=A0<span class=3D"gmail-comment" style=3D"color:rgb=
(128,0,0)"></span><span class=3D"gmail-keyword" style=3D"color:rgb(0,128,0)=
">typedef</span> <span class=3D"gmail-keyword" style=3D"color:rgb(0,128,0)"=
>struct </span>{<span class=3D"gmail-comment" style=3D"color:rgb(128,0,0)">=
</span></div><div class=3D"gmail-line" style=3D"font-stretch:normal;font-si=
ze:13px;line-height:1;font-family:monospace,fixed;min-height:13px;white-spa=
ce:pre-wrap;word-wrap:break-word;padding-left:53px;padding-bottom:0px;margi=
n:0px;color:rgb(0,0,0);background-color:rgb(251,252,253)"><a name=3D"l01936=
" style=3D"color:rgb(61,87,140)"></a><span class=3D"gmail-lineno" style=3D"=
padding-right:4px;text-align:right;border-right-width:2px;border-right-styl=
e:solid;border-right-color:rgb(0,255,0);background-color:rgb(232,232,232);w=
hite-space:pre"> 1936</span>=C2=A0<span class=3D"gmail-comment" style=3D"co=
lor:rgb(128,0,0)">  ///</span></div><div class=3D"gmail-line" style=3D"font=
-stretch:normal;font-size:13px;line-height:1;font-family:monospace,fixed;mi=
n-height:13px;white-space:pre-wrap;word-wrap:break-word;padding-left:53px;p=
adding-bottom:0px;margin:0px;color:rgb(0,0,0);background-color:rgb(251,252,=
253)"><a name=3D"l01937" style=3D"color:rgb(61,87,140)"></a><span class=3D"=
gmail-lineno" style=3D"padding-right:4px;text-align:right;border-right-widt=
h:2px;border-right-style:solid;border-right-color:rgb(0,255,0);background-c=
olor:rgb(232,232,232);white-space:pre"> 1937</span>=C2=A0<span class=3D"gma=
il-comment" style=3D"color:rgb(128,0,0)">  /// The 128-bit GUID value that =
uniquely identifies the system configuration table.</span></div><div class=
=3D"gmail-line" style=3D"font-stretch:normal;font-size:13px;line-height:1;f=
ont-family:monospace,fixed;min-height:13px;white-space:pre-wrap;word-wrap:b=
reak-word;padding-left:53px;padding-bottom:0px;margin:0px;color:rgb(0,0,0);=
background-color:rgb(251,252,253)"><a name=3D"l01938" style=3D"color:rgb(61=
,87,140)"></a><span class=3D"gmail-lineno" style=3D"padding-right:4px;text-=
align:right;border-right-width:2px;border-right-style:solid;border-right-co=
lor:rgb(0,255,0);background-color:rgb(232,232,232);white-space:pre"> 1938</=
span>=C2=A0<span class=3D"gmail-comment" style=3D"color:rgb(128,0,0)">  ///=
</span></div><div class=3D"gmail-line" style=3D"font-stretch:normal;font-si=
ze:13px;line-height:1;font-family:monospace,fixed;min-height:13px;white-spa=
ce:pre-wrap;word-wrap:break-word;padding-left:53px;padding-bottom:0px;margi=
n:0px;color:rgb(0,0,0);background-color:rgb(251,252,253)"><a name=3D"l01939=
" style=3D"color:rgb(61,87,140)"></a><span class=3D"gmail-lineno" style=3D"=
padding-right:4px;text-align:right;border-right-width:2px;border-right-styl=
e:solid;border-right-color:rgb(0,255,0);background-color:rgb(232,232,232);w=
hite-space:pre"><a class=3D"gmail-line" href=3D"https://dox.ipxe.org/struct=
EFI__CONFIGURATION__TABLE.html#a50a67cc76cea0a08e7fcfc868ea8a02f" style=3D"=
color:rgb(70,101,162);text-decoration:none;background-color:rgb(216,216,216=
)"> 1939</a></span>=C2=A0<span class=3D"gmail-comment" style=3D"color:rgb(1=
28,0,0)"></span>  <a class=3D"gmail-code" href=3D"https://dox.ipxe.org/stru=
ctGUID.html" style=3D"color:rgb(70,101,162);text-decoration:none">EFI_GUID<=
/a>                          <a class=3D"gmail-code" href=3D"https://dox.ip=
xe.org/structEFI__CONFIGURATION__TABLE.html#a50a67cc76cea0a08e7fcfc868ea8a0=
2f" style=3D"color:rgb(70,101,162);text-decoration:none">VendorGuid</a>; /*=
 set to BLOB_LIST_GUID */<span class=3D"gmail-comment" style=3D"color:rgb(1=
28,0,0)"></span></div><div class=3D"gmail-line" style=3D"font-stretch:norma=
l;font-size:13px;line-height:1;font-family:monospace,fixed;min-height:13px;=
white-space:pre-wrap;word-wrap:break-word;padding-left:53px;padding-bottom:=
0px;margin:0px;color:rgb(0,0,0);background-color:rgb(251,252,253)"><a name=
=3D"l01940" style=3D"color:rgb(61,87,140)"></a><span class=3D"gmail-lineno"=
 style=3D"padding-right:4px;text-align:right;border-right-width:2px;border-=
right-style:solid;border-right-color:rgb(0,255,0);background-color:rgb(232,=
232,232);white-space:pre"> 1940</span>=C2=A0<span class=3D"gmail-comment" s=
tyle=3D"color:rgb(128,0,0)">  ///</span></div><div class=3D"gmail-line" sty=
le=3D"font-stretch:normal;font-size:13px;line-height:1;font-family:monospac=
e,fixed;min-height:13px;white-space:pre-wrap;word-wrap:break-word;padding-l=
eft:53px;padding-bottom:0px;margin:0px;color:rgb(0,0,0);background-color:rg=
b(251,252,253)"><a name=3D"l01941" style=3D"color:rgb(61,87,140)"></a><span=
 class=3D"gmail-lineno" style=3D"padding-right:4px;text-align:right;border-=
right-width:2px;border-right-style:solid;border-right-color:rgb(0,255,0);ba=
ckground-color:rgb(232,232,232);white-space:pre"> 1941</span>=C2=A0<span cl=
ass=3D"gmail-comment" style=3D"color:rgb(128,0,0)">  /// A pointer to the t=
able associated with VendorGuid.</span></div><div class=3D"gmail-line" styl=
e=3D"font-stretch:normal;font-size:13px;line-height:1;font-family:monospace=
,fixed;min-height:13px;white-space:pre-wrap;word-wrap:break-word;padding-le=
ft:53px;padding-bottom:0px;margin:0px;color:rgb(0,0,0);background-color:rgb=
(251,252,253)"><a name=3D"l01942" style=3D"color:rgb(61,87,140)"></a><span =
class=3D"gmail-lineno" style=3D"padding-right:4px;text-align:right;border-r=
ight-width:2px;border-right-style:solid;border-right-color:rgb(0,255,0);bac=
kground-color:rgb(232,232,232);white-space:pre"> 1942</span>=C2=A0<span cla=
ss=3D"gmail-comment" style=3D"color:rgb(128,0,0)">  ///</span></div><div cl=
ass=3D"gmail-line" style=3D"font-stretch:normal;font-size:13px;line-height:=
1;font-family:monospace,fixed;min-height:13px;white-space:pre-wrap;word-wra=
p:break-word;padding-left:53px;padding-bottom:0px;margin:0px;color:rgb(0,0,=
0);background-color:rgb(251,252,253)"><a name=3D"l01943" style=3D"color:rgb=
(61,87,140)"></a><span class=3D"gmail-lineno" style=3D"padding-right:4px;te=
xt-align:right;border-right-width:2px;border-right-style:solid;border-right=
-color:rgb(0,255,0);background-color:rgb(232,232,232);white-space:pre"><a c=
lass=3D"gmail-line" href=3D"https://dox.ipxe.org/structEFI__CONFIGURATION__=
TABLE.html#a1acfe9c046bb4d3a1e7d0e3c7c06f11b" style=3D"color:rgb(70,101,162=
);text-decoration:none;background-color:rgb(216,216,216)"> 1943</a></span>=
=C2=A0<span class=3D"gmail-comment" style=3D"color:rgb(128,0,0)"></span>  <=
a class=3D"gmail-code" href=3D"https://dox.ipxe.org/Base_8h.html#a7f319bfc2=
492a2136964194204e7a8cf" style=3D"color:rgb(70,101,162);text-decoration:non=
e">VOID</a>                              *<a class=3D"gmail-code" href=3D"h=
ttps://dox.ipxe.org/structEFI__CONFIGURATION__TABLE.html#a1acfe9c046bb4d3a1=
e7d0e3c7c06f11b" style=3D"color:rgb(70,101,162);text-decoration:none">Vendo=
rTable</a>; /* bloblist pointer */</div><div class=3D"gmail-line" style=3D"=
font-stretch:normal;font-size:13px;line-height:1;font-family:monospace,fixe=
d;min-height:13px;white-space:pre-wrap;word-wrap:break-word;padding-left:53=
px;padding-bottom:0px;margin:0px;color:rgb(0,0,0);background-color:rgb(251,=
252,253)"><a name=3D"l01944" style=3D"color:rgb(61,87,140)"></a><span class=
=3D"gmail-lineno" style=3D"padding-right:4px;text-align:right;border-right-=
width:2px;border-right-style:solid;border-right-color:rgb(0,255,0);backgrou=
nd-color:rgb(232,232,232);white-space:pre"> 1944</span>=C2=A0} <a class=3D"=
gmail-code" href=3D"https://dox.ipxe.org/structEFI__CONFIGURATION__TABLE.ht=
ml" style=3D"color:rgb(70,101,162);text-decoration:none">EFI_CONFIGURATION_=
TABLE</a>;</div></div><div class=3D"gmail-line" style=3D"font-stretch:norma=
l;font-size:13px;line-height:1;font-family:monospace,fixed;min-height:13px;=
white-space:pre-wrap;word-wrap:break-word;padding-left:53px;padding-bottom:=
0px;margin:0px;color:rgb(0,0,0);background-color:rgb(251,252,253)"><br></di=
v><div>U-Boot or a driver or a protocol can set the VendorTable to bloblist=
 pointer and add this to the list of configuration tables via</div><div><a =
href=3D"https://edk2-docs.gitbook.io/edk-ii-uefi-driver-writer-s-guide/5_ue=
fi_services/readme.2/5210_installconfigurationtable">https://edk2-docs.gitb=
ook.io/edk-ii-uefi-driver-writer-s-guide/5_uefi_services/readme.2/5210_inst=
allconfigurationtable</a><br></div><div><br></div><div>The blobs should be =
already accounted for in the memory map as they were pre-allocated before U=
-Boot entry. But that may be a topic to be checked.</div><div><br></div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">
Regards,<br>
Simon<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; But still, please respond above so I can understand what problem y=
ou<br>
&gt;&gt; are worried about.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Simon<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; But I added an offset to it as a convenience.<br=
>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - EFI: x0=3Dhandle, x1=3Dsystemtable, x30=
=3Dreturn address;=C2=A0 (when U-Boot is launched as an EFI app)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb =3D EFI_UUID=
 config table, + Passage =3D Passage UUID config table<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; I don&#39;t understand the last line. Where is t=
he passage info /<br>
&gt;&gt; &gt;&gt; &gt;&gt; bloblist? Do you mean it goes in the HOB list wi=
th a UUID? I suppose<br>
&gt;&gt; &gt;&gt; &gt;&gt; that is the most EFI-compatible way.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; The Passage config table=C2=A0 could just contain th=
e &quot;head&quot; of the bloblist/Passage information.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; If UEFI wants to deal with standard passage, that is...<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; What do you think about the idea of using an off=
set into the bloblist<br>
&gt;&gt; &gt;&gt; &gt;&gt; for the dtb?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; It is possible but as I said, failing to mimic Linux=
 entry ABI would miss the opportunity to just boot without changes on RPI4.=
<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; See above. Broadcom could look at open-sourcing their boo=
tloader if they wish.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Also, can we make the standard passage ABI a bui=
ld-time<br>
&gt;&gt; &gt;&gt; &gt;&gt; option, so it is deterministic?<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; Looks good. I would look into stating that for Syste=
mReady we would advise to use that option and make it standard for Trusted =
Substrate (Linaro recipes that we upstreaming to make SystemReady complianc=
e easy and consistent across platforms).<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; OK. I mean that if the option is enabled, then standard p=
assage must<br>
&gt;&gt; &gt;&gt; be provided / emitted or things won&#39;t work. If the op=
tion is disabled,<br>
&gt;&gt; &gt;&gt; then standard passage is not used. In other words, we are=
 looking for<br>
&gt;&gt; &gt;&gt; magic values in registers, etc, just enabling/disabling i=
t at<br>
&gt;&gt; &gt;&gt; build-time.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; We could further leverage Passage to pass O=
perating Systems parameters that could be removed from device tree (migrati=
on of /chosen to Passage). Memory inventory would still be in DT but alloca=
tions for CMA or GPUs would be in Passage. This idea is to reach a point wh=
ere=C2=A0 device tree is a &quot;pristine&quot; hardware description.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; I&#39;m worried about this becoming a substitute=
 for devicetree. Really my<br>
&gt;&gt; &gt;&gt; &gt;&gt; intent is to provide a way to pass simple info, =
whereas what you talk<br>
&gt;&gt; &gt;&gt; &gt;&gt; about there seems like something that should be =
DT, just that it might<br>
&gt;&gt; &gt;&gt; &gt;&gt; need suitable bindings.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; I see your point and I agree It should not be a subs=
titute.<br>
&gt;&gt; &gt;&gt; &gt; here is an expanded version of what I had in mind wh=
en I wrote those lines.<br>
&gt;&gt; &gt;&gt; &gt; cma, initrd and other Linux kernel parameters can be=
 conveyed either through command line or DT.<br>
&gt;&gt; &gt;&gt; &gt; When using the non UEFI Linux entry ABI, you need to=
 use the DT to pass those parameters.<br>
&gt;&gt; &gt;&gt; &gt; When using the UEFI Linux entry ABI, you *can* (not =
must) use the command line to pass all information, leaving the DT passed t=
o the OS without any /chosen.<br>
&gt;&gt; &gt;&gt; &gt; When introducing Passage, I was wondering if we coul=
d pass command line to Linux and, same as UEFI, leave the DT free from /cho=
sen.<br>
&gt;&gt; &gt;&gt; &gt; I am not sure it is a good goal though. I may be too=
 pushing for a DT free from parameters.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; We could. Are there benefits to that?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I doubt we would pass the standard passage to Linux as a =
bloblist. I<br>
&gt;&gt; &gt;&gt; imagine something like this. The bloblist sits in memory =
with some<br>
&gt;&gt; &gt;&gt; things in it, including a devicetree, perhaps an SMBIOS t=
able and a<br>
&gt;&gt; &gt;&gt; TPM log. But when U-Boot calls Linux it puts the address/=
size of those<br>
&gt;&gt; &gt;&gt; individual things in the devicetree. They don&#39;t move =
and are still<br>
&gt;&gt; &gt;&gt; contiguous in memory, but the bloblist around them is for=
gotten. Linux<br>
&gt;&gt; &gt;&gt; doesn&#39;t know that the three separate things it is pic=
king up are<br>
&gt;&gt; &gt;&gt; actually part of a bloblist structure, since it doesn&#39=
;t care about<br>
&gt;&gt; &gt;&gt; that. Even a console log could work the same way. That wa=
y we don&#39;t<br>
&gt;&gt; &gt;&gt; end up trying to teach Linux about bloblist when it alrea=
dy has a<br>
&gt;&gt; &gt;&gt; perfectly good means to accept these items.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; For ACPI I see things a similar way. The ACPI tables can =
point to<br>
&gt;&gt; &gt;&gt; things that *happen* to be in a bloblist, but without any=
 knowledge of<br>
&gt;&gt; &gt;&gt; that needed in Linux, grub, etc.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; As you know I have more expansive views about wh=
at should be in DT.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I think both of us are huge supporters of DT format =
and self describing capabilities.<br>
&gt;&gt; &gt;&gt; &gt; I am inclined to put rules into what fits into what =
lands in the DT that is passed to the OS.<br>
&gt;&gt; &gt;&gt; &gt; I am a fan of having DT used more in ad-hoc files.<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Me too.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Cheers<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; PS: as Ilias mentions, this patch set conta=
ins bug fixes, non immediately related additional functions (DM stats). It =
would be great to carve those out to fast path them and keep this one with =
the very core of your idea.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The DM stats is used in &#39;passage: Report the=
 devicetree source&#39;. I<br>
&gt;&gt; &gt;&gt; &gt;&gt; know it is sideways but I think it is better to =
make the output line<br>
&gt;&gt; &gt;&gt; &gt;&gt; more useful than just reporting the devicetree s=
ource.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; I believe the DM stats has merits in its own. You co=
uld upstream this independently and then Passage would be yet another &quot=
;customer&quot; of the feature.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I could, but it would just be a debug feature so people m=
ight not<br>
&gt;&gt; &gt;&gt; think it worth the code space. With the devicetree source=
 it is more<br>
&gt;&gt; &gt;&gt; compelling.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The first patch is indeed unrelated. I will pick=
 it up so we can drop<br>
&gt;&gt; &gt;&gt; &gt;&gt; it for the next rev.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; [..]<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Regards,<br>
&gt;&gt; &gt;&gt; Simon<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Dev=
elopment<br>
&gt;&gt; &gt; T: +33.67221.6485<br>
&gt;&gt; &gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank"=
>francois.ozog@linaro.org</a> | Skype: ffozog<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development<=
br>
&gt; T: +33.67221.6485<br>
&gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_blank">francois=
.ozog@linaro.org</a> | Skype: ffozog<br>
&gt;<br>
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

--0000000000002801ab05d0495ff1--

