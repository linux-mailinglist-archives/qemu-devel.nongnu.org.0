Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABEA43E671
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 18:44:33 +0200 (CEST)
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg8W0-00052g-6Y
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 12:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mg8EB-0003NW-QW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:26:11 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mg8E5-0002xG-4x
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 12:26:07 -0400
Received: by mail-ed1-x535.google.com with SMTP id 5so26424293edw.7
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 09:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nxg5+pC95qjeViCb1BHWEeLYq2n8dNzqILJnNXtH4Y0=;
 b=r7pHY2cb+cwXwKax117zn6FvMM5I2GgADSGXJ3lzMpYvkpEy4Gt4O1XT0NUw8mMAmw
 +Rm3bqaH96u6uTd//Gs7auhrnGjP9HRwETGUzihQocbDn/kPzVrXOHhuushB1zveI9Us
 6LPNrgR2NSU1dJJqC8l68weB1NJKYeebZqSlEQTV+wpAgQ308M25LO7h2rTVtczouweG
 db7N6vplI489h8C0WYPC5Cmsp/25rtjvdZ69jh7CkVgThnjyETh7LaYI81x9HUfh1F8D
 RVEqLjV47EdQutOWEesCPCkJEpMBmg7sm8M+Po25W7QT08AxPW/L3jUAgt7rTwFM03fv
 fjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nxg5+pC95qjeViCb1BHWEeLYq2n8dNzqILJnNXtH4Y0=;
 b=NOviu2Tc8fSu/1JrpDE02N8ZvTOAlF+6Vc1lKthRrVbAi9mBk0xLsaKHeQo9RxAIfl
 QEzpSekWYZmHoGdnJuNusBEMCgFBjHG02K7xxMB39ZnC1nilSPWOFitmuLToHmcxitA/
 0SSVVRP3IjPbaYwfS9LhcRTK5gijTmncrOeubgzt7SQqYnBwEDxefb0utQROvOLrqp6Z
 38pQ3fZc4GSI03TQwzeFjDegUJh6WvfRva/BzogEFdodQ2dDn3k/rECZAgkuXEr/2Yxk
 wsm54qherF5fCkjUaQRhmovnbojk6S1q489G15ounSlM8X9w+gyYtqi8pNwNL++GJelC
 P0Og==
X-Gm-Message-State: AOAM533ccq8apey+E0AYuMn4e0iEpSi3lv4U2iASP0/gjym4Hd6KOJMr
 bO3PepgGQeDsmkVRdbFs60VtD7UqshOgp2vfx+RAqQ==
X-Google-Smtp-Source: ABdhPJyi2C+ZxD4IIfkddYLaerm2dPZ6deGTQ64SFCdBN63NsT6nRDlQHFr7UshR6bAmRMOIrtaQes63f3zyKwIgynA=
X-Received: by 2002:a05:6402:84a:: with SMTP id
 b10mr7305091edz.257.1635438357792; 
 Thu, 28 Oct 2021 09:25:57 -0700 (PDT)
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
 <CAHFG_=XivFRi-quuMkExT9XOt3EsJ6T9TJ5MiV7cQwCj3OuK7A@mail.gmail.com>
 <CAPnjgZ0jfpFcbC6HNbWhP8kK531ePzBro2Jn8Fi==GgcWAej6Q@mail.gmail.com>
 <CAHFG_=XgiqEZch2p+ZdBuGUfW9L6_+06kpakbvKcNsk7Gn6SOw@mail.gmail.com>
 <CAPnjgZ0GufveoMWB5d7hhPxjr69_vZ1oBS6mCHHwU5t6Tzo+VQ@mail.gmail.com>
In-Reply-To: <CAPnjgZ0GufveoMWB5d7hhPxjr69_vZ1oBS6mCHHwU5t6Tzo+VQ@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 28 Oct 2021 18:25:46 +0200
Message-ID: <CAHFG_=XeNF_Kcg2jeKkviz5bAjMKVq4qQC4hGXWzwAVT6mH3Cg@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000005e5fca05cf6c2a4a"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Liviu Dudau <Liviu.Dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
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
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
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

--0000000000005e5fca05cf6c2a4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

Le jeu. 28 oct. 2021 =C3=A0 17:44, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

> Hi Fran=C3=A7ois,
>
> On Thu, 28 Oct 2021 at 08:50, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g>
> wrote:
> >
> > Hi Simon
> >
> > Le jeu. 28 oct. 2021 =C3=A0 16:30, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
> >>
> >> Hi Fran=C3=A7ois,
> >>
> >> On Thu, 28 Oct 2021 at 02:21, Fran=C3=A7ois Ozog <francois.ozog@linaro=
.org>
> wrote:
> >> >
> >> > Hi Simon,
> >> >
> >> > Le jeu. 28 oct. 2021 =C3=A0 04:51, Simon Glass <sjg@chromium.org> a =
=C3=A9crit
> :
> >> >>
> >> >> Hi Ilias,
> >> >>
> >> >> On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas
> >> >> <ilias.apalodimas@linaro.org> wrote:
> >> >> >
> >> >> > Hi Simon,
> >> >> >
> >> >> > A bit late to the party, sorry!
> >> >>
> >> >> (Did you remember the beer? I am replying to this but I don't think
> it
> >> >> is all that helpful for me to reply to a lot of things on this
> thread,
> >> >> since I would not be adding much to my cover letter and patches)
> >> >>
> >> >> >
> >> >> > [...]
> >> >> >
> >> >> > > >
> >> >> > > > I really want to see what the binary case looks like since we
> could then
> >> >> > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if w=
e
> could
> >> >> > > > then also do a rpi_arm32_defconfig too.
> >> >> > > >
> >> >> > > > I want to see less device trees in U-Boot sources, if they ca=
n
> come
> >> >> > > > functionally correct from the hardware/our caller.
> >> >> > > >
> >> >> > > > And I'm not seeing how we make use of "U-Boot /config" if we
> also don't
> >> >> > > > use the device tree from build time at run time, ignoring the
> device
> >> >> > > > tree provided to us at run time by the caller.
> >> >> > >
> >> >> > > Firstly I should say that I find building firmware very messy a=
nd
> >> >> > > confusing these days. Lots of things to build and it's hard to
> find
> >> >> > > the instructions. It doesn't have to be that way, but if we
> carry on
> >> >> > > as we are, it will continue to be messy and in five years you
> will
> >> >> > > need a Ph.D and a lucky charm to boot on any modern board. My
> >> >> > > objective here is to simplify things, bringing some consistency
> to the
> >> >> > > different components. Binman was one effort there. I feel that
> putting
> >> >> > > at least the U-Boot house in order, in my role as devicetree
> >> >> > > maintainer (and as author of devicetree support in U-Boot back =
in
> >> >> > > 2011), is the next step.
> >> >> > >
> >> >> > > If we set things up correctly and agree on the bindings,
> devicetree
> >> >> > > can be the unifying configuration mechanism through the whole o=
f
> >> >> > > firmware (except for very early bits) and into the OS, this wil=
l
> set
> >> >> > > us up very well to deal with the complexity that is coming.
> >> >> > >
> >> >> > > Anyway, here are the mental steps that I've gone through over
> the past
> >> >> > > two months:
> >> >> > >
> >> >> > > Step 1: At present, some people think U-Boot is not even allowe=
d
> to
> >> >> > > have its own nodes/properties in the DT. It is an abuse of the
> >> >> > > devicetree standard, like the /chosen node but with less
> history. We
> >> >> > > should sacrifice efficiency, expedience and expandability on th=
e
> altar
> >> >> > > of 'devicetree is a hardware description'. How do we get over
> that
> >> >> > > one? Wel, I just think we need to accept that U-Boot uses
> devicetree
> >> >> > > for its own purposes, as well as for booting the OS. I am not
> saying
> >> >> > > it always has to have those properties, but with existing
> features
> >> >> > > like verified boot, SPL as well as complex firmware images wher=
e
> >> >> > > U-Boot needs to be able to find things in the image, it is
> essential.
> >> >> > > So let's just assume that we need this everywhere, since we
> certainly
> >> >> > > need it in at least some places.
> >> >> > >
> >> >> > > (stop reading here if you disagree, because nothing below will
> make
> >> >> > > any sense...you can still use U-Boot v2011.06 which doesn't hav=
e
> >> >> > > OF_CONTROL :-)
> >> >> >
> >> >> > Having U-Boot keep it's *internal* config state in DTs is fine.
> Adding
> >> >> > that to the DTs that are copied over from linux isn't imho.  Ther=
e
> are
> >> >> > various reasons for that.  First of all syncing device trees is a
> huge pain
> >> >> > and that's probably one of the main reasons our DTs are out of
> sync for a
> >> >> > large number of boards.
> >> >> > The point is this was fine in 2011 were we had SPL only,  but the
> reality
> >> >> > today is completely different.  There's previous stage boot
> loaders (and
> >> >> > enough cases were vendors prefer those over SPL).  If that
> bootloader needs
> >> >> > to use it's own device tree for whatever reason,  imposing
> restrictions on
> >> >> > it wrt to the device tree it has to include,  and require them to
> have
> >> >> > knowledge of U-Boot and it's internal config mechanism makes no
> sense not
> >> >> > to mention it doesn't scale at all.
> >> >>
> >> >> I think the solution here may be the binman image packer. It works
> >> >> from a description of the image (i.e. is data-driver) and can colle=
ct
> >> >> all the pieces together. The U-Boot properties (and the ones requir=
ed
> >> >> by TF-A, etc.) can be added at package time.
> >> >>
> >> >> If you think about it, it doesn't matter what properties are in the
> DT
> >> >> that is put into the firmware image. TF-A, for example, is presumab=
ly
> >> >> reading a devicetree from flash, so what does it care if it has som=
e
> >> >> U-Boot properties in it?
> >> >
> >> >
> >> > I am going to change my position in all mail threads I participate.
> >> > I was trying to make patches relevant in the future and conceptually
> clean. That may not be the most effective position: I should just care
> about Linaro and its members being able to implement SystemReady concepts=
.
> >> >
> >> >
> >> > If you mandate U-Boot has nodes in the device tree passed to the OS,
> we can put DT fragment in  the nt_fw_config section of the fip and merge =
it
> at boot time. So there is a solution compatible with SystemReady.
> >> >
> >> > If you want to put fake, non future proof, DT sources in the dts for
> platforms that are organized to provide the authoritative DT to U-Boot at
> runtime, that's kind of your choice (hopefully representing the rest of
> U-Boot community). There will be quirk code in U-Boot to redo the
> adaptations on its non authoritative DT that the platform previous stage
> firmware does (already saw one in the past month); as Mark said there wil=
l
> be issues over time; and it will confuse people about the role of the DT.
> But I am fine with it as it does not impair Linaro and its members abilit=
y
> to implement SystemReady way of handling DT.
> >>
> >> OK thank you. It doesn't sound like you are very on-board though.
> >> Also, you mischaracterise my intent with in-tree devicetrees.
> >>
> >> I would be happy enough for now if you could accept that U-Boot has
> >> nodes/properties of its own in the devicetree. It has been a feature
> >> of U-Boot for 10 years now.
> >
> > On SystemReady systems the DT passed to U-Boot for the OS will be
> assembled from the board DT and a U-Boot fragment/overlay. The board DT i=
s
> free from any software/firmware aspects, just contains hardware
> description. The U-Boot fragment/overlay can contain any nodes it wants.
> The location of the bindings specification is essentially irrelevant: it
> could be devicetree.org, U-Boot doc or Linux kernel. Both DTs will be
> stored in the FIP. OEMs making their firmware will just put whatever is
> needed in this =E2=80=9Cdynamic config=E2=80=9D DT. On SystemReady platfo=
rms U-Boot will
> always be given a DT, like on the RPI4. U-Boot will be able to ignore it
> obviously. That said, doing so, a platform may end-up failing compliance
> tests.
> > I think we need to document the above in U-Boot and refer to relevant
> specifications. I=E2=80=99ll let Ilias propose something.
>
> Hmm. So long as OF_BOARD is enabled, the devicetree will not be 'ignored'=
.
>
> Are you talking here about what TF-A will do? I assume so, since you
> mention FIP and I believe that is a TF-A invention.
>
Yes

>
> Of course the image is all packaged together in fact, so binman could
> presumably merge the DTs at build time, if desired.

Practically I don=E2=80=99t think so. The passed device tree will contain a=
ll
authoritative information such as discovered normal memory (excluded the
secure memory ranges), architectural nodes such as PSCI and other nodes
coming from TEE-OS or secure partitions such as SCMI interface or
firmwareTPM.
If you combine the two static parts at build time you will have to extract
the runtime pieces from the DT passed to U-Boot.

>
>
> Regards,
> Simon
>
> >> >>
> >> >>
> >> >> As to syncing, we have solved this using u-boot.dtsi files in U-Boo=
t,
> >> >> so I think this can be dealt with.
> >> >>
> >> >> >
> >> >> > >
> >> >> > > Step 2: Assume U-Boot has its own nodes/properties. How do they
> get
> >> >> > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> >> >> > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi
> file"), we
> >> >> > > have binman definitions, etc. So we need a way to overlay those
> things
> >> >> > > into the DT. We already support this for in-tree DTs, so IMO
> this is
> >> >> > > easy. Just require every board to have an in-tree DT. It helps
> with
> >> >> > > discoverability and documentation, anyway. That is this series.
> >> >> > >
> >> >> >
> >> >> > Again, the board might decide for it's own reason to provide it's
> own DT.
> >> >> > IMHO U-Boot must be able to cope with that and asking DTs to be
> included in
> >> >> > U-Boot source is not the right way to do that,  not to mention
> cases were
> >> >> > that's completely unrealistic (e.g QEMU or a board that reads the
> DTB from
> >> >> > it's flash).
> >> >>
> >> >> I think you are at step 2. See above for my response.
> >> >>
> >> >> >
> >> >> > > (I think most of us are at the beginning of step 2, unsure abou=
t
> it
> >> >> > > and worried about step 3)
> >> >> > >
> >> >> > > Step 3: Ah, but there are flows (i.e. boards that use a
> particular
> >> >> > > flow only, or boards that sometimes use a flow) which need the
> DT to
> >> >> > > come from a prior stage. How to handle that? IMO that is only
> going to
> >> >> > > grow as every man and his dog get into the write-a-bootloader
> >> >> > > business.
> >> >> >
> >> >> > And that's exactly why we have to come up with something that
> scales,  without
> >> >> > having to add a bunch of unusable DTs in U-Boot.
> >> >>
> >> >> In what way does this not scale? How are the DTs unusable? If there
> is
> >> >> a standard binding, we should be fine.
> >> >>
> >> >> >
> >> >> > > We need a way to provide the U-Boot nodes/properties in a
> >> >> > > form that the prior stage can consume and integrate with its
> build
> >> >> > > system. Is TF-A the only thing being discussed here? If so,
> let's just
> >> >> > > do it. We have the u-boot.dtsi and we can use binman to put the
> image
> >> >> > > together, for example. Or we can get clever and create some sor=
t
> of
> >> >> > > overlay dtb.
> >> >> > >
> >> >> > > Step 3a. But I don't want to do that. a) If U-Boot needs this
> stuff
> >> >> > > then it will need to build it in and use two devicetrees, one
> internal
> >> >> > > and one from the prior stage....well that is not very efficient
> and it
> >> >> > > is going to be confusing for people to figure out what U-Boot i=
s
> >> >> > > actually doing. But we actually already do that in a lot of cas=
es
> >> >> > > where U-Boot passes a DT to the kernel which is different to th=
e
> one
> >> >> > > it uses. So perhaps we have three devicetrees? OMG.
> >> >> >
> >> >> > No we don't. That's a moot point. If you separate the DTs U-Boot
> >> >> > provides the internal one and inherits one 'generic'.  Linux will
> be able to use
> >> >> > that.  So the only case were you'll need 3 DTs is if the *vendor*
> breaks the
> >> >> > DT across kernel versions,  In which case there's not much you ca=
n
> do to
> >> >> > begin with and that's already a case we have to deal with.
> >> >>
> >> >> Linux actually doesn't care if the U-Boot properties are in the tre=
e,
> >> >> so long as we have proper bindings. My point here is we only need
> >> >> either:
> >> >>
> >> >> a. one devicetree, shared with Linux and U-Boot (and TF-A?)
> >> >> b. two devicetrees, one for use in firmware and one for passing to
> Linux
> >> >>
> >> >> We don't need to separate out the U-Boot properties into a second (=
or
> >> >> third) devicetree. There just isn't any point.
> >> >>
> >> >> >
> >> >> > > b) Well then
> >> >> > > U-Boot can have its own small devicetree with its bits and then
> U-Boot
> >> >> > > can merge the two when it starts. Again that is not very
> efficient. It
> >> >> > > means that U-Boot cannot be controlled by the prior stage (e.g.
> to get
> >> >> > > its public key from there or to enable/disable the console), so
> >> >> > > unified firmware config is not possible. It will get very
> confusing,
> >> >> > > particularly for debugging U-Boot. c) Some other scheme to avoi=
d
> >> >> > > accepting step 3...please stop!
> >> >> > >
> >> >> > > Step 4: Yes, but there is QEMU, which makes the devicetree up
> out of
> >> >> > > whole cloth. What about that? Well, we are just going to have t=
o
> deal
> >> >> > > with that. We can easily merge in the U-Boot nodes/properties a=
nd
> >> >> > > update the U-Boot CI scripts to do this, as needed, e.g. with
> >> >> > > qemu-riscv64_spl. It's only one use case, although Xen might do
> >> >> > > something similar.
> >> >> > >
> >> >> > > To my mind, that deals with both the build-time and run-time
> issues.
> >> >> > > We have a discoverable DT in U-Boot, which should be considered
> the
> >> >> > > source of truth for most boards. We can sync it with Linux
> >> >> > > automatically with the tooling that I hope Rob Herring will com=
e
> up
> >> >> > > with. We can use an empty one where there really is no default,
> >> >> > > although I'd argue that is making perfect an enemy of the good.
> >> >> > >
> >> >> > > Step 5: If we get clever and want to remove them from the U-Boo=
t
> tree
> >> >> > > and pick them up from somewhere else, we can do that with
> sufficient
> >> >> > > tooling. Perhaps we should set a timeline for that? A year? Two=
?
> Six?
> >> >> >
> >> >> > We can start slowly migrating boards and see how that works out.
> >> >> > We could either use 2 device trees as you proposed, or have u-boo=
t
> merge
> >> >> > the 'u-boot' DTB and the inherited DTB before DM comes up.  OTOH
> I'd prefer
> >> >> > if linux gets handed a clean device tree without the u-boot
> internals in
> >> >> > it, so I think 2 discrete DTs is cleaner overall.
> >> >>
> >> >> I know you would prefer that, but does it really matter in practice=
?
> >> >> What is the objection, actually?
> >> >>
> >> >> As I mentioned on the call, I think the prior stage should do any
> >> >> merging or fixing up. Trying to do that sort of thing in 'early' co=
de
> >> >> in U-Boot (or any other program, including Linux) is such a pain.
> With
> >> >> U-Boot, for example, we don't even have any RAM available to do it
> >> >> with half the time and it would dramatically increase the amount of
> >> >> memory needed prior to relocation. It just isn't a very good idea t=
o
> >> >> try to do this in early code. It is also completely unnecessary, on=
ce
> >> >> you get past the philosophical objections.
> >> >>
> >> >> If TF-A wants to be in the picture, let it deal with the implicatio=
ns
> >> >> and responsibility thus incurred. TF-A has no right to tell U-Boot
> how
> >> >> to handle its config. TF-A is 0.5m LOC, i.e. a lot, almost a quarte=
r
> >> >> of the size of U-Boot. It duplicates loads of things in there. No o=
ne
> >> >> will even *notice* an FDT merge function, which is actually only 70
> >> >> LOC:
> >> >>
> >> >> /**
> >> >>  * overlay_apply_node - Merges a node into the base device tree
> >> >>  * @fdt: Base Device Tree blob
> >> >>  * @target: Node offset in the base device tree to apply the
> fragment to
> >> >>  * @fdto: Device tree overlay blob
> >> >>  * @node: Node offset in the overlay holding the changes to merge
> >> >>  *
> >> >>  * overlay_apply_node() merges a node into a target base device tre=
e
> >> >>  * node pointed.
> >> >>  *
> >> >>  * This is part of the final step in the device tree overlay
> >> >>  * application process, when all the phandles have been adjusted an=
d
> >> >>  * resolved and you just have to merge overlay into the base device
> >> >>  * tree.
> >> >>  *
> >> >>  * returns:
> >> >>  *      0 on success
> >> >>  *      Negative error code on failure
> >> >>  */
> >> >> static int overlay_apply_node(void *fdt, int target,
> >> >>                void *fdto, int node)
> >> >> {
> >> >>    int property;
> >> >>    int subnode;
> >> >>
> >> >>    fdt_for_each_property_offset(property, fdto, node) {
> >> >>       const char *name;
> >> >>       const void *prop;
> >> >>       int prop_len;
> >> >>       int ret;
> >> >>
> >> >>       prop =3D fdt_getprop_by_offset(fdto, property, &name,
> >> >>                     &prop_len);
> >> >>       if (prop_len =3D=3D -FDT_ERR_NOTFOUND)
> >> >>          return -FDT_ERR_INTERNAL;
> >> >>       if (prop_len < 0)
> >> >>          return prop_len;
> >> >>
> >> >>       ret =3D fdt_setprop(fdt, target, name, prop, prop_len);
> >> >>       if (ret)
> >> >>          return ret;
> >> >>    }
> >> >>
> >> >>    fdt_for_each_subnode(subnode, fdto, node) {
> >> >>       const char *name =3D fdt_get_name(fdto, subnode, NULL);
> >> >>       int nnode;
> >> >>       int ret;
> >> >>
> >> >>       nnode =3D fdt_add_subnode(fdt, target, name);
> >> >>       if (nnode =3D=3D -FDT_ERR_EXISTS) {
> >> >>          nnode =3D fdt_subnode_offset(fdt, target, name);
> >> >>          if (nnode =3D=3D -FDT_ERR_NOTFOUND)
> >> >>             return -FDT_ERR_INTERNAL;
> >> >>       }
> >> >>
> >> >>       if (nnode < 0)
> >> >>          return nnode;
> >> >>
> >> >>       ret =3D overlay_apply_node(fdt, nnode, fdto, subnode);
> >> >>       if (ret)
> >> >>          return ret;
> >> >>    }
> >> >>
> >> >>    return 0;
> >> >>
> >> >>
> >> >>
> >> >> }
> >> >>
> >> >>
> >> >> >
> >> >> > Regards
> >> >> > /Ilias
> >> >> > >
> >> >> > > To repeat, if we set things up correctly and agree on the
> bindings,
> >> >> > > devicetree can be the unifying configuration mechanism through
> the
> >> >> > > whole of firmware (except for very early bits) and into the OS.
> I feel
> >> >> > > this will set us up very well to deal with the complexity that =
is
> >> >> > > coming.
> >> >> > >
> >> >>
> >> >> Regards,
> >> >> Simon
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

--0000000000005e5fca05cf6c2a4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28 oct. 2021 =C3=A0 17:44, Simo=
n Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Fran=C3=A7ois,=
<br>
<br>
On Thu, 28 Oct 2021 at 08:50, Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:fran=
cois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; Hi Simon<br>
&gt;<br>
&gt; Le jeu. 28 oct. 2021 =C3=A0 16:30, Simon Glass &lt;<a href=3D"mailto:s=
jg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a =C3=A9crit :<=
br>
&gt;&gt;<br>
&gt;&gt; Hi Fran=C3=A7ois,<br>
&gt;&gt;<br>
&gt;&gt; On Thu, 28 Oct 2021 at 02:21, Fran=C3=A7ois Ozog &lt;<a href=3D"ma=
ilto:francois.ozog@linaro.org" target=3D"_blank">francois.ozog@linaro.org</=
a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi Simon,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Le jeu. 28 oct. 2021 =C3=A0 04:51, Simon Glass &lt;<a href=3D=
"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; a =C3=
=A9crit :<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Hi Ilias,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:ilias.apalodimas@linaro.org" target=
=3D"_blank">ilias.apalodimas@linaro.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Hi Simon,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; A bit late to the party, sorry!<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; (Did you remember the beer? I am replying to this but I d=
on&#39;t think it<br>
&gt;&gt; &gt;&gt; is all that helpful for me to reply to a lot of things on=
 this thread,<br>
&gt;&gt; &gt;&gt; since I would not be adding much to my cover letter and p=
atches)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; [...]<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; I really want to see what the binary case =
looks like since we could then<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; kill off rpi_{3,3_b,4}_defconfig and I wou=
ld need to see if we could<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; then also do a rpi_arm32_defconfig too.<br=
>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; I want to see less device trees in U-Boot =
sources, if they can come<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; functionally correct from the hardware/our=
 caller.<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; And I&#39;m not seeing how we make use of =
&quot;U-Boot /config&quot; if we also don&#39;t<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; use the device tree from build time at run=
 time, ignoring the device<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; tree provided to us at run time by the cal=
ler.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Firstly I should say that I find building firmw=
are very messy and<br>
&gt;&gt; &gt;&gt; &gt; &gt; confusing these days. Lots of things to build a=
nd it&#39;s hard to find<br>
&gt;&gt; &gt;&gt; &gt; &gt; the instructions. It doesn&#39;t have to be tha=
t way, but if we carry on<br>
&gt;&gt; &gt;&gt; &gt; &gt; as we are, it will continue to be messy and in =
five years you will<br>
&gt;&gt; &gt;&gt; &gt; &gt; need a Ph.D and a lucky charm to boot on any mo=
dern board. My<br>
&gt;&gt; &gt;&gt; &gt; &gt; objective here is to simplify things, bringing =
some consistency to the<br>
&gt;&gt; &gt;&gt; &gt; &gt; different components. Binman was one effort the=
re. I feel that putting<br>
&gt;&gt; &gt;&gt; &gt; &gt; at least the U-Boot house in order, in my role =
as devicetree<br>
&gt;&gt; &gt;&gt; &gt; &gt; maintainer (and as author of devicetree support=
 in U-Boot back in<br>
&gt;&gt; &gt;&gt; &gt; &gt; 2011), is the next step.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; If we set things up correctly and agree on the =
bindings, devicetree<br>
&gt;&gt; &gt;&gt; &gt; &gt; can be the unifying configuration mechanism thr=
ough the whole of<br>
&gt;&gt; &gt;&gt; &gt; &gt; firmware (except for very early bits) and into =
the OS, this will set<br>
&gt;&gt; &gt;&gt; &gt; &gt; us up very well to deal with the complexity tha=
t is coming.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Anyway, here are the mental steps that I&#39;ve=
 gone through over the past<br>
&gt;&gt; &gt;&gt; &gt; &gt; two months:<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Step 1: At present, some people think U-Boot is=
 not even allowed to<br>
&gt;&gt; &gt;&gt; &gt; &gt; have its own nodes/properties in the DT. It is =
an abuse of the<br>
&gt;&gt; &gt;&gt; &gt; &gt; devicetree standard, like the /chosen node but =
with less history. We<br>
&gt;&gt; &gt;&gt; &gt; &gt; should sacrifice efficiency, expedience and exp=
andability on the altar<br>
&gt;&gt; &gt;&gt; &gt; &gt; of &#39;devicetree is a hardware description&#3=
9;. How do we get over that<br>
&gt;&gt; &gt;&gt; &gt; &gt; one? Wel, I just think we need to accept that U=
-Boot uses devicetree<br>
&gt;&gt; &gt;&gt; &gt; &gt; for its own purposes, as well as for booting th=
e OS. I am not saying<br>
&gt;&gt; &gt;&gt; &gt; &gt; it always has to have those properties, but wit=
h existing features<br>
&gt;&gt; &gt;&gt; &gt; &gt; like verified boot, SPL as well as complex firm=
ware images where<br>
&gt;&gt; &gt;&gt; &gt; &gt; U-Boot needs to be able to find things in the i=
mage, it is essential.<br>
&gt;&gt; &gt;&gt; &gt; &gt; So let&#39;s just assume that we need this ever=
ywhere, since we certainly<br>
&gt;&gt; &gt;&gt; &gt; &gt; need it in at least some places.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; (stop reading here if you disagree, because not=
hing below will make<br>
&gt;&gt; &gt;&gt; &gt; &gt; any sense...you can still use U-Boot v2011.06 w=
hich doesn&#39;t have<br>
&gt;&gt; &gt;&gt; &gt; &gt; OF_CONTROL :-)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Having U-Boot keep it&#39;s *internal* config state =
in DTs is fine.=C2=A0 Adding<br>
&gt;&gt; &gt;&gt; &gt; that to the DTs that are copied over from linux isn&=
#39;t imho.=C2=A0 There are<br>
&gt;&gt; &gt;&gt; &gt; various reasons for that.=C2=A0 First of all syncing=
 device trees is a huge pain<br>
&gt;&gt; &gt;&gt; &gt; and that&#39;s probably one of the main reasons our =
DTs are out of sync for a<br>
&gt;&gt; &gt;&gt; &gt; large number of boards.<br>
&gt;&gt; &gt;&gt; &gt; The point is this was fine in 2011 were we had SPL o=
nly,=C2=A0 but the reality<br>
&gt;&gt; &gt;&gt; &gt; today is completely different.=C2=A0 There&#39;s pre=
vious stage boot loaders (and<br>
&gt;&gt; &gt;&gt; &gt; enough cases were vendors prefer those over SPL).=C2=
=A0 If that bootloader needs<br>
&gt;&gt; &gt;&gt; &gt; to use it&#39;s own device tree for whatever reason,=
=C2=A0 imposing restrictions on<br>
&gt;&gt; &gt;&gt; &gt; it wrt to the device tree it has to include,=C2=A0 a=
nd require them to have<br>
&gt;&gt; &gt;&gt; &gt; knowledge of U-Boot and it&#39;s internal config mec=
hanism makes no sense not<br>
&gt;&gt; &gt;&gt; &gt; to mention it doesn&#39;t scale at all.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I think the solution here may be the binman image packer.=
 It works<br>
&gt;&gt; &gt;&gt; from a description of the image (i.e. is data-driver) and=
 can collect<br>
&gt;&gt; &gt;&gt; all the pieces together. The U-Boot properties (and the o=
nes required<br>
&gt;&gt; &gt;&gt; by TF-A, etc.) can be added at package time.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; If you think about it, it doesn&#39;t matter what propert=
ies are in the DT<br>
&gt;&gt; &gt;&gt; that is put into the firmware image. TF-A, for example, i=
s presumably<br>
&gt;&gt; &gt;&gt; reading a devicetree from flash, so what does it care if =
it has some<br>
&gt;&gt; &gt;&gt; U-Boot properties in it?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am going to change my position in all mail threads I partic=
ipate.<br>
&gt;&gt; &gt; I was trying to make patches relevant in the future and conce=
ptually clean. That may not be the most effective position: I should just c=
are about Linaro and its members being able to implement SystemReady concep=
ts.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If you mandate U-Boot has nodes in the device tree passed to =
the OS, we can put DT fragment in=C2=A0 the nt_fw_config section of the fip=
 and merge it at boot time. So there is a solution compatible with SystemRe=
ady.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; If you want to put fake, non future proof, DT sources in the =
dts for platforms that are organized to provide the authoritative DT to U-B=
oot at runtime, that&#39;s kind of your choice (hopefully representing the =
rest of U-Boot community). There will be quirk code in U-Boot to redo the a=
daptations on its non authoritative DT that the platform previous stage fir=
mware does (already saw one in the past month); as Mark said there will be =
issues over time; and it will confuse people about the role of the DT. But =
I am fine with it as it does not impair Linaro and its members ability to i=
mplement SystemReady way of handling DT.<br>
&gt;&gt;<br>
&gt;&gt; OK thank you. It doesn&#39;t sound like you are very on-board thou=
gh.<br>
&gt;&gt; Also, you mischaracterise my intent with in-tree devicetrees.<br>
&gt;&gt;<br>
&gt;&gt; I would be happy enough for now if you could accept that U-Boot ha=
s<br>
&gt;&gt; nodes/properties of its own in the devicetree. It has been a featu=
re<br>
&gt;&gt; of U-Boot for 10 years now.<br>
&gt;<br>
&gt; On SystemReady systems the DT passed to U-Boot for the OS will be asse=
mbled from the board DT and a U-Boot fragment/overlay. The board DT is free=
 from any software/firmware aspects, just contains hardware description. Th=
e U-Boot fragment/overlay can contain any nodes it wants. The location of t=
he bindings specification is essentially irrelevant: it could be <a href=3D=
"http://devicetree.org" rel=3D"noreferrer" target=3D"_blank">devicetree.org=
</a>, U-Boot doc or Linux kernel. Both DTs will be stored in the FIP. OEMs =
making their firmware will just put whatever is needed in this =E2=80=9Cdyn=
amic config=E2=80=9D DT. On SystemReady platforms U-Boot will always be giv=
en a DT, like on the RPI4. U-Boot will be able to ignore it obviously. That=
 said, doing so, a platform may end-up failing compliance tests.<br>
&gt; I think we need to document the above in U-Boot and refer to relevant =
specifications. I=E2=80=99ll let Ilias propose something.<br>
<br>
Hmm. So long as OF_BOARD is enabled, the devicetree will not be &#39;ignore=
d&#39;.<br>
<br>
Are you talking here about what TF-A will do? I assume so, since you<br>
mention FIP and I believe that is a TF-A invention.<br>
</blockquote><div dir=3D"auto">Yes</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Of course the image is all packaged together in fact, so binman could<br>
presumably merge the DTs at build time, if desired.</blockquote><div dir=3D=
"auto">Practically I don=E2=80=99t think so. The passed device tree will co=
ntain all authoritative information such as discovered normal memory (exclu=
ded the secure memory ranges), architectural nodes such as PSCI and other n=
odes coming from TEE-OS or secure partitions such as SCMI interface or firm=
wareTPM.</div><div dir=3D"auto">If you combine the two static parts at buil=
d time you will have to extract the runtime pieces from the DT passed to U-=
Boot.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Regards,<br>
Simon<br>
<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; As to syncing, we have solved this using u-boot.dtsi file=
s in U-Boot,<br>
&gt;&gt; &gt;&gt; so I think this can be dealt with.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Step 2: Assume U-Boot has its own nodes/propert=
ies. How do they get<br>
&gt;&gt; &gt;&gt; &gt; &gt; there? Well, we have u-boot.dtsi files for that=
 (the 2016 patch<br>
&gt;&gt; &gt;&gt; &gt; &gt; &quot;6d427c6b1fa binman: Automatically include=
 a U-Boot .dtsi file&quot;), we<br>
&gt;&gt; &gt;&gt; &gt; &gt; have binman definitions, etc. So we need a way =
to overlay those things<br>
&gt;&gt; &gt;&gt; &gt; &gt; into the DT. We already support this for in-tre=
e DTs, so IMO this is<br>
&gt;&gt; &gt;&gt; &gt; &gt; easy. Just require every board to have an in-tr=
ee DT. It helps with<br>
&gt;&gt; &gt;&gt; &gt; &gt; discoverability and documentation, anyway. That=
 is this series.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Again, the board might decide for it&#39;s own reaso=
n to provide it&#39;s own DT.<br>
&gt;&gt; &gt;&gt; &gt; IMHO U-Boot must be able to cope with that and askin=
g DTs to be included in<br>
&gt;&gt; &gt;&gt; &gt; U-Boot source is not the right way to do that,=C2=A0=
 not to mention cases were<br>
&gt;&gt; &gt;&gt; &gt; that&#39;s completely unrealistic (e.g QEMU or a boa=
rd that reads the DTB from<br>
&gt;&gt; &gt;&gt; &gt; it&#39;s flash).<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I think you are at step 2. See above for my response.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; (I think most of us are at the beginning of ste=
p 2, unsure about it<br>
&gt;&gt; &gt;&gt; &gt; &gt; and worried about step 3)<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Step 3: Ah, but there are flows (i.e. boards th=
at use a particular<br>
&gt;&gt; &gt;&gt; &gt; &gt; flow only, or boards that sometimes use a flow)=
 which need the DT to<br>
&gt;&gt; &gt;&gt; &gt; &gt; come from a prior stage. How to handle that? IM=
O that is only going to<br>
&gt;&gt; &gt;&gt; &gt; &gt; grow as every man and his dog get into the writ=
e-a-bootloader<br>
&gt;&gt; &gt;&gt; &gt; &gt; business.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; And that&#39;s exactly why we have to come up with s=
omething that scales,=C2=A0 without<br>
&gt;&gt; &gt;&gt; &gt; having to add a bunch of unusable DTs in U-Boot.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; In what way does this not scale? How are the DTs unusable=
? If there is<br>
&gt;&gt; &gt;&gt; a standard binding, we should be fine.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; We need a way to provide the U-Boot nodes/prope=
rties in a<br>
&gt;&gt; &gt;&gt; &gt; &gt; form that the prior stage can consume and integ=
rate with its build<br>
&gt;&gt; &gt;&gt; &gt; &gt; system. Is TF-A the only thing being discussed =
here? If so, let&#39;s just<br>
&gt;&gt; &gt;&gt; &gt; &gt; do it. We have the u-boot.dtsi and we can use b=
inman to put the image<br>
&gt;&gt; &gt;&gt; &gt; &gt; together, for example. Or we can get clever and=
 create some sort of<br>
&gt;&gt; &gt;&gt; &gt; &gt; overlay dtb.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Step 3a. But I don&#39;t want to do that. a) If=
 U-Boot needs this stuff<br>
&gt;&gt; &gt;&gt; &gt; &gt; then it will need to build it in and use two de=
vicetrees, one internal<br>
&gt;&gt; &gt;&gt; &gt; &gt; and one from the prior stage....well that is no=
t very efficient and it<br>
&gt;&gt; &gt;&gt; &gt; &gt; is going to be confusing for people to figure o=
ut what U-Boot is<br>
&gt;&gt; &gt;&gt; &gt; &gt; actually doing. But we actually already do that=
 in a lot of cases<br>
&gt;&gt; &gt;&gt; &gt; &gt; where U-Boot passes a DT to the kernel which is=
 different to the one<br>
&gt;&gt; &gt;&gt; &gt; &gt; it uses. So perhaps we have three devicetrees? =
OMG.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; No we don&#39;t. That&#39;s a moot point. If you sep=
arate the DTs U-Boot<br>
&gt;&gt; &gt;&gt; &gt; provides the internal one and inherits one &#39;gene=
ric&#39;.=C2=A0 Linux will be able to use<br>
&gt;&gt; &gt;&gt; &gt; that.=C2=A0 So the only case were you&#39;ll need 3 =
DTs is if the *vendor* breaks the<br>
&gt;&gt; &gt;&gt; &gt; DT across kernel versions,=C2=A0 In which case there=
&#39;s not much you can do to<br>
&gt;&gt; &gt;&gt; &gt; begin with and that&#39;s already a case we have to =
deal with.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Linux actually doesn&#39;t care if the U-Boot properties =
are in the tree,<br>
&gt;&gt; &gt;&gt; so long as we have proper bindings. My point here is we o=
nly need<br>
&gt;&gt; &gt;&gt; either:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; a. one devicetree, shared with Linux and U-Boot (and TF-A=
?)<br>
&gt;&gt; &gt;&gt; b. two devicetrees, one for use in firmware and one for p=
assing to Linux<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; We don&#39;t need to separate out the U-Boot properties i=
nto a second (or<br>
&gt;&gt; &gt;&gt; third) devicetree. There just isn&#39;t any point.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; b) Well then<br>
&gt;&gt; &gt;&gt; &gt; &gt; U-Boot can have its own small devicetree with i=
ts bits and then U-Boot<br>
&gt;&gt; &gt;&gt; &gt; &gt; can merge the two when it starts. Again that is=
 not very efficient. It<br>
&gt;&gt; &gt;&gt; &gt; &gt; means that U-Boot cannot be controlled by the p=
rior stage (e.g. to get<br>
&gt;&gt; &gt;&gt; &gt; &gt; its public key from there or to enable/disable =
the console), so<br>
&gt;&gt; &gt;&gt; &gt; &gt; unified firmware config is not possible. It wil=
l get very confusing,<br>
&gt;&gt; &gt;&gt; &gt; &gt; particularly for debugging U-Boot. c) Some othe=
r scheme to avoid<br>
&gt;&gt; &gt;&gt; &gt; &gt; accepting step 3...please stop!<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Step 4: Yes, but there is QEMU, which makes the=
 devicetree up out of<br>
&gt;&gt; &gt;&gt; &gt; &gt; whole cloth. What about that? Well, we are just=
 going to have to deal<br>
&gt;&gt; &gt;&gt; &gt; &gt; with that. We can easily merge in the U-Boot no=
des/properties and<br>
&gt;&gt; &gt;&gt; &gt; &gt; update the U-Boot CI scripts to do this, as nee=
ded, e.g. with<br>
&gt;&gt; &gt;&gt; &gt; &gt; qemu-riscv64_spl. It&#39;s only one use case, a=
lthough Xen might do<br>
&gt;&gt; &gt;&gt; &gt; &gt; something similar.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; To my mind, that deals with both the build-time=
 and run-time issues.<br>
&gt;&gt; &gt;&gt; &gt; &gt; We have a discoverable DT in U-Boot, which shou=
ld be considered the<br>
&gt;&gt; &gt;&gt; &gt; &gt; source of truth for most boards. We can sync it=
 with Linux<br>
&gt;&gt; &gt;&gt; &gt; &gt; automatically with the tooling that I hope Rob =
Herring will come up<br>
&gt;&gt; &gt;&gt; &gt; &gt; with. We can use an empty one where there reall=
y is no default,<br>
&gt;&gt; &gt;&gt; &gt; &gt; although I&#39;d argue that is making perfect a=
n enemy of the good.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; Step 5: If we get clever and want to remove the=
m from the U-Boot tree<br>
&gt;&gt; &gt;&gt; &gt; &gt; and pick them up from somewhere else, we can do=
 that with sufficient<br>
&gt;&gt; &gt;&gt; &gt; &gt; tooling. Perhaps we should set a timeline for t=
hat? A year? Two? Six?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; We can start slowly migrating boards and see how tha=
t works out.<br>
&gt;&gt; &gt;&gt; &gt; We could either use 2 device trees as you proposed, =
or have u-boot merge<br>
&gt;&gt; &gt;&gt; &gt; the &#39;u-boot&#39; DTB and the inherited DTB befor=
e DM comes up.=C2=A0 OTOH I&#39;d prefer<br>
&gt;&gt; &gt;&gt; &gt; if linux gets handed a clean device tree without the=
 u-boot internals in<br>
&gt;&gt; &gt;&gt; &gt; it, so I think 2 discrete DTs is cleaner overall.<br=
>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I know you would prefer that, but does it really matter i=
n practice?<br>
&gt;&gt; &gt;&gt; What is the objection, actually?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; As I mentioned on the call, I think the prior stage shoul=
d do any<br>
&gt;&gt; &gt;&gt; merging or fixing up. Trying to do that sort of thing in =
&#39;early&#39; code<br>
&gt;&gt; &gt;&gt; in U-Boot (or any other program, including Linux) is such=
 a pain. With<br>
&gt;&gt; &gt;&gt; U-Boot, for example, we don&#39;t even have any RAM avail=
able to do it<br>
&gt;&gt; &gt;&gt; with half the time and it would dramatically increase the=
 amount of<br>
&gt;&gt; &gt;&gt; memory needed prior to relocation. It just isn&#39;t a ve=
ry good idea to<br>
&gt;&gt; &gt;&gt; try to do this in early code. It is also completely unnec=
essary, once<br>
&gt;&gt; &gt;&gt; you get past the philosophical objections.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; If TF-A wants to be in the picture, let it deal with the =
implications<br>
&gt;&gt; &gt;&gt; and responsibility thus incurred. TF-A has no right to te=
ll U-Boot how<br>
&gt;&gt; &gt;&gt; to handle its config. TF-A is 0.5m LOC, i.e. a lot, almos=
t a quarter<br>
&gt;&gt; &gt;&gt; of the size of U-Boot. It duplicates loads of things in t=
here. No one<br>
&gt;&gt; &gt;&gt; will even *notice* an FDT merge function, which is actual=
ly only 70<br>
&gt;&gt; &gt;&gt; LOC:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; /**<br>
&gt;&gt; &gt;&gt;=C2=A0 * overlay_apply_node - Merges a node into the base =
device tree<br>
&gt;&gt; &gt;&gt;=C2=A0 * @fdt: Base Device Tree blob<br>
&gt;&gt; &gt;&gt;=C2=A0 * @target: Node offset in the base device tree to a=
pply the fragment to<br>
&gt;&gt; &gt;&gt;=C2=A0 * @fdto: Device tree overlay blob<br>
&gt;&gt; &gt;&gt;=C2=A0 * @node: Node offset in the overlay holding the cha=
nges to merge<br>
&gt;&gt; &gt;&gt;=C2=A0 *<br>
&gt;&gt; &gt;&gt;=C2=A0 * overlay_apply_node() merges a node into a target =
base device tree<br>
&gt;&gt; &gt;&gt;=C2=A0 * node pointed.<br>
&gt;&gt; &gt;&gt;=C2=A0 *<br>
&gt;&gt; &gt;&gt;=C2=A0 * This is part of the final step in the device tree=
 overlay<br>
&gt;&gt; &gt;&gt;=C2=A0 * application process, when all the phandles have b=
een adjusted and<br>
&gt;&gt; &gt;&gt;=C2=A0 * resolved and you just have to merge overlay into =
the base device<br>
&gt;&gt; &gt;&gt;=C2=A0 * tree.<br>
&gt;&gt; &gt;&gt;=C2=A0 *<br>
&gt;&gt; &gt;&gt;=C2=A0 * returns:<br>
&gt;&gt; &gt;&gt;=C2=A0 *=C2=A0 =C2=A0 =C2=A0 0 on success<br>
&gt;&gt; &gt;&gt;=C2=A0 *=C2=A0 =C2=A0 =C2=A0 Negative error code on failur=
e<br>
&gt;&gt; &gt;&gt;=C2=A0 */<br>
&gt;&gt; &gt;&gt; static int overlay_apply_node(void *fdt, int target,<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vo=
id *fdto, int node)<br>
&gt;&gt; &gt;&gt; {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 int property;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 int subnode;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 fdt_for_each_property_offset(property, fdto,=
 node) {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const void *prop;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int prop_len;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D fdt_getprop_by_offset(=
fdto, property, &amp;name,<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&amp;prop_len);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (prop_len =3D=3D -FDT_ERR_NO=
TFOUND)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -FDT_ERR_INTERNA=
L;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (prop_len &lt; 0)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return prop_len;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D fdt_setprop(fdt, target=
, name, prop, prop_len);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 fdt_for_each_subnode(subnode, fdto, node) {<=
br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *name =3D fdt_get_na=
me(fdto, subnode, NULL);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int nnode;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nnode =3D fdt_add_subnode(fdt, =
target, name);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nnode =3D=3D -FDT_ERR_EXIST=
S) {<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nnode =3D fdt_subnode_o=
ffset(fdt, target, name);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nnode =3D=3D -FDT_E=
RR_NOTFOUND)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -FD=
T_ERR_INTERNAL;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nnode &lt; 0)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nnode;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D overlay_apply_node(fdt,=
 nnode, fdto, subnode);<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; }<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Regards<br>
&gt;&gt; &gt;&gt; &gt; /Ilias<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; To repeat, if we set things up correctly and ag=
ree on the bindings,<br>
&gt;&gt; &gt;&gt; &gt; &gt; devicetree can be the unifying configuration me=
chanism through the<br>
&gt;&gt; &gt;&gt; &gt; &gt; whole of firmware (except for very early bits) =
and into the OS. I feel<br>
&gt;&gt; &gt;&gt; &gt; &gt; this will set us up very well to deal with the =
complexity that is<br>
&gt;&gt; &gt;&gt; &gt; &gt; coming.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Regards,<br>
&gt;&gt; &gt;&gt; Simon<br>
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

--0000000000005e5fca05cf6c2a4a--

