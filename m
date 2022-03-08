Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA584D21B7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:37:08 +0100 (CET)
Received: from localhost ([::1]:37398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfdr-0007uj-Ks
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:37:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfbK-00069u-Uj
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:34:30 -0500
Received: from [2607:f8b0:4864:20::62c] (port=35807
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfbJ-0006ib-DU
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:34:30 -0500
Received: by mail-pl1-x62c.google.com with SMTP id n15so35985plh.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gD0BSF8a5kJYTBRrKZ84lbpGGCHz4ITAUjF+h/LDA38=;
 b=Zr3psCzVbW8FXvFcEugA2VPkQqriImU2damryM8d0K8deJXD1aDTH6MoXk549LcC0X
 6iVmT76ZvYliL2r0Tvs8w4jMfPRDJMCcNoL8PEYiiX4K3pql3oxBzLugJ9vbq5rxFa9q
 YaOrq+VsVQzDcslvQhgRCRdzZwCC6rPpLv+2BQpVpwhSmt2pFHBXiFZDtGakq5D5mgAf
 XcoC+i+jBivZKMMuEMGIc/L2+XYSsaKVZ5r97uLb80bRHn67akhzJgQWm8f6MycjVHhW
 zIPqMlga0S90j7Co3nUnl/C8nWA2OqDaZvxSdWy0uimUVoGcOgQgSN6ADeTKbCghqQQ8
 mFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gD0BSF8a5kJYTBRrKZ84lbpGGCHz4ITAUjF+h/LDA38=;
 b=3QsVJR7YhDQz038FUfe5qfR1HscOZbheo9C+adpblLx8YrEWRuVH/lA09o1QeSpWII
 sSs8lY39eIxg2Nmjmkh6qE3A7GTC+1CQ7ZzdfyeclIjuoosSMylt81kFC8Ua/Fl2Y9kY
 Xvmg75+renrNEmdIS+2LHMMOMEFEZRnklYm5Ux0mXxt732qLqTEEa9mW60tM88KDLdDq
 l6sX5yaTgGZQCxeXZvLI7HkzBijL2jUtoAPvdhUz97OqpZgeuXwADriehfX+uBSSg/43
 RYjgFjssjMeL9dLBhzXcnnOG2BSq8jcZE0K6J3ysi4gtq/wkEYt6haoOjfHsActi1kVg
 hJoA==
X-Gm-Message-State: AOAM531fMwjVCQkT1/atZ+ODqvgAADdCkInHoimrcmzbE5WZtqqwYfJ1
 gdnUEgBd4JBXhn5ApcfdegjmPQ==
X-Google-Smtp-Source: ABdhPJyzSheEOIUAGoyxCFZH4bNCOmVWZrhHX2js7910rNbNsya7SIfLhYHvdViJcqmVH4qIVh+5LQ==
X-Received: by 2002:a17:90a:990c:b0:1bc:3c9f:2abe with SMTP id
 b12-20020a17090a990c00b001bc3c9f2abemr6464949pjp.220.1646768067747; 
 Tue, 08 Mar 2022 11:34:27 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm22234635pfh.143.2022.03.08.11.34.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:34:27 -0800 (PST)
Message-ID: <75d6c7e6-a6ab-88e4-b15d-3513749b606f@linaro.org>
Date: Tue, 8 Mar 2022 09:34:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 07/33] linux-user/nios2: Trim target_pc_regs to sp and
 pc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-8-richard.henderson@linaro.org>
 <CAFEAcA-8oE1v0Y3Egr1C0Uo4U3HeX0TwY8H8aMb9geruOAYoKA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-8oE1v0Y3Egr1C0Uo4U3HeX0TwY8H8aMb9geruOAYoKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 3/8/22 00:00, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 07:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The only thing this struct is used for is passing startup values
>> from elfload.c to the cpu.  We do not need all registers to be
>> represented, we do not need the kernel internal stack slots.
>>
>> The userland argc, argv, and envp values are passed on
>> the stack, so only SP and PC need updating.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/nios2/target_syscall.h | 25 ++-----------------------
>>   linux-user/elfload.c              |  3 +--
>>   linux-user/nios2/cpu_loop.c       | 24 +-----------------------
>>   3 files changed, 4 insertions(+), 48 deletions(-)
> 
> Well, I guess we're not using it for anything else currently,
> but if you do this then it's not the target arch's pt_regs
> struct any more. And all our other target archs seem to define
> the struct to follow the kernel definition even if we don't
> happen to use it all.

Yes, something I've meant to clean up for ages.

My real goal here was removing the reference to estatus, which then does not need to be 
converted to a different form in the coming patches.

(Assigning to estatus is unusable in user-mode, because rdctl and eret are supervisor 
insns.  This code appears to be mirroring the kernel code in which it is trying to get the 
right bits ready for the context switch to user-mode.  For qemu, we've done that for 
user-only during reset, and with proper symbolic constants, so no need to do it again here.)

I could just remove the two mentions of estatus in init_thread and copy_regs, if that 
seems better.  Leave the target_pt_regs cleanup to a larger patch set touching them all.


r~

