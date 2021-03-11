Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C41337521
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:09:44 +0100 (CET)
Received: from localhost ([::1]:40686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKM0V-0001pP-JX
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKLQ4-0001ZE-00
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:32:04 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:39582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKLPo-0007IT-IA
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:32:03 -0500
Received: by mail-qv1-xf34.google.com with SMTP id h13so2531396qvu.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vkg7504q0jbZvQgCY1ng1hyAqN1CEO34LPMEQzK7+ws=;
 b=w2OnwRU6sGwv40yFp5TKK4Zj8Rkv5Om10nsTCYy/2FVk21ZYu03xToADaMciIIZ4SA
 lgL4ykuXWQwaz356V/XvMEUfFOpw0Z/Pe5Qq8AO6nRtQ7CtNXNVjMk3R2FEYH/EJWjgS
 q4mBCzPel6XHRgn2ovOpBDc6r/yXrlg7QqdTMufOtyJsbDPKyiNkGQlyLfZckVtmReeP
 2gAYTOa8z1G5oaRXjtulCSbC4lsa/UMbGE0FjRzmu6yfZJb/j6fDFBIcibiSYLsU+84+
 XojaATIvgx4SPr0l28FGpEPSPtasI4RRZlefIyFDHPwS0w0IKFpuj/zTYVF7H/bexpHC
 6Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vkg7504q0jbZvQgCY1ng1hyAqN1CEO34LPMEQzK7+ws=;
 b=lQrSKZi9fSBKPSUjvSY6/T6eYVWLIz6nKdG+xbgxddw/R/g40Gy3djvoMdRjF5WXYg
 T9upeZMmmcHI9+CI0KQFcF3G08hJbAdqBhsGH8kPxRWBEybXx9dsRbQlfjcGqoWDN947
 JwnrSfaeu1S2W+kK2e7um+NR6Bwv1YHLS26i8rI6azHLIYfnjtgsC65qronEqFQvvCXL
 4rdnsWwqM1QNRMc8G4n+Yy5N4pZnqBCWEGBKKsP9rzcefGCOZf+ALs3mkWSlKVC841xA
 OHbigo8d+79B2TNFHEzgErIrwXp4PwM608NQGra+R8hB7YxwHKOXI+g8K2lD7pIREX0E
 7HKg==
X-Gm-Message-State: AOAM531s9wFmLYQP9CK7VJqJCdpJd9ele/guK4nmOVdQCg9PslXvgTlj
 5tnPa2CXVE7Q5gTDv1f5xXnBS10jJZThao7J
X-Google-Smtp-Source: ABdhPJxtD1Dl20cLQ4TVtEQyDpfGeQCWuMX+z0KMlwp4pI9i6LQ/q9+XW97i/FeBDG7fNlJg1Pds9Q==
X-Received: by 2002:a05:6214:f6d:: with SMTP id
 iy13mr7776518qvb.24.1615469503925; 
 Thu, 11 Mar 2021 05:31:43 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v2sm1789943qkp.119.2021.03.11.05.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 05:31:43 -0800 (PST)
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
To: David Gibson <david@gibson.dropbear.id.au>,
 Ivan Warren <ivan@vmfacility.fr>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
 <503c3c5e-3dd2-adba-2d2c-2e5f8618fc3a@vmfacility.fr>
 <YEl2rC3TOetSiqh8@yekko.fritz.box>
 <e6bee42f-661b-a5a6-bb45-0b93167fb227@vmfacility.fr>
 <YEmjDwpfYwLOaVe/@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af7ed746-a1f3-5740-cdab-99baf683047c@linaro.org>
Date: Thu, 11 Mar 2021 07:31:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEmjDwpfYwLOaVe/@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-ppc@nongnu.org, groug@kaod.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 10:56 PM, David Gibson wrote:
>>       *pc = env->nip;
>> -    *cs_base = 0;
>> -    *flags = env->hflags;
>> +    *cs_base = env->hflags;
>> +    *flags = 0;
>>   }
> 
> Ah, that one.  It caused a regression, so I dropped it. I pinged
> Richard Henderson about it, but I don't think I even had a reply.
> 
> I'm afraid I don't have the knowledge or the time to debug this
> myself.

I missed the regression email, sorry.  Do you recall what it was?

r~

