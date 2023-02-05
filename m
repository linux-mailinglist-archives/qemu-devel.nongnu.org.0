Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D6368AF82
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOdAC-0005zI-HE; Sun, 05 Feb 2023 06:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOdA9-0005xQ-JD
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:26:25 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOdA7-0002u8-Vf
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:26:25 -0500
Received: by mail-ej1-x635.google.com with SMTP id hx15so26793963ejc.11
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 03:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+gpgXBg7p0QeDbicdI7UQi/V4UXxZogSA5z5LD2rxc=;
 b=pl6gR1n21f8HWNngHRmHslFS/0PY2SK+fmb/CeFkVu6p0YRsCUkKOr8K1e85kwqMKa
 yUjVEuCRlBrB4e9peFWkzTa0V0gJj4HA65aKuSbztk6dtGh/LkMmFL5UPgIXt7neWh5R
 oj9DmMZwbxsdACtlO6mIRmzLOF8rINwOI9qNqGvJdixL5JAw86OSXVknU74giKwSqyyc
 Tzamlr1FUIyh3RdPTb5PTWOvtcjXRaeiC4SElGXJp4tw2PcEzpqbeWJDXeuQXl2e0Uyj
 NuAYEPs3sTVbL2wmi0Yr1Ef6aABf+CMrEDCzOlQo3TighhjOz/oWEmmC3YG8lZPtNiff
 VKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+gpgXBg7p0QeDbicdI7UQi/V4UXxZogSA5z5LD2rxc=;
 b=3Lt6jhfCdLIaQwH4cnC2x5Fhfzzg36NY3Kk9p6sHXRTKphxeXOyL+7zjSXpKeZfi9h
 iw45mU1Vm70BGn/4gy0xZsaYgyRPVuMC1iruKv5+8vq9j7tPBV9Dul+25Mybo777dRjT
 VnJL3/HMHG0GMM/4xeEeULZn2kw5T/npbg0lE1GCicxOQ5MM59gUVAl/5XSN5ti1YExo
 okFq9RqycNlZg2FaRe14ZQh1Cfo9zCHyucT+FwjH7lN2Y+FEhhDacbg9t4BtRsXRtkE0
 wZuF9MGVE26QsE4PVA2w9D53G9+a3sENnAVXlvGRHsG2zhr7hHBC5fjJhCQ4CxtEVOe4
 aN8Q==
X-Gm-Message-State: AO0yUKWlAIVTwF+XS18OyikaJZDSvYt04n7ZwVHM/L7QI25S6N9ABMe/
 wQlf6eGq2yHKIz/8SdOQu1BqGA==
X-Google-Smtp-Source: AK7set9ftBr6i0ByT+YBXkBYmxaJC35lFSBrBZUr5ojDOhJus1aLwzPaPOzT5OUZFg8HOQ1rAIUY8g==
X-Received: by 2002:a17:906:c319:b0:88b:236e:ed25 with SMTP id
 s25-20020a170906c31900b0088b236eed25mr15555950ejz.61.1675596373353; 
 Sun, 05 Feb 2023 03:26:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y89-20020a50bb62000000b004aab193b8dbsm312570ede.80.2023.02.05.03.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:26:12 -0800 (PST)
Message-ID: <4aaafceb-848a-c4eb-2a06-0ad37899deb1@linaro.org>
Date: Sun, 5 Feb 2023 12:26:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 9/9] target/i386/tcg/sysemu/tcg-cpu: Avoid own opinion
 about smram size
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-10-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 4/2/23 16:10, Bernhard Beschow wrote:
> When setting up the CPU's smram memory region alias, the code currently
> assumes that the smram size is 4 GiB. While this is true, it repeats a
> decision made elsewhere which seems redundant and prone to
> inconsistencies. Avoid this by reusing whatever size the smram region
> was set to.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   target/i386/tcg/sysemu/tcg-cpu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/sysemu/tcg-cpu.c b/target/i386/tcg/sysemu/tcg-cpu.c
> index c223c0fe9b..8f5ce6093c 100644
> --- a/target/i386/tcg/sysemu/tcg-cpu.c
> +++ b/target/i386/tcg/sysemu/tcg-cpu.c
> @@ -22,7 +22,6 @@
>   #include "tcg/helper-tcg.h"
>   
>   #include "sysemu/sysemu.h"
> -#include "qemu/units.h"
>   #include "exec/address-spaces.h"
>   
>   #include "tcg/tcg-cpu.h"
> @@ -36,7 +35,7 @@ static void tcg_cpu_machine_done(Notifier *n, void *unused)
>       if (smram) {
>           cpu->smram = g_new(MemoryRegion, 1);
>           memory_region_init_alias(cpu->smram, OBJECT(cpu), "smram",
> -                                 smram, 0, 4 * GiB);
> +                                 smram, 0, memory_region_size(smram));

Or define SMRAM_REGION_SIZE and use it?

(subject header can be shortened to "target/i386:").

