Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DECA422208
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 11:19:58 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXgc8-0002kP-E2
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 05:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mXgYc-0000wk-2d; Tue, 05 Oct 2021 05:16:18 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mXgYa-0008NS-JD; Tue, 05 Oct 2021 05:16:17 -0400
Received: by mail-lf1-x12c.google.com with SMTP id m3so82432622lfu.2;
 Tue, 05 Oct 2021 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=tvCajuaXkS7r7YZiB0IsE8TdCOQe9GnICH+CpFxWoFw=;
 b=DsTlbaU5NMDT0LkGawR5nYONA9qB5Deh8TUwniDaTZ8hany0ZDWWHVEX7SJtXOuN/Z
 yIyPwF+QLbzC3lG0VM5Gkx3ZykgmJ0P7KzIXX6kADP/8YQt7wFS8E/sUBbHXdx3QvXh4
 hVw4l09VWSnOKAEbgs8ta+P7Djn4t+8NwSwOVHud6FLYQAysRZJpb6S9yCCQx/aiqyV+
 u897Js8UxzDd8YA8OPbS1m69tYhYrPhjaqPvRRanP2F7fLmEVVIMw2wuNs20D4mGzgNM
 2y2xgzxqGDeWyAjS/rJG7R/Hjc8Pw6o3Xssx/In41LP3H9DReNyBrJX+EHXLMl+XciSE
 YMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tvCajuaXkS7r7YZiB0IsE8TdCOQe9GnICH+CpFxWoFw=;
 b=Xw1p4uM8f0ineIHnho+7kimTAdqbXJkk1YIT3qaE0qTNW1pGvlU7mXEUDf8oUOsF0Z
 ps9Nhl95jIY7XQtEYGNIaUzUNEmnLI4NqMK1kaySKO2SxM90WDtOC8LFgS0lqBzawdY5
 NBCPrUEaTojwdLK7lutUBFIcugqRSN/rVEC1gIfSQieLkP0N5ui742s4lSeGDC3vbVXg
 ZiG6lMLPGxAKGp0+BOWkGgfw+FGxILcGgndPpnMV8QRWzZVSbqyCPoFXXAb5xYih94h1
 0fZUg+TdK5nT3iurSPKJ1Ja1JoZaU1dGOdU8Nvtfg68unvWveo8l/OdSHxCjNbB5rpYT
 bHhw==
X-Gm-Message-State: AOAM530Dk4mGevyidgngIqdztOOxj+XmM8AOTbMWwbKo70ooVR2SXJ08
 H04DQ5d97Hxzl9mNn+Fbnxg=
X-Google-Smtp-Source: ABdhPJzPPJuf6QR489ME1XeBt+X5pK03N8W6jw80XO2EbDGlTA+r/JMHw5+oa/42CyRcGBKxaGBGqQ==
X-Received: by 2002:ac2:5e86:: with SMTP id b6mr2309145lfq.108.1633425374235; 
 Tue, 05 Oct 2021 02:16:14 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 t22sm1899968ljk.8.2021.10.05.02.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 02:16:13 -0700 (PDT)
Date: Tue, 5 Oct 2021 11:16:12 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/4] aspeed/wdt: Add trace events
Message-ID: <20211005091611.GB23846@fralle-msi>
References: <20211004154635.394258-1-clg@kaod.org>
 <20211004154635.394258-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004154635.394258-2-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12c.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2021 Oct 04] Mon 17:46:32, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/watchdog/wdt_aspeed.c | 5 +++++
>  hw/watchdog/trace-events | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 69c37af9a6e9..146ffcd71301 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -19,6 +19,7 @@
>  #include "hw/sysbus.h"
>  #include "hw/watchdog/wdt_aspeed.h"
>  #include "migration/vmstate.h"
> +#include "trace.h"
>  
>  #define WDT_STATUS                      (0x00 / 4)
>  #define WDT_RELOAD_VALUE                (0x04 / 4)
> @@ -60,6 +61,8 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
>  {
>      AspeedWDTState *s = ASPEED_WDT(opaque);
>  
> +    trace_aspeed_wdt_read(offset, size);
> +
>      offset >>= 2;
>  
>      switch (offset) {
> @@ -140,6 +143,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>      AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
>      bool enable;
>  
> +    trace_aspeed_wdt_write(offset, size, data);
> +
>      offset >>= 2;
>  
>      switch (offset) {
> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> index c3bafbffa911..e7523e22aaf2 100644
> --- a/hw/watchdog/trace-events
> +++ b/hw/watchdog/trace-events
> @@ -5,3 +5,7 @@ cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK AP
>  cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>  cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
>  cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
> +
> +# wdt-aspeed.c
> +aspeed_wdt_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
> +aspeed_wdt_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
> -- 
> 2.31.1
> 
> 

