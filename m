Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C152352C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:16:10 +0200 (CEST)
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1non8K-0004gs-G7
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1non6W-0003uZ-1m
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:14:16 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:47003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1non6U-0004Mh-B8
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:14:15 -0400
Received: by mail-pf1-x433.google.com with SMTP id j6so2078734pfe.13
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K6ByvdA3xWdkA6wmICcWp2Du6BWYON5RcxeXBFHVpdc=;
 b=R5mXhWQvdYWmgRAi4j9jfR8p4W0mmPAdL53Qxi7q8k9iK/GYyTBVZWCs9rZytZiuJO
 qPZoiF/znMhb5sf9LJ6FJYu/T4sIlnZTVc2NB9l0aMB6goWxNrH+sSzMyHbhJxcFY9Bp
 DEsnwu7mCjNU8YC0fDOa7v1ethzEUsfvJ995Oxo05RrxmKG6RvZHv5bZSq7Ixne3gbCR
 Zq6zDxpTooAW6j4gntGytNCRAljYa774yhQoy9t7hjRK+FX+yZa4zcciqDuaJksC1Dnh
 tIFOPx1x+S/rtt71EkO2VFrx25W63lNJ3qCQME91XB57GWvCDPSGR+dH5rGSJqsyzMIM
 hoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K6ByvdA3xWdkA6wmICcWp2Du6BWYON5RcxeXBFHVpdc=;
 b=W1SBI7tCMS8/Yq850DL1Yy2dduMofZGa26MK//RhknnGoqMFHt5joYTP+1QsehSxT5
 CFj1SWWFYY3wILJG5ULED9xGlYP8WLxtYBrvRHFB2ndAseSjbomMCuiV/FghNwvJ/6ku
 OeNAInIMWFYK5KiyGQnSO8MprSPOwlCwkRIa5t+ZAMykzkHXSca0MpYFFW++2Gur3yvS
 67deLNmHGNr4vqlLgF+g43bAu7tS8CrtaS5J5b2lr4RCGxNqZbbiVU5MJAXLnffDCzDB
 JojpEWTQ6Xag+KlPukGFSgBEofwVRr8on8DdpxaWH8LjD/YHKBkvXsnpgR654HCaxVvj
 6QqA==
X-Gm-Message-State: AOAM532gpBVL1Jn+Y79dkIXi6Smj1eEllkleVgQJroQ6m6/AwqKhv+x6
 13tu6GKisF3BhhL1lm9goKKZZw==
X-Google-Smtp-Source: ABdhPJxkbXveV4v2CSI8FaHAPyajmadBfalwTUhS6dIDzvetR5+sHEcWuSXSaaAGve+Kn/cYER8edQ==
X-Received: by 2002:a65:6093:0:b0:373:9c75:19ec with SMTP id
 t19-20020a656093000000b003739c7519ecmr21630895pgu.539.1652278452025; 
 Wed, 11 May 2022 07:14:12 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806c:42f5:cebe:3b5a:a8f:7ffc?
 ([2607:fb90:806c:42f5:cebe:3b5a:a8f:7ffc])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a170902b41200b0015e8d4eb26asm1900756plr.180.2022.05.11.07.14.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 07:14:11 -0700 (PDT)
Message-ID: <1c64c465-542e-d04e-4e50-ce2836453e67@linaro.org>
Date: Wed, 11 May 2022 07:14:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
 <b0fd3277-8abd-b6fc-bf1f-a083a3b04337@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b0fd3277-8abd-b6fc-bf1f-a083a3b04337@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/11/22 02:54, yangxiaojuan wrote:
> 
> On 2022/5/10 上午1:56, Richard Henderson wrote:
>>
>>>>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>>>>> +        index = (offset - EXTIOI_IPMAP_START) >> 2;
>>>>> +        s->ipmap[index] = val;
>>>>> +        break;
>>>>
>>>> Do you need to recompute the entire interrupt map when ipmap changes?
>>>>
>>> Sorry, could you explain it in more detail? i can not understand the meanning of 'the 
>>> entire interrupt map'?
>>
>> I mean, ipmap[*] and coremap[*] controls how isr[*] maps to the various cpus, as 
>> coreisr[*].  If either ipmap or coremap changes, do you need to re-compute coreisr[*] 
>> from the input isr[*]? 
> 
> I think the interrupt has been handled by the core before set coremap or ipmap, and 
> coreisr[*] also has been set and cleard by original core.
> So,  the new mapped core need not  to update the coreisr[*].


Why do you believe that the core to which the interrupt is directed has interrupts 
enabled?  Why do you believe the core to which the interrupt is directed is the one that 
is changing the interrupt mapping?

I think your assumption is not correct.


r~

