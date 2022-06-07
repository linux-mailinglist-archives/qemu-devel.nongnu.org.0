Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75F53F2E2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 02:09:34 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMmr-0002B8-ER
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 20:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyMj9-0000Yv-DM; Mon, 06 Jun 2022 20:05:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyMj5-0002Mq-Jv; Mon, 06 Jun 2022 20:05:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id q26so11477382wra.1;
 Mon, 06 Jun 2022 17:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XC8nlfUJgK7ezOMtieKWSSVFE0uv6XMBx3SKEajzm7M=;
 b=XoGd+ynE6KtN41qqjOxwR7jD1AlfsvhJZWUGvvGx1CusBblsBRZ3DR1A1pNC+nc5u+
 WPSjX72+7MuAsvXn5GroDWLKvkUlX/Mu4cWxlE+JPOguw162h7kN5/m6z2dIpncztaGP
 enbxiqhZfCUPRZQbGmWaVacKxxjt/a/h1R8UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XC8nlfUJgK7ezOMtieKWSSVFE0uv6XMBx3SKEajzm7M=;
 b=CFSb79LPwSa6hje7QjTcpMWr9gQ1NurxmszKn4xYvdrkMeNi2qGo6LLuYuwf9JElkQ
 sfnyzVnh2lb1Zp1E02BZmBsqe6d3XI5MzV5lFqIbKVBYIKkaQU2NGvf5ov/Zwa4QR83R
 qEHOXILRRlWfF+L0RkbMZDQmLCR14Tfle4vqJryOJoruYSPIdjzKgOroCcpkSTRqkc0L
 ebus6cWH0JbGZ9ZyD8b1G6HdfmPVFrajLwGNuzgiT5ckTXk50SR6AzeCizBNb6v1xYGE
 Dh70HZbLsdTKijAOM60/AzBUYG3Rz/npqzoAGxhQOREM4KzBH2FrtnbH6IYBLPa7YRLb
 9JLQ==
X-Gm-Message-State: AOAM5336Et7hH3nuv/9BHMrLXDEca9scrv14co6xiKJpCVW4Sd625+fq
 0IG7Fp1avZNHWggTjY75lj4nfzQ33UzVEXPOqUM=
X-Google-Smtp-Source: ABdhPJw6dMKEYEiOEAPahCfUSam4ZlVeILjLD2GYftStb/B2g8MP2l5KzbGCZjknItOCsDsl54KDXeaIeQQRiC2TQr8=
X-Received: by 2002:a5d:58ed:0:b0:217:dd5:7508 with SMTP id
 f13-20020a5d58ed000000b002170dd57508mr11936294wrd.606.1654560336854; Mon, 06
 Jun 2022 17:05:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-3-clg@kaod.org>
In-Reply-To: <20220606150732.2282041-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Jun 2022 00:05:23 +0000
Message-ID: <CACPK8Xe_9octsmpZwbGQFpYijgVWyED_n1UjXxjUj-fDRHdp1Q@mail.gmail.com>
Subject: Re: [PATCH 02/21] aspeed: i2c: Add ctrl_global_rsvd property
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>, 
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Mon, 6 Jun 2022 at 15:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Joe Komlodi <komlodi@google.com>
>
> The Aspeed I2C controller is used across other SKUs that have different
> reserved bits for the ctrl_global_rsvd register.

I think rsvd stands for reserved? Lets spell out the full name in the
variable to keep it clear.

You could also call global_control_mask (or ctrl_global_mask if you
prefer), as it's a mask of valid bits.

>
> Signed-off-by: Joe Komlodi <komlodi@google.com>
> Change-Id: I606c5933c527274a9d2b0afe559b2e895767636c
> Message-Id: <20220331043248.2237838-3-komlodi@google.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/i2c/aspeed_i2c.h | 2 ++
>  hw/arm/aspeed_ast2600.c     | 2 ++
>  hw/i2c/aspeed_i2c.c         | 4 ++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 4b9be09274c7..3912fcc3ff53 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -71,6 +71,8 @@ struct AspeedI2CState {
>      MemoryRegion pool_iomem;
>      uint8_t pool[ASPEED_I2C_MAX_POOL_SIZE];
>
> +    uint32_t ctrl_global_rsvd;
> +
>      AspeedI2CBus busses[ASPEED_I2C_NR_BUSSES];
>      MemoryRegion *dram_mr;
>      AddressSpace dram_as;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index b0a4199b6960..cc57c8b437d8 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -375,6 +375,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
>      aspeed_soc_uart_init(s);
>
>      /* I2C */
> +    object_property_set_int(OBJECT(&s->i2c), "ctrl-global-rsvd", 0xfffc3=
e00,
> +                            &error_abort);
>      object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
>                               &error_abort);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->i2c), errp)) {
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 03a4f5a91010..97eb9d57929c 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -648,6 +648,7 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwadd=
r offset,
>
>      switch (offset) {
>      case I2C_CTRL_GLOBAL:
> +        value &=3D ~s->ctrl_global_rsvd;

Is there value in printing a guest error when the reserved bits are set?

If not, is it worth having this property at all? It doesn't affect the
ability to model it.

>          s->ctrl_global =3D value;
>          break;
>      case I2C_CTRL_STATUS:
> @@ -730,6 +731,7 @@ static const VMStateDescription aspeed_i2c_vmstate =
=3D {
>      .minimum_version_id =3D 2,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32(intr_status, AspeedI2CState),
> +        VMSTATE_UINT32(ctrl_global_rsvd, AspeedI2CState),
>          VMSTATE_STRUCT_ARRAY(busses, AspeedI2CState,
>                               ASPEED_I2C_NR_BUSSES, 1, aspeed_i2c_bus_vms=
tate,
>                               AspeedI2CBus),
> @@ -828,6 +830,8 @@ static void aspeed_i2c_realize(DeviceState *dev, Erro=
r **errp)
>  static Property aspeed_i2c_properties[] =3D {
>      DEFINE_PROP_LINK("dram", AspeedI2CState, dram_mr,
>                       TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_UINT32("ctrl-global-rsvd", AspeedI2CState, ctrl_global_r=
svd,
> +                       0xfffffffe),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> --
> 2.35.3
>

