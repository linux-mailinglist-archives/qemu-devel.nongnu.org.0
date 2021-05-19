Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFA38949B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:22:55 +0200 (CEST)
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPuI-0008EQ-Es
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ljPqA-0002Ab-SS
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:18:38 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:41837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ljPq9-0007Iu-1B
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:18:38 -0400
Received: by mail-qt1-x836.google.com with SMTP id t20so10684678qtx.8
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4T96VZMkZ1KnlLg5Ic8ua/tiugK4QPCAdCIRiTPIdVI=;
 b=KT9lUrXPgRFpZWpZ0v+WyzTh6ALo3wGYk6Bg5fgKlNij0C4Rc1YY0kPK83F5GESfsW
 QEf9dDg5BlBxQLrs0qws/PAYQG1ssBxwOBnFsVtPIIOOA20fx2+BaVHnoqBazQHbPRbG
 yzHHgzUz+Nvuv4mHvOfagVVOCriRpEP0GS2DY0btrN2p1KDrWcUe3WcxSSL6nfMVVDbq
 Z59qxw/zREQ7dIAMlL3jaVVXrE95iXsjPp/CcXnBh9mj+8V4A4s9iZXAy+xrx7tjUry8
 p8ClHfC0B4ZfeT029yHomHk6YGZlDyAWa+poyfgzSvxiM7TDJgJyosT8Cs66mVDHEXGH
 fTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4T96VZMkZ1KnlLg5Ic8ua/tiugK4QPCAdCIRiTPIdVI=;
 b=QRBhW2p/ZtK8lHS5A0NgnekkPjasg5DNXG/Rv+o0wXQQOKJbX3VFbmEbds4T30DYcw
 xv7klhD820vjyw8kyVC256iv1kJyG4rKeeoXARUytz4v1CGy57l2rt7qdDN/Umvn+dGG
 4yUHSBLdJCNTouv5P0N4iN3mazW2bJZMJFy0aojqnT0lI/kX+XPMGJ6ETtG1tz3s8w3R
 xrDgYpjYy1Na1QQvQhQqTaiPYFZHabRyqLSVe8P0BCXbOFPERL/YQ+tZN5S6SMZIdn36
 jDtRSfDd9f2cQN8DIZII1c4dPfCuJ2qft2VbHdHHLbZGnv8KIPXRDrbNAZfHvQlbak86
 Lyjw==
X-Gm-Message-State: AOAM5308TD4wbnLOFQjWNfE8lEanHEnEbYByU4IeBDtTON2PEGjgUI64
 h4gtKraqKFVVWQkBEiVtp4ZGkuEsPo8xrZB0+1qgdw==
X-Google-Smtp-Source: ABdhPJz4WVaQxSrH2fhVDltG66JBbDJdC18eUh8PwnQbmGlAXU6jINwhY/coBVnYM+aPfgL9TkDiYQh0Mcj+cSapqB8=
X-Received: by 2002:ac8:6605:: with SMTP id c5mr549129qtp.21.1621444714988;
 Wed, 19 May 2021 10:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-5-venture@google.com>
 <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
In-Reply-To: <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 19 May 2021 10:18:23 -0700
Message-ID: <CAO=notyU64PAS003P97hiZ+V3ShSWiF3OmBRfL5D9fOJQByjEQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
To: Joel Stanley <joel@jms.id.au>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=venture@google.com; helo=mail-qt1-x836.google.com
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

On Tue, May 18, 2021 at 4:27 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
> >
> > Enables the pca954x muxes in the bmc board configuration.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>
> Not sure about this one, there's no device tree for it in Linux.

Yeah, this was just a pick-up from grepping other BMC boards.  I added
these going off the comment alone.  I'd be okay with dropping this in
the series.

>
> > ---
> >  hw/arm/aspeed.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 35a28b0e8b..27fd51980c 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -541,14 +541,16 @@ static void swift_bmc_i2c_init(AspeedMachineState *bmc)
> >
> >  static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> >  {
> > +    I2CSlave *i2c_mux;
> >      AspeedSoCState *soc = &bmc->soc;
> >
> >      /* bus 2 : */
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
> > -    /* bus 2 : pca9546 @ 0x73 */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x73);
> >
> > -    /* bus 3 : pca9548 @ 0x70 */
> > +    /* bus 3 : */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9548", 0x70);
> >
> >      /* bus 4 : */
> >      uint8_t *eeprom4_54 = g_malloc0(8 * 1024);
> > @@ -562,7 +564,7 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> >      /* bus 6 : */
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
> > -    /* bus 6 : pca9546 @ 0x73 */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "pca9546", 0x73);
> >
> >      /* bus 8 : */
> >      uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
> > @@ -573,14 +575,12 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> >      /* bus 8 : adc128d818 @ 0x1d */
> >      /* bus 8 : adc128d818 @ 0x1f */
> >
> > -    /*
> > -     * bus 13 : pca9548 @ 0x71
> > -     *      - channel 3:
> > -     *          - tmm421 @ 0x4c
> > -     *          - tmp421 @ 0x4e
> > -     *          - tmp421 @ 0x4f
> > -     */
> > -
> > +    /* bus 13 : */
> > +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
> > +                                      "pca9548", 0x71);
> > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4c);
> > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4e);
> > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4f);
> >  }
> >
> >  static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
> > --
> > 2.31.1.751.gd2f1c929bd-goog
> >

