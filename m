Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A24227A9B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 10:25:06 +0200 (CEST)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxnaD-0005hC-C1
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 04:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jxnZT-0005Hs-Vw
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 04:24:20 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:37937
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jxnZS-0006VL-3Y
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 04:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595319857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=16jSyxv2sA5h3PIqny5QjEy+y77fugkHOSzWreHnQYE=;
 b=JK1iXKUrbq5c8bgUD4xVR5hdUXChjLGPz9jXQ3iT6bLoN76V2K1VT4GGK9LnLEf9jUk0Bi
 mo1tuh8DgN9ZYzTa7TiQmMfkMK6HIHu6OxGDlYXgvri5tuHsxMjhYs6Q0t4UVls+eEnmWi
 TQbkibPQPqkVbNUvxhCU57j8sA8DctY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-SBhJg0CROZWsGjd0Biny7A-1; Tue, 21 Jul 2020 04:24:13 -0400
X-MC-Unique: SBhJg0CROZWsGjd0Biny7A-1
Received: by mail-wm1-f72.google.com with SMTP id v6so716880wmg.1
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 01:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=16jSyxv2sA5h3PIqny5QjEy+y77fugkHOSzWreHnQYE=;
 b=fstczex2kWLkhAEaoq6nh9NpAQHdm35M4NOh1ajRf7T4MlAzfxc67Uo/B2iU2z9avE
 RJtv+4TlReTxr9dqc3rJkh675H97APFPXGuL/94RAW6GLJd83xyPOX7aeEUo3SnngcA2
 2+VYyOAPMz/OXbQKQIFDgXlfcV4XXSiBxD37wiSgJMh8ZOX5OmjmP/4oS4cPZzfjqyBb
 nl5ClpWZGLb7Ett7bYHojjlQWzK5eYxbyKb3kjhiZ1nm23McKp0Or/LDDhpxFCHwRKDt
 /QHhRs6VscMEiy34rmo1Ac3k5YlsO7lubsAdlm/lPIfTjfGbuVWgfIwcB8x82mXe/Fbc
 p90w==
X-Gm-Message-State: AOAM531wc/g6T3IEmoTGam5c45kbBivqQc62Jq1Q5J/7jUPIFnDYTwEO
 VeVc1NzoC8wTBtX2jYcuv80jo7BDYMB+vkkvbEMkAGimabLPfGoLfHIB0qc2OyEesrM5C7X9zun
 Xu8rFpEV2/g65ir4=
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr2813603wmf.87.1595319852316; 
 Tue, 21 Jul 2020 01:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWDjTndqfz6L7V0INjyBMYdnkO0RgAByKg1drKgAEFmcwDFbDuDnBCIXq2T+2PlB0ZWyY8Qw==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr2813584wmf.87.1595319852078; 
 Tue, 21 Jul 2020 01:24:12 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 22sm2686891wmb.11.2020.07.21.01.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 01:24:11 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] prep: add ppc-parity write method
To: Li Qiang <liq3ea@gmail.com>, P J P <ppandit@redhat.com>
References: <20200624185523.762240-1-ppandit@redhat.com>
 <20200624185523.762240-5-ppandit@redhat.com>
 <CAKXe6SJy0Pocgd2EuF6jfdOn8AN4xFmzepgJMgKK=x-ouA5JQA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <c2b078bd-1625-7f6f-1457-20e684104789@redhat.com>
Date: Tue, 21 Jul 2020 10:24:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SJy0Pocgd2EuF6jfdOn8AN4xFmzepgJMgKK=x-ouA5JQA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 03:39:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Lei Sun <slei.casper@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/20 1:22 PM, Li Qiang wrote:
> P J P <ppandit@redhat.com> 于2020年6月25日周四 上午3:00写道：
>>
>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>
>> Add ppc-parity mmio write method to avoid NULL pointer dereference
>> issue.
>>
>> Reported-by: Lei Sun <slei.casper@gmail.com>
>> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> ---
>>  hw/ppc/prep_systemio.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> Update v2: use LOG_GUEST_ERROR
>>   -> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg04975.html
>>
>> diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
>> index bbc51b6e9a..03a2f8af6e 100644
>> --- a/hw/ppc/prep_systemio.c
>> +++ b/hw/ppc/prep_systemio.c
>> @@ -23,6 +23,7 @@
>>   */
>>
>>  #include "qemu/osdep.h"
>> +#include "qemu/log.h"
>>  #include "hw/irq.h"
>>  #include "hw/isa/isa.h"
>>  #include "hw/qdev-properties.h"
>> @@ -235,8 +236,15 @@ static uint64_t ppc_parity_error_readl(void *opaque, hwaddr addr,
>>      return val;
>>  }
>>
>> +static void ppc_parity_error_writel(void *opaque, hwaddr addr,
>> +                                    uint64_t data, unsigned size)
>> +{
>> +    qemu_log_mask(LOG_GUEST_ERROR, "%s not implemented\n", __func__);
>> +}
> 
> I'm not familiar with this platform-related stuff. I think a
> 'qemu_log_mask(LOG_UNIMP, xxx)' is ok.

No. The message is indeed confusing, as Prasad mixed GuestError
VS UnimplementedFeature.

Guest should not write the the error parity registers (I suppose
they are read-only). If it does, the hardware won't behave
incorrectly, it will just ignore the invalid accesses. We want
to report an incorrect guest behavior (why is the guest code
trying to do that?). Also, we will never implement this.
We usually use something like:

  qemu_log_mask(LOG_GUEST_ERROR,
                "%s: Illegal write to read-only register "
                "(size %u, offset 0x%"HWADDR_PRIx","
                " value 0x04%"PRIx64")\n",
                __func__, size, addr, data);

> 
> Thanks,
> Li Qiang
> 
>> +
>>  static const MemoryRegionOps ppc_parity_error_ops = {
>>      .read = ppc_parity_error_readl,
>> +    .write = ppc_parity_error_writel,
>>      .valid = {
>>          .min_access_size = 4,
>>          .max_access_size = 4,
>> --
>> 2.26.2
>>
> 


