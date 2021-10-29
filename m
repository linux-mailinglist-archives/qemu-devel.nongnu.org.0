Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D844054E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 00:08:17 +0200 (CEST)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mga2p-0003CO-Vu
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 18:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mga0s-0001ad-T5
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:06:16 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mga0q-0006bo-7b
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:06:14 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r8so6049232wra.7
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 15:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZZMkMXLB2uiahCnorLVDTnjxZvQEzqzjq7Jrl2f7YjE=;
 b=Ghn05RjHsQOk5nx8Qi/QAihhURj/7x+Bhiq38Rg6vio85vu7o1VaN3GodWUYj4BCl5
 ISLM94cEfNZIjRYy8Drhy5evGoJohmrlnJZk1hCBEkGSsoJ6I5AQLR9a6KT+a8Q8W0RS
 S2NZVks3vqglIxUmDxNPtoTi2j5maHzA8xCkZlVZ/IK91nAdx75pbomFUhWjpC5Q92Rb
 JsGlVvImcJgbIJibqPZUw0zWlhMI1nBVXkAXdWrH5eZBW1FudY1Fwgx/nWNlhGN3oTRS
 RAtjWr45i/1QCl9NhiK/vVwaUCwkRzfihXbGUBWmG/LbAxtdYn4lIfNsAiISrzm9rCoe
 gb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZZMkMXLB2uiahCnorLVDTnjxZvQEzqzjq7Jrl2f7YjE=;
 b=d5gmTcTXgFQjEkI6fJzbOpY3u3OubmXWS+ix1OY9XekA6snzGN4hGvExbqOd+kxoBn
 XelHqhM8Ku/JVPZ5jRR7EUP36R1JPuuqZYbZ9sagYLdF5a31dCDdHaj7UVarT6Yw5lzI
 j37p7mRz3vRBpuKg6IwGU2iunGoOsNxy7aWgN/LjtNVcQgjUIlzcpKeENaZYF96hc5qZ
 zDS8Oxl3tMH20zX1zsv3WsKwGuEjWabgnD/cAr+4frOC2ZnuEM12e8bGTW1A92+6JaPw
 AUJO/nxZkiKosuOUwya1VtJNLtdbtH9FLFsc8qI76nbGK90rShkZBFRVWDhUlF7Bn5ER
 BIXw==
X-Gm-Message-State: AOAM533qtp9YOeAsUbUc62TwulzFpLwr+4NwSiP32rvyl7aItRxUO+xS
 BkppyyiwtDxQUT3Lb+tRmW8=
X-Google-Smtp-Source: ABdhPJycd75gLwxbwcCNvOMMWaOgDGfUA66y3EHF1ATRisO+JCyneUD/liJy6UGOOUWhr+nHFBrxaQ==
X-Received: by 2002:adf:e0c1:: with SMTP id m1mr17699656wri.241.1635545170648; 
 Fri, 29 Oct 2021 15:06:10 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o11sm10451966wry.0.2021.10.29.15.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 15:06:09 -0700 (PDT)
Message-ID: <1c4ec639-c727-e750-6d13-3cfa7fbef6dd@amsat.org>
Date: Sat, 30 Oct 2021 00:06:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 30/30] hw/timer/sh_timer: Remove use of hw_error
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <f818dc3dd2ac8c3b3d53067f316a716d7f9683d8.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <f818dc3dd2ac8c3b3d53067f316a716d7f9683d8.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 23:02, BALATON Zoltan wrote:
> The hw_error function calls abort and is not meant to be used by
> devices. Use qemu_log_mask instead to log and ignore invalid accesses.
> Also fix format strings to allow dropping type casts of hwaddr and use
> __func__ instead of hard coding function name in the message which
> were wrong in two cases.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/timer/sh_timer.c | 40 +++++++++++++++++++++++++---------------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
> index a6445092e4..8a586f2c4a 100644
> --- a/hw/timer/sh_timer.c
> +++ b/hw/timer/sh_timer.c
> @@ -10,7 +10,7 @@
>  
>  #include "qemu/osdep.h"
>  #include "exec/memory.h"
> -#include "hw/hw.h"
> +#include "qemu/log.h"
>  #include "hw/irq.h"
>  #include "hw/sh4/sh.h"
>  #include "hw/timer/tmu012.h"
> @@ -75,11 +75,10 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
>          if (s->feat & TIMER_FEAT_CAPT) {
>              return s->tcpr;
>          }
> -        /* fall through */
> -    default:
> -        hw_error("sh_timer_read: Bad offset %x\n", (int)offset);
> -        return 0;
>      }
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
> +                  __func__, offset);
> +    return 0;

Note, keeping the default case allow to refactor for single return,
so it is easier to add trace event.

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

