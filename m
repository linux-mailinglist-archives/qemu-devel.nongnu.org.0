Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64F65A0238
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 21:43:16 +0200 (CEST)
Received: from localhost ([::1]:34690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQwHT-0002y0-Vj
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 15:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwFh-0001H8-Ou
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:41:25 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:46766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQwFP-0007b5-7K
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 15:41:22 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31f445bd486so487194487b3.13
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2twwo6cjgLTfhoY+vSQysuT7wCW6t7DDp9CdcmsPlSo=;
 b=MqTaidW40oaE66WFNJD6evaj7s5t1xReBX0cf1JiDQwuJRV9KwrssTqy91J32f864A
 SZTDyNADnj/0pbVFEOOtg3DE4W3POKS+d/xnhGhoiUqvjL169gkqaalESgv5oyhGMjs9
 TDCt6QoVsZ3GBcODjbZOrISjqi6uRO5/RoViemArJHoz2gWp8eSA/xLZ1hieD05oVTEV
 xgJqQNuffwGJYfew4Eb1wlPEH1nHaJY8Jh9Q83f8h70TbysxiPI/2V56QBWt2e6t9tBp
 BrhCOc0n/VWoq3C3uQY+gcJ/tGLkAp8ebr7+Uux3Oq4WU1sBwyij/fL34L+8Jtula+Yn
 Agjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2twwo6cjgLTfhoY+vSQysuT7wCW6t7DDp9CdcmsPlSo=;
 b=h/VYIyvEwS8O7TJ5D0lZPOEAzAeZ28Ce+YeX9/hwj2KsZr5ILTG9drUpnwLsF1vOcw
 L8IgJmO6KfjmOtSl9Lnr9WELLQF9bzw3SZGrQpBo9zFH0JaCeyo36H2sVNgjOPNWP4Ve
 oNktp/VhSSWWHazNRbYGvlD8LUVktDU30md+7mzGgXMhsEzuKZq1mg7R3MCMAbobotKz
 mgW3RjUDTfZGrhmtic5UcL5I83mcVhXQuf9mxMVvAP5avuHjU3Z3zEKNVyXlEDUZOCoU
 mAsrkf/Dpat0AWa0S9OwaPTy5d8V1Gekf224IO2KurA3XxsewJ2AOpB6XP40lxa/joXA
 tHGw==
X-Gm-Message-State: ACgBeo0wEemcv21FZC/xwwyDpRtuEtMMQOUuOQBFbq4WBc2MY4h4aQ3P
 +CIRaRtPnLZAalJS3T9blGt1OD41y9lau3TA+68TfQ==
X-Google-Smtp-Source: AA6agR4JNBnfWzV6OrBG59ZCzAXgt7u3I8EDNBrzNAYIw6hkgd0EIzVKiXmZ+Qh0UTrLveqiOoie11oHffQUkwwebu8=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr767872ywf.455.1661370063684; Wed, 24 Aug
 2022 12:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-6-jean-philippe@linaro.org>
In-Reply-To: <20220824155113.286730-6-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Aug 2022 20:40:21 +0100
Message-ID: <CAFEAcA8jCLX8kyZHV4JW+QmKUeH2hL3Rq+q4gsvM1LXioBozYw@mail.gmail.com>
Subject: Re: [PATCH 05/10] hw/arm/virt: Fix devicetree warning about the timer
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org, 
 eauger@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The compatible property of the Arm timer should contain either
> "arm,armv7-timer" or "arm,armv8-timer", not both.
>
>   timer: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['arm,armv8-timer', 'arm,armv7-timer'] is too long
>   From schema: linux/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ca5d213895..5935f32a44 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -344,7 +344,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
>
>      armcpu = ARM_CPU(qemu_get_cpu(0));
>      if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> -        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
> +        const char compat[] = "arm,armv8-timer";
>          qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
>                           compat, sizeof(compat));
>      } else {

Are we really sure there are no existing guests out there that are
looking for this device under "armv7-timer" ?

This used to be valid DT before Linux kernel commit 4d2bb3e65035954,
which changed from "should at least contain one of" to requiring
exactly one-of, and that was only in 2018.

thanks
-- PMM

