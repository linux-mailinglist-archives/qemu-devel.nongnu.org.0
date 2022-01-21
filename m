Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03842495916
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 06:17:48 +0100 (CET)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAmJ1-0004D9-It
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 00:17:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nAmGl-00031B-Sk
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:15:28 -0500
Received: from [2607:f8b0:4864:20::434] (port=40689
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nAmGj-0005xN-UZ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:15:27 -0500
Received: by mail-pf1-x434.google.com with SMTP id w190so1684671pfw.7
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=waInaIGAbto31AX/imfXOQT7MNMtN8ZiXY+dt3u/lLw=;
 b=B3rh92+Wzeh/RPD8JAKc8++jFkWwFcca3etwnSmtjtvOatyFK89mwOCV4WH6TiH0sD
 nZN0Tqq7c0TikBL/Uwu3dEqa2nlOCKbBzrahokaDwFC9+XBgztOjQulsSWY6PX7pDazj
 g79S4G07lov5mHLzfGlXo9ZKl+eS1TAV9Cq5W+mpakH8fM2h4eALKml1sw8R664c5fpy
 +fGQFovFXYvlsAq5BnQT5i4NRW1U15hQ2+rumDV+TNug32e+TOuwjiZvdSy60iNlvAcj
 FPePfqy7whXbP+vw+UtlnIlfasTEZBGdIC9hxSwu+DleUOJdXyZ2o35dkrxmdjwFnomo
 wzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=waInaIGAbto31AX/imfXOQT7MNMtN8ZiXY+dt3u/lLw=;
 b=5J4ddKQMtkTRt5pOQu5hE6iBRUEt165Dw+WhOrS9xyB7uFTjD8wPTIFjErq257BvFn
 rdL/m1sdR1n9htdvBCJA34kxIBhdQuw5WJslXrU27Wa647EOi6kk7kt8tOiu4iWAXrWU
 5iihV7Zp1mHTzBe1gZHG+W34SFs9WmLOQwS/hFr+y06c4+Wb0ktLWJEjiYVrJxSGQiFn
 Kbr37WVC03owVxpGSBjR4KSABR8h8PqdZE4vki6qZteBdJBAphEpMECoWI7QS6iPy8Vf
 dvXck+DUU5FJNIjeCM4XlZ6atFAdORIa2Hi+yw7dfxWXX+JL8QJIlRfokUmllNvMEBLm
 pVJw==
X-Gm-Message-State: AOAM530szdJXNYcHsGCDwLbKDhfgsiKuTJ7/ihNQ+Vlee+xYiIQCl9VD
 YHvEpTsfLRSgf04k9j5u0IRbww==
X-Google-Smtp-Source: ABdhPJzX1JIkUpxyX5xXBA6yYl6WKrz2Vy98DBwDpn6qpPRKgkFYW2RqCCTkEVabWOtokTbZU/KKIw==
X-Received: by 2002:a63:e448:: with SMTP id i8mr1844643pgk.206.1642742124204; 
 Thu, 20 Jan 2022 21:15:24 -0800 (PST)
Received: from anisinha-lenovo ([203.163.243.216])
 by smtp.googlemail.com with ESMTPSA id o2sm3723625pga.57.2022.01.20.21.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 21:15:23 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 21 Jan 2022 10:45:17 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/armv7m: Fix broken VMStateDescription
In-Reply-To: <20220120151609.433555-1-peter.maydell@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2201211041540.889046@anisinha-lenovo>
References: <20220120151609.433555-1-peter.maydell@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 20 Jan 2022, Peter Maydell wrote:

> In commit d5093d961585f02 we added a VMStateDescription to
> the TYPE_ARMV7M object, to handle migration of its Clocks.
> However a cut-and-paste error meant we used the wrong struct
> name in the VMSTATE_CLOCK() macro arguments. The result was
> that attempting a 'savevm' might result in an assertion
> failure.
>
> Cc: qemu-stable@nongnu.org
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/803
> Fixes: d5093d961585f02
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
> It's a shame there's no way to type-check that the struct
> name used in the VMSTATE macros is correct...
> ---
>  hw/arm/armv7m.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 8d08db80be8..ceb76df3cd4 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -520,8 +520,8 @@ static const VMStateDescription vmstate_armv7m = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> -        VMSTATE_CLOCK(refclk, SysTickState),
> -        VMSTATE_CLOCK(cpuclk, SysTickState),
> +        VMSTATE_CLOCK(refclk, ARMv7MState),
> +        VMSTATE_CLOCK(cpuclk, ARMv7MState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
> 2.25.1
>
>
>

