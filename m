Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D5844C43F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 16:19:57 +0100 (CET)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkpOG-0004gm-Nm
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 10:19:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkpHd-0005IF-2o
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:13:05 -0500
Received: from [2a00:1450:4864:20::42f] (port=33411
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkpHb-0002M7-Do
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 10:13:04 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d24so4684873wra.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 07:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=+vZO97VS0HQoQA1kEbR1qtc0TRVa1FhgbgQ6VLxr/bc=;
 b=mbiI4Ys4JkPY0tcq1NFurJDeMwP0g3q3zKxx/oDiXfvqkWP/uRJQ2KOrAzheFmBRqO
 oeHfss5MyLfNjCny8+fIwbiueDi5lTK2NiKlg2tn/TgT/hvbCT2CFK2BTICoYLOXmbj6
 KvYBx3NCZ8UzY898RK0kE41FMgeJTZRTJBbMLHiQGm3pV8+/L2oSYzAMoGlLpPfPSF1f
 i08gZAV5chAyMtn3eQmNfu2w+HEn/pfT8TfWllyLB0K6luoiNicD73G7kvtf2ZD+7P2/
 8m+h6T4lntYVPjCMvgNOW21wpvwkU7jbMR+fcd8lAd22VUg1YSskDe5clccUDFC33498
 WutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+vZO97VS0HQoQA1kEbR1qtc0TRVa1FhgbgQ6VLxr/bc=;
 b=sKMxr2QSnLPl159n1HsZRrFmq29sta4+jGsJIMet04E/IjwxZCIn3GjE2SqksWbjz6
 TvYhBVjmnTIkKzy0wcdSrzCvvyeQ3JEISl34kjODX0gaCYp0iBvXfg4whEuh6iMfXyXt
 GWVKWzLUBDVeM7oKbaLbuPzCneR8WhIKinevw3lQQLg76MVbP/2WQc5JmE9cM8FORRsb
 I4/2JLikeioXcQMlZLYh12tQClv5BC77VWBaXXRAOgD2JC1ZtjHMqZpHvKiUurzItFdC
 kLuStbIS+tmeBIjwmQX8KrT/bObhP97OTrxAF2GWR9K4CXBp79g9qXQVo63/bfr7czxM
 ztLw==
X-Gm-Message-State: AOAM531us96GKzW8UmWh+aQ5ipYwfNftJaq9i/oykcOq7c310UYlxwAy
 boSbvPno7MmuGZK3xcShrqVXHbk9BunTpgaq
X-Google-Smtp-Source: ABdhPJzMKf4kN5amPnvulzmPooLQLKlok50e75jMWQiEF7jwW9mJxg7hBbslREf3U1VE/ToI2e3iNA==
X-Received: by 2002:a5d:4ecd:: with SMTP id s13mr546659wrv.400.1636557181139; 
 Wed, 10 Nov 2021 07:13:01 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id x1sm150141wru.40.2021.11.10.07.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 07:13:00 -0800 (PST)
Subject: Re: [PATCH] linux-user: Replace __u64 with uint64_t
From: Richard Henderson <richard.henderson@linaro.org>
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20211108194230.1836262-1-raj.khem@gmail.com>
 <0242a761-cd00-1a22-e64c-952befad9988@linaro.org>
Message-ID: <01900319-d1fc-b677-1f35-5ee2da5bc8a4@linaro.org>
Date: Wed, 10 Nov 2021 16:12:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0242a761-cd00-1a22-e64c-952befad9988@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/10/21 10:25 AM, Richard Henderson wrote:
> On 11/8/21 8:42 PM, Khem Raj wrote:
>> uint64_t is available in all userspaces via compiler include stdint.h
>> therefore use it instead of __u64 which is linux internal type, it fixes
>> build on some platforms eg. aarch64 systems using musl C library
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   linux-user/host/aarch64/hostdep.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
>> index a8d41a21ad..34d934f665 100644
>> --- a/linux-user/host/aarch64/hostdep.h
>> +++ b/linux-user/host/aarch64/hostdep.h
>> @@ -25,7 +25,7 @@ extern char safe_syscall_end[];
>>   static inline void rewind_if_in_safe_syscall(void *puc)
>>   {
>>       ucontext_t *uc = puc;
>> -    __u64 *pcreg = &uc->uc_mcontext.pc;
>> +    uint64_t *pcreg = &uc->uc_mcontext.pc;
>>       if (*pcreg > (uintptr_t)safe_syscall_start
>>           && *pcreg < (uintptr_t)safe_syscall_end) {
> 
> Queued to tcg-next, since that's where the original patch came from.

Dequeued.  We need something more, because on debian we now get:

../linux-user/host/aarch64/hostdep.h:28:23: error: initialization of 'uint64_t *' {aka 
'long unsigned int *'} from incompatible pointer type 'long long unsigned int *' 
[-Werror=incompatible-pointer-types]
      uint64_t *pcreg = &uc->uc_mcontext.pc;
                        ^
cc1: all warnings being treated as errors

Perhaps we need to use __typeof() to get the correct pointer type?  Oh for c++11 auto 
declarations... :-)


r~

