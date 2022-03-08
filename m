Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1764D2212
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:56:51 +0100 (CET)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfww-0005Zs-Jj
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfvH-0004qy-0c
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:55:07 -0500
Received: from [2607:f8b0:4864:20::536] (port=33309
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfvF-0001bH-EM
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:55:06 -0500
Received: by mail-pg1-x536.google.com with SMTP id 6so103910pgg.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cdUOIDCZsF1SVXJB4DwCSKtAYUbgeNQ3rV6hhpBmSsg=;
 b=QchIc3kuAOOEx/L6Hbn7WomSvZhomt+OSABYmGvBDZycN58nKDZgzV8CTFggtaxEHF
 1emHJbE78D8BCasURWxIBoPaKylKSFv4yb6TwfjZmezN45xh90F4pQEAhQDAq6ScbG3x
 hgeQ04/4iXsIxXtmLbslmHq/5xdtDzf5Aa/weQPZUIAzGvJ+MDeqqzdbbT5uCLNjogqQ
 Kjl2Ex0Bx4pGe4ao+wUS1iTQAxNtZEt/Nvl2Jz1e6lx+Dw2ViD5ftOg3uGewZtA4+0nB
 APZzkFYU2oh0ZLqe4ikKPe3TgRbZU/BSrYAG+scVjp2V66ob3JQFZi79sn4/Z5d8911Y
 DP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cdUOIDCZsF1SVXJB4DwCSKtAYUbgeNQ3rV6hhpBmSsg=;
 b=fKq+xsbo9QIsHxfLdhdQy4nCHgL0LF+hk4343Zz8laGnsSFS4RclYyPO8Xi72ZblQV
 6VeU5keyToJoEx4mS2Vf0WOid0diGpXf2gnWN+O4qYiN8zv+XTk+J/V7MLaoPWadE1UZ
 GlzdaDLzUHlnpwTXSDczgEYFM2eEQduEVY/0VMNT+VjWA0cItn2F6U7bWEKPOGi3h0ZD
 Vp6eFLs9FXE1GC6QOTKoXT1jqPBtEZ48vGsTwWv1IsV4SE1hgTQk5CzYxjetZ2HHwNgr
 8ROB2r0WM//h+kSYtZ46VyWk9/HjxCkKZuaOJndzHHI9aou1Tzc06/+ODV9Xo4VwqzMM
 xjxA==
X-Gm-Message-State: AOAM530R/T5Jt63gcR/UrjpksLXqs5kuygpwsiwneexPPZWJUxyVzN9l
 k1mr7WCGgfcgpF4ADQ38oOW8vw==
X-Google-Smtp-Source: ABdhPJyGXPgi6flKDA9QNdvsKboUbsCKesjgdEauXFIOIXKFZrTE6sDlAQWQT8z/FjZwVBZrzW07gA==
X-Received: by 2002:a63:465b:0:b0:374:642c:ab62 with SMTP id
 v27-20020a63465b000000b00374642cab62mr15855427pgk.187.1646769304115; 
 Tue, 08 Mar 2022 11:55:04 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 k7-20020a6555c7000000b0034e101ca75csm15791248pgs.6.2022.03.08.11.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:55:03 -0800 (PST)
Message-ID: <dee00b09-6bf3-fe55-e544-3cc45b6841f9@linaro.org>
Date: Tue, 8 Mar 2022 09:55:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 31/33] hw/nios2: Introduce Nios2MachineState
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-32-richard.henderson@linaro.org>
 <9462028f-3285-a399-4158-068aaaed28cf@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9462028f-3285-a399-4158-068aaaed28cf@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 22:39, Mark Cave-Ayland wrote:
>>   static void nios2_10m50_ghrd_init(MachineState *machine)
>>   {
>> +    Nios2MachineState *nms = NIOS2_MACHINE(machine);
>>       Nios2CPU *cpu;
>>       DeviceState *dev;
>>       MemoryRegion *address_space_mem = get_system_memory();
>> @@ -101,15 +109,29 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
>>       cpu->exception_addr = 0xc8000120;
>>       cpu->fast_tlb_miss_addr = 0xc0000100;
>> -    nios2_load_kernel(cpu, ram_base, ram_size, machine->initrd_filename,
>> +    nios2_load_kernel(cpu, ram_base, ram_size, nms->parent_obj.initrd_filename,
>>                         BINARY_DEVICE_TREE_FILE, NULL);
> 
> I think you should be able to keep this as machine->initrd_filename? Certainly there 
> should be no direct access to parent_obj here, and if you did need it a QOM cast macro 
> would be the way to do this.

Ok.

>> +static const TypeInfo nios2_10m50_ghrd_type_info = {
>> +    .name          = TYPE_NIOS2_MACHINE,
>> +    .parent        = TYPE_MACHINE,
>> +    .instance_size = sizeof(Nios2MachineState),
>> +    .class_size    = sizeof(MachineClass),
> 
> Technically you can drop .class_size here since this should be inherited automatically 
> from MachineClass.

Ok.  This is a leftover from an intermediate when Nios2MachineClass existed.


r~

