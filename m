Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A83B587A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 06:53:46 +0200 (CEST)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxjHF-0007D6-Ap
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 00:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lxjDu-0005jl-Em; Mon, 28 Jun 2021 00:50:18 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lxjDs-0001Ov-Re; Mon, 28 Jun 2021 00:50:18 -0400
Received: by mail-qt1-x833.google.com with SMTP id r7so12682821qta.12;
 Sun, 27 Jun 2021 21:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Yx6F75FUrjBp5lgpVMSwxCPvesz8bhrMpEE4SJAn8k=;
 b=lIuKvnsll0SVh0ScfWx+1U+Jj2IqfvQ2/m0lwpnp1JkA3/0zGN67DJkek4qsaDcN6Z
 +pq7lcrekoug7BfxPysPEnWGpTKqWBthnk6eJoBoeREp1DSdkXjA9QuyC/4nHYHb2FDR
 4fmwfdHowUGoUfj2npjD3hYy8ne696yS7r/VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Yx6F75FUrjBp5lgpVMSwxCPvesz8bhrMpEE4SJAn8k=;
 b=SHSC/zwES4dE3427feJVtRRlvZZ2AJ0J4B9ok2G33SftOEP2wOC03wHDBWje7FV3i/
 hWnHQIL1kV85Q+ZUvx6kXy4OlG2D9M2rG6nwI22SUtTy2hJ/2sXXdkkIzdGV6vxcxq0V
 oa0JvHCh7jwxaQlXegM7y/3cJNrCK3apKvN/2jRwF+wqmD1mv7GsPO4poN0OW5onhWCo
 I8Ki9yZIN/8MFqVzCRBmIOm/Ysbht1Jwji0bSIQLP7VZ1j1hxiM7uFY3ga8zHiqPizE1
 SX9xY0zu4ykL/zRQvEmACIjoThQ+PwXJQz7LlFGa7EMdEGwho9DiFVlfYYcoOvmZ3X31
 VNsA==
X-Gm-Message-State: AOAM533urrl2EfE6pg8aazwv2G2eCTEkSubWXEdIRVyy5+JUpo8iy7gx
 dTm3dB0cHTs6G6lS54zlCIgQhm91GJKjre8Kc4Y=
X-Google-Smtp-Source: ABdhPJzjlmsnaUJVUBUELFJ06RNq8DpNTncGI44NLHWNOz1Lwu6qeXBhKyVbH5vleyiDCYZb2gTsQj8tL53GM0mzg+o=
X-Received: by 2002:a05:622a:292:: with SMTP id
 z18mr16722954qtw.263.1624855815620; 
 Sun, 27 Jun 2021 21:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210625050643.161042-1-joel@jms.id.au>
 <aea5f8fe-438b-4c11-96c4-21c7e361778d@www.fastmail.com>
 <CACPK8Xfrm-hT9iST2HjHMEJa50mgWYPKX4ijApqXLP=jSAXOKA@mail.gmail.com>
In-Reply-To: <CACPK8Xfrm-hT9iST2HjHMEJa50mgWYPKX4ijApqXLP=jSAXOKA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Jun 2021 04:50:03 +0000
Message-ID: <CACPK8XeLWX7D5h4EJaO=KS9cS5kcvE7nf89Hpi7ZkXbMjt6qkA@mail.gmail.com>
Subject: Re: [PATCH] arm/aspeed: rainier: Add i2c eeproms and muxes
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Cameron Esfahani via <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Patrick Venture <venture@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 04:49, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 28 Jun 2021 at 04:33, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Fri, 25 Jun 2021, at 14:36, Joel Stanley wrote:
> > > These are the devices documented by the Rainier device tree. With this
> > > we can see the guest discovering the multiplexers and probing the eeprom
> > > devices:
> > >
> > >  i2c i2c-2: Added multiplexed i2c bus 16
> > >  i2c i2c-2: Added multiplexed i2c bus 17
> > >  i2c i2c-2: Added multiplexed i2c bus 18
> > >  i2c i2c-2: Added multiplexed i2c bus 19
> > >  i2c-mux-gpio i2cmux: 4 port mux on 1e78a180.i2c-bus adapter
> > >  at24 20-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> > >  i2c i2c-4: Added multiplexed i2c bus 20
> > >  at24 21-0051: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> > >  i2c i2c-4: Added multiplexed i2c bus 21
> > >  at24 22-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> > >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  hw/arm/aspeed.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 56 insertions(+)
> > >
> > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > > index 1301e8fdffb2..7ed22294c6eb 100644
> > > --- a/hw/arm/aspeed.c
> > > +++ b/hw/arm/aspeed.c
> > > @@ -677,6 +677,10 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
> > >  static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
> > >  {
> > >      AspeedSoCState *soc = &bmc->soc;
> > > +    I2CSlave *i2c_mux;
> > > +
> > > +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51,
> > > +                          g_malloc0(32 * 1024));
> > >
> > >      /* The rainier expects a TMP275 but a TMP105 is compatible */
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
> > > @@ -685,11 +689,25 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
> > >                       0x49);
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
> > >                       0x4a);
> > > +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
> > > +                                      "pca9546", 0x70);
> > > +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
> > > +                          g_malloc0(64 * 1024));
> >
> > The EEPROMs described in the Rainier devicetree are Atmel AT2x devices and
> > not SMBus EEPROMs. The SMBus EEPROM model uses SMBus block reads and
> > writes which are not what the AT2x driver issues. If you try to read or
> > write data under Linux from the EEPROMs in this patch you just get
> > corrupt results. So as far as I can see the patch needs to be reworked.
>
> That's fine, these are just there so the drivers can probe. As you can
> see the devices have no data in them either, so it's nowhere near an
> incomplete model.

nowhere near a complete model.

>
> If you want to extend the modelling to have the correct VPD data, and
> allow writes where applicable, that would be welcome.
>
> Cheers,
>
> Joel

