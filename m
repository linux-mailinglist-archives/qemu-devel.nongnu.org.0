Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB955EA71F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:27:58 +0200 (CEST)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oco9N-0007c5-5g
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocnzA-00053d-8T
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:17:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocnz7-0002EZ-2B
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664198240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nwm3H1a+y6Q/ANNgSpk2UwQQMq3N5bRTe9xIUQIog9Y=;
 b=PenIDXHRSwnVgRsv9QDGLcPmTgeIsoPpfCsQ6fCW2G/S82B4/mVxstUl96PlbdUMUixMQq
 XDPZy5K5+7bcQYNsyfnU6q9nVcPJ4ILt7eWsEQRMT4b6D6pViT/aB1m1ng/CmRVqf7KWZ/
 AvbWJrxFfpsQP/myJZJ9WiD34aE43aM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-rCRpZZcmO8yFSef119eqAA-1; Mon, 26 Sep 2022 09:17:19 -0400
X-MC-Unique: rCRpZZcmO8yFSef119eqAA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u27-20020adfa19b000000b0022863c08ac4so1180670wru.11
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Nwm3H1a+y6Q/ANNgSpk2UwQQMq3N5bRTe9xIUQIog9Y=;
 b=TaQQzZtEsfpZFu3LbkMIroYuEYlkCH12kRbx7KthBn5ihay4ZBT8u7c0IewfbrBk3O
 gHunSGQKOUEdU2NsFbF//u5iYMWJDdrrKHl5SZ52RWY9nfST5AlBRPw/zelOnC1y75yS
 ZXdqvmRXa+pDTq++yNnUN3nqVIN1FhunkTryQeT5BIKAJVZHRJd7+jFUDgHr3T4jG+Vz
 bXSDs2Rk4rz0rXInW8QLchbUaeuhoGBa6NTX3f/oSIQ42wGt8h4Z1Jh++Gx7Tj8vRZLs
 A8o0uQzBlleyf3DJmWIGc9cr+1awZc2It8IrExC/mePI82heZ6X2GUhTeyqLofTYSExc
 5IYw==
X-Gm-Message-State: ACrzQf0fV/XwxB+F8SIGrU05DcHycZ/dOdJolTjzO6wNWG0ROLUyX5iK
 9q/UqVgrQCowAcJhkk2LpTw7NJSnRPcmP4/OwsmZDjr8jKWI2n4FB3a8OzgPGHCKAk0VKmwuV+/
 TDIXE7EcD2dUi7Ao=
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id
 fc11-20020a05600c524b00b003b48c0cf3b6mr22702586wmb.50.1664198237823; 
 Mon, 26 Sep 2022 06:17:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6JPkDV3BwAL1numipwCic6J57G+v6rsRrYWROByh5F54wlFjI9rrpuHy0oiftYbpo28VhQ4g==
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id
 fc11-20020a05600c524b00b003b48c0cf3b6mr22702546wmb.50.1664198237404; 
 Mon, 26 Sep 2022 06:17:17 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-251.web.vodafone.de.
 [109.43.177.251]) by smtp.gmail.com with ESMTPSA id
 bv4-20020a0560001f0400b00228d6bc8450sm15811081wrb.108.2022.09.26.06.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 06:17:16 -0700 (PDT)
Message-ID: <02e8a1a1-ab58-4122-af80-472e50ecec0c@redhat.com>
Date: Mon, 26 Sep 2022 15:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 1/8] linux-headers: update to 6.0-rc3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Chenyi Qiang <chenyi.qiang@intel.com>
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org, "Daniel P. Berrange" <berrange@redhat.com>,
 alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, mst@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
 <20220902172737.170349-2-mjrosato@linux.ibm.com>
 <597a2761-f718-4a2c-c012-a0d25bf3c7fb@redhat.com>
 <CAFEAcA-8zWssi4TVF5TvHet9gxNkRvNreW6-hmTR0DgOu53Msw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-8zWssi4TVF5TvHet9gxNkRvNreW6-hmTR0DgOu53Msw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 26/09/2022 14.56, Peter Maydell wrote:
> On Mon, 26 Sept 2022 at 13:53, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 02/09/2022 19.27, Matthew Rosato wrote:
>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>> ---
>> ...
>>> diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
>>> index bf6e96011d..46de10a809 100644
>>> --- a/linux-headers/asm-x86/kvm.h
>>> +++ b/linux-headers/asm-x86/kvm.h
>>> @@ -198,13 +198,13 @@ struct kvm_msrs {
>>>        __u32 nmsrs; /* number of msrs in entries */
>>>        __u32 pad;
>>>
>>> -     struct kvm_msr_entry entries[0];
>>> +     struct kvm_msr_entry entries[];
>>>    };
>>
>> Yuck, this fails to compile with Clang:
>>
>>    https://gitlab.com/thuth/qemu/-/jobs/3084427423#L2206
>>
>>    ../target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
>> type 'struct kvm_msrs' not at the end of a struct or class is a GNU
>> extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
>>           struct kvm_msrs info;
>>                           ^
>>
>> Anybody any ideas how to fix this best? Simply disable the compiler warning
>> in QEMU?
> 
> There's already a patchset on list that does that:
> https://patchew.org/QEMU/20220915091035.3897-1-chenyi.qiang@intel.com/

Perfect, that's exactly what I need, thanks! I'll add those patches to my queue.

  Thomas


