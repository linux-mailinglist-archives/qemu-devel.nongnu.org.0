Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F70509E4B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:10:38 +0200 (CEST)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUhp-0008D9-Bg
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUMH-0000MK-Ht
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:48:21 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:41856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUME-0005mx-8i
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:48:19 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ebf4b91212so47554557b3.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JLWf7xlwiNqaTYa9Ly9dPPbhY4fAchbkPfDbw7UIEXc=;
 b=XxnilaRqGvMz9L4itPjjMzwfadevYwlz0rjj7nOr6C2rC46LcEIznZexRisiI0Z3fV
 J6pHwYkPq2Wz6JzyJuHzd00A6QYD/mxR6hFW+q3CNtYT1a+x4PqlI53DNsAk3hjCnB7Q
 kufMyqIgp8FoReFMIAQK7dbx0hIiaMwV154aqJe8qGu6F977pvkyGukWk4pnCKU9rwK/
 KczylhrabSxVehqD8B+f2OgDs8sM9jPUrXOaoTRtc02Kz4Vlun6OogHR8DIqjRQ+0KwY
 G3PkSEAKqvPg3AmaSpSw1jK37IfHGl9cl+pImF17Q7OuOCWkDVrqya+0UQtiUFKajgol
 cUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JLWf7xlwiNqaTYa9Ly9dPPbhY4fAchbkPfDbw7UIEXc=;
 b=OsPZ+JMT6z055m1T+GaR3K6nu+Np7022bY9D2taak9lsFl4ur/HHnLOcprXshx5N3D
 YOBoJjK0G7wUqxzkIF7DsdsJJX4z0cvlkOLr/SetV3V0EKwhHBlmXeygRIdKqWanOvvN
 RSYUhNL6takJkagrnZyU1mvY5EggeWfwiFfyIxe2r9RiSVX3+f5FKCJ1QX9OJ3neBEc2
 NegAQYbS4et/3uRUHfj17bF9iT/Cfqjc42Mm0wqeofJ2lqqoDroEJEfiGkujbp+S7LGW
 ourKMRFwZRtAIonVDpuYbXnPUYb1amx7/UC7u1lTwbka0HqI88JpthdbMInP3usyivMi
 vwAw==
X-Gm-Message-State: AOAM5303wWCGjY6y0XHirKjSfElDfJoR/lPdCiz4K/k+ubD8ojD6TrcG
 O2bu+AqQI+A8H68I7dJa7Q2qbbtaV2g5yxwwy8Cptg==
X-Google-Smtp-Source: ABdhPJxnhTTKLKjnfNQ3qT8kaNELol4KAuWWEm2bV5pJb34j6AEbXEOrTw0aXBcPs4ZSndgMfDRpY0VHIM8MqNEiPe4=
X-Received: by 2002:a81:4e11:0:b0:2f1:47a0:5972 with SMTP id
 c17-20020a814e11000000b002f147a05972mr26417036ywb.469.1650538097198; Thu, 21
 Apr 2022 03:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-3-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:48:06 +0100
Message-ID: <CAFEAcA_dYEbSziv9AdkkR85YybUWQr2m-Phnzsts5R1+t3Bg9Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1 02/11] hw/ssi: Make flash size a property in
 NPCM7XX FIU
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> This allows different FIUs to have different flash sizes, useful
> in NPCM8XX which has multiple different sized FIU modules.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  hw/arm/npcm7xx.c             | 6 ++++++
>  hw/ssi/npcm7xx_fiu.c         | 6 ++----
>  include/hw/ssi/npcm7xx_fiu.h | 1 +
>  3 files changed, 9 insertions(+), 4 deletions(-)

> @@ -525,7 +522,7 @@ static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
>          flash->fiu = s;
>          memory_region_init_io(&flash->direct_access, OBJECT(s),
>                                &npcm7xx_fiu_flash_ops, &s->flash[i], "flash",
> -                              NPCM7XX_FIU_FLASH_WINDOW_SIZE);
> +                              s->flash_size);
>          sysbus_init_mmio(sbd, &flash->direct_access);

Creating a zero-sized memory region if the user forgets to set
the flash-size property is going to be a bit confusing, so I think
it would be better to have at least a basic sanity check of the
property in realize.

Otherwise looks good.

thanks
-- PMM

