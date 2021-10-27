Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B386343D639
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:03:49 +0200 (CEST)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfr1Q-00083d-Qj
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfqyl-0007H0-Lv
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:01:03 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mfqyf-0005m6-SN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:01:02 -0400
Received: by mail-ed1-x530.google.com with SMTP id w15so16326599edc.9
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YHpK71gIOBFZpc15eR1qwmXIBAm9KU/tZNN2DGq2T5k=;
 b=tuVRuVdahPtKqHGRSvxYF/m1uD8oTBSYfVJK8FAlf79zgaJVdmmMXje/1U+v9cvprP
 nPgYl97Fhpbr8muU0PiPhEVIPTfoDzsfi6lELahqxkYw5pdW+/lTFBnCpneAdjJlPANJ
 10q8SwvHOOg+570TPAahAAsCsAKk7K0bsKn5m7WukuAEXm5uO0rlvmd3DlerKuh/FCyB
 38cs+EpWr62zD38dhMS+EVzHaTkCCy9gtOwvGfCBxJZPAmLzWvACxebBx8JT3xKyUpzt
 c4Y3Oc7gqVhkfXzn9FB7V9nC+RgKnTYCfX4fac+yxzBwFFv1u2g4dRvazFSqXrUTx5PA
 2D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YHpK71gIOBFZpc15eR1qwmXIBAm9KU/tZNN2DGq2T5k=;
 b=VRRcSAPrvY+frkdfuyqljFWV2+/lXU1Z5zWpPDHBYxvgrkQCv3CxigupIJbsjJdVXd
 F3+Qix2H0ovwoB7RRIg8GMxQqZfIodzWQImRqZWMUfzcJIvXCefvOBs5sOtvE3AG+t5m
 +cIPp/MZuoi353GWaDKoMf8CnYr3gLMFlUFYy67nkuR6BQogvYMs1f+sCf7IY7tLF/h6
 Dzw1pxLzlmnNMhilcE1zUVKgw8CLwb7os5IKpIxTa8ofIjxLcNMoHzPOXSsHSKjTKsCj
 tQWwboFowiYOeaG8b7V8eMKN+CGpEDa8nlgOJe+mZEWnQ6mQkYsMKPYnCDvVQFmf5Iqd
 ppTw==
X-Gm-Message-State: AOAM530x9080cR3iasMb3I/JaO2Pivita9tVgU3AO2OlWcYOv3Vj683F
 /tzfkACSQG4rz8oolkpY7tdscVk2uuBdqtasJR1c5A==
X-Google-Smtp-Source: ABdhPJyHQfCNLlktIEd5sQoPuERGNCRBojUjDX/9IBnWvZjC6yGdh4q0u3IpFv7OQEj4ZmqUu2k6LBMo8sfgxDdwMrk=
X-Received: by 2002:a17:906:c102:: with SMTP id
 do2mr263368ejc.111.1635372055576; 
 Wed, 27 Oct 2021 15:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <20211027124840.GR8284@bill-the-cat>
 <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
 <d3ca937f451a8cf3@bloch.sibelius.xs4all.nl>
 <CAHFG_=VYC9qaRHy=cogeXEpa8EXUqvfiXt50nfsVP3f7hzqXXA@mail.gmail.com>
 <20211027190649.GI8284@bill-the-cat>
In-Reply-To: <20211027190649.GI8284@bill-the-cat>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Thu, 28 Oct 2021 00:00:44 +0200
Message-ID: <CAHFG_=Xv2-_hqysarvjuN7QFCZHFH9L-pVbVnqzmJZZb2aHVnA@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Tom Rini <trini@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000072ddf305cf5cba64"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: liviu.dudau@foss.arm.com, narmstrong@baylibre.com, rick@andestech.com,
 vladimir.oltean@nxp.com, linus.walleij@linaro.org, fitzsim@fitzsim.org,
 kever.yang@rock-chips.com, seanga2@gmail.com, atish.patra@wdc.com,
 zong.li@sifive.com, sr@denx.de, festevam@gmail.com,
 rainer.boschung@hitachi-powergrids.com,
 Mark Kettenis <mark.kettenis@xs4all.nl>, swarren@nvidia.com,
 oleksandr_andrushchenko@epam.com, xypron.glpk@gmx.de, lusus@denx.de,
 michal.simek@xilinx.com, marek.behun@nic.cz, vanbaren@cideas.com,
 rfried.dev@gmail.com, jagan@amarulasolutions.com,
 valentin.longchamp@hitachi-powergrids.com, hs@denx.de, pbrobinson@gmail.com,
 sinan@writeme.com, bin.meng@windriver.com, wd@denx.de, swarren@wwwdotorg.org,
 andre.przywara@arm.com, tharvey@gateworks.com, ashok.reddy.soma@xilinx.com,
 qemu-devel@nongnu.org, agraf@csgraf.de, green.wan@sifive.com,
 t.karthik.reddy@xilinx.com, anastasiia_lukianenko@epam.com,
 albert.u.boot@aribaud.net, monstr@monstr.eu, mbrugger@suse.com,
 ycliang@andestech.com, kristo@kernel.org, u-boot@lists.denx.de,
 david.abdurachmanov@sifive.com, priyanka.jain@nxp.com, sjg@chromium.org,
 ilias.apalodimas@linaro.org, christianshewitt@gmail.com, awilliams@marvell.com,
 tuomas.tynkkynen@iki.fi, heinrich.schuchardt@canonical.com,
 tianrui-wei@outlook.com, bmeng.cn@gmail.com, pali@kernel.org,
 dimitri.ledkov@canonical.com, padmarao.begari@microchip.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000072ddf305cf5cba64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tom

Le mer. 27 oct. 2021 =C3=A0 21:06, Tom Rini <trini@konsulko.com> a =C3=A9cr=
it :

> On Wed, Oct 27, 2021 at 06:02:19PM +0200, Fran=C3=A7ois Ozog wrote:
> > Hi Mark,
> >
> > On Wed, 27 Oct 2021 at 17:10, Mark Kettenis <mark.kettenis@xs4all.nl>
> wrote:
> >
> > > > From: Fran=C3=A7ois Ozog <francois.ozog@linaro.org>
> > > > Date: Wed, 27 Oct 2021 15:15:01 +0200
> > > >
> > > > Hi,
> > > >
> > > > On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > > On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com>
> wrote:
> > > > > > >
> > > > > > > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
> > > > > > > > Hi Tom,
> > > > > > > >
> > > > > > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com>
> > > wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass
> wrote:
> > > > > > > > > > Hi Fran=C3=A7ois,
> > > > > > > > > >
> > > > > > > > > > On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <
> > > > > francois.ozog@linaro.org> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi Simon
> > > > > > > > > > >
> > > > > > > > > > > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <
> > > sjg@chromium.org>
> > > > > a =C3=A9crit :
> > > > > > > > > > >>
> > > > > > > > > > >> Hi Tom, Bin,Fran=C3=A7ois,
> > > > > > > > > > >>
> > > > > > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <
> > > trini@konsulko.com>
> > > > > wrote:
> > > > > > > > > > >> >
> > > > > > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng
> > > wrote:
> > > > > > > > > > >> > > Hi Simon,
> > > > > > > > > > >> > >
> > > > > > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <
> > > > > sjg@chromium.org> wrote:
> > > > > > > > > > >> > > >
> > > > > > > > > > >> > > > With Ilias' efforts we have dropped
> OF_PRIOR_STAGE
> > > and
> > > > > OF_HOSTFILE so
> > > > > > > > > > >> > > > there are only three ways to obtain a
> devicetree:
> > > > > > > > > > >> > > >
> > > > > > > > > > >> > > >    - OF_SEPARATE - the normal way, where the
> > > devicetree
> > > > > is built and
> > > > > > > > > > >> > > >       appended to U-Boot
> > > > > > > > > > >> > > >    - OF_EMBED - for development purposes, the
> > > > > devicetree is embedded in
> > > > > > > > > > >> > > >       the ELF file (also used for EFI)
> > > > > > > > > > >> > > >    - OF_BOARD - the board figures it out on it=
s
> own
> > > > > > > > > > >> > > >
> > > > > > > > > > >> > > > The last one is currently set up so that no
> > > devicetree
> > > > > is needed at all
> > > > > > > > > > >> > > > in the U-Boot tree. Most boards do provide one=
,
> but
> > > > > some don't. Some
> > > > > > > > > > >> > > > don't even provide instructions on how to boot
> on
> > > the
> > > > > board.
> > > > > > > > > > >> > > >
> > > > > > > > > > >> > > > The problems with this approach are documented
> at
> > > [1].
> > > > > > > > > > >> > > >
> > > > > > > > > > >> > > > In practice, OF_BOARD is not really distinct
> from
> > > > > OF_SEPARATE. Any board
> > > > > > > > > > >> > > > can obtain its devicetree at runtime, even it =
is
> > > has a
> > > > > devicetree built
> > > > > > > > > > >> > > > in U-Boot. This is because U-Boot may be a
> > > second-stage
> > > > > bootloader and its
> > > > > > > > > > >> > > > caller may have a better idea about the hardwa=
re
> > > > > available in the machine.
> > > > > > > > > > >> > > > This is the case with a few QEMU boards, for
> > > example.
> > > > > > > > > > >> > > >
> > > > > > > > > > >> > > > So it makes no sense to have OF_BOARD as a
> > > 'choice'. It
> > > > > should be an
> > > > > > > > > > >> > > > option, available with either OF_SEPARATE or
> > > OF_EMBED.
> > > > > > > > > > >> > > >
> > > > > > > > > > >> > > > This series makes this change, adding various
> > > missing
> > > > > devicetree files
> > > > > > > > > > >> > > > (and placeholders) to make the build work.
> > > > > > > > > > >> > >
> > > > > > > > > > >> > > Adding device trees that are never used sounds
> like a
> > > > > hack to me.
> > > > > > > > > > >> > >
> > > > > > > > > > >> > > For QEMU, device tree is dynamically generated o=
n
> the
> > > fly
> > > > > based on
> > > > > > > > > > >> > > command line parameters, and the device tree you
> put
> > > in
> > > > > this series
> > > > > > > > > > >> > > has various hardcoded <phandle> values which
> normally
> > > do
> > > > > not show up
> > > > > > > > > > >> > > in hand-written dts files.
> > > > > > > > > > >> > >
> > > > > > > > > > >> > > I am not sure I understand the whole point of
> this.
> > > > > > > > > > >> >
> > > > > > > > > > >> > I am also confused and do not like the idea of
> adding
> > > > > device trees for
> > > > > > > > > > >> > platforms that are capable of and can / do have a
> device
> > > > > tree to give us
> > > > > > > > > > >> > at run time.
> > > > > > > > > > >>
> > > > > > > > > > >> (I'll just reply to this one email, since the same
> points
> > > > > applies to
> > > > > > > > > > >> all replies I think)
> > > > > > > > > > >>
> > > > > > > > > > >> I have been thinking about this and discussing it wi=
th
> > > people
> > > > > for a
> > > > > > > > > > >> few months now. I've been signalling a change like
> this
> > > for
> > > > > over a
> > > > > > > > > > >> month now, on U-Boot contributor calls and in
> discussions
> > > > > with Linaro
> > > > > > > > > > >> people. I sent a patch (below) to try to explain
> things. I
> > > > > hope it is
> > > > > > > > > > >> not a surprise!
> > > > > > > > > > >>
> > > > > > > > > > >> The issue here is that we need a devicetree in-tree =
in
> > > > > U-Boot, to
> > > > > > > > > > >> avoid the mess that has been created by
> OF_PRIOR_STAGE,
> > > > > OF_BOARD,
> > > > > > > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent,
> OF_HOSTFILE.
> > > > > Between
> > > > > > > > > > >> Ilias' series and this one we can get ourselves on a
> > > stronger
> > > > > footing.
> > > > > > > > > > >> There is just OF_SEPARATE, with OF_EMBED for
> debugging/ELF
> > > > > use.
> > > > > > > > > > >> For more context:
> > > > > > > > > > >>
> > > > > > > > > > >>
> > > > >
> > >
> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-=
sjg@chromium.org/
> > > > > > > > > > >>
> > > > > > > > > > >> BTW I did suggest to QEMU ARM that they support a wa=
y
> of
> > > > > adding the
> > > > > > > > > > >> u-boot.dtsi but there was not much interest there (i=
n
> > > fact the
> > > > > > > > > > >> maintainer would prefer there was no special support
> even
> > > for
> > > > > booting
> > > > > > > > > > >> Linux directly!)
> > > > > > > > > > >
> > > > > > > > > > > i understand their point of view and agree with it.
> > > > > > > > > > >>
> > > > > > > > > > >> But in any case it doesn't really help U-Boot. I
> > > > > > > > > > >> think the path forward might be to run QEMU twice,
> once to
> > > > > get its
> > > > > > > > > > >> generated tree and once to give the 'merged' tree
> with the
> > > > > U-Boot
> > > > > > > > > > >> properties in it, if people want to use U-Boot
> features.
> > > > > > > > > > >>
> > > > > > > > > > >> I do strongly believe that OF_BOARD must be a run-ti=
me
> > > > > option, not a
> > > > > > > > > > >> build-time one. It creates all sorts of problems and
> > > > > obscurity which
> > > > > > > > > > >> have taken months to unpick. See the above patch for
> the
> > > > > rationale.
> > > > > > > > > > >>
> > > > > > > > > > >> To add to that rationale, OF_BOARD needs to be an
> option
> > > > > available to
> > > > > > > > > > >> any board. At some point in the future it may become=
 a
> > > common
> > > > > way
> > > > > > > > > > >> things are done, e.g. TF-A calling U-Boot and
> providing a
> > > > > devicetree
> > > > > > > > > > >> to it. It doesn't make any sense to have people deci=
de
> > > > > whether or not
> > > > > > > > > > >> to set OF_BOARD at build time, thus affecting how th=
e
> > > image
> > > > > is put
> > > > > > > > > > >> together. We'll end up with different U-Boot build
> targets
> > > > > like
> > > > > > > > > > >> capricorn, capricorn_of_board and the like. It shoul=
d
> be
> > > > > obvious where
> > > > > > > > > > >> that will lead. Instead, OF_BOARD needs to become a
> > > commonly
> > > > > used
> > > > > > > > > > >> option, perhaps enabled by most/all boards, so that
> this
> > > sort
> > > > > of build
> > > > > > > > > > >> explosion is not needed.
> > > > > > > > > > >
> > > > > > > > > > > If you mean that when boards are by construction
> providing
> > > a
> > > > > DTB to U-Boot then I agree very much. But I don=E2=80=99t underst=
and how
> the
> > > patch
> > > > > set  supports it as it puts dts files for those boards to be buil=
t.
> > > > > > > > > > >>
> > > > > > > > > > >> U-Boot needs to be flexible enough to
> > > > > > > > > > >> function correctly in whatever runtime environment i=
n
> > > which
> > > > > it finds
> > > > > > > > > > >> itself.
> > > > > > > > > > >>
> > > > > > > > > > >> Also as binman is pressed into service more and more
> to
> > > build
> > > > > the
> > > > > > > > > > >> complex firmware images that are becoming
> fashionable, it
> > > > > needs a
> > > > > > > > > > >> definition (in the devicetree) that describes how to
> > > create
> > > > > the image.
> > > > > > > > > > >> We can't support that unless we are building a
> devicetree,
> > > > > nor can the
> > > > > > > > > > >> running program access the image layout without that
> > > > > information.
> > > > > > > > > > >>
> > > > > > > > > > >> Fran=C3=A7ois's point about 'don't use this with any
> kernel' is
> > > > > > > > > > >> germane...but of course I am not suggesting doing
> that,
> > > since
> > > > > OF_BOARD
> > > > > > > > > > >> is, still, enabled. We already use OF_BOARD for
> various
> > > > > boards that
> > > > > > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 an=
d
> 3,
> > > for
> > > > > example
> > > > > > > > > > >> (as I said in the cover letter "Most boards do provi=
de
> > > one,
> > > > > but some
> > > > > > > > > > >> don't."). So this series is just completing the
> picture by
> > > > > enforcing
> > > > > > > > > > >> that *some sort* of devicetree is always present.
> > > > > > > > > > >
> > > > > > > > > > > That seems inconsistent with the OF_BOARD becomes the
> > > default.
> > > > > > > > > >
> > > > > > > > > > I think the key point that will get you closer to where
> I am
> > > on
> > > > > this
> > > > > > > > > > issue, is that OF_BOARD needs to be a run-time option. =
At
> > > > > present it
> > > > > > > > > > has build-time effects and this is quite wrong. If you =
go
> > > > > through all
> > > > > > > > > > the material I have written on this I think I have
> motivated
> > > > > that very
> > > > > > > > > > clearly.
> > > > > > > > > >
> > > > > > > > > > Another big issue is that I believe we need ONE
> devicetree
> > > for
> > > > > U-Boot,
> > > > > > > > > > not two that get merged by U-Boot. Again I have gone
> through
> > > > > that in a
> > > > > > > > > > lot of detail.
> > > > > > > > >
> > > > > > > > > I have a long long reply to your first reply here saved,
> but,
> > > maybe
> > > > > > > > > here's the biggest sticking point.  To be clear, you agre=
e
> that
> > > > > U-Boot
> > > > > > > > > needs to support being passed a device tree to use, at ru=
n
> > > time,
> > > > > yes?
> > > > > > > >
> > > > > > > > Yes. The OF_BOARD feature provides this.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > And in that case, would not be using the "fake" tree we
> built
> > > in?
> > > > > > > >
> > > > > > > > Not at runtime.
> > > > > > >
> > > > > > > OK.
> > > > > > >
> > > > > > > > > So is the sticking point here that we really have two
> classes
> > > of
> > > > > > > > > devices, one class where we will never ever be given the
> device
> > > > > tree at
> > > > > > > > > run time (think BeagleBone Black) and one where we will
> always
> > > be
> > > > > given
> > > > > > > > > one at run time (think Raspberry Pi) ?
> > > > > > > >
> > > > > > > > I'm not sure it will be that black and white. I suspect the=
re
> > > will be
> > > > > > > > (many) boards which can boot happily with the U-Boot
> devicetree
> > > but
> > > > > > > > can also accept one at runtime, if provided. For example,
> you may
> > > > > want
> > > > > > > > to boot with or without TF-A or some other, earlier stage.
> > > > > > >
> > > > > > > I'm not sure I see the value in making this a gray area.
> There's
> > > very
> > > > > > > much a class of "never" boards.  There's also the class of
> "can"
> > > today.
> > > > > > > Maybe as part of a developer iterative flow it would be nice
> to not
> > > > > have
> > > > > > > to re-flash the prior stage to change a DT, and just do it in
> > > U-Boot
> > > > > > > until things are happy, but I'm not sure what the use case is
> for
> > > > > > > overriding the previous stage.
> > > > > > >
> > > > > > > Especially since the pushback on this series I think has all
> been
> > > "why
> > > > > > > are we copying in a tree to build with?  We don't want to use
> it
> > > at run
> > > > > > > time!".  And then softer push back like "Well, U-Boot says we
> have
> > > to
> > > > > > > include the device tree file here, but we won't use it...".
> > > > > >
> > > > > > See below.
> > > > > >
> > > > > > >
> > > > > > > > I believe we have got unstuck because OF_BOARD (perhaps
> > > > > inadvertently)
> > > > > > > > provided a way to entirely omit a devicetree from U-Boot,
> thus
> > > making
> > > > > > > > things like binman and U-Boot /config impossible, for
> example.
> > > So I
> > > > > > > > want to claw that back, so there is always some sort of
> > > devicetree in
> > > > > > > > U-Boot, as we have for rpi_3, etc.
> > > > > > >
> > > > > > > I really want to see what the binary case looks like since we
> could
> > > > > then
> > > > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if w=
e
> > > could
> > > > > > > then also do a rpi_arm32_defconfig too.
> > > > > > >
> > > > > > > I want to see less device trees in U-Boot sources, if they ca=
n
> come
> > > > > > > functionally correct from the hardware/our caller.
> > > > > > >
> > > > > > > And I'm not seeing how we make use of "U-Boot /config" if we
> also
> > > don't
> > > > > > > use the device tree from build time at run time, ignoring the
> > > device
> > > > > > > tree provided to us at run time by the caller.
> > > > > >
> > > > > > Firstly I should say that I find building firmware very messy a=
nd
> > > > > > confusing these days. Lots of things to build and it's hard to
> find
> > > > > > the instructions. It doesn't have to be that way, but if we
> carry on
> > > > > > as we are, it will continue to be messy and in five years you
> will
> > > > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > > > objective here is to simplify things, bringing some consistency
> to
> > > the
> > > > > > different components. Binman was one effort there. I feel that
> > > putting
> > > > > > at least the U-Boot house in order, in my role as devicetree
> > > > > > maintainer (and as author of devicetree support in U-Boot back =
in
> > > > > > 2011), is the next step.
> > > > >
> > > > > Yes, it's Not Great.  I don't like my handful of build-BOARD.sh
> scripts
> > > > > that know where to grab other known-good binaries of varying
> licenses
> > > > > that are needed to assemble something that boots.
> > > > >
> > > > > > If we set things up correctly and agree on the bindings,
> devicetree
> > > > > > can be the unifying configuration mechanism through the whole o=
f
> > > > > > firmware (except for very early bits) and into the OS, this wil=
l
> set
> > > > > > us up very well to deal with the complexity that is coming.
> > > > > >
> > > > > > Anyway, here are the mental steps that I've gone through over t=
he
> > > past
> > > > > > two months:
> > > > > >
> > > > > > Step 1: At present, some people think U-Boot is not even allowe=
d
> to
> > > > > > have its own nodes/properties in the DT.
> > > >
> > > > In my view U-Boot shall be able to leverage device tree format
> (source
> > > and
> > > > binary) to store its own data.
> > > > When you say "the" DT, I always think this is "the" DT that is
> passed to
> > > OS
> > > > and in "that" DT, there should be no U-Boot entries.
> > >
> > > Why not?  As long as the device tree validates, it is perfectly fine
> > > to have additional nodes and properties present.  The propertiesand
> > > nodes will be simply ignored by the OS.
> >
> > Because of the way we want to organize the firmware supply chain: when
> the
> > board is built, it is "attached" a device tree.
> > At that moment, we don't know what "non trusted firmware" will be used.
> It
> > could be U-Boot or LinuxBoot (https://www.linuxboot.org) or even EDK2
> (yes
> > it works with DT).
> > And we aim at keeping device tree as close to the original intent:
> hardware
> > description only. It's not because we can stuff anything in the DT and
> that
> > it is simple to do that we should.
> > Driver parameters shall be in the OS facility built for that purpose.
> Using
> > device tree has been an ugly habit.
>
> So we're going to continue to re-litigate what does and doesn't live in
> the device tree for forever, aren't we?  To continue to be clear, I'm
> not saying that non-upstream bindings should be present.  But for
> example, Simon is working on the "U-Boot config node" binding, which is
> going to get re-spun next as /options/ as I read the thread right.
> Populate it and anyone can read it, and probably be getting information
> that's useful to U-Boot or LinuxBoot or EDK2 or anyone else.  That's why
> I keep repeating that projects need to push bindings upstream.  I'll
> repeat my comment about
>
> https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index=
.html
> and the binman node both noting a common problem to solve.

i think you are right. Now tfa is comfortable being its own upstream for
the binding specifications. Could U-Boot community be comfortable doing so?
Now I also recognize that DT specification state is far from clean. If you
want full story on PCI ECAM you need Linux/documentation and IEEE text
(kind of hosted on DT.org but not easily browasable to). In the long run it
may be much better to have all bindings (including U-Boot ones) in DT.org.
We should also have information from Qemu about the DT it generates for all
its devices and how it is associated to command line .

>
>
> In so far as there's objections to "U-Boot" nodes, it seems to me like
> it comes down to "shouldn't need U-Boot internals expressed in DT nor
> added to the DTB by someone else".  And I've not objected to that
> either.  But I think we do have a subset of "how do we express ..."
> issues that have come down to "well, we buried the bodies over at ...
> before".  And it's time to dig them up and give them a proper burial
> perhaps now :)
>
> --
> Tom
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--00000000000072ddf305cf5cba64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Tom</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 27 oct. 2021 =C3=A0 21:06, Tom R=
ini &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsulko.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Oct 27, 2=
021 at 06:02:19PM +0200, Fran=C3=A7ois Ozog wrote:<br>
&gt; Hi Mark,<br>
&gt; <br>
&gt; On Wed, 27 Oct 2021 at 17:10, Mark Kettenis &lt;<a href=3D"mailto:mark=
.kettenis@xs4all.nl" target=3D"_blank">mark.kettenis@xs4all.nl</a>&gt; wrot=
e:<br>
&gt; <br>
&gt; &gt; &gt; From: Fran=C3=A7ois Ozog &lt;<a href=3D"mailto:francois.ozog=
@linaro.org" target=3D"_blank">francois.ozog@linaro.org</a>&gt;<br>
&gt; &gt; &gt; Date: Wed, 27 Oct 2021 15:15:01 +0200<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, 27 Oct 2021 at 14:48, Tom Rini &lt;<a href=3D"mailto=
:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; Hi all,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Thu, 14 Oct 2021 at 09:28, Tom Rini &lt;<a href=
=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Thu, Oct 14, 2021 at 09:17:52AM -0600, Sim=
on Glass wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Tom,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Thu, 14 Oct 2021 at 08:56, Tom Rini &=
lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@konsulko.c=
om</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Wed, Oct 13, 2021 at 12:06:02PM =
-0600, Simon Glass wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Fran=C3=A7ois,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Wed, 13 Oct 2021 at 11:35, =
Fran=C3=A7ois Ozog &lt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:francois.ozog@linaro.org" target=3D"_=
blank">francois.ozog@linaro.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Simon<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Le mer. 13 oct. 2021 =C3=
=A0 16:49, Simon Glass &lt;<br>
&gt; &gt; <a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromiu=
m.org</a>&gt;<br>
&gt; &gt; &gt; &gt; a =C3=A9crit :<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Hi Tom, Bin,Fran=C3=
=A7ois,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; On Tue, 12 Oct 2021 a=
t 19:34, Tom Rini &lt;<br>
&gt; &gt; <a href=3D"mailto:trini@konsulko.com" target=3D"_blank">trini@kon=
sulko.com</a>&gt;<br>
&gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; On Wed, Oct 13, =
2021 at 09:29:14AM +0800, Bin Meng<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; Hi Simon,<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; On Wed, Oct=
 13, 2021 at 9:01 AM Simon Glass &lt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:sjg@chromium.org" target=3D"_blank">s=
jg@chromium.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; With I=
lias&#39; efforts we have dropped OF_PRIOR_STAGE<br>
&gt; &gt; and<br>
&gt; &gt; &gt; &gt; OF_HOSTFILE so<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; there =
are only three ways to obtain a devicetree:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =
=C2=A0 - OF_SEPARATE - the normal way, where the<br>
&gt; &gt; devicetree<br>
&gt; &gt; &gt; &gt; is built and<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =
=C2=A0 - OF_EMBED - for development purposes, the<br>
&gt; &gt; &gt; &gt; devicetree is embedded in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0the ELF file (also used for EFI)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;=C2=A0 =
=C2=A0 - OF_BOARD - the board figures it out on its own<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; The la=
st one is currently set up so that no<br>
&gt; &gt; devicetree<br>
&gt; &gt; &gt; &gt; is needed at all<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; in the=
 U-Boot tree. Most boards do provide one, but<br>
&gt; &gt; &gt; &gt; some don&#39;t. Some<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; don&#3=
9;t even provide instructions on how to boot on<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; board.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; The pr=
oblems with this approach are documented at<br>
&gt; &gt; [1].<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; In pra=
ctice, OF_BOARD is not really distinct from<br>
&gt; &gt; &gt; &gt; OF_SEPARATE. Any board<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; can ob=
tain its devicetree at runtime, even it is<br>
&gt; &gt; has a<br>
&gt; &gt; &gt; &gt; devicetree built<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; in U-B=
oot. This is because U-Boot may be a<br>
&gt; &gt; second-stage<br>
&gt; &gt; &gt; &gt; bootloader and its<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; caller=
 may have a better idea about the hardware<br>
&gt; &gt; &gt; &gt; available in the machine.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; This i=
s the case with a few QEMU boards, for<br>
&gt; &gt; example.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; So it =
makes no sense to have OF_BOARD as a<br>
&gt; &gt; &#39;choice&#39;. It<br>
&gt; &gt; &gt; &gt; should be an<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; option=
, available with either OF_SEPARATE or<br>
&gt; &gt; OF_EMBED.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; This s=
eries makes this change, adding various<br>
&gt; &gt; missing<br>
&gt; &gt; &gt; &gt; devicetree files<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; &gt; (and p=
laceholders) to make the build work.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; Adding devi=
ce trees that are never used sounds like a<br>
&gt; &gt; &gt; &gt; hack to me.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; For QEMU, d=
evice tree is dynamically generated on the<br>
&gt; &gt; fly<br>
&gt; &gt; &gt; &gt; based on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; command lin=
e parameters, and the device tree you put<br>
&gt; &gt; in<br>
&gt; &gt; &gt; &gt; this series<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; has various=
 hardcoded &lt;phandle&gt; values which normally<br>
&gt; &gt; do<br>
&gt; &gt; &gt; &gt; not show up<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; in hand-wri=
tten dts files.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; &gt; I am not su=
re I understand the whole point of this.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; I am also confus=
ed and do not like the idea of adding<br>
&gt; &gt; &gt; &gt; device trees for<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; platforms that a=
re capable of and can / do have a device<br>
&gt; &gt; &gt; &gt; tree to give us<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; &gt; at run time.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; (I&#39;ll just reply =
to this one email, since the same points<br>
&gt; &gt; &gt; &gt; applies to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; all replies I think)<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; I have been thinking =
about this and discussing it with<br>
&gt; &gt; people<br>
&gt; &gt; &gt; &gt; for a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; few months now. I&#39=
;ve been signalling a change like this<br>
&gt; &gt; for<br>
&gt; &gt; &gt; &gt; over a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; month now, on U-Boot =
contributor calls and in discussions<br>
&gt; &gt; &gt; &gt; with Linaro<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; people. I sent a patc=
h (below) to try to explain things. I<br>
&gt; &gt; &gt; &gt; hope it is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; not a surprise!<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; The issue here is tha=
t we need a devicetree in-tree in<br>
&gt; &gt; &gt; &gt; U-Boot, to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; avoid the mess that h=
as been created by OF_PRIOR_STAGE,<br>
&gt; &gt; &gt; &gt; OF_BOARD,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BINMAN_STANDALONE_FDT=
 and to a lesser extent, OF_HOSTFILE.<br>
&gt; &gt; &gt; &gt; Between<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Ilias&#39; series and=
 this one we can get ourselves on a<br>
&gt; &gt; stronger<br>
&gt; &gt; &gt; &gt; footing.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; There is just OF_SEPA=
RATE, with OF_EMBED for debugging/ELF<br>
&gt; &gt; &gt; &gt; use.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; For more context:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"http://patchwork.ozlabs.org/project/uboot/patch/202109=
19215111.3830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_blank">=
http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sj=
g@chromium.org/</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; BTW I did suggest to =
QEMU ARM that they support a way of<br>
&gt; &gt; &gt; &gt; adding the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; u-boot.dtsi but there=
 was not much interest there (in<br>
&gt; &gt; fact the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; maintainer would pref=
er there was no special support even<br>
&gt; &gt; for<br>
&gt; &gt; &gt; &gt; booting<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Linux directly!)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; i understand their point =
of view and agree with it.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; But in any case it do=
esn&#39;t really help U-Boot. I<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; think the path forwar=
d might be to run QEMU twice, once to<br>
&gt; &gt; &gt; &gt; get its<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; generated tree and on=
ce to give the &#39;merged&#39; tree with the<br>
&gt; &gt; &gt; &gt; U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; properties in it, if =
people want to use U-Boot features.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; I do strongly believe=
 that OF_BOARD must be a run-time<br>
&gt; &gt; &gt; &gt; option, not a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; build-time one. It cr=
eates all sorts of problems and<br>
&gt; &gt; &gt; &gt; obscurity which<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; have taken months to =
unpick. See the above patch for the<br>
&gt; &gt; &gt; &gt; rationale.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; To add to that ration=
ale, OF_BOARD needs to be an option<br>
&gt; &gt; &gt; &gt; available to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; any board. At some po=
int in the future it may become a<br>
&gt; &gt; common<br>
&gt; &gt; &gt; &gt; way<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; things are done, e.g.=
 TF-A calling U-Boot and providing a<br>
&gt; &gt; &gt; &gt; devicetree<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; to it. It doesn&#39;t=
 make any sense to have people decide<br>
&gt; &gt; &gt; &gt; whether or not<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; to set OF_BOARD at bu=
ild time, thus affecting how the<br>
&gt; &gt; image<br>
&gt; &gt; &gt; &gt; is put<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; together. We&#39;ll e=
nd up with different U-Boot build targets<br>
&gt; &gt; &gt; &gt; like<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; capricorn, capricorn_=
of_board and the like. It should be<br>
&gt; &gt; &gt; &gt; obvious where<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; that will lead. Inste=
ad, OF_BOARD needs to become a<br>
&gt; &gt; commonly<br>
&gt; &gt; &gt; &gt; used<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; option, perhaps enabl=
ed by most/all boards, so that this<br>
&gt; &gt; sort<br>
&gt; &gt; &gt; &gt; of build<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; explosion is not need=
ed.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; If you mean that when boa=
rds are by construction providing<br>
&gt; &gt; a<br>
&gt; &gt; &gt; &gt; DTB to U-Boot then I agree very much. But I don=E2=80=
=99t understand how the<br>
&gt; &gt; patch<br>
&gt; &gt; &gt; &gt; set=C2=A0 supports it as it puts dts files for those bo=
ards to be built.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; U-Boot needs to be fl=
exible enough to<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; function correctly in=
 whatever runtime environment in<br>
&gt; &gt; which<br>
&gt; &gt; &gt; &gt; it finds<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; itself.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Also as binman is pre=
ssed into service more and more to<br>
&gt; &gt; build<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; complex firmware imag=
es that are becoming fashionable, it<br>
&gt; &gt; &gt; &gt; needs a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; definition (in the de=
vicetree) that describes how to<br>
&gt; &gt; create<br>
&gt; &gt; &gt; &gt; the image.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; We can&#39;t support =
that unless we are building a devicetree,<br>
&gt; &gt; &gt; &gt; nor can the<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; running program acces=
s the image layout without that<br>
&gt; &gt; &gt; &gt; information.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; Fran=C3=A7ois&#39;s p=
oint about &#39;don&#39;t use this with any kernel&#39; is<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; germane...but of cour=
se I am not suggesting doing that,<br>
&gt; &gt; since<br>
&gt; &gt; &gt; &gt; OF_BOARD<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; is, still, enabled. W=
e already use OF_BOARD for various<br>
&gt; &gt; &gt; &gt; boards that<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; include an in-tree de=
vicetree - Raspberry Pi 1, 2 and 3,<br>
&gt; &gt; for<br>
&gt; &gt; &gt; &gt; example<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; (as I said in the cov=
er letter &quot;Most boards do provide<br>
&gt; &gt; one,<br>
&gt; &gt; &gt; &gt; but some<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; don&#39;t.&quot;). So=
 this series is just completing the picture by<br>
&gt; &gt; &gt; &gt; enforcing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;&gt; that *some sort* of d=
evicetree is always present.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; That seems inconsistent w=
ith the OF_BOARD becomes the<br>
&gt; &gt; default.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I think the key point that wil=
l get you closer to where I am<br>
&gt; &gt; on<br>
&gt; &gt; &gt; &gt; this<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; issue, is that OF_BOARD needs =
to be a run-time option. At<br>
&gt; &gt; &gt; &gt; present it<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; has build-time effects and thi=
s is quite wrong. If you go<br>
&gt; &gt; &gt; &gt; through all<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the material I have written on=
 this I think I have motivated<br>
&gt; &gt; &gt; &gt; that very<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; clearly.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Another big issue is that I be=
lieve we need ONE devicetree<br>
&gt; &gt; for<br>
&gt; &gt; &gt; &gt; U-Boot,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; not two that get merged by U-B=
oot. Again I have gone through<br>
&gt; &gt; &gt; &gt; that in a<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; lot of detail.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; I have a long long reply to your fi=
rst reply here saved, but,<br>
&gt; &gt; maybe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; here&#39;s the biggest sticking poi=
nt.=C2=A0 To be clear, you agree that<br>
&gt; &gt; &gt; &gt; U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; needs to support being passed a dev=
ice tree to use, at run<br>
&gt; &gt; time,<br>
&gt; &gt; &gt; &gt; yes?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Yes. The OF_BOARD feature provides this.=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; And in that case, would not be usin=
g the &quot;fake&quot; tree we built<br>
&gt; &gt; in?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Not at runtime.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; OK.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; So is the sticking point here that =
we really have two classes<br>
&gt; &gt; of<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; devices, one class where we will ne=
ver ever be given the device<br>
&gt; &gt; &gt; &gt; tree at<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; run time (think BeagleBone Black) a=
nd one where we will always<br>
&gt; &gt; be<br>
&gt; &gt; &gt; &gt; given<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; one at run time (think Raspberry Pi=
) ?<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I&#39;m not sure it will be that black a=
nd white. I suspect there<br>
&gt; &gt; will be<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; (many) boards which can boot happily wit=
h the U-Boot devicetree<br>
&gt; &gt; but<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; can also accept one at runtime, if provi=
ded. For example, you may<br>
&gt; &gt; &gt; &gt; want<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; to boot with or without TF-A or some oth=
er, earlier stage.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I&#39;m not sure I see the value in making th=
is a gray area.=C2=A0 There&#39;s<br>
&gt; &gt; very<br>
&gt; &gt; &gt; &gt; &gt; &gt; much a class of &quot;never&quot; boards.=C2=
=A0 There&#39;s also the class of &quot;can&quot;<br>
&gt; &gt; today.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Maybe as part of a developer iterative flow i=
t would be nice to not<br>
&gt; &gt; &gt; &gt; have<br>
&gt; &gt; &gt; &gt; &gt; &gt; to re-flash the prior stage to change a DT, a=
nd just do it in<br>
&gt; &gt; U-Boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; until things are happy, but I&#39;m not sure =
what the use case is for<br>
&gt; &gt; &gt; &gt; &gt; &gt; overriding the previous stage.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Especially since the pushback on this series =
I think has all been<br>
&gt; &gt; &quot;why<br>
&gt; &gt; &gt; &gt; &gt; &gt; are we copying in a tree to build with?=C2=A0=
 We don&#39;t want to use it<br>
&gt; &gt; at run<br>
&gt; &gt; &gt; &gt; &gt; &gt; time!&quot;.=C2=A0 And then softer push back =
like &quot;Well, U-Boot says we have<br>
&gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; include the device tree file here, but we won=
&#39;t use it...&quot;.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; See below.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; I believe we have got unstuck because OF=
_BOARD (perhaps<br>
&gt; &gt; &gt; &gt; inadvertently)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; provided a way to entirely omit a device=
tree from U-Boot, thus<br>
&gt; &gt; making<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; things like binman and U-Boot /config im=
possible, for example.<br>
&gt; &gt; So I<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; want to claw that back, so there is alwa=
ys some sort of<br>
&gt; &gt; devicetree in<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; U-Boot, as we have for rpi_3, etc.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I really want to see what the binary case loo=
ks like since we could<br>
&gt; &gt; &gt; &gt; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; kill off rpi_{3,3_b,4}_defconfig and I would =
need to see if we<br>
&gt; &gt; could<br>
&gt; &gt; &gt; &gt; &gt; &gt; then also do a rpi_arm32_defconfig too.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I want to see less device trees in U-Boot sou=
rces, if they can come<br>
&gt; &gt; &gt; &gt; &gt; &gt; functionally correct from the hardware/our ca=
ller.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; And I&#39;m not seeing how we make use of &qu=
ot;U-Boot /config&quot; if we also<br>
&gt; &gt; don&#39;t<br>
&gt; &gt; &gt; &gt; &gt; &gt; use the device tree from build time at run ti=
me, ignoring the<br>
&gt; &gt; device<br>
&gt; &gt; &gt; &gt; &gt; &gt; tree provided to us at run time by the caller=
.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Firstly I should say that I find building firmware=
 very messy and<br>
&gt; &gt; &gt; &gt; &gt; confusing these days. Lots of things to build and =
it&#39;s hard to find<br>
&gt; &gt; &gt; &gt; &gt; the instructions. It doesn&#39;t have to be that w=
ay, but if we carry on<br>
&gt; &gt; &gt; &gt; &gt; as we are, it will continue to be messy and in fiv=
e years you will<br>
&gt; &gt; &gt; &gt; &gt; need a Ph.D and a lucky charm to boot on any moder=
n board. My<br>
&gt; &gt; &gt; &gt; &gt; objective here is to simplify things, bringing som=
e consistency to<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; different components. Binman was one effort there.=
 I feel that<br>
&gt; &gt; putting<br>
&gt; &gt; &gt; &gt; &gt; at least the U-Boot house in order, in my role as =
devicetree<br>
&gt; &gt; &gt; &gt; &gt; maintainer (and as author of devicetree support in=
 U-Boot back in<br>
&gt; &gt; &gt; &gt; &gt; 2011), is the next step.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Yes, it&#39;s Not Great.=C2=A0 I don&#39;t like my hand=
ful of build-BOARD.sh scripts<br>
&gt; &gt; &gt; &gt; that know where to grab other known-good binaries of va=
rying licenses<br>
&gt; &gt; &gt; &gt; that are needed to assemble something that boots.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; If we set things up correctly and agree on the bin=
dings, devicetree<br>
&gt; &gt; &gt; &gt; &gt; can be the unifying configuration mechanism throug=
h the whole of<br>
&gt; &gt; &gt; &gt; &gt; firmware (except for very early bits) and into the=
 OS, this will set<br>
&gt; &gt; &gt; &gt; &gt; us up very well to deal with the complexity that i=
s coming.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Anyway, here are the mental steps that I&#39;ve go=
ne through over the<br>
&gt; &gt; past<br>
&gt; &gt; &gt; &gt; &gt; two months:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Step 1: At present, some people think U-Boot is no=
t even allowed to<br>
&gt; &gt; &gt; &gt; &gt; have its own nodes/properties in the DT.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In my view U-Boot shall be able to leverage device tree form=
at (source<br>
&gt; &gt; and<br>
&gt; &gt; &gt; binary) to store its own data.<br>
&gt; &gt; &gt; When you say &quot;the&quot; DT, I always think this is &quo=
t;the&quot; DT that is passed to<br>
&gt; &gt; OS<br>
&gt; &gt; &gt; and in &quot;that&quot; DT, there should be no U-Boot entrie=
s.<br>
&gt; &gt;<br>
&gt; &gt; Why not?=C2=A0 As long as the device tree validates, it is perfec=
tly fine<br>
&gt; &gt; to have additional nodes and properties present.=C2=A0 The proper=
tiesand<br>
&gt; &gt; nodes will be simply ignored by the OS.<br>
&gt;<br>
&gt; Because of the way we want to organize the firmware supply chain: when=
 the<br>
&gt; board is built, it is &quot;attached&quot; a device tree.<br>
&gt; At that moment, we don&#39;t know what &quot;non trusted firmware&quot=
; will be used. It<br>
&gt; could be U-Boot or LinuxBoot (<a href=3D"https://www.linuxboot.org" re=
l=3D"noreferrer" target=3D"_blank">https://www.linuxboot.org</a>) or even E=
DK2 (yes<br>
&gt; it works with DT).<br>
&gt; And we aim at keeping device tree as close to the original intent: har=
dware<br>
&gt; description only. It&#39;s not because we can stuff anything in the DT=
 and that<br>
&gt; it is simple to do that we should.<br>
&gt; Driver parameters shall be in the OS facility built for that purpose. =
Using<br>
&gt; device tree has been an ugly habit.<br>
<br>
So we&#39;re going to continue to re-litigate what does and doesn&#39;t liv=
e in<br>
the device tree for forever, aren&#39;t we?=C2=A0 To continue to be clear, =
I&#39;m<br>
not saying that non-upstream bindings should be present.=C2=A0 But for<br>
example, Simon is working on the &quot;U-Boot config node&quot; binding, wh=
ich is<br>
going to get re-spun next as /options/ as I read the thread right.<br>
Populate it and anyone can read it, and probably be getting information<br>
that&#39;s useful to U-Boot or LinuxBoot or EDK2 or anyone else.=C2=A0 That=
&#39;s why<br>
I keep repeating that projects need to push bindings upstream.=C2=A0 I&#39;=
ll<br>
repeat my comment about<br>
<a href=3D"https://trustedfirmware-a.readthedocs.io/en/latest/components/fc=
onf/index.html" rel=3D"noreferrer" target=3D"_blank">https://trustedfirmwar=
e-a.readthedocs.io/en/latest/components/fconf/index.html</a><br>
and the binman node both noting a common problem to solve.</blockquote><div=
 dir=3D"auto">i think you are right. Now tfa is comfortable being its own u=
pstream for the binding specifications. Could U-Boot community be comfortab=
le doing so?</div><div dir=3D"auto">Now I also recognize that DT specificat=
ion state is far from clean. If you want full story on PCI ECAM you need Li=
nux/documentation and IEEE text (kind of hosted on DT.org but not easily br=
owasable to). In the long run it may be much better to have all bindings (i=
ncluding U-Boot ones) in DT.org.=C2=A0</div><div dir=3D"auto">We should als=
o have information from Qemu about the DT it generates for all its devices =
and how it is associated to command line .</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex" dir=3D"auto"><br>
<br>
In so far as there&#39;s objections to &quot;U-Boot&quot; nodes, it seems t=
o me like<br>
it comes down to &quot;shouldn&#39;t need U-Boot internals expressed in DT =
nor<br>
added to the DTB by someone else&quot;.=C2=A0 And I&#39;ve not objected to =
that<br>
either.=C2=A0 But I think we do have a subset of &quot;how do we express ..=
.&quot;<br>
issues that have come down to &quot;well, we buried the bodies over at ...<=
br>
before&quot;.=C2=A0 And it&#39;s time to dig them up and give them a proper=
 burial<br>
perhaps now :)<br>
<br>
-- <br>
Tom<br>
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

--00000000000072ddf305cf5cba64--

