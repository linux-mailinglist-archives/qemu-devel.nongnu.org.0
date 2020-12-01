Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4342C94FE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 03:09:10 +0100 (CET)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjv6L-0000yd-5B
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 21:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv4o-0008IL-CM; Mon, 30 Nov 2020 21:07:37 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:45313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kjv4l-0000fV-FV; Mon, 30 Nov 2020 21:07:33 -0500
Received: by mail-il1-x142.google.com with SMTP id w8so138940ilg.12;
 Mon, 30 Nov 2020 18:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Z2hSp2O6q5Ke7suLS4q1I5G2Enjs6FUHsIRIQ8QpZo=;
 b=JvKVxTHWatw9whjeSJhIiPiS3FFoF+OVKlAT/jnadovlC7rGI4K8xQKKy750pSwApt
 DtBhHXideOVKa6UD2TQL5uFE0AmV/76ZKxuCZ1BWWlMGVR/9pJC4lDwgZLdr0MgBIYvX
 /yxCUECjxN2mU+EqB3zz3hZ0eTtYIXAFy+VeGdyQ/ditUsBCdJAwVT61iAnNkZBDfb2z
 hYed0B1NyNwCX7MKM8BdM9bpDjqVu/8aya222DIR+bGCltTJNJ7uxdOLoXKZ7zZNEBOw
 vhHttGSDX6cCKYSr+ozFgpJcB3dpk7VLPl6SV2WfolmQzM284+ExtmIqIw0jLmrmTSsa
 lOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Z2hSp2O6q5Ke7suLS4q1I5G2Enjs6FUHsIRIQ8QpZo=;
 b=hOcSsO2hRwH4kXr3zc54zp9W1Z5vJ1LfNPsDVq4tSAOkG9yADjp1pTz5q7MPOTaPbT
 hpuok6jMQFsXud1gN+muDgDNtSMaupLSzHYy2vo7FAgRVejR5iLJsTUJ+MIF6USmdUF7
 xSKcDq3SitQSDcRm2h772BI78k5MAYLpoXtmPXrO2KoQEknxbrVfLrDMN27r/FpXk9xv
 OHw5bpO142s2HtLCU7FBOWPlrGQo714reoMCcTbFApW4sl5yetZEkVoYDOoWlVxas0Dy
 n6ZepPbKwgPsPy/spoOT1YTlBE2mvbhZL4RFC56NZXUsi8Afdo8uS67QDfuPffflS1CM
 OcFw==
X-Gm-Message-State: AOAM531LyI8N54b/3WqC50iB57gUQd/M1NTR8+QYw7DOm6jP68/GbHnv
 oZeP/LN6b34JmzQX1slu3IfOIYuCkrD31dINuuwjSJBwD6U=
X-Google-Smtp-Source: ABdhPJzh3ZXehWvaSwnDc9B5Itwmeakz7c3VJgEBVVUNuNMttL65Jm/6kCIxS00K+thvNGeOtQuFXNELvB52hR+/5qE=
X-Received: by 2002:a05:6e02:ca5:: with SMTP id 5mr670331ilg.40.1606788450156; 
 Mon, 30 Nov 2020 18:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20201124094941.485767-1-f4bug@amsat.org>
 <20201124094941.485767-4-f4bug@amsat.org>
In-Reply-To: <20201124094941.485767-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 30 Nov 2020 17:55:13 -0800
Message-ID: <CAKmqyKOi3KRCTdY3k1ZU=srYt8B7dzOMS9AUKAEME=9XOps8GA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 3/4] hw/arm/xlnx-versal: Add SD bus QOM alias on
 the SoC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
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
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 24, 2020 at 1:51 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> To be able to select a particular SD bus from the command
> line, add a QOM alias on the SoC (using an unique name).
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 12ba6c4ebae..da3ee24a5b9 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -210,6 +210,7 @@ static void versal_create_sds(Versal *s, qemu_irq *pi=
c)
>      int i;
>
>      for (i =3D 0; i < ARRAY_SIZE(s->pmc.iou.sd); i++) {
> +        g_autofree char *bus_name =3D NULL;
>          DeviceState *dev;
>          MemoryRegion *mr;
>
> @@ -224,6 +225,10 @@ static void versal_create_sds(Versal *s, qemu_irq *p=
ic)
>          object_property_set_uint(OBJECT(dev), "uhs", UHS_I, &error_fatal=
);
>          sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
>
> +        /* Alias controller SD bus to the SoC itself */
> +        bus_name =3D g_strdup_printf("sd-bus%d", i);
> +        object_property_add_alias(OBJECT(s), bus_name, OBJECT(dev), "sd-=
bus");
> +
>          mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
>          memory_region_add_subregion(&s->mr_ps,
>                                      MM_PMC_SD0 + i * MM_PMC_SD0_SIZE, mr=
);
> --
> 2.26.2
>
>

