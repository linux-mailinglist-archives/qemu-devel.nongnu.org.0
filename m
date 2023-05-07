Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B956F9CAD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 01:17:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvncd-0001ME-6X; Sun, 07 May 2023 19:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvncb-0001M1-Gg
 for qemu-devel@nongnu.org; Sun, 07 May 2023 19:16:53 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pvnca-0006Gu-22
 for qemu-devel@nongnu.org; Sun, 07 May 2023 19:16:53 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-44fdac26696so1149154e0c.3
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 16:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683501411; x=1686093411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fIZrg6Bd68Cu0nAYrGvzJI1ViWvE5yxGslU1gw/3s7M=;
 b=OagNk+GFRj+fU3oODb+09GXjv79ulXHzEzDDK3Pa1r3/wUUNWSts7Ui9JrHyL3iImD
 2c27U5zdjU35VLB2xFYIZzLidLXC7mapTI49q53CR4LuVRQNgYGZM3B93fJihzBmb4UV
 eiSLo+nLQrcs0bP/c9n3e5br9IWC+ryjJvPTV+5OM0ksDg3HzLb2YP3DRO+7nU03KdRV
 mR2Zwd0Kw2Tt2238zls5Vkxq1obw0oQ3rprGArXuzXPJrBCeXKhFcESVJZ7owokBklTL
 jBL9atmcyJrnHY1AV6GlSJKv9gRpCGhJK0CalvRjGxEfc9dobLKNFJtxR1rSj2vtcWWG
 59Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683501411; x=1686093411;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fIZrg6Bd68Cu0nAYrGvzJI1ViWvE5yxGslU1gw/3s7M=;
 b=MdOyvRYT5tFRatnNkQ6tgx3+vYpVBb8pumZPDGe2oTekVUFLKuic4KX0TOtoRs4q47
 rqQ3c1syqUJ/pilIgz40XdjwqG6ramaARyDIh0GllvGiVNvaKBiOnknRXTiFdB2bkxXd
 wT0fRdkXpeSKc8S/Cm1WdRImcqhmDvn5MlsOEGaJUkPD2oIDsCcFPhqb1AtFiewZfl5M
 tR8KPBkxhDR2GtJdkkYGLBUPSMEUkAhHfzaj3a9h1BWA6AMAijtZRu7dtSegsOVh1+No
 Zaf6cL3CbC5rwk6WzAJRJMEV75t15cSYsliDoykaeaau/7aSgmqwoJz8qC7qS1HXz3do
 8Byw==
X-Gm-Message-State: AC+VfDzAYWcKCTAjzxoz5d2gPKxr4ngzyJEhrS/rtpL+FaK6SIMZucf3
 87Xbp/FmsgeJNdbMFwLa8N95490ThN/VKZ3kahsl6NTXkp4=
X-Google-Smtp-Source: ACHHUZ7MIanp2OQVcJ+Aadliwm/OaQDVcAkdIvXpZgeNDAtmBSpVI8NobTykBeOZDyGZee16089pwSjAHAgfkBonR9c=
X-Received: by 2002:a67:de92:0:b0:434:6ea9:2f21 with SMTP id
 r18-20020a67de92000000b004346ea92f21mr2856440vsk.5.1683501410869; Sun, 07 May
 2023 16:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230428093431.10355-1-peterlin@andestech.com>
In-Reply-To: <20230428093431.10355-1-peterlin@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 May 2023 09:16:24 +1000
Message-ID: <CAKmqyKPiCg4V6r89e+71bSPf0wWehdmGpZP7KG8z4m8PCJb1Sg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv: virt: fix pmu subnode paths
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: qemu-devel@nongnu.org, conor.dooley@microchip.com, ycliang@andestech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 28, 2023 at 7:35=E2=80=AFPM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> The pmu encodes the event to counter mappings and is only used
> by the SBI firmware. Currently, pmu is a subnode of soc but has
> no reg properties included, causing the following failure when
> checked with dt-validate.
>
> /tmp/virt.dtb: soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281],=
 [2, 2, 524284], [65561, 65561, 524280], [65563, 65563, 524280], [65569, 65=
569, 524280]], 'compatible': ['riscv,pmu']} should not be valid under {'typ=
e': 'object'}
>         From schema: /home/peterlin/.local/lib/python3.10/site-packages/d=
tschema/schemas/simple-bus.yaml
>
> This patch moves the pmu to top level to make the dt-validate happy.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4e3efbee16..be8f0cb26e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -731,7 +731,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
>      MachineState *ms =3D MACHINE(s);
>      RISCVCPU hart =3D s->soc[0].harts[0];
>
> -    pmu_name =3D g_strdup_printf("/soc/pmu");
> +    pmu_name =3D g_strdup_printf("/pmu");
>      qemu_fdt_add_subnode(ms->fdt, pmu_name);
>      qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu"=
);
>      riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
> --
> 2.34.1
>
>

