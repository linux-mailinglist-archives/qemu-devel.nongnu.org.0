Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E8E4AFF6E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 22:48:44 +0100 (CET)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHupP-0000Wv-6Q
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 16:48:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHunz-0008GD-I6
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:47:15 -0500
Received: from [2607:f8b0:4864:20::62b] (port=41717
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHunx-0006kI-Gt
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:47:15 -0500
Received: by mail-pl1-x62b.google.com with SMTP id j4so98304plj.8
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VhzraPX1jCa3/if1zot0SyM6FhdeocupPfAQhJYoXNw=;
 b=IPkZ3E4hAFHvIcEisnLCnDp7y4pM5c71mXumKJOCohWXpUSEUEEDi2fhFWt0AelOk7
 CuiDeNQ3jl06wNqYTs6hUFONAHnz9Yh/x1IHl/mWG47g3pUfz3zO9EOBPRRXEVWupA94
 +oVcaffTowzPkYBmxwBW1dUlRGeb+5oyAxKW4DmIniRwSmo0hmmhoDQCLPR6Q+3t4iXC
 IVcYZ1ZokPYxZYd5ZhSMEi6jiAysqJQRWcoJEqIsGfwncDKCHHwFnb2zP+nngXLdjeYy
 9xpCOJ+nTOTnh76+p/M9VukQq7Np88lVJZo3lWDn8TbaghepuIP0nJsT+tIGnbE05pJP
 LB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VhzraPX1jCa3/if1zot0SyM6FhdeocupPfAQhJYoXNw=;
 b=3AgNMcxupuGwzhyny9ALyOyYfy0BlsgxSfr11bShohvMJbh8KAuoAg4xMJTa1AmM9s
 uXPUyW91gQOIhAwmDwZnF7f96Bd197NJWPC0NPi612B9bHRSTP5WBlGyxhzX7xQK9eii
 Imh/9fSGdfd76iflLOZURjLROJm/WUS/ZLSthcWY5CnUV8tSCxxooEUcvDZu+s5WNlag
 A/o+2xfVyHNtNt0VcRdEhdtajvv5KyD86xsmOgoTAEnhMgltYMRbCs/ZunEta8QybuoU
 j4cA6aOID7vDM+ldq+4EJGIvb0Bf9tICHXJXwFOkUABVToh3RqhTfc4Tm+82/dxXG5T6
 nO2g==
X-Gm-Message-State: AOAM533iWeTtXZK6azGn7jss1cEIJueckozYujt3mJkOYshdbzT7R3fV
 6TpraO7dbPVytyRobXQPTIw=
X-Google-Smtp-Source: ABdhPJzfzw+3+SmiY5yK494ZouGDFi113bRNmJX3WotUMnnM416vdm/TivIlQsMy6qqZXnYqIgsWxA==
X-Received: by 2002:a17:902:d64f:: with SMTP id
 y15mr4368776plh.145.1644443227922; 
 Wed, 09 Feb 2022 13:47:07 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nl7sm7291789pjb.5.2022.02.09.13.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 13:47:07 -0800 (PST)
Message-ID: <c2bf6a19-286d-00a1-218e-9e4070507d3c@amsat.org>
Date: Wed, 9 Feb 2022 22:47:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 10/13] target: Use CPUArchState as interface to
 target-specific CPU state
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-11-f4bug@amsat.org>
 <514ac4e3-73f7-4bed-29cd-390dd75d1901@linaro.org>
In-Reply-To: <514ac4e3-73f7-4bed-29cd-390dd75d1901@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 23:40, Richard Henderson wrote:
> On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
>> While CPUState is our interface with generic code, CPUArchState is
>> our interface with target-specific code. Use CPUArchState as an
>> abstract type, defined by each target.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/exec/poison.h   | 2 --
>>   include/hw/core/cpu.h   | 2 +-
>>   include/qemu/typedefs.h | 1 +
>>   target/alpha/cpu.h      | 6 ++----
>>   target/arm/cpu.h        | 2 +-
>>   target/avr/cpu.h        | 6 ++----
>>   target/cris/cpu.h       | 2 +-
>>   target/hexagon/cpu.h    | 5 ++---
>>   target/hppa/cpu.h       | 6 ++----
>>   target/i386/cpu.h       | 2 +-
>>   target/m68k/cpu.h       | 2 +-
>>   target/microblaze/cpu.h | 4 ++--
>>   target/mips/cpu.h       | 5 ++---
>>   target/nios2/cpu.h      | 4 ++--
>>   target/openrisc/cpu.h   | 2 +-
>>   target/ppc/cpu-qom.h    | 2 +-
>>   target/ppc/cpu.h        | 3 +--
>>   target/riscv/cpu.h      | 4 ++--
>>   target/rx/cpu-qom.h     | 2 --
>>   target/rx/cpu.h         | 2 +-
>>   target/s390x/cpu-qom.h  | 2 +-
>>   target/s390x/cpu.h      | 2 +-
>>   target/sh4/cpu.h        | 2 +-
>>   target/sparc/cpu.h      | 4 ++--
>>   target/tricore/cpu.h    | 5 ++---
>>   target/xtensa/cpu.h     | 6 +++---
>>   26 files changed, 36 insertions(+), 49 deletions(-)
> 
> Nice.
> 
> It's tempting to purge CPUFooState entirely, which would eliminate e.g. 
> patch 8, and put the onus on having cpu.h (and thus the actual 
> definition of CPUArchState) in scope to the C file that includes those 
> headers.

I tried but I doubt the result code will please maintainers. I went
back and inverted the typedef, to keep CPUFooState. Maybe a simple
aesthetic concern... I can post (on top of the respin) if you are
interested.

Thanks,

Phil.

