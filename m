Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD543CE4E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:08:32 +0200 (CEST)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflTb-0004pC-68
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mfknB-0002AT-I1
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:24:41 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:36671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mfkn8-0001b0-2L
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:24:41 -0400
Received: by mail-ua1-x934.google.com with SMTP id e10so5674888uab.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W8EEns3sdmfyEpyxDiptFzUXjLZ3zU9dbHDGzRT16k8=;
 b=MaF2Ta4OvXlKLZZwhiG/FceWU0q0jAq0DJ8tDGFZKCL826IM5C+FrACE84fmLQPvFV
 UrNvsy0kke0zuRoEJPh1vyoSz/UoQFKYn71jP0+No8rK6Iwg+QduDQFB0KczFQ5qQAWt
 SBnLO9VJhOyfZmVLjoi2Ph2vqyKcGX8DNKl8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W8EEns3sdmfyEpyxDiptFzUXjLZ3zU9dbHDGzRT16k8=;
 b=BI828xqucmMWtUBNqB7B/uNGV6uHsY7eKTCQVV8onxtU6a1JhYXxNdUhl0VVJFmprR
 azo97TQbgrqKn51+x/OXGfX7WeCwTPsowhTf4l7ij6bDKdzjv6G7napkww63m2RrDBqU
 nQr2/8TbGlspAV8QOTfMI9TCiFLIXlX9knuKSyjDnYH+KCCBAfZi5KrbzlEh1NAKPJjK
 QR/ypdywXPfOHuNNnEHJxAGBio6sMH9gx1SCP7BWOWOoJ91pNvkd6n/mR7JkRX0v6pye
 BchU53QJnf7M/vOIMNjBB6x9vF/LupjNkoU3P2AgEd2KXb+mLqgNlrA8A+Ry7Yt+AG3l
 EdTw==
X-Gm-Message-State: AOAM530ID3a6SHOYkggQdPtpQT5LOjoRBRCn4VSH6LXY0H39czwY0+vu
 u5/85/6x+q58QmeCJHWM/MxsPX+rVug5VglrRPc+fA==
X-Google-Smtp-Source: ABdhPJzqwHTRuwGe+KkReZjA6mTkcI5MA8tgDt8jPMbCGZGVfauEw9FKAw+oBVsojzLU6tvDH0IPoBJC9BkKr50ZSiI=
X-Received: by 2002:a67:d51c:: with SMTP id l28mr20358960vsj.58.1635348276491; 
 Wed, 27 Oct 2021 08:24:36 -0700 (PDT)
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
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
In-Reply-To: <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 27 Oct 2021 09:24:25 -0600
Message-ID: <CAPnjgZ1qJ-s7CrP-azLHhKKnGzeF5zWPfaanhToiUNx1VEacMA@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=sjg@google.com; helo=mail-ua1-x934.google.com
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
Cc: liviu.dudau@foss.arm.com, narmstrong@baylibre.com, vladimir.oltean@nxp.com,
 linus.walleij@linaro.org, Bin Meng <bin.meng@windriver.com>,
 kever.yang@rock-chips.com, seanga2@gmail.com,
 Atish Patra <atish.patra@wdc.com>, zong.li@sifive.com, swarren@wwwdotorg.org,
 sr@denx.de, Fabio Estevam <festevam@gmail.com>,
 rainer.boschung@hitachi-powergrids.com,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>, swarren@nvidia.com,
 oleksandr_andrushchenko@epam.com, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 lusus@denx.de, michal.simek@xilinx.com, marek.behun@nic.cz,
 vanbaren@cideas.com, rfried.dev@gmail.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 valentin.longchamp@hitachi-powergrids.com, Heiko Schocher <hs@denx.de>,
 pbrobinson@gmail.com, sinan@writeme.com, fitzsim@fitzsim.org, wd@denx.de,
 Tom Rini <trini@konsulko.com>, qemu-devel@nongnu.org,
 Andre Przywara <andre.przywara@arm.com>, tharvey@gateworks.com,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, rick@andestech.com,
 Alex Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 t.karthik.reddy@xilinx.com,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert ARIBAUD <albert.u.boot@aribaud.net>, monstr@monstr.eu,
 mbrugger@suse.com, ycliang@andestech.com, kristo@kernel.org,
 u-boot@lists.denx.de, David Abdurachmanov <david.abdurachmanov@sifive.com>,
 priyanka.jain@nxp.com, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>, tuomas.tynkkynen@iki.fi,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 tianrui-wei@outlook.com, Bin Meng <bmeng.cn@gmail.com>, pali@kernel.org,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 padmarao.begari@microchip.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mark,

On Wed, 27 Oct 2021 at 09:11, Mark Kettenis <mark.kettenis@xs4all.nl> wrote=
:
>
> > From: Fran=C3=A7ois Ozog <francois.ozog@linaro.org>
> > Date: Wed, 27 Oct 2021 15:15:01 +0200
> >
> > Hi,
> >
> > On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com> wrote:
> >
> > > On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
> > > > Hi all,
> > > >
> > > > On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com> wrote:
> > > > >
> > > > > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > > > > > Hi Tom,
> > > > > >
> > > > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com> wro=
te:
> > > > > > >
> > > > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> > > > > > > > Hi Fran=C3=A7ois,
> > > > > > > >
> > > > > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> > > francois.ozog@linaro.org> wrote:
> > > > > > > > >
> > > > > > > > > Hi Simon
> > > > > > > > >
> > > > > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chrom=
ium.org>
> > > a =C3=A9crit :
> > > > > > > > >>
> > > > > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > > > > >>
> > > > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.c=
om>
> > > wrote:
> > > > > > > > >> >
> > > > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wro=
te:
> > > > > > > > >> > > Hi Simon,
> > > > > > > > >> > >
> > > > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <
> > > sjg@chromium.org> wrote:
> > > > > > > > >> > > >
> > > > > > > > >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE=
 and
> > > OF_HOSTFILE so
> > > > > > > > >> > > > there are only three ways to obtain a devicetree:
> > > > > > > > >> > > >
> > > > > > > > >> > > >    - OF_SEPARATE - the normal way, where the devic=
etree
> > > is built and
> > > > > > > > >> > > >       appended to U-Boot
> > > > > > > > >> > > >    - OF_EMBED - for development purposes, the
> > > devicetree is embedded in
> > > > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > > > >> > > >    - OF_BOARD - the board figures it out on its ow=
n
> > > > > > > > >> > > >
> > > > > > > > >> > > > The last one is currently set up so that no device=
tree
> > > is needed at all
> > > > > > > > >> > > > in the U-Boot tree. Most boards do provide one, bu=
t
> > > some don't. Some
> > > > > > > > >> > > > don't even provide instructions on how to boot on =
the
> > > board.
> > > > > > > > >> > > >
> > > > > > > > >> > > > The problems with this approach are documented at =
[1].
> > > > > > > > >> > > >
> > > > > > > > >> > > > In practice, OF_BOARD is not really distinct from
> > > OF_SEPARATE. Any board
> > > > > > > > >> > > > can obtain its devicetree at runtime, even it is h=
as a
> > > devicetree built
> > > > > > > > >> > > > in U-Boot. This is because U-Boot may be a second-=
stage
> > > bootloader and its
> > > > > > > > >> > > > caller may have a better idea about the hardware
> > > available in the machine.
> > > > > > > > >> > > > This is the case with a few QEMU boards, for examp=
le.
> > > > > > > > >> > > >
> > > > > > > > >> > > > So it makes no sense to have OF_BOARD as a 'choice=
'. It
> > > should be an
> > > > > > > > >> > > > option, available with either OF_SEPARATE or OF_EM=
BED.
> > > > > > > > >> > > >
> > > > > > > > >> > > > This series makes this change, adding various miss=
ing
> > > devicetree files
> > > > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > > > >> > >
> > > > > > > > >> > > Adding device trees that are never used sounds like =
a
> > > hack to me.
> > > > > > > > >> > >
> > > > > > > > >> > > For QEMU, device tree is dynamically generated on th=
e fly
> > > based on
> > > > > > > > >> > > command line parameters, and the device tree you put=
 in
> > > this series
> > > > > > > > >> > > has various hardcoded <phandle> values which normall=
y do
> > > not show up
> > > > > > > > >> > > in hand-written dts files.
> > > > > > > > >> > >
> > > > > > > > >> > > I am not sure I understand the whole point of this.
> > > > > > > > >> >
> > > > > > > > >> > I am also confused and do not like the idea of adding
> > > device trees for
> > > > > > > > >> > platforms that are capable of and can / do have a devi=
ce
> > > tree to give us
> > > > > > > > >> > at run time.
> > > > > > > > >>
> > > > > > > > >> (I'll just reply to this one email, since the same point=
s
> > > applies to
> > > > > > > > >> all replies I think)
> > > > > > > > >>
> > > > > > > > >> I have been thinking about this and discussing it with p=
eople
> > > for a
> > > > > > > > >> few months now. I've been signalling a change like this =
for
> > > over a
> > > > > > > > >> month now, on U-Boot contributor calls and in discussion=
s
> > > with Linaro
> > > > > > > > >> people. I sent a patch (below) to try to explain things.=
 I
> > > hope it is
> > > > > > > > >> not a surprise!
> > > > > > > > >>
> > > > > > > > >> The issue here is that we need a devicetree in-tree in
> > > U-Boot, to
> > > > > > > > >> avoid the mess that has been created by OF_PRIOR_STAGE,
> > > OF_BOARD,
> > > > > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFIL=
E.
> > > Between
> > > > > > > > >> Ilias' series and this one we can get ourselves on a str=
onger
> > > footing.
> > > > > > > > >> There is just OF_SEPARATE, with OF_EMBED for debugging/E=
LF
> > > use.
> > > > > > > > >> For more context:
> > > > > > > > >>
> > > > > > > > >>
> > > http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.383027=
8-3-sjg@chromium.org/
> > > > > > > > >>
> > > > > > > > >> BTW I did suggest to QEMU ARM that they support a way of
> > > adding the
> > > > > > > > >> u-boot.dtsi but there was not much interest there (in fa=
ct the
> > > > > > > > >> maintainer would prefer there was no special support eve=
n for
> > > booting
> > > > > > > > >> Linux directly!)
> > > > > > > > >
> > > > > > > > > i understand their point of view and agree with it.
> > > > > > > > >>
> > > > > > > > >> But in any case it doesn't really help U-Boot. I
> > > > > > > > >> think the path forward might be to run QEMU twice, once =
to
> > > get its
> > > > > > > > >> generated tree and once to give the 'merged' tree with t=
he
> > > U-Boot
> > > > > > > > >> properties in it, if people want to use U-Boot features.
> > > > > > > > >>
> > > > > > > > >> I do strongly believe that OF_BOARD must be a run-time
> > > option, not a
> > > > > > > > >> build-time one. It creates all sorts of problems and
> > > obscurity which
> > > > > > > > >> have taken months to unpick. See the above patch for the
> > > rationale.
> > > > > > > > >>
> > > > > > > > >> To add to that rationale, OF_BOARD needs to be an option
> > > available to
> > > > > > > > >> any board. At some point in the future it may become a c=
ommon
> > > way
> > > > > > > > >> things are done, e.g. TF-A calling U-Boot and providing =
a
> > > devicetree
> > > > > > > > >> to it. It doesn't make any sense to have people decide
> > > whether or not
> > > > > > > > >> to set OF_BOARD at build time, thus affecting how the im=
age
> > > is put
> > > > > > > > >> together. We'll end up with different U-Boot build targe=
ts
> > > like
> > > > > > > > >> capricorn, capricorn_of_board and the like. It should be
> > > obvious where
> > > > > > > > >> that will lead. Instead, OF_BOARD needs to become a comm=
only
> > > used
> > > > > > > > >> option, perhaps enabled by most/all boards, so that this=
 sort
> > > of build
> > > > > > > > >> explosion is not needed.
> > > > > > > > >
> > > > > > > > > If you mean that when boards are by construction providin=
g a
> > > DTB to U-Boot then I agree very much. But I don=E2=80=99t understand =
how the patch
> > > set  supports it as it puts dts files for those boards to be built.
> > > > > > > > >>
> > > > > > > > >> U-Boot needs to be flexible enough to
> > > > > > > > >> function correctly in whatever runtime environment in wh=
ich
> > > it finds
> > > > > > > > >> itself.
> > > > > > > > >>
> > > > > > > > >> Also as binman is pressed into service more and more to =
build
> > > the
> > > > > > > > >> complex firmware images that are becoming fashionable, i=
t
> > > needs a
> > > > > > > > >> definition (in the devicetree) that describes how to cre=
ate
> > > the image.
> > > > > > > > >> We can't support that unless we are building a devicetre=
e,
> > > nor can the
> > > > > > > > >> running program access the image layout without that
> > > information.
> > > > > > > > >>
> > > > > > > > >> Fran=C3=A7ois's point about 'don't use this with any ker=
nel' is
> > > > > > > > >> germane...but of course I am not suggesting doing that, =
since
> > > OF_BOARD
> > > > > > > > >> is, still, enabled. We already use OF_BOARD for various
> > > boards that
> > > > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3,=
 for
> > > example
> > > > > > > > >> (as I said in the cover letter "Most boards do provide o=
ne,
> > > but some
> > > > > > > > >> don't."). So this series is just completing the picture =
by
> > > enforcing
> > > > > > > > >> that *some sort* of devicetree is always present.
> > > > > > > > >
> > > > > > > > > That seems inconsistent with the OF_BOARD becomes the def=
ault.
> > > > > > > >
> > > > > > > > I think the key point that will get you closer to where I a=
m on
> > > this
> > > > > > > > issue, is that OF_BOARD needs to be a run-time option. At
> > > present it
> > > > > > > > has build-time effects and this is quite wrong. If you go
> > > through all
> > > > > > > > the material I have written on this I think I have motivate=
d
> > > that very
> > > > > > > > clearly.
> > > > > > > >
> > > > > > > > Another big issue is that I believe we need ONE devicetree =
for
> > > U-Boot,
> > > > > > > > not two that get merged by U-Boot. Again I have gone throug=
h
> > > that in a
> > > > > > > > lot of detail.
> > > > > > >
> > > > > > > I have a long long reply to your first reply here saved, but,=
 maybe
> > > > > > > here's the biggest sticking point.  To be clear, you agree th=
at
> > > U-Boot
> > > > > > > needs to support being passed a device tree to use, at run ti=
me,
> > > yes?
> > > > > >
> > > > > > Yes. The OF_BOARD feature provides this.
> > > > > >
> > > > > > >
> > > > > > > And in that case, would not be using the "fake" tree we built=
 in?
> > > > > >
> > > > > > Not at runtime.
> > > > >
> > > > > OK.
> > > > >
> > > > > > > So is the sticking point here that we really have two classes=
 of
> > > > > > > devices, one class where we will never ever be given the devi=
ce
> > > tree at
> > > > > > > run time (think BeagleBone Black) and one where we will alway=
s be
> > > given
> > > > > > > one at run time (think Raspberry Pi) ?
> > > > > >
> > > > > > I'm not sure it will be that black and white. I suspect there w=
ill be
> > > > > > (many) boards which can boot happily with the U-Boot devicetree=
 but
> > > > > > can also accept one at runtime, if provided. For example, you m=
ay
> > > want
> > > > > > to boot with or without TF-A or some other, earlier stage.
> > > > >
> > > > > I'm not sure I see the value in making this a gray area.  There's=
 very
> > > > > much a class of "never" boards.  There's also the class of "can" =
today.
> > > > > Maybe as part of a developer iterative flow it would be nice to n=
ot
> > > have
> > > > > to re-flash the prior stage to change a DT, and just do it in U-B=
oot
> > > > > until things are happy, but I'm not sure what the use case is for
> > > > > overriding the previous stage.
> > > > >
> > > > > Especially since the pushback on this series I think has all been=
 "why
> > > > > are we copying in a tree to build with?  We don't want to use it =
at run
> > > > > time!".  And then softer push back like "Well, U-Boot says we hav=
e to
> > > > > include the device tree file here, but we won't use it...".
> > > >
> > > > See below.
> > > >
> > > > >
> > > > > > I believe we have got unstuck because OF_BOARD (perhaps
> > > inadvertently)
> > > > > > provided a way to entirely omit a devicetree from U-Boot, thus =
making
> > > > > > things like binman and U-Boot /config impossible, for example. =
So I
> > > > > > want to claw that back, so there is always some sort of devicet=
ree in
> > > > > > U-Boot, as we have for rpi_3, etc.
> > > > >
> > > > > I really want to see what the binary case looks like since we cou=
ld
> > > then
> > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we co=
uld
> > > > > then also do a rpi_arm32_defconfig too.
> > > > >
> > > > > I want to see less device trees in U-Boot sources, if they can co=
me
> > > > > functionally correct from the hardware/our caller.
> > > > >
> > > > > And I'm not seeing how we make use of "U-Boot /config" if we also=
 don't
> > > > > use the device tree from build time at run time, ignoring the dev=
ice
> > > > > tree provided to us at run time by the caller.
> > > >
> > > > Firstly I should say that I find building firmware very messy and
> > > > confusing these days. Lots of things to build and it's hard to find
> > > > the instructions. It doesn't have to be that way, but if we carry o=
n
> > > > as we are, it will continue to be messy and in five years you will
> > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > objective here is to simplify things, bringing some consistency to =
the
> > > > different components. Binman was one effort there. I feel that putt=
ing
> > > > at least the U-Boot house in order, in my role as devicetree
> > > > maintainer (and as author of devicetree support in U-Boot back in
> > > > 2011), is the next step.
> > >
> > > Yes, it's Not Great.  I don't like my handful of build-BOARD.sh scrip=
ts
> > > that know where to grab other known-good binaries of varying licenses
> > > that are needed to assemble something that boots.
> > >
> > > > If we set things up correctly and agree on the bindings, devicetree
> > > > can be the unifying configuration mechanism through the whole of
> > > > firmware (except for very early bits) and into the OS, this will se=
t
> > > > us up very well to deal with the complexity that is coming.
> > > >
> > > > Anyway, here are the mental steps that I've gone through over the p=
ast
> > > > two months:
> > > >
> > > > Step 1: At present, some people think U-Boot is not even allowed to
> > > > have its own nodes/properties in the DT.
> >
> > In my view U-Boot shall be able to leverage device tree format (source =
and
> > binary) to store its own data.
> > When you say "the" DT, I always think this is "the" DT that is passed t=
o OS
> > and in "that" DT, there should be no U-Boot entries.
>
> Why not?  As long as the device tree validates, it is perfectly fine
> to have additional nodes and properties present.  The propertiesand
> nodes will be simply ignored by the OS.
>
> OpenBSD will print:
>
>   "binman" not configured
>
> for the binman node that some of the U-Boot board targets now have,
> but it doesn't really make a difference.  If there is a proper binding
> for that node, I could simply filter it out.  Or we have U-Boot filter
> it out before the DT gets passed along like Tom suggests.

Just on that point, I believe the binman falls into the same bucket
that Tom is talking about here, in that it should be a standard
binding. Ideally I would like this to become a standard format so that
anything in firmware can use it to find stuff. I believe it is a good
and extensible way to describe the structure of firmware across all
projects.

Does "not configured" mean that it did not find the compatible string?
We could add one of those, for now, perhaps.

Regards,
Simon

