Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD031C587
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:30:29 +0100 (CET)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBq8C-00005b-RE
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBpuB-0006la-O9
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:16:00 -0500
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:34265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBpu8-00021i-M1
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:15:59 -0500
Received: by mail-oo1-xc34.google.com with SMTP id x23so1972477oop.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 18:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ww9zTOnQxN5wOduZ4fPjbuGe+rSzce/iLXZI9QuWjOw=;
 b=ulm8X1ahX+ezaIvaJ9pnPtrZR55GIW7JPDlMJd4Jf/PRqO1p5RYcSXlxlAvWqWhOmV
 SVLTlEhcqQ3bPdPUB3hN1w8RpQg5Was+eWG7MS6PI8lYsneJbQcwZpdFUcIa3o06S0f4
 +V4uzBR4blnyNcgb9FOfmRfyAmEpSn9eBuJn4hKl5njAb87WVhoXesCIuF+P6sIIOSbB
 nhnwokRAIk3ZxiPyNcOMBA0HGykxOGFdLWPVluLteU62ZAF99kFP64+SKZTNn/Fn2PrH
 Kqw6NUrUSE7/hU9xuYEGg8y3qwhIaSFDyb4lOydbe/4a8KNVdMpK8+ICavD3US8+jnpX
 kVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ww9zTOnQxN5wOduZ4fPjbuGe+rSzce/iLXZI9QuWjOw=;
 b=e4F+LW602WEB4BdlgihhUtc59+uo1XOSFGRbYw3vHprBCLfIm3zQjk3fwVvjGqFDg0
 JXyhve06S70BQHsYItvIOVyMOEOENYogDqhTCH6y4Xwp92iftqQtfrx38nQ6rW5pN1/M
 SnuIYGbQS4Qu47eXssgyMpWiTux4h0iSDtWNJDE1OoyXya9yI+i7VEZIRCww2m/6MlLI
 DRa9NFWYQnJai9wUO/WKSnNf5jBIzZaVUfLrvkHRT2ijWT63IMKOL1iJHYZYVkdZjH7Y
 7kyXtI1t/Hq/EF9bLhHfm5QkSG1fscWY+7YENr7ynUXrzjqyVzUaiDhso3UkucX6Fnlp
 TzxA==
X-Gm-Message-State: AOAM531+p1NKv+W6b5HetVuQkJ/h4mEGSOKZJj9Bmh/BgOiDPtNovOAU
 dKKUNFAOMv5miFGzjMW7uKHxKjVKE3L+ced6Tn+Yjm+yQGwYOoGbZb0AA7gLkQpbm761FG6EbV0
 stIlAFVz/GYK2u7w7UQxPxJTaM6SN8hPoDtqLh9OXb0+hlUiEG3DYcHZHB5zsqugA5aVZjTI=
X-Google-Smtp-Source: ABdhPJwLOIC+uCLPhYPZ/Fdy+HBPJIclJcabaFqZkimuTEnvJ0NBn5Dq+gBezT5aPLjdUKSEci6dhw==
X-Received: by 2002:a4a:858c:: with SMTP id t12mr12804136ooh.20.1613441755296; 
 Mon, 15 Feb 2021 18:15:55 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id g13sm3850623otl.60.2021.02.15.18.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 18:15:54 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: Add support for FEAT_SSBS, Speculative
 Store Bypass Safe
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
 <20210215215819.1142-2-rebecca@nuviainc.com>
 <e4233ca8-72a2-5213-1832-b326db071b49@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <a66d581c-680c-63a9-08b1-59ed176c4fa2@nuviainc.com>
Date: Mon, 15 Feb 2021 19:15:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e4233ca8-72a2-5213-1832-b326db071b49@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=rebecca@nuviainc.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 5:19 PM, Richard Henderson wrote:
> On 2/15/21 1:58 PM, Rebecca Cran wrote:
>> @@ -960,6 +960,12 @@ static void cpsr_write_from_spsr_elx(CPUARMState *env,
>>           val |= CPSR_DIT;
>>       }
>>   
>> +    /* Move SSBS to the correct location for CPSR */
>> +    if (val & PSTATE_SSBS) {
>> +        val &= ~PSTATE_SSBS;
>> +        val |= CPSR_SSBS;
>> +    }
> 
> Incorrect.  SPSR_ELx leaves this at the same position as CPSR: bit 23.

Okay, I see where I'm going wrong now - SPSR_ELx has different formats 
for exceptions taken from aarch32 and aarch64 states, which I hadn't 
fully understood. I'll fix it.

-- 
Rebecca Cran



