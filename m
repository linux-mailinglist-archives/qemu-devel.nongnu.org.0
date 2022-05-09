Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834B3520406
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 19:58:14 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7e9-0002h9-Jq
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 13:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no7ck-0001TZ-Ed
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:56:47 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no7ch-0004Fh-Fn
 for qemu-devel@nongnu.org; Mon, 09 May 2022 13:56:46 -0400
Received: by mail-pg1-x52a.google.com with SMTP id q76so12655168pgq.10
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7LeB8EXfGOOqfM7UxABiOJwGcoMj7FM+ULtyqxjG1ys=;
 b=TMtm8Drb4ZCuG0wvdUI9WCImKzKscu/W10dEfE+xcvBzhIa+VMw/4JCBVidOZIUmrl
 jaMVLZiS9z5/dmcvjdEyrchFHlGiD3+gZaMEKj05EN/uywqPQfUoDLemxXHNUVESw7e4
 IWyeHQJ3EkrAhhQQrb4X0PX0+YBWtiRSSwNTlv8UBxsyZwmsVFpRo3XZQ/YleTWmKRfl
 Nup2ZiterCGHgVYXBEnQXD8Etb1oxcrMVeJq7GxAtuv1Zgplz8qiQ0fHEWUuRCZSH84G
 Ad67DWYirib4eh2hcKN5d50mgbubA3lkmrHFyI+vg5sTlyLG/eHRAGdGQ6QrcZ0Ynyqv
 1Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7LeB8EXfGOOqfM7UxABiOJwGcoMj7FM+ULtyqxjG1ys=;
 b=WzaBF9sDLQIlXxLWNTsJE9zir7obi1K+/OtzZa3aeYR3oy/M919Hi/qvT8i00Ujoia
 +1KCG6XD/tzkBKqFUjByaBplHWUVRfBDHptBy4R+lQU9i3annu7vdKG366Bq6BvPOlqF
 9O/ycJuFxxLwSi6K7yDmOtfCYUqw71Ahd60OxQF/VUw72xj1HkGM9F4CP7r68daMo+a2
 FS0wkHOy75A/67Tg0jZRZTtwu296W7t6/SmxQo4pZH12IGWAlRHiygTB6dMq1/FPRd8r
 ajGRl7eF2oxSu4o/4JjHGO0ZRlfG1MeYwu5a1Ljg+IJFoBGvHw2ufLhNtzknitPDR2dK
 hz3w==
X-Gm-Message-State: AOAM532wAnkLAGpvcw3zy8XpW/4BkQxSdvMdgllAHpEl8l8wslMxzwuz
 fqxhAtBIa0/DC+fv0X2ssRaM9w==
X-Google-Smtp-Source: ABdhPJx7FtzEWSKK/DaytI8t3PMWjOqLgdHq3rAUyZge24tlayg5Np/iNvgAR5GMbA3gt/fOp7bJfg==
X-Received: by 2002:a63:8ac1:0:b0:3ab:199:cbdf with SMTP id
 y184-20020a638ac1000000b003ab0199cbdfmr13731828pgd.466.1652119001360; 
 Mon, 09 May 2022 10:56:41 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x17-20020a634a11000000b003c14af50634sm8773801pga.76.2022.05.09.10.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 10:56:40 -0700 (PDT)
Message-ID: <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
Date: Mon, 9 May 2022 10:56:38 -0700
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
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 5/9/22 04:38, yangxiaojuan wrote:
>> You are not considering CSR[0x420][49], which changes the format of this mapping.
>>
> Thanks very much, I will consider the mapping format by read iocsr[0x420][49] like this:
> static uint64_t map_format(void)
> {
>      LoongArchCPU *cpu;
>      CPULoongArchState *env;
>      uint64_t val;
> 
>      cpu = LOONGARCH_CPU(current_cpu);
>      env = &(cpu->env);
> 
>      val = address_space_ldq(&env->address_space_iocsr, 0x420,
>                               MEMTXATTRS_UNSPECIFIED, NULL);
>      val &= 1 << 49;
>      return val;
> }

I'm not 100% sure how this "Other configuration control register" should be handled, but 
definitely not like this.

I see you're putting control of this register into loongarch_qemu_read in 
target/loongarch/cpu.c.  Which, I suppose is fair, because this is documented as part of 
the 3A5000 cpu documentation.  But then you split out all of the devices which are *also* 
documented as part of the cpu into the board configuration.

This reminds me of the memory-mapped interface that the armv7m cpu has with its own 
registers.  I believe that you need to model this similarly, where you will have a device 
that represents the cpu, and then instantiates all of the devices that are listed in the 
Loongson 3A5000 TRM -- call this ls3a to match the ls7a name you have for the 7A1000 
bridge device.

When there is a write to the ls3a "Other function configuration register", the ls3a will 
need to communicate the changes to the various bits to its various sub-devices.  I do not 
think it unreasonable to have direct function calls between the components.

Peter, do you have any advice from the armv7m side?


>>> +    case EXTIOI_IPMAP_START ... EXTIOI_IPMAP_END - 1:
>>> +        index = (offset - EXTIOI_IPMAP_START) >> 2;
>>> +        s->ipmap[index] = val;
>>> +        break;
>>
>> Do you need to recompute the entire interrupt map when ipmap changes?
>>
> Sorry, could you explain it in more detail? i can not understand the meanning of 'the 
> entire interrupt map'?

I mean, ipmap[*] and coremap[*] controls how isr[*] maps to the various cpus, as 
coreisr[*].  If either ipmap or coremap changes, do you need to re-compute coreisr[*] from 
the input isr[*]?


r~

