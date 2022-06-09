Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C214545093
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:21:09 +0200 (CEST)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJy8-0002kB-2A
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIZR-0005kg-PD
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:51:33 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:33565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzIZN-0006Ss-UZ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:51:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso1675887pjb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 06:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NvWKO/eR1yJsdEr/MjrC64DAUL6RQuAEyIUQnQjnfH0=;
 b=O2lNjpn5q2FGmTCSBJ1X3/+TrUcZUYWNacIXN+7ADnghJV7iJ+WCfDFyeNm9LB3RdE
 oxKkB7J4k9GWybuZv03ekmJk3rT7F7oXyyqVEtFP/2W94j5z4G/w2EHekXY7TD6reFAq
 TzuOhpEFO5RyGREadpQmvuxkZzILLIIOuuyFmFpZ55iuvXVAYiKcaOI+5n9A47+5stEP
 oOW+NFUoUJisvhlPN9OSZriXkptiQEssDYGtQkvWSKZmqoPpGMV/FbC8hpgzC36SJ7UX
 onpEcfwbeObb3srokTEssmoLU37ps6Q493vcJNNeOb8iNzPO+Jqt0nfKMn9CtGmXNaEo
 eBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NvWKO/eR1yJsdEr/MjrC64DAUL6RQuAEyIUQnQjnfH0=;
 b=iet2UA4tU43F79dvdDVt9vKHDrZWk9x0qdrlQxmjJKlrQjgjVOSq6cIIyHtgm9gLd/
 75jz1H5uScOTftFUXKDcznI2hde7NDeZgvwxy2QoiQ9OeSUeFevp1Q13vcfPUB+7sh1K
 AJldAnZedVKBEdFWGm6QBGorDuRhTNPh8opEZaGi5iG1ycuZ92RlpFdEjWx2mzCinrGO
 yIDtDoWARd3NQJH9rE5OwZ7eW/fyItlnLuczlgDrzaumsdBSxKG6tfi6tmnFZcHXAd+H
 ycL30WYCaZUpJ5vcQCD4AOe1E5bqwbPty9CLbdufT0K9BeuBBtj+koblcxWGGGC66Trx
 nJ3w==
X-Gm-Message-State: AOAM533vcjBdqFy5crjfOp5+cND/cs1PDKtoLeqnoMBDUUoOsxwNotY8
 0JHSXSOUtHYuhbgFPNlwMUGE5w==
X-Google-Smtp-Source: ABdhPJxL4s9d4NOc2vxLs4jLRW0PtKosZCJ1CKuc0lks3XIN6a+G7ATgIdffqjA4zwM6dc+HcC6bpw==
X-Received: by 2002:a17:90b:3b45:b0:1e8:8688:219d with SMTP id
 ot5-20020a17090b3b4500b001e88688219dmr3532731pjb.231.1654782688292; 
 Thu, 09 Jun 2022 06:51:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170902db0a00b0015ee985999dsm17065387plx.97.2022.06.09.06.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 06:51:27 -0700 (PDT)
Message-ID: <309c8467-ab03-397c-ecac-a99dc41b2898@linaro.org>
Date: Thu, 9 Jun 2022 06:51:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 08/53] semihosting: Split out guestfd.c
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-9-richard.henderson@linaro.org>
 <87wndqs3f9.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87wndqs3f9.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 6/9/22 00:24, Alex Bennée wrote:
>> --- a/configs/targets/riscv64-linux-user.mak
>> +++ b/configs/targets/riscv64-linux-user.mak
>> @@ -2,4 +2,5 @@ TARGET_ARCH=riscv64
>>   TARGET_BASE_ARCH=riscv
>>   TARGET_ABI_DIR=riscv
>>   TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
>> +CONFIG_SEMIHOSTING=y
>>   CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> 
> Why are these needed? The:
> 
> config ARM_COMPATIBLE_SEMIHOSTING
>         bool
>         select SEMIHOSTING
> 
> stanza should ensure we select SEMIHOSTING automatically.

Kconfig is not processed for linux-user.


r~

