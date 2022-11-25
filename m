Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D2638E2C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 17:19:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oybOr-00056V-Pe; Fri, 25 Nov 2022 11:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oybOD-000516-Gp
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 11:17:25 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oybO7-0003yJ-VK
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 11:17:19 -0500
Received: by mail-pl1-x62c.google.com with SMTP id io19so4374916plb.8
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 08:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kpgfuKcMQQBvAsgvb4w86nfpcoKs8KK0mIriIaiWxDM=;
 b=sB9LQD1TUqOPp9EqS/lYcfYycK8/KRsjlASbkw15dulk21cRRko9bMW6Gkqvi/YFl4
 h1/mhb/VfToUiV3ENcanmoEIFtPstLRXZhPv9fI3S/MKs/wd7IFyA4WB3rQyETH8QWsR
 qis+dUPcJAQygpzGK++NtGmKKvhwF61VkV8oCpHCsH4CBUJq1yGTxqrN1VqyiZ4+aN0v
 fa9GpB0Y2tRMH2HSlyuigW1dhEe/yQVZxPbhrUfHLFAIl768rMBj4KdT1RXS/xXq2wH5
 nb2GCv3ValhJKy7gEGBu2rVrpuDQpL6G9QSxS9C0Kht6Al5836SAdn9iWoQNin0j4zrG
 Uy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kpgfuKcMQQBvAsgvb4w86nfpcoKs8KK0mIriIaiWxDM=;
 b=dhdmaHmptEFZq0lCj/o2BiM4HpPsE4m1RAy/Sltbi8X0+3w8z0rQYvTW5783oYW+mh
 xVR7aivHkOzijwKSE43Fm6kkDAZdoC1GCm4m4ZPHNBvNkdnEL3OEMeVZyEEGjv5sJGtq
 3UrNnlTfmFqFi6v68cK5UiZRdWbusNimpM+VlAukk3SGAziXooX0rg4QSM8wUZkQMK9i
 H8Zm54jZTHz+goSFTsulf8hC2totGMLXuvj2BrXG/gCCXdwERM+tBz/JTNXZ+bDFwA+D
 2Ms4dlyq7X7Vh5cpEW8xFBWolEzZylbkNyTzc4f6uIjeem7uqfgs81/zFZ3v43AD4z01
 thMA==
X-Gm-Message-State: ANoB5pljEOluBTvx9nu0auetSt15Iqhdj4IritquZD2IwZyzqt/SSnt0
 q5H5lR1FFmmV1FG6qE71gubfW7thC9DYivr2LQnzbQ==
X-Google-Smtp-Source: AA0mqf7Eaneq2yK8m++DT4097ny4YBF42bAxV8fDTz8MERv3l7Zf+L7Qnk61Xv+vWgY88cOouVcu1mtcyWAOp70F4uk=
X-Received: by 2002:a17:902:e149:b0:186:9295:2012 with SMTP id
 d9-20020a170902e14900b0018692952012mr24002642pla.19.1669393029559; Fri, 25
 Nov 2022 08:17:09 -0800 (PST)
MIME-Version: 1.0
References: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
In-Reply-To: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Nov 2022 16:16:55 +0000
Message-ID: <CAFEAcA_Za5r6a7dNoGh-nS9tXKvGYzeWWyNsFxNsbXgsE4DozQ@mail.gmail.com>
Subject: Re: [PATCH] hw/display/next-fb: Fix comment typo
To: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, huth@tuxfamily.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 25 Nov 2022 at 16:10, Evgeny Ermakov <evgeny.v.ermakov@gmail.com> wrote:
>
> Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
> ---
>  hw/display/next-fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
> index dd6a1aa8ae..8446ff3c00 100644
> --- a/hw/display/next-fb.c
> +++ b/hw/display/next-fb.c
> @@ -126,7 +126,7 @@ static void nextfb_class_init(ObjectClass *oc, void *data)
>      set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>      dc->realize = nextfb_realize;
>
> -    /* Note: This device does not any state that we have to reset or migrate */
> +    /* Note: This device does not have any state that we have to reset or migrate */
>  }
>
>  static const TypeInfo nextfb_info = {
> --
> 2.38.1
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

