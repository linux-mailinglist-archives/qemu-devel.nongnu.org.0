Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6EC435638
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:57:20 +0200 (CEST)
Received: from localhost ([::1]:45096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKWM-0003nN-W2
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mdKB1-0003eo-Jb; Wed, 20 Oct 2021 18:35:15 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:36824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mdKAq-0003g9-1f; Wed, 20 Oct 2021 18:35:14 -0400
Received: by mail-lj1-x236.google.com with SMTP id q16so276048ljg.3;
 Wed, 20 Oct 2021 15:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=WJGUh3ufkJv6o8JVZjrsDao7FRPF19t3sg2L2kpnvvw=;
 b=h+HwM2lSTVU46+bQkqi3ebb+7FbKA+KZ7ywd7Ce/lg7mnsriXYdNuL7iEq2h6CiHO/
 dSZJFdIXJmKIbaX+84UUGJA0VHrzhvcfOGA1okOCTp0jBKuUo0gh1lugomOFEGfNun/e
 9VMiNldevu53kn2qocicnpf6fC31yd4rBVkGrouqSWXats8pfl50ZSQVR3jHdPXb0jGV
 GzJ0/CkLC+YfU2REB8X/B0jCmzsmLpmnY168+d+8fVYID92wmntDaTxVibws9BKhlNGT
 m9UmGwGzm7/sgXKchu2BLJw81jB7awNlSo0Udmv7I6Ly1uKYYkNS0wTipnjj7/8r69lO
 WkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WJGUh3ufkJv6o8JVZjrsDao7FRPF19t3sg2L2kpnvvw=;
 b=NGuTP5zKeWM9DDUI+uP3NBrpdhAuJ6LVzRbXzYbqsEnRRfU6+vC9tBHyw6vFwjnfug
 Bd+Lzxzjn12Q80+x0WF29zCKjdJchEQivfg7/GiHx7fV0Hgzg7x5A/OWnEPzriQX+gXf
 z9Qu9n8B3iP8JPCI868fL3x85OMtsY4MYXA1SG+YHo4Kjcf2so1W++0WNwpqf1ND6Xow
 ymK9/ARjzY1gZkCzKeB0g6/AXfoLNDUdUhCUCMRQ5cMsOm1N7SK04jK47gOTlKNKsP/S
 LyHxegRD9XYdnnOEgzJylz90ulpY4/9vCiD1ZjDdbKbp345WE51l+lVuXdVG/zTh2j32
 UIpw==
X-Gm-Message-State: AOAM532wNaauGKjzLcEBMl+GX9rAXc46jxCqd0q8KeJQQjEfHZmNzNm0
 U6PA1NzAT26P7VFvdjVxOFA=
X-Google-Smtp-Source: ABdhPJxXrXRnPOWCBDLs2TXuRXbW7ikLOW26+UQV5LzFKuGPbwNzdds5YP0CbwH5tNPqMKHcmqA6bw==
X-Received: by 2002:a2e:9c8d:: with SMTP id x13mr1889804lji.29.1634769299103; 
 Wed, 20 Oct 2021 15:34:59 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 c21sm294317lfi.192.2021.10.20.15.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 15:34:58 -0700 (PDT)
Date: Thu, 21 Oct 2021 00:34:57 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 5/5] speed/sdhci: Add trace events
Message-ID: <20211020223456.GF23846@fralle-msi>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-6-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211018132609.160008-6-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cedric,

On the subject s/speed/aspeed/. Otherwise:

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

/BR

On [2021 Oct 18] Mon 15:26:09, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/sd/aspeed_sdhci.c | 5 +++++
>  hw/sd/trace-events   | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
> index 3299844de6dc..df1bdf1fa4ed 100644
> --- a/hw/sd/aspeed_sdhci.c
> +++ b/hw/sd/aspeed_sdhci.c
> @@ -14,6 +14,7 @@
>  #include "hw/irq.h"
>  #include "migration/vmstate.h"
>  #include "hw/qdev-properties.h"
> +#include "trace.h"
>  
>  #define ASPEED_SDHCI_INFO            0x00
>  #define  ASPEED_SDHCI_INFO_SLOT1     (1 << 17)
> @@ -60,6 +61,8 @@ static uint64_t aspeed_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
>          }
>      }
>  
> +    trace_aspeed_sdhci_read(addr, size, (uint64_t) val);
> +
>      return (uint64_t)val;
>  }
>  
> @@ -68,6 +71,8 @@ static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
>  {
>      AspeedSDHCIState *sdhci = opaque;
>  
> +    trace_aspeed_sdhci_write(addr, size, val);
> +
>      switch (addr) {
>      case ASPEED_SDHCI_INFO:
>          /* The RESET bit automatically clears. */
> diff --git a/hw/sd/trace-events b/hw/sd/trace-events
> index 3cc2ef89ba6b..94a00557b26f 100644
> --- a/hw/sd/trace-events
> +++ b/hw/sd/trace-events
> @@ -68,3 +68,7 @@ pl181_fifo_push(uint32_t data) "FIFO push 0x%08" PRIx32
>  pl181_fifo_pop(uint32_t data) "FIFO pop 0x%08" PRIx32
>  pl181_fifo_transfer_complete(void) "FIFO transfer complete"
>  pl181_data_engine_idle(void) "data engine idle"
> +
> +# aspeed_sdhci.c
> +aspeed_sdhci_read(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
> +aspeed_sdhci_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
> -- 
> 2.31.1
> 
> 

