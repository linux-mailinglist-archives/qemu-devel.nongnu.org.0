Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132593403E3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:51:49 +0100 (CET)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqFo-0004wa-49
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMqBN-0001nh-Pr
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMqBK-00073u-6g
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616064429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydCeXgICna55PjLHgHsra4HmULIKMVLqCEAZhSLxPcY=;
 b=BNszh4jrUs7u4Vrj6DaYbVkQ2ADi4rqzCuRh/YVYnE7Nj98TVUGzhZcJUwovKPymeEFnt0
 6LyhFn2oNhHv6zbwhzzpwksRO1ws3XPYZeA55OPyxdPHCSbiXTSD7zWYmzmqxZ/UfsdI6Z
 PwDfFjmWlL5Llldd5hL6QNj2+YWtxls=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-yWh8-wvlM_eyxqmgU8ZWFA-1; Thu, 18 Mar 2021 06:47:07 -0400
X-MC-Unique: yWh8-wvlM_eyxqmgU8ZWFA-1
Received: by mail-wm1-f71.google.com with SMTP id s192so11632099wme.6
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ydCeXgICna55PjLHgHsra4HmULIKMVLqCEAZhSLxPcY=;
 b=RZ2bvSyqbgaIj8keM253AdWWYtGS5SqWIQebXzesxeHnyn0zfPrgtlcyvsdxJi0C/s
 qPqejTF07ik/I1PfpgnBvIzwMsbWEvgWfuNBjFUe/Ww8wjXUYWiCMfWQxxwW4BnLpB26
 sT/x9Mw/X0n4O2vFzqkao2s3lrC0pWH8Ld4IQXGlSY6i1G4Ksu/ecKVH0nwi26nz+wex
 +T87v3uL+j4AY6PZHQdC8e6bhomfJ+kYSqdnbwL8MiWfy3Rsj4gjSON4Z8/+WNgEOIvK
 LvkGTJ27YmjWMBdD/PBSPCZ0L/38Ky0xxkqn26JJIo2yejv8J+eF8ifjTr5QWCNtpTd8
 6hNg==
X-Gm-Message-State: AOAM531OsUBHTL3nVgziltA2vwWonMDCo1qtTIRzbvMUUwWKNqQHNQQ0
 YbiPQH4+lpW7gCM1h7YjJlO3kXaQpW4AD1Y+/DMSLEZpdK9j8IlsVd7JIEPluXf1YfEtIw0L4l5
 nGsEI0qPAENyrucs=
X-Received: by 2002:adf:ee92:: with SMTP id b18mr8703434wro.275.1616064426468; 
 Thu, 18 Mar 2021 03:47:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcuBuKrgFFmcFOq5MqXXpA5cw0VIYGASO4Ukx8tPRDc3GqBF1lB3EGlseqVUAVblueeXrYEw==
X-Received: by 2002:adf:ee92:: with SMTP id b18mr8703416wro.275.1616064426302; 
 Thu, 18 Mar 2021 03:47:06 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g15sm1795135wmq.31.2021.03.18.03.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:47:05 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <20210221222617.2579610-4-f4bug@amsat.org>
 <c395479b-d2e0-a862-3446-4afef601ca1f@suse.de>
 <8a302c84-b69c-b0c2-de45-607dd1f686a6@redhat.com>
 <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec296129-2c4d-fd74-d044-50c470e29609@redhat.com>
Date: Thu, 18 Mar 2021 11:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e0d11b2c-7b1c-c968-feb2-675a8c98c7a4@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 10:56 AM, Claudio Fontana wrote:
> On 3/18/21 10:47 AM, Philippe Mathieu-Daudé wrote:
>> Hi Peter,
>>
>> On 3/11/21 11:43 AM, Claudio Fontana wrote:
>>> On 2/21/21 11:26 PM, Philippe Mathieu-Daudé wrote:
>>>> KVM requires the target cpu to be at least ARMv8 architecture
>>>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>>>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>>>>
>>>> A KVM-only build won't be able to run TCG cpus, move the
>>>> v7A CPU definitions to cpu_tcg.c.
>>>>
>>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>>
>>> Here I think it's better to keep the "a15" cpu around,
>>> until we fix the board configuration situation.
>>>
>>> I added a patch that does that into my KVM-only build series, to avoid the resulting breakages.
>>
>> Actually I got a downstream report that this break migration from QEMU
>> 5.2 to QEMU 6.0.
>>
>> I first thought it was on an old kernel (with 32-bit KVM enabled),
>> but not, it is for Aarch64 VMs on recent KVM (without 32-bit support)
>> but the 'virt' machines were started with default Cortex-A15 CPU...
>>
>>     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>
>> I'm not sure upstream should care about this case, but I though
>> maybe you could give me hints about the best way to keep old VMs
>> working, as this likely affects any distribution. Obviously not
>> upgrading QEMU is not a solution :)
>>
>> The simplest seems to revert 82bf7ae84ce and this patch, but I
>> doubt this will be enough.
>>
>> Maybe there is some clever thing to do before reverting 82bf7ae84ce,
>> that could also benefit upstream, by doing something with versioned
>> machines? I have no idea (yet) how that work and if it could work.
> 
> Does just applying my series fix it?

But we are past soft-freeze so I'm looking for a surgical fix.

I'll send a partial revert for now.


