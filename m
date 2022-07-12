Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1B5729AD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 01:10:28 +0200 (CEST)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBP1P-0006jV-DM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 19:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOiu-00042m-Ud; Tue, 12 Jul 2022 18:51:23 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOim-00077E-5d; Tue, 12 Jul 2022 18:51:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v10-20020a05600c15ca00b003a2db8aa2c4so223181wmf.2; 
 Tue, 12 Jul 2022 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFcbEq5EcWcD0N59ldTbRHmsAO55vzJgRKUltLXBJCU=;
 b=kj573/SzpUceO/Ljb4ef1nmJD6ojXQu2rGp8qErAVMUYzi3Rs8CFP4LfMu9Wx0nXCz
 LWPwnePMUbsXTvrWBSu8DJEwaGlWQ3WiKSYES+2rQkiscYiBNHo8Vvf4VsuIgDetlPy2
 2aooR2bZAifW9mxkhJYBTNjiZfzfJFATzBxYvEh7jrtgRmOe1P57MouXbc6SKZRAzDcX
 45qBaMFAloCXH5JzKK6aLv1BINGlMbkQFUhct4z9jOR021+wvBgGsTqtd+jMvdALXbLv
 DS6v+NMXMFqT82NTve2Sjc/PDquCLSZyjrIuiqGPMikzD3ee8Oco63KqPlK8Mq2P59fy
 efew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iFcbEq5EcWcD0N59ldTbRHmsAO55vzJgRKUltLXBJCU=;
 b=J2e6qJhD12DCzd6f3eT2pZgY5Yb8CfQoNTL12u26ER4MQR6h5RIaBjXBkPqxwLBwMT
 OSSHyDURujRDcolqjg3S2ni5hNdRpk5hQSGvkGeN6f5UAnFWh7QJxTKSfqEc77EuyFOK
 +iWHYybBVfCjqjxEs90hOyP2yQ2KV9WX2Ibsku2CPSpU0R5NhIyRRl5TDxf7TlLicozs
 JsylwRdZGt6+KMhgs5EndAIyQzYszfX71HY5/QNV4ROvLGKFqVxTQ6yxZKdIiKq4/NLt
 qLlGYkujWmbAkuIjrrOx5ixu20u0swvXhpmDcUixlJ8PyZwlRBvNyhbZ6QUEREFSWj14
 DwNQ==
X-Gm-Message-State: AJIora/7S2GV28pB5nIgjxGEyF71Y+a7dBq1o0Afkmf5KFRXw/x8aJMI
 vmqWyQIxbmZEy16Q9GgT50g=
X-Google-Smtp-Source: AGRyM1veTbUYtMtm1peJq8x8oVoVNgvpkhqKx/GsaVOLguzyK2rz2DImyWnPQ/x7y7gsK5J99QXZsQ==
X-Received: by 2002:a05:600c:3545:b0:3a2:f3e3:c382 with SMTP id
 i5-20020a05600c354500b003a2f3e3c382mr987750wmq.142.1657666269934; 
 Tue, 12 Jul 2022 15:51:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d15-20020adfe84f000000b0021a56cda047sm9276709wrn.60.2022.07.12.15.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 15:51:08 -0700 (PDT)
Message-ID: <e693246c-5469-2010-2b2b-93bff3621276@amsat.org>
Date: Wed, 13 Jul 2022 00:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is
 being held high
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Igor_Kotrasi=c5=84ski?= <i.kotrasinsk@samsung.com>
References: <20220628154724.3297442-1-peter.maydell@linaro.org>
In-Reply-To: <20220628154724.3297442-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 28/6/22 17:47, Peter Maydell wrote:
> In the M-profile Arm ARM, rule R_CVJS defines when an interrupt should
> be set to the Pending state:
>   A) when the input line is high and the interrupt is not Active
>   B) when the input line transitions from low to high and the interrupt
>      is Active
> (Note that the first of these is an ongoing condition, and the
> second is a point-in-time event.)
> 
> This can be rephrased as:
>   1 when the line goes from low to high, set Pending
>   2 when Active goes from 1 to 0, if line is high then set Pending
>   3 ignore attempts to clear Pending when the line is high
>     and Active is 0
> 
> where 1 covers both B and one of the "transition into condition A"
> cases, 2 deals with the other "transition into condition A"
> possibility, and 3 is "don't drop Pending if we're already in
> condition A".  Transitions out of condition A don't affect Pending
> state.
> 
> We handle case 1 in set_irq_level(). For an interrupt (as opposed
> to other kinds of exception) the only place where we clear Active
> is in armv7m_nvic_complete_irq(), where we handle case 2 by
> checking for whether we need to re-pend the exception. For case 3,
> the only places where we clear Pending state on an interrupt are in
> armv7m_nvic_acknowledge_irq() (where we are setting Active so it
> doesn't count) and for writes to NVIC_CPSRn.
> 
> It is the "write to NVIC_ICPRn" case that we missed: we must ignore
> this if the input line is high and the interrupt is not Active.
> (This required behaviour is differently and perhaps more clearly
> stated in the v7M Arm ARM, which has pseudocode in section B3.4.1
> that implies it.)
> 
> Reported-by: Igor Kotrasiński <i.kotrasinsk@samsung.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Simple change, commit message long because I included all
> the analysis that we haven't forgotten any other cases.
> This is essentially the change Igor suggested in the qemu-arm
> thread, but it took me a while to find time to audit the code
> to confirm that was the only change we needed here.
> ---
>   hw/intc/armv7m_nvic.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 13df002ce4d..1f7763964c3 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -2389,8 +2389,15 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
>           startvec = 8 * (offset - 0x280) + NVIC_FIRST_IRQ; /* vector # */
>   
>           for (i = 0, end = size * 8; i < end && startvec + i < s->num_irq; i++) {
> +            /*
> +             * Note that if the input line is still held high and the interrupt
> +             * is not active then rule R_CVJS requires that the Pending state
> +             * remains set; in that case we mustn't let it be cleared.
> +             */
>               if (value & (1 << i) &&
> -                (attrs.secure || s->itns[startvec + i])) {
> +                (attrs.secure || s->itns[startvec + i]) &&
> +                !(setval == 0 && s->vectors[startvec + i].level &&
> +                  !s->vectors[startvec + i].active)) {
>                   s->vectors[startvec + i].pending = setval;
>               }
>           }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

