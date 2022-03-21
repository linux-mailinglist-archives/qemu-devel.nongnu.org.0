Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD74E3296
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:12:55 +0100 (CET)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQGk-00027f-Jd
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:12:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQCS-0004Zg-Bq
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:08:28 -0400
Received: from [2a00:1450:4864:20::335] (port=43856
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQCQ-0004ik-RY
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:08:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so325382wmq.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CkDeaq14YPgIsFpDWQ3HCxbIVg2BH3OkfqvDHTH2nNA=;
 b=Gdp+8tyBjlM/agX4crM5zfld1UDI7+I1rsBxCAUCQw7n1MofIFllxMCY2KKxgWC2Yt
 fx6UWaPVjvI3aa1JTXAx/K3HBKzUM5FHlgGa6XL/o8ZWhMXAKCLhyeErBdMgNS93u2zH
 Iz5GEOSPbnaCpzuXARKlic4oiGOozLyRU32QB3SdygY4NJ24tP3jy78W9ue6oiEHLvZd
 57yMMebdCI+N33nbRvKtZ5tEb8OosKtxPnsU0l2s4hCuMWu69KfQFiqsg0YAtM/Ya1R+
 q18r+wa2O0g4G+TSKdJwJAlfjpZskbkoKghgHFixIAeiRCHL2fjZ+VKQCCHaV01+fhut
 TXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CkDeaq14YPgIsFpDWQ3HCxbIVg2BH3OkfqvDHTH2nNA=;
 b=s70KE+SmLaEKcwdlpQy1p9xD+qqnoGrdrsV34cRRK19NIqpbHlizaUEo0dJ/pdkL3r
 LHN906ChjIt2m+mN27N4FQjgcXrS2+e+v9GR4AxTuQsE1NtuVwHKJfzGm+qF3yl29M6X
 gAuB5Oug4JnaV75S5NQQ1nZJM2oOYLbrDNsQ7m8YCTaqO4RuHyyUHbB6K4zeIBAQCETC
 P9u6yf2gFe+FeKKg6OSmp4MqWubY3t8nFfz8r0bGFePqFoqqkEuAw2a8+QMXWau1iVJ+
 hj95dF0DnvWNCiEoeSpulf008m5YeVShRZacC6GM4DEk426q8leF+nDfCy4AlBa9nK3d
 sGLw==
X-Gm-Message-State: AOAM531yzGC4Z1lf1uhKg9kd2+MO0EyS1RnJ4Laf1/p5fKg7dtHwGkDU
 chZIulbcn9qL8AEceK3rFFM=
X-Google-Smtp-Source: ABdhPJxeP8ZgdMDqE/vrslitTvRXxEmjFAFBS0awBjUqb4swQudb1yEljTZth850zgGz0nuZxAR4WQ==
X-Received: by 2002:a1c:7219:0:b0:38c:a4f8:484f with SMTP id
 n25-20020a1c7219000000b0038ca4f8484fmr987321wmc.99.1647900505497; 
 Mon, 21 Mar 2022 15:08:25 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b0020397ea11d2sm15906345wry.20.2022.03.21.15.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:08:25 -0700 (PDT)
Message-ID: <4f709cd7-fcf4-7cd7-d603-7af0de14f06b@gmail.com>
Date: Mon, 21 Mar 2022 23:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v3 4/5] cpu: Free cpu->cpu_ases in
 cpu_address_space_destroy()
Content-Language: en-US
To: Mark Kanda <mark.kanda@oracle.com>, qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-5-mark.kanda@oracle.com>
 <96a26850-2444-fd18-92ae-809b9fd17e10@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <96a26850-2444-fd18-92ae-809b9fd17e10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 23:03, Philippe Mathieu-Daudé wrote:
> On 21/3/22 15:14, Mark Kanda wrote:
>> Create cpu_address_space_destroy() to free a CPU's cpu_ases list.
>>
>> vCPU hotunplug related leak reported by Valgrind:
>>
>> ==132362== 216 bytes in 1 blocks are definitely lost in loss record 
>> 7,119 of 8,549
>> ==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
>> ==132362==    by 0x69EE4CD: g_malloc0 (in 
>> /usr/lib64/libglib-2.0.so.0.5600.4)
>> ==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
>> ==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
>> ==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
>> ==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
>> ==132362==    by 0x93E26F: property_set_bool (object.c:2273)
>> ==132362==    by 0x93C23E: object_property_set (object.c:1408)
>> ==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
>> ==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
>> ==132362==    by 0x933C81: qdev_realize (qdev.c:333)
>> ==132362==    by 0x455E9A: qdev_device_add_from_qdict 
>> (qdev-monitor.c:713)
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> ---
>>   cpu.c                     | 1 +
>>   include/exec/cpu-common.h | 7 +++++++
>>   softmmu/physmem.c         | 5 +++++
>>   3 files changed, 13 insertions(+)
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Err I meant:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

