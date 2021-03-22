Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F55345210
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 22:52:18 +0100 (CET)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOSTB-0001Px-1h
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 17:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOSQs-0000mM-L2
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:49:55 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:40618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOSQr-0003bR-AF
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 17:49:54 -0400
Received: by mail-qt1-x836.google.com with SMTP id r14so13534833qtt.7
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 14:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hQMsZgHbBPcS2HLJBCuemMeV59cLUHQaJ9foEaflzms=;
 b=qhA6qD8XamByUQfKGwzSez1GZuVRZN9vtyznsu/y6fArvL9Pd6qHrWQ1Id0v9jpZFb
 Z5TidI5iW17uCxjqgWWb+V94Ya91Kr5FyghYUCANZUPb0nNFr/dQuNKD0w90AknwBC8a
 JHWxDevSyPUoPRr65hb/bxapGTS/X39rohDaNt+6lvRgLDgW02Pg6OpxVJLFXSnCsGFm
 zHdXzYloC7gUumwY+MOHoztms1O2H+1nBtGwgUkZTstbaMSnzAE/uPGI8cNJj99UVfmt
 xWtfzVTvVGiQhvs3iVmWPV4JIiDelYw6O0r0jJd3woJCeMydBpigHjgxCjuEa6ZGrSc/
 YoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hQMsZgHbBPcS2HLJBCuemMeV59cLUHQaJ9foEaflzms=;
 b=N3fwbbvkI4SuQpD9zYKH7bqc90cn/BfCP4kTOuev/XOChfhAe8NhlPAuXtscIdy/oN
 pnWzOM9E8cq5stDsy4d0UFeympFI2V+PViMa3TPyqHm5lzmQL5splF0VjtMpQupHKthS
 jMsnTQ+2v+KXKOZ5rnGrun+GcBq46qsq7WjBBZPsBca119ZKvRg5atxF5KEPewUFORSR
 x87fLDz16neQZQcN8BG5HSSP9OqDHdgqtGhRiR3miAa0YYaZJx57Uz6Bbve/OIRtyyn2
 pi2TMMyV/iQ3TzmIG1PVREU8lNaMzbGBkjx6G32NXjxT1CbHEHPT4oIN7yMHnMWPkjWS
 /ssw==
X-Gm-Message-State: AOAM53057qKHdosaYZHFGKN0/SQECFYZV+Lpvt2HbfkNQgY/veB+wZtf
 VhE8/NDo+fkZFT21yGyy3nchjg==
X-Google-Smtp-Source: ABdhPJyp99xKZtC4P+vCwtrP3qZGF25820h6XJ8VEXsdjTfYAeH9cU0MVaAGTQxfjWXwjLh3oLM8Jw==
X-Received: by 2002:ac8:6c3b:: with SMTP id k27mr1871997qtu.354.1616449792151; 
 Mon, 22 Mar 2021 14:49:52 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id g14sm11866181qkm.98.2021.03.22.14.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 14:49:51 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] exec: Build page-vary-common.c with -fno-lto
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210322112427.4045204-1-f4bug@amsat.org>
 <a0a7f1e2-2266-79e3-11f0-8fb6ef6ddc32@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e85f930-b361-3cdd-2698-a362dc03d0d1@linaro.org>
Date: Mon, 22 Mar 2021 15:49:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a0a7f1e2-2266-79e3-11f0-8fb6ef6ddc32@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 7:00 AM, Paolo Bonzini wrote:
> On 22/03/21 12:24, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> While reviewing Richard's original patch, I split it in 3
>> to make it more digestible to my review taste. I then simply
>> filled the patch descriptions. Feel free to keep Richard's v1
>> if this isn't worth it.
>>
>> What is still missing is adding the new files to a MAINTAINERS
>> section.
> 
> Both versions look good, thanks (the split is indeed more digestible)! Richard, 
> are you going to queue one of them?

Yes, I'll take Phil's split, move the new files into softmmu/, and update 
MAINTAINERS.


r~

