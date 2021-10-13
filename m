Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A95C42B242
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:31:17 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maT6y-0003Mu-E2
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1maT5F-0002Wk-Qp
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:29:30 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1maT5D-0005fo-Hx
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:29:29 -0400
Received: by mail-yb1-xb35.google.com with SMTP id h2so2428249ybi.13
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WRSQTcaOxPa18eZ2iainhRVt0qKj19N3FoQzPw/1J3U=;
 b=cMCmjy262JNgj2rVy6wUtqdoDfLZsmlYc1NK+TZQJFzH4mML6G75mBi1dRpepAYCfL
 6TsZvzCQkv9ZsuGg60LRWKWJV+YAzr+3Rteak3IXeth8H7djsBtAay4NAKF1xbrdt9m3
 VqjRdR1/Rj3Mc2G20vAx9LFHPCEocNiFvLTStGr2SPtOmByfPBP9+OiwRk7TF1iqqZq7
 oyY2ro9IdYBc3vHFYf+ezj4v35yOPUJC7J6l2RyAUw3cYS50zc6PjKTYQnuHrenO0y4T
 IwifOk37SmA0rJwzWWXbkAixgUykSa64pEp751yfaz5nggdlzY2ju0lbbuGiQ+49cexj
 jB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WRSQTcaOxPa18eZ2iainhRVt0qKj19N3FoQzPw/1J3U=;
 b=ZkLKO7KGu/Cbwfe2SDIzwuUcMuGfhP1r8IrDfkN5lgtNxoBLLTptVgAQQwbQCH5/OT
 RRFysJ1CXyfFuPEaXGWAciIE8l5Qn+rCSgEQEf5TYmrgN+czilbMjM1xruP1Pz3or55m
 K+iyzbGGog7DXoYKU/K6dqtM0V3DZ8H0i+hIqPv3DbXorbYDfL/Ul9J7unqIB6MvSO0U
 AKY1kECkG5mpQz3QnSdWUC12KCB6eNNw3oOOXorcbeVXv/sBllHcW4Dg2tz1GAFUwXYO
 uZcFfwwMIWoy8kqQt7VAIYz7yOgWEsmwTblgFb+XWcTsHTMYcukZPscNnfzsxArLOwcu
 aHDA==
X-Gm-Message-State: AOAM530WByEO3Gf7ZwqvzEr0HAEzO9aFHff/oBtU5mnAwMgdU+DYwg3+
 JYiyTp5VjjLiARtS5zI2VHbqhrPRut2ThLrxU6c=
X-Google-Smtp-Source: ABdhPJyQjodEdClB41919uilye6r5iKdEI6n5NwXzZUs0DKAZF4UTnkGZsTFtVkGAjHrDjl/jQdBakbU7Lr/LDP/TDY=
X-Received: by 2002:a25:3843:: with SMTP id f64mr30696776yba.313.1634088565964; 
 Tue, 12 Oct 2021 18:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211013010120.96851-1-sjg@chromium.org>
In-Reply-To: <20211013010120.96851-1-sjg@chromium.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Oct 2021 09:29:14 +0800
Message-ID: <CAEUhbmWY5gKmqbipurcDQ0DuNJyv8cLWsnyqx5h+tFqeVng8Ag@mail.gmail.com>
Subject: Re: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 U-Boot Mailing List <u-boot@lists.denx.de>, Zong Li <zong.li@sifive.com>,
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
 Tero Kristo <kristo@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Simon,

On Wed, Oct 13, 2021 at 9:01 AM Simon Glass <sjg@chromium.org> wrote:
>
> With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
> there are only three ways to obtain a devicetree:
>
>    - OF_SEPARATE - the normal way, where the devicetree is built and
>       appended to U-Boot
>    - OF_EMBED - for development purposes, the devicetree is embedded in
>       the ELF file (also used for EFI)
>    - OF_BOARD - the board figures it out on its own
>
> The last one is currently set up so that no devicetree is needed at all
> in the U-Boot tree. Most boards do provide one, but some don't. Some
> don't even provide instructions on how to boot on the board.
>
> The problems with this approach are documented at [1].
>
> In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any board
> can obtain its devicetree at runtime, even it is has a devicetree built
> in U-Boot. This is because U-Boot may be a second-stage bootloader and its
> caller may have a better idea about the hardware available in the machine.
> This is the case with a few QEMU boards, for example.
>
> So it makes no sense to have OF_BOARD as a 'choice'. It should be an
> option, available with either OF_SEPARATE or OF_EMBED.
>
> This series makes this change, adding various missing devicetree files
> (and placeholders) to make the build work.

Adding device trees that are never used sounds like a hack to me.

For QEMU, device tree is dynamically generated on the fly based on
command line parameters, and the device tree you put in this series
has various hardcoded <phandle> values which normally do not show up
in hand-written dts files.

I am not sure I understand the whole point of this.

>
> It also provides a few qemu clean-ups discovered along the way.
>
> This series is based on Ilias' two series for OF_HOSTFILE and
> OF_PRIOR_STAGE removal.
>
> It is available at u-boot-dm/ofb-working
>
> [1] https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/
>

Regards,
Bin

