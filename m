Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1651652E1D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 09:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7urF-0002og-Qs; Wed, 21 Dec 2022 03:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7urD-0002mq-F3
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:53:47 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7urB-0006sC-KL
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:53:46 -0500
Received: by mail-wr1-x436.google.com with SMTP id co23so14221681wrb.4
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 00:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aLrvGFerY4L20s/3/UNWINMeGfR35Aekk7WeH052FkU=;
 b=r4mXUDGbclG2IQ+7MDG21eGwmr+qewdhbcCJ08/IhWIYOJtLmRZ493Ca42BjWRidJL
 elrgbmRJvf3wEetLQAtyB9qRFg8Pnc4C7UP5vhoOV2q0Mnni1w4KxCGcNF4ZGAjTf7h/
 lXjYdX2gfKxIFK/NTXMWKdwyUQ3/E0GYQ93iTo9/RRKVAi1x6+2WqTcFLE2guIGG1Pib
 Q4ZVCPEIewcgJ2M1I0hRR5w8Lf2WyiNUkiIp3EIPBRJMR77GBnpqapnhzFUrHeWHurzq
 t0xP7r70rCkFpo+gjYaR18ZAagQWcXuJ9iZ8+imDmXzqnrvoPkB5QsddpWTkOfMzFXeq
 phWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aLrvGFerY4L20s/3/UNWINMeGfR35Aekk7WeH052FkU=;
 b=5r3spTQq3PJvOLehgRE+9EHQcfYvZ5wc+9jGkGgRs4lXuxtbGMzi82LAVDx0DwTFck
 qH5V35/KTwiOUHg+h+1MReEjoAQ73ek7FoZ/Iir6CZIZUEmNEqJxcUy12icw5iYr4K0V
 ROehvO2+tPXyZr+n94Y4LCvXO1Qxgp7UNLZtLcyGlX3X3u9GrrOAfJisGS3lRqMI2ZbK
 L7lMfesq0LtHwT3VU4xVAblGu+LnyeQIHETACFmD2Gq93447OozzwiElw1vgUHuE5pSw
 iAfo2TsXBgwL8ipP9Xz9PVsQgnzAm1CsD4CegNEAfQnavKs41tX8acj+XH7XIv8Bxgxj
 LofQ==
X-Gm-Message-State: AFqh2kqPDpXn743NC0LNtjorb4ui9jrgA/NT6+2xpjcET4c/IcvLVVjJ
 tUXo+sbYQAbVGw/LD93Y8K+GLPu+iDtvCLey/eI=
X-Google-Smtp-Source: AMrXdXvuD+4XG6Pq3xojkRvJa6/RQIZ0KgEPL1MQrd77BEE4cDE7QBrRGzyyFxtp2F5DZkKpAthHlQ==
X-Received: by 2002:adf:ed51:0:b0:242:659f:9411 with SMTP id
 u17-20020adfed51000000b00242659f9411mr642464wro.9.1671612824121; 
 Wed, 21 Dec 2022 00:53:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az17-20020adfe191000000b00241bd7a7165sm14743973wrb.82.2022.12.21.00.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 00:53:43 -0800 (PST)
Message-ID: <ce15788e-8254-e39a-f6ad-c249f06d2ac8@linaro.org>
Date: Wed, 21 Dec 2022 09:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [[PATCH]--edit 3/6] configure: repeat ourselves for the benefit
 of CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
 <20221221074252.1962896-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221074252.1962896-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 21/12/22 08:42, Alex Bennée wrote:
> Our CI system echos the lines it executes but not the expansions. For
> the sake of a line of extra verbosity during the configure phase lets
> echo the invocation of script to stdout as well as the log when on CI.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221202174746.1218017-1-alex.bennee@linaro.org>
> 
> ---
> v2
>    - only add the extra line on GITLAB_CI
> ---
>   configure | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


