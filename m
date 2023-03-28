Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175946CC815
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:34:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phCGf-0007GU-Q0; Tue, 28 Mar 2023 12:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1phCGd-0007GE-B9
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:33:51 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1phCGb-0002Y3-Mc
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:33:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso13217943pjb.2
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680021228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NUCoPdHc5msrLgyx+fL5Dq3xZZLlMnC9z0vZ3CQnMoU=;
 b=PcO2u72LkF+Bm1kCnBQOW2FI6WNG1SbozhsEDBzJpSkxZB9I9EARYnCJ/xfF+Or3Sm
 oiDEo09T2/vpAMmambh73vS1LqpARMY3BYph2lFpYSPXdYs45Bzv+bV/Z5Jqyc5qg9s+
 bw8lPjRMCl0tXsmAvApGlb3TTKnsLVFBl8JEolcLCpWri/EJXyVz1Kc3Azg1cQ8x6FsN
 H+h7Q/jNm7xQffjsuEADXvxbgTeJnrbJ6MGBFT3E32xbVuLPsk3Ekzotbnz5k2UJyGEB
 xZPrKRhTbvevj217aP2nAninj/54XrNY6TJ7FGn42GzWYa28+pAb6UT7y5ihFLpduAUb
 hZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680021228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NUCoPdHc5msrLgyx+fL5Dq3xZZLlMnC9z0vZ3CQnMoU=;
 b=bsW95/BVeoPZgeJ8LVYh5HJ5OharevSS8PSLhwFze4DYyHpjTANQ+dhgWg/dsi/pzv
 LYmvMHU31aT1f1Acb6Z7ZZ574jphqxz+rSmbI0eGEofWgctaW+5AmW3gb/YRBmldL+QG
 HwaYixh10D7unqlVECs2a5etzOaqcRWH3D5m6+6ttfdJm+OxmdJo5akVER/iuQPAIv1B
 pJDKrK5uQqEnMjdussp+7LAwhujbhiGnlqNsBaD04pCuOth4FcQnee+wFAwXaQW9eRE3
 AHljO9wpGAnHb6fJik+5uS1O/uX8XPti7/RWaL59i+NGhuVFvqY+muihQbacAlLBP/Zl
 RGbw==
X-Gm-Message-State: AAQBX9ckVyOChh4WrH/+BdOKTilgZNtp6gO/o0DTaV/bgod22Tity/JY
 ySKkOV3voSeGx1ClvB1PiUM=
X-Google-Smtp-Source: AKy350Y7df4XiYJ+yeU9up3eTZvBYMRJzkvrBdlOEpHc8nynaZYJKVfi4el3U4FlkWCfi3d573Ke8A==
X-Received: by 2002:a17:90b:3b90:b0:23d:500f:e826 with SMTP id
 pc16-20020a17090b3b9000b0023d500fe826mr17202061pjb.14.1680021227803; 
 Tue, 28 Mar 2023 09:33:47 -0700 (PDT)
Received: from [192.168.0.115] ([113.173.97.170])
 by smtp.gmail.com with ESMTPSA id
 jj11-20020a170903048b00b0019f1222b9f6sm21398357plb.154.2023.03.28.09.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 09:33:47 -0700 (PDT)
Message-ID: <2fa1ed57-76ff-bea0-d0df-e3fa32d422f5@gmail.com>
Date: Tue, 28 Mar 2023 23:33:42 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/5] i386/tcg: implement x2APIC registers MSR access
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S . Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230326052039.33717-1-minhquangbui99@gmail.com>
 <20230326052039.33717-2-minhquangbui99@gmail.com>
 <d04ebc4920c336dd6dc87ae0e1e25693b40d6e4d.camel@infradead.org>
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <d04ebc4920c336dd6dc87ae0e1e25693b40d6e4d.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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

On 3/27/23 23:56, David Woodhouse wrote:
> On Sun, 2023-03-26 at 12:20 +0700, Bui Quang Minh wrote:
>>
>> +static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>> +                           unsigned size)
>> +{
>> +    int index = (addr >> 4) & 0xff;
>> +
>> +    if (size < 4) {
>> +        return;
>> +    }
>> +
>> +    if (addr > 0xfff || !index) {
>> +        /* MSI and MMIO APIC are at the same memory location,
>> +         * but actually not on the global bus: MSI is on PCI bus
>> +         * APIC is connected directly to the CPU.
>> +         * Mapping them on the global bus happens to work because
>> +         * MSI registers are reserved in APIC MMIO and vice versa.
>> */
>> +        MSIMessage msi = { .address = addr, .data = val };
>> +        apic_send_msi(&msi);
>> +        return;
>> +    }
> 
> I know you're just moving this bit around, but note that it means we
> *can't* implement the 15-bit MSI trick as things stand, because those
> extra 7 bits end up in bits 4-11 of the address, and that means the
> 'addr > 0xfff' check isn't correct any more.
> 
> However, that's only relevant in X2APIC mode... and there's no MMIO
> access to registers in X2APIC mode. So the check could perhaps become
> something like...
> 
>      DeviceState *apic = cpu_get_current_apic();
>      if (!apic || is_x2apic_mode(apic) || addr > 0xfff || !index) {
>          /* MSI and MMIO APIC are at the same memory location,
>           * but actually not on the global bus: MSI is on PCI bus
>           * APIC is connected directly to the CPU.
>           * Mapping them on the global bus happens to work because
>           * MSI registers are reserved in xAPIC MMIO and vice versa.
>           * In X2APIC mode, there is no MMIO and bits 4-11 of the
>           * address *might* be used to encode the extended dest ID.
>           */
> 
>          MSIMessage msi = ...

In my opinion, I think the with the emulated interrupt remap hardware we 
don't need to do MSI trick. The behavior is the same with real hardware, 
in order to use x2APIC an interrupt remap hardware is required, the OS 
will configure the interrupt source (IOxAPIC, MSI-capable) to use the 
remappable format for interrupt request.

