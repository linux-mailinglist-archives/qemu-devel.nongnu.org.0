Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CFF493049
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 23:03:40 +0100 (CET)
Received: from localhost ([::1]:55258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9wZm-0001EX-QT
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 17:03:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n9wVv-0007Wx-RA
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 16:59:40 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>) id 1n9wVl-0007aI-9Y
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 16:59:33 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 07DCBC60912;
 Tue, 18 Jan 2022 22:59:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1642543163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UVRIoywNq49+YfzObGv8fTb2h26AeDzsXBg51JtGZVA=;
 b=aeJSwH47rXvbaeWmvSCHtDpBeprb6sPMSeVt2mi/h0H9EbcFOsl8c4SkvMtoBsY5H8YuuP
 8v/usKtpPsIwt62yuVHQKEktqDC+b9Bi/jIGZXT0i05uNfPKC50/lUnLxcVofFz0t3PEku
 iVQq108Ssr7vlqALOadAvoEPLQTXjlnbeK1kwyMH2Zcpfv51Gmu8WmBMsCR98qIin+KEEK
 WqIcxMHTWIEwGV/+Pa7GNyMMZUZOB+OKJDEpOP0tUZF0Iqwu9+vo2fL+2k9swb5HzgKU5k
 91mIR+TdavfyYNQa3b6Ivfj/tFAFfp4Q7X8NQVFr/sQSWPKkS9ex8xK170VVtw==
Date: Tue, 18 Jan 2022 22:59:22 +0100
From: Luc Michel <luc@lmichel.fr>
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Subject: Re: [PATCH v6 04/12] include/hw/dma/xlnx_csu_dma: Add in missing
 includes in the header
Message-ID: <20220118215922.jjeud4iajegob455@sekoia-pc.home.lmichel.fr>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
 <20220114152841.1740-5-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114152841.1740-5-francisco.iglesias@xilinx.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, qemu-devel@nongnu.org,
 alistair23@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15:28 Fri 14 Jan     , Francisco Iglesias wrote:
> Add in the missing includes in the header for being able to build the DMA
> model when reusing it.
> 
> Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

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
> 
> 

-- 

