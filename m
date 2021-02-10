Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D24316563
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:41:54 +0100 (CET)
Received: from localhost ([::1]:50810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nsX-0001al-L9
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9nqe-0008O7-St; Wed, 10 Feb 2021 06:39:56 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:33194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9nqc-0006mB-00; Wed, 10 Feb 2021 06:39:56 -0500
Received: by mail-lf1-x129.google.com with SMTP id b2so2362896lfq.0;
 Wed, 10 Feb 2021 03:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8UFSRXYuSowInW7X6JS9GPGIQ1SuvcpTAXMb7tc6xH4=;
 b=d1mLbhrxqJl8iikLgedxjgLKHR3Zp00efNChkA0KWV8QRzwTnkaqOIJQofnIbqRqMO
 VlvpEdErA6jIl6KIan99SyOTV6gZkHZ40NNV1rcxsc/x1CaOP6wwek09NaGtx6viCNBb
 k1wRzwV+kGw6uwycMx3wYxHeDonmyZeaNURKEuJG4kkWDkr8PWTBDMl0RZ6DHSFZlG1a
 WC3hrfUSOAIwjJQrneO9fFl0uTf4wZu53Jg6kbmMEXFVmLJdrps0WP9TQSZP4LxWQ5kV
 4U6yr6w+r6ydZn8odeVsqcisvmzrh9G1HOKqZtyVY9jM2Avq22W1tGpk/Pe3ABG00Lnw
 PZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8UFSRXYuSowInW7X6JS9GPGIQ1SuvcpTAXMb7tc6xH4=;
 b=NYZFl8RUf7Oqc7SQ76eQyo9RiqGZ2IOir+mNFXeJtZMKSzjmeyrosk+JSnTaZjy9WC
 5zEUtWR25v4fhW2xUrU9IRygTt1iidi3Fa6TyipiWK8Hx4bpnuo3w2XBmGc+dAqrFIKj
 tv39hBZ4u3Ae5Ml1XvUkyq5xJ4qCdTSbRLDnuYowuuZhSyIWC7JvmAojthbHZM7qDC+e
 VLqSxYrcLLWQfha1rA7C7vWQGUP8x9pmtxZMWXFLJyR0mTV1XYwIJBTdYvbetv9FSuwr
 8iS8o+MQbgy9R/+bHaTa9Rdd6ScFie6O0leInOxAvZylN443GIOLhc2BPxXhFVSTy11H
 Yq5Q==
X-Gm-Message-State: AOAM533KgvVGf7igQnV+jbqi0oFWRgtTIphBp4Z9CJ4Jrq/zS8mtuqXC
 eNLqwb37NbwKXBAhJn1hCwc=
X-Google-Smtp-Source: ABdhPJyp0Fo63K/50xn5CdALBlqI70nU2fjjDsGYCN/vouKoSMhHg6Yo56L3T2kJzJLvMeJdwqfGyg==
X-Received: by 2002:a05:6512:36d0:: with SMTP id
 e16mr1461875lfs.45.1612957192023; 
 Wed, 10 Feb 2021 03:39:52 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id j20sm287043lfu.94.2021.02.10.03.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 03:39:51 -0800 (PST)
Date: Wed, 10 Feb 2021 12:39:51 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v3 4/5] hw/ssi: xilinx_spips: Clean up coding convention
 issues
Message-ID: <20210210113951.GM477672@toto>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
 <1612951813-50542-5-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1612951813-50542-5-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 06:10:12PM +0800, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> There are some coding convention warnings in xilinx_spips.c,
> as reported by:
> 
>   $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c
> 
> Let's clean them up.
> 
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
> 
> (no changes since v1)
> 
>  hw/ssi/xilinx_spips.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> index a897034..8a0cc22 100644
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -176,7 +176,8 @@
>      FIELD(GQSPI_FIFO_CTRL, GENERIC_FIFO_RESET, 0, 1)
>  #define R_GQSPI_GFIFO_THRESH    (0x150 / 4)
>  #define R_GQSPI_DATA_STS (0x15c / 4)
> -/* We use the snapshot register to hold the core state for the currently
> +/*
> + * We use the snapshot register to hold the core state for the currently
>   * or most recently executed command. So the generic fifo format is defined
>   * for the snapshot register
>   */
> @@ -424,7 +425,8 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
>      xlnx_zynqmp_qspips_update_ixr(s);
>  }
>  
> -/* N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
> +/*
> + * N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
>   * column wise (from element 0 to N-1). num is the length of x, and dir
>   * reverses the direction of the transform. Best illustrated by example:
>   * Each digit in the below array is a single bit (num == 3):
> @@ -637,8 +639,10 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
>                  tx_rx[i] = tx;
>              }
>          } else {
> -            /* Extract a dummy byte and generate dummy cycles according to the
> -             * link state */
> +            /*
> +             * Extract a dummy byte and generate dummy cycles according to the
> +             * link state
> +             */
>              tx = fifo8_pop(&s->tx_fifo);
>              dummy_cycles = 8 / s->link_state;
>          }
> @@ -721,8 +725,9 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
>              }
>              break;
>          case (SNOOP_ADDR):
> -            /* Address has been transmitted, transmit dummy cycles now if
> -             * needed */
> +            /*
> +             * Address has been transmitted, transmit dummy cycles now if needed
> +             */
>              if (s->cmd_dummies < 0) {
>                  s->snoop_state = SNOOP_NONE;
>              } else {
> @@ -876,7 +881,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
>  }
>  
>  static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
> -                                                        unsigned size)
> +                                  unsigned size)
>  {
>      XilinxSPIPS *s = opaque;
>      uint32_t mask = ~0;
> @@ -970,7 +975,7 @@ static uint64_t xlnx_zynqmp_qspips_read(void *opaque,
>  }
>  
>  static void xilinx_spips_write(void *opaque, hwaddr addr,
> -                                        uint64_t value, unsigned size)
> +                               uint64_t value, unsigned size)
>  {
>      int mask = ~0;
>      XilinxSPIPS *s = opaque;
> @@ -1072,7 +1077,7 @@ static void xilinx_qspips_write(void *opaque, hwaddr addr,
>  }
>  
>  static void xlnx_zynqmp_qspips_write(void *opaque, hwaddr addr,
> -                                        uint64_t value, unsigned size)
> +                                     uint64_t value, unsigned size)
>  {
>      XlnxZynqMPQSPIPS *s = XLNX_ZYNQMP_QSPIPS(opaque);
>      uint32_t reg = addr / 4;
> -- 
> 2.7.4
> 

