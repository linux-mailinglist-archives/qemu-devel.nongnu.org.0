Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BAA624809
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 18:12:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otB5U-0006SJ-JY; Thu, 10 Nov 2022 12:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otB5O-0006PK-PN
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:11:30 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otB5N-0006cE-9x
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 12:11:30 -0500
Received: by mail-pl1-x629.google.com with SMTP id v17so1943104plo.1
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eAtfAc4vsgmMRzHUGzkYbYPULl2dI9Osvllw50h4tBs=;
 b=yQZ2bNqgSiQi96Bd0yEiFZz3Qn98QTKK6/LLLOrmc7XaN8ecLqVoXawhDhIAm66GdH
 45628LwgI9P7K8TMFHAXkNqU0nteeOxr8++qNUdoJncD6NjhnbBtQyPaBm5sxMy787kK
 HQDQgXOJtGvp2maaIFfSgBY1Ba5BSYLUyHsChypvKYaRvVqWOfo5Ad5MFcz1ScA9wWqr
 AWg+U8Up5RT7Es/SOUwyccQKWSzfFGCo0MhIu5HlzUpcrZ0sCZKtRr28lf+LYeNa4itJ
 3Uz9NC83uL9hNg3+2jINkyWLYCCfmcsN+0nafVb4uY9ZFgxpSJ1/BN62fWYQ0lgdjVAg
 6MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eAtfAc4vsgmMRzHUGzkYbYPULl2dI9Osvllw50h4tBs=;
 b=tc1OFVvAgSkKbAnUfBc8CwMzcb81Q+QysayNCAIgoJu48mwUBJzg817xXfHOPd4hnS
 JeI6/azyz0mY7o6tZFT3GVVbkjXXUjlROWN1U9JuL2CNeTk41E6hmasG3mJLkduRgnBz
 SXQT624y4IAaFRzz/+N8arfiaNlzwshwm7Zjj/9cfEU6oGlMt0AuyOM2kbeQLvrkuM+p
 PriG6RQO6WQhAQhCDGtzDQmnqA8JDLVo5vOfkILaAaZAjGxPJcP/8ffctgY36rL2K/He
 uHduu1ZWnBedrsPxQSTfJeA+ybw54PojLKNSQXLYvsXQP4uP+6tKSoP5rUYpMn9gp6jP
 OBjg==
X-Gm-Message-State: ACrzQf2OFXx8PH6cUnKd3oYoziJywm7YkQ/1vRsxvpOjFqqbecYfK0Yn
 lR5x/4Al7ZDOcqU/KXCXl1qMU71Wx1VNhx2UCMAczA==
X-Google-Smtp-Source: AMsMyM5kfUR9HlWqZHph5E5tyYSMbPTMj8lh9FbKzK61X85uckIJhazqV7KhMPXaAVIeHJCzmsXG274ZAcl76a/rIdk=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr65154098plb.60.1668100287788; Thu, 10
 Nov 2022 09:11:27 -0800 (PST)
MIME-Version: 1.0
References: <20221022054746.28217-1-vikram.garhwal@amd.com>
 <20221022054746.28217-2-vikram.garhwal@amd.com>
In-Reply-To: <20221022054746.28217-2-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 17:11:16 +0000
Message-ID: <CAFEAcA9BnPXXm8a9qr95R50g_dXBXcVpJst4KDTaoZzdVV8FAg@mail.gmail.com>
Subject: Re: [QEMU][PATCH v2 1/5] MAINTAINERS: Update maintainer's email for
 Xilinx CAN
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, francisco.iglesias@amd.com, edgar.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Sat, 22 Oct 2022 at 06:56, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e3d5b7e09c..538af2885c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1751,8 +1751,8 @@ F: tests/qtest/intel-hda-test.c
>  F: tests/qtest/fuzz-sb16-test.c
>
>  Xilinx CAN
> -M: Vikram Garhwal <fnu.vikram@xilinx.com>
> -M: Francisco Iglesias <francisco.iglesias@xilinx.com>
> +M: Vikram Garhwal <vikram.garhwal@amd.com>
> +M: Francisco Iglesias <francisco.iglesias@amd.com>
>  S: Maintained
>  F: hw/net/can/xlnx-*
>  F: include/hw/net/xlnx-*
> --

Hi; I'm going to take this MAINTAINERS patch into target-arm.next for 7.2.

thanks
-- PMM

