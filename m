Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E982ED719
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:03:26 +0100 (CET)
Received: from localhost ([::1]:37018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxaZB-0008MS-HY
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxaXp-0007gf-Be
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:02:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxaXn-0000t0-Li
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:02:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id a6so6016632wmc.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RaBQP9YdRU+YIHuXvgXrd8SVp5jsXaGQxPAt4CDZEaA=;
 b=nh0o8n9PoCUq2sMru69rWawkgicZb3gHxtKCxpPpqWUbM2Heu6o97rHRz7/CzLqj/Z
 j36GLN9TMR6uFD5fGZM3S57lRNJKeo5DHOcTiwfQzw/3ZL3XMXOkQuc/4pGlQLAXTywI
 DF/eb2Ur71Q8+bLoI5uwN0ElTbLGp6kWZZkKKIxcr95wTz+WjQZ62pkFThTZ0R9ZNL0/
 z+cekbmVz2FejQKEw81QxVyklcIw++jfNPsCdA6mpZS5cshp57ZCQQTjxt7b6TX7/nRR
 pIZB4XRPIfC2AXUG5NqqaMWNUpmhUVUnPBDAJiMKgbOnWaB0c8I30lfSXZe/WCAXWzdI
 Aq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RaBQP9YdRU+YIHuXvgXrd8SVp5jsXaGQxPAt4CDZEaA=;
 b=A3S+BMCogYE8ZXyqvEApVREHk0NOEDXaHn2evEZ05Y0A2+MqG6E+NsjBRMWKFSso5b
 CvcCcPGOYxhrGxoxGiSxSHHTb4axgRt9NiQPkdh1qtIwVMTDUZpArFVHrFXPFtxiUZzK
 EX2lRlUwlcLkEqAaHmNN4FrU74/pbWmmvk5zmeca9pCxD98spEKTHhg1yURvztPyNqx8
 MYFvDdqwoJgu/D7y+36dygvisig2lvlpU1JuYXsa31LZ3RzaEMrLlXLaGX5oGD1Oq6bL
 6R5H826jEiEV7bzgJH8ejBGDRG7RHcsD4QSGFbof9O/cUx3WjwTFmurrqAkcetXYRbl/
 rF/A==
X-Gm-Message-State: AOAM532MYG3+jSnbaR1pwpPzCGtzBB8NwMPNSMzoR4VE2zykiT1iRT/7
 /iAhzJin2Y+4Fcdh6+RuTI+VHRR0RQ8=
X-Google-Smtp-Source: ABdhPJwb2K3JLbiPTvzVanhZtEv8tTd2SLt3QQ/3l+7a0yHeKiUba1JUgnwO6XkGtXWHI5suG86zOw==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr26448wmg.68.1610046117563;
 Thu, 07 Jan 2021 11:01:57 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id i16sm9435836wrx.89.2021.01.07.11.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 11:01:56 -0800 (PST)
Subject: Re: [PATCH 18/22] tcg/riscv: Convert to tcg-target-conset.h
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-19-richard.henderson@linaro.org>
 <CAFEAcA8UDVsG=5EgwJ3007OXei+BXoJ8pb5y+HNW_+W6ZQk7MA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fc52e673-f6fc-fb61-b5cc-ce1a6f253272@amsat.org>
Date: Thu, 7 Jan 2021 20:01:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UDVsG=5EgwJ3007OXei+BXoJ8pb5y+HNW_+W6ZQk7MA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 7:08 PM, Peter Maydell wrote:
> On Wed, 23 Dec 2020 at 06:25, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/riscv/tcg-target-conset.h | 25 +++++++++++
>>  tcg/riscv/tcg-target.h        |  1 +
>>  tcg/riscv/tcg-target.c.inc    | 83 ++++++++++-------------------------
>>  3 files changed, 49 insertions(+), 60 deletions(-)
>>  create mode 100644 tcg/riscv/tcg-target-conset.h
>>
>> diff --git a/tcg/riscv/tcg-target-conset.h b/tcg/riscv/tcg-target-conset.h
>> new file mode 100644
>> index 0000000000..116dd75db2
>> --- /dev/null
>> +++ b/tcg/riscv/tcg-target-conset.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * RISC-V target-specific constaint sets.
> 
> "constraint"
> 
>> + * Copyright (c) 2020 Linaro
>> + */
>> +
> 
> (Also "conset.h" looks really like a typo for "const.h" which
> is kinda confusing :-))

Isn't it an abbrev for "constraint sets"?

