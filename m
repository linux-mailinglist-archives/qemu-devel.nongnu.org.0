Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29EB60D0FD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:51:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMBF-0005cb-TN; Tue, 25 Oct 2022 11:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onMB9-0004D6-Ro
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:49:26 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onMB5-0001Ml-MO
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:49:23 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q1so11834171pgl.11
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NCAHwjN+Na7hlmnxZ5cQmZAp6wvGLcAhmlLLEUfPUCk=;
 b=K+ekZ+zlj6bd4ACtCQOJDjbQ7QITED7U28D4dRa7AcgiS7oNxbBw0guWowvJSiNiQg
 UytYzVDnxlLi++4MoWAJ7h/BsiabtM1YwVJkX9vxhaLUVadAIOTSgWfdIwuzfI/gwT+C
 e1yx5Ax1GcusRdiqInBh2vVYlBk1MdtiIdDgToJUYhVnw1D5pmS35RkY1EoGyJzNnU9n
 GZNLe3SgBmrpWldCUllRDnSI8ldWW3ZPwkqFp8H9kD63MIiHqlrPfcNSU6F/E+Ljnm8w
 FfFvDESGh7bMUFAHIXty1MW4TbNbKiOHVNugKyuQgacP/l07s6tesEKUhCmM1/JO/6yc
 epaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NCAHwjN+Na7hlmnxZ5cQmZAp6wvGLcAhmlLLEUfPUCk=;
 b=E7Lo8Ez2YVvBasXztt62msFYclTlT4mUoRmjFmeHthGsrzhHYHjwsDsxSngrpz2NvC
 A6MX+93Y9vORggtQJ9OCv64EKzLilqedAlMeAEsaQbUyNOA8QAaT2M+bIJwauT/uQdf/
 F9N+ijHNx52uyQ634SdjPLcPaIz6syct+uGlcbCqG2frU5UmpaOJLKRPVBlmOqo/ItnG
 3T3d1EQcYtrF5mA6uAN6gayy5+hLMlP+BPfC/aIRDR/iAq3sOVtTqA6aZWkXvqg5YKGI
 Ul5Q3Of2TQ1dxpt3iObUdxY8hR3iqyvR1U2EfET4CB4uWCtUgNjziXzc9zqjwbN84Nmf
 Pw4w==
X-Gm-Message-State: ACrzQf3AghPR4VI0mbHv2zqpUpuQWR4VNqziQYAmihWlBzt4fLb+yYrX
 x24H8XMf90HG2hiac6UoWnv6LQ==
X-Google-Smtp-Source: AMsMyM7FcIWqifzZBbYJ0NDZKnv0Ywi10JrfHIzMurSmUYIauIq2YDbBmJmLG97reJfXlwAJD7An+g==
X-Received: by 2002:a63:570d:0:b0:44e:3268:6cf5 with SMTP id
 l13-20020a63570d000000b0044e32686cf5mr32323527pgb.346.1666712957118; 
 Tue, 25 Oct 2022 08:49:17 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a170902ec8700b001755e4278a6sm1363960plg.261.2022.10.25.08.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 08:49:16 -0700 (PDT)
Message-ID: <3294a3c4-0add-2d2a-218e-26608d471d54@linaro.org>
Date: Wed, 26 Oct 2022 01:49:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 26/29] target/openrisc: Always exit after mtspr npc
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-28-richard.henderson@linaro.org>
 <ed0d9440-2b33-e6cf-1e07-e5bf9c5cd13b@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ed0d9440-2b33-e6cf-1e07-e5bf9c5cd13b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 01:39, Philippe Mathieu-Daudé wrote:
> On 24/10/22 15:24, Richard Henderson wrote:
>> We have called cpu_restore_state asserting will_exit.
>> Do not go back on that promise.  This affects icount.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/openrisc/sys_helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
>> index 09b3c97d7c..a3508e421d 100644
>> --- a/target/openrisc/sys_helper.c
>> +++ b/target/openrisc/sys_helper.c
>> @@ -51,8 +51,8 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, 
>> target_ulong rb)
> 
> Extending the diff context from commit 24c328521b ("Tidy ppc/npc implementation"):
> 
>              cpu_restore_state(cs, GETPC(), true);
>              /* ??? Mirror or1ksim in not trashing delayed branch state
>                when "jumping" to the current instruction.  */
> 
>>           if (env->pc != rb) {
>>               env->pc = rb;
>>               env->dflag = 0;
>> -            cpu_loop_exit(cs);
>>           }
>> +        cpu_loop_exit(cs);
> 
> Is the comment still relevant?

Yes, in that when pc == rb we don't clear dflag.
The only change here is exiting to the main loop before starting the next insn.

r~

