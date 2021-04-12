Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC7535C4B7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 13:09:33 +0200 (CEST)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVuRg-0006Yv-Aa
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 07:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lVuPs-00067R-Rt
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 07:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lVuPp-0004tH-D8
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 07:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618225653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nBG54eK6SlAUo9fN0GRaiFEIALsZd54u0tCkbV18BnY=;
 b=hQKZiacpZuhC7r2Nkb5HIUqqN3L9ByUNkze8PDOHPTfsweu2PWjHT29F10uqIwR7SxdS51
 nqyTnfPoCB3NO/LHSnPmcRSXpJQ2u5/jfWKuOTctj4VTU382QC9oHla4qb8I1PONBPcWlL
 OF84hPzJzvVgpsUWN3m0XodJUtF0rJg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-J3a4I1RxPF2Xj5QZ6LDGzg-1; Mon, 12 Apr 2021 07:07:31 -0400
X-MC-Unique: J3a4I1RxPF2Xj5QZ6LDGzg-1
Received: by mail-wr1-f72.google.com with SMTP id h30so5893349wrh.10
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 04:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nBG54eK6SlAUo9fN0GRaiFEIALsZd54u0tCkbV18BnY=;
 b=E6ZMBXA9DpGRXucnel67A9A95+Lgt8vcbXkqa2ED0HrxJDPBGAZvGIIJmxlJkENJtr
 2FsnKdm9Yw2SxpflqtAjnvFf+jdIk8GidwNih2vZhgeHpWSDuXMNR31NL+WGRk+fn0m/
 ZmKrZOceRaWJU4sm+L/4HTaBr6d1a0nH9U5M6Fxu5fYiu4q9v0JYqWH627VLYNWi9nIL
 H1yhsalYU2tHdUH6/tMmu2+CZh088gYVVXd3msAT+WufCVnvwagW9fLEwL7S9Mszwk82
 zlwQvG5xFy8ah+tHiytIAMOF5u0fAauJgIsQoAvSNdD1+9qtLE+KPbXgYkpUOBS6Y72P
 Lprw==
X-Gm-Message-State: AOAM533c+uaKRr7LQHep2Oob4OleNAlERRgXcf5WmQxvh2+00AJv8EZO
 BA9gVtnDLmwcFdCyqa99HUnghtS3sKDrdSKK6YD8Ckr/XLLT/MZEvH2w6qCX1iT8G3d5kXrOkWA
 UL2NUJFKyyZYn87w=
X-Received: by 2002:adf:a703:: with SMTP id c3mr31220400wrd.72.1618225650507; 
 Mon, 12 Apr 2021 04:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxoSc3LuQ50VLpRMmBmSbTY41fsgS2x00WT8mMcmcFtjK7SwmZiJ0U9lx4ze+rS+pQJVkWnA==
X-Received: by 2002:adf:a703:: with SMTP id c3mr31220379wrd.72.1618225650341; 
 Mon, 12 Apr 2021 04:07:30 -0700 (PDT)
Received: from [192.168.1.36] (63.red-83-51-208.dynamicip.rima-tde.net.
 [83.51.208.63])
 by smtp.gmail.com with ESMTPSA id a15sm16271960wrr.53.2021.04.12.04.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 04:07:29 -0700 (PDT)
Subject: Re: [PATCH-for-6.0] hw/mem/meson: Fix linking sparse-mem device with
 fuzzer
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210406133944.4193691-1-philmd@redhat.com>
 <20210406143928.shfhgsdupbjqgohc@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <31e0de30-c461-33d5-9f12-0f2505aed049@redhat.com>
Date: Mon, 12 Apr 2021 13:07:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406143928.shfhgsdupbjqgohc@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 4/6/21 4:39 PM, Alexander Bulekov wrote:
> On 210406 1539, Philippe Mathieu-Daudé wrote:
>> sparse-mem.c is added to the 'mem_ss' source set, which itself
>> is conditionally added to softmmu_ss if CONFIG_MEM_DEVICE is
>> selected.
>> But if CONFIG_MEM_DEVICE isn't selected, we get a link failure
>> even if CONFIG_FUZZ is selected:
>>
>>   /usr/bin/ld: tests_qtest_fuzz_generic_fuzz.c.o: in function `generic_pre_fuzz':
>>   tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to `sparse_mem_init'
>>   clang-10: error: linker command failed with exit code 1 (use -v to see invocation)
>>
>> Fix by adding sparse-mem.c directly to the softmmu_ss set.
>>
>> Fixes: 230376d285b ("memory: add a sparse memory device for fuzzing")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Oops..
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
>> ---
>>  hw/mem/meson.build | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
>> index ef79e046787..3c8fdef9f9e 100644
>> --- a/hw/mem/meson.build
>> +++ b/hw/mem/meson.build
>> @@ -1,8 +1,9 @@
>>  mem_ss = ss.source_set()
>>  mem_ss.add(files('memory-device.c'))
>> -mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>>  
>>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
>> +
>> +softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>> -- 
>> 2.26.3
>>
>>
> 


