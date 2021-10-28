Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D143DCE7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 10:23:47 +0200 (CEST)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg0hO-0000SZ-Tg
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 04:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mg0fh-0008C1-Vh
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:22:02 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mg0fd-0006cG-Fk
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 04:22:01 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ee16so8495903edb.10
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 01:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c9QhkOwQa1ALWE49iFrgbjNQZ4axAMV1WML/n/ArWuM=;
 b=iE9GUC3jt4Y2LamotWK6o7lKLxpA33y+L9/SVLfomW05Z3/41JQioxK5WS+CqLbAx6
 1AslBsAOprennh/9LlLJpviWQP+QmiR6S8Dhjy0791UXyQEcq8jyD6ip6q51LuthbAHD
 x8HRzYeglOIBp9jttbXauQwDM0M9VfKG3Eyz9OQsONh2Gsuwsh1b9Xz0CUJJ7IHsz+9g
 U+x9mrBy0MPgsuHEtKeEmAGYQbst9unv6E8d0wLZHry0aEQkuACvI1gOpBAxMasj8kZj
 G3SdO9z8fiL7xmsLewWQoUdzy/bWJQxkNOdhJsmhwpmZ8EojuaT2xpDiX8h6c62BFweF
 LSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9QhkOwQa1ALWE49iFrgbjNQZ4axAMV1WML/n/ArWuM=;
 b=T9EO3ghhJs/VewfzJHZhJ7olVPNAdjQ0SOJTU/xOEic7ZVBIX9PAkkp9rDLb1wOHMC
 g/m/eZqAuStkZkssFpPOcqzDu1sr5wqfMg2fU2rqr97ZbXm6P1icnRcUlyuRu2hwnWJa
 7OIvxEAIkqYpWd+63anqXU/T/73vdBS9vt+XaNhN5gHxAAbBU1DEfCCQSdTsO66rScDP
 e9pEeIrCXjdsieRM9nlTpLwAUF25iYtzu7Mnt15+11EWnUp2ru+DOrklYKWqBXhBxxk5
 dfgkDgYApEJspPbaEyq+yiJsOMZXE9+TxtN6bDoGGEInFrPcPoGMV0//jwWJeGC2ACMV
 2Sww==
X-Gm-Message-State: AOAM530sHwxm8WUmxjdt/qudRaEVFowCISDenqCfamclFvtq4od+/Bm3
 8SCPYJrgYpOzSWjIhZDIEeNUjmJ0fZFbrgIuDcbAUA==
X-Google-Smtp-Source: ABdhPJx0qf7MKmfYY4TcLUE3X9oHQrD8QeY7Y0gD/AdByGKx0b3ijIYiPXLZXl4vV2XQfqOZKYpyyXGQTWiN+2lY1Dw=
X-Received: by 2002:a17:906:1450:: with SMTP id
 q16mr3717376ejc.213.1635409314416; 
 Thu, 28 Oct 2021 01:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home>
 <CAPnjgZ3gQJz2YLhGuj-8RBok7ijc9s-vg2Q2ZDyQx71QfpWd5g@mail.gmail.com>
In-Reply-To: <CAPnjgZ3gQJz2YLhGuj-8RBok7ijc9s-vg2Q2ZDyQx71QfpWd5g@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 28 Oct 2021 10:21:43 +0200
Message-ID: <CAHFG_=XivFRi-quuMkExT9XOt3EsJ6T9TJ5MiV7cQwCj3OuK7A@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000003fa98205cf656715"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003fa98205cf656715
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Le jeu. 28 oct. 2021 =C3=A0 04:51, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

> Hi Ilias,
>
> On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > Hi Simon,
> >
> > A bit late to the party, sorry!
>
> (Did you remember the beer? I am replying to this but I don't think it
> is all that helpful for me to reply to a lot of things on this thread,
> since I would not be adding much to my cover letter and patches)
>
> >
> > [...]
> >
> > > >
> > > > I really want to see what the binary case looks like since we could
> then
> > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we coul=
d
> > > > then also do a rpi_arm32_defconfig too.
> > > >
> > > > I want to see less device trees in U-Boot sources, if they can come
> > > > functionally correct from the hardware/our caller.
> > > >
> > > > And I'm not seeing how we make use of "U-Boot /config" if we also
> don't
> > > > use the device tree from build time at run time, ignoring the devic=
e
> > > > tree provided to us at run time by the caller.
> > >
> > > Firstly I should say that I find building firmware very messy and
> > > confusing these days. Lots of things to build and it's hard to find
> > > the instructions. It doesn't have to be that way, but if we carry on
> > > as we are, it will continue to be messy and in five years you will
> > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > objective here is to simplify things, bringing some consistency to th=
e
> > > different components. Binman was one effort there. I feel that puttin=
g
> > > at least the U-Boot house in order, in my role as devicetree
> > > maintainer (and as author of devicetree support in U-Boot back in
> > > 2011), is the next step.
> > >
> > > If we set things up correctly and agree on the bindings, devicetree
> > > can be the unifying configuration mechanism through the whole of
> > > firmware (except for very early bits) and into the OS, this will set
> > > us up very well to deal with the complexity that is coming.
> > >
> > > Anyway, here are the mental steps that I've gone through over the pas=
t
> > > two months:
> > >
> > > Step 1: At present, some people think U-Boot is not even allowed to
> > > have its own nodes/properties in the DT. It is an abuse of the
> > > devicetree standard, like the /chosen node but with less history. We
> > > should sacrifice efficiency, expedience and expandability on the alta=
r
> > > of 'devicetree is a hardware description'. How do we get over that
> > > one? Wel, I just think we need to accept that U-Boot uses devicetree
> > > for its own purposes, as well as for booting the OS. I am not saying
> > > it always has to have those properties, but with existing features
> > > like verified boot, SPL as well as complex firmware images where
> > > U-Boot needs to be able to find things in the image, it is essential.
> > > So let's just assume that we need this everywhere, since we certainly
> > > need it in at least some places.
> > >
> > > (stop reading here if you disagree, because nothing below will make
> > > any sense...you can still use U-Boot v2011.06 which doesn't have
> > > OF_CONTROL :-)
> >
> > Having U-Boot keep it's *internal* config state in DTs is fine.  Adding
> > that to the DTs that are copied over from linux isn't imho.  There are
> > various reasons for that.  First of all syncing device trees is a huge
> pain
> > and that's probably one of the main reasons our DTs are out of sync for=
 a
> > large number of boards.
> > The point is this was fine in 2011 were we had SPL only,  but the reali=
ty
> > today is completely different.  There's previous stage boot loaders (an=
d
> > enough cases were vendors prefer those over SPL).  If that bootloader
> needs
> > to use it's own device tree for whatever reason,  imposing restrictions
> on
> > it wrt to the device tree it has to include,  and require them to have
> > knowledge of U-Boot and it's internal config mechanism makes no sense n=
ot
> > to mention it doesn't scale at all.
>
> I think the solution here may be the binman image packer. It works
> from a description of the image (i.e. is data-driver) and can collect
> all the pieces together. The U-Boot properties (and the ones required
> by TF-A, etc.) can be added at package time.
>
> If you think about it, it doesn't matter what properties are in the DT
> that is put into the firmware image. TF-A, for example, is presumably
> reading a devicetree from flash, so what does it care if it has some
> U-Boot properties in it?


I am going to change my position in all mail threads I participate.
I was trying to make patches relevant in the future and conceptually clean.
That may not be the most effective position: I should just care about
Linaro and its members being able to implement SystemReady concepts.


If you mandate U-Boot has nodes in the device tree passed to the OS, we can
put DT fragment in  the nt_fw_config section of the fip and merge it at
boot time. So there is a solution compatible with SystemReady.

If you want to put fake, non future proof, DT sources in the dts for
platforms that are organized to provide the authoritative DT to U-Boot at
runtime, that's kind of your choice (hopefully representing the rest of
U-Boot community). There will be quirk code in U-Boot to redo the
adaptations on its non authoritative DT that the platform previous stage
firmware does (already saw one in the past month); as Mark said there will
be issues over time; and it will confuse people about the role of the DT.
But I am fine with it as it does not impair Linaro and its members ability
to implement SystemReady way of handling DT.


>
> As to syncing, we have solved this using u-boot.dtsi files in U-Boot,
> so I think this can be dealt with.
>
> >
> > >
> > > Step 2: Assume U-Boot has its own nodes/properties. How do they get
> > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> > > have binman definitions, etc. So we need a way to overlay those thing=
s
> > > into the DT. We already support this for in-tree DTs, so IMO this is
> > > easy. Just require every board to have an in-tree DT. It helps with
> > > discoverability and documentation, anyway. That is this series.
> > >
> >
> > Again, the board might decide for it's own reason to provide it's own D=
T.
> > IMHO U-Boot must be able to cope with that and asking DTs to be include=
d
> in
> > U-Boot source is not the right way to do that,  not to mention cases we=
re
> > that's completely unrealistic (e.g QEMU or a board that reads the DTB
> from
> > it's flash).
>
> I think you are at step 2. See above for my response.
>
> >
> > > (I think most of us are at the beginning of step 2, unsure about it
> > > and worried about step 3)
> > >
> > > Step 3: Ah, but there are flows (i.e. boards that use a particular
> > > flow only, or boards that sometimes use a flow) which need the DT to
> > > come from a prior stage. How to handle that? IMO that is only going t=
o
> > > grow as every man and his dog get into the write-a-bootloader
> > > business.
> >
> > And that's exactly why we have to come up with something that scales,
> without
> > having to add a bunch of unusable DTs in U-Boot.
>
> In what way does this not scale? How are the DTs unusable? If there is
> a standard binding, we should be fine.
>
> >
> > > We need a way to provide the U-Boot nodes/properties in a
> > > form that the prior stage can consume and integrate with its build
> > > system. Is TF-A the only thing being discussed here? If so, let's jus=
t
> > > do it. We have the u-boot.dtsi and we can use binman to put the image
> > > together, for example. Or we can get clever and create some sort of
> > > overlay dtb.
> > >
> > > Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
> > > then it will need to build it in and use two devicetrees, one interna=
l
> > > and one from the prior stage....well that is not very efficient and i=
t
> > > is going to be confusing for people to figure out what U-Boot is
> > > actually doing. But we actually already do that in a lot of cases
> > > where U-Boot passes a DT to the kernel which is different to the one
> > > it uses. So perhaps we have three devicetrees? OMG.
> >
> > No we don't. That's a moot point. If you separate the DTs U-Boot
> > provides the internal one and inherits one 'generic'.  Linux will be
> able to use
> > that.  So the only case were you'll need 3 DTs is if the *vendor* break=
s
> the
> > DT across kernel versions,  In which case there's not much you can do t=
o
> > begin with and that's already a case we have to deal with.
>
> Linux actually doesn't care if the U-Boot properties are in the tree,
> so long as we have proper bindings. My point here is we only need
> either:
>
> a. one devicetree, shared with Linux and U-Boot (and TF-A?)
> b. two devicetrees, one for use in firmware and one for passing to Linux
>
> We don't need to separate out the U-Boot properties into a second (or
> third) devicetree. There just isn't any point.
>
> >
> > > b) Well then
> > > U-Boot can have its own small devicetree with its bits and then U-Boo=
t
> > > can merge the two when it starts. Again that is not very efficient. I=
t
> > > means that U-Boot cannot be controlled by the prior stage (e.g. to ge=
t
> > > its public key from there or to enable/disable the console), so
> > > unified firmware config is not possible. It will get very confusing,
> > > particularly for debugging U-Boot. c) Some other scheme to avoid
> > > accepting step 3...please stop!
> > >
> > > Step 4: Yes, but there is QEMU, which makes the devicetree up out of
> > > whole cloth. What about that? Well, we are just going to have to deal
> > > with that. We can easily merge in the U-Boot nodes/properties and
> > > update the U-Boot CI scripts to do this, as needed, e.g. with
> > > qemu-riscv64_spl. It's only one use case, although Xen might do
> > > something similar.
> > >
> > > To my mind, that deals with both the build-time and run-time issues.
> > > We have a discoverable DT in U-Boot, which should be considered the
> > > source of truth for most boards. We can sync it with Linux
> > > automatically with the tooling that I hope Rob Herring will come up
> > > with. We can use an empty one where there really is no default,
> > > although I'd argue that is making perfect an enemy of the good.
> > >
> > > Step 5: If we get clever and want to remove them from the U-Boot tree
> > > and pick them up from somewhere else, we can do that with sufficient
> > > tooling. Perhaps we should set a timeline for that? A year? Two? Six?
> >
> > We can start slowly migrating boards and see how that works out.
> > We could either use 2 device trees as you proposed, or have u-boot merg=
e
> > the 'u-boot' DTB and the inherited DTB before DM comes up.  OTOH I'd
> prefer
> > if linux gets handed a clean device tree without the u-boot internals i=
n
> > it, so I think 2 discrete DTs is cleaner overall.
>
> I know you would prefer that, but does it really matter in practice?
> What is the objection, actually?
>
> As I mentioned on the call, I think the prior stage should do any
> merging or fixing up. Trying to do that sort of thing in 'early' code
> in U-Boot (or any other program, including Linux) is such a pain. With
> U-Boot, for example, we don't even have any RAM available to do it
> with half the time and it would dramatically increase the amount of
> memory needed prior to relocation. It just isn't a very good idea to
> try to do this in early code. It is also completely unnecessary, once
> you get past the philosophical objections.
>
> If TF-A wants to be in the picture, let it deal with the implications
> and responsibility thus incurred. TF-A has no right to tell U-Boot how
> to handle its config. TF-A is 0.5m LOC, i.e. a lot, almost a quarter
> of the size of U-Boot. It duplicates loads of things in there. No one
> will even *notice* an FDT merge function, which is actually only 70
> LOC:
>
> /**
>  * overlay_apply_node - Merges a node into the base device tree
>  * @fdt: Base Device Tree blob
>  * @target: Node offset in the base device tree to apply the fragment to
>  * @fdto: Device tree overlay blob
>  * @node: Node offset in the overlay holding the changes to merge
>  *
>  * overlay_apply_node() merges a node into a target base device tree
>  * node pointed.
>  *
>  * This is part of the final step in the device tree overlay
>  * application process, when all the phandles have been adjusted and
>  * resolved and you just have to merge overlay into the base device
>  * tree.
>  *
>  * returns:
>  *      0 on success
>  *      Negative error code on failure
>  */
> static int overlay_apply_node(void *fdt, int target,
>                void *fdto, int node)
> {
>    int property;
>    int subnode;
>
>    fdt_for_each_property_offset(property, fdto, node) {
>       const char *name;
>       const void *prop;
>       int prop_len;
>       int ret;
>
>       prop =3D fdt_getprop_by_offset(fdto, property, &name,
>                     &prop_len);
>       if (prop_len =3D=3D -FDT_ERR_NOTFOUND)
>          return -FDT_ERR_INTERNAL;
>       if (prop_len < 0)
>          return prop_len;
>
>       ret =3D fdt_setprop(fdt, target, name, prop, prop_len);
>       if (ret)
>          return ret;
>    }
>
>    fdt_for_each_subnode(subnode, fdto, node) {
>       const char *name =3D fdt_get_name(fdto, subnode, NULL);
>       int nnode;
>       int ret;
>
>       nnode =3D fdt_add_subnode(fdt, target, name);
>       if (nnode =3D=3D -FDT_ERR_EXISTS) {
>          nnode =3D fdt_subnode_offset(fdt, target, name);
>          if (nnode =3D=3D -FDT_ERR_NOTFOUND)
>             return -FDT_ERR_INTERNAL;
>       }
>
>       if (nnode < 0)
>          return nnode;
>
>       ret =3D overlay_apply_node(fdt, nnode, fdto, subnode);
>       if (ret)
>          return ret;
>    }
>
>    return 0;
>
>
>
> }
>
>
> >
> > Regards
> > /Ilias
> > >
> > > To repeat, if we set things up correctly and agree on the bindings,
> > > devicetree can be the unifying configuration mechanism through the
> > > whole of firmware (except for very early bits) and into the OS. I fee=
l
> > > this will set us up very well to deal with the complexity that is
> > > coming.
> > >
>
> Regards,
> Simon
>

--0000000000003fa98205cf656715
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi Simon,</div><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28 oct. 2021 =
=C3=A0 04:51, Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org" target=3D=
"_blank">sjg@chromium.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Hi Ilias,<br>
<br>
On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas<br>
&lt;<a href=3D"mailto:ilias.apalodimas@linaro.org" target=3D"_blank">ilias.=
apalodimas@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Simon,<br>
&gt;<br>
&gt; A bit late to the party, sorry!<br>
<br>
(Did you remember the beer? I am replying to this but I don&#39;t think it<=
br>
is all that helpful for me to reply to a lot of things on this thread,<br>
since I would not be adding much to my cover letter and patches)<br>
<br>
&gt;<br>
&gt; [...]<br>
&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I really want to see what the binary case looks like since w=
e could then<br>
&gt; &gt; &gt; kill off rpi_{3,3_b,4}_defconfig and I would need to see if =
we could<br>
&gt; &gt; &gt; then also do a rpi_arm32_defconfig too.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I want to see less device trees in U-Boot sources, if they c=
an come<br>
&gt; &gt; &gt; functionally correct from the hardware/our caller.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And I&#39;m not seeing how we make use of &quot;U-Boot /conf=
ig&quot; if we also don&#39;t<br>
&gt; &gt; &gt; use the device tree from build time at run time, ignoring th=
e device<br>
&gt; &gt; &gt; tree provided to us at run time by the caller.<br>
&gt; &gt;<br>
&gt; &gt; Firstly I should say that I find building firmware very messy and=
<br>
&gt; &gt; confusing these days. Lots of things to build and it&#39;s hard t=
o find<br>
&gt; &gt; the instructions. It doesn&#39;t have to be that way, but if we c=
arry on<br>
&gt; &gt; as we are, it will continue to be messy and in five years you wil=
l<br>
&gt; &gt; need a Ph.D and a lucky charm to boot on any modern board. My<br>
&gt; &gt; objective here is to simplify things, bringing some consistency t=
o the<br>
&gt; &gt; different components. Binman was one effort there. I feel that pu=
tting<br>
&gt; &gt; at least the U-Boot house in order, in my role as devicetree<br>
&gt; &gt; maintainer (and as author of devicetree support in U-Boot back in=
<br>
&gt; &gt; 2011), is the next step.<br>
&gt; &gt;<br>
&gt; &gt; If we set things up correctly and agree on the bindings, devicetr=
ee<br>
&gt; &gt; can be the unifying configuration mechanism through the whole of<=
br>
&gt; &gt; firmware (except for very early bits) and into the OS, this will =
set<br>
&gt; &gt; us up very well to deal with the complexity that is coming.<br>
&gt; &gt;<br>
&gt; &gt; Anyway, here are the mental steps that I&#39;ve gone through over=
 the past<br>
&gt; &gt; two months:<br>
&gt; &gt;<br>
&gt; &gt; Step 1: At present, some people think U-Boot is not even allowed =
to<br>
&gt; &gt; have its own nodes/properties in the DT. It is an abuse of the<br=
>
&gt; &gt; devicetree standard, like the /chosen node but with less history.=
 We<br>
&gt; &gt; should sacrifice efficiency, expedience and expandability on the =
altar<br>
&gt; &gt; of &#39;devicetree is a hardware description&#39;. How do we get =
over that<br>
&gt; &gt; one? Wel, I just think we need to accept that U-Boot uses devicet=
ree<br>
&gt; &gt; for its own purposes, as well as for booting the OS. I am not say=
ing<br>
&gt; &gt; it always has to have those properties, but with existing feature=
s<br>
&gt; &gt; like verified boot, SPL as well as complex firmware images where<=
br>
&gt; &gt; U-Boot needs to be able to find things in the image, it is essent=
ial.<br>
&gt; &gt; So let&#39;s just assume that we need this everywhere, since we c=
ertainly<br>
&gt; &gt; need it in at least some places.<br>
&gt; &gt;<br>
&gt; &gt; (stop reading here if you disagree, because nothing below will ma=
ke<br>
&gt; &gt; any sense...you can still use U-Boot v2011.06 which doesn&#39;t h=
ave<br>
&gt; &gt; OF_CONTROL :-)<br>
&gt;<br>
&gt; Having U-Boot keep it&#39;s *internal* config state in DTs is fine.=C2=
=A0 Adding<br>
&gt; that to the DTs that are copied over from linux isn&#39;t imho.=C2=A0 =
There are<br>
&gt; various reasons for that.=C2=A0 First of all syncing device trees is a=
 huge pain<br>
&gt; and that&#39;s probably one of the main reasons our DTs are out of syn=
c for a<br>
&gt; large number of boards.<br>
&gt; The point is this was fine in 2011 were we had SPL only,=C2=A0 but the=
 reality<br>
&gt; today is completely different.=C2=A0 There&#39;s previous stage boot l=
oaders (and<br>
&gt; enough cases were vendors prefer those over SPL).=C2=A0 If that bootlo=
ader needs<br>
&gt; to use it&#39;s own device tree for whatever reason,=C2=A0 imposing re=
strictions on<br>
&gt; it wrt to the device tree it has to include,=C2=A0 and require them to=
 have<br>
&gt; knowledge of U-Boot and it&#39;s internal config mechanism makes no se=
nse not<br>
&gt; to mention it doesn&#39;t scale at all.<br>
<br>
I think the solution here may be the binman image packer. It works<br>
from a description of the image (i.e. is data-driver) and can collect<br>
all the pieces together. The U-Boot properties (and the ones required<br>
by TF-A, etc.) can be added at package time.<br>
<br>
If you think about it, it doesn&#39;t matter what properties are in the DT<=
br>
that is put into the firmware image. TF-A, for example, is presumably<br>
reading a devicetree from flash, so what does it care if it has some<br>
U-Boot properties in it?</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I am going to change my position in all mail threads I participat=
e.</div><div dir=3D"auto">I was trying to make patches relevant in the futu=
re and conceptually clean. That may not be the most effective position: I s=
hould just care about Linaro and its members being able to implement System=
Ready concepts.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">If you mandate U-Boot has nodes in the device tre=
e passed to the OS, we can put DT fragment in =C2=A0the nt_fw_config sectio=
n of the fip and merge it at boot time. So there is a solution compatible w=
ith SystemReady.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you =
want to put fake, non future proof, DT sources in the dts for platforms tha=
t are organized to provide the authoritative DT to U-Boot at runtime, that&=
#39;s kind of your choice (hopefully representing the rest of U-Boot commun=
ity). There will be quirk code in U-Boot to redo the adaptations on its non=
 authoritative DT that the platform previous stage firmware does (already s=
aw one in the past month); as Mark said there will be issues over time; and=
 it will confuse people about the role of the DT. But I am fine with it as =
it does not impair Linaro and its members ability to implement SystemReady =
way of handling DT.=C2=A0</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex" dir=3D"auto"><br>
<br>
As to syncing, we have solved this using u-boot.dtsi files in U-Boot,<br>
so I think this can be dealt with.<br>
<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Step 2: Assume U-Boot has its own nodes/properties. How do they g=
et<br>
&gt; &gt; there? Well, we have u-boot.dtsi files for that (the 2016 patch<b=
r>
&gt; &gt; &quot;6d427c6b1fa binman: Automatically include a U-Boot .dtsi fi=
le&quot;), we<br>
&gt; &gt; have binman definitions, etc. So we need a way to overlay those t=
hings<br>
&gt; &gt; into the DT. We already support this for in-tree DTs, so IMO this=
 is<br>
&gt; &gt; easy. Just require every board to have an in-tree DT. It helps wi=
th<br>
&gt; &gt; discoverability and documentation, anyway. That is this series.<b=
r>
&gt; &gt;<br>
&gt;<br>
&gt; Again, the board might decide for it&#39;s own reason to provide it&#3=
9;s own DT.<br>
&gt; IMHO U-Boot must be able to cope with that and asking DTs to be includ=
ed in<br>
&gt; U-Boot source is not the right way to do that,=C2=A0 not to mention ca=
ses were<br>
&gt; that&#39;s completely unrealistic (e.g QEMU or a board that reads the =
DTB from<br>
&gt; it&#39;s flash).<br>
<br>
I think you are at step 2. See above for my response.<br>
<br>
&gt;<br>
&gt; &gt; (I think most of us are at the beginning of step 2, unsure about =
it<br>
&gt; &gt; and worried about step 3)<br>
&gt; &gt;<br>
&gt; &gt; Step 3: Ah, but there are flows (i.e. boards that use a particula=
r<br>
&gt; &gt; flow only, or boards that sometimes use a flow) which need the DT=
 to<br>
&gt; &gt; come from a prior stage. How to handle that? IMO that is only goi=
ng to<br>
&gt; &gt; grow as every man and his dog get into the write-a-bootloader<br>
&gt; &gt; business.<br>
&gt;<br>
&gt; And that&#39;s exactly why we have to come up with something that scal=
es,=C2=A0 without<br>
&gt; having to add a bunch of unusable DTs in U-Boot.<br>
<br>
In what way does this not scale? How are the DTs unusable? If there is<br>
a standard binding, we should be fine.<br>
<br>
&gt;<br>
&gt; &gt; We need a way to provide the U-Boot nodes/properties in a<br>
&gt; &gt; form that the prior stage can consume and integrate with its buil=
d<br>
&gt; &gt; system. Is TF-A the only thing being discussed here? If so, let&#=
39;s just<br>
&gt; &gt; do it. We have the u-boot.dtsi and we can use binman to put the i=
mage<br>
&gt; &gt; together, for example. Or we can get clever and create some sort =
of<br>
&gt; &gt; overlay dtb.<br>
&gt; &gt;<br>
&gt; &gt; Step 3a. But I don&#39;t want to do that. a) If U-Boot needs this=
 stuff<br>
&gt; &gt; then it will need to build it in and use two devicetrees, one int=
ernal<br>
&gt; &gt; and one from the prior stage....well that is not very efficient a=
nd it<br>
&gt; &gt; is going to be confusing for people to figure out what U-Boot is<=
br>
&gt; &gt; actually doing. But we actually already do that in a lot of cases=
<br>
&gt; &gt; where U-Boot passes a DT to the kernel which is different to the =
one<br>
&gt; &gt; it uses. So perhaps we have three devicetrees? OMG.<br>
&gt;<br>
&gt; No we don&#39;t. That&#39;s a moot point. If you separate the DTs U-Bo=
ot<br>
&gt; provides the internal one and inherits one &#39;generic&#39;.=C2=A0 Li=
nux will be able to use<br>
&gt; that.=C2=A0 So the only case were you&#39;ll need 3 DTs is if the *ven=
dor* breaks the<br>
&gt; DT across kernel versions,=C2=A0 In which case there&#39;s not much yo=
u can do to<br>
&gt; begin with and that&#39;s already a case we have to deal with.<br>
<br>
Linux actually doesn&#39;t care if the U-Boot properties are in the tree,<b=
r>
so long as we have proper bindings. My point here is we only need<br>
either:<br>
<br>
a. one devicetree, shared with Linux and U-Boot (and TF-A?)<br>
b. two devicetrees, one for use in firmware and one for passing to Linux<br=
>
<br>
We don&#39;t need to separate out the U-Boot properties into a second (or<b=
r>
third) devicetree. There just isn&#39;t any point.<br>
<br>
&gt;<br>
&gt; &gt; b) Well then<br>
&gt; &gt; U-Boot can have its own small devicetree with its bits and then U=
-Boot<br>
&gt; &gt; can merge the two when it starts. Again that is not very efficien=
t. It<br>
&gt; &gt; means that U-Boot cannot be controlled by the prior stage (e.g. t=
o get<br>
&gt; &gt; its public key from there or to enable/disable the console), so<b=
r>
&gt; &gt; unified firmware config is not possible. It will get very confusi=
ng,<br>
&gt; &gt; particularly for debugging U-Boot. c) Some other scheme to avoid<=
br>
&gt; &gt; accepting step 3...please stop!<br>
&gt; &gt;<br>
&gt; &gt; Step 4: Yes, but there is QEMU, which makes the devicetree up out=
 of<br>
&gt; &gt; whole cloth. What about that? Well, we are just going to have to =
deal<br>
&gt; &gt; with that. We can easily merge in the U-Boot nodes/properties and=
<br>
&gt; &gt; update the U-Boot CI scripts to do this, as needed, e.g. with<br>
&gt; &gt; qemu-riscv64_spl. It&#39;s only one use case, although Xen might =
do<br>
&gt; &gt; something similar.<br>
&gt; &gt;<br>
&gt; &gt; To my mind, that deals with both the build-time and run-time issu=
es.<br>
&gt; &gt; We have a discoverable DT in U-Boot, which should be considered t=
he<br>
&gt; &gt; source of truth for most boards. We can sync it with Linux<br>
&gt; &gt; automatically with the tooling that I hope Rob Herring will come =
up<br>
&gt; &gt; with. We can use an empty one where there really is no default,<b=
r>
&gt; &gt; although I&#39;d argue that is making perfect an enemy of the goo=
d.<br>
&gt; &gt;<br>
&gt; &gt; Step 5: If we get clever and want to remove them from the U-Boot =
tree<br>
&gt; &gt; and pick them up from somewhere else, we can do that with suffici=
ent<br>
&gt; &gt; tooling. Perhaps we should set a timeline for that? A year? Two? =
Six?<br>
&gt;<br>
&gt; We can start slowly migrating boards and see how that works out.<br>
&gt; We could either use 2 device trees as you proposed, or have u-boot mer=
ge<br>
&gt; the &#39;u-boot&#39; DTB and the inherited DTB before DM comes up.=C2=
=A0 OTOH I&#39;d prefer<br>
&gt; if linux gets handed a clean device tree without the u-boot internals =
in<br>
&gt; it, so I think 2 discrete DTs is cleaner overall.<br>
<br>
I know you would prefer that, but does it really matter in practice?<br>
What is the objection, actually?<br>
<br>
As I mentioned on the call, I think the prior stage should do any<br>
merging or fixing up. Trying to do that sort of thing in &#39;early&#39; co=
de<br>
in U-Boot (or any other program, including Linux) is such a pain. With<br>
U-Boot, for example, we don&#39;t even have any RAM available to do it<br>
with half the time and it would dramatically increase the amount of<br>
memory needed prior to relocation. It just isn&#39;t a very good idea to<br=
>
try to do this in early code. It is also completely unnecessary, once<br>
you get past the philosophical objections.<br>
<br>
If TF-A wants to be in the picture, let it deal with the implications<br>
and responsibility thus incurred. TF-A has no right to tell U-Boot how<br>
to handle its config. TF-A is 0.5m LOC, i.e. a lot, almost a quarter<br>
of the size of U-Boot. It duplicates loads of things in there. No one<br>
will even *notice* an FDT merge function, which is actually only 70<br>
LOC:<br>
<br>
/**<br>
=C2=A0* overlay_apply_node - Merges a node into the base device tree<br>
=C2=A0* @fdt: Base Device Tree blob<br>
=C2=A0* @target: Node offset in the base device tree to apply the fragment =
to<br>
=C2=A0* @fdto: Device tree overlay blob<br>
=C2=A0* @node: Node offset in the overlay holding the changes to merge<br>
=C2=A0*<br>
=C2=A0* overlay_apply_node() merges a node into a target base device tree<b=
r>
=C2=A0* node pointed.<br>
=C2=A0*<br>
=C2=A0* This is part of the final step in the device tree overlay<br>
=C2=A0* application process, when all the phandles have been adjusted and<b=
r>
=C2=A0* resolved and you just have to merge overlay into the base device<br=
>
=C2=A0* tree.<br>
=C2=A0*<br>
=C2=A0* returns:<br>
=C2=A0*=C2=A0 =C2=A0 =C2=A0 0 on success<br>
=C2=A0*=C2=A0 =C2=A0 =C2=A0 Negative error code on failure<br>
=C2=A0*/<br>
static int overlay_apply_node(void *fdt, int target,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *fdto, int node=
)<br>
{<br>
=C2=A0 =C2=A0int property;<br>
=C2=A0 =C2=A0int subnode;<br>
<br>
=C2=A0 =C2=A0fdt_for_each_property_offset(property, fdto, node) {<br>
=C2=A0 =C2=A0 =C2=A0 const char *name;<br>
=C2=A0 =C2=A0 =C2=A0 const void *prop;<br>
=C2=A0 =C2=A0 =C2=A0 int prop_len;<br>
=C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 prop =3D fdt_getprop_by_offset(fdto, property, &amp;na=
me,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;=
prop_len);<br>
=C2=A0 =C2=A0 =C2=A0 if (prop_len =3D=3D -FDT_ERR_NOTFOUND)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -FDT_ERR_INTERNAL;<br>
=C2=A0 =C2=A0 =C2=A0 if (prop_len &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return prop_len;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 ret =3D fdt_setprop(fdt, target, name, prop, prop_len)=
;<br>
=C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0fdt_for_each_subnode(subnode, fdto, node) {<br>
=C2=A0 =C2=A0 =C2=A0 const char *name =3D fdt_get_name(fdto, subnode, NULL)=
;<br>
=C2=A0 =C2=A0 =C2=A0 int nnode;<br>
=C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 nnode =3D fdt_add_subnode(fdt, target, name);<br>
=C2=A0 =C2=A0 =C2=A0 if (nnode =3D=3D -FDT_ERR_EXISTS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nnode =3D fdt_subnode_offset(fdt, target,=
 name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nnode =3D=3D -FDT_ERR_NOTFOUND)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -FDT_ERR_INTERNAL;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if (nnode &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nnode;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 ret =3D overlay_apply_node(fdt, nnode, fdto, subnode);=
<br>
=C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0return 0;<br>
<br>
<br>
<br>
}<br>
<br>
<br>
&gt;<br>
&gt; Regards<br>
&gt; /Ilias<br>
&gt; &gt;<br>
&gt; &gt; To repeat, if we set things up correctly and agree on the binding=
s,<br>
&gt; &gt; devicetree can be the unifying configuration mechanism through th=
e<br>
&gt; &gt; whole of firmware (except for very early bits) and into the OS. I=
 feel<br>
&gt; &gt; this will set us up very well to deal with the complexity that is=
<br>
&gt; &gt; coming.<br>
&gt; &gt;<br>
<br>
Regards,<br>
Simon<br>
</blockquote></div></div>
</div>

--0000000000003fa98205cf656715--

