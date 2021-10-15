Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CA42FABC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:05:04 +0200 (CEST)
Received: from localhost ([::1]:41094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbRZn-00034Y-8H
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mbRYo-0002Og-Ed
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:04:02 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:41882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mbRYl-0003MW-Lb
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:04:02 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so13915586ote.8
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+gSZutgf0rxTu11D1YXoK4bCAfdtcqE8DXHlHZ8T1cE=;
 b=P6Vbigvw6DCts2MdVanC2XK76LoaVTqOZOfLcaLnop+NcAEJRscrr0K4nTnrZZF+qi
 2Qw+YMfBGY6KBiqkdHfxKqDRR2YtR6Iz2/spUohnI2pLvgiJhCK2myAaBJIbHPgWSsT9
 rwnn2XqcC0fbMoVJWUllV1ApFcyPmNNR2YW98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+gSZutgf0rxTu11D1YXoK4bCAfdtcqE8DXHlHZ8T1cE=;
 b=p0tQEFZMlFV3jQiK97r+1S/vvke1865j6obpOm2k90cEKk+CsmxA8NEIA8HFnsuPWa
 II/lxFc4qU+k7Q1xjrCBdBHA6xqmfwobiBiK5c7K8HYs6suCIo46lwg7RsZAtVI52khd
 9WLcB8FzG7GXsxhae8LK/+aZe9Zw2dpnl/VM1Y9Jxt7LQ+L745EAUJyEGfLUIiLNmNiA
 h8GzWqyNYQ108b4XK4pfQ8GWF2tE+LzxE1ASElxqlkEXK2IBHhWKxtkDz6yOtWL0mQlU
 Kc0I4D8/BhWH9FNsHlyxX/cFPe66FNAGNr8g4zaPMmdqDLKmNElKdRjAMesQ0pI2npVD
 zUMQ==
X-Gm-Message-State: AOAM530HJ+lBJYF4AC5V+YJV5OKBN4eWVYY+zBRWbWij+fJHhXCwjeCu
 ucD7U/0kiME5GA0+w8ZFXEA+sXQQnpQHJHanD/53Og==
X-Google-Smtp-Source: ABdhPJxFHF/jhkaYYgSYJ9aJTgpwMaGugexS78o90FlKw0TxahoQqycodatC+dJhYArp3rFZeQN7ZWDIe2YVVJI9Yzk=
X-Received: by 2002:a05:6830:3093:: with SMTP id
 f19mr9414103ots.97.1634321036673; 
 Fri, 15 Oct 2021 11:03:56 -0700 (PDT)
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
In-Reply-To: <20211014152801.GF7964@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 15 Oct 2021 12:03:44 -0600
Message-ID: <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=sjg@google.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
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

Hi all,

On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com> wrote:
>
> On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > Hi Tom,
> >
> > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > Hi Fran=C3=A7ois,
> > > >
> > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <francois.ozog@lin=
aro.org> wrote:
> > > > >
> > > > > Hi Simon
> > > > >
> > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org>=
 a =C3=A9crit :
> > > > >>
> > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > >>
> > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrot=
e:
> > > > >> >
> > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > > > >> > > Hi Simon,
> > > > >> > >
> > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.or=
g> wrote:
> > > > >> > > >
> > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_=
HOSTFILE so
> > > > >> > > > there are only three ways to obtain a devicetree:
> > > > >> > > >
> > > > >> > > >    - OF_SEPARATE - the normal way, where the devicetree is=
 built and
> > > > >> > > >       appended to U-Boot
> > > > >> > > >    - OF_EMBED - for development purposes, the devicetree i=
s embedded in
> > > > >> > > >       the ELF file (also used for EFI)
> > > > >> > > >    - OF_BOARD - the board figures it out on its own
> > > > >> > > >
> > > > >> > > > The last one is currently set up so that no devicetree is =
needed at all
> > > > >> > > > in the U-Boot tree. Most boards do provide one, but some d=
on't. Some
> > > > >> > > > don't even provide instructions on how to boot on the boar=
d.
> > > > >> > > >
> > > > >> > > > The problems with this approach are documented at [1].
> > > > >> > > >
> > > > >> > > > In practice, OF_BOARD is not really distinct from OF_SEPAR=
ATE. Any board
> > > > >> > > > can obtain its devicetree at runtime, even it is has a dev=
icetree built
> > > > >> > > > in U-Boot. This is because U-Boot may be a second-stage bo=
otloader and its
> > > > >> > > > caller may have a better idea about the hardware available=
 in the machine.
> > > > >> > > > This is the case with a few QEMU boards, for example.
> > > > >> > > >
> > > > >> > > > So it makes no sense to have OF_BOARD as a 'choice'. It sh=
ould be an
> > > > >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> > > > >> > > >
> > > > >> > > > This series makes this change, adding various missing devi=
cetree files
> > > > >> > > > (and placeholders) to make the build work.
> > > > >> > >
> > > > >> > > Adding device trees that are never used sounds like a hack t=
o me.
> > > > >> > >
> > > > >> > > For QEMU, device tree is dynamically generated on the fly ba=
sed on
> > > > >> > > command line parameters, and the device tree you put in this=
 series
> > > > >> > > has various hardcoded <phandle> values which normally do not=
 show up
> > > > >> > > in hand-written dts files.
> > > > >> > >
> > > > >> > > I am not sure I understand the whole point of this.
> > > > >> >
> > > > >> > I am also confused and do not like the idea of adding device t=
rees for
> > > > >> > platforms that are capable of and can / do have a device tree =
to give us
> > > > >> > at run time.
> > > > >>
> > > > >> (I'll just reply to this one email, since the same points applie=
s to
> > > > >> all replies I think)
> > > > >>
> > > > >> I have been thinking about this and discussing it with people fo=
r a
> > > > >> few months now. I've been signalling a change like this for over=
 a
> > > > >> month now, on U-Boot contributor calls and in discussions with L=
inaro
> > > > >> people. I sent a patch (below) to try to explain things. I hope =
it is
> > > > >> not a surprise!
> > > > >>
> > > > >> The issue here is that we need a devicetree in-tree in U-Boot, t=
o
> > > > >> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD=
,
> > > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Betwe=
en
> > > > >> Ilias' series and this one we can get ourselves on a stronger fo=
oting.
> > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
> > > > >> For more context:
> > > > >>
> > > > >> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3=
830278-3-sjg@chromium.org/
> > > > >>
> > > > >> BTW I did suggest to QEMU ARM that they support a way of adding =
the
> > > > >> u-boot.dtsi but there was not much interest there (in fact the
> > > > >> maintainer would prefer there was no special support even for bo=
oting
> > > > >> Linux directly!)
> > > > >
> > > > > i understand their point of view and agree with it.
> > > > >>
> > > > >> But in any case it doesn't really help U-Boot. I
> > > > >> think the path forward might be to run QEMU twice, once to get i=
ts
> > > > >> generated tree and once to give the 'merged' tree with the U-Boo=
t
> > > > >> properties in it, if people want to use U-Boot features.
> > > > >>
> > > > >> I do strongly believe that OF_BOARD must be a run-time option, n=
ot a
> > > > >> build-time one. It creates all sorts of problems and obscurity w=
hich
> > > > >> have taken months to unpick. See the above patch for the rationa=
le.
> > > > >>
> > > > >> To add to that rationale, OF_BOARD needs to be an option availab=
le to
> > > > >> any board. At some point in the future it may become a common wa=
y
> > > > >> things are done, e.g. TF-A calling U-Boot and providing a device=
tree
> > > > >> to it. It doesn't make any sense to have people decide whether o=
r not
> > > > >> to set OF_BOARD at build time, thus affecting how the image is p=
ut
> > > > >> together. We'll end up with different U-Boot build targets like
> > > > >> capricorn, capricorn_of_board and the like. It should be obvious=
 where
> > > > >> that will lead. Instead, OF_BOARD needs to become a commonly use=
d
> > > > >> option, perhaps enabled by most/all boards, so that this sort of=
 build
> > > > >> explosion is not needed.
> > > > >
> > > > > If you mean that when boards are by construction providing a DTB =
to U-Boot then I agree very much. But I don=E2=80=99t understand how the pa=
tch set  supports it as it puts dts files for those boards to be built.
> > > > >>
> > > > >> U-Boot needs to be flexible enough to
> > > > >> function correctly in whatever runtime environment in which it f=
inds
> > > > >> itself.
> > > > >>
> > > > >> Also as binman is pressed into service more and more to build th=
e
> > > > >> complex firmware images that are becoming fashionable, it needs =
a
> > > > >> definition (in the devicetree) that describes how to create the =
image.
> > > > >> We can't support that unless we are building a devicetree, nor c=
an the
> > > > >> running program access the image layout without that information=
.
> > > > >>
> > > > >> Fran=C3=A7ois's point about 'don't use this with any kernel' is
> > > > >> germane...but of course I am not suggesting doing that, since OF=
_BOARD
> > > > >> is, still, enabled. We already use OF_BOARD for various boards t=
hat
> > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for exa=
mple
> > > > >> (as I said in the cover letter "Most boards do provide one, but =
some
> > > > >> don't."). So this series is just completing the picture by enfor=
cing
> > > > >> that *some sort* of devicetree is always present.
> > > > >
> > > > > That seems inconsistent with the OF_BOARD becomes the default.
> > > >
> > > > I think the key point that will get you closer to where I am on thi=
s
> > > > issue, is that OF_BOARD needs to be a run-time option. At present i=
t
> > > > has build-time effects and this is quite wrong. If you go through a=
ll
> > > > the material I have written on this I think I have motivated that v=
ery
> > > > clearly.
> > > >
> > > > Another big issue is that I believe we need ONE devicetree for U-Bo=
ot,
> > > > not two that get merged by U-Boot. Again I have gone through that i=
n a
> > > > lot of detail.
> > >
> > > I have a long long reply to your first reply here saved, but, maybe
> > > here's the biggest sticking point.  To be clear, you agree that U-Boo=
t
> > > needs to support being passed a device tree to use, at run time, yes?
> >
> > Yes. The OF_BOARD feature provides this.
> >
> > >
> > > And in that case, would not be using the "fake" tree we built in?
> >
> > Not at runtime.
>
> OK.
>
> > > So is the sticking point here that we really have two classes of
> > > devices, one class where we will never ever be given the device tree =
at
> > > run time (think BeagleBone Black) and one where we will always be giv=
en
> > > one at run time (think Raspberry Pi) ?
> >
> > I'm not sure it will be that black and white. I suspect there will be
> > (many) boards which can boot happily with the U-Boot devicetree but
> > can also accept one at runtime, if provided. For example, you may want
> > to boot with or without TF-A or some other, earlier stage.
>
> I'm not sure I see the value in making this a gray area.  There's very
> much a class of "never" boards.  There's also the class of "can" today.
> Maybe as part of a developer iterative flow it would be nice to not have
> to re-flash the prior stage to change a DT, and just do it in U-Boot
> until things are happy, but I'm not sure what the use case is for
> overriding the previous stage.
>
> Especially since the pushback on this series I think has all been "why
> are we copying in a tree to build with?  We don't want to use it at run
> time!".  And then softer push back like "Well, U-Boot says we have to
> include the device tree file here, but we won't use it...".

See below.

>
> > I believe we have got unstuck because OF_BOARD (perhaps inadvertently)
> > provided a way to entirely omit a devicetree from U-Boot, thus making
> > things like binman and U-Boot /config impossible, for example. So I
> > want to claw that back, so there is always some sort of devicetree in
> > U-Boot, as we have for rpi_3, etc.
>
> I really want to see what the binary case looks like since we could then
> kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
> then also do a rpi_arm32_defconfig too.
>
> I want to see less device trees in U-Boot sources, if they can come
> functionally correct from the hardware/our caller.
>
> And I'm not seeing how we make use of "U-Boot /config" if we also don't
> use the device tree from build time at run time, ignoring the device
> tree provided to us at run time by the caller.

Firstly I should say that I find building firmware very messy and
confusing these days. Lots of things to build and it's hard to find
the instructions. It doesn't have to be that way, but if we carry on
as we are, it will continue to be messy and in five years you will
need a Ph.D and a lucky charm to boot on any modern board. My
objective here is to simplify things, bringing some consistency to the
different components. Binman was one effort there. I feel that putting
at least the U-Boot house in order, in my role as devicetree
maintainer (and as author of devicetree support in U-Boot back in
2011), is the next step.

If we set things up correctly and agree on the bindings, devicetree
can be the unifying configuration mechanism through the whole of
firmware (except for very early bits) and into the OS, this will set
us up very well to deal with the complexity that is coming.

Anyway, here are the mental steps that I've gone through over the past
two months:

Step 1: At present, some people think U-Boot is not even allowed to
have its own nodes/properties in the DT. It is an abuse of the
devicetree standard, like the /chosen node but with less history. We
should sacrifice efficiency, expedience and expandability on the altar
of 'devicetree is a hardware description'. How do we get over that
one? Wel, I just think we need to accept that U-Boot uses devicetree
for its own purposes, as well as for booting the OS. I am not saying
it always has to have those properties, but with existing features
like verified boot, SPL as well as complex firmware images where
U-Boot needs to be able to find things in the image, it is essential.
So let's just assume that we need this everywhere, since we certainly
need it in at least some places.

(stop reading here if you disagree, because nothing below will make
any sense...you can still use U-Boot v2011.06 which doesn't have
OF_CONTROL :-)

Step 2: Assume U-Boot has its own nodes/properties. How do they get
there? Well, we have u-boot.dtsi files for that (the 2016 patch
"6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
have binman definitions, etc. So we need a way to overlay those things
into the DT. We already support this for in-tree DTs, so IMO this is
easy. Just require every board to have an in-tree DT. It helps with
discoverability and documentation, anyway. That is this series.

(I think most of us are at the beginning of step 2, unsure about it
and worried about step 3)

Step 3: Ah, but there are flows (i.e. boards that use a particular
flow only, or boards that sometimes use a flow) which need the DT to
come from a prior stage. How to handle that? IMO that is only going to
grow as every man and his dog get into the write-a-bootloader
business. We need a way to provide the U-Boot nodes/properties in a
form that the prior stage can consume and integrate with its build
system. Is TF-A the only thing being discussed here? If so, let's just
do it. We have the u-boot.dtsi and we can use binman to put the image
together, for example. Or we can get clever and create some sort of
overlay dtb.

Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
then it will need to build it in and use two devicetrees, one internal
and one from the prior stage....well that is not very efficient and it
is going to be confusing for people to figure out what U-Boot is
actually doing. But we actually already do that in a lot of cases
where U-Boot passes a DT to the kernel which is different to the one
it uses. So perhaps we have three devicetrees? OMG. b) Well then
U-Boot can have its own small devicetree with its bits and then U-Boot
can merge the two when it starts. Again that is not very efficient. It
means that U-Boot cannot be controlled by the prior stage (e.g. to get
its public key from there or to enable/disable the console), so
unified firmware config is not possible. It will get very confusing,
particularly for debugging U-Boot. c) Some other scheme to avoid
accepting step 3...please stop!

Step 4: Yes, but there is QEMU, which makes the devicetree up out of
whole cloth. What about that? Well, we are just going to have to deal
with that. We can easily merge in the U-Boot nodes/properties and
update the U-Boot CI scripts to do this, as needed, e.g. with
qemu-riscv64_spl. It's only one use case, although Xen might do
something similar.

To my mind, that deals with both the build-time and run-time issues.
We have a discoverable DT in U-Boot, which should be considered the
source of truth for most boards. We can sync it with Linux
automatically with the tooling that I hope Rob Herring will come up
with. We can use an empty one where there really is no default,
although I'd argue that is making perfect an enemy of the good.

Step 5: If we get clever and want to remove them from the U-Boot tree
and pick them up from somewhere else, we can do that with sufficient
tooling. Perhaps we should set a timeline for that? A year? Two? Six?

To repeat, if we set things up correctly and agree on the bindings,
devicetree can be the unifying configuration mechanism through the
whole of firmware (except for very early bits) and into the OS. I feel
this will set us up very well to deal with the complexity that is
coming.

Regards,
Simon

