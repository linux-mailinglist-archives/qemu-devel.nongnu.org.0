Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8F033A23A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 02:45:54 +0100 (CET)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLFpJ-0002QA-64
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 20:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLFnj-0001ud-4Q
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 20:44:15 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:32773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLFnh-0000MU-8j
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 20:44:14 -0500
Received: by mail-qk1-x729.google.com with SMTP id l4so28448044qkl.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 17:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Ih2qh866CjWszDltKX/Pc4xvBhRriwcGqyXf+3lhqA=;
 b=t0q+JYE+wnRisA1CznKUULtM9QPzTYHfGtcubyJKw0P/NNTXVRDexCJLh2gQBtu8w5
 K91xcmqG6jE53kiRpu3tCb7N0LC96QkcAbvpeFFajd+q013HQm/0Cr/tY+wD/8sL8BLw
 8kJ8WuPsD/GRGaSSgq+z0WhF14pFB2hxJRm8lpygVHI0Vugn8XWB7A72GUliZZAum77I
 H4JPcoY7yjlJA9Uzm237ontP7Sh850V76TUOZHOEu5d3vrJbihqH2NUB4nIjMjafBPOM
 wDfrM+qXkn04o9Tdm8gj2iaADWwsZdncuDSYy9fXbgxOpVoKx8Nr9OWPudYI6D5yNSJK
 Gr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Ih2qh866CjWszDltKX/Pc4xvBhRriwcGqyXf+3lhqA=;
 b=UE9wr+/5EOqIXGE6xY8B5OVwHM30s1k6MfeouhKezUK0I9hAAEiXPfSGYHR97PfGL2
 yT7p+YGABD+Idh2rKO2x5NAOa2rbwVDclsoRbuWyBanLfGFj4AXJwM0paUBN9dW6Ugku
 /cP3i3aJvqt6B8lr4amr5gA7+gHKZmlWIo/5HJe/3qMPumW9HQyccASV2WCW9nYLnLa3
 /3ifRGU1mLbkK0Q+p1A8wfV9clvkY1iQAjzDbxC5YNzUac4Cb2s88kOL1H92ImikswhJ
 mn1OnCwUQN5ksm3Zq9vSyXEZnP9ckCEt2PLC0ujJAhflz/l4iYom04OfLiXvyp9Z337x
 Gcbg==
X-Gm-Message-State: AOAM531J7F9SQp9NgIkCdmMhyuoI8jNw+WwvRinPHixW3sNIui8iEb6i
 /Ka02e1JmcJaE3v7cforGU/oxw==
X-Google-Smtp-Source: ABdhPJwnKdkXJCCpaObTV585rX+yyOG0SGjqtHknM0st0zEV438baJkpEH0PrDMEAdym6oM+cenctQ==
X-Received: by 2002:a05:620a:22f5:: with SMTP id
 p21mr19068523qki.225.1615686252011; 
 Sat, 13 Mar 2021 17:44:12 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k7sm6819496qtm.10.2021.03.13.17.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 17:44:11 -0800 (PST)
Subject: Re: [PATCH v8 29/35] Hexagon (target/hexagon) translation
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-30-git-send-email-tsimpson@quicinc.com>
 <152e99c9-675a-1fc8-c44c-e80d5af8ce70@linaro.org>
 <BYAPR02MB4886C193F014511DDCCDC7EADE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <889ed981-29e6-357d-48ae-6d3bb8f63ff3@linaro.org>
Date: Sat, 13 Mar 2021 19:44:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886C193F014511DDCCDC7EADE6D9@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 6:40 PM, Taylor Simpson wrote:
> 
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Sunday, February 14, 2021 7:04 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: philmd@redhat.com; alex.bennee@linaro.org; laurent@vivier.eu;
>> ale@rev.ng; Brian Cain <bcain@quicinc.com>
>> Subject: Re: [PATCH v8 29/35] Hexagon (target/hexagon) translation
>>
>> On 2/7/21 9:46 PM, Taylor Simpson wrote:
>>> +static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)
>>
>> Drop the inline markup throughout.
> 
> I can go through the code and remove unnecessary inline's.  However, these particular inline's are needed because this is a header file.  If we remove the inline and the header gets included in a .c file that doesn't use the function, we get a "defined but not used" error.  Also, we need to keep the inline's in genptr.c to avoid the same error when we switch an instruction between the fGEN_TCG and helper implementations (and the idef-parser in the future).  Also, there is one function that needs to be inline for performance reasons.  I'll add a comment for that one.
> 
>>> +        words[nwords] = cpu_ldl_code(env,
>>> +                                ctx->base.pc_next + nwords * sizeof(uint32_t));
>>
>> translate_ldl, so that a plugin has access to the packet data.  (Note that
>> pkt_crosses_page is fine, because that's read-ahead, not reads for the
>> current
>> packet.)
> 
> OK
> 
>>
>> Fold this to a simple function call:
>>
>> static void gen_check_store_width(...)
>> {
>>      if (HEX_DEBUG) {
>>         ....
>>      }
>> }
> 
> OK
> 
>>> +#if HEX_DEBUG
>>> +        /* When debugging, only put one packet per TB */
>>> +        ctx->base.is_jmp = DISAS_TOO_MANY;
>>> +#endif
>>
>> Why?  You can always add -singlestep to the command-line.
> 
> OK
> 
>>> +    case DISAS_NORETURN:
>>> +        gen_exec_counters(ctx);
>>> +        tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], hex_next_PC);
>>> +        if (ctx->base.singlestep_enabled) {
>>> +            gen_exception_debug();
>>> +        } else {
>>> +            tcg_gen_exit_tb(NULL, 0);
>>> +        }
>>
>> DISAS_NORETURN says that we have *already* exited the TB.  None of the
>> code you
>> emit here will be reachable.
> 
> Isn't this called before the TB ends?

Yes, but DISAS_NORETURN still means we've already exited.

Just like calling abort() in C means that we won't reach any following return 
statement.


r~

