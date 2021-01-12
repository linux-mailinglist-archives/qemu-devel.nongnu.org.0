Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035C2F2D39
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:52:39 +0100 (CET)
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHHx-0002Jv-Kw
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGbe-0007XS-2e
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:08:54 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzGbc-0007vB-0H
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:08:53 -0500
Received: by mail-ej1-x636.google.com with SMTP id ga15so2692886ejb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 02:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5q8bAIKPF4oNGobaAtHavlBxUXPUiqP1WlLtWRoD35M=;
 b=VgAuUyzCLX1cCD2bgtbLSFfP7xWXD4asi9Sq1tpKH6UKGTKENiWYNvDS67aTTO5d85
 Oom2dWWs5Ix3EQ1bg37R/CrkVOHlh4vzpSAJNoNpqjWclb9LRQMiXNnu8eQfUmHKY3E8
 NDjahwQKRAX59lwoF76rsL3U3ef28fCUOZo+hIQpeiM/hhG+XxYf7wu+cYeOh4HCszcv
 5dwWTHCNU0a0k5BSF3y7+tbYEdtPlGrzGcayJmDgDchBhQE7FMD7WuEv+RiDQIiyK/bG
 6iZDN6U3QWeFdAd3IPYLa12z7dGL+gTi72uZgc8Kt8Sq+c5xhFQtlEYbfifKJuZ2mptk
 hUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5q8bAIKPF4oNGobaAtHavlBxUXPUiqP1WlLtWRoD35M=;
 b=E6RVbJ2Fxr0AW6c/pRbzwuHmFitr+3iPZoOaOWOLpfezOhSEGaFGX9ZWs3lP+SDmDk
 Bozyvjn/x4ibFj2+XIb3urPUoxYV0GQsdu/gIwwjJvrt4UJ49ANCeWBPcCyuY6iDEbR7
 F7kixNjpmMx4jd3WQtAAcBv+MHk9oaKkq5TO9jK9kt06VnZWWoKMLUhglBRh3/aXIYd3
 aw0qzR0vFIYmoC5ndRwv0xWFP/SH2GfdEG/BXci4GC+uct5mUFadgjyH6xVjp0heqdpg
 zis58vykCL4H6Vx0POV3/plNwzdqLLx8QQzqPEQOgeG109aKjDd1lFWuQCCT1BUcKCJj
 0h1w==
X-Gm-Message-State: AOAM531N6ROKNsqrZyyeF/9/jzdrUtZ2WVQxo00PkMCQzunQ5EJxaPLx
 bfAm3FIGJkjYxVopgUNS+zyC7frV2WztN4g//NFFqA==
X-Google-Smtp-Source: ABdhPJwWDY1VHgwTduFlD06AiML7kTY5AVltEzX95ILR2K8LRmxJAEq7fSXm9xh+XTdt6xtOq/uSfZMIDtwtTpAbWS0=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr2774046ejb.56.1610446130316; 
 Tue, 12 Jan 2021 02:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20210108090817.6127-2-remi.denis.courmont@huawei.com>
In-Reply-To: <20210108090817.6127-2-remi.denis.courmont@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 10:08:39 +0000
Message-ID: <CAFEAcA-Rvjni4-9yohokKai8cuxGG82OEisPi_inyqjnwF_2GQ@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] target/arm: enable Small Translation tables in max
 CPU
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 09:08, <remi.denis.courmont@huawei.com> wrote:
>
> From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>
> Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 7cf9fc4bc6..da24f94baa 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -669,6 +669,7 @@ static void aarch64_max_initfn(Object *obj)
>          t =3D cpu->isar.id_aa64mmfr2;
>          t =3D FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
>          t =3D FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
> +        t =3D FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
>          cpu->isar.id_aa64mmfr2 =3D t;

I've applied this series to target-arm.next; thanks.

It looks like you forgot to send the series as a threaded set of
emails with a cover letter email. This confuses our tools which
find patches in the mailing list (so your series doesn't show up
on patchew or in the 'patches' tool's list of patches), and it
also means I'm likely to miss it when I go through my emails
manually. I dealt with this one manually, but it's a lot more
work for me to do so and it was only really feasible because
there were only two patches in the series.

For future submissions, please can you make sure you send
multi-patch series with a 00/nn cover letter email and with
all the patches in the series being followups to that cover
letter. git send-email will get all the threading details
right for you.
(Single standalone patches don't need a cover letter.)
https://wiki.qemu.org/Contribute/SubmitAPatch has more
info on our patch submission recommendations.

thanks
-- PMM

