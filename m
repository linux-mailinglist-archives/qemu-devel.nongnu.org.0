Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E222256585D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:11:57 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Mnt-0003aM-0b
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M92-0001rb-Iv
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:29:44 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M91-00040A-44
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:29:44 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id r3so16915245ybr.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wcgSecBvIC7MUyWscYl78ojZt/mgmz8XK8PYaXANTPQ=;
 b=y7tP5wqwu5WoLmsXxtKiTjP/ExHJ4i8SXruXYabCSSaLTdNRxXVIKRcDaadhz1jiAt
 LF5mvyZDhakbH2UwOV6tbe6zyLy3MfiarcxY+MLss8BjlvWXBoNxcdRBNmd85YH7gUaj
 9ySUTIUyaCgW+XO4iLR3x2czBLXuJ1q4Ygc1IMxDEhLhzARPrkXbnaXlyx/7ImI9FLR3
 rbhe5FDUG1nbvSeaudx+J0tyFINseaYIHp+qcwONGMcSEeu/OcYlp+5ZBG/TWE/uy7Xo
 j6eKbWUyFbJbOHwormQKDU7u0KhVyx82bwEWxM7ZGMScgtCOnc2JnthtPZ+jiXLbW8Vi
 jlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wcgSecBvIC7MUyWscYl78ojZt/mgmz8XK8PYaXANTPQ=;
 b=AkBLZWIzSek76TxES16VGRay/HD4evhbPIWRtg/ug+2Tf0zgzSLTm/YwYKGsuSRS57
 MpqzAYqux5e+dYdi0PBH7POO4IzUv4Je+tDMFnWRjP8NAdI7rFsOfD71vczei1hK+OAW
 4s3oitWKHMG5wXTo99L1Vc6O2DOrkEPZWwJvw99XuU8KxPnXn/EGzkx33JLDSQbO2xyB
 AVpBjWz7asrGuGSz1McFb5yhPqbNH3ldx7slnw/KW9YKV9ThP9RA014+dEkYmugObXXH
 CszAlOTylzErL59E7h4/uS3DepyBtYOpRV3bsbtOpWOvocSkbP0Hi/rJuTPZG+4u1hLn
 PaMw==
X-Gm-Message-State: AJIora9RkZf7oenbagEQg05WhhZc+6G9KdxiiKhgZrg0rXq0JH32Fzr1
 pip+EqEoMp3BDhRmXOHspZJ7xyUHryvm0F19kZlgcQ==
X-Google-Smtp-Source: AGRyM1tyJ1LbiHjfSGeFm5Aryp+4k3SEPo0+Ygpmhm9H1lLFIZiP1RG3ZGwP0Z8WchjCo1Q4wlo6/BJ+RFjWwy4U2J4=
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr6063226ybg.140.1656941382219; Mon, 04
 Jul 2022 06:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-32-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-32-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:29:31 +0100
Message-ID: <CAFEAcA9r6NeyAwmbrU1RcBkV1etS677rS6E652DUy6FOChXKmQ@mail.gmail.com>
Subject: Re: [PATCH 31/40] lasips2: switch register memory region to
 DEVICE_BIG_ENDIAN
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The LASI device (and so also the LASIPS2 device) are only used for the HPPA
> B160L machine which is a big endian architecture.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 09d909c843..7bf6077b58 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -245,7 +245,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
>          .min_access_size = 1,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_BIG_ENDIAN,
>  };
>
>  static void lasips2_realize(DeviceState *dev, Error **errp)
> --
> 2.30.2
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

