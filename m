Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AE410CE3
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:27:36 +0200 (CEST)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1XL-0000vZ-2s
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Ud-0007fZ-GY
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:24:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Ub-00055N-Uu
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:24:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id w17so16446391wrv.10
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=uQL8H99mgMjSwJjEZ9FvX5pjfDWI+xWCphu5kekwKz0=;
 b=Rl0f/hltHpWWK8LjfMXrUmFt5nQdpxh4q/ukMAv9JXvIL5HemVSaYjQNxVLnsODLgJ
 FhePN6u1f5O27nBvmBwquNuScZA5QB/M1MY0n/jZkTIRVcVkZmAk6x/t8L/E0KAKuC09
 5wezS1UzaTviN0oSPw8h1BODm1I613ZCtLpEu/kRjBHsUTIfDgda7gI97z73p8AMiopc
 FYznXGJ3HDlR8kZ/5lM2xH4qO2g86G2nCleLU5+wuFKClR8/sX7/tpsxM2LNDODtjQie
 Si2eohENQZCGHcwSYKCtEWESkJD/ZW+vbMCPdI1vqkx4brwq/JNdUC6RIFpdo9xwnbfX
 Af1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=uQL8H99mgMjSwJjEZ9FvX5pjfDWI+xWCphu5kekwKz0=;
 b=dAdgRDxc5XvYRY3UYoSB6J5MXarWo4qhYzf0Bqx/NAnjdrWvoSUIvGLkOeeSDRMmA9
 i8vm+zwCEZSbkXWoNaM1vAKYOIm+zR5mhJSqJtQsYpEhIAuhqzvZfNM68Z1fqaBzv53F
 gh2flU0ZfrBRXup2Oano3AIWTOHACNT7lgWMXQM+TSDYB8M65ZXot7ZXzfjErMtXwXlC
 S79pNek3B2JGwkUFo1iu8hWanSslESzfrLtYU0KiE651ZXh8sknqb5NvooOKwUwQ8wwl
 z0OTXZ3c3OuaFkUQ5iOID/W8rc39eBS6Ceb7f+QNSAYBo5rTsmNJJv9EhhyzdSurZ9o1
 Yj8g==
X-Gm-Message-State: AOAM531oOa8kj2JMJLj72c9dJakRGogrzC5o0boiMmoSHW3jo/CIAxpJ
 F6AhDHjMFmzHOFZXpFABlbA=
X-Google-Smtp-Source: ABdhPJylK5Aw+i2M5V+rV/9honb85byFAJ99tLSlvrIdSSdl33gDAzpOY7D7NnwBswEVpIePOYwtYw==
X-Received: by 2002:a05:6000:11c6:: with SMTP id
 i6mr23758502wrx.177.1632075884411; 
 Sun, 19 Sep 2021 11:24:44 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id q7sm13439594wru.56.2021.09.19.11.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:24:43 -0700 (PDT)
Message-ID: <e35c8e44-0b5d-a862-71a5-551fa9fb4985@amsat.org>
Date: Sun, 19 Sep 2021 20:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 19/41] hw/core: Add TCGCPUOps.record_sigsegv
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-20-richard.henderson@linaro.org>
 <95b28dff-7a3c-73fa-2449-c41110e12642@amsat.org>
In-Reply-To: <95b28dff-7a3c-73fa-2449-c41110e12642@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/21 20:22, Philippe Mathieu-Daudé wrote:
> On 9/18/21 20:45, Richard Henderson wrote:
>> Add a new user-only interface for updating cpu state before
>> raising a signal.  This will replace tlb_fill for user-only
>> and should result in less boilerplate for each guest.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/hw/core/tcg-cpu-ops.h | 26 ++++++++++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>
>> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
>> index 4a4c4053e3..e229a40772 100644
>> --- a/include/hw/core/tcg-cpu-ops.h
>> +++ b/include/hw/core/tcg-cpu-ops.h
>> @@ -114,6 +114,32 @@ struct TCGCPUOps {
>>       */
>>      bool (*io_recompile_replay_branch)(CPUState *cpu,
>>                                         const TranslationBlock *tb);
>> +#else
>> +    /**
>> +     * record_sigsegv:
>> +     * @cpu: cpu context
>> +     * @addr: faulting guest address
>> +     * @access_type: access was read/write/execute
>> +     * @maperr: true for invalid page, false for permission fault
>> +     * @ra: host pc for unwinding
>> +     *
>> +     * We are about to raise SIGSEGV with si_code set for @maperr,
>> +     * and si_addr set for @addr.  Record anything further needed
>> +     * for the signal ucontext_t.
>> +     *
>> +     * If the emulated kernel does not provide anything to the signal
>> +     * handler with anything besides the user context registers, and
>> +     * the siginfo_t, then this hook need do nothing and may be omitted.
>> +     * Otherwise, record the data and return; the caller will raise
>> +     * the signal, unwind the cpu state, and return to the main loop.
>> +     *
>> +     * If it is simpler to re-use the sysemu tlb_fill code, @ra is provided
>> +     * so that a "normal" cpu exception can be raised.  In this case,
>> +     * the signal must be raised by the architecture cpu_loop.
>> +     */
> 
> Shouldn't it have the QEMU_NORETURN attribute?

Eh now I saw the next patch and understood raise_sigsegv() is
where QEMU_NORETURN belong :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
>> +    void (*record_sigsegv)(CPUState *cpu, vaddr addr,
>> +                           MMUAccessType access_type,
>> +                           bool maperr, uintptr_t ra);
>>  #endif /* CONFIG_SOFTMMU */
>>  #endif /* NEED_CPU_H */
>>  
>>
> 
> 

