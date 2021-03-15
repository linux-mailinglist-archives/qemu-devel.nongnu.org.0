Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB12933B2BD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:29:14 +0100 (CET)
Received: from localhost ([::1]:35644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmLQ-0004Bo-86
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLm8x-0004rv-52
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:16:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lLm8t-0005bh-N1
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615810573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMIzIREFwPGUgwGpmkAZQqLD+/prQVdTXrKYpiofRYU=;
 b=INC+0PgrP3epDVaQT78n7i1IuJJNpQpnYvBc5PZ/fwW1vfnZo7kYmRP7gjTWLmPh93g5Y3
 bd3pSUSBycIbOEo/GAJ0W2rWxela/Jt3vomvE3R6LMEWj+zfBF/EpTqmhh9LMSi7tuyXnS
 BLHxbVO8vQggmiGpT4W52t6lIKoTDvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-ZyCv3f_dO16CqQW6galkSw-1; Mon, 15 Mar 2021 08:16:10 -0400
X-MC-Unique: ZyCv3f_dO16CqQW6galkSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B362C100541F;
 Mon, 15 Mar 2021 12:16:08 +0000 (UTC)
Received: from [10.36.112.200] (ovpn-112-200.ams2.redhat.com [10.36.112.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB4C719701;
 Mon, 15 Mar 2021 12:16:02 +0000 (UTC)
Subject: Re: [PATCH v3 4/4] acpi: Set proper maximum size for "etc/acpi/rsdp"
 blob
To: Igor Mammedov <imammedo@redhat.com>
References: <20210304105554.121674-1-david@redhat.com>
 <20210304105554.121674-5-david@redhat.com>
 <20210315125403.68ef8925@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <23d57ebe-32aa-b535-e0cd-c3af6232bca8@redhat.com>
Date: Mon, 15 Mar 2021 13:16:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315125403.68ef8925@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.03.21 12:54, Igor Mammedov wrote:
> On Thu,  4 Mar 2021 11:55:54 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>> Let's also set a maximum size for "etc/acpi/rsdp", so the maximum
>> size doesn't get implicitly set based on the initial table size. In my
>> experiments, the table size was in the range of 22 bytes, so a single
>> page (== what we used until now) seems to be good enough.
>>
>> Now that we have defined maximum sizes for all currently used table types,
>> let's assert that we catch usage with new tables that need a proper maximum
>> size definition.
>>
>> Also assert that our initial size does not exceed the maximum size; while
>> qemu_ram_alloc_internal() properly asserts that the initial RAMBlock size
>> is <= its maximum size, the result might differ when the host page size
>> is bigger than 4k.
>>
>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>> Cc: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   hw/acpi/utils.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
>> index f2d69a6d92..0c486ea29f 100644
>> --- a/hw/acpi/utils.c
>> +++ b/hw/acpi/utils.c
>> @@ -29,14 +29,19 @@
>>   MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>>                                   GArray *blob, const char *name)
>>   {
>> -    uint64_t max_size = 0;
>> +    uint64_t max_size;
> [...]
>> +    } else {
>> +        g_assert_not_reached();
>>       }
>> +    g_assert(acpi_data_len(blob) <= max_size);
> 
> though it's correct,
> but theoretically compiler might get unhappy about uninitialized max_size here
> 
> though if it compiles fine with our current CI it should be good enough

I think the compiler will respect g_assert_not_reached() as intended and 
suppress warnings.

For example, see block/qed.c:qed_aio_write_data() where be don't have a 
return statement on g_assert_not_reached() exit paths.

-- 
Thanks,

David / dhildenb


