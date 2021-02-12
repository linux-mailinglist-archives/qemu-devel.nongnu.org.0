Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519E31A47E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:25:22 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAd85-0004hR-JR
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd6A-0003LM-C6; Fri, 12 Feb 2021 13:23:22 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAd68-0005Hx-Q3; Fri, 12 Feb 2021 13:23:22 -0500
Received: by mail-wm1-x332.google.com with SMTP id o24so470021wmh.5;
 Fri, 12 Feb 2021 10:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r8jDfU1A271qAkCNTylGfZD28f7uwED6qI4esrnggmw=;
 b=Re4C2uthhdXsv4NojT7SjItQoj9VU5f/Z0frZsUiV1S6pAV9nmTPn43wap7i/RnVJK
 PiUEiVra2vv5Dk/9+w51POoeiGW2+3CFGwLT60FQUpncn6RFiZV8iDUbGkMkJu7PgVrA
 BEOkG2qkjVOvLzQKZNg7ixVaymZzN73go7EyyNBXh0frRMTm9LjesTdRx+mOYeTk76EN
 mvL0T3N6wMhs4RntEYzSGN5zwcZyoG33b0gJxIepi5MXNbnshLXuw44hm3kruMH6HL/o
 dIBxvLxDNy+hp5uauS2d/cJkesctsSLNQBGdRt3VyW/ezROfgEp/HnoPIZ4ObScbK0ml
 dbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r8jDfU1A271qAkCNTylGfZD28f7uwED6qI4esrnggmw=;
 b=E5aQSjUiaPxCaewFyFtVnvx6GUWndxufjoZaibpgtBZhCp0+iTvUgVRaTgyB+7Mv9f
 CrB6JVk9nGFfS2GS6VY4F5zX5JvWBsi2YmsMRWhYD3NhzQ3hY+1nyIVZjwBLnYAtDHGp
 CtoJuacUUPmHddTkGHrku9HBJPiu3KOBMv6a5zAWK362YnboD9ihj/auH9ztVHrWvn7k
 rsgzdMMWMcahQFvn+zasJYaUnYRFDQieuyi15mMSNJDwqN1DiOnFdJH20fBH2t8VHHrX
 WoX8P8RtK3XhqxIWfEM7uWy3E+DXGAndOpowsbE8At0tkQq91S2yPFdWguIRWIhryBXO
 xfug==
X-Gm-Message-State: AOAM533IgPxLk7Dkvi4hFklo0xLEaT2KiXaTNjVqmdND9p9oTCBh4KUl
 B+dzaw+b1Bw9TPccmKbrrUrCijF1+UE=
X-Google-Smtp-Source: ABdhPJyKtTIOmGUZ5EkmScNLJLa5JWCgs1lMrKc9dKq6SY7nJfeZ8b8tmK7+9A7eizBD1Y4b93eLiA==
X-Received: by 2002:a7b:ca57:: with SMTP id m23mr3879836wml.116.1613154198527; 
 Fri, 12 Feb 2021 10:23:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d15sm7503880wru.80.2021.02.12.10.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:23:18 -0800 (PST)
Subject: Re: [PATCH 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <20210205170019.25319-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4f8bfa76-159a-bbee-6774-b5e55c8d9b67@amsat.org>
Date: Fri, 12 Feb 2021 19:23:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205170019.25319-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 6:00 PM, Peter Maydell wrote:
> MPS3 boards have an extra SWITCH register in the FPGAIO block which
> reports the value of some switches.  Implement this, governed by a
> property the board code can use to specify whether whether it exists.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/mps2-fpgaio.h |  1 +
>  hw/misc/mps2-fpgaio.c         | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
> index bfe73134e78..83c6e18a4ee 100644
> --- a/include/hw/misc/mps2-fpgaio.h
> +++ b/include/hw/misc/mps2-fpgaio.h
> @@ -38,6 +38,7 @@ struct MPS2FPGAIO {
>      MemoryRegion iomem;
>      LEDState *led[MPS2FPGAIO_MAX_LEDS];
>      uint32_t num_leds;
> +    bool have_switches;
>  
>      uint32_t led0;
>      uint32_t prescale;
> diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
> index b28a1be22cc..b54657a4f07 100644
> --- a/hw/misc/mps2-fpgaio.c
> +++ b/hw/misc/mps2-fpgaio.c
> @@ -35,6 +35,7 @@ REG32(CLK100HZ, 0x14)
>  REG32(COUNTER, 0x18)
>  REG32(PRESCALE, 0x1c)
>  REG32(PSCNTR, 0x20)
> +REG32(SWITCH, 0x28)
>  REG32(MISC, 0x4c)
>  
>  static uint32_t counter_from_tickoff(int64_t now, int64_t tick_offset, int frq)
> @@ -156,7 +157,15 @@ static uint64_t mps2_fpgaio_read(void *opaque, hwaddr offset, unsigned size)
>          resync_counter(s);
>          r = s->pscntr;
>          break;
> +    case A_SWITCH:
> +        if (!s->have_switches) {
> +            goto bad_offset;
> +        }
> +        /* User-togglable board switches. We don't model that, so report 0. */

We should and probably will at some point... This is a feature
I'm thinking about and which could be implemented the same way
as the TempSensor series. My latest problem is to have QOM names
(full path) consistent. That way we can toggle a switch at
runtime via (at least) a QMP command.

Anyway to your patch (including change squashed):
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

