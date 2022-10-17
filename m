Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5C601B43
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:28:33 +0200 (CEST)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXex-0007Ss-Pf
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXbj-0003JM-67
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:25:11 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXbg-0004Jj-7x
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:25:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id n9so9500375wms.1
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 14:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hzj7XP+gY2q0KSgyfkprzTJuwwYoGTnxMAkZXbLIPvc=;
 b=pHptNOkvc7KnA1Jl7/zjrjKrFDRkXIun5v1JA6055T7y2CaWyBCN74zjnsPhyI+TWL
 wfAZbhj6AP6QhWUGigS7pTvccH8a5oOTEtMI7mi2UsZ/ibb3KP7lBV9m3FF64feWwQgl
 VaFnRauKnvsPosAM0Y3XC3VaAS9piavrHjSHICdQpR32r5wkpeL9wrdDgMZVQtwLTKSg
 Jg9pn+Cb91Uli1kE8NRuC/RjUYu3QsPgG/rMU5IvsJCziBnSon/tEfqwK8mf4GW2aO1L
 ljriDywvwqcn+JvIvcaK0ENdRfHp12SJZFBFf2kWt138qNEj+PbbTfw/VLU4cT5ojU2Q
 bafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hzj7XP+gY2q0KSgyfkprzTJuwwYoGTnxMAkZXbLIPvc=;
 b=52IaqjQ8lJIwJVffKKrC9V/w/igk9jJEprv4/QNa36Q/nwrHMIjpZEQs+JjA9kj3YU
 O6a8kvG6qeW/xuIF+NM6NyQAosoyGnDD4u1HcACfaKISTXPjH8LT5/mSO13QdhsCj+ts
 DFJLS59h4DJup4aYV1GBMo/PlnYMVBpQcaSZqSioNJ3PNoCH183hyicmAKygqDw6tDZ4
 zEnIo1JEYrJN03WXwJIJhgVzTZxu5zcXCzoLUyusJwtH3icevVEQCAVvoqmnwoTsWCpa
 l4Agmg3jIxiiO1FBLoaKUPZUWsVwZ90OUwCeRvIuCwMwNAue7fpNrNM+HQG1FygnRtvX
 ojdg==
X-Gm-Message-State: ACrzQf3ASCTEMLHfxL4bqOUBTjaYuCeSfaCp6u8KlChH0KWx0QNfAMfe
 Y4Y779qeBNbhP1ArRSsAwHeKaw==
X-Google-Smtp-Source: AMsMyM6QKeT7bpvzZO2cdScFbZhWna7PPSaxvo+IuNPtEsDAyJnwHDD3fCLwGFlD0MM57UIS6qnx5Q==
X-Received: by 2002:a05:600c:a05:b0:3b9:cecc:9846 with SMTP id
 z5-20020a05600c0a0500b003b9cecc9846mr20297164wmp.3.1666041906430; 
 Mon, 17 Oct 2022 14:25:06 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a05600c000200b003c5571c27a1sm13756681wmc.32.2022.10.17.14.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 14:25:05 -0700 (PDT)
Message-ID: <6ae07ede-61ed-0ef5-34f5-61201be3c0f1@linaro.org>
Date: Mon, 17 Oct 2022 23:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] hw/ide/microdrive: Use device_cold_reset() for self-resets
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20221013174042.1602926-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221013174042.1602926-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/22 19:40, Peter Maydell wrote:
> Currently the microdrive code uses device_legacy_reset() to reset
> itself, and has its reset method call reset on the IDE bus as the
> last thing it does.  Switch to using device_cold_reset().
> 
> The only concrete microdrive device is the TYPE_DSCM1XXXX; it is not
> command-line pluggable, so it is used only by the old pxa2xx Arm
> boards 'akita', 'borzoi', 'spitz', 'terrier' and 'tosa'.

Candidates for deprecation?

> You might think that this would result in the IDE bus being
> reset automatically, but it does not, because the IDEBus type
> does not set the BusClass::reset method. Instead the controller
> must explicitly call ide_bus_reset(). We therefore leave that
> call in md_reset().
> 
> Note also that because the PCMCIA card device is a direct subclass of
> TYPE_DEVICE and we don't model the PCMCIA controller-to-card
> interface as a qbus, PCMCIA cards are not on any qbus and so they
> don't get reset when the system is reset.  The reset only happens via
> the dscm1xxxx_attach() and dscm1xxxx_detach() functions during
> machine creation.
> 
> Because our aim here is merely to try to get rid of calls to the
> device_legacy_reset() function, we leave these other dubious
> reset-related issues alone.  (They all stem from this code being
> absolutely ancient.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/ide/microdrive.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
> index 6df9b4cbbe1..56c5be36551 100644
> --- a/hw/ide/microdrive.c
> +++ b/hw/ide/microdrive.c
> @@ -175,7 +175,7 @@ static void md_attr_write(PCMCIACardState *card, uint32_t at, uint8_t value)
>       case 0x00:	/* Configuration Option Register */
>           s->opt = value & 0xcf;
>           if (value & OPT_SRESET) {
> -            device_legacy_reset(DEVICE(s));
> +            device_cold_reset(DEVICE(s));

I agree this one is dubious.

>           }
>           md_interrupt_update(s);
>           break;
> @@ -318,7 +318,7 @@ static void md_common_write(PCMCIACardState *card, uint32_t at, uint16_t value)
>       case 0xe:	/* Device Control */
>           s->ctrl = value;
>           if (value & CTRL_SRST) {
> -            device_legacy_reset(DEVICE(s));
> +            device_cold_reset(DEVICE(s));

Ditto (dubious).

>           }
>           md_interrupt_update(s);
>           break;
> @@ -543,7 +543,7 @@ static int dscm1xxxx_attach(PCMCIACardState *card)
>       md->attr_base = pcc->cis[0x74] | (pcc->cis[0x76] << 8);
>       md->io_base = 0x0;
>   
> -    device_legacy_reset(DEVICE(md));
> +    device_cold_reset(DEVICE(md));

This one makes sense.

>       md_interrupt_update(md);
>   
>       return 0;
> @@ -553,7 +553,7 @@ static int dscm1xxxx_detach(PCMCIACardState *card)
>   {
>       MicroDriveState *md = MICRODRIVE(card);
>   
> -    device_legacy_reset(DEVICE(md));
> +    device_cold_reset(DEVICE(md));

Ditto (correct).

>       return 0;
>   }
>   

Hoping this help to get ride of device_legacy_reset():
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


