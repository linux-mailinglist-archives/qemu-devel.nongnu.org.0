Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216D42DC8F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 16:58:47 +0200 (CEST)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb2Bx-0004rV-MK
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 10:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mb29u-00046M-Te
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 10:56:39 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:37415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mb29p-0007jM-3W
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 10:56:38 -0400
Received: by mail-qk1-x72c.google.com with SMTP id bl14so5675650qkb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JJlJlWnWHPEHuZhLZDrvVcK4s/9t1luNJh3IAjIpxm4=;
 b=f2uNOAp0lDh6xKZx7YL2Qqg0+qTLCPxQLx60V5kLepCStQIYTEUrSUNIY5fdkpKUN3
 9HFPFYYRdeg9Q0m3Fin1CBlulszn8hKAAtp2/ZDhHdQajf5agPsRFUt7A2CJ39mVc6Gl
 OzMP6/xqZP2Gakg5FTJvpiSMK4E6HHhwptVJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JJlJlWnWHPEHuZhLZDrvVcK4s/9t1luNJh3IAjIpxm4=;
 b=gouWyeED0mvezVusvBZDTdCuJzhgs1V23k8OnEKzY/+TE7vjcjQXigNzd6C3Kv5Nev
 L905R0xtqXTEMQ2iDonoZM1e1C5ubfXngQ6yr1AK8hdyHAQTD/7xr3rXtzC7Q5rr143g
 Z2wek970rbgk6v2+SqZrE9KPhDHLJpnaVyfrCR32yA+hhEeLRw5iYlFHa+0dBS6+KuN/
 3rWpu4cgQyJ2EfkW9LMXgpl+03YmebbyIASC6XljYqkhNi/ZyrZiY+NJWULmXGwu8L+a
 VUwh55LJ6/oppJcGV6bQKp8NjcB0jm5dpHbUnMOF45TIDJchb2cRmcpgytx9qBH/I8Dm
 FNow==
X-Gm-Message-State: AOAM5323g0ZhpSafbWQHaiNQB/mwTEX9RmBMCugB+TOBoQ7JK5tVpDY4
 B0J1k1bnqiC4q4nCi70eZWDSyw==
X-Google-Smtp-Source: ABdhPJzKl0DSbAlOjgSnu0aJrlMhcaEd95cggkaq2tIJqVT3Q0fAhq9xoe+aztXq8eP2anQ5Tq3eBQ==
X-Received: by 2002:a37:a546:: with SMTP id o67mr5135251qke.24.1634223391344; 
 Thu, 14 Oct 2021 07:56:31 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0d65-5385-0e85-d408.res6.spectrum.com.
 [2603:6081:7b01:cbda:d65:5385:e85:d408])
 by smtp.gmail.com with ESMTPSA id f29sm1470027qtg.42.2021.10.14.07.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 07:56:30 -0700 (PDT)
Date: Thu, 14 Oct 2021 10:56:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <20211014145626.GC7964@bill-the-cat>
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
 <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JdGOiFbZO3d8tZZp"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=trini@konsulko.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
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
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JdGOiFbZO3d8tZZp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
> Hi Fran=C3=A7ois,
>=20
> On Wed, 13 Oct 2021 at 11:35, Fran=C3=A7ois Ozog <francois.ozog@linaro.or=
g> wrote:
> >
> > Hi Simon
> >
> > Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org> a =C3=
=A9crit :
> >>
> >> Hi Tom, Bin,Fran=C3=A7ois,
> >>
> >> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrote:
> >> >
> >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> >> > > Hi Simon,
> >> > >
> >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wro=
te:
> >> > > >
> >> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFI=
LE so
> >> > > > there are only three ways to obtain a devicetree:
> >> > > >
> >> > > >    - OF_SEPARATE - the normal way, where the devicetree is built=
 and
> >> > > >       appended to U-Boot
> >> > > >    - OF_EMBED - for development purposes, the devicetree is embe=
dded in
> >> > > >       the ELF file (also used for EFI)
> >> > > >    - OF_BOARD - the board figures it out on its own
> >> > > >
> >> > > > The last one is currently set up so that no devicetree is needed=
 at all
> >> > > > in the U-Boot tree. Most boards do provide one, but some don't. =
Some
> >> > > > don't even provide instructions on how to boot on the board.
> >> > > >
> >> > > > The problems with this approach are documented at [1].
> >> > > >
> >> > > > In practice, OF_BOARD is not really distinct from OF_SEPARATE. A=
ny board
> >> > > > can obtain its devicetree at runtime, even it is has a devicetre=
e built
> >> > > > in U-Boot. This is because U-Boot may be a second-stage bootload=
er and its
> >> > > > caller may have a better idea about the hardware available in th=
e machine.
> >> > > > This is the case with a few QEMU boards, for example.
> >> > > >
> >> > > > So it makes no sense to have OF_BOARD as a 'choice'. It should b=
e an
> >> > > > option, available with either OF_SEPARATE or OF_EMBED.
> >> > > >
> >> > > > This series makes this change, adding various missing devicetree=
 files
> >> > > > (and placeholders) to make the build work.
> >> > >
> >> > > Adding device trees that are never used sounds like a hack to me.
> >> > >
> >> > > For QEMU, device tree is dynamically generated on the fly based on
> >> > > command line parameters, and the device tree you put in this series
> >> > > has various hardcoded <phandle> values which normally do not show =
up
> >> > > in hand-written dts files.
> >> > >
> >> > > I am not sure I understand the whole point of this.
> >> >
> >> > I am also confused and do not like the idea of adding device trees f=
or
> >> > platforms that are capable of and can / do have a device tree to giv=
e us
> >> > at run time.
> >>
> >> (I'll just reply to this one email, since the same points applies to
> >> all replies I think)
> >>
> >> I have been thinking about this and discussing it with people for a
> >> few months now. I've been signalling a change like this for over a
> >> month now, on U-Boot contributor calls and in discussions with Linaro
> >> people. I sent a patch (below) to try to explain things. I hope it is
> >> not a surprise!
> >>
> >> The issue here is that we need a devicetree in-tree in U-Boot, to
> >> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,
> >> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between
> >> Ilias' series and this one we can get ourselves on a stronger footing.
> >> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
> >> For more context:
> >>
> >> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278=
-3-sjg@chromium.org/
> >>
> >> BTW I did suggest to QEMU ARM that they support a way of adding the
> >> u-boot.dtsi but there was not much interest there (in fact the
> >> maintainer would prefer there was no special support even for booting
> >> Linux directly!)
> >
> > i understand their point of view and agree with it.
> >>
> >> But in any case it doesn't really help U-Boot. I
> >> think the path forward might be to run QEMU twice, once to get its
> >> generated tree and once to give the 'merged' tree with the U-Boot
> >> properties in it, if people want to use U-Boot features.
> >>
> >> I do strongly believe that OF_BOARD must be a run-time option, not a
> >> build-time one. It creates all sorts of problems and obscurity which
> >> have taken months to unpick. See the above patch for the rationale.
> >>
> >> To add to that rationale, OF_BOARD needs to be an option available to
> >> any board. At some point in the future it may become a common way
> >> things are done, e.g. TF-A calling U-Boot and providing a devicetree
> >> to it. It doesn't make any sense to have people decide whether or not
> >> to set OF_BOARD at build time, thus affecting how the image is put
> >> together. We'll end up with different U-Boot build targets like
> >> capricorn, capricorn_of_board and the like. It should be obvious where
> >> that will lead. Instead, OF_BOARD needs to become a commonly used
> >> option, perhaps enabled by most/all boards, so that this sort of build
> >> explosion is not needed.
> >
> > If you mean that when boards are by construction providing a DTB to U-B=
oot then I agree very much. But I don=E2=80=99t understand how the patch se=
t  supports it as it puts dts files for those boards to be built.
> >>
> >> U-Boot needs to be flexible enough to
> >> function correctly in whatever runtime environment in which it finds
> >> itself.
> >>
> >> Also as binman is pressed into service more and more to build the
> >> complex firmware images that are becoming fashionable, it needs a
> >> definition (in the devicetree) that describes how to create the image.
> >> We can't support that unless we are building a devicetree, nor can the
> >> running program access the image layout without that information.
> >>
> >> Fran=C3=A7ois's point about 'don't use this with any kernel' is
> >> germane...but of course I am not suggesting doing that, since OF_BOARD
> >> is, still, enabled. We already use OF_BOARD for various boards that
> >> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for example
> >> (as I said in the cover letter "Most boards do provide one, but some
> >> don't."). So this series is just completing the picture by enforcing
> >> that *some sort* of devicetree is always present.
> >
> > That seems inconsistent with the OF_BOARD becomes the default.
>=20
> I think the key point that will get you closer to where I am on this
> issue, is that OF_BOARD needs to be a run-time option. At present it
> has build-time effects and this is quite wrong. If you go through all
> the material I have written on this I think I have motivated that very
> clearly.
>=20
> Another big issue is that I believe we need ONE devicetree for U-Boot,
> not two that get merged by U-Boot. Again I have gone through that in a
> lot of detail.

I have a long long reply to your first reply here saved, but, maybe
here's the biggest sticking point.  To be clear, you agree that U-Boot
needs to support being passed a device tree to use, at run time, yes?

And in that case, would not be using the "fake" tree we built in?

So is the sticking point here that we really have two classes of
devices, one class where we will never ever be given the device tree at
run time (think BeagleBone Black) and one where we will always be given
one at run time (think Raspberry Pi) ?

--=20
Tom

--JdGOiFbZO3d8tZZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFoRRcACgkQFHw5/5Y0
tyzyyAv+INQAZi12/ac0LgpOevOWMVAmr3LSuI1B2Jaf1WPkMx9r4JwghNykRrug
4FuAhp2JzuqlKV77jtnee7DnGeyvTysmyK9FdYmBtPuWhGGI2EH3LL8zK5mtXQEf
p71vsvsMI93oPRwXGztEZvpdDqFVvVmoaEdbeq3ngg4B1g6pL100dCsjunkuFFU0
cfJhoeJwczceujgkCl64yMyeYswybIeSpEiKGdvZyMIi0c1iXTpt6hqChw13VV7d
yzxTflhQg3iLzuxaHSyWHVTAD8NAfePbOZLWkA6eibcRpFtAq0SUlLB9FlB5Fd1k
y4ubPVG7rTxxD9rf/napygxLTBq2PVnQOx9wPqTFA5lpeE3EP2obxxN1tqTjQE5N
n6WdGbZoknH/MszZWXtou7gCi5ia1PvVxW/6sOqclpxgOpxxHV/IXdtos525wKWV
fPPCUfSa5JrDAS9PaILh9oXgrjVblFoV09gWsHaTF7TV1p7r0uA/PzVbJUQDrupb
RLJx/tik
=/IDy
-----END PGP SIGNATURE-----

--JdGOiFbZO3d8tZZp--

