Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D4D65C526
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClB2-0001Vf-7q; Tue, 03 Jan 2023 12:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClAx-0001TV-3i
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:34:14 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClAv-0006DM-B0
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:34:10 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so23885609pjq.1
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 09:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxpRNt958yOhVoSX6hTSrvyOd2YHsZeL1+SzAP5GcSI=;
 b=aNs5EM4rs/NxU+9ZN/Ty2sDjq2ku95dYa7GAkB+pH/fzUEnEpa7nOETKxzJM8pwD0s
 bV22MCufo5Inp8ex5ex6ZHz5IJDVNVrdPJi1v1aDWyZFEt9x9RWi0nsUQrxl0MjWYKWf
 aPx14irOk+Rak3vSdVPt5lSg2M8yldGhvogocrgr/ZKh50IfCg6ZC6EJjP3N+6OYWM8Y
 mULIIGKfYUYncFEMO0QD9g2p0iBlOj0QojC1G4wV0H809+WSM4MQN7czBWEW/vVKvOAN
 0bNodmPt0mlzuJfuBfP39GiOp9dmkTxxNOFjrTbux6xK6T6RqeaTDTuZXi7q7nhNIUBr
 EaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxpRNt958yOhVoSX6hTSrvyOd2YHsZeL1+SzAP5GcSI=;
 b=JYLydJPCm9+kFp0ai1VI/BNzH1ByjRHbFWVbtgx4XW+YVnntu4uhrrr8m6vnNrgYH5
 GYol3ocfqjnnOgq6089AJTBbLbadHgzi2euDDZMV9KDRGxd6a1e6RiVvPFnMn0uARDxA
 5NtLj6NQnlblfp7yF5TIYOwtOMUY6ObXKKyPBIdC6enzPp2nWPonCiXfAioTxb6TrwKr
 Zt9u5mhKbkxR/qkrxp0/ttC4KalSB/0Rt5pKe2agD5YTTz5JQzGMs3ekUnI3s7bjEnI8
 2HPeYj4UqgsQY7ebzYMC5AVRdCrubPuWZy7m9v9a2aM0Xg5YJZ6TzF8QN+7mxKS0PCJi
 l86w==
X-Gm-Message-State: AFqh2kq0ayCWgEN8vJlwM/o0Plq3121zk2UmRtxAiAfz/I3BB3ChVQMI
 xFOXKLw+SV+aMKeyCyMuRmdFRUhl1OGsiMV/PRejsg==
X-Google-Smtp-Source: AMrXdXthJuOEuybEaFBz88pObMoFlWlW+q9UdsJn+BJhaSnkvyIqQQEzljXwhT+lxsZoSOR9+7jJfr0P/axTR6Dnj34=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr3575491pjs.19.1672767247916; Tue, 03 Jan
 2023 09:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20221222215549.86872-1-philmd@linaro.org>
 <20221222215549.86872-2-philmd@linaro.org>
In-Reply-To: <20221222215549.86872-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jan 2023 17:33:56 +0000
Message-ID: <CAFEAcA9KD8WwPTKVQQUfAZxaqA=ASweZtJ=sAV0Vd8TkpqDBOw@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/arm/aspeed: Fix smpboot[] on big-endian hosts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 22 Dec 2022 at 21:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> ARM CPUs fetch instructions in little-endian.
>
> smpboot[] encoded instructions are written in little-endian.
> This is fine on little-endian host, but on big-endian ones
> the smpboot[] array ends swapped. Use the const_le32()
> macro so the instructions are always in little-endian in the
> smpboot[] array.
>
> Fixes: 9bb6d14081 ("aspeed: Add boot stub for smp booting")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/aspeed.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 55f114ef72..adff9a0d73 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -194,22 +194,22 @@ static void aspeed_write_smpboot(ARMCPU *cpu,
>           * r1 =3D AST_SMP_MBOX_FIELD_ENTRY
>           * r0 =3D AST_SMP_MBOX_FIELD_GOSIGN
>           */
> -        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
> -        0xe21000ff,  /* ands    r0, r0, #255          */
> -        0xe59f201c,  /* ldr     r2, [pc, #28]         */
> -        0xe1822000,  /* orr     r2, r2, r0            */
> +        const_le32(0xee100fb0),     /* mrc     p15, 0, r0, c0, c0, 5 */
> +        const_le32(0xe21000ff),     /* ands    r0, r0, #255          */
> +        const_le32(0xe59f201c),     /* ldr     r2, [pc, #28]         */
> +        const_le32(0xe1822000),     /* orr     r2, r2, r0            */
>
> -        0xe59f1018,  /* ldr     r1, [pc, #24]         */
> -        0xe59f0018,  /* ldr     r0, [pc, #24]         */
> +        const_le32(0xe59f1018),     /* ldr     r1, [pc, #24]         */
> +        const_le32(0xe59f0018),     /* ldr     r0, [pc, #24]         */
>
> -        0xe320f002,  /* wfe                           */
> -        0xe5904000,  /* ldr     r4, [r0]              */
> -        0xe1520004,  /* cmp     r2, r4                */
> -        0x1afffffb,  /* bne     <wfe>                 */
> -        0xe591f000,  /* ldr     pc, [r1]              */
> -        AST_SMP_MBOX_GOSIGN,
> -        AST_SMP_MBOX_FIELD_ENTRY,
> -        AST_SMP_MBOX_FIELD_GOSIGN,
> +        const_le32(0xe320f002),     /* wfe                           */
> +        const_le32(0xe5904000),     /* ldr     r4, [r0]              */
> +        const_le32(0xe1520004),     /* cmp     r2, r4                */
> +        const_le32(0x1afffffb),     /* bne     <wfe>                 */
> +        const_le32(0xe591f000),     /* ldr     pc, [r1]              */
> +        const_le32(AST_SMP_MBOX_GOSIGN),
> +        const_le32(AST_SMP_MBOX_FIELD_ENTRY),
> +        const_le32(AST_SMP_MBOX_FIELD_GOSIGN)
>      };
>
>      rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,

Can we use the write_bootloader() function, which handles the
endianness question correctly and is how other boards do the
"put a little lump of code into the guest" job ?

thanks
-- PMM

