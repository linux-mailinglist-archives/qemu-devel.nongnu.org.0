Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F310244469E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:06:23 +0100 (CET)
Received: from localhost ([::1]:47912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJiR-0002fQ-3R
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miJgH-0000oH-JC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:04:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miJgF-0003HO-Km
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:04:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id u18so4624423wrg.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xKbA0h3Rh+qHXGrMab/54lMZHmlMZemLxeouvLNp5M4=;
 b=T95iuPYaN4EmWd6/x1k+a5lo8hNwXu8aZUGb8XIZkrffe0MiqI49hKGRadweXyUXVn
 6ttPs7t3e0/CdJxAe+V8jHhkN12UJFTOYLAa1GucCkPx0qmOg3L1YUcXSixMMm8w/efW
 rk/cWoaWqQsqE58AB4nLYDrUsV4CMhO4HSjJHaaWYnpCGalnJsWFU26yQgTUhxUoCW15
 Zm8if9ZzBeyF2cyR79PQOqpjR2l/E38VOEBJuJlCbjeGR11C1DS9DMLKGhjqejuK0k0p
 YB4y4ANsQLwlw8c2BZELJHhzX1qfAx2zJ5A667TIHbuPdX++6B6Gp9NIAoU+c+Ini6fL
 58dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xKbA0h3Rh+qHXGrMab/54lMZHmlMZemLxeouvLNp5M4=;
 b=vHuRTj3UbjbpCRLh9pTqkppC7QQx3TRN5quEopbSN97rpnPD3p1C9FhP1uUav6Gpyd
 tevH61eJqJf5nzJkPSaS2MetOtE0w7sNQ9Bo6mSWsGTfnIObaVht84sqVxjjAnRhpWfu
 AZZwzGhGBDeXQ6l0TZVsSbXQ+2uORppAIzFk7lZfFDGcWAXLlI/8geU31v62CchFKLus
 iHrfOm3+bozXjY7aQja6TOSHTvn3IL+k7akiUQHJ6DJYMWdJzXI4mhMJZZbE6YioRK+W
 yB+zuLaE4O9LfZ+wkBNGlwbcDUxsoxnjI7tagbeQtS8xSi4p7XtcVmhdVxHekKC7whds
 1Trw==
X-Gm-Message-State: AOAM530MLFJrI78hMF7WpZB2AOo1Wz01FS8oMRfMQ0FqxE3vbiIY42CY
 CDMsQvF8q9R49wtjbn8HA2Y=
X-Google-Smtp-Source: ABdhPJyQQRHY20g3ZfglZ3A4T1sI89TjrTPUolXA2V9nT/HO0Z6zaV+4o7jkmWf+rxLCiUx3v+UmcA==
X-Received: by 2002:adf:fed0:: with SMTP id q16mr52251055wrs.276.1635959046050; 
 Wed, 03 Nov 2021 10:04:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u20sm840968wmq.6.2021.11.03.10.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 10:04:05 -0700 (PDT)
Message-ID: <598d246a-efe9-9673-9275-3cdee7184ae0@amsat.org>
Date: Wed, 3 Nov 2021 18:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 16/23] target/mips: Extract trap code into
 env->error_code
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211103140847.454070-1-richard.henderson@linaro.org>
 <20211103140847.454070-17-richard.henderson@linaro.org>
 <13397f73-9594-d363-e7ab-860477a832b7@amsat.org>
 <d6d8504d-8bfd-bcdb-9912-65ffdb052c25@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <d6d8504d-8bfd-bcdb-9912-65ffdb052c25@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 16:46, Richard Henderson wrote:
> On 11/3/21 11:21 AM, Philippe Mathieu-Daudé wrote:
>>>       do_trap:
>>> -        gen_trap(ctx, mips32_op, rs, rt, -1);
>>> +        gen_trap(ctx, mips32_op, rs, rt, -1, extract32(ctx->opcode,
>>> 12, 4));
>>>           break;
>>>   #ifndef CONFIG_USER_ONLY
>>>       case MFC0:
>>> @@ -2439,7 +2439,7 @@ static void decode_micromips32_opc(CPUMIPSState
>>> *env, DisasContext *ctx)
>>>               check_insn_opc_removed(ctx, ISA_MIPS_R6);
>>>               mips32_op = OPC_TEQI;
>>>           do_trapi:
>>> -            gen_trap(ctx, mips32_op, rs, -1, imm);
>>> +            gen_trap(ctx, mips32_op, rs, -1, imm, 0);
>>
>> IIUC the microMIPS manual (MD00594):
>>
>>                 gen_trap(ctx, mips32_op, rs, -1, imm,
>>                          extract32(ctx->opcode, 12, 4));
> 
> No, there is no code for trap-immediate.
> You can see the 12:4 code above for trap-register.
> 
> See the 3.05 revision of the manual, which still contains TEQI.  Note
> that all trap-immediate opcodes were removed for R6.

Oops indeed (checked 3.05 and 5.04).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

