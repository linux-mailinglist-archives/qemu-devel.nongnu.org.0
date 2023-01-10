Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8145663F9F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 13:00:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFDIY-0008NI-Mj; Tue, 10 Jan 2023 07:00:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pFDIT-0008Mt-RO; Tue, 10 Jan 2023 07:00:05 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pFDIS-0000mf-55; Tue, 10 Jan 2023 07:00:05 -0500
Received: by mail-lf1-x12a.google.com with SMTP id bp15so18005820lfb.13;
 Tue, 10 Jan 2023 04:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pzbpW94v8kWOhXIB6ZCp0GJ688lmlczVML2krcqmSY8=;
 b=Ho1aPlSmv8w+WSGMlYAVT0KFE5qLkrcxepXeonrdH11D8ytQdU2ICWLK9qyD7xI+j5
 9YEaroCq3o95N4Kck3giU7pd5RoIBzmcrePq8gMwrhrbgST9RubpabqZnlYNW+jV0zzE
 c+MY9cX9G8xod9B7h9Agvj69x+SwX2SEI29U1sZHRbXt9dj9zj2VAx4bs2nATT6L9H6a
 l+qhByojJAfL5wXLHCFKqWKI1kvDSDQ4sLYz9n4FXGbWB0CR2wcHaEcUABYqQr6W1qCC
 lVAmnklWhX4Qlk3yUzPtSKCgtBk1w72klHQ6QIFiiCfXaOL0IXVZyFeC5Po58AyhgVZ+
 KVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pzbpW94v8kWOhXIB6ZCp0GJ688lmlczVML2krcqmSY8=;
 b=xwmNRknzgpBqK8BjQ2a0CUO3uZLPFx03B+eKW5Lf2RlIBMHTkNCluPNlCIBO95yNuT
 DFo8QDrnEqPFjNj/5K2AwnrkWJ2/0207yPJUVN4IFBPyHLMkC5TpbvYBgkwpTC8Z9UW3
 LWozaz1ZdwNpY5AHsjvGTX1N03grZ3ffV/NiL0a1S+J2SSYipfgQg8eKtROIwS5pvYeu
 unSN6e24BRHqb/Li/MSfLR0t4bQWLX7dE5UvCwj0/bSDvBJfh8QpYi8EnTLoiFvgp+cn
 zP1nVt4Ge90AlwHYi1UnBXTtHAs3DePEt7OMNaAu4Ml1c2Hf6ErD6ZLhwdpM9/uHjs46
 QY4w==
X-Gm-Message-State: AFqh2kpXWr9OefrISnyeejWA/uKRlDquxl2wZQXFuMjsmBdKmjD8P+5s
 4rly5Nxs+VCtD1jBRYbn+0s=
X-Google-Smtp-Source: AMrXdXv7bJOjCTbBcAHHKqd/KYxex+5tL95GC+G2mFPVSEc65K84Pu5yRKZkHZmYgt0br1gb+NJ7zQ==
X-Received: by 2002:ac2:490f:0:b0:4b6:eca8:f6ca with SMTP id
 n15-20020ac2490f000000b004b6eca8f6camr16632641lfi.67.1673352001827; 
 Tue, 10 Jan 2023 04:00:01 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 bq33-20020a056512152100b004cc7da37d52sm1495026lfb.94.2023.01.10.04.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 04:00:01 -0800 (PST)
Date: Tue, 10 Jan 2023 13:00:00 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: Re: [PATCH 14/14] hw/timer/xilinx_timer: Use XpsTimerState instead
 of 'struct timerblock'
Message-ID: <Y71TQPIv21qOe1ZT@toto>
References: <20230109140306.23161-1-philmd@linaro.org>
 <20230109140306.23161-15-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109140306.23161-15-philmd@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Jan 09, 2023 at 03:03:06PM +0100, Philippe Mathieu-Daudé wrote:
> This remove a use of 'struct' in the DECLARE_INSTANCE_CHECKER()
> macro call, to avoid after a QOM refactor:
> 
>   hw/timer/xilinx_timer.c:65:1: error: declaration of anonymous struct must be a definition
>   DECLARE_INSTANCE_CHECKER(struct timerblock, XILINX_TIMER,
>                            ^


Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/timer/xilinx_timer.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index c7f17cd646..32a9df69e0 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -62,10 +62,10 @@ struct xlx_timer
>  };
>  
>  #define TYPE_XILINX_TIMER "xlnx.xps-timer"
> -DECLARE_INSTANCE_CHECKER(struct timerblock, XILINX_TIMER,
> -                         TYPE_XILINX_TIMER)
> +typedef struct XpsTimerState XpsTimerState;
> +DECLARE_INSTANCE_CHECKER(XpsTimerState, XILINX_TIMER, TYPE_XILINX_TIMER)
>  
> -struct timerblock
> +struct XpsTimerState
>  {
>      SysBusDevice parent_obj;
>  
> @@ -76,7 +76,7 @@ struct timerblock
>      struct xlx_timer *timers;
>  };
>  
> -static inline unsigned int num_timers(struct timerblock *t)
> +static inline unsigned int num_timers(XpsTimerState *t)
>  {
>      return 2 - t->one_timer_only;
>  }
> @@ -87,7 +87,7 @@ static inline unsigned int timer_from_addr(hwaddr addr)
>      return addr >> 2;
>  }
>  
> -static void timer_update_irq(struct timerblock *t)
> +static void timer_update_irq(XpsTimerState *t)
>  {
>      unsigned int i, irq = 0;
>      uint32_t csr;
> @@ -104,7 +104,7 @@ static void timer_update_irq(struct timerblock *t)
>  static uint64_t
>  timer_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> -    struct timerblock *t = opaque;
> +    XpsTimerState *t = opaque;
>      struct xlx_timer *xt;
>      uint32_t r = 0;
>      unsigned int timer;
> @@ -155,7 +155,7 @@ static void
>  timer_write(void *opaque, hwaddr addr,
>              uint64_t val64, unsigned int size)
>  {
> -    struct timerblock *t = opaque;
> +    XpsTimerState *t = opaque;
>      struct xlx_timer *xt;
>      unsigned int timer;
>      uint32_t value = val64;
> @@ -202,7 +202,7 @@ static const MemoryRegionOps timer_ops = {
>  static void timer_hit(void *opaque)
>  {
>      struct xlx_timer *xt = opaque;
> -    struct timerblock *t = xt->parent;
> +    XpsTimerState *t = xt->parent;
>      D(fprintf(stderr, "%s %d\n", __func__, xt->nr));
>      xt->regs[R_TCSR] |= TCSR_TINT;
>  
> @@ -213,7 +213,7 @@ static void timer_hit(void *opaque)
>  
>  static void xilinx_timer_realize(DeviceState *dev, Error **errp)
>  {
> -    struct timerblock *t = XILINX_TIMER(dev);
> +    XpsTimerState *t = XILINX_TIMER(dev);
>      unsigned int i;
>  
>      /* Init all the ptimers.  */
> @@ -236,16 +236,15 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
>  
>  static void xilinx_timer_init(Object *obj)
>  {
> -    struct timerblock *t = XILINX_TIMER(obj);
> +    XpsTimerState *t = XILINX_TIMER(obj);
>  
>      /* All timers share a single irq line.  */
>      sysbus_init_irq(SYS_BUS_DEVICE(obj), &t->irq);
>  }
>  
>  static Property xilinx_timer_properties[] = {
> -    DEFINE_PROP_UINT32("clock-frequency", struct timerblock, freq_hz,
> -                                                                62 * 1000000),
> -    DEFINE_PROP_UINT8("one-timer-only", struct timerblock, one_timer_only, 0),
> +    DEFINE_PROP_UINT32("clock-frequency", XpsTimerState, freq_hz, 62 * 1000000),
> +    DEFINE_PROP_UINT8("one-timer-only", XpsTimerState, one_timer_only, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -260,7 +259,7 @@ static void xilinx_timer_class_init(ObjectClass *klass, void *data)
>  static const TypeInfo xilinx_timer_info = {
>      .name          = TYPE_XILINX_TIMER,
>      .parent        = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(struct timerblock),
> +    .instance_size = sizeof(XpsTimerState),
>      .instance_init = xilinx_timer_init,
>      .class_init    = xilinx_timer_class_init,
>  };
> -- 
> 2.38.1
> 

