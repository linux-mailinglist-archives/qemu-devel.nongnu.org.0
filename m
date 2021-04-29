Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5C36EEFF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:36:17 +0200 (CEST)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcAaG-0001MS-6G
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcAMZ-0006SK-3I
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:22:07 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcAMW-0005cC-65
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:22:06 -0400
Received: by mail-pg1-x536.google.com with SMTP id j189so613831pgd.13
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lW6KqUpej8K1nALFzlVn8eo+XDnHNGzH3ji31v5X7H4=;
 b=lPZ/aF0GmUz0t1edlWs74s48vzEENIgmb7+HRQYK1Z2Abeq5K3TDRdBptSANF3yLnX
 c/mpQxRWRN9GCFx6EDF2XUyxq+yYhKvJBqXC/PJe03wPZa39tdOXyI8lBxLkKzVsyX4r
 cWwtpx7SoEQRBZy7tOHqT8F3MM5wZ/NWWzJrpRORaSAe4cvi+dUMaMZZIq/kxc9UORUN
 m/U28uayjP8RhnQRxHSsiSPy75wGDWeoKlNid/O9pfxOY2fVdk1WtapxrqD7SRgTEheu
 kxfu0p1KearpfGT7754YzjDkpPdOVD7Nfhhz9Tg6539ka7wIbLhKN5nG1JG3N2R6Cp07
 cIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lW6KqUpej8K1nALFzlVn8eo+XDnHNGzH3ji31v5X7H4=;
 b=Xt6T1mUY9//P6emy85/Bg30nE+PsCrxtWivcwCEx1oCe+yAw98EM3/E4YucYaQB9Jd
 TxhDGpdIstLPmemFSaiPK5tHzulhhW6le00CjNU3kqoyD0czdgS23y3XDYwUC9z9UkQ2
 FXT1TnR9vowIm52exXKh+g3ICThtXeGtbUyYDB6ugf93YmEzj99frDyS5KNBPSNzNQC5
 DtYq8bhZuzdkq8BkDUezVpsgM83ELH918eUgxXp94kq1bsBcbqMgNq7tlDTltqHWrMTn
 E8+mubANc9ILrjL+1p4yReBOaOwdh2WziA498LWNZ+7FEvxV/FI33Wkr4zPzZqMVsm5K
 v1yg==
X-Gm-Message-State: AOAM531qoZLSoFlIJrb0s68tzADZNFx45kPGCmuvkElhT6Z9D0DsgBbL
 sgCvL7ShEvaEVn3EmDwLIr9K6A==
X-Google-Smtp-Source: ABdhPJytf+/uKE4bFrEQjuhl19C13xm3nS2pUUEitsBinFvKRhGTGqEh3c5phEVa44HWcajuTYbwiw==
X-Received: by 2002:a63:ff16:: with SMTP id k22mr769394pgi.148.1619716921937; 
 Thu, 29 Apr 2021 10:22:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n18sm8092159pjo.19.2021.04.29.10.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 10:22:01 -0700 (PDT)
Subject: Re: [PATCH v2 04/15] target/ppc: Move DISAS_NORETURN setting into
 gen_exception*
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
 <20210427171649.364699-5-luis.pires@eldorado.org.br>
 <905b2240-82b9-cdaf-922a-0d334a7288a7@linaro.org>
 <CP2PR80MB3668FC30589403AB99F1F66CDA5F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92e7200b-a4fd-7595-785d-dbdd24f37414@linaro.org>
Date: Thu, 29 Apr 2021 10:21:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668FC30589403AB99F1F66CDA5F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 10:07 AM, Luis Fernando Fujita Pires wrote:
>>> -static inline void gen_stop_exception(DisasContext *ctx)
>>> +static inline void gen_end_tb_exception(DisasContext *ctx, uint32_t
>>> +excp)
>>>    {
>>> -    gen_update_nip(ctx, ctx->base.pc_next);
>>> -    ctx->exception = POWERPC_EXCP_STOP;
>>> +    /* No need to update nip for SYNC/BRANCH, as execution flow will change
>> */
>>> +    if ((excp != POWERPC_EXCP_SYNC) &&
>>> +        (excp != POWERPC_EXCP_BRANCH))
>>> +    {
>>> +        gen_update_nip(ctx, ctx->base.pc_next);
>>> +    }
>>> +    ctx->exception = excp;
>>> +    ctx->base.is_jmp = DISAS_NORETURN;
>>>    }
>>
>> Hmm.  You didn't actually raise the exception, so you can't set
>> DISAS_NORETURN that way.  It looks like you should be using
>> gen_exception_nip().
> 
> This is reproducing the behavior that was implemented before the DISAS_NORETURN changes, that caused check-tcg to fail with an assertion otherwise.
> 
> IIUC, POWERPC_EXCP_{STOP,SYNC,BRANCH} are not really exceptions and, in these cases, ctx->exception is being used just to cause  ppc_tr_translate_insn() to end the translation block. If so, we should not be using ctx->exception for that, but I believe fixing that to not use ctx->exception belongs in a separate stand-alone patch.

Hum.  Well, you can set is_jmp = DISAS_TOO_MANY to force exit from the 
translation loop.

I believe a proper fix would be to turn all of these "fake" exceptions into 
DISAS_FOO constants, to be assigned to is_jmp. There are a bunch of 
DISAS_TARGET_N enumerators which should be renamed like in target/arm/translate.h:

#define DISAS_WFI       DISAS_TARGET_2
#define DISAS_SWI       DISAS_TARGET_3

etc.  Then most of the code that is special casing these constants should get 
moved to ppc_tr_tb_stop.


r~

