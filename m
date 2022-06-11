Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76CB547645
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 17:55:01 +0200 (CEST)
Received: from localhost ([::1]:56084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o03S0-0004jv-E5
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 11:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o03QS-00041i-HF
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 11:53:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o03QP-0005qC-PP
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 11:53:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so4945782pjo.0
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 08:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qLmppRFPnWYxMxRypUJ2VzzIUBtfEVzSmO1s1ZyeLos=;
 b=FNXKDZ7g/o4eFDryXL5ApPCQowUiwO2GcJAVmiw9I3IZmQ7Pe2bexJT8mgxUvwjgyH
 Wu7/kO4IDT2tPSSQ7bu2/EnUb79Pj6BJIXxWc9DSGDJ3as+eDw6egKeOfOQEVh79rfIR
 h2FNDhT/zNFrbsJm7rI3549z8ajWOb7BcsFQzDbNQChHRzGCfgWSAsLKk8SCx5TUDdh8
 pY0ZRwC1qVnycHHWlNPNLefvQNzSopxA4O1VI9h3EOKMre5a1QVomjm/i4tnGPFLrZxu
 erRcRTnpJsBTIxVdGDkLRzBszBj6cJ5vRCJF2SJcFX8J7kQMjNS1sYm3IsszAvXoVArv
 mmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qLmppRFPnWYxMxRypUJ2VzzIUBtfEVzSmO1s1ZyeLos=;
 b=cH9QCwp7OL7E0U977lEJDZ5la8igCBtykz9KLkqRodRZQrOt5VvIaZeHyPj8Keznrq
 RQvUce29kr2SclLk8iT4GIijeE8SFUxm69L7CF0WG+l7w6fnvhvilQepnOdRYIo9r3hO
 Z0v+0PQ6d4lVd2hAoIZP8YGHCEw27y1UQy1tbi9qUHq/Qz8YEGfX6A7AzTM1vhFm6E0R
 qSDBGQMd6LGYrrMzNItQg0MPa2bX6tg3h5CeUjLsBrChStOuFM1oRzgQas9nmbQWSB9X
 p6ltmfK5iJ3gue1IXr1LYHrQG3qXqoMO24B368cniIH/RBRfGfrHkqgQms5wEo0V3goY
 /Wnw==
X-Gm-Message-State: AOAM531uFCZ4y9d5i56Bgb4SulZJzsYWuE8P1pOY5H4yRop1Ic0DJY16
 9DmCjqRVzVLhRABj33nLz2DvkA==
X-Google-Smtp-Source: ABdhPJyFeTIckUyMp53V6stG/eWa3xq50XTmKz+HhT1Y7oRzUnk2C8aPXb5zsDKE5Jgb7L+5qE446w==
X-Received: by 2002:a17:90b:3b45:b0:1e8:8688:219d with SMTP id
 ot5-20020a17090b3b4500b001e88688219dmr5701380pjb.231.1654962800259; 
 Sat, 11 Jun 2022 08:53:20 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 c29-20020a63725d000000b003fd8438db7bsm1817507pgn.58.2022.06.11.08.53.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 08:53:19 -0700 (PDT)
Message-ID: <1fd59fa5-3da7-234f-fa23-eac6d79b8b76@linaro.org>
Date: Sat, 11 Jun 2022 08:53:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 03/11] target/mips: Create report_fault for semihosting
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220608051945.802339-1-richard.henderson@linaro.org>
 <20220608051945.802339-4-richard.henderson@linaro.org>
 <1cfdf6db-791b-1d4c-29ac-4248a917e273@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1cfdf6db-791b-1d4c-29ac-4248a917e273@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 6/10/22 08:05, Philippe Mathieu-Daudé wrote:
>> +static void report_fault(CPUMIPSState *env)
>> +{
>> +    int op = env->active_tc.gpr[25];
>> +    error_report("Fault during UHI operation %d", op);
>> +    abort();
> 
> This is a guest error, no need to debug QEMU internals...
> Can we simply exit(1) instead?

How does this debug qemu internals?
It exits with SIGABRT.

I suppose we could exit(1), but we'd want to change the other existing uses of abort too.


r~

