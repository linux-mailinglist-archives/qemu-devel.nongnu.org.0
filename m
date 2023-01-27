Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768067F267
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 00:50:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYTT-00059F-UM; Fri, 27 Jan 2023 18:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLYTO-00058l-86
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:49:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLYTG-0006Va-Tc
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 18:49:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso6464282wmn.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 15:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+n/SN5EfxXmoH+zSeJ91178FXdJfmCiZn8laQzSIas=;
 b=ORO0qJqqdvieuRU8HlMvVMEed6HRf1SvAE/NgkFkgJiPScmZxUaFC4sZrPjgOqWCG+
 spMRDEnnjHy2jf+4C2KWqy/WjqS4/BSiCkIuC2gWPpCFrufMZJ/UWTsZH/aVWvpJVJrA
 /67WpBRPo4iQqLMcYludVzrHZwbPi1IRSxYyiQ5IMvlfATZ4REaSU8A2FufEtX8tzOSD
 Ezt728Y+Po5SeSSljui6ib2eY9hhoJMj58Wsp+vuxBFLFMzgwh5oyH8A7VYB5QsFwXPo
 hpmRnld2IQ4jRfzesdA3mCEcD4KcNzYh0gV/jV4EQcqltSOhmkwqU3/6lw+94wkxtJSs
 T1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+n/SN5EfxXmoH+zSeJ91178FXdJfmCiZn8laQzSIas=;
 b=KNv7FgRHr+RlRE6e4CNs0Fo6ZjQJLyHxFsTF2QHv2LM7ZPdbWokw2pdQA0NaULRz/V
 AsjCuG7eJRWuYXlduYfiNDWVoSvIyysDJbcCFzmSuZ0o5U7LBGHffW0GavP+HVD7RwIS
 2mbq3wbAHCmfPQKt3P1l7DLrYUcNTjB0wxp7tIeFkf5zvwI4d6T3q9Q3KIS8rC231W8E
 D/rISyBxQtYxBh9i3sXQ0PM6xbKtsJRbVJUwm04JnEJHFEgOEeJbBf4KopwxPPRTQx2b
 6IOkcbNwtt8z+E/A8tDT24UFIpmsly5prGFvt1qmU7wrA7FV2yEhyg7H5QUo/+DKE/Fp
 ASfg==
X-Gm-Message-State: AFqh2koMW9VFK+7vfOkkTAGOhl+HbiOGwdLfYowOOuQoKamTmzlon1tQ
 QrWZS/U+MtkhBpoaJEfazzlWdA==
X-Google-Smtp-Source: AMrXdXs6KRpBSDWr3IYafckL6Tcy669Y48ilxMSpvkfp+fLkkrcsgoy2RRRSTs48llztgJnSnJudnw==
X-Received: by 2002:a05:600c:a4e:b0:3db:14d0:65be with SMTP id
 c14-20020a05600c0a4e00b003db14d065bemr36632319wmq.34.1674863364677; 
 Fri, 27 Jan 2023 15:49:24 -0800 (PST)
Received: from [192.168.0.114] ([196.77.14.77])
 by smtp.gmail.com with ESMTPSA id
 c11-20020adfa30b000000b002bfb5ebf8cfsm5297394wrb.21.2023.01.27.15.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 15:49:24 -0800 (PST)
Message-ID: <4f4276f1-78d6-8968-cf2a-e184f45cd9ad@linaro.org>
Date: Sat, 28 Jan 2023 00:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 16/36] tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-17-richard.henderson@linaro.org>
 <8b021470-b335-4b85-d516-906308ddea69@linaro.org>
 <dac69504-368b-6e00-5561-d0e723ff11e4@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <dac69504-368b-6e00-5561-d0e723ff11e4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/1/23 07:39, Richard Henderson wrote:
> On 1/26/23 14:45, Philippe Mathieu-Daudé wrote:
>>> +        /* Compare i128 */
>>> +        tcg_gen_xor_i64(t0, TCGV128_LOW(oldv), TCGV128_LOW(cmpv));
>>> +        tcg_gen_xor_i64(t1, TCGV128_HIGH(oldv), TCGV128_HIGH(cmpv));
>>> +        tcg_gen_or_i64(t0, t0, t1);
>>
>> Can we skip the OR ...
>>
>>> +        /* tmpv = equal ? newv : oldv */
>>> +        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_LOW(tmpv), t0, z,
>>> +                            TCGV128_LOW(newv), TCGV128_LOW(oldv));
>>> +        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_HIGH(tmpv), t0, z,
>>
>> ... and test t1 here to partially update LO/HI? (we could remove t1 and
>> just use t0 as twice 'xor + movcond' but the code is less readable).
> 
> No.
> 
> We want equality on the entire 128-bit comparison to control the 
> conditional moves.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



