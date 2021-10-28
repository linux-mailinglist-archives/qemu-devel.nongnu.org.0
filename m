Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB1F43E576
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:49:57 +0200 (CEST)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7fA-0007zC-E5
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mg7aK-0004Ds-EV
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:44:56 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:42778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mg7aH-0002Av-Q0
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:44:56 -0400
Received: by mail-vk1-xa33.google.com with SMTP id b125so2388410vkb.9
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W5eS3DQvYWrOOHkMo3yTy/ajbi1P0ERc2zloX/481hU=;
 b=KP2LwqqEYMxb+hwmyDL498h419qiKySCIJzGABf69Go76oegAC4EYDD8UJ+YpO434e
 xWI4U7/c29x0suTh+iUDeLO1sZHGW3lwvTuDepgMy+UenTnhJiE8Z9tlKSqROQ9uWh34
 TPSwnkwSgelPglhfSTpR5Y+0sJA4BfWkV1bxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W5eS3DQvYWrOOHkMo3yTy/ajbi1P0ERc2zloX/481hU=;
 b=Buj6XXkOLADejPKTIUnXsnFmsSt8N4WGMPa1M2TCR6l6fP077G8aAujRVempfmUBgE
 Dow3pxlCxnFJrH8BFWTk/91ZGw7ZrGJXlzTyGxY0acvkRHmF7kv88gkOnl1JfMmCFxD3
 X6fa60Fb4L1Wdd4QZnWIcmGV37B0hPGIPT5YCuJQTS7HWnaeUKok/YYWpqcyjH8+nhDq
 IvE9bfbHOIVHeqKyKPHMWRWjfXapLVrP9loHkNhryFq3O0RmaF/htx1G3VnVkK/vRtmP
 dko4vbHpCYHtBndqlhpIoU3BfULrp++No/2A5w49/SlXllKpSqAGTSgJBZ7g8mantvEp
 Xm+Q==
X-Gm-Message-State: AOAM532EMyZSRU0w965i3DuzX1vhOqD88AT9N6rau44Dfuhm3UqHXUvx
 NhR0R5ZXHfIr6gjlb8fYtFPROKs/ihOaPSoUPqrxvw==
X-Google-Smtp-Source: ABdhPJxLF0tDxrf3VNelDGNT8W+Wq/iqLOmqme0G8a6WoPRRyYrbFgZZo0hkQva8fxcJG9mQZagSJHbOVpefyAf8Lmw=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr5364887vky.26.1635435891501;
 Thu, 28 Oct 2021 08:44:51 -0700 (PDT)
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
In-Reply-To: <CAHFG_=XgiqEZch2p+ZdBuGUfW9L6_+06kpakbvKcNsk7Gn6SOw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 28 Oct 2021 09:44:39 -0600
Message-ID: <CAPnjgZ0GufveoMWB5d7hhPxjr69_vZ1oBS6mCHHwU5t6Tzo+VQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=sjg@google.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

Hi Fran=C3=A7ois,

On Thu, 28 Oct 2021 at 08:50, Fran=C3=A7ois Ozog <francois.ozog@linaro.org>=
 wrote:
>
> Hi Simon
>
> Le jeu. 28 oct. 2021 =C3=A0 16:30, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
>>
>> Hi Fran=C3=A7ois,
>>
>> On Thu, 28 Oct 2021 at 02:21, Fran=C3=A7ois Ozog <francois.ozog@linaro.o=
rg> wrote:
>> >
>> > Hi Simon,
>> >
>> > Le jeu. 28 oct. 2021 =C3=A0 04:51, Simon Glass <sjg@chromium.org> a =
=C3=A9crit :
>> >>
>> >> Hi Ilias,
>> >>
>> >> On Tue, 26 Oct 2021 at 00:46, Ilias Apalodimas
>> >> <ilias.apalodimas@linaro.org> wrote:
>> >> >
>> >> > Hi Simon,
>> >> >
>> >> > A bit late to the party, sorry!
>> >>
>> >> (Did you remember the beer? I am replying to this but I don't think i=
t
>> >> is all that helpful for me to reply to a lot of things on this thread=
,
>> >> since I would not be adding much to my cover letter and patches)
>> >>
>> >> >
>> >> > [...]
>> >> >
>> >> > > >
>> >> > > > I really want to see what the binary case looks like since we c=
ould then
>> >> > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we =
could
>> >> > > > then also do a rpi_arm32_defconfig too.
>> >> > > >
>> >> > > > I want to see less device trees in U-Boot sources, if they can =
come
>> >> > > > functionally correct from the hardware/our caller.
>> >> > > >
>> >> > > > And I'm not seeing how we make use of "U-Boot /config" if we al=
so don't
>> >> > > > use the device tree from build time at run time, ignoring the d=
evice
>> >> > > > tree provided to us at run time by the caller.
>> >> > >
>> >> > > Firstly I should say that I find building firmware very messy and
>> >> > > confusing these days. Lots of things to build and it's hard to fi=
nd
>> >> > > the instructions. It doesn't have to be that way, but if we carry=
 on
>> >> > > as we are, it will continue to be messy and in five years you wil=
l
>> >> > > need a Ph.D and a lucky charm to boot on any modern board. My
>> >> > > objective here is to simplify things, bringing some consistency t=
o the
>> >> > > different components. Binman was one effort there. I feel that pu=
tting
>> >> > > at least the U-Boot house in order, in my role as devicetree
>> >> > > maintainer (and as author of devicetree support in U-Boot back in
>> >> > > 2011), is the next step.
>> >> > >
>> >> > > If we set things up correctly and agree on the bindings, devicetr=
ee
>> >> > > can be the unifying configuration mechanism through the whole of
>> >> > > firmware (except for very early bits) and into the OS, this will =
set
>> >> > > us up very well to deal with the complexity that is coming.
>> >> > >
>> >> > > Anyway, here are the mental steps that I've gone through over the=
 past
>> >> > > two months:
>> >> > >
>> >> > > Step 1: At present, some people think U-Boot is not even allowed =
to
>> >> > > have its own nodes/properties in the DT. It is an abuse of the
>> >> > > devicetree standard, like the /chosen node but with less history.=
 We
>> >> > > should sacrifice efficiency, expedience and expandability on the =
altar
>> >> > > of 'devicetree is a hardware description'. How do we get over tha=
t
>> >> > > one? Wel, I just think we need to accept that U-Boot uses devicet=
ree
>> >> > > for its own purposes, as well as for booting the OS. I am not say=
ing
>> >> > > it always has to have those properties, but with existing feature=
s
>> >> > > like verified boot, SPL as well as complex firmware images where
>> >> > > U-Boot needs to be able to find things in the image, it is essent=
ial.
>> >> > > So let's just assume that we need this everywhere, since we certa=
inly
>> >> > > need it in at least some places.
>> >> > >
>> >> > > (stop reading here if you disagree, because nothing below will ma=
ke
>> >> > > any sense...you can still use U-Boot v2011.06 which doesn't have
>> >> > > OF_CONTROL :-)
>> >> >
>> >> > Having U-Boot keep it's *internal* config state in DTs is fine.  Ad=
ding
>> >> > that to the DTs that are copied over from linux isn't imho.  There =
are
>> >> > various reasons for that.  First of all syncing device trees is a h=
uge pain
>> >> > and that's probably one of the main reasons our DTs are out of sync=
 for a
>> >> > large number of boards.
>> >> > The point is this was fine in 2011 were we had SPL only,  but the r=
eality
>> >> > today is completely different.  There's previous stage boot loaders=
 (and
>> >> > enough cases were vendors prefer those over SPL).  If that bootload=
er needs
>> >> > to use it's own device tree for whatever reason,  imposing restrict=
ions on
>> >> > it wrt to the device tree it has to include,  and require them to h=
ave
>> >> > knowledge of U-Boot and it's internal config mechanism makes no sen=
se not
>> >> > to mention it doesn't scale at all.
>> >>
>> >> I think the solution here may be the binman image packer. It works
>> >> from a description of the image (i.e. is data-driver) and can collect
>> >> all the pieces together. The U-Boot properties (and the ones required
>> >> by TF-A, etc.) can be added at package time.
>> >>
>> >> If you think about it, it doesn't matter what properties are in the D=
T
>> >> that is put into the firmware image. TF-A, for example, is presumably
>> >> reading a devicetree from flash, so what does it care if it has some
>> >> U-Boot properties in it?
>> >
>> >
>> > I am going to change my position in all mail threads I participate.
>> > I was trying to make patches relevant in the future and conceptually c=
lean. That may not be the most effective position: I should just care about=
 Linaro and its members being able to implement SystemReady concepts.
>> >
>> >
>> > If you mandate U-Boot has nodes in the device tree passed to the OS, w=
e can put DT fragment in  the nt_fw_config section of the fip and merge it =
at boot time. So there is a solution compatible with SystemReady.
>> >
>> > If you want to put fake, non future proof, DT sources in the dts for p=
latforms that are organized to provide the authoritative DT to U-Boot at ru=
ntime, that's kind of your choice (hopefully representing the rest of U-Boo=
t community). There will be quirk code in U-Boot to redo the adaptations on=
 its non authoritative DT that the platform previous stage firmware does (a=
lready saw one in the past month); as Mark said there will be issues over t=
ime; and it will confuse people about the role of the DT. But I am fine wit=
h it as it does not impair Linaro and its members ability to implement Syst=
emReady way of handling DT.
>>
>> OK thank you. It doesn't sound like you are very on-board though.
>> Also, you mischaracterise my intent with in-tree devicetrees.
>>
>> I would be happy enough for now if you could accept that U-Boot has
>> nodes/properties of its own in the devicetree. It has been a feature
>> of U-Boot for 10 years now.
>
> On SystemReady systems the DT passed to U-Boot for the OS will be assembl=
ed from the board DT and a U-Boot fragment/overlay. The board DT is free fr=
om any software/firmware aspects, just contains hardware description. The U=
-Boot fragment/overlay can contain any nodes it wants. The location of the =
bindings specification is essentially irrelevant: it could be devicetree.or=
g, U-Boot doc or Linux kernel. Both DTs will be stored in the FIP. OEMs mak=
ing their firmware will just put whatever is needed in this =E2=80=9Cdynami=
c config=E2=80=9D DT. On SystemReady platforms U-Boot will always be given =
a DT, like on the RPI4. U-Boot will be able to ignore it obviously. That sa=
id, doing so, a platform may end-up failing compliance tests.
> I think we need to document the above in U-Boot and refer to relevant spe=
cifications. I=E2=80=99ll let Ilias propose something.

Hmm. So long as OF_BOARD is enabled, the devicetree will not be 'ignored'.

Are you talking here about what TF-A will do? I assume so, since you
mention FIP and I believe that is a TF-A invention.

Of course the image is all packaged together in fact, so binman could
presumably merge the DTs at build time, if desired.

Regards,
Simon

>> >>
>> >>
>> >> As to syncing, we have solved this using u-boot.dtsi files in U-Boot,
>> >> so I think this can be dealt with.
>> >>
>> >> >
>> >> > >
>> >> > > Step 2: Assume U-Boot has its own nodes/properties. How do they g=
et
>> >> > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
>> >> > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"),=
 we
>> >> > > have binman definitions, etc. So we need a way to overlay those t=
hings
>> >> > > into the DT. We already support this for in-tree DTs, so IMO this=
 is
>> >> > > easy. Just require every board to have an in-tree DT. It helps wi=
th
>> >> > > discoverability and documentation, anyway. That is this series.
>> >> > >
>> >> >
>> >> > Again, the board might decide for it's own reason to provide it's o=
wn DT.
>> >> > IMHO U-Boot must be able to cope with that and asking DTs to be inc=
luded in
>> >> > U-Boot source is not the right way to do that,  not to mention case=
s were
>> >> > that's completely unrealistic (e.g QEMU or a board that reads the D=
TB from
>> >> > it's flash).
>> >>
>> >> I think you are at step 2. See above for my response.
>> >>
>> >> >
>> >> > > (I think most of us are at the beginning of step 2, unsure about =
it
>> >> > > and worried about step 3)
>> >> > >
>> >> > > Step 3: Ah, but there are flows (i.e. boards that use a particula=
r
>> >> > > flow only, or boards that sometimes use a flow) which need the DT=
 to
>> >> > > come from a prior stage. How to handle that? IMO that is only goi=
ng to
>> >> > > grow as every man and his dog get into the write-a-bootloader
>> >> > > business.
>> >> >
>> >> > And that's exactly why we have to come up with something that scale=
s,  without
>> >> > having to add a bunch of unusable DTs in U-Boot.
>> >>
>> >> In what way does this not scale? How are the DTs unusable? If there i=
s
>> >> a standard binding, we should be fine.
>> >>
>> >> >
>> >> > > We need a way to provide the U-Boot nodes/properties in a
>> >> > > form that the prior stage can consume and integrate with its buil=
d
>> >> > > system. Is TF-A the only thing being discussed here? If so, let's=
 just
>> >> > > do it. We have the u-boot.dtsi and we can use binman to put the i=
mage
>> >> > > together, for example. Or we can get clever and create some sort =
of
>> >> > > overlay dtb.
>> >> > >
>> >> > > Step 3a. But I don't want to do that. a) If U-Boot needs this stu=
ff
>> >> > > then it will need to build it in and use two devicetrees, one int=
ernal
>> >> > > and one from the prior stage....well that is not very efficient a=
nd it
>> >> > > is going to be confusing for people to figure out what U-Boot is
>> >> > > actually doing. But we actually already do that in a lot of cases
>> >> > > where U-Boot passes a DT to the kernel which is different to the =
one
>> >> > > it uses. So perhaps we have three devicetrees? OMG.
>> >> >
>> >> > No we don't. That's a moot point. If you separate the DTs U-Boot
>> >> > provides the internal one and inherits one 'generic'.  Linux will b=
e able to use
>> >> > that.  So the only case were you'll need 3 DTs is if the *vendor* b=
reaks the
>> >> > DT across kernel versions,  In which case there's not much you can =
do to
>> >> > begin with and that's already a case we have to deal with.
>> >>
>> >> Linux actually doesn't care if the U-Boot properties are in the tree,
>> >> so long as we have proper bindings. My point here is we only need
>> >> either:
>> >>
>> >> a. one devicetree, shared with Linux and U-Boot (and TF-A?)
>> >> b. two devicetrees, one for use in firmware and one for passing to Li=
nux
>> >>
>> >> We don't need to separate out the U-Boot properties into a second (or
>> >> third) devicetree. There just isn't any point.
>> >>
>> >> >
>> >> > > b) Well then
>> >> > > U-Boot can have its own small devicetree with its bits and then U=
-Boot
>> >> > > can merge the two when it starts. Again that is not very efficien=
t. It
>> >> > > means that U-Boot cannot be controlled by the prior stage (e.g. t=
o get
>> >> > > its public key from there or to enable/disable the console), so
>> >> > > unified firmware config is not possible. It will get very confusi=
ng,
>> >> > > particularly for debugging U-Boot. c) Some other scheme to avoid
>> >> > > accepting step 3...please stop!
>> >> > >
>> >> > > Step 4: Yes, but there is QEMU, which makes the devicetree up out=
 of
>> >> > > whole cloth. What about that? Well, we are just going to have to =
deal
>> >> > > with that. We can easily merge in the U-Boot nodes/properties and
>> >> > > update the U-Boot CI scripts to do this, as needed, e.g. with
>> >> > > qemu-riscv64_spl. It's only one use case, although Xen might do
>> >> > > something similar.
>> >> > >
>> >> > > To my mind, that deals with both the build-time and run-time issu=
es.
>> >> > > We have a discoverable DT in U-Boot, which should be considered t=
he
>> >> > > source of truth for most boards. We can sync it with Linux
>> >> > > automatically with the tooling that I hope Rob Herring will come =
up
>> >> > > with. We can use an empty one where there really is no default,
>> >> > > although I'd argue that is making perfect an enemy of the good.
>> >> > >
>> >> > > Step 5: If we get clever and want to remove them from the U-Boot =
tree
>> >> > > and pick them up from somewhere else, we can do that with suffici=
ent
>> >> > > tooling. Perhaps we should set a timeline for that? A year? Two? =
Six?
>> >> >
>> >> > We can start slowly migrating boards and see how that works out.
>> >> > We could either use 2 device trees as you proposed, or have u-boot =
merge
>> >> > the 'u-boot' DTB and the inherited DTB before DM comes up.  OTOH I'=
d prefer
>> >> > if linux gets handed a clean device tree without the u-boot interna=
ls in
>> >> > it, so I think 2 discrete DTs is cleaner overall.
>> >>
>> >> I know you would prefer that, but does it really matter in practice?
>> >> What is the objection, actually?
>> >>
>> >> As I mentioned on the call, I think the prior stage should do any
>> >> merging or fixing up. Trying to do that sort of thing in 'early' code
>> >> in U-Boot (or any other program, including Linux) is such a pain. Wit=
h
>> >> U-Boot, for example, we don't even have any RAM available to do it
>> >> with half the time and it would dramatically increase the amount of
>> >> memory needed prior to relocation. It just isn't a very good idea to
>> >> try to do this in early code. It is also completely unnecessary, once
>> >> you get past the philosophical objections.
>> >>
>> >> If TF-A wants to be in the picture, let it deal with the implications
>> >> and responsibility thus incurred. TF-A has no right to tell U-Boot ho=
w
>> >> to handle its config. TF-A is 0.5m LOC, i.e. a lot, almost a quarter
>> >> of the size of U-Boot. It duplicates loads of things in there. No one
>> >> will even *notice* an FDT merge function, which is actually only 70
>> >> LOC:
>> >>
>> >> /**
>> >>  * overlay_apply_node - Merges a node into the base device tree
>> >>  * @fdt: Base Device Tree blob
>> >>  * @target: Node offset in the base device tree to apply the fragment=
 to
>> >>  * @fdto: Device tree overlay blob
>> >>  * @node: Node offset in the overlay holding the changes to merge
>> >>  *
>> >>  * overlay_apply_node() merges a node into a target base device tree
>> >>  * node pointed.
>> >>  *
>> >>  * This is part of the final step in the device tree overlay
>> >>  * application process, when all the phandles have been adjusted and
>> >>  * resolved and you just have to merge overlay into the base device
>> >>  * tree.
>> >>  *
>> >>  * returns:
>> >>  *      0 on success
>> >>  *      Negative error code on failure
>> >>  */
>> >> static int overlay_apply_node(void *fdt, int target,
>> >>                void *fdto, int node)
>> >> {
>> >>    int property;
>> >>    int subnode;
>> >>
>> >>    fdt_for_each_property_offset(property, fdto, node) {
>> >>       const char *name;
>> >>       const void *prop;
>> >>       int prop_len;
>> >>       int ret;
>> >>
>> >>       prop =3D fdt_getprop_by_offset(fdto, property, &name,
>> >>                     &prop_len);
>> >>       if (prop_len =3D=3D -FDT_ERR_NOTFOUND)
>> >>          return -FDT_ERR_INTERNAL;
>> >>       if (prop_len < 0)
>> >>          return prop_len;
>> >>
>> >>       ret =3D fdt_setprop(fdt, target, name, prop, prop_len);
>> >>       if (ret)
>> >>          return ret;
>> >>    }
>> >>
>> >>    fdt_for_each_subnode(subnode, fdto, node) {
>> >>       const char *name =3D fdt_get_name(fdto, subnode, NULL);
>> >>       int nnode;
>> >>       int ret;
>> >>
>> >>       nnode =3D fdt_add_subnode(fdt, target, name);
>> >>       if (nnode =3D=3D -FDT_ERR_EXISTS) {
>> >>          nnode =3D fdt_subnode_offset(fdt, target, name);
>> >>          if (nnode =3D=3D -FDT_ERR_NOTFOUND)
>> >>             return -FDT_ERR_INTERNAL;
>> >>       }
>> >>
>> >>       if (nnode < 0)
>> >>          return nnode;
>> >>
>> >>       ret =3D overlay_apply_node(fdt, nnode, fdto, subnode);
>> >>       if (ret)
>> >>          return ret;
>> >>    }
>> >>
>> >>    return 0;
>> >>
>> >>
>> >>
>> >> }
>> >>
>> >>
>> >> >
>> >> > Regards
>> >> > /Ilias
>> >> > >
>> >> > > To repeat, if we set things up correctly and agree on the binding=
s,
>> >> > > devicetree can be the unifying configuration mechanism through th=
e
>> >> > > whole of firmware (except for very early bits) and into the OS. I=
 feel
>> >> > > this will set us up very well to deal with the complexity that is
>> >> > > coming.
>> >> > >
>> >>
>> >> Regards,
>> >> Simon
>
> --
> Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | Director Business Development
> T: +33.67221.6485
> francois.ozog@linaro.org | Skype: ffozog
>

