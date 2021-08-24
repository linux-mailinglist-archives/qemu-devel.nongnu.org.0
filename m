Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16333F5C32
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 12:36:07 +0200 (CEST)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mITme-0003zn-0c
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 06:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITlS-000398-LS; Tue, 24 Aug 2021 06:34:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mITlQ-0001vF-3T; Tue, 24 Aug 2021 06:34:42 -0400
Received: by mail-wr1-x432.google.com with SMTP id f5so30494597wrm.13;
 Tue, 24 Aug 2021 03:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MlPlqG+B6YbpAgiI9iab73mBI9Te+WxloTZ91xTi7Yo=;
 b=oRmb/Q1aS2e1px/WaxunNFPwEaCH0je0QSke3HEJm4RvFp407wke2vXYydK7WN7/N6
 d55SB4j1cjinbbbO8jVsORXG3NfJJp6Hnd/LFETH3hKOs1wku0u+jqjP+DJ8BsYlE6RX
 oxFJHbKreJT7WaefAfgbiEV/cU27FBJYUqHWS1zbvvUpPZpy/VlVhDYitLvNpoJ0V42d
 r4E9EWBIDWFxOZopNCn4p7QXNaNF3Oc9X6r577LDxTKylw6Ri4BwOSyR6YF83aNZOka3
 aIHXyIyFfN/mly7TI1bOUAHHr0S+V/ZPkfI9NqmiqyBfdPPw9i7yxrI+w5fz4vzm0JFK
 atnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MlPlqG+B6YbpAgiI9iab73mBI9Te+WxloTZ91xTi7Yo=;
 b=BRubwTDAR8PEdSJQ/2mHWQuvGJiZdkJN438NkJJXBrvuCtbE+d8BPThu0uOe3j1Cu5
 qemgq+DeFoorAvrlPd4Vb+9SXhJR1I54nGTf4nazJ7ccFNnHFAoxvy3OhXkn9e6Rfg+1
 XnmRvC1ODoSRW43K1klz9jXeVpMssLx2gwtE3AatO/L8WF5AkZ3rEHTMwoGBlkPExM+y
 RL9z1cYqRTuwDenKv7HS99Z3OXVlmlqTeh8XVKsg3V0zP+qq9FQ5kYtzTFQxxa2tWHwU
 SiVmqPPR/se3fhiXPW2ahTJ2riQHBSVZpb0WlH/rBG3xB7MgHIDqJBoU9UKf/Mk5sr41
 /m/Q==
X-Gm-Message-State: AOAM532TVRJ5d+C4bWSESw6q7+A00fBmmtIX8kaddOmiD7pZ9daRdV5H
 weKUlJ0M5scDl6rSXC9gDUE=
X-Google-Smtp-Source: ABdhPJycvmpiA9Pbrp8XdAAvCp46CPA/nT0+1Ncp82mn1saQ8GOjKMoh52SiTZvSMxGjWjsehpbayg==
X-Received: by 2002:adf:ba08:: with SMTP id o8mr15188566wrg.234.1629801277555; 
 Tue, 24 Aug 2021 03:34:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k16sm1796009wms.17.2021.08.24.03.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 03:34:37 -0700 (PDT)
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
To: Finn Thain <fthain@linux-m68k.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1629799776.git.fthain@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
Date: Tue, 24 Aug 2021 12:34:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1629799776.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.023,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 12:09 PM, Finn Thain wrote:

> On a real Quadra, accesses to the SY6522 chips are slow because they are 
> synchronous with the 783360 Hz "phase 2" clock. In QEMU, they are slow 
> only because of the division operation in the timer count calculation.
> 
> This patch series improves the fidelity of the emulated chip, but the 
> price is more division ops. I haven't tried to measure this yet.
> 
> The emulated 6522 still deviates from the behaviour of the real thing, 
> however. For example, two consecutive accesses to a real 6522 timer 
> counter can never yield the same value. This is not true of the 6522 in 
> QEMU 6 wherein two consecutive accesses to a timer count register have 
> been observed to yield the same value.
> 
> Linux is not particularly robust in the face of a 6522 that deviates 
> from the usual behaviour. The problem presently affecting a Linux guest 
> is that its 'via' clocksource is prone to monotonicity failure. That is, 
> the clocksource counter can jump backwards. This can be observed by 
> patching Linux like so:
> 
> diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> --- a/arch/m68k/mac/via.c
> +++ b/arch/m68k/mac/via.c
> @@ -606,6 +606,8 @@ void __init via_init_clock(void)
>  	clocksource_register_hz(&mac_clk, VIA_CLOCK_FREQ);
>  }
>  
> +static u32 prev_ticks;
> +
>  static u64 mac_read_clk(struct clocksource *cs)
>  {
>  	unsigned long flags;
> @@ -631,6 +633,8 @@ static u64 mac_read_clk(struct clocksource *cs)
>  	count = count_high << 8;
>  	ticks = VIA_TIMER_CYCLES - count;
>  	ticks += clk_offset + clk_total;
> +if (ticks < prev_ticks) pr_warn("%s: %u < %u\n", __func__, ticks, prev_ticks);
> +prev_ticks = ticks;
>  	local_irq_restore(flags);
>  
>  	return ticks;
> 
> This problem can be partly blamed on a 6522 design limitation, which is 
> that the timer counter has no overflow register. Hence, if a timer 
> counter wraps around and the kernel is late to handle the subsequent 
> interrupt, the kernel can't account for any missed ticks.
> 
> On a real Quadra, the kernel mitigates this limitation by minimizing 
> interrupt latency. But on QEMU, interrupt latency is unbounded. This 
> can't be mitigated by the guest kernel at all and leads to clock drift. 
> This can be observed by patching QEMU like so:
> 
> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> --- a/hw/misc/mos6522.c
> +++ b/hw/misc/mos6522.c
> @@ -379,6 +379,12 @@ void mos6522_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
>          s->pcr = val;
>          break;
>      case VIA_REG_IFR:
> +        if (val & T1_INT) {
> +            static int64_t last_t1_int_cleared;
> +            int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +            if (now - last_t1_int_cleared > 20000000) printf("\t%s: t1 int clear is late\n", __func__);
> +            last_t1_int_cleared = now;
> +        }
>          /* reset bits */
>          s->ifr &= ~val;
>          mos6522_update_irq(s);
> 
> This logic asserts that, given that Linux/m68k sets CONFIG_HZ to 100, 
> the emulator will theoretically see each timer 1 interrupt cleared 
> within 20 ms of the previous one. But that deadline is often missed on 
> my QEMU host [4].

I wonder if using QEMU ptimer wouldn't help here, instead of
calling qemu_clock_get_ns() and doing the math by hand:

/* Starting to run with/setting counter to "0" won't trigger immediately,
 * but after a one period for both oneshot and periodic modes.  */
#define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)

/* Starting to run with/setting counter to "0" won't re-load counter
 * immediately, but after a one period.  */
#define PTIMER_POLICY_NO_IMMEDIATE_RELOAD   (1 << 3)

/* Make counter value of the running timer represent the actual value and
 * not the one less.  */
#define PTIMER_POLICY_NO_COUNTER_ROUND_DOWN (1 << 4)

> On real Mac hardware you could observe the same scenario if a high 
> priority interrupt were to sufficiently delay the timer interrupt 
> handler. (This is the reason why the VIA1 interrupt priority gets 
> increased from level 1 to level 5 when running on Quadras.)
> 
> Anyway, for now, the clocksource monotonicity problem in Linux/mac68k 
> guests is still unresolved. Nonetheless, I think this patch series does 
> improve the situation.

