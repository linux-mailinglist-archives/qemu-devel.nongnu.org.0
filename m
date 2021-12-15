Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DC475918
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 13:50:35 +0100 (CET)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxTjr-0000zf-J0
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 07:50:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxTbm-0004Jv-Tb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:42:11 -0500
Received: from [2a00:1450:4864:20::330] (port=53950
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxTbl-0005kg-4G
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 07:42:10 -0500
Received: by mail-wm1-x330.google.com with SMTP id y196so16472466wmc.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 04:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BNOpfP6oc2VmPxdMWU6r7ZOkBLpQbHAOBMcyYVFgGE4=;
 b=Z7krnj2hk7mvWo/gb50LqEhJrYvX82YKTps2ri67ykTeoRefLUhQZvE0LzvvHGjLwj
 8wC5sYFJmT4q1uspRgzXR1ZDid5bVqs8RDAU64uCbdXdUZNGpvfWk3z9/fjdk40WcFH0
 hO6hOcuAD6Yf0YzXCdQRUzihDZpk2VOrv/nhEYktDMvVwPoVvojjv4f9Mk1bG0JKT5l+
 o24VqvZu8lnVUqC7Rkq49U53wguXI/cp38QmzsmMfzCBxpgeFwFqFsOVh6HdQBwdWSDv
 Ud0+7ahtP3ER7482q1JsuvBfuDo1e3aail5eU8TKZO7EuKwXZwK/vb1M7g/V4QOpYsAB
 w0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BNOpfP6oc2VmPxdMWU6r7ZOkBLpQbHAOBMcyYVFgGE4=;
 b=yVT7r6/dcwPNS3sP+ISPGBO4+BW1he2KGrDfWn+paAfqMZXu9cMo2NpnC5WeqV7HV/
 MXCScKLf+Ny2BciTPe16SxGoRaMIyIFhNNgtMQhpdHuhQM5z3nCoCQA7xL7wG1gaonTq
 KHexeCRE2nzxX2FJSueadsTCZdWMOmfktKJNF5ZSLmN5qg0jFI7ZqCUjgRJuFhEVcehW
 HPJH/v2r/fZ8A4U0uRYt7GavtaspePk9qCOZoAa//dmsM2hlEjow3KvcrwL63XjZJbbx
 0YWxS1hTlP/njBm/1qj7HZxDIF1BOSH2i2coaXJ/wutz68WauTCnyUXAkz8b1YZNC8Yr
 1a6Q==
X-Gm-Message-State: AOAM530q4+rmKZfFRVmRH8GBpHOaxb23bjU9dXqn6gJKPIxtoTi1fJOQ
 7LkmNZCJBtgA69VzjyBndBA=
X-Google-Smtp-Source: ABdhPJxSF3xPOFRLtyLtaIXZKkGgRWUu/Z7Gb9gCpIYCUhfetbb6Nh3SHfZ2ypDrAqeaidDiAyTtXA==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr4452878wma.78.1639572125469;
 Wed, 15 Dec 2021 04:42:05 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id bd8sm827938wmb.44.2021.12.15.04.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 04:42:04 -0800 (PST)
Message-ID: <dd5c47f4-1d04-9d44-8d07-bf6880ac46f9@amsat.org>
Date: Wed, 15 Dec 2021 13:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 04/13] target/rx: TCG helpers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200317163616.30027-1-f4bug@amsat.org>
 <20200317163616.30027-5-f4bug@amsat.org>
 <CAFEAcA_nY2yF=rCPnjQ3B+hHf5y5Dae8Yg2Tgj6Tub61P4YXiA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA_nY2yF=rCPnjQ3B+hHf5y5Dae8Yg2Tgj6Tub61P4YXiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 17:04, Peter Maydell wrote:
> On Tue, 17 Mar 2020 at 16:43, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> From: Yoshinori Sato <ysato@users.sourceforge.jp>
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> [PMD: Removed tlb_fill, extracted from patch of Yoshinori Sato
>>  'Convert to CPUClass::tlb_fill']
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Message-Id: <20200224141923.82118-6-ysato@users.sourceforge.jp>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Somewhat late, but I've just noticed a bug in the helper_set_fpsw()
> function introduced in this patch. The function has changed a little
> since but the bug is still there in the version in git:
> 
>> +void helper_set_fpsw(CPURXState *env, uint32_t val)
>> +{
>> +    static const int roundmode[] = {
>> +        float_round_nearest_even,
>> +        float_round_to_zero,
>> +        float_round_up,
>> +        float_round_down,
>> +    };
>> +    uint32_t fpsw = env->fpsw;
>> +    fpsw |= 0x7fffff03;
>> +    val &= ~0x80000000;
>> +    fpsw &= val;
>> +    FIELD_DP32(fpsw, FPSW, FS, FIELD_EX32(fpsw, FPSW, FLAGS) != 0);
> 
> FIELD_DP32() does not update its first argument, it merely reads
> it. It returns the new value with the field change applied, so

I tried adding __attribute__((warn_unused_result)) to depositXX()
but it doesn't trigger, apparently due to how FIELD_DP32() macro
is written.

> you need to use it like this:
> 
>     fpsw = FIELD_DP32(fpsw, ....);
> 
> Would somebody like to write a patch ?

Will do, thanks for the report.

> (I noticed this because I just made the same mistake in some new
> code I was writing, so I did a quick grep of the codebase to see
> if there were any instances of it already present. I think the macro
> magic used in the definitions of FIELD_DP* to provide a compile error
> if you pass a value that's bigger than the target field has the
> unfortunate side effect of suppressing the compiler warning that the
> whole statement has no effect.)
> 
> thanks
> -- PMM
> 


