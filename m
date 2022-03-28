Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30824E9105
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 11:18:33 +0200 (CEST)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYlWC-0007ZA-Ps
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 05:18:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlTa-0005As-4N
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:15:50 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=45988
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nYlTY-0007TR-0D
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 05:15:49 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id e203so16051665ybc.12
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AFjPYOtBhBn/wLv9qKb5ww3IIl6i5H38HTopswr/NfQ=;
 b=JMz6XQdD4WPpWsUVegxLVrOLcZSeyq3BFPfi/ZO1vsece479jlLjqFCDRSds5a0CPS
 50FeZMK6e/dIIhcc84Fl0brT3kfgBmP+QhaJLfDzDEtu4KELqwvi0hnmNuuCwiOpyduK
 a62HLg0LBNKDa18CRQQsBl9/GbgTggpB6hVg+U0ffL3OQlzRsTsLPkFZlcN09r/oGQVa
 i5gKbMeJwqPKmwzqM+DcLIxDkh2TIbvzMXiOcEDaJQ2+fbcPH5gvjw1hefB1gqhiRr9U
 iz5jyPY15BcYrJqEk0DkNQ8CfRrhwEPLCyuay8N2UGAV3w+x2s+iqGem37vgQhDupQoP
 OeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AFjPYOtBhBn/wLv9qKb5ww3IIl6i5H38HTopswr/NfQ=;
 b=KIQKB7G1NOukq9b4KOfpXTIYe/GtjkpU+kO1iBuWgOmn9RX0b9py8bySy5TF9HoO+0
 6nnrgWis8tUOz4loWmCcpCXCoz/r7iCMl3rEf/2gi7ZwvuQd30PwgT8P8tY4eb1DVWxH
 sW7TEaljsVmiJcKfqpJJWti24mckn3tbV3cWmkrl3LWJ7fmkuklSOokXxYd4Ph9BIXsJ
 Lja2YYIHUgKGk/x3EgmiuAWvJ0EmdM4ClQTAlBLCTIjiMgL3l7f9t5tsfNYRcjUuUrZa
 f83N+3/LUZCVx9jIr8cSrG3bo9j6Be7dIWUHKSQ7HevQIVqekoeNUd4PG0k47IakFrYT
 L3Zg==
X-Gm-Message-State: AOAM530Ut6sFc1MBKQZ4x6G1rjlCrifxObaYRoZ6FcbDcNJ0vMSpomdo
 5Vl4ltVfjdf388L6ai37PSo4gWluA5dqJNR4y97XKw==
X-Google-Smtp-Source: ABdhPJzLOIEhvsIqcRghMvr7TqqJJdWJPvWSm5RfCTgU0qtoEhxAELu+tf4Z9cPkzJPaDOnN71H8NM76A6QHcu+j7rI=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr21790735ybq.67.1648458947136; Mon, 28
 Mar 2022 02:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-5-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-5-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Mar 2022 09:15:33 +0000
Message-ID: <CAFEAcA-g=XaURutqWd6okRHb3-pz3SegaxRMG5j2s+PThQHdGQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] intc/exynos4210_gic: fix format-overflow warning
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Mar 2022 at 09:48, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/intc/exynos4210_gic.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index bc73d1f11524..5b6f4330a5f3 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -289,10 +289,6 @@ static void exynos4210_gic_realize(DeviceState *dev,=
 Error **errp)
>      Object *obj =3D OBJECT(dev);
>      Exynos4210GicState *s =3D EXYNOS4210_GIC(obj);
>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> -    const char cpu_prefix[] =3D "exynos4210-gic-alias_cpu";
> -    const char dist_prefix[] =3D "exynos4210-gic-alias_dist";
> -    char cpu_alias_name[sizeof(cpu_prefix) + 3];
> -    char dist_alias_name[sizeof(cpu_prefix) + 3];
>      SysBusDevice *gicbusdev;
>      uint32_t n =3D s->num_cpu;
>      uint32_t i;
> @@ -322,8 +318,10 @@ static void exynos4210_gic_realize(DeviceState *dev,=
 Error **errp)
>       */
>      assert(n <=3D EXYNOS4210_NCPUS);
>      for (i =3D 0; i < n; i++) {
> +        g_autofree char *cpu_alias_name =3D g_strdup_printf("exynos4210-=
gic-alias_cpu%x", i);
> +        g_autofree char *dist_alias_name =3D g_strdup_printf("exynos4210=
-gic-alias_dist%x", i);
> +
>          /* Map CPU interface per SMP Core */
> -        sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
>          memory_region_init_alias(&s->cpu_alias[i], obj,
>                                   cpu_alias_name,
>                                   sysbus_mmio_get_region(gicbusdev, 1),
> @@ -333,7 +331,6 @@ static void exynos4210_gic_realize(DeviceState *dev, =
Error **errp)
>                  EXYNOS4210_EXT_GIC_CPU_GET_OFFSET(i), &s->cpu_alias[i]);
>
>          /* Map Distributor per SMP Core */
> -        sprintf(dist_alias_name, "%s%x", dist_prefix, i);
>          memory_region_init_alias(&s->dist_alias[i], obj,
>                                   dist_alias_name,
>                                   sysbus_mmio_get_region(gicbusdev, 0),
> --

More false positives, but here the new code is massively better than the ol=
d.
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

