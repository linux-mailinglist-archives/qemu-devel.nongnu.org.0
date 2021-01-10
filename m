Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4312F09E8
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 22:36:46 +0100 (CET)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyiOD-0006pL-AC
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 16:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyiMZ-0006BZ-Bt
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:35:03 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyiMX-0008Kg-Rj
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 16:35:03 -0500
Received: by mail-ej1-x631.google.com with SMTP id ce23so21979765ejb.8
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 13:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KnUawxQMSObqkU5tYyBdJ8IXi0v6jP8aUC0SJR4F7vY=;
 b=fURnMofeGMYav2JWoC1KwCrZxRUvJBYUcIjvXkfBtFc9IROAZQNxgtMmQealOKWxRN
 UwMjjTZ8zp84LWYDiKSSLJpidI9QQem0980H2IlGBldsuXu44m+8p44yyrOE4JaC3cKP
 z7CcfqR3BWQFOuMmbKtUnXZaEhEvmTkougpht82mEJquIwQyvL9/9dBt74Ako9IAeKSx
 0KcRKzwZp+OFTPJFPAYCO3IZ8sXLRugXJtsScZaRj/r8bolGkuAmdoLM7T8F56aW8g4F
 1JJro4O0ksV8sSm7qgAWi3T0vlvp0SVuVMF+ipe7cdlK+FgECFBnLwuwU2wVIFz3wuSR
 Inxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KnUawxQMSObqkU5tYyBdJ8IXi0v6jP8aUC0SJR4F7vY=;
 b=UPjirC94aSgzluLtpp0lljLkO3p97APOXhe8vV+0A0bv6rn0OMQA8FniVG8EusQydt
 It2SQZATpJkar53D+SidmwLP33xJbERTSLnzIJgjWgq1lVAg/B4JrLQxhLX+EpIpHcMq
 jocPfF3qTUUuMnEnGK9WTZnUZ6ZGQPgiDicMI59mpOYcOv0Sg5bd32+Y1pjepviu2CxA
 EExbm+2YBVIOJrhxYl6PZ43Azy8m7Jkg+mIKkJzfvuuKCT81DtWLw3r2mTxAE3Ab4Ttg
 KI38VTSZ4dcIRuvPuQOHmIko/vV3xfBN/COkfaj9oQ3u6wWFs130Je827D7ArcD9ao3a
 Eo8Q==
X-Gm-Message-State: AOAM532GQTqiyr2R+j7g5rWbLrroOrXYrkiSEbrvlJWjmDEtWJXfD+N8
 rmWJd+ELBQrM3L0tWKZ3KCY=
X-Google-Smtp-Source: ABdhPJxdNy4zH5Phey09/TqRjAPMitdp2bX+92hWU3mOGMXcXBvqQzqLjfaDNBobPjcOMUHSfB3LwA==
X-Received: by 2002:a17:906:f894:: with SMTP id
 lg20mr8789326ejb.348.1610314500423; 
 Sun, 10 Jan 2021 13:35:00 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id n17sm6209836ejh.49.2021.01.10.13.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 13:34:59 -0800 (PST)
Subject: Re: [PULL 23/35] hw/intc: Rework Loongson LIOINTC
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <20210103205021.2837760-24-f4bug@amsat.org>
 <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b2dd6d33-d8e9-21a3-7b76-bdf44e117128@amsat.org>
Date: Sun, 10 Jan 2021 22:34:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_YqAiiLRY08-gACmKOCf2mat3AaBGnyRK0Jc+aK-iuOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.012,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter, Huacai,

On 1/10/21 8:49 PM, Peter Maydell wrote:
> On Sun, 3 Jan 2021 at 21:11, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> From: Huacai Chen <chenhuacai@kernel.org>
>>
>> As suggested by Philippe Mathieu-Daudé, rework Loongson's liointc:
>> 1, Move macro definitions to loongson_liointc.h;
>> 2, Remove magic values and use macros instead;
>> 3, Replace dead D() code by trace events.
>>
>> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Message-Id: <20201221110538.3186646-2-chenhuacai@kernel.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/intc/loongson_liointc.h | 22 ++++++++++++++++++
>>  hw/intc/loongson_liointc.c         | 36 +++++++++++++-----------------
>>  2 files changed, 38 insertions(+), 20 deletions(-)
>>  create mode 100644 include/hw/intc/loongson_liointc.h
> 
> Hi; Coverity complains about a possible array overrun
> in this commit:
> 
> 
>> @@ -40,13 +39,10 @@
>>  #define R_IEN                   0x24
>>  #define R_IEN_SET               0x28
>>  #define R_IEN_CLR               0x2c
>> -#define R_PERCORE_ISR(x)        (0x40 + 0x8 * x)
>> +#define R_ISR_SIZE              0x8
>> +#define R_START                 0x40
>>  #define R_END                   0x64
>>
>> -#define TYPE_LOONGSON_LIOINTC "loongson.liointc"
>> -DECLARE_INSTANCE_CHECKER(struct loongson_liointc, LOONGSON_LIOINTC,
>> -                         TYPE_LOONGSON_LIOINTC)
>> -
>>  struct loongson_liointc {
>>      SysBusDevice parent_obj;
>>
>> @@ -123,14 +119,13 @@ liointc_read(void *opaque, hwaddr addr, unsigned int size)
>>          goto out;
>>      }
>>
>> -    /* Rest is 4 byte */
>> +    /* Rest are 4 bytes */
>>      if (size != 4 || (addr % 4)) {
>>          goto out;
>>      }
>>
>> -    if (addr >= R_PERCORE_ISR(0) &&
>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
>> -        int core = (addr - R_PERCORE_ISR(0)) / 8;
>> +    if (addr >= R_START && addr < R_END) {
>> +        int core = (addr - R_START) / R_ISR_SIZE;
> 
> R_END is 0x64 and R_START is 0x40, so if addr is 0x60
> then addr - R_START is 0x32 and so core here is 4.
> However p->per_core_isr[] only has 4 entries, so this will
> be off the end of the array.
> 
> This is CID 1438965.
> 
>>          r = p->per_core_isr[core];
>>          goto out;
>>      }
> 
>> -    if (addr >= R_PERCORE_ISR(0) &&
>> -        addr < R_PERCORE_ISR(NUM_CORES)) {
>> -        int core = (addr - R_PERCORE_ISR(0)) / 8;
>> +    if (addr >= R_START && addr < R_END) {
>> +        int core = (addr - R_START) / R_ISR_SIZE;
>>          p->per_core_isr[core] = value;
>>          goto out;
>>      }
> 
> Same thing here, CID 1438967.

Thanks Peter.

Huacai, can you have a look please?

Thanks,

Phil.

