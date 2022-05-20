Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41352EF2E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 17:28:45 +0200 (CEST)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns4YV-00058a-LD
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 11:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4Wg-0003nj-3c
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:26:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4Wd-0005HM-3n
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:26:49 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 ob14-20020a17090b390e00b001dff2a43f8cso1769441pjb.1
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 08:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pNiOnw83gybudP+Rv+OLS398lDs61YHhuRK5MDIWlVg=;
 b=IiOlElK4rFZh1NaQe03caSWh+Mzt0WMNKU9O9n8PUnSfHx1c9k29WnEF1Khzd+etvJ
 Bb7V/QJtqawCL73/WvhkutH8ZwDTN98IitvTLmksLxeBr+sa3HcVO16q3Jz4D3UtxEnb
 J6azA6h3giwvBXVEL7DLrkVjcGcFZkOXJZR4qi9etu8TXyV2U1FKMusfjBLtF/YdQfGL
 xemPpXloS6zWxsm5/l/U3QDdO/2B048H9XooKSP3SN3B/RPT+vyu9uNH2JAQhWI9bo8E
 fYTUohgPSBmfiuZdmBBJzx8oQvNr/chExO+NtioT+cLievFwJv0fc9TfyDKEmMCGEIOG
 e+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pNiOnw83gybudP+Rv+OLS398lDs61YHhuRK5MDIWlVg=;
 b=m6lQvaixajZ9QvX7qw2IXVDTYAlDWuLRojFg11TDfPE0drHloTB+y+ezknkyctRQnI
 W+OHFu5tCtNa8olWUDBFTuBphAIDGq8MVYrqKk5AZuDGuEYYuMfGhzE1tsh7oXk1k9kC
 T9Zre0FkHUomCkF1pADA/XJfX8m1mIsTka0X7Icq7bYEePjdmV8HpbkfvyJsEY0ub7R1
 p/m0LnCnjxsLTE7x2oNtrJXz+5eQiiq0Hug/BUEDmNBUdzG8vPSYhLP0nRdPAsmbCBZq
 jiICeXdeVsz8wtvtaZFidZFvWmmSnAY4/VkefonQZoyXxvSkbjjAxOO9aDFrjtGE8oXZ
 PjUQ==
X-Gm-Message-State: AOAM532UFkf3Q+83o4h2sI2nNJ2SopWFM8xSIAVl2Mu1f14RdGaLiSDq
 xcu9SgJigelMjLIsYT8wv7NYOA==
X-Google-Smtp-Source: ABdhPJzlpWVh3wHPorf3LkjrbKlI6x7vP8u/lqQcQ1ph/hMpCaqA4mTfKh0ue1s1UwqUp6bUM8mLAg==
X-Received: by 2002:a17:90b:3806:b0:1df:99ce:d142 with SMTP id
 mq6-20020a17090b380600b001df99ced142mr11443357pjb.241.1653060404207; 
 Fri, 20 May 2022 08:26:44 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902dacf00b0015e8d4eb272sm6070304plx.188.2022.05.20.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:26:43 -0700 (PDT)
Message-ID: <c3e52915-38f1-c555-5caa-19d5308eef02@linaro.org>
Date: Fri, 20 May 2022 08:26:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] util: optimise flush_idcache_range when the ppc host has
 coherent icache
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220519141131.29839-1-npiggin@gmail.com>
 <e9d693db-f195-4bb1-c883-0805d910fe61@linaro.org>
 <1653004360.c5nktxvrgu.astroid@bobo.none>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1653004360.c5nktxvrgu.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/19/22 17:04, Nicholas Piggin wrote:
>> I'm even more tempted to merge the two files to put all of the machine-specific cache data
>> in the same place, then this variable can be static.  There's even an existing TODO
>> comment in cacheflush.c for aarch64.
> 
> That might be nice. Do you want me to look at doing that first?

If you wouldn't mind, please do.  I'll take care of aarch64 cleanup related to the TODO 
afterward.

>>>        b = rw & ~(dsize - 1);
>>> +
>>> +    if (have_coherent_icache) {
>>> +        asm volatile ("sync" : : : "memory");
>>> +        asm volatile ("icbi 0,%0" : : "r"(b) : "memory");
>>> +        asm volatile ("isync" : : : "memory");
>>> +        return;
>>> +    }
>>
>> Where can I find definitive rules on this?
> 
> In processor manuals (I don't know if there are any notes about this in
> the ISA, I would be tempted to say there should be since many processors
> implement it).
> 
> POWER9 UM, 4.6.2.2 Instruction Cache Block Invalidate (icbi)
> 
> https://ibm.ent.box.com/s/tmklq90ze7aj8f4n32er1mu3sy9u8k3k
...
> Yeah it's just a funny sequence the processor implements. It treats icbi
> almost as a no-op except that it sets a flag such that the next isync
> will flush and refetch the pipeline. It doesn't do any cache flushing.

Thanks.  A short comment in the code would be helpful here.

Also, since the docs say "any address", you might as well just use rx unmodified and sink 
the computation of 'b' back next to 'e'.


r~

