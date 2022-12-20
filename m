Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C06528CD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 23:17:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7kuI-000681-Cr; Tue, 20 Dec 2022 17:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kuG-000659-4Q
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:16:16 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7kuE-0008Lb-Az
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 17:16:15 -0500
Received: by mail-ed1-x536.google.com with SMTP id d20so19643941edn.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 14:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=urBv+W+rBXUmHKKWa7gi+x7wXN2FRWVbzap1tkbFilU=;
 b=fKDcONAVrviNH/MSOcBwGjzw/OnYGLV+Na3W/gnSTGOIYnlHde0VebHuwLMZLW/3vD
 MxpbaMenKTu6wX/984/ARpFIG+PqKXcUmYAOn94lT8hmPyL8YPwAoJJ7Q8e5Ee+nXGIX
 yquxrxAuvyiP2XU8eA1N2s00Upds87FQlUwqqQ+8HcxJOekD958VxlnLF7aAHVW/SoT5
 jLZ8OBwDE+dpgm2xU6IJHuQAnJwDbJlb7ndZddFlq3X5B2hb9RiAWp10snf68FPpNUGO
 k/D1eLL9NLJj1FaEIjaxgBhEI9I8lolAlMWRFfr/cvN7T9VSd2AKS9c+5HapaJIy69bW
 20+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=urBv+W+rBXUmHKKWa7gi+x7wXN2FRWVbzap1tkbFilU=;
 b=k0+dI+ojMy4puOlu/j77Cm5qfjiCkM/18EnqyNPZaY8iulmTyUfa+9+RzoDkUfd0F8
 sUAMdpphX8eNxJxKqwXdgYOCgECr9THfVedpRR+ao7loTd8OrnU23Br4i91D6uo6FsOP
 98dzXJK7ub60oV4a85VpWxqUUi6DJlOlg3zTeKz4d4qqELM/a/9dFFl8l9dPA5vhucAX
 7S6XuIgcQY21GGP3D+djMjlk4ZNUn74zsrgU+Ac0Eg6kkTG73dFIvE0xYOkzjZUGVh7x
 t3HqskHilX6XJE+nR6GKA9u15vToHe6qwFzunxK5iJdtrdX4qTSO04UpTEwVyteo3M5P
 PofQ==
X-Gm-Message-State: AFqh2ko0np11RpKfPvkxO+/pG5PFM2z8HX4xlCfSF9S2kfjS8mgS4hUb
 AGoc5ifHB6qMAKpCpeDzlZ5WTw==
X-Google-Smtp-Source: AMrXdXvhUIfUzFmXoybVpYltOxsrWCOmYnOEXWSNdwUw++eDmEdDzV4QYAd7YJnkSY2WhlmTi0naWg==
X-Received: by 2002:aa7:c64e:0:b0:467:4df0:7185 with SMTP id
 z14-20020aa7c64e000000b004674df07185mr3067060edr.4.1671574572759; 
 Tue, 20 Dec 2022 14:16:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cb11-20020a0564020b6b00b004588ef795easm6277918edb.34.2022.12.20.14.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 14:16:12 -0800 (PST)
Message-ID: <8144cfc0-ddb5-b48a-e0f9-050a4e97c5de@linaro.org>
Date: Tue, 20 Dec 2022 23:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Warner Losh <imp@bsdimp.com>
References: <20221217184823.3606676-1-richard.henderson@linaro.org>
 <c6e49899-509d-6c81-1a89-7182c61896ec@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <c6e49899-509d-6c81-1a89-7182c61896ec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/12/22 20:31, Richard Henderson wrote:
> On 12/17/22 10:48, Richard Henderson wrote:
>> Make bsd-user match linux-user in not marking host pages
>> as reserved.  This isn't especially effective anyway, as
>> it doesn't take into account any heap memory that qemu
>> may allocate after startup.
>>
>> Cc: Warner Losh <imp@bsdimp.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>
>> I started to simply fix up this code to match my user-only interval-tree
>> patch set, as L1_MAP_ADDR_SPACE_BITS gets removed from translate-all.c,
>> but then I decided to remove it all.
> 
> A further justification for this:  The actual PAGE_RESERVED bit is 
> write-only; there is no other reference to this bit elsewhere.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


