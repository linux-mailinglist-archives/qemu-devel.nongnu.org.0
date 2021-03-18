Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44D3406E2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:32:25 +0100 (CET)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMslE-0002F1-A9
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMsjS-0001ef-2K
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:30:34 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMsjM-0003jT-6s
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:30:33 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id x16so3162142qvk.3
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7vgyiJVqlMIKO3ILylQtDjbWI90SN3kO7l9Wi+21SXM=;
 b=v8dJ1PwcK23BHoepZQIpcj35FLu+dLf9r8hrIitlx1do8Zm9UBVdO6WoBDfAiPwJJR
 eDunLFRi+H3psV5S1AzcPggh0nZEU+h21U1Dfu6snFUosDrJ1koVqIOSYXoN5RLG811l
 gnPjPqCZg69PuTjzyJT01p18z5WemVGPron7U0S9psn8LR/1BZT4vpGSNUqq5zTCz0vp
 vdSiBk+OmKFIhBjrOOlnh4qKzYcxZ39pTj10+VhFxo3szrZCKSyt/3HZuKiEVvIhpw6q
 mVRscgZ0YfGyH3TytipENURlUSLQmrEDxlYOdFKoKNXibV5MmBZk7dGc0ZDC09689Lij
 ooWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7vgyiJVqlMIKO3ILylQtDjbWI90SN3kO7l9Wi+21SXM=;
 b=Sheeu8x8xHtYWuDAlrXiqUawerRfacUBbnTjeh7CD5BIZsn0+wTPT18U49pklIjD2j
 LpKkWc5JXCqwoQGkLol7p3yoTbTIGEYjrf2H1JgTtO7BcY6vaHmsITy3YlpVsDo7cbkS
 2lKaNdjDkzmrnOUcxd1lU5qoexi/4cb5gI8wZfUSp8VjbhzBR2nGoB1MjgvBwGLuRQSs
 Y4zl3eEKrvPfVB70Lcuqq0GKqzPFp6ahLxkwAj8x3PLSYXDwzImsAxT61zGt34hREEn+
 scaYI9F2ZcfiBuFOFjFOcaa1zVxzvEuPSMag/Rx0kSOlQC5cZW/KuQxKsFKFiaeZClxT
 Es0A==
X-Gm-Message-State: AOAM532gJPD+kCO9c1aMRF19ri/d/HWeVZpbpynGENrPaxsnJUHcKE34
 Dr9B+fta48mfW1OqNMevDCs0Gg==
X-Google-Smtp-Source: ABdhPJwpm4nCzbryR6xsdbqkckydQo1HVSNlVySrPBmzPHj3RlV96OPVDy4cy7WgPzpkJNzl/7HFXw==
X-Received: by 2002:a0c:d7d2:: with SMTP id g18mr4158488qvj.42.1616074226936; 
 Thu, 18 Mar 2021 06:30:26 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id p186sm1782751qka.66.2021.03.18.06.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 06:30:26 -0700 (PDT)
Subject: Re: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
 <f0ff8663-9ea2-e8be-9123-4afffc41bad2@linaro.org>
 <BYAPR02MB4886A70EA367526D5834F501DE699@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75d9fed2-ac04-846b-1426-6cd9fe657924@linaro.org>
Date: Thu, 18 Mar 2021 07:30:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886A70EA367526D5834F501DE699@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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

On 3/17/21 9:57 PM, Taylor Simpson wrote:
> 
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Sunday, February 14, 2021 2:57 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: philmd@redhat.com; alex.bennee@linaro.org; laurent@vivier.eu;
>> ale@rev.ng; Brian Cain <bcain@quicinc.com>
>> Subject: Re: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch])
>> utility functions
>>
>> On 2/7/21 9:46 PM, Taylor Simpson wrote:
>>> +uint64_t conv_sf_to_8u(float32 in, float_status *fp_status);
>>> +uint32_t conv_sf_to_4u(float32 in, float_status *fp_status);
>>> +int64_t conv_sf_to_8s(float32 in, float_status *fp_status);
>>> +int32_t conv_sf_to_4s(float32 in, float_status *fp_status);
>>> +
>>> +uint64_t conv_df_to_8u(float64 in, float_status *fp_status);
>>> +uint32_t conv_df_to_4u(float64 in, float_status *fp_status);
>>> +int64_t conv_df_to_8s(float64 in, float_status *fp_status);
>>> +int32_t conv_df_to_4s(float64 in, float_status *fp_status);
>>
>> You need to either use the normal float conversion routines, or document
>> what the differences are.
> 
> There are some differences in floating point flags raised, so I could write something like this:
>      if (float32_is_infinity(RsV)) {
>          float_raise(float_flag_invalid, &env->fp_status);
>          if (float32_is_neg(RsV)) {
>              RddV = 0ULL;
>          } else {
>              RddV = ~0ULL;
>          }

This isn't different from softfloat.c.

>      } else if (float32_is_any_nan(RsV)) {
>          float_raise(float_flag_invalid, &env->fp_status);
>          RddV = ~0ULL;

Nor is this.

>      } else if (float32_is_zero(RsV)) {
>          RddV = 0;

Not exactly a special case.

>      } else if (float32_is_neg(RsV)) {
>          float_raise(float_flag_invalid, &env->fp_status);
>          RddV = 0;

Not different.

>      } else {
>          RddV = float32_to_uint64_round_to_zero(RsV, &env->fp_status);
>      }
> 
> Does that work?

This is 100% identical with round_to_uint_and_pack as used by 
float32_to_uint64_round_to_zero.  It's all straight IEEE 754.


r~

