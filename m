Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3254DCC31
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:18:47 +0100 (CET)
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtlu-0005Qm-Bj
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:18:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUtjp-0004Nc-MG
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:16:37 -0400
Received: from [2607:f8b0:4864:20::633] (port=40775
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUtjo-0003z8-3n
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 13:16:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id h5so4992265plf.7
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Hs+ySeu0SIbOOweoKlUlZ/k9ugxU9M2Fb0ZffyMxX4s=;
 b=fDzsgtGwJUcgNwGen5VEk8JRUkkbbmtU/6AFw+1Xl9jAk8ioedzKGFPpq7UGdL6qql
 hUVTVLeXRkLq73lJm44kdxMZNVjPZg2Bmf2GDvQmdqrgOpfkuXU9ZdQzj5sfZHzDLQV1
 MlzNf9xHIbJd1JRblSrCrZSSKdlcJg8B+CMsEyiGq9RYM/56cwih58CNfzfS/ou/LM5W
 mrD7VwnOSeewJn+rm3EJo/J1aIYY9IrChWhQZnyG3CN/BaouyOG+GAY45Ni6wzxWbSkR
 iku2ckyDht/XEcvumW+EsNP9LNDVHWo/QqFiPFXZch+KhhJVmy94+V+aDuPp0x/ZoA16
 RszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hs+ySeu0SIbOOweoKlUlZ/k9ugxU9M2Fb0ZffyMxX4s=;
 b=kzGN6gCPOKowcJxjLopOCD663tpip+8FStZaEznrEi4nz5V7szjf6iY9UpvQCZWvDV
 F0eVVzs5S/1/CYxJEabvNrQGnKL53Nw4SXT7HvNkEJ8NmHccEdC7xuUurtD92qGEBTls
 Ruqov8MUhcH5+jj1WEZVmGhWheMEfyZqqPMniw6n+p1ID6CiczRiZuKjkHDBxilNJIln
 XCFwu+epFY2KbwT7CrjALvVnlTeauWxJ+np22IPySuJFyteUIGWuc7N8Y788S0k2yJyD
 Y/79hLD25r1yw5sxnasZE/pe9q9CoHIr1LrlSOQdU3a9hGUk/r0cWAUBp+Qpi9oNTX94
 u4Ng==
X-Gm-Message-State: AOAM530RyuF5z+nskUYBHYRZfoDKXQNVcgt03OrFzgHx+E8jzOCBeE//
 Vtk9ckCEFaAhZIAX66yLny4WTg==
X-Google-Smtp-Source: ABdhPJwSoGtAaOFHizAdmL5De4g8ecO4ZSY6oXCjlLQmB/U/SoWm4PNp8I7wMtAhJebcJS6Vvp3xRg==
X-Received: by 2002:a17:90a:9408:b0:1b5:3908:d3d1 with SMTP id
 r8-20020a17090a940800b001b53908d3d1mr6553625pjo.188.1647537394646; 
 Thu, 17 Mar 2022 10:16:34 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 nn15-20020a17090b38cf00b001bfceefd8cfsm10388563pjb.48.2022.03.17.10.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 10:16:34 -0700 (PDT)
Message-ID: <cc93227f-a1a1-d153-7307-fc679cada605@linaro.org>
Date: Thu, 17 Mar 2022 10:16:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.1 v6 26/51] target/nios2: Prevent writes to
 read-only or reserved control fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-27-richard.henderson@linaro.org>
 <CAFEAcA_HLwHWKb44U4Dp_jsCyam8kEuAgKjszWPt2vnaEApoYw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_HLwHWKb44U4Dp_jsCyam8kEuAgKjszWPt2vnaEApoYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/22 08:49, Peter Maydell wrote:
> On Thu, 17 Mar 2022 at 05:53, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create an array of masks which detail the writable and readonly
>> bits for each control register.  Apply them when writing to
>> control registers, including the write to status during eret.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -34,6 +34,15 @@ void helper_raise_exception(CPUNios2State *env, uint32_t index)
>>   #ifndef CONFIG_USER_ONLY
>>   void helper_eret(CPUNios2State *env, uint32_t new_status, uint32_t new_pc)
>>   {
>> +    Nios2CPU *cpu = env_archcpu(env);
>> +
>> +    /*
>> +     * Both estatus and bstatus have no constraints on write;
>> +     * do not allow reserved fields in status to be set.
>> +     */
>> +    new_status &= (cpu->cr_state[CR_STATUS].writable |
>> +                   cpu->cr_state[CR_STATUS].readonly);
>> +
>>       env->ctrl[CR_STATUS] = new_status;
> 
> Isn't this allowing the guest to write to readonly bits ?

Well, CPS is certainly required to be set by eret -- that's a difference between eret and 
wrctl.  However, I've just noticed a comment on page 3-58:

> Do not set status.PIE in a nonmaskable ISR. If status.PIE is set, a maskable interrupt can pre-
> empt an NMI, and the processor exits NMI mode. It cannot be returned to NMI mode until the
> next nonmaskable interrupt.

which suggests that eret does not restore NMI from estatus, as saved by normal interrupt.

So I guess this should be just writable | CPS_MASK.


r~

