Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37420310D29
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:29:20 +0100 (CET)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l832t-00010C-9n
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8313-0008EX-7p; Fri, 05 Feb 2021 10:27:25 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l830y-0004M9-QS; Fri, 05 Feb 2021 10:27:25 -0500
Received: by mail-ej1-x62c.google.com with SMTP id hs11so12597057ejc.1;
 Fri, 05 Feb 2021 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vCaykSI1IjYUZSSyIvN1gKJYu5xKWRUlbNnQ0sJ3+lY=;
 b=GSznvwHag1HZmYje1Z93su523lHtcTQp1lV/zwRwT1beRRdv+5hd/XqdqJ5qps3LPC
 CbZJKSVFabqWbmxstuRxL2Ux0IOH5pqbsZGq2bVgm2K+VrM2UrMbW482UAkCThcIYUud
 w0qNU9M1Oo64MsetGY3ZLDjA5KpFyU3WeSkYli5LA5QzTVyk4Kp/rI/1dUDgs37MDqB6
 6zt/Cue7RxZyymdaQcycFqaO0J3CxFJOCuRoAPYX34EeGI9vtUKdgh13zVOgfhmh21TB
 5re/dW9m3qC4q6lAQrX4uHavDbw5CgBjIRB4vTDnEH2BXEskmiGVUhXtwkhDsPfARm4E
 2R2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vCaykSI1IjYUZSSyIvN1gKJYu5xKWRUlbNnQ0sJ3+lY=;
 b=inhq5c3D+hgvccNiV9WNXiDCtjdsyyJghnsG1pIWWjxPSg1MAy8JHaYiSE6boALu6G
 KQmTIsVXKKW7qMtfLWaM0Llh8Z4Eb7jegGHh4vxW8VUqHRtRID8hv4Jq6Hg+l9rB+c22
 wEVPlFtXCl7B120yo4HjqL8fui8LBTr1ELdEc9jW0qKmFa2Y9zl2pJLdwcJ35lUT/KWD
 YR20L/g9hdmRY9QfyW/IZRM/SEYj3bTq1HM2/FWR20rwHKZ/AXrOhWVnoZC7F5y/NvPz
 /nsmaCeYtzVxf1llQM/tOaJrTeQ1/ft310kcSocjTE4mfa9EMnq9h3NwbRAu6ajQaXf2
 iHfQ==
X-Gm-Message-State: AOAM5312iHSJs+eLfQFrJSy7fczjo7dWaHmcyQiee5ohubYVFkIQkMVi
 i3WyCosAZXSacJc4oSpEyr0=
X-Google-Smtp-Source: ABdhPJxpGZOFGnb2C3RIIV2VheVW+3iEWCWaAqEdYBBBF5xSmomy/ZGrcXbh5o36KNcvLa7WNM2Tug==
X-Received: by 2002:a17:906:39c6:: with SMTP id
 i6mr4646580eje.433.1612538838670; 
 Fri, 05 Feb 2021 07:27:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x25sm4110996edv.65.2021.02.05.07.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 07:27:17 -0800 (PST)
Subject: Re: [PATCH 6/9] hw/arm/virt: Display list of valid CPUs for the Virt
 machine
To: Andrew Jones <drjones@redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-7-f4bug@amsat.org>
 <20210205151229.ro6atrqa5bdwuj57@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9534eea3-d0e0-f6a3-5e5f-465fabf7e6fa@amsat.org>
Date: Fri, 5 Feb 2021 16:27:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205151229.ro6atrqa5bdwuj57@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 4:12 PM, Andrew Jones wrote:
> On Fri, Feb 05, 2021 at 03:43:42PM +0100, Philippe Mathieu-Daudé wrote:
>> The Virt machine is restricted to a subset of the CPU provided
>> by QEMU. Instead of having the user run '--cpu help' and try
>> each CPUs until finding a match, display the list from start:
>>
>>   $ qemu-system-aarch64 -M virt -cpu cortex-a8
>>   qemu-system-aarch64: mach-virt: CPU type cortex-a8 not supported
>>   qemu-system-aarch64: mach-virt: Please select one of the following CPU types:  cortex-a7, cortex-a15, cortex-a53, cortex-a57, cortex-a72, host, max
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/virt.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 7802d3a66e8..6ffe091804f 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1830,9 +1830,20 @@ static void machvirt_init(MachineState *machine)
>>  
>>      if (!cpu_type_valid(machine->cpu_type)) {
>>          int len = strlen(machine->cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
>> +        g_autoptr(GString) s = g_string_new(NULL);
>>  
>>          error_report("mach-virt: CPU type %.*s not supported",
>>                       len, machine->cpu_type);
>> +
>> +        for (n = 0; n < ARRAY_SIZE(valid_cpus); n++) {
>> +            len = strlen(valid_cpus[n]) - strlen(ARM_CPU_TYPE_SUFFIX);
>> +            g_string_append_printf(s, " %.*s", len, valid_cpus[n]);
>> +            if (n + 1 < ARRAY_SIZE(valid_cpus)) {
>> +                g_string_append_c(s, ',');
>> +            }
>> +        }
>> +        error_report("mach-virt: Please select one of the following CPU types: %s",
>> +                     g_string_free(s, FALSE));
>>          exit(1);
>>      }
>>  
>> -- 
>> 2.26.2
>>
> 
> It'd be nice if './qemu-system-aarch64 -M virt -cpu \?' would only output
> the CPUs that the virt machine type supports. Then this error message
> could suggest running that in order to get the list.

+1 very nice =) But not how the command line options processing
works. Maybe later after John Snow command line rework is merged?

