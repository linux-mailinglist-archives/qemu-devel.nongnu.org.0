Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB798461CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:34:26 +0100 (CET)
Received: from localhost ([::1]:52364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkXp-0008Pc-RC
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:34:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrkWH-0006k4-Ov
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:32:49 -0500
Received: from [2a00:1450:4864:20::335] (port=39680
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrkWC-0003t6-02
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:32:48 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso17468263wmr.4
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 09:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6ImCOaMArxpEVStOWwYyDE0BzPvQca3TOOo8Ib/jzU=;
 b=ARWoYbQuaBSeNEko7yAbUug0EWQd34ELQoIKK37d8f9sRdcW7gRnEm21JhvwfrQIBB
 oHedIE4QuzTZMqhpAM8zJhucEN5hkqlbv+sR58ozGiU2ARocDesJQ9XNoYqN5Nf+auD9
 7xoquRuhpCvSzOCVM4KmK3diVSp14tIgdENwEIcwQTjpEIxR/tl4y9fI7z5EhlMDyiEl
 X5niS7YwZqQiNlAV8Geml4BnQpf+h7glQWGZ9LX1mj7KHeosiG58xXt/QJT69NYCVTcu
 c0OEWSgFAeCMxegi2M8TcpIWiyyUAd3vPg09iD1NsM63btY34Uz+ajR2R4YoMaysAbri
 TGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6ImCOaMArxpEVStOWwYyDE0BzPvQca3TOOo8Ib/jzU=;
 b=yK8mcUoliaodHaCVHg/3y8u+X6ZWYg+R9CHhcaRxUACWTS8W1nTGidk21vuXry1L5D
 ViNs7TRnZhsYoinBO3EXJXT2/vLP12m3rwRnwaNldciKZcAjRsmGmIv0865YF9p41ILW
 MJAf1wY/OU6k5VbTGmOoIdSHykKKXqppNbrxBWEBKeacq/ecn1BrtfaKsf+09l6LnyDF
 cBy+4sxt+TB2xfemnJnOjXkhaK1+99xvxF3p38sjSW5C/1fbttPMr0pAkC7ngrhWW3bS
 +wV9kbOAFGkz31QFmTb9VPQ7BJ/vERmuFd7yD28qy+ra/MXlxVHlQV2hs7gQ3l+R4n03
 9QcQ==
X-Gm-Message-State: AOAM532+EH7nggaHyhR4+xIz7iyNuBdMPi5mTfYGW7dQAtIYJ7OOHrt4
 icnXykZSITrPAEAtP0KO0X8dGcGzXg0Dymr0WMH/0A==
X-Google-Smtp-Source: ABdhPJyaYUwphiaQewYP95X/NwFgj5cN0KxtvB0aEEs3XbrRSMnMKQGIelap1FmeM47tE5g3VeoDTvXI2pJvV3L4Atc=
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr38246701wmg.37.1638207162495; 
 Mon, 29 Nov 2021 09:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
 <20211124101555.1410-4-francisco.iglesias@xilinx.com>
In-Reply-To: <20211124101555.1410-4-francisco.iglesias@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 17:32:31 +0000
Message-ID: <CAFEAcA9kEjDb8K0oERvPrFAzyN8d213PC6g2aT1fnMiuCnkvrw@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] include/hw/dma/xlnx_csu_dma: Add in missing
 includes in the header
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, qemu-devel@nongnu.org, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021 at 10:16, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> Add in the missing includes in the header for being able to build the DMA
> model when reusing it.
>
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> ---
>  include/hw/dma/xlnx_csu_dma.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
> index 9e9dc551e9..28806628b1 100644
> --- a/include/hw/dma/xlnx_csu_dma.h
> +++ b/include/hw/dma/xlnx_csu_dma.h
> @@ -21,6 +21,11 @@
>  #ifndef XLNX_CSU_DMA_H
>  #define XLNX_CSU_DMA_H
>
> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +#include "hw/ptimer.h"
> +#include "hw/stream.h"
> +
>  #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
>
>  #define XLNX_CSU_DMA_R_MAX (0x2c / 4)
> --
> 2.11.0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

