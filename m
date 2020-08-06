Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF7323E464
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 01:35:00 +0200 (CEST)
Received: from localhost ([::1]:60718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3pPX-00028y-Fo
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 19:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pFo-0007bB-GZ; Thu, 06 Aug 2020 19:24:56 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:34632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k3pFn-00021y-0f; Thu, 06 Aug 2020 19:24:56 -0400
Received: by mail-ej1-x643.google.com with SMTP id o23so143048ejr.1;
 Thu, 06 Aug 2020 16:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MUTGZU5HdIlJFfbhklGqoMshRNbMOvtDtynXC898D/U=;
 b=g0ofkMoU+k2U/TQgbNumqtpp4RnQmcy3TGhrPOgIrt/1SEIJB53hUfGvdjVVFkIUFj
 uFVITBuUF/kPlj40RbFfMn8wEwuoZJvlrRg0Sk2eWvfFO7jbODSrcea8iOy9GpoPx4oj
 PFFeLWgQGEf337vYt/s4gw72A37OWUfWpKiIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MUTGZU5HdIlJFfbhklGqoMshRNbMOvtDtynXC898D/U=;
 b=Ilo5Gei2M6QBfBn7MDiAsjg3SiLMy6hbJHSiqJui96N8ciFL6pGeErbx8kKmLU70gn
 uueWtD1E97gxMhjdDsBst0k5xh2Hbg3hSxt8CPElDgeh7pFmyy1tKXXFwlqroCtf6Lvk
 pkC5mpLH22Fz2BqPUqVo1vRTZ8NjEvRqTMCO2PP8KeisSBLsaJ3WoTTXm6QPFHoM/BLt
 Quq73kqtjHUvD+suddCqkzDLWhRt2bdFyI6L0OigbRaG/M5pegA+La5vp0zpRCG9Sebj
 VmBjfYt3oXEaNL+Sar5QArB342YoJW2dPKcBszY9baah5GMg4jx+qpDHNMOGmupzvmWY
 Q2xg==
X-Gm-Message-State: AOAM533TqWZBzIx61rmWmSs6rDlhi8FzNL4qDZqyQYKmV5phM8fdtOSe
 becd6gu2I1gV13iF2/4OyVtr0TwYp/NOSqCu1ISvcl3M3Tw=
X-Google-Smtp-Source: ABdhPJw3AqZr9nEySHud7Ni6CCobMU3pY9Ofv7H6skIttRw3YCpkt3+MR+NZQKldaeyZlyDDFekPCZK3aLP8DhyZgHU=
X-Received: by 2002:a17:906:4ec3:: with SMTP id
 i3mr6551151ejv.215.1596756293170; 
 Thu, 06 Aug 2020 16:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-8-clg@kaod.org>
In-Reply-To: <20200806132106.747414-8-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Aug 2020 23:24:40 +0000
Message-ID: <CACPK8XczhAmOzOYJxN9x3QT5UszYOqqLP-c0UmuM1axzUVo5YQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2 07/19] aspeed/smc: Fix max_slaves of the legacy
 SMC device
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The legacy controller only has one slave.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 0646e0dca72e..8c79a5552f93 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -259,7 +259,7 @@ static const AspeedSMCController controllers[] =3D {
>          .r_timings         =3D R_TIMINGS,
>          .nregs_timings     =3D 1,
>          .conf_enable_w0    =3D CONF_ENABLE_W0,
> -        .max_slaves        =3D 5,
> +        .max_slaves        =3D 1,
>          .segments          =3D aspeed_segments_legacy,
>          .flash_window_base =3D ASPEED_SOC_SMC_FLASH_BASE,
>          .flash_window_size =3D 0x6000000,
> --
> 2.25.4
>

