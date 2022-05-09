Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1334520479
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 20:27:09 +0200 (CEST)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no868-0000Ph-EO
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 14:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no84Z-0007uo-Ak
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:25:34 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no84X-0000E6-O4
 for qemu-devel@nongnu.org; Mon, 09 May 2022 14:25:31 -0400
Received: by mail-pj1-x102e.google.com with SMTP id o69so13875878pjo.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JhKQICekeDznD8Hmf1TvjqtQZ+j6Nh8BNRQFNTL2SIc=;
 b=HIfc7G2ZjsjwxX+6vOL0dc5TtuW3J6jVoNaQTFlr1dwsLjuqXKlAsYuseOLZK53FkH
 eDA28tOEQqKJyXcm5b3gxDRWy2ibDBzAlQrXXefuz4kDPYopxHpHN/XUdiHXjbN/BlHq
 5ZHED4x5GBmYsyuaylibNDiYAliFuDly26guLsQdpDLfDXo5pl4ngrBZq1gAhQPjUhQS
 KGCFgRz8DO45eXcS6CQ0qeqARb7ZlHo2y15kf0+fNSr5CHLTTvLWzqaV0NlP2kRiX2fX
 AIzPA6CQZYZ/hIpZIcoGsNKGIjj1JaBi3I3gt6bwFamXfoKiR5ATxN52neUWKKT9Mwcf
 EuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JhKQICekeDznD8Hmf1TvjqtQZ+j6Nh8BNRQFNTL2SIc=;
 b=dUrOKh3tHHQ2A2MzJ9Zh3bF1TMmVkn3+0eksu1ITNmMhJzAuIrvQEdpbq8tZMRhzSi
 iOb/UUE2wxJjBu+yDJDFAfQSuXjV42vkPqK8mW4WV4P+vdjB2oKLhTAaEPIK4BH+YzPt
 kJYAbPxea5PrJ0yhDxQxfFve+inJ5JimMqcVv/typ5340An7gHAM0uJUGpY2YCgBQzlk
 14Ln4Bt5y9p4lbhmIsp0WddxP0jW0gMG2b4YstQygpoTmUOiH3O8DtS58WkGZwG3CA4x
 50jr+NnNCXysGhOsFIV0FilW3ddNi0V5rXjT7RUyukYopNBnv3B92diA1b9kOILmKeAf
 sgsg==
X-Gm-Message-State: AOAM5339IPCxdwi+sH9TdNpRCpGvhOgQUnJ+E2XHSKULKumX7QdFGw9i
 r9LGmi/MV8UKpVhhCGHqi3VWJQ==
X-Google-Smtp-Source: ABdhPJwqxnpA34cZeEHeL29GJycmpBlXLCuozEuy2qyQgTqL4TET4+a/BIFYZ5Z4M0lliX/bptp8Gg==
X-Received: by 2002:a17:902:f708:b0:153:839f:bf2c with SMTP id
 h8-20020a170902f70800b00153839fbf2cmr17389961plo.113.1652120727636; 
 Mon, 09 May 2022 11:25:27 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a636807000000b003c14af505f4sm2137395pgc.12.2022.05.09.11.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 11:25:27 -0700 (PDT)
Message-ID: <402096bf-2a89-311e-6174-eac63b78f74a@linaro.org>
Date: Mon, 9 May 2022 11:25:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
 <CAFEAcA8y-ZVeEHDXUv2bAwKL9EumTmrJ-Xz1r23C7Lm0yajBdQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8y-ZVeEHDXUv2bAwKL9EumTmrJ-Xz1r23C7Lm0yajBdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 5/9/22 13:04, Peter Maydell wrote:
> On Mon, 9 May 2022 at 18:56, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> I'm not 100% sure how this "Other configuration control register" should be handled, but
>> definitely not like this.
>>
>> I see you're putting control of this register into loongarch_qemu_read in
>> target/loongarch/cpu.c.  Which, I suppose is fair, because this is documented as part of
>> the 3A5000 cpu documentation.  But then you split out all of the devices which are *also*
>> documented as part of the cpu into the board configuration.
>>
>> This reminds me of the memory-mapped interface that the armv7m cpu has with its own
>> registers.  I believe that you need to model this similarly, where you will have a device
>> that represents the cpu, and then instantiates all of the devices that are listed in the
>> Loongson 3A5000 TRM -- call this ls3a to match the ls7a name you have for the 7A1000
>> bridge device.
>>
>> When there is a write to the ls3a "Other function configuration register", the ls3a will
>> need to communicate the changes to the various bits to its various sub-devices.  I do not
>> think it unreasonable to have direct function calls between the components.
>>
>> Peter, do you have any advice from the armv7m side?
> 
> Nothing concrete. I'm not sure that we'd structure the armv7m stuff the way
> we have now if we were writing it from scratch, but it's functional enough.
> (In particular, if MMIO regions were part of Device rather than SysBusDevice
> then I'd be tempted to suggest that CPUs with MMIO-mapped registers should
> directly own their MemoryRegions for them. But they aren't, so we can't do
> that.)

Having thought about this a little more, I believe that these registers are part of the 
"cpu package", because they are shared between the 4 cpu cores within the package.  Thus 
their current placement attached to LoongArchCPU -- as well as the current placement of 
address_space_iocsr -- is incorrect.


r~

