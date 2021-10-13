Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA68B42C7C0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:37:17 +0200 (CEST)
Received: from localhost ([::1]:41208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maiBo-0006Fe-MN
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mai9p-00044V-1W
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:35:14 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francois.ozog@linaro.org>)
 id 1mai9m-0001Tq-04
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:35:12 -0400
Received: by mail-ed1-x52a.google.com with SMTP id p13so13685150edw.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R2WvOoqhbIghO8aKyK2+KSmhyIF+gSA6nIf0bsPVmfs=;
 b=x1gQXX6UoW7q6hZTeIKMPz/CGbwqSZSdEA6irV/cJPVPWpJaaokfJhzyyZAOgWzZBZ
 id77jA4HonEbtWkZHwXgaMgyDq7qtD8vgioQStho/A1pUquAv9YfMZldTR9Myp4gSA0O
 nFIoHUSPGzYFAgqORJx/+Lry9MRXD+av3ZSOsSxebO4a7ahntm/WIDnYehdFvMaXsAlM
 g/J4QcOssNKdk692Ik3T0sTsToNvcLhYcFcxyO+lOlO9VvkHUlY33yure1tsbyONuaWT
 fO+om0pKkjoLoqohUMbCcW6x72PopAk7yJBRdqoXBDdCSuW9smBquPdGgKEa/V1rxPcx
 FDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R2WvOoqhbIghO8aKyK2+KSmhyIF+gSA6nIf0bsPVmfs=;
 b=qn+5SAbm/VtjVXXoGuxekdNvBQT6s3jwThDZYDk3x/C4SdbQXB2GciJYwY4F39eaNG
 ahn0B6d7no0VMN4xkBQ9Btwon3UfiqcNNmamp4h9BjZrtai/R8kvUzNMhLrEOTK/jvf/
 UX8BCkjcZv+ESM/oX+JG1RVaMKHTv0i0aXMojcMl1IgI1yQjT5FVwP6KQuooRetDMkPX
 ctDZAnTRs/xHgIyGQbbaSaVv3WzxgdY4Qdueysuog3r89H4u3N8VkDTZY3ud3jACDa7c
 aOYsNa+3eKWI3ChzEQUn3Zr1WK5hkNN3y8OpYLkYodEdATh7drKUdy0vdL3+w8WDPWBt
 e1Tg==
X-Gm-Message-State: AOAM53260Dgk0f9s3a+ZWYCDDGy7BsyMIB8YrkFCxol/a+Ta+hTwq3yc
 zadcMnGksFt85tYJztQgbjWvPqebjJFMNe1P2W6A+A==
X-Google-Smtp-Source: ABdhPJxLF1NIrsRpEvR8jmmqYRkDrsaVaX68h7Q/nMJd66C3gn7wMCU4+K+Sf0BTHhMqjzMOH0owbjxYxS8SeSt2Lmk=
X-Received: by 2002:a17:906:94da:: with SMTP id
 d26mr661557ejy.213.1634146507995; 
 Wed, 13 Oct 2021 10:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
 <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
 <20211013013450.GJ7964@bill-the-cat>
 <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
In-Reply-To: <CAPnjgZ3D+h1ov2yL73iz_3zmPkJrM4mGrQLhsKL9qu9Ez0-j2A@mail.gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 13 Oct 2021 19:34:57 +0200
Message-ID: <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000001edcfe05ce3f62a1"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=francois.ozog@linaro.org; helo=mail-ed1-x52a.google.com
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

--0000000000001edcfe05ce3f62a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon

Le mer. 13 oct. 2021 =C3=A0 16:49, Simon Glass <sjg@chromium.org> a =C3=A9c=
rit :

> Hi Tom, Bin,Fran=C3=A7ois,
>
> On Tue, 12 Oct 2021 at 19:34, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:
> > > Hi Simon,
> > >
> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wrote:
> > > >
> > > > With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE =
so
> > > > there are only three ways to obtain a devicetree:
> > > >
> > > >    - OF_SEPARATE - the normal way, where the devicetree is built an=
d
> > > >       appended to U-Boot
> > > >    - OF_EMBED - for development purposes, the devicetree is embedde=
d
> in
> > > >       the ELF file (also used for EFI)
> > > >    - OF_BOARD - the board figures it out on its own
> > > >
> > > > The last one is currently set up so that no devicetree is needed at
> all
> > > > in the U-Boot tree. Most boards do provide one, but some don't. Som=
e
> > > > don't even provide instructions on how to boot on the board.
> > > >
> > > > The problems with this approach are documented at [1].
> > > >
> > > > In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any
> board
> > > > can obtain its devicetree at runtime, even it is has a devicetree
> built
> > > > in U-Boot. This is because U-Boot may be a second-stage bootloader
> and its
> > > > caller may have a better idea about the hardware available in the
> machine.
> > > > This is the case with a few QEMU boards, for example.
> > > >
> > > > So it makes no sense to have OF_BOARD as a 'choice'. It should be a=
n
> > > > option, available with either OF_SEPARATE or OF_EMBED.
> > > >
> > > > This series makes this change, adding various missing devicetree
> files
> > > > (and placeholders) to make the build work.
> > >
> > > Adding device trees that are never used sounds like a hack to me.
> > >
> > > For QEMU, device tree is dynamically generated on the fly based on
> > > command line parameters, and the device tree you put in this series
> > > has various hardcoded <phandle> values which normally do not show up
> > > in hand-written dts files.
> > >
> > > I am not sure I understand the whole point of this.
> >
> > I am also confused and do not like the idea of adding device trees for
> > platforms that are capable of and can / do have a device tree to give u=
s
> > at run time.
>
> (I'll just reply to this one email, since the same points applies to
> all replies I think)
>
> I have been thinking about this and discussing it with people for a
> few months now. I've been signalling a change like this for over a
> month now, on U-Boot contributor calls and in discussions with Linaro
> people. I sent a patch (below) to try to explain things. I hope it is
> not a surprise!
>
> The issue here is that we need a devicetree in-tree in U-Boot, to
> avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,
> BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between
> Ilias' series and this one we can get ourselves on a stronger footing.
> There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.
> For more context:
>
>
> http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-=
sjg@chromium.org/
>
> BTW I did suggest to QEMU ARM that they support a way of adding the
> u-boot.dtsi but there was not much interest there (in fact the
> maintainer would prefer there was no special support even for booting
> Linux directly!)

i understand their point of view and agree with it.

> But in any case it doesn't really help U-Boot. I
> think the path forward might be to run QEMU twice, once to get its
> generated tree and once to give the 'merged' tree with the U-Boot
> properties in it, if people want to use U-Boot features.
>
> I do strongly believe that OF_BOARD must be a run-time option, not a
> build-time one. It creates all sorts of problems and obscurity which
> have taken months to unpick. See the above patch for the rationale.
>
> To add to that rationale, OF_BOARD needs to be an option available to
> any board. At some point in the future it may become a common way
> things are done, e.g. TF-A calling U-Boot and providing a devicetree
> to it. It doesn't make any sense to have people decide whether or not
> to set OF_BOARD at build time, thus affecting how the image is put
> together. We'll end up with different U-Boot build targets like
> capricorn, capricorn_of_board and the like. It should be obvious where
> that will lead. Instead, OF_BOARD needs to become a commonly used
> option, perhaps enabled by most/all boards, so that this sort of build
> explosion is not needed.

If you mean that when boards are by construction providing a DTB to U-Boot
then I agree very much. But I don=E2=80=99t understand how the patch set  s=
upports
it as it puts dts files for those boards to be built.

> U-Boot needs to be flexible enough to
> function correctly in whatever runtime environment in which it finds
> itself.
>
> Also as binman is pressed into service more and more to build the
> complex firmware images that are becoming fashionable, it needs a
> definition (in the devicetree) that describes how to create the image.
> We can't support that unless we are building a devicetree, nor can the
> running program access the image layout without that information.
>
> Fran=C3=A7ois's point about 'don't use this with any kernel' is
> germane...but of course I am not suggesting doing that, since OF_BOARD
> is, still, enabled. We already use OF_BOARD for various boards that
> include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for example
> (as I said in the cover letter "Most boards do provide one, but some
> don't."). So this series is just completing the picture by enforcing
> that *some sort* of devicetree is always present.
>
That seems inconsistent with the OF_BOARD becomes the default.

>
> I can't quite pinpoint the patch where U-Boot started allowing the
> devicetree to be omitted, but if people are interested I could try a
> little harder. It was certainly not my intention (putting on my
> device-tree-maintainer hat) to go down that path and it slipped in
> somehow in all the confusion. I'm not sure anyone could tell you that
> rpi_3 has an in-tree devicetree but rpi_4 does not...
>
> Anyway this series is very modest. It just adds the requirement that
> all in-tree boards have some sort of sample devicetree and preferably
> some documentation as to where it might come from at runtime.

That=E2=80=99s a very good goal. But adding files in dts make them not samp=
les but
templates to be used and replace board provided DTB.
If you push all your DTS files in documentation, you do what you say:
adding sample files.

> That
> should not be a tough call IMO. Assuming we can get the validation in
> place (mentioned by Rob Herring recently) it will be quite natural to
> sync them between (presumably) Linux and U-Boot.
>
> I am also quite happy to discuss what should actually be in these
> devicetree files and whether some of them should be essentially empty.
> As you probably noticed, some of them are empty since I literally
> could not figure out where they come from! But there needs to be at
> least some skeleton for U-Boot to progress, since devicetree is
> critical to its feature set.

absolutely. And thank you for your efforts to make that center stage. This
is also Linaro Edge group mist challenging  task on the next 6 moths.
Knowing that we have lived in a floating situation for over 10 years, I
just hope we get consensus across projects and distro providers about the
right end goal and migration strategy.

>
>
> It is high time we tidied all this up. I predict it will be much
> harder, and much more confusing, in 6 months.
>
> Regards,
> Simon
>
--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--0000000000001edcfe05ce3f62a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Simon</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 13 oct. 2021 =C3=A0 16:49, Simo=
n Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chromium.org</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Tom, Bin,Fran=
=C3=A7ois,<br>
<br>
On Tue, 12 Oct 2021 at 19:34, Tom Rini &lt;<a href=3D"mailto:trini@konsulko=
.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng wrote:<br>
&gt; &gt; Hi Simon,<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Oct 13, 2021 at 9:01 AM Simon Glass &lt;<a href=3D"mailto=
:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; With Ilias&#39; efforts we have dropped OF_PRIOR_STAGE and O=
F_HOSTFILE so<br>
&gt; &gt; &gt; there are only three ways to obtain a devicetree:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 - OF_SEPARATE - the normal way, where the devic=
etree is built and<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appended to U-Boot<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 - OF_EMBED - for development purposes, the devi=
cetree is embedded in<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the ELF file (also used for EFI)<b=
r>
&gt; &gt; &gt;=C2=A0 =C2=A0 - OF_BOARD - the board figures it out on its ow=
n<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The last one is currently set up so that no devicetree is ne=
eded at all<br>
&gt; &gt; &gt; in the U-Boot tree. Most boards do provide one, but some don=
&#39;t. Some<br>
&gt; &gt; &gt; don&#39;t even provide instructions on how to boot on the bo=
ard.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The problems with this approach are documented at [1].<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In practice, OF_BOARD is not really distinct from OF_SEPARAT=
E. Any board<br>
&gt; &gt; &gt; can obtain its devicetree at runtime, even it is has a devic=
etree built<br>
&gt; &gt; &gt; in U-Boot. This is because U-Boot may be a second-stage boot=
loader and its<br>
&gt; &gt; &gt; caller may have a better idea about the hardware available i=
n the machine.<br>
&gt; &gt; &gt; This is the case with a few QEMU boards, for example.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So it makes no sense to have OF_BOARD as a &#39;choice&#39;.=
 It should be an<br>
&gt; &gt; &gt; option, available with either OF_SEPARATE or OF_EMBED.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This series makes this change, adding various missing device=
tree files<br>
&gt; &gt; &gt; (and placeholders) to make the build work.<br>
&gt; &gt;<br>
&gt; &gt; Adding device trees that are never used sounds like a hack to me.=
<br>
&gt; &gt;<br>
&gt; &gt; For QEMU, device tree is dynamically generated on the fly based o=
n<br>
&gt; &gt; command line parameters, and the device tree you put in this seri=
es<br>
&gt; &gt; has various hardcoded &lt;phandle&gt; values which normally do no=
t show up<br>
&gt; &gt; in hand-written dts files.<br>
&gt; &gt;<br>
&gt; &gt; I am not sure I understand the whole point of this.<br>
&gt;<br>
&gt; I am also confused and do not like the idea of adding device trees for=
<br>
&gt; platforms that are capable of and can / do have a device tree to give =
us<br>
&gt; at run time.<br>
<br>
(I&#39;ll just reply to this one email, since the same points applies to<br=
>
all replies I think)<br>
<br>
I have been thinking about this and discussing it with people for a<br>
few months now. I&#39;ve been signalling a change like this for over a<br>
month now, on U-Boot contributor calls and in discussions with Linaro<br>
people. I sent a patch (below) to try to explain things. I hope it is<br>
not a surprise!<br>
<br>
The issue here is that we need a devicetree in-tree in U-Boot, to<br>
avoid the mess that has been created by OF_PRIOR_STAGE, OF_BOARD,<br>
BINMAN_STANDALONE_FDT and to a lesser extent, OF_HOSTFILE. Between<br>
Ilias&#39; series and this one we can get ourselves on a stronger footing.<=
br>
There is just OF_SEPARATE, with OF_EMBED for debugging/ELF use.<br>
For more context:<br>
<br>
<a href=3D"http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3=
830278-3-sjg@chromium.org/" rel=3D"noreferrer" target=3D"_blank">http://pat=
chwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium=
.org/</a><br>
<br>
BTW I did suggest to QEMU ARM that they support a way of adding the<br>
u-boot.dtsi but there was not much interest there (in fact the<br>
maintainer would prefer there was no special support even for booting<br>
Linux directly!)</blockquote><div dir=3D"auto">i understand their point of =
view and agree with it.</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"> B=
ut in any case it doesn&#39;t really help U-Boot. I<br>
think the path forward might be to run QEMU twice, once to get its<br>
generated tree and once to give the &#39;merged&#39; tree with the U-Boot<b=
r>
properties in it, if people want to use U-Boot features.<br>
<br>
I do strongly believe that OF_BOARD must be a run-time option, not a<br>
build-time one. It creates all sorts of problems and obscurity which<br>
have taken months to unpick. See the above patch for the rationale.<br>
<br>
To add to that rationale, OF_BOARD needs to be an option available to<br>
any board. At some point in the future it may become a common way<br>
things are done, e.g. TF-A calling U-Boot and providing a devicetree<br>
to it. It doesn&#39;t make any sense to have people decide whether or not<b=
r>
to set OF_BOARD at build time, thus affecting how the image is put<br>
together. We&#39;ll end up with different U-Boot build targets like<br>
capricorn, capricorn_of_board and the like. It should be obvious where<br>
that will lead. Instead, OF_BOARD needs to become a commonly used<br>
option, perhaps enabled by most/all boards, so that this sort of build<br>
explosion is not needed. </blockquote><div dir=3D"auto">If you mean that wh=
en boards are by construction providing a DTB to U-Boot then I agree very m=
uch. But I don=E2=80=99t understand how the patch set =C2=A0supports it as =
it puts dts files for those boards to be built.</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex" dir=3D"auto">U-Boot needs to be flexible enough to<br>
function correctly in whatever runtime environment in which it finds<br>
itself.<br>
<br>
Also as binman is pressed into service more and more to build the<br>
complex firmware images that are becoming fashionable, it needs a<br>
definition (in the devicetree) that describes how to create the image.<br>
We can&#39;t support that unless we are building a devicetree, nor can the<=
br>
running program access the image layout without that information.<br>
<br>
Fran=C3=A7ois&#39;s point about &#39;don&#39;t use this with any kernel&#39=
; is<br>
germane...but of course I am not suggesting doing that, since OF_BOARD<br>
is, still, enabled. We already use OF_BOARD for various boards that<br>
include an in-tree devicetree - Raspberry Pi 1, 2 and 3, for example<br>
(as I said in the cover letter &quot;Most boards do provide one, but some<b=
r>
don&#39;t.&quot;). So this series is just completing the picture by enforci=
ng<br>
that *some sort* of devicetree is always present.<br>
</blockquote><div dir=3D"auto">That seems inconsistent with the OF_BOARD be=
comes the default.</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
I can&#39;t quite pinpoint the patch where U-Boot started allowing the<br>
devicetree to be omitted, but if people are interested I could try a<br>
little harder. It was certainly not my intention (putting on my<br>
device-tree-maintainer hat) to go down that path and it slipped in<br>
somehow in all the confusion. I&#39;m not sure anyone could tell you that<b=
r>
rpi_3 has an in-tree devicetree but rpi_4 does not...<br>
<br>
Anyway this series is very modest. It just adds the requirement that<br>
all in-tree boards have some sort of sample devicetree and preferably<br>
some documentation as to where it might come from at runtime. </blockquote>=
<div dir=3D"auto">That=E2=80=99s a very good goal. But adding files in dts =
make them not samples but templates to be used and replace board provided D=
TB.=C2=A0</div><div dir=3D"auto">If you push all your DTS files in document=
ation, you do what you say: adding sample files.</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex" dir=3D"auto">That<br>
should not be a tough call IMO. Assuming we can get the validation in<br>
place (mentioned by Rob Herring recently) it will be quite natural to<br>
sync them between (presumably) Linux and U-Boot.<br>
<br>
I am also quite happy to discuss what should actually be in these<br>
devicetree files and whether some of them should be essentially empty.<br>
As you probably noticed, some of them are empty since I literally<br>
could not figure out where they come from! But there needs to be at<br>
least some skeleton for U-Boot to progress, since devicetree is<br>
critical to its feature set.</blockquote><div dir=3D"auto">absolutely. And =
thank you for your efforts to make that center stage. This is also Linaro E=
dge group mist challenging =C2=A0task on the next 6 moths. Knowing that we =
have lived in a floating situation for over 10 years, I just hope we get co=
nsensus across projects and distro providers about the right end goal and m=
igration strategy.</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
It is high time we tidied all this up. I predict it will be much<br>
harder, and much more confusing, in 6 months.<br>
<br>
Regards,<br>
Simon<br>
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

--0000000000001edcfe05ce3f62a1--

