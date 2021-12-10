Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106694703AD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:19:15 +0100 (CET)
Received: from localhost ([::1]:43848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhg1-0002dS-76
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:19:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvhe7-0000W3-QU
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:17:17 -0500
Received: from [2a00:1450:4864:20::431] (port=35564
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mvhe5-0001kE-3g
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:17:15 -0500
Received: by mail-wr1-x431.google.com with SMTP id i5so15497367wrb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 07:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5oXb1JdzoFm+o4WTjSciaye+xc9bhxKDZL2I2abIzqU=;
 b=MnxVjfZvGlAq5QN6BhW8oA1GGwi7QOJsS8LoOQe6a0D5G1OMa5lyyWHFxZ+h9GJLab
 q+bTCVq4J0xag/Ah/0uGoYBdR3Qi0J9WTD2QZqVrSI0JFwjoGO5MQSzs5rCpnTomkzE0
 RCUjbXmVnLOqTJHJSd58UPBEIZtldYpGJFAs2MwLSxfgBDmO5I7Q4OO8bVEC2ZBfDjeQ
 tuKC5p85DHb3sZMfeWYRCAqrSZyWcqwBz33SIthckmUkwP/Ph0OA/QCn7F7E2hAEfcTv
 B+iJc+OpLpHvRpQhyW47HHvw/q2Z2HVAm4s3+a0tGPMUqCmGvLVCCptqXVtyk8j+c2xl
 qt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5oXb1JdzoFm+o4WTjSciaye+xc9bhxKDZL2I2abIzqU=;
 b=CnG5iqNrCTG/cLv07yefvDQG6kwXeNklK9NhVj3YjBogDXM8+LE9Hyn2vPu3Gwui97
 kKE7CN3SKsiuxWSizeloJisfnWj0QT/P5vIjx6Ay2uRyfAzBkd0qZ6aasSN5h1L2j+PU
 n0ZaCT7+BbD/Q/MOVlbWxQEfS6HmDXwRcjjgBVKsTOqjhhly0FhrIffmwH1NBRkjp7G7
 6EaQETufqPOuUt0ZqyNYVf8Mqp0SSMZ1a9v+kV7FxY0inYH/T5Ng4SKYnIz90SRQlVyh
 rbYtxI+BZH5cnNXwq8as6IyuNZAmOeR9cyHwcOO01l87AR0qJQP6FrgLYSxcDGDvB+I6
 EoLw==
X-Gm-Message-State: AOAM530iA/5+ZMAYw2bJPCaWFPu9erbZkc/9Q9A/xMQk0KjXX2mot+t2
 wl58H5RgsCbEUaMWyYHJvJQ/1vtwwHwoRQone0to/Q==
X-Google-Smtp-Source: ABdhPJwRtX32qtiGFlwK5hgTqotub1/eIveq4dXRNCB3AGBi4f232R91VQC8R5YpyJz3ziVZl66xBcMU09qoFMBtdj0=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr14982240wrp.4.1639149430811; 
 Fri, 10 Dec 2021 07:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
 <20211201154023.13931-3-francisco.iglesias@xilinx.com>
In-Reply-To: <20211201154023.13931-3-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Dec 2021 15:16:59 +0000
Message-ID: <CAFEAcA9qPCqZZCpnkFXe-b4pY8rsQq=pe5k99btS0ALo_FtwhQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Dec 2021 at 15:40, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Connect Versal's PMC SLCR (system-level control registers) model.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 895ba12c61..729c093dfc 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -26,6 +26,7 @@
>  #include "hw/misc/xlnx-versal-xramc.h"
>  #include "hw/nvram/xlnx-bbram.h"
>  #include "hw/nvram/xlnx-versal-efuse.h"
> +#include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
>
>  #define TYPE_XLNX_VERSAL "xlnx-versal"
>  OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
> @@ -78,6 +79,7 @@ struct Versal {
>      struct {
>          struct {
>              SDHCIState sd[XLNX_VERSAL_NR_SDS];
> +            XlnxVersalPmcIouSlcr slcr;
>          } iou;
>
>          XlnxZynqMPRTC rtc;
> @@ -113,6 +115,7 @@ struct Versal {
>  #define VERSAL_XRAM_IRQ_0          79
>  #define VERSAL_BBRAM_APB_IRQ_0     121
>  #define VERSAL_RTC_APB_ERR_IRQ     121
> +#define VERSAL_PMC_IOU_SLCR_IRQ    121

This looks weird -- are these devices really all the same
IRQ number ? If so, you need to create an OR gate and wire
the devices to the OR gate and the OR gate output to the
qemu irq in pic[121].

This seems to be a preexisting bug in this code, because
both VERSAL_BBRAM_APB_IRQ_0 and VERSAL_RTC_APB_ERR_IRQ are
being used despite being the same value. I would suggest
a patch before this one to fix that bug (either by correcting the
IRQ numbers if they're wrong, or by adding an initially 2-input
OR gate for them).

thanks
-- PMM

