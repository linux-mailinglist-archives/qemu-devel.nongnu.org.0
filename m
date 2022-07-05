Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE0E566381
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 08:58:55 +0200 (CEST)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8cWM-0002rd-3m
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 02:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o8cRk-0007xf-UF; Tue, 05 Jul 2022 02:54:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o8cRg-0005i2-E2; Tue, 05 Jul 2022 02:54:08 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n185so6453092wmn.4;
 Mon, 04 Jul 2022 23:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U9ZQ5DG12/Tl/zalRey05nj4oB371ZvMCtuCYAKlJF8=;
 b=fhiKTYC0IFsksRlL3ioFtsNg/Xt3eEiFhVakLB6ynFADshXyK4gmCbEKOsDn2GIcnG
 FzYaJ9XAhXiLG8hxOKGtwJCG4mI/m1/q1jkPGS/axBs4CtPFtDUn7CJgaOijLccgkZZt
 whEF9yVi74UuEQFfm+ML51Mkt6TgWhxghQN80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U9ZQ5DG12/Tl/zalRey05nj4oB371ZvMCtuCYAKlJF8=;
 b=CdxmrYguO7Lbgrq+2kI2m6UGe7+iEV6/evi5DLtlr4x5yB86nUQDcid16/xavmV83J
 PNDwHiFvAQWagv1H5xiMdecWgTeYgRHgBaXc4ur1pNuGdFfkDFZE7AUuchUNJSNC1uCd
 jtXHKSVu2Yx4zG2mh3QTs4wqSdTqlRpXk2A32v/oJQON880IeGFrlirOpbJT9gVN2gNy
 j2FnjiIkZ7tx/pu5u60wGAcAiyN0k6rOGtBtJQIoilaW8xxcOqH67ZYXYjJtiKJ4JUFT
 kMiQ6ue8Iajn/jkY0AdOOsbfZ3enRAAsKQVEcjAuXLHfOUCjyQnDx52pWerQarsTdyUL
 HXFA==
X-Gm-Message-State: AJIora+PHVjLcD6i8ZoFtMSpsq33hC97PfoHVdVJSNY44HcxbmaDBOzd
 utoDQH5PVgO7dB8nsqUhcW3u76Cho82tNeXiFCM=
X-Google-Smtp-Source: AGRyM1uZ3OfH3x86jc7TtxtlBmKteHxFXSWBTFhcXffFGrf4Kn18M7ObQ07JNdQoc4EXCDnGPwmVU0WFxb2Ec38kIjU=
X-Received: by 2002:a7b:cbc6:0:b0:3a0:5716:2034 with SMTP id
 n6-20020a7bcbc6000000b003a057162034mr35521258wmi.147.1657004035778; Mon, 04
 Jul 2022 23:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220704215457.38332-1-peter@pjd.dev>
 <20220704215457.38332-5-peter@pjd.dev>
In-Reply-To: <20220704215457.38332-5-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Jul 2022 06:53:43 +0000
Message-ID: <CACPK8XfcZM+9sk4f=fCtW2zVioN0sgoT=o+dF62U=AMZuUsL6g@mail.gmail.com>
Subject: Re: [PATCH 5/8] aspeed: Add fby35 skeleton
To: peter@pjd.dev
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=joel.stan@gmail.com; helo=mail-wm1-x32a.google.com
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

On Mon, 4 Jul 2022 at 21:55, Peter Delevoryas <peter@pjd.dev> wrote:
>
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  MAINTAINERS        |  1 +
>  hw/arm/fby35.c     | 39 +++++++++++++++++++++++++++++++++++++++
>  hw/arm/meson.build |  3 ++-
>  3 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/fby35.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d9378511b7..147330ddd7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
>  F: include/hw/net/ftgmac100.h
>  F: docs/system/arm/aspeed.rst
>  F: tests/qtest/*aspeed*
> +F: hw/arm/fby35.c
>
>  NRF51
>  M: Joel Stanley <joel@jms.id.au>
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> new file mode 100644
> index 0000000000..03b458584c
> --- /dev/null
> +++ b/hw/arm/fby35.c
> @@ -0,0 +1,39 @@
> +/*
> + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.c=
om)

Can you mention what fby35 means? I keep reading your patches but can't rec=
all.

> + *
> + * This code is licensed under the GPL version 2 or later. See the COPYI=
NG
> + * file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/boards.h"
> +
> +#define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
> +OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
> +
> +struct Fby35State {
> +    MachineState parent_obj;
> +};
> +
> +static void fby35_init(MachineState *machine)
> +{
> +}
> +
> +static void fby35_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +    mc->desc =3D "Meta Platforms fby35";
> +    mc->init =3D fby35_init;
> +}
> +
> +static const TypeInfo fby35_types[] =3D {
> +    {
> +        .name =3D MACHINE_TYPE_NAME("fby35"),
> +        .parent =3D TYPE_MACHINE,
> +        .class_init =3D fby35_class_init,
> +        .instance_size =3D sizeof(Fby35State),
> +    },
> +};
> +
> +DEFINE_TYPES(fby35_types);
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 2d8381339c..92f9f6e000 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -51,7 +51,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>    'aspeed_soc.c',
>    'aspeed.c',
>    'aspeed_ast2600.c',
> -  'aspeed_ast10x0.c'))
> +  'aspeed_ast10x0.c',
> +  'fby35.c'))
>  arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
>  arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
>  arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
> --
> 2.37.0
>

