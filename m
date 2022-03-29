Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A94EB27F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 19:09:22 +0200 (CEST)
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZFLO-0002go-2g
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 13:09:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZFK9-0001ic-IL; Tue, 29 Mar 2022 13:08:05 -0400
Received: from [2a00:1450:4864:20::434] (port=35453
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZFK7-0008Bz-AI; Tue, 29 Mar 2022 13:08:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id w21so21215472wra.2;
 Tue, 29 Mar 2022 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SJBBF0TnBpbETSwq+FOJlCnJwivuZ+gZ5uXpl+U64bM=;
 b=THiSH7KXSf6dCGjJSrSiCBHVIC3P5noRnN/sACH59ZdbsN9Qtl4Gge0gCBUoHGZiab
 ez1tHVVUMWZMQTTq0EygtdGENraTV1WmfoN6JVc66ech/QRFSWbpIfGU5lH3BxnZFYdB
 IH4f3iJDXtgXkJG5czizuOirYZ43s2ETncvJAJV0QGJp4rOqVAxYt18+3Xc6Pvg7Ec8F
 949zsM/+xbvypYtYpVUPHnMByhfiQQaEhC/g3LX5rvIQ0LEJzzq0OXZNy0IyrCR4H2gG
 /5qgZWs/1/fGgOIm7Ys9xswVK2A/9rj8aJW1IYiZK5fSYpPq8hWZsQ9hpT0eY0JKIFgG
 qB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SJBBF0TnBpbETSwq+FOJlCnJwivuZ+gZ5uXpl+U64bM=;
 b=VdKXqD2Eyn7yAnuzgATlsYrnmvgNhmQbBbHfOYUzkA6GCfOffwcKLDvmyJBRaxRZnh
 vjmk7NKLCaQ2wy9jI3Q3xIGf7DWqazOU0NSWbPtD8QFQfLftF03QQbGt/GDgpAO404xB
 JNoZER0aQoHwOZbgM5FrOGHOwN6nRzUmFp0mPfIEMosyPqHfP1X76uxXrJwnyckA3siP
 NNA9vgEVdFmmMpxifpCdxIv/gRMJW/tsZSN0cAVPtjJRiZmLe8bjWOla1J1vrtqfXalz
 uBhojS8fjbM+Phq46haMvDGo1QOoUzhNNKujs33uJJk4OBJNwg27rMxPUjHIKCdwXAV8
 vxIQ==
X-Gm-Message-State: AOAM531pLEagEjfEQoG6wUkJ3JV6L7IOxF6KEmmAZyOqzG+koGdi9BZq
 cbGVhCFkVGh6GFEpqOMvCWk=
X-Google-Smtp-Source: ABdhPJzyNHCa08I7kSzfQvVRcY9BIsjy/6LsuCWH1+jld0LmZC+RSjuH0vt+zgfpNU7MWns7WKTvig==
X-Received: by 2002:adf:f881:0:b0:203:f9b1:a6ab with SMTP id
 u1-20020adff881000000b00203f9b1a6abmr32237062wrp.410.1648573680990; 
 Tue, 29 Mar 2022 10:08:00 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:7175:c9f2:ce76:a519?
 ([2600:70ff:f07f:0:7175:c9f2:ce76:a519])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c511300b0038d0d8f67e5sm2604534wms.16.2022.03.29.10.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 10:08:00 -0700 (PDT)
Message-ID: <fa67e24a-1e6c-a3b7-0db1-ea2be261dfa3@gmail.com>
Date: Tue, 29 Mar 2022 19:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 4/5] intc/exynos4210_gic: fix format-overflow warning
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, marcandre.lureau@redhat.com
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-5-marcandre.lureau@redhat.com>
 <CAFEAcA-g=XaURutqWd6okRHb3-pz3SegaxRMG5j2s+PThQHdGQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA-g=XaURutqWd6okRHb3-pz3SegaxRMG5j2s+PThQHdGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/3/22 11:15, Peter Maydell wrote:
> On Mon, 28 Mar 2022 at 09:48, <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   hw/intc/exynos4210_gic.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
>> index bc73d1f11524..5b6f4330a5f3 100644
>> --- a/hw/intc/exynos4210_gic.c
>> +++ b/hw/intc/exynos4210_gic.c
>> @@ -289,10 +289,6 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>>       Object *obj = OBJECT(dev);
>>       Exynos4210GicState *s = EXYNOS4210_GIC(obj);
>>       SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> -    const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
>> -    const char dist_prefix[] = "exynos4210-gic-alias_dist";
>> -    char cpu_alias_name[sizeof(cpu_prefix) + 3];
>> -    char dist_alias_name[sizeof(cpu_prefix) + 3];
>>       SysBusDevice *gicbusdev;
>>       uint32_t n = s->num_cpu;
>>       uint32_t i;
>> @@ -322,8 +318,10 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>>        */
>>       assert(n <= EXYNOS4210_NCPUS);
>>       for (i = 0; i < n; i++) {
>> +        g_autofree char *cpu_alias_name = g_strdup_printf("exynos4210-gic-alias_cpu%x", i);
>> +        g_autofree char *dist_alias_name = g_strdup_printf("exynos4210-gic-alias_dist%x", i);

Dubious '%x' format... Maybe change to '%u'?

>>           /* Map CPU interface per SMP Core */
>> -        sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
>>           memory_region_init_alias(&s->cpu_alias[i], obj,
>>                                    cpu_alias_name,
>>                                    sysbus_mmio_get_region(gicbusdev, 1),
>> @@ -333,7 +331,6 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>>                   EXYNOS4210_EXT_GIC_CPU_GET_OFFSET(i), &s->cpu_alias[i]);
>>
>>           /* Map Distributor per SMP Core */
>> -        sprintf(dist_alias_name, "%s%x", dist_prefix, i);
>>           memory_region_init_alias(&s->dist_alias[i], obj,
>>                                    dist_alias_name,
>>                                    sysbus_mmio_get_region(gicbusdev, 0),
>> --
> 
> More false positives, but here the new code is massively better than the old.
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 


