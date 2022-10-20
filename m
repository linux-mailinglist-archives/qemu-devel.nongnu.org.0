Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493D606483
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:30:36 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXVB-00035v-VK
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:30:34 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXTM-0000Sx-K2
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olWzH-0006BR-OV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:57:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olWzF-000814-7V
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 10:57:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so2562843wma.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nSVgcFEmgfSAJbnQX3obGZCMKPuFLLQWqQ2zCP8e2Pw=;
 b=anDOTUgnNqdyh9W3XT5TMn2iCmxLamz1Y5v5+zQnfna8RPlw6oNvbaoT5OmNX7tgLd
 SGBrjvIv3N0ObI/CwMk03s9kzBZGqN2RQeXky2mR4KUTiKaZHfHVNaZ69+pVCG0YwkUc
 tu045yloLkHEG89o9c16XDYHojY3uHmV+d1fIXvY3LNkPPMJTmOoLWHurlGVHV5OrYJC
 Q3nDpor/jrg7E0OfnUsA8D/rdsq9qmgQTPZHeriJxoCqOOakLS/z1mH2r2rpM/lLKxks
 SNZSaIVQONY2VYYkhRap5M5/fRhE+fPuZH15ihZnXYS0+NChc1Dv++SODw8wDoxzthaf
 2OQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nSVgcFEmgfSAJbnQX3obGZCMKPuFLLQWqQ2zCP8e2Pw=;
 b=s/PBPLJkchHAtBbn6hlu4lHoJzEDllxc6+hJXdk6u65QvNBwHZlRQ+KZ89JuA4RwE9
 sHQOuQDZf34zCf0Z+J8V5O+2JRicjX/i1cJ3FnW1lFF/iATdB96aS19V74Fu2sSM9Q4D
 xmNtpDkXrKjOiynCHj9BCGmuZM/Qpzp/2eotscgaN3GP5AQ4mdBj53K5qt5xBSNzn0IG
 p0+K+hiKTH0q0d8J0GMRgx0fvf9v/lmasqSIl2ChpabaL99YyWdr903xhf8bdfGuSunC
 Pjce0ccYd6V+pHdkBWtcTcG1LIG9EbtSgiVzZAomzgtHARdGPFT7zzYVYvXrFB4OQoZx
 YIrw==
X-Gm-Message-State: ACrzQf3s6M9yr2+bLS0fhAZG4OuTiHTjLs1iR49HhRGByii7GwlQz0Q5
 scO4S/oEBIgtj+s2a2pbhWHlCw==
X-Google-Smtp-Source: AMsMyM4Tt3TY/zzHmDGBtWP0tK4yYiM84ghII5K4PYh9g8A8QqJAV0FnB4sugjNPRYlawF1iVzzglw==
X-Received: by 2002:a7b:cb93:0:b0:3c5:81c5:9dc8 with SMTP id
 m19-20020a7bcb93000000b003c581c59dc8mr31904953wmi.196.1666277848837; 
 Thu, 20 Oct 2022 07:57:28 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 n4-20020adfe344000000b00228a6ce17b4sm16902961wrj.37.2022.10.20.07.57.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 07:57:26 -0700 (PDT)
Message-ID: <66e83cf7-7bf7-69ff-f349-797be5b12f1b@linaro.org>
Date: Thu, 20 Oct 2022 16:57:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 10/31] tcg: Add temp_subindex to TCGTemp
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
 <20221020115242.2301066-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115242.2301066-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/22 13:52, Richard Henderson wrote:
> Record the location of a TCGTemp within a larger object.

This makes sense after looking at the next patch.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h | 1 +
>   tcg/tcg.c         | 3 +++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index d207bc47be..afa18986b1 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -456,6 +456,7 @@ typedef struct TCGTemp {
>       unsigned int mem_coherent:1;
>       unsigned int mem_allocated:1;
>       unsigned int temp_allocated:1;
> +    unsigned int temp_subindex:1;



