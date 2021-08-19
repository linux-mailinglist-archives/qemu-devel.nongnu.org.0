Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A363F1399
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 08:33:47 +0200 (CEST)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGbcW-0003cF-PS
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 02:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGba6-00010B-QG; Thu, 19 Aug 2021 02:31:14 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:42673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGba4-00085R-4c; Thu, 19 Aug 2021 02:31:14 -0400
Received: by mail-il1-x12f.google.com with SMTP id s16so4844712ilo.9;
 Wed, 18 Aug 2021 23:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=//vqOUGpZ9/wEQjjJGTH1x9Ja0dFRzdMR2q9Vksp3TA=;
 b=iDbn5t10jYEAuteauuCEupE37LNfTwOAghf9f0JXwBrs/JW/XWgS8zJIShVuw00Vcr
 sYgIFiINerA4VyQa31H7lccAnnXkYKEA7w3JdEktMy3W9ABwuK2EpQe1XhmDFPoFuAEd
 8s//4c+ibe9SVXWU6iISJ148VwS4SyWznUhk4xS6fAvqSmmP/mrmcRJu/4ptZjZCdU2f
 Mjs9eymGQvOQCtM2va9iu1AVLncU3nqC4aYdI289YslS+zGN2IBFlpffGpK+W7qJpZVu
 lgwJVpFrc5WfyjEeXkKDy+tP3CAbdYatuvWJLCafDne1Y2c/aQFqTUJU/C0CSitqHljW
 DwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//vqOUGpZ9/wEQjjJGTH1x9Ja0dFRzdMR2q9Vksp3TA=;
 b=Ch/WINev80I+2RDfgl2cMDopOnhsd4yLNN0aUTK9rc7EgJf7+DyEawBGBDBhQR0v0F
 27cjvHcJwzyqFu47Ty4/ku+k9eRGu+kgwnTnzF0xsQDFEgjXGvuNtM4EaVNn68kOteXX
 MwPBoWaUilOxqKExW4HHuOgmFB+Tl8FwCLfIGnCAks0WjbirSGiRBcSgNo9G7a+YObnC
 eXhQyvM9D0olOcctGaWvDprlvBeSBfyeTq1IZRtnV3Bs9+muXhVzoASFGkp2qITFVMzd
 4riC/I/AYpxbSrYKx7716/Kccvj2DFAYVRSDD8XKUJMLPEvSwPHC6UV5smpF8m44LZcc
 fI6w==
X-Gm-Message-State: AOAM532RUZW32SrjLquaedAr7Z37ssE+PGFn7nuDfEF1rfwjPY8ylGzp
 upFLYHEcaSf/6gw9NQsAtSj9YDPj+eKwRBD3n1I=
X-Google-Smtp-Source: ABdhPJxNQiVQNWPVVKl5mYZKisd6ismeXwSiS2Gw32hJUkVya/cnO2GYb5gFhVEIhakv2mHPpq5bX5WMJduYdqn8bGs=
X-Received: by 2002:a92:ce03:: with SMTP id b3mr8747161ilo.267.1629354670603; 
 Wed, 18 Aug 2021 23:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210819031525.653995-1-tong.ho@xilinx.com>
 <20210819031525.653995-2-tong.ho@xilinx.com>
In-Reply-To: <20210819031525.653995-2-tong.ho@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:30:44 +1000
Message-ID: <CAKmqyKOchFCUijkS8o9Fn--7-Q91khZ2V6meaG0NaUbXd=9M9g@mail.gmail.com>
Subject: Re: [Patch 1/2] hw/arm/xlnx-versal: Add unimplemented APU mmio
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
Cc: Edgar Iglesias <edgar.iglesias@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 1:20 PM Tong Ho <tong.ho@xilinx.com> wrote:
>
> Add unimplemented APU mmio region to xlnx-versal for booting
> bare-metal guests built with standalone bsp published at:
>   https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit
>
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal.c         | 2 ++
>  include/hw/arm/xlnx-versal.h | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index fb776834f7..cb6ec0a4a0 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -376,6 +376,8 @@ static void versal_unimp(Versal *s)
>                          MM_CRL, MM_CRL_SIZE);
>      versal_unimp_area(s, "crf", &s->mr_ps,
>                          MM_FPD_CRF, MM_FPD_CRF_SIZE);
> +    versal_unimp_area(s, "apu", &s->mr_ps,
> +                        MM_FPD_FPD_APU, MM_FPD_FPD_APU_SIZE);
>      versal_unimp_area(s, "crp", &s->mr_ps,
>                          MM_PMC_CRP, MM_PMC_CRP_SIZE);
>      versal_unimp_area(s, "iou-scntr", &s->mr_ps,
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 22a8fa5d11..9b79051747 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -167,6 +167,8 @@ struct Versal {
>  #define MM_IOU_SCNTRS_SIZE          0x10000
>  #define MM_FPD_CRF                  0xfd1a0000U
>  #define MM_FPD_CRF_SIZE             0x140000
> +#define MM_FPD_FPD_APU              0xfd5c0000
> +#define MM_FPD_FPD_APU_SIZE         0x100
>
>  #define MM_PMC_SD0                  0xf1040000U
>  #define MM_PMC_SD0_SIZE             0x10000
> --
> 2.25.1
>
>

