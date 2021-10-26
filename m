Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4E43B3C7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:16:38 +0200 (CEST)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNFk-00039X-V5
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1mfGEW-0004eJ-4C
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 02:46:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilias.apalodimas@linaro.org>)
 id 1mfGES-0003K6-EL
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 02:46:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m22so13888989wrb.0
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 23:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Poslm+34Ol95G4stfL+AJ6S4vZNykhe0GtfjT8H9mAs=;
 b=rW8zL7CDLWMiFlFRgbroZeo7VabIbBBgy8WkS0fqvkIG5CMrBmz7sFtLtiSPJ9cMZ2
 50pfySqn5xx0WC58q8S1wZAEzg7addSztNTjOvHvL2PfGO6CHUjpLMtIZG9inowoIm0v
 jT6cykttX0qTvNL4ED41h0MQyNV1TWtnXLWa2CuNt5enlL9hJmQ3V7fMcPI/TQn1HwIr
 Sl8dyF3diO+EuN4y+nTh/SUeIC9RwI6uudMT2cmy+bE9GjYFHkYY0GxjOwgu6vT/yhs4
 ZsK0tIp1VvgZC4sx5P6KzPkD58jqYhiavYKARF5wvSu/kx6Am9wjsGy4BgDKTQt1obiD
 g44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Poslm+34Ol95G4stfL+AJ6S4vZNykhe0GtfjT8H9mAs=;
 b=C2XPOWJ2KPgz9jdqkux+7fCnP33BdQNRL3exyxu5WioIRfEXYivaL5miAUzANBwN4F
 GmgNoF/s8NNJzKbP+gn0zfQH81pUaXWKce2uJnKzuP0QiGBI2u6HH9Iu0yocwQK996S2
 kwaVg8z0o+qukmLjEscTBKSRV+jJNgkR9EVBrXD8s5sYDN+zWhBLaYPm8fBbdz2l8NqZ
 /V6BTEt3R642Fq/l1kU/sYI76EnL0I/oTiBa0itNazLywJNX9FPyRK0PEbiRTUlEkNd4
 tRrESDoY7l8jvcb3lkUY93xLB4TPYEuP2VrsBLcQF/sCwcCOIdJge98rpSSy2KM6rHTQ
 6Utg==
X-Gm-Message-State: AOAM533pm31B0EZ3mBCagvM0gg/02VfVXUpR6ScPVGNtvKKtkkuH/H/1
 qjxkRAx6RNUTgbfMxXsvpl0H5w==
X-Google-Smtp-Source: ABdhPJyhtHM37oF4TsJWAkdy6As3OpUcL5BKjEuXNHD0r31dHEaPIjwi/4Ff12vkV50Sy7RiBssXRQ==
X-Received: by 2002:a5d:508b:: with SMTP id a11mr18303808wrt.420.1635230803689; 
 Mon, 25 Oct 2021 23:46:43 -0700 (PDT)
Received: from apalos.home (ppp-94-66-220-13.home.otenet.gr. [94.66.220.13])
 by smtp.gmail.com with ESMTPSA id c15sm17946305wrs.19.2021.10.25.23.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 23:46:43 -0700 (PDT)
Date: Tue, 26 Oct 2021 09:46:38 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Message-ID: <YXekTkeL73NM0UOU@apalos.home>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPnjgZ2Y-uvmhQmhxnBN7Wa+Tz=ZL0bWpnJi6xCW-P8p+C-qCw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=ilias.apalodimas@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Oct 2021 10:11:52 -0400
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
 Stephen Warren <swarren@wwwdotorg.org>, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
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

Hi Simon,

A bit late to the party, sorry!

[...]

> >
> > I really want to see what the binary case looks like since we could then
> > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we could
> > then also do a rpi_arm32_defconfig too.
> >
> > I want to see less device trees in U-Boot sources, if they can come
> > functionally correct from the hardware/our caller.
> >
> > And I'm not seeing how we make use of "U-Boot /config" if we also don't
> > use the device tree from build time at run time, ignoring the device
> > tree provided to us at run time by the caller.
> 
> Firstly I should say that I find building firmware very messy and
> confusing these days. Lots of things to build and it's hard to find
> the instructions. It doesn't have to be that way, but if we carry on
> as we are, it will continue to be messy and in five years you will
> need a Ph.D and a lucky charm to boot on any modern board. My
> objective here is to simplify things, bringing some consistency to the
> different components. Binman was one effort there. I feel that putting
> at least the U-Boot house in order, in my role as devicetree
> maintainer (and as author of devicetree support in U-Boot back in
> 2011), is the next step.
> 
> If we set things up correctly and agree on the bindings, devicetree
> can be the unifying configuration mechanism through the whole of
> firmware (except for very early bits) and into the OS, this will set
> us up very well to deal with the complexity that is coming.
> 
> Anyway, here are the mental steps that I've gone through over the past
> two months:
> 
> Step 1: At present, some people think U-Boot is not even allowed to
> have its own nodes/properties in the DT. It is an abuse of the
> devicetree standard, like the /chosen node but with less history. We
> should sacrifice efficiency, expedience and expandability on the altar
> of 'devicetree is a hardware description'. How do we get over that
> one? Wel, I just think we need to accept that U-Boot uses devicetree
> for its own purposes, as well as for booting the OS. I am not saying
> it always has to have those properties, but with existing features
> like verified boot, SPL as well as complex firmware images where
> U-Boot needs to be able to find things in the image, it is essential.
> So let's just assume that we need this everywhere, since we certainly
> need it in at least some places.
> 
> (stop reading here if you disagree, because nothing below will make
> any sense...you can still use U-Boot v2011.06 which doesn't have
> OF_CONTROL :-)

Having U-Boot keep it's *internal* config state in DTs is fine.  Adding
that to the DTs that are copied over from linux isn't imho.  There are
various reasons for that.  First of all syncing device trees is a huge pain
and that's probably one of the main reasons our DTs are out of sync for a
large number of boards.
The point is this was fine in 2011 were we had SPL only,  but the reality
today is completely different.  There's previous stage boot loaders (and
enough cases were vendors prefer those over SPL).  If that bootloader needs
to use it's own device tree for whatever reason,  imposing restrictions on
it wrt to the device tree it has to include,  and require them to have
knowledge of U-Boot and it's internal config mechanism makes no sense not
to mention it doesn't scale at all.

> 
> Step 2: Assume U-Boot has its own nodes/properties. How do they get
> there? Well, we have u-boot.dtsi files for that (the 2016 patch
> "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
> have binman definitions, etc. So we need a way to overlay those things
> into the DT. We already support this for in-tree DTs, so IMO this is
> easy. Just require every board to have an in-tree DT. It helps with
> discoverability and documentation, anyway. That is this series.
> 

Again, the board might decide for it's own reason to provide it's own DT. 
IMHO U-Boot must be able to cope with that and asking DTs to be included in
U-Boot source is not the right way to do that,  not to mention cases were
that's completely unrealistic (e.g QEMU or a board that reads the DTB from
it's flash).

> (I think most of us are at the beginning of step 2, unsure about it
> and worried about step 3)
> 
> Step 3: Ah, but there are flows (i.e. boards that use a particular
> flow only, or boards that sometimes use a flow) which need the DT to
> come from a prior stage. How to handle that? IMO that is only going to
> grow as every man and his dog get into the write-a-bootloader
> business.

And that's exactly why we have to come up with something that scales,  without
having to add a bunch of unusable DTs in U-Boot.

> We need a way to provide the U-Boot nodes/properties in a
> form that the prior stage can consume and integrate with its build
> system. Is TF-A the only thing being discussed here? If so, let's just
> do it. We have the u-boot.dtsi and we can use binman to put the image
> together, for example. Or we can get clever and create some sort of
> overlay dtb.
> 
> Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
> then it will need to build it in and use two devicetrees, one internal
> and one from the prior stage....well that is not very efficient and it
> is going to be confusing for people to figure out what U-Boot is
> actually doing. But we actually already do that in a lot of cases
> where U-Boot passes a DT to the kernel which is different to the one
> it uses. So perhaps we have three devicetrees? OMG. 

No we don't. That's a moot point. If you separate the DTs U-Boot
provides the internal one and inherits one 'generic'.  Linux will be able to use
that.  So the only case were you'll need 3 DTs is if the *vendor* breaks the
DT across kernel versions,  In which case there's not much you can do to
begin with and that's already a case we have to deal with.

> b) Well then
> U-Boot can have its own small devicetree with its bits and then U-Boot
> can merge the two when it starts. Again that is not very efficient. It
> means that U-Boot cannot be controlled by the prior stage (e.g. to get
> its public key from there or to enable/disable the console), so
> unified firmware config is not possible. It will get very confusing,
> particularly for debugging U-Boot. c) Some other scheme to avoid
> accepting step 3...please stop!
> 
> Step 4: Yes, but there is QEMU, which makes the devicetree up out of
> whole cloth. What about that? Well, we are just going to have to deal
> with that. We can easily merge in the U-Boot nodes/properties and
> update the U-Boot CI scripts to do this, as needed, e.g. with
> qemu-riscv64_spl. It's only one use case, although Xen might do
> something similar.
> 
> To my mind, that deals with both the build-time and run-time issues.
> We have a discoverable DT in U-Boot, which should be considered the
> source of truth for most boards. We can sync it with Linux
> automatically with the tooling that I hope Rob Herring will come up
> with. We can use an empty one where there really is no default,
> although I'd argue that is making perfect an enemy of the good.
> 
> Step 5: If we get clever and want to remove them from the U-Boot tree
> and pick them up from somewhere else, we can do that with sufficient
> tooling. Perhaps we should set a timeline for that? A year? Two? Six?

We can start slowly migrating boards and see how that works out.
We could either use 2 device trees as you proposed, or have u-boot merge
the 'u-boot' DTB and the inherited DTB before DM comes up.  OTOH I'd prefer
if linux gets handed a clean device tree without the u-boot internals in
it, so I think 2 discrete DTs is cleaner overall.

Regards
/Ilias
> 
> To repeat, if we set things up correctly and agree on the bindings,
> devicetree can be the unifying configuration mechanism through the
> whole of firmware (except for very early bits) and into the OS. I feel
> this will set us up very well to deal with the complexity that is
> coming.
> 
> Regards,
> Simon

