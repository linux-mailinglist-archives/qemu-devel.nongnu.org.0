Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2331F43CB6E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:02:20 +0200 (CEST)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjVT-0004mX-6p
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1mfitr-0000Ml-Qf
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:23:28 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1mfitm-0007RT-9z
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:23:27 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B7BB13F199
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635340995;
 bh=YM5b0AX5lfCOiqHOCW1Bj2KW8AOhxBvmsP6ck7Z+Qr4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=kGt0S0fcQ6T8fI+6fcyjXX9IVCZsPP88MIQTNpoRZzyJ2+fm1vHfAg1xsyp5ZhWpg
 FwCj/xzFUS/0LKjQxdmyCLqQ6aDm4Aebl2xQ8cPjAW6usBQehronElvMm4WgL/Kq/Z
 VJVmwqjaEwKXh3Z++ldbfAJon1lQUu/XyeJwKySmXQHpD4nSUN3UBkY4R0qlAV2sKM
 mypzeSZjgTjJSSQK59fqfkjK0j+CxKqTc5Mun4cv3WYRXDo5X5+QvTwAhy0jlRGpPz
 GOIBaQYDHb9bWBJ8PPfbUfEL50XewjCn8MiKe65KUC25VyU3TTSHO3Zv14pNr6VGhE
 1cg7t8Yku+glA==
Received: by mail-wm1-f70.google.com with SMTP id
 f63-20020a1c3842000000b0032a621260deso1980862wma.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YM5b0AX5lfCOiqHOCW1Bj2KW8AOhxBvmsP6ck7Z+Qr4=;
 b=P71EWxjqKmc65S/sm+2pqIteBcigQf/VPFFekGmU80sBJmzLBcK8qLC2Ko48uYLwkt
 gthf28nL0la7GyZSypDaG3UJHJdb6ncpMAdwDC+EmMWiQYAROmIcbEPKZXHqFh4u7rDw
 JoNYC6L+SLK+FYuju1nlynSe3a1wX9E6eu2mkf/nc5BFu4A3xAx1UhmzsOmXX1bP7tXl
 2OmbkSxseCczarmF/j8hxsZw2hQbWQh5bfodW8waKyZuar3TdUg1Ipw0mzrhac47xmX9
 f/Zm21Yc0HO9S32WzOY1mzVGjg5SNwvvoelRR3GUgAmgE4bAu3UDKWm/aKvBKiHXMXCB
 ZRlw==
X-Gm-Message-State: AOAM533zLrzb4XlNUFWsXQIXMGmPOmyFBujadxuWohO6l/vakHzyOHXi
 XVTLTQ/TfRJ5tcwwvVDweM558IitgOtpHuLCo0tvxzJvZPhkDZHQxHJ1ZWQljANdDzsQlcdUpTK
 Apbj7rAkh7hicqNTuDb8sDL/NE0gJAesx
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr5619085wmq.148.1635340984156; 
 Wed, 27 Oct 2021 06:23:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRTLrU09nXdurrS2djr90BA3LKZfixYFEc/0ItXA1zh6coikiZUmMkK+1NstqRj62xfzzYJg==
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr5618860wmq.148.1635340983315; 
 Wed, 27 Oct 2021 06:23:03 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id r27sm21578323wrr.70.2021.10.27.06.23.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:23:02 -0700 (PDT)
Message-ID: <e210136c-65c1-72f1-485f-e54a5e8248b3@canonical.com>
Date: Wed, 27 Oct 2021 15:23:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Content-Language: en-US
To: =?UTF-8?Q?Fran=c3=a7ois_Ozog?= <francois.ozog@linaro.org>,
 Tom Rini <trini@konsulko.com>
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
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAHFG_=U01QDd05K80-OHtJBgi01Kho1jY52QTQ-GO6mDDU7spg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
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
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 15:15, François Ozog wrote:
> Hi,
> 
> On Wed, 27 Oct 2021 at 14:48, Tom Rini <trini@konsulko.com 
> <mailto:trini@konsulko.com>> wrote:
> 
>     On Fri, Oct 15, 2021 at 12:03:44PM -0600, Simon Glass wrote:
>      > Hi all,
>      >
>      > On Thu, 14 Oct 2021 at 09:28, Tom Rini <trini@konsulko.com
>     <mailto:trini@konsulko.com>> wrote:
>      > >
>      > > On Thu, Oct 14, 2021 at 09:17:52AM -0600, Simon Glass wrote:
>      > > > Hi Tom,
>      > > >
>      > > > On Thu, 14 Oct 2021 at 08:56, Tom Rini <trini@konsulko.com
>     <mailto:trini@konsulko.com>> wrote:
>      > > > >
>      > > > > On Wed, Oct 13, 2021 at 12:06:02PM -0600, Simon Glass wrote:
>      > > > > > Hi François,
>      > > > > >
>      > > > > > On Wed, 13 Oct 2021 at 11:35, François Ozog
>     <francois.ozog@linaro.org <mailto:francois.ozog@linaro.org>> wrote:
>      > > > > > >
>      > > > > > > Hi Simon
>      > > > > > >
>      > > > > > > Le mer. 13 oct. 2021 à 16:49, Simon Glass
>     <sjg@chromium.org <mailto:sjg@chromium.org>> a écrit :
>      > > > > > >>
>      > > > > > >> Hi Tom, Bin,François,
>      > > > > > >>
>      > > > > > >> On Tue, 12 Oct 2021 at 19:34, Tom Rini
>     <trini@konsulko.com <mailto:trini@konsulko.com>> wrote:
>      > > > > > >> >
>      > > > > > >> > On Wed, Oct 13, 2021 at 09:29:14AM +0800, Bin Meng
>     wrote:
>      > > > > > >> > > Hi Simon,
>      > > > > > >> > >
>      > > > > > >> > > On Wed, Oct 13, 2021 at 9:01 AM Simon Glass
>     <sjg@chromium.org <mailto:sjg@chromium.org>> wrote:
>      > > > > > >> > > >
>      > > > > > >> > > > With Ilias' efforts we have dropped
>     OF_PRIOR_STAGE and OF_HOSTFILE so
>      > > > > > >> > > > there are only three ways to obtain a devicetree:
>      > > > > > >> > > >
>      > > > > > >> > > >    - OF_SEPARATE - the normal way, where the
>     devicetree is built and
>      > > > > > >> > > >       appended to U-Boot
>      > > > > > >> > > >    - OF_EMBED - for development purposes, the
>     devicetree is embedded in
>      > > > > > >> > > >       the ELF file (also used for EFI)
>      > > > > > >> > > >    - OF_BOARD - the board figures it out on its own
>      > > > > > >> > > >
>      > > > > > >> > > > The last one is currently set up so that no
>     devicetree is needed at all
>      > > > > > >> > > > in the U-Boot tree. Most boards do provide one,
>     but some don't. Some
>      > > > > > >> > > > don't even provide instructions on how to boot
>     on the board.
>      > > > > > >> > > >
>      > > > > > >> > > > The problems with this approach are documented
>     at [1].
>      > > > > > >> > > >
>      > > > > > >> > > > In practice, OF_BOARD is not really distinct
>     from OF_SEPARATE. Any board
>      > > > > > >> > > > can obtain its devicetree at runtime, even it is
>     has a devicetree built
>      > > > > > >> > > > in U-Boot. This is because U-Boot may be a
>     second-stage bootloader and its
>      > > > > > >> > > > caller may have a better idea about the hardware
>     available in the machine.
>      > > > > > >> > > > This is the case with a few QEMU boards, for
>     example.
>      > > > > > >> > > >
>      > > > > > >> > > > So it makes no sense to have OF_BOARD as a
>     'choice'. It should be an
>      > > > > > >> > > > option, available with either OF_SEPARATE or
>     OF_EMBED.
>      > > > > > >> > > >
>      > > > > > >> > > > This series makes this change, adding various
>     missing devicetree files
>      > > > > > >> > > > (and placeholders) to make the build work.
>      > > > > > >> > >
>      > > > > > >> > > Adding device trees that are never used sounds
>     like a hack to me.
>      > > > > > >> > >
>      > > > > > >> > > For QEMU, device tree is dynamically generated on
>     the fly based on
>      > > > > > >> > > command line parameters, and the device tree you
>     put in this series
>      > > > > > >> > > has various hardcoded <phandle> values which
>     normally do not show up
>      > > > > > >> > > in hand-written dts files.
>      > > > > > >> > >
>      > > > > > >> > > I am not sure I understand the whole point of this.
>      > > > > > >> >
>      > > > > > >> > I am also confused and do not like the idea of
>     adding device trees for
>      > > > > > >> > platforms that are capable of and can / do have a
>     device tree to give us
>      > > > > > >> > at run time.
>      > > > > > >>
>      > > > > > >> (I'll just reply to this one email, since the same
>     points applies to
>      > > > > > >> all replies I think)
>      > > > > > >>
>      > > > > > >> I have been thinking about this and discussing it with
>     people for a
>      > > > > > >> few months now. I've been signalling a change like
>     this for over a
>      > > > > > >> month now, on U-Boot contributor calls and in
>     discussions with Linaro
>      > > > > > >> people. I sent a patch (below) to try to explain
>     things. I hope it is
>      > > > > > >> not a surprise!
>      > > > > > >>
>      > > > > > >> The issue here is that we need a devicetree in-tree in
>     U-Boot, to
>      > > > > > >> avoid the mess that has been created by
>     OF_PRIOR_STAGE, OF_BOARD,
>      > > > > > >> BINMAN_STANDALONE_FDT and to a lesser extent,
>     OF_HOSTFILE. Between
>      > > > > > >> Ilias' series and this one we can get ourselves on a
>     stronger footing.
>      > > > > > >> There is just OF_SEPARATE, with OF_EMBED for
>     debugging/ELF use.
>      > > > > > >> For more context:
>      > > > > > >>
>      > > > > > >>
>     http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/
>     <http://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/>
>      > > > > > >>
>      > > > > > >> BTW I did suggest to QEMU ARM that they support a way
>     of adding the
>      > > > > > >> u-boot.dtsi but there was not much interest there (in
>     fact the
>      > > > > > >> maintainer would prefer there was no special support
>     even for booting
>      > > > > > >> Linux directly!)
>      > > > > > >
>      > > > > > > i understand their point of view and agree with it.
>      > > > > > >>
>      > > > > > >> But in any case it doesn't really help U-Boot. I
>      > > > > > >> think the path forward might be to run QEMU twice,
>     once to get its
>      > > > > > >> generated tree and once to give the 'merged' tree with
>     the U-Boot
>      > > > > > >> properties in it, if people want to use U-Boot features.
>      > > > > > >>
>      > > > > > >> I do strongly believe that OF_BOARD must be a run-time
>     option, not a
>      > > > > > >> build-time one. It creates all sorts of problems and
>     obscurity which
>      > > > > > >> have taken months to unpick. See the above patch for
>     the rationale.
>      > > > > > >>
>      > > > > > >> To add to that rationale, OF_BOARD needs to be an
>     option available to
>      > > > > > >> any board. At some point in the future it may become a
>     common way
>      > > > > > >> things are done, e.g. TF-A calling U-Boot and
>     providing a devicetree
>      > > > > > >> to it. It doesn't make any sense to have people decide
>     whether or not
>      > > > > > >> to set OF_BOARD at build time, thus affecting how the
>     image is put
>      > > > > > >> together. We'll end up with different U-Boot build
>     targets like
>      > > > > > >> capricorn, capricorn_of_board and the like. It should
>     be obvious where
>      > > > > > >> that will lead. Instead, OF_BOARD needs to become a
>     commonly used
>      > > > > > >> option, perhaps enabled by most/all boards, so that
>     this sort of build
>      > > > > > >> explosion is not needed.
>      > > > > > >
>      > > > > > > If you mean that when boards are by construction
>     providing a DTB to U-Boot then I agree very much. But I don’t
>     understand how the patch set  supports it as it puts dts files for
>     those boards to be built.
>      > > > > > >>
>      > > > > > >> U-Boot needs to be flexible enough to
>      > > > > > >> function correctly in whatever runtime environment in
>     which it finds
>      > > > > > >> itself.
>      > > > > > >>
>      > > > > > >> Also as binman is pressed into service more and more
>     to build the
>      > > > > > >> complex firmware images that are becoming fashionable,
>     it needs a
>      > > > > > >> definition (in the devicetree) that describes how to
>     create the image.
>      > > > > > >> We can't support that unless we are building a
>     devicetree, nor can the
>      > > > > > >> running program access the image layout without that
>     information.
>      > > > > > >>
>      > > > > > >> François's point about 'don't use this with any kernel' is
>      > > > > > >> germane...but of course I am not suggesting doing
>     that, since OF_BOARD
>      > > > > > >> is, still, enabled. We already use OF_BOARD for
>     various boards that
>      > > > > > >> include an in-tree devicetree - Raspberry Pi 1, 2 and
>     3, for example
>      > > > > > >> (as I said in the cover letter "Most boards do provide
>     one, but some
>      > > > > > >> don't."). So this series is just completing the
>     picture by enforcing
>      > > > > > >> that *some sort* of devicetree is always present.
>      > > > > > >
>      > > > > > > That seems inconsistent with the OF_BOARD becomes the
>     default.
>      > > > > >
>      > > > > > I think the key point that will get you closer to where I
>     am on this
>      > > > > > issue, is that OF_BOARD needs to be a run-time option. At
>     present it
>      > > > > > has build-time effects and this is quite wrong. If you go
>     through all
>      > > > > > the material I have written on this I think I have
>     motivated that very
>      > > > > > clearly.
>      > > > > >
>      > > > > > Another big issue is that I believe we need ONE
>     devicetree for U-Boot,
>      > > > > > not two that get merged by U-Boot. Again I have gone
>     through that in a
>      > > > > > lot of detail.
>      > > > >
>      > > > > I have a long long reply to your first reply here saved,
>     but, maybe
>      > > > > here's the biggest sticking point.  To be clear, you agree
>     that U-Boot
>      > > > > needs to support being passed a device tree to use, at run
>     time, yes?
>      > > >
>      > > > Yes. The OF_BOARD feature provides this.
>      > > >
>      > > > >
>      > > > > And in that case, would not be using the "fake" tree we
>     built in?
>      > > >
>      > > > Not at runtime.
>      > >
>      > > OK.
>      > >
>      > > > > So is the sticking point here that we really have two
>     classes of
>      > > > > devices, one class where we will never ever be given the
>     device tree at
>      > > > > run time (think BeagleBone Black) and one where we will
>     always be given
>      > > > > one at run time (think Raspberry Pi) ?
>      > > >
>      > > > I'm not sure it will be that black and white. I suspect there
>     will be
>      > > > (many) boards which can boot happily with the U-Boot
>     devicetree but
>      > > > can also accept one at runtime, if provided. For example, you
>     may want
>      > > > to boot with or without TF-A or some other, earlier stage.
>      > >
>      > > I'm not sure I see the value in making this a gray area. 
>     There's very
>      > > much a class of "never" boards.  There's also the class of
>     "can" today.
>      > > Maybe as part of a developer iterative flow it would be nice to
>     not have
>      > > to re-flash the prior stage to change a DT, and just do it in
>     U-Boot
>      > > until things are happy, but I'm not sure what the use case is for
>      > > overriding the previous stage.
>      > >
>      > > Especially since the pushback on this series I think has all
>     been "why
>      > > are we copying in a tree to build with?  We don't want to use
>     it at run
>      > > time!".  And then softer push back like "Well, U-Boot says we
>     have to
>      > > include the device tree file here, but we won't use it...".
>      >
>      > See below.
>      >
>      > >
>      > > > I believe we have got unstuck because OF_BOARD (perhaps
>     inadvertently)
>      > > > provided a way to entirely omit a devicetree from U-Boot,
>     thus making
>      > > > things like binman and U-Boot /config impossible, for
>     example. So I
>      > > > want to claw that back, so there is always some sort of
>     devicetree in
>      > > > U-Boot, as we have for rpi_3, etc.
>      > >
>      > > I really want to see what the binary case looks like since we
>     could then
>      > > kill off rpi_{3,3_b,4}_defconfig and I would need to see if we
>     could
>      > > then also do a rpi_arm32_defconfig too.
>      > >
>      > > I want to see less device trees in U-Boot sources, if they can come
>      > > functionally correct from the hardware/our caller.
>      > >
>      > > And I'm not seeing how we make use of "U-Boot /config" if we
>     also don't
>      > > use the device tree from build time at run time, ignoring the
>     device
>      > > tree provided to us at run time by the caller.
>      >
>      > Firstly I should say that I find building firmware very messy and
>      > confusing these days. Lots of things to build and it's hard to find
>      > the instructions. It doesn't have to be that way, but if we carry on
>      > as we are, it will continue to be messy and in five years you will
>      > need a Ph.D and a lucky charm to boot on any modern board. My
>      > objective here is to simplify things, bringing some consistency
>     to the
>      > different components. Binman was one effort there. I feel that
>     putting
>      > at least the U-Boot house in order, in my role as devicetree
>      > maintainer (and as author of devicetree support in U-Boot back in
>      > 2011), is the next step.
> 
>     Yes, it's Not Great.  I don't like my handful of build-BOARD.sh scripts
>     that know where to grab other known-good binaries of varying licenses
>     that are needed to assemble something that boots.
> 
>      > If we set things up correctly and agree on the bindings, devicetree
>      > can be the unifying configuration mechanism through the whole of
>      > firmware (except for very early bits) and into the OS, this will set
>      > us up very well to deal with the complexity that is coming.
>      >
>      > Anyway, here are the mental steps that I've gone through over the
>     past
>      > two months:
>      >
>      > Step 1: At present, some people think U-Boot is not even allowed to
>      > have its own nodes/properties in the DT.
> 
> In my view U-Boot shall be able to leverage device tree format (source 
> and binary) to store its own data.
> When you say "the" DT, I always think this is "the" DT that is passed to 
> OS and in "that" DT, there should be no U-Boot entries. As stated in 
> another mail thread, I also refer to a place in a FIP where that dynamic 
> config DT is meant to be stored: NT_FW_CONFIG.
> But there can be U-Boot defined bindings in "a" control/dynamic config 
> DT; Trusted Firmware does that.

It ends up in that we need two separate devicetrees.

One passed to U-Boot for fixups and further passed to the OS. This 
devicetree may originate from a prior boot stage, from a file loaded by 
U-Boot, or from a later bootstage, e.g systemd-boot's devicetree 
command. This devicetree will not contain any U-Boot specific information.

A second devicetree to hold everything that U-Boot needs for its 
internal purposes.

Best regards

Heinrich

> 
>     It is an abuse of the
>      > devicetree standard, like the /chosen node but with less history. We
>      > should sacrifice efficiency, expedience and expandability on the
>     altar
>      > of 'devicetree is a hardware description'. How do we get over that
>      > one? Wel, I just think we need to accept that U-Boot uses devicetree
>      > for its own purposes, as well as for booting the OS. I am not saying
> 
>     Yes, we need to have properties present in the device tree, and just
>     like how "linux," is a valid vendor prefix for the linux kernel (but not
>     used I would expect by the BSD families) we have cases that need
>     "u-boot," properties.
> 
>      > it always has to have those properties, but with existing features
>      > like verified boot, SPL as well as complex firmware images where
>      > U-Boot needs to be able to find things in the image, it is essential.
>      > So let's just assume that we need this everywhere, since we certainly
>      > need it in at least some places.
> 
>     No, we can't / shouldn't assume we need this everywhere.  A lot of
>     places? Yes.  But some features are going to be optional.  A valid must
>     be supported use case is something like a Pi where the hardware gives us
>     a device tree, the tree is correct and some features in U-Boot aren't
>     needed (SPL) nor possibly supported immediately (verified boot).  We can
>     go off on a tangent about how useful it would be to have HW platforms
>     that are both common and can demonstrate a number of features, but
>     that's its own problem to solve.
> 
>      > (stop reading here if you disagree, because nothing below will make
>      > any sense...you can still use U-Boot v2011.06 which doesn't have
>      > OF_CONTROL :-)
>      >
>      > Step 2: Assume U-Boot has its own nodes/properties. How do they get
>      > there? Well, we have u-boot.dtsi files for that (the 2016 patch
>      > "6d427c6b1fa binman: Automatically include a U-Boot .dtsi file"), we
>      > have binman definitions, etc. So we need a way to overlay those
>     things
>      > into the DT. We already support this for in-tree DTs, so IMO this is
>      > easy. Just require every board to have an in-tree DT. It helps with
>      > discoverability and documentation, anyway. That is this series.
>      >
>      > (I think most of us are at the beginning of step 2, unsure about it
>      > and worried about step 3)
>      >
>      > Step 3: Ah, but there are flows (i.e. boards that use a particular
>      > flow only, or boards that sometimes use a flow) which need the DT to
>      > come from a prior stage. How to handle that? IMO that is only
>     going to
>      > grow as every man and his dog get into the write-a-bootloader
>      > business. We need a way to provide the U-Boot nodes/properties in a
>      > form that the prior stage can consume and integrate with its build
>      > system. Is TF-A the only thing being discussed here? If so, let's
>     just
>      > do it. We have the u-boot.dtsi and we can use binman to put the image
>      > together, for example. Or we can get clever and create some sort of
>      > overlay dtb.
>      >
>      > Step 3a. But I don't want to do that. a) If U-Boot needs this stuff
>      > then it will need to build it in and use two devicetrees, one
>     internal
>      > and one from the prior stage....well that is not very efficient
>     and it
>      > is going to be confusing for people to figure out what U-Boot is
>      > actually doing. But we actually already do that in a lot of cases
>      > where U-Boot passes a DT to the kernel which is different to the one
>      > it uses. So perhaps we have three devicetrees? OMG. b) Well then
>      > U-Boot can have its own small devicetree with its bits and then
>     U-Boot
>      > can merge the two when it starts. Again that is not very efficient.
> 
> Does not need to merge the two. hence it does not have any influence on 
> efficiency.
> For properties access, trusted firmware has defined an abstract way to 
> get them:
> https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index.html 
> <https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index.html>. 
> 
> The properties are currently implemented as DT but TF.ORG 
> <http://TF.ORG> could decide to move to CBOR.
> The API will remain so that a change in backend will not influence 
> existing code.
> I think you are too focused on "THE" device tree. "THE" device tree that 
> is passed to the OS
> shall be hardware description and not a hacky place to fit any piece of 
> metadata.
> I would argue that /chosen shall not even be there as most if not all 
> information can be passed as OS command line. And actually for the UEFI 
> contract, /chosen should go empty.
> 
>     It
>      > means that U-Boot cannot be controlled by the prior stage (e.g.
>     to get
>      > its public key from there or to enable/disable the console), so
>      > unified firmware config is not possible. It will get very confusing,
>      > particularly for debugging U-Boot. c) Some other scheme to avoid
>      > accepting step 3...please stop!
> 
>     How the nodes should get there is how the rest of the nodes in a system
>     get there.  Bindings are submitted and reviewed.  The authoritative
>     source of the dtses in question then has them, like any other property.
> 
>      > Step 4: Yes, but there is QEMU, which makes the devicetree up out of
>      > whole cloth. What about that? Well, we are just going to have to deal
>      > with that. We can easily merge in the U-Boot nodes/properties and
>      > update the U-Boot CI scripts to do this, as needed, e.g. with
>      > qemu-riscv64_spl. It's only one use case, although Xen might do
>      > something similar.
>      >
>      > To my mind, that deals with both the build-time and run-time issues.
>      > We have a discoverable DT in U-Boot, which should be considered the
>      > source of truth for most boards. We can sync it with Linux
>      > automatically with the tooling that I hope Rob Herring will come up
>      > with. We can use an empty one where there really is no default,
>      > although I'd argue that is making perfect an enemy of the good.
>      >
>      > Step 5: If we get clever and want to remove them from the U-Boot tree
>      > and pick them up from somewhere else, we can do that with sufficient
>      > tooling. Perhaps we should set a timeline for that? A year? Two? Six?
> 
> For SystemReady compliant boards, this has to come much faster.
> Do you think distros will keep providing DTs for ever? I bet not.
> 
>     These last two paragraphs condense what I think is honestly close to a
>     decade of debate / discussion down to a fiat "U-Boot will have the DTS
>     files".  I don't want that.  I don't think any of the other projects
>     that want to leverage DTS files want that.
> 
>      > To repeat, if we set things up correctly and agree on the bindings,
>      > devicetree can be the unifying configuration mechanism through the
>      > whole of firmware (except for very early bits) and into the OS. I
>     feel
>      > this will set us up very well to deal with the complexity that is
>      > coming.
> 
>     Sure, it could.  But that doesn't mean that U-Boot is where the dts
>     files live.
> 
>     -- 
>     Tom
> 
> 
> 
> -- 
> 	
> François-Frédéric Ozog | /Director Business Development/
> T: +33.67221.6485
> francois.ozog@linaro.org <mailto:francois.ozog@linaro.org> | Skype: ffozog
> 
> 


