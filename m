Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DA953D810
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 19:46:25 +0200 (CEST)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxXqx-0007Wi-M3
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 13:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxXoA-0006cg-Lw
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 13:43:30 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxXo6-0004nv-KR
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 13:43:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so14542882pjo.0
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zBUleHY/7WLUV5A6tWvyIaKgoXOKSrXghjVFxG6O4AI=;
 b=WB/TB9dM8QQh8060P7pP1IpZK8KCmbO9mHJUUc87k0YZlwXi9ofWPMYQKyaAJeWSuV
 1l8nOkAjLRTkgSYrVpCsjBvnMlF5aNuUlWBM/fRdF0D9bp+tftooNzdYL4W3JrS3ZkE0
 qUFiZ+o8lJtNoZ85bUTSGca6IjcC98c4FlZxZQ1PeoCMjyY4xutRqukLgJmbAoow95F/
 1cY/1MU8+t4HwEQ0PE0tYxnEZroxa0za/AEDLL6YekD2CCxdZbOm2Ie8nrp8AruJpp+i
 U4y469YYlTycyAjZh8t/VbPMORi1gByxtW6qBqfr8XIdwShpPpaSo+7FQQhdBG3u4Vjw
 i0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zBUleHY/7WLUV5A6tWvyIaKgoXOKSrXghjVFxG6O4AI=;
 b=kHpr9nOQl66OW0WFsCTOA8XYia+4D0ICFhY9k0qxGtdpRmRDp+LOEkEdBAM8E3FLeQ
 Ubqwii/x3C4s+cYqhHBHoCXDJ5z7qZRf4VfwS6GdNtsx8mCztQr5lszQoOoxP7hb7Deq
 /q2Bm72/Nonh/epGMw+wRjWFMoBmtEAPG+dR2g+UQ/yUGGegqsTOCIlqhCV/rqIjzD7W
 igKKBk8GMcu5prARhT4+JkLWGKYHmeTkxTeGvc3GpMYhEwRzsxTfS8GC5mPxp9zrFwpN
 8lns+WpfHeLXfbimWlFY3KLWj6uugY8mymga9gQUwKB/yUSW6MD0ZRFBG+3wA3rX85kL
 s1kQ==
X-Gm-Message-State: AOAM532HnzwrhUe5+vb073p3q6skPj8Uho2Umm1mox52pGR9//RbAJif
 6kMyFWBiv0S6hS61P2VXlybX+w==
X-Google-Smtp-Source: ABdhPJycQaSVMoH08/CnUUhBY1DBVUT7UZLqqVpyyHuXNopYLYwVS5/esttsm2KgRqMsEE//AzuoEA==
X-Received: by 2002:a17:902:a502:b0:151:8289:b19 with SMTP id
 s2-20020a170902a50200b0015182890b19mr15648804plq.149.1654364603845; 
 Sat, 04 Jun 2022 10:43:23 -0700 (PDT)
Received: from [192.168.0.4] (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a17090a590100b001e33e264fd6sm7032108pji.40.2022.06.04.10.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 10:43:22 -0700 (PDT)
Message-ID: <44db7bb4-b1d3-ef2f-44fb-b8198c724d5c@linaro.org>
Date: Sat, 4 Jun 2022 10:43:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/28] target/arm: Move stage_1_mmu_idx decl to internals.h
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220604040607.269301-1-richard.henderson@linaro.org>
 <20220604040607.269301-2-richard.henderson@linaro.org>
 <c1295e83-88e1-7530-6965-f7385b908a83@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c1295e83-88e1-7530-6965-f7385b908a83@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 6/4/22 03:40, Philippe Mathieu-Daudé wrote:
> On 4/6/22 06:05, Richard Henderson wrote:
>> Move the decl from ptw.h to internals.h.  Provide an inline
>> version for user-only, just as we do for arm_stage1_mmu_idx.
>> Move an endif down to make the definition in helper.c be
>> system only.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/internals.h | 5 +++++
>>   target/arm/helper.c    | 5 ++---
>>   2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/arm/internals.h b/target/arm/internals.h
>> index b654bee468..72b6af5559 100644
>> --- a/target/arm/internals.h
>> +++ b/target/arm/internals.h
>> @@ -979,11 +979,16 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env);
>>    * Return the ARMMMUIdx for the stage1 traversal for the current regime.
>>    */
>>   #ifdef CONFIG_USER_ONLY
>> +static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
>> +{
> 
> Should we assert(mmu_idx == ARMMMUIdx_Stage1_E0)?

You mean ARMMMUIdx_EL10_0, the stage2 idx, but no, I don't think that's useful considering 
the ifdef.


r~

