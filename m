Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F0665507
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 08:12:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFVFr-0000VN-GP; Wed, 11 Jan 2023 02:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFVFk-0000U9-IZ
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 02:10:29 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFVFd-0000Ph-NR
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 02:10:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t5so9678153wrq.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 23:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
 b=QsnvU3QjCsGrUrsWmZMal1dSye7ALlPTlWdR8roEyrDSpSTxK4uCYZRp8s0YPW7Pi+
 iNCH8BzYk3d67MKeCG1vRxV7zdeIFTl3dhKrDxswgfX1ppqfAPl/q5ksc0vXLhXpgmZ5
 gyZ14dlu5esz4Yna9dWY4Bupdu0Ra7GI6TtXdqPYjQetM3qHuHJPdCy9pMjWSYJ1aXu3
 RJEHUS+8Y+cJu+27SNrPJ853dDlN/4lYwMCZsHFppzlmfeFZ42cCme2GHrtMhJ1J6ZKL
 GrjNaiXAgexd1SaOpVMGq7zBPoqHafa7W63RaApTWq0/QMvDX4+KE5cgoHgXVFcvY9ko
 arRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JLMrfUKmlGGDmWYHnk7ZCXAGeJsLRVrjdj3i8XFCUkM=;
 b=reEl4IZYZuDvBqIzH4+wwn/cmb9Atal2oO2zIaMMMSVht1coxPl6FOTtwEFoRUfwc9
 tglxWDCAE6mp2oWb/D7DTTozQgzKULUqOPR/UoVhIoEtt++wC6t5K0ylGGB6SMyJT/x1
 nH8TDRnz5RmPuWwVfSNVIDoZR0t5ZahC+cubU+f4/VhevCsCAihv9VepsoQ+3zAWKZqI
 3B8YCHGBtkDfT1SBACLXMU0yREZyO5o2e82F1pZe1By1bzUjHGkqrH0ZrhCyHCWnOEWq
 e7nR8/TOKkEUULl5lsa0fZs1yLPzIYH3pELgtsIhCNORh5rTJTnPjQTQI7bW+VebGVkO
 XeVQ==
X-Gm-Message-State: AFqh2kpifTGx8gBPgRhi4K++CqJ6a3fyKcuY0zWkrc49nrEhsSmgmV/h
 qfcQUlOGi3NIwKa2uTzqIgMp7g==
X-Google-Smtp-Source: AMrXdXsGPsc4OJU/t1NQdJK4GmcIPv1Y7o5mpehNbv/fNNrQ3c/gKOMp6+JozXH+1a+SCVhmx/wolA==
X-Received: by 2002:adf:f107:0:b0:284:5050:5e59 with SMTP id
 r7-20020adff107000000b0028450505e59mr33484997wro.29.1673421016818; 
 Tue, 10 Jan 2023 23:10:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002238ea5750csm15291197wrx.72.2023.01.10.23.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 23:10:16 -0800 (PST)
Message-ID: <92cd2724-6a14-deb1-923c-dad28de5e8c6@linaro.org>
Date: Wed, 11 Jan 2023 08:10:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, ale@rev.ng,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org,
 Thomas Huth <thuth@redhat.com>
References: <20230110212947.34557-1-philmd@linaro.org>
 <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d4ea8bf5-a669-eb33-6dd2-f37417dab1c7@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/1/23 23:01, BALATON Zoltan wrote:
> On Tue, 10 Jan 2023, Philippe Mathieu-Daudé wrote:
>> The 'hwaddr' type is defined in "exec/hwaddr.h" as:
>>
>>    hwaddr is the type of a physical address
>>   (its size can be different from 'target_ulong').
>>
>> All definitions use the 'HWADDR_' prefix, except TARGET_FMT_plx:
>>
>> $ fgrep define include/exec/hwaddr.h
>> #define HWADDR_H
>> #define HWADDR_BITS 64
>> #define HWADDR_MAX UINT64_MAX
>> #define TARGET_FMT_plx "%016" PRIx64
>>         ^^^^^^
>> #define HWADDR_PRId PRId64
>> #define HWADDR_PRIi PRIi64
>> #define HWADDR_PRIo PRIo64
>> #define HWADDR_PRIu PRIu64
>> #define HWADDR_PRIx PRIx64
> 
> Why are there both TARGET_FMT_plx and HWADDR_PRIx? Why not just use 
> HWADDR_PRIx instead?

Too lazy to specify the 0-digit alignment format I presume?

