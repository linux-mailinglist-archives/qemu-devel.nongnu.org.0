Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45521589EAB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:28:48 +0200 (CEST)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcmE-0005Qe-6R
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJcl3-0003rm-Ak
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:27:33 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJcl1-0007pl-Ow
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:27:32 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso5640773pjo.1
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 08:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vp0gM+JncPmZ3v1a6Ed/oqe9zRRABLYjRHUQUYUJ398=;
 b=RS1QDt0aGl/Ddqja+FtAur1FYeymiS3udf2HfSO3nWKrdzTAMaqIc3FBE+QLRRYKOf
 SLd1N1kv3DR81nlx/QwxxL7D/OX3WGkpbXEZcao6lmy9ZFS+WPc+r/Bat5ublxzZtWSa
 Qr+gT09vusl5bdvRK4vOwN9+nUtKO+jkLHNM1PGFg9ifPfUymLT/hU+uitXsB9aEJ88G
 UkFB+wuYXE+1v3GDKLK956DotAg0y0baa6E1+jsH2rIgl2omeT8rXtKqa06X1UHJcW9y
 B2WX5URBpELJinKos1uXdbnk4dHgYlDZZkpElSYdre7yNK9hqpyxWGOyfahOHY+kCmY8
 OI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vp0gM+JncPmZ3v1a6Ed/oqe9zRRABLYjRHUQUYUJ398=;
 b=PUUlIc0gF28JJnkydCDnu1c2pdvDS7RMt2FiFoybMrsRHYoJLmjNK+PWl78rTSHaKV
 DY67bqZMzvrSOAqI18dTjiV8wBpJSJxV1V/r5E8AXXpBBE3swfa7Q89wDJd3VAMAefal
 dhbdtAIeWl0M0iMwgROSrKesxglQzvIBoaKVz0RyCXTw/lh85UApYFYSWjTYn8303eRy
 A9bxifiUCPDJcSh5Tv+iqFnwu5YlkmWpuPgszUzeOwl4W49LR1ezmRcyaAq/oWKqcj7K
 915cquUArA/szLQn/JqfYDfbS6ud7Agffo6MuXh7Ilpbp9KTfEFiRIN6CpNBjHX3zkGT
 ai6g==
X-Gm-Message-State: ACgBeo3Hvd2fQWBF6MWzIued5wh6F0C0salPHAf0AlbBmBXeINFMIWdj
 oJr9kCLQpWtr+Qf7KSIkSy1i4A==
X-Google-Smtp-Source: AA6agR68ef0eCzJVudj+GdJmJC9jV4X2z51eOJZmz9u1YVrtHBTM2ELUbtNED9P+ZvQEfiQyKXVAlA==
X-Received: by 2002:a17:90b:388d:b0:1f5:40d4:828a with SMTP id
 mu13-20020a17090b388d00b001f540d4828amr2669415pjb.56.1659626849711; 
 Thu, 04 Aug 2022 08:27:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:c349:7b49:2925:a0a?
 ([2602:ae:154e:e201:c349:7b49:2925:a0a])
 by smtp.gmail.com with ESMTPSA id
 x17-20020aa79571000000b0052dc9d8574dsm1117081pfq.128.2022.08.04.08.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 08:27:29 -0700 (PDT)
Message-ID: <ae5f83e3-e005-cd0e-0978-029ee0fbc45e@linaro.org>
Date: Thu, 4 Aug 2022 08:27:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/net/rocker: Avoid undefined shifts with more than 31
 ports
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
References: <20220729155932.2477385-1-peter.maydell@linaro.org>
 <CAFEAcA9rpCNrO33tiTUZw_BzVt77_5q_CKp_yBf3prw5C+bAxg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9rpCNrO33tiTUZw_BzVt77_5q_CKp_yBf3prw5C+bAxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/4/22 03:45, Peter Maydell wrote:
> Ping?
> 
> thanks
> -- PMM
> 
> On Fri, 29 Jul 2022 at 16:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> In rocker_port_phys_link_status() and rocker_port_phys_enable_read()
>> we construct a 64-bit value with one bit per front-panel port.
>> However we accidentally do the shift as 32-bit arithmetic, which
>> means that if there are more than 31 front-panel ports this is
>> undefined behaviour.
>>
>> Fix the problem by ensuring we use 64-bit arithmetic for the whole
>> calculation. (We won't ever shift off the 64-bit value because
>> ROCKER_FP_PORTS_MAX is 62.)
>>
>> Resolves: Coverity CID 1487121, 1487160
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>> ---
>>   hw/net/rocker/rocker.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
>> index 31f2340fb91..d8f3f16fe87 100644
>> --- a/hw/net/rocker/rocker.c
>> +++ b/hw/net/rocker/rocker.c
>> @@ -1010,7 +1010,7 @@ static uint64_t rocker_port_phys_link_status(Rocker *r)
>>           FpPort *port = r->fp_port[i];
>>
>>           if (fp_port_get_link_up(port)) {
>> -            status |= 1 << (i + 1);
>> +            status |= 1ULL << (i + 1);
>>           }
>>       }
>>       return status;
>> @@ -1025,7 +1025,7 @@ static uint64_t rocker_port_phys_enable_read(Rocker *r)
>>           FpPort *port = r->fp_port[i];
>>
>>           if (fp_port_enabled(port)) {
>> -            ret |= 1 << (i + 1);
>> +            ret |= 1ULL << (i + 1);
>>           }
>>       }
>>       return ret;
> 


