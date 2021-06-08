Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AEE3A0441
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:57:22 +0200 (CEST)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhqj-00033X-9k
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lqhpX-0001XB-IL
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:56:07 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lqhpV-0003QG-B0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:56:07 -0400
Received: by mail-qv1-xf34.google.com with SMTP id l3so4461745qvl.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JoiZkH2m/01RiKGFsA3KtKvH441QPed40aWHbK03Aqc=;
 b=YH9eDDgd6U7poMxwzC8bXsb+PK4Bn+HzzGjhvNgGnknLMPCXXkEJTBzLU0mQgLcjMA
 pCjZByIFti9Ygh7QpJW33U4OOMp+eV/xwnB34+mx+N4B2K7gBPIyhq8bXqTwawzo09Mw
 pP1u7qmN2uHPz+o3jWuC9uOxryBW2346Ku05HOnyx8merLyJtyp77j6k7KanHsfT9tIM
 x1QTSR9CM8oisUHR2ksvubgrknunurJHv5mz0xrAFSEE3831z6VWG0SU5RP10kOqAIDv
 ieKWarSWw+Gh3+gEu0QsLdaCV3mYiHQUc5f9aaVmR4vE9jBqYUrS0rn9OEYUqcWRSMy4
 l5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JoiZkH2m/01RiKGFsA3KtKvH441QPed40aWHbK03Aqc=;
 b=JdnYfrezJ656PVh2qbHv+DjT2/ksmLU4X7wjxfSgm31SHLdh9RsHyZdPZiY9otqtWk
 tN9iGwy/XVlqAmgOfVQt1bEuxQkKDQxjwEwkMZawYxLZeLH9E6Cf2Esr1zOUFpIkzzB8
 251RWSxk/KZhOOt97F00W2SUm+V31AThSzkqYG6ygJ8VS4dOZpRg36m5kdU+Gk+uUAQ6
 /lKBA/Q+GuOxkhul7BU+TpKjGl53N69QQLOTlMbq+2IB7Bz+mTjnFu9qY9Z2Xrb9L2xh
 kbE08c8z0s0S4uHKMj35Oq+kyGDqv81MDdMg3I3M4tVCOevo+68YNdb2cLkQHA9Kx7k5
 uHfg==
X-Gm-Message-State: AOAM533DTl6m7VHTA2id2VSyfOUjsvXJz+dlMS0kRnRvPJfvXRh2+pFR
 HyvUNF9uA1XCrOpw+BjPpFz9CI3IZ9jNvccbUMSKZw==
X-Google-Smtp-Source: ABdhPJwFgjKJjIumyg0RzKomLs1+3Qn4/AjnqP1prK5fA+uZIUJUlRrvG22+6S7sMAqAgZaaLbkVxwIc139fGCvNDNs=
X-Received: by 2002:a05:6214:c88:: with SMTP id
 r8mr1942910qvr.58.1623182163548; 
 Tue, 08 Jun 2021 12:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-5-venture@google.com>
 <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
 <CAO=notyU64PAS003P97hiZ+V3ShSWiF3OmBRfL5D9fOJQByjEQ@mail.gmail.com>
In-Reply-To: <CAO=notyU64PAS003P97hiZ+V3ShSWiF3OmBRfL5D9fOJQByjEQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 8 Jun 2021 12:55:52 -0700
Message-ID: <CAO=notxHN_JVuyVTO7p+85zWOjeY_uxFfwdbjJXe94qdKhHD0A@mail.gmail.com>
Subject: Re: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
To: Joel Stanley <joel@jms.id.au>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=venture@google.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 10:18 AM Patrick Venture <venture@google.com> wrote:
>
> On Tue, May 18, 2021 at 4:27 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
> > >
> > > Enables the pca954x muxes in the bmc board configuration.
> > >
> > > Signed-off-by: Patrick Venture <venture@google.com>
> > > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> >
> > Not sure about this one, there's no device tree for it in Linux.
>
> Yeah, this was just a pick-up from grepping other BMC boards.  I added
> these going off the comment alone.  I'd be okay with dropping this in
> the series.

In this case, the number of patches changed within a version change --
should I start a fresh series or just bump the version and drop the
last patch?

>
> >
> > > ---
> > >  hw/arm/aspeed.c | 22 +++++++++++-----------
> > >  1 file changed, 11 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > > index 35a28b0e8b..27fd51980c 100644
> > > --- a/hw/arm/aspeed.c
> > > +++ b/hw/arm/aspeed.c
> > > @@ -541,14 +541,16 @@ static void swift_bmc_i2c_init(AspeedMachineState *bmc)
> > >
> > >  static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> > >  {
> > > +    I2CSlave *i2c_mux;
> > >      AspeedSoCState *soc = &bmc->soc;
> > >
> > >      /* bus 2 : */
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
> > > -    /* bus 2 : pca9546 @ 0x73 */
> > > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x73);
> > >
> > > -    /* bus 3 : pca9548 @ 0x70 */
> > > +    /* bus 3 : */
> > > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9548", 0x70);
> > >
> > >      /* bus 4 : */
> > >      uint8_t *eeprom4_54 = g_malloc0(8 * 1024);
> > > @@ -562,7 +564,7 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> > >      /* bus 6 : */
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
> > > -    /* bus 6 : pca9546 @ 0x73 */
> > > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "pca9546", 0x73);
> > >
> > >      /* bus 8 : */
> > >      uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
> > > @@ -573,14 +575,12 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> > >      /* bus 8 : adc128d818 @ 0x1d */
> > >      /* bus 8 : adc128d818 @ 0x1f */
> > >
> > > -    /*
> > > -     * bus 13 : pca9548 @ 0x71
> > > -     *      - channel 3:
> > > -     *          - tmm421 @ 0x4c
> > > -     *          - tmp421 @ 0x4e
> > > -     *          - tmp421 @ 0x4f
> > > -     */
> > > -
> > > +    /* bus 13 : */
> > > +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
> > > +                                      "pca9548", 0x71);
> > > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4c);
> > > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4e);
> > > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4f);
> > >  }
> > >
> > >  static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
> > > --
> > > 2.31.1.751.gd2f1c929bd-goog
> > >

