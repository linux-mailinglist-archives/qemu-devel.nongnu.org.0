Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D043CBC4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:14:32 +0200 (CEST)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjhH-0000L2-Ii
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1mfjHk-0000Wm-5H
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:48:08 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1mfjHi-0006fz-1X
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:48:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z20so10718581edc.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/Ug4REtRrHP4v7dj5cYh2hlvHLOy5ui/JjH7zWpUD8c=;
 b=joV9Qp329sewcEFvbpeW8QZUZ8LeMJL3hQhhiL8T9W90eZY21U+qLpxXGdpWRhZCYY
 8F88jvCPHOf0zFNOLkKzYNrtRiM194hxhGwXFVMgH19TlKcgKLPw4ALjFtwT/wxbbKX+
 Lj4cugw0y9sHcAOvUz/5pq+CxhXA2Udfr6xYMqsElkN2o3CUrApoarFnwqtucDdNBU7U
 Whb7dEUm3hBU/sB1nKDMhEw0rzu0o7m8/AY8y1hfwYlXI9fAVWFY1KLfAc+hBwYMadnF
 4jPaYpps3HMWroW2xtLOAm80wLJ8j5LvCwOmtvScvqAR7OX0htfbgd2Gv67tbJoOBGu6
 HpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/Ug4REtRrHP4v7dj5cYh2hlvHLOy5ui/JjH7zWpUD8c=;
 b=lLbGjj9V+v9sKmRrbn55WhOl732R+JcsxmUuuxT4XuNFIaXf6p62R6C+J2OzU4fqxU
 Zoyp3O+w1DGv2pZN+/PGYYvoNhowcbMVXT5FRi37icIo0N7tcFw9i2Hbip70HoftBR/s
 EQ+OUgzGISPGt5selJu9/v0YWE2LnEGTjlkazVt23cJ8gHhI5BJjdljmLdiyVAVC2SQ8
 8SdTsjkJxS91Wy5VyfIwKxRRvOloKNQ4eNYW1R7oomWVAeR/aBBidTie/+FBRQmvwU82
 SSrzlhV28pt9SoPbx1Hdk3tUSJckHqPLZ4QGREhvq3W/oCxY3XioRWU9NBFP3QSEURlj
 YJ0Q==
X-Gm-Message-State: AOAM530ExVzEp6bTTBcTpkmPijrachLaIlATDSYJa+tg12UdIBXjq+0z
 dL1UlBBCWdOHnsx4858xtacCMQ==
X-Google-Smtp-Source: ABdhPJxpstneNeGqPoBwWE4VpxMm84CJyRQKeCWr2RuBBavWoEzFbQNSQ6B91sP7Lsh9FtNcQiJ0ng==
X-Received: by 2002:a05:6402:1d49:: with SMTP id
 dz9mr43715764edb.55.1635342481247; 
 Wed, 27 Oct 2021 06:48:01 -0700 (PDT)
Received: from apalos.home (ppp-94-66-220-13.home.otenet.gr. [94.66.220.13])
 by smtp.gmail.com with ESMTPSA id b19sm10734028ejc.107.2021.10.27.06.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 06:48:00 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:47:55 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <YXlYi2KozBjmMb+v@apalos.home>
References: <CAHFG_=ULjFFcF_BWzknPPw23CeMX=d-Cprhad085nX_r1NhE1g@mail.gmail.com>
 <CAPnjgZ3+QP3ogPA=zKWHoctkr4C2rSos_yVmJjp_MYZ-O0sKeQ@mail.gmail.com>
 <20211014145626.GC7964@bill-the-cat>
 <CAPnjgZ3=evGbgSg-aen6pkOXZ4DCxX8vcX9cn4qswJQRNNSzLQ@mail.gmail.com>
 <20211014152801.GF7964@bill-the-cat>
 <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
 <YXekTkeL73NM0UOU@apalos.home> <20211027125916.GS8284@bill-the-cat>
 <CAHFG_=U_=85YKtzVBP7eQ5z+b52Y=xrFJLPNy7nsFk-nR6QeJg@mail.gmail.com>
 <20211027133840.GV8284@bill-the-cat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211027133840.GV8284@bill-the-cat>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ilias.apalodimas@linaro.org; helo=mail-ed1-x52c.google.com
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
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
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

Hi trying to reply to all at the same time!

On Wed, Oct 27, 2021 at 09:38:40AM -0400, Tom Rini wrote:
> On Wed, Oct 27, 2021 at 03:30:18PM +0200, François Ozog wrote:
> > Hi Tom,
> > 
> > On Wed, 27 Oct 2021 at 14:59, Tom Rini <trini@konsulko.com> wrote:
> > 
> > > On Tue, Oct 26, 2021 at 09:46:38AM +0300, Ilias Apalodimas wrote:
> > > > Hi Simon,
> > > >
> > > > A bit late to the party, sorry!
> > > >
> > > > [...]
> > > >
> > > > > >
> > > > > > I really want to see what the binary case looks like since we could
> > > then
> > > > > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
> > > > > > then also do a rpi_arm32_defconfig too.
> > > > > >
> > > > > > I want to see less device trees in U-Boot sources, if they can come
> > > > > > functionally correct from the hardware/our caller.
> > > > > >
> > > > > > And I'm not seeing how we make use of "U-Boot /config" if we also
> > > don't
> > > > > > use the device tree from build time at run time, ignoring the device
> > > > > > tree provided to us at run time by the caller.
> > > > >
> > > > > Firstly I should say that I find building firmware very messy and
> > > > > confusing these days. Lots of things to build and it's hard to find
> > > > > the instructions. It doesn't have to be that way, but if we carry on
> > > > > as we are, it will continue to be messy and in five years you will
> > > > > need a Ph.D and a lucky charm to boot on any modern board. My
> > > > > objective here is to simplify things, bringing some consistency to the
> > > > > different components. Binman was one effort there. I feel that putting
> > > > > at least the U-Boot house in order, in my role as devicetree
> > > > > maintainer (and as author of devicetree support in U-Boot back in
> > > > > 2011), is the next step.
> > > > >
> > > > > If we set things up correctly and agree on the bindings, devicetree
> > > > > can be the unifying configuration mechanism through the whole of
> > > > > firmware (except for very early bits) and into the OS, this will set
> > > > > us up very well to deal with the complexity that is coming.
> > > > >
> > > > > Anyway, here are the mental steps that I've gone through over the past
> > > > > two months:
> > > > >
> > > > > Step 1: At present, some people think U-Boot is not even allowed to
> > > > > have its own nodes/properties in the DT. It is an abuse of the
> > > > > devicetree standard, like the /chosen node but with less history. We
> > > > > should sacrifice efficiency, expedience and expandability on the altar
> > > > > of 'devicetree is a hardware description'. How do we get over that
> > > > > one? Wel, I just think we need to accept that U-Boot uses devicetree
> > > > > for its own purposes, as well as for booting the OS. I am not saying
> > > > > it always has to have those properties, but with existing features
> > > > > like verified boot, SPL as well as complex firmware images where
> > > > > U-Boot needs to be able to find things in the image, it is essential.
> > > > > So let's just assume that we need this everywhere, since we certainly
> > > > > need it in at least some places.
> > > > >
> > > > > (stop reading here if you disagree, because nothing below will make
> > > > > any sense...you can still use U-Boot v2011.06 which doesn't have
> > > > > OF_CONTROL :-)
> > > >
> > > > Having U-Boot keep it's *internal* config state in DTs is fine.  Adding
> > > > that to the DTs that are copied over from linux isn't imho.  There are
> > > > various reasons for that.  First of all syncing device trees is a huge
> > > pain
> > > > and that's probably one of the main reasons our DTs are out of sync for a
> > > > large number of boards.
> > >
> > > This re-sync is only a pain because:
> > > 1. Some platforms have been modifying the core dts files LIKE THEY ARE
> > >    NOT SUPPOSED TO.
> > > 2. DTS files are getting closer to being the super stable API that has
> > >    been promised now that there's validation tools.

Agree on both, but still this is the reality we have to deal with right now

> > >
> > > Some SoCs, like stm32 are doing an amazing job and keeping things in
> > > sync, every release.  Others like NXP are violating rule #1.
> > 
> > With NXP commitment to SystemReady on some IMX8 boards, I think this is
> > changing,
> > at least for the SystemReady boards.
> 
> I'd really like to see some progress (as would the other non-NXP folks
> working on NXP SoCs) in that regard.
> 
> > > Still
> > > others like some TI platforms get bit by #2 (I solved one of these, and
> > > need to cycle back to the one you and I talked about on IRC a while
> > > back, I bet it's another node name dash changed to underbar).
> > >
> > > > The point is this was fine in 2011 were we had SPL only,  but the reality
> > > > today is completely different.  There's previous stage boot loaders (and
> > > > enough cases were vendors prefer those over SPL).  If that bootloader
> > > needs
> > > > to use it's own device tree for whatever reason,  imposing restrictions
> > > on
> > > > it wrt to the device tree it has to include,  and require them to have
> > > > knowledge of U-Boot and it's internal config mechanism makes no sense not
> > > > to mention it doesn't scale at all.
> > >
> > > If you are passing the full device tree around, a few more
> > > nodes/properties aren't going to make the situation worse.  If we're
> > > talking about a 60 kilobyte blob one more kilobyte isn't where we call
> > > the line, especially since if we wait another 6 months it'll be a 62
> > > kilobyte file coming in from Linux instead.
> >
> > This is not about size but about firmware supply chain organization.
> 
> That's great since it means we just need the bindings reviewed then
> everyone can pass whatever everyone else needs.
> 

Size here is not my concern.  If the bindings u-boot expects gets
upstreamed I am obviously fine with the previous stage bootloader passing
them over.  What I strongly disagree,  is *demand* the previous stage boot
loader have knowledge about them if they are not in upstream.

> > > > Step 2: Assume U-Boot has its own nodes/properties. How do they get
> > > > > there? Well, we have u-boot.dtsi files for that (the 2016 patch
> > > > > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> > > > > have binman definitions, etc. So we need a way to overlay those things
> > > > > into the DT. We already support this for in-tree DTs, so IMO this is
> > > > > easy. Just require every board to have an in-tree DT. It helps with
> > > > > discoverability and documentation, anyway. That is this series.
> > > >
> > > > Again, the board might decide for it's own reason to provide it's own
> > > DT.
> > > > IMHO U-Boot must be able to cope with that and asking DTs to be included
> > > in
> > > > U-Boot source is not the right way to do that,  not to mention cases were
> > > > that's completely unrealistic (e.g QEMU or a board that reads the DTB
> > > from
> > > > it's flash).
> > > >
> > > > > (I think most of us are at the beginning of step 2, unsure about it
> > > > > and worried about step 3)
> > > > >
> > > > > Step 3: Ah, but there are flows (i.e. boards that use a particular
> > > > > flow only, or boards that sometimes use a flow) which need the DT to
> > > > > come from a prior stage. How to handle that? IMO that is only going to
> > > > > grow as every man and his dog get into the write-a-bootloader
> > > > > business.
> > > >
> > > > And that's exactly why we have to come up with something that scales,
> > > without
> > > > having to add a bunch of unusable DTs in U-Boot.
> > >
> > > Both of these are solved by having our bindings reviewed and upstreamed
> > > and then what we need included in the authoritative dts files.
> > >

yes

> > There shall be authoritative System Device Trees as vendors are working on.
> > Those System Device Trees cover all aspects of a board, not just the
> > Cortex-A part that U-Boot cares about.
> > Out of those system device trees, a tool (lopper) is going to carve out the
> > "authoritative dts for the cortex-A".
> > Essentially, that carve out will correspond to what would come out of Linux.
> 
> s/Linux/software/
> 
> > This scheme will not be generalized, just adopted by vendors on some
> > boards.
> > DT for those board become part of the OS ABI (meaning, the driver
> > developper is constrained).
> 
> OK?  And is going to pick and choose which valid bindings to implement?
> Or is it going to provide half a node for Linux?  No?  I assume no.  So
> it will also provide whatever bindings we've upstreamed and say need to
> be passed.
> 
> -- 
> Tom

Regards
/Ilias

