Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313CB347B9A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:04:33 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP53g-0006J3-6w
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lP51u-0004kG-V1; Wed, 24 Mar 2021 11:02:42 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lP51s-0000C2-5n; Wed, 24 Mar 2021 11:02:42 -0400
Received: by mail-qt1-x82e.google.com with SMTP id u8so1604269qtq.12;
 Wed, 24 Mar 2021 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zkpgw+q6sBEuy/RONXS1L9ALzNdKp7enT0/cJcs9PmA=;
 b=vZSQPRmi+xSByZ3HvrAygQ9C9CpS+mljEnxkB/ILm/EAhqDrrsU1KhLz46919D60I3
 jOktFm/I/YZpPd6Guqo+z6LuH8lNdnXg7ZRN90a3bQh4iT5/+6ABF/Ws24f5oWQZsvOG
 B95/NStvLXn3XUcp/Lw34U7X202Bj3Jo8zyeBPKdcvGtG6kZVmjfIiZ/rsQ8v8AEHXKW
 x3X6i7v38KD4oz+SAB//V7coavGBQ27m6/wSKJZ0Gl6Wd9MDUv/GSCBE05GpeL1OXk4p
 BsG7u4ysscNWOPXGxEBQkkhKccngHXeekj5fTCcY7hi/gBI2g/S6SXcibuCqJWcBtQc8
 HAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zkpgw+q6sBEuy/RONXS1L9ALzNdKp7enT0/cJcs9PmA=;
 b=LeBFrOUiyDeoqS+/hws23TkErT2Yy3izpQfGBnJxZu5uRFCpLgqrZgEfgXx/JW9Yyu
 PvpG2WB2Yj2W/UaSO8h0SVNDcaA16/6py3i+R3XpBDfxWeygBYZPLbwrO7bXAzsnIkBW
 /dMcbmBtXTtUV25iaSsnFvB4JKxphMwqXu5erQ71OkhzLANU1JiRE5ob0ACaqMZPctvY
 rzeAQD4RWsusZIc+PaTqfDvzWL09L5DfeHSaGElg7XAfeE9RZAzwTDiqY5lGE+SZs7GH
 BCZOSSlf0djK1AA1H4MD2N1JptbAZLx7RzIgrQdclk9jW/cStIFiaMwy8PZHBTYIRqWi
 6p7A==
X-Gm-Message-State: AOAM532w9i5vbNxE+iLYG2rbQVVimdfvmCFFUHWu7v5VNGc8fkM1+eAm
 PrruTHUY+587E8N2gy+gZzPW2JM8Psjmvnxj8l8=
X-Google-Smtp-Source: ABdhPJxZWZJsipivOrP5xoAOHvkTcm9LgIQPL7o2bzRRVQywbw6LXchopJ8VqouoRjdiPmmXhBoOKY9FKbVvaVBnIqE=
X-Received: by 2002:ac8:4750:: with SMTP id k16mr3256494qtp.239.1616598158578; 
 Wed, 24 Mar 2021 08:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210323182958.277654-1-f4bug@amsat.org>
In-Reply-To: <20210323182958.277654-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Mar 2021 11:00:39 -0400
Message-ID: <CAKmqyKNDkz7-Y1nrn+Rx5JZQ1tBAgT+E-s8QNVtqdtO3CNmVCw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=alistair23@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 3:15 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> When building with --enable-sanitizers we get:
>
>   Direct leak of 16 byte(s) in 1 object(s) allocated from:
>       #0 0x5618479ec7cf in malloc (qemu-system-aarch64+0x233b7cf)
>       #1 0x7f675745f958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
>       #2 0x561847c2dcc9 in xlnx_dp_init hw/display/xlnx_dp.c:1259:5
>       #3 0x56184a5bdab8 in object_init_with_type qom/object.c:375:9
>       #4 0x56184a5a2bda in object_initialize_with_type qom/object.c:517:5
>       #5 0x56184a5a24d5 in object_initialize qom/object.c:536:5
>       #6 0x56184a5a2f6c in object_initialize_child_with_propsv qom/object=
.c:566:5
>       #7 0x56184a5a2e60 in object_initialize_child_with_props qom/object.=
c:549:10
>       #8 0x56184a5a3a1e in object_initialize_child_internal qom/object.c:=
603:5
>       #9 0x5618495aa431 in xlnx_zynqmp_init hw/arm/xlnx-zynqmp.c:273:5
>
> The RX/TX FIFOs are created in xlnx_dp_init(), add xlnx_dp_finalize()
> to destroy them.
>
> Fixes: 58ac482a66d ("introduce xlnx-dp")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index c56e6ec5936..4fd6aeb18b5 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1260,6 +1260,14 @@ static void xlnx_dp_init(Object *obj)
>      fifo8_create(&s->tx_fifo, 16);
>  }
>
> +static void xlnx_dp_finalize(Object *obj)
> +{
> +    XlnxDPState *s =3D XLNX_DP(obj);
> +
> +    fifo8_destroy(&s->tx_fifo);
> +    fifo8_destroy(&s->rx_fifo);
> +}
> +
>  static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>  {
>      XlnxDPState *s =3D XLNX_DP(dev);
> @@ -1359,6 +1367,7 @@ static const TypeInfo xlnx_dp_info =3D {
>      .parent        =3D TYPE_SYS_BUS_DEVICE,
>      .instance_size =3D sizeof(XlnxDPState),
>      .instance_init =3D xlnx_dp_init,
> +    .instance_finalize =3D xlnx_dp_finalize,
>      .class_init    =3D xlnx_dp_class_init,
>  };
>
> --
> 2.26.2
>
>

