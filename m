Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C4C6BC9E8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjJd-0001en-D7; Thu, 16 Mar 2023 04:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pcjJb-0001eR-Ip; Thu, 16 Mar 2023 04:50:27 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pcjJW-0004U3-Vi; Thu, 16 Mar 2023 04:50:25 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MYvoW-1pyg1X2kBU-00Urzm; Thu, 16 Mar 2023 09:50:15 +0100
Message-ID: <3bfefc7f-a999-7679-d448-7e9eb4b4f9dd@vivier.eu>
Date: Thu, 16 Mar 2023 09:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] exec/memory: Fix kernel-doc warning
Content-Language: fr
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>
References: <20230315072552.47117-1-shentey@gmail.com>
 <49850BA4-972F-4177-A18B-8E9C65FA60E9@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <49850BA4-972F-4177-A18B-8E9C65FA60E9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zXatc7aOkDgSifjr9/iomOHi5PjD2s5fON2OV3wQx9JbGClH806
 +p1A826NyBW6W9w3R8RrC2QuXpyJeAWdRgilzaaVluzjsM6FoED4FQ6LtHww7EZbpnpTEt6
 HpQgamvRF2rbLv1V4EOr4GtgRBClY8GLs33YW6drTvQXmFtb3Eoo4HnJAZIDFHdzZqJ57AH
 pHWJZJA+x3gH/kJfpcy9Q==
UI-OutboundReport: notjunk:1;M01:P0:U93WCIY32c4=;RFDtUmtwacEYi64TXZU4TKSBZ4n
 XxsHWbxuIb68R1Zf8WWTLv/eE72y1YA6DORWU93VmuLrsVcQgOslDCSAyGyvSMVyGqN0hhZK8
 YPwQqnNm9oigI8eguleU/AIMJDVmDqb3kO2kEIeYzuTurJKxv5K4oxTu/yaj1C55OmVIcie+h
 UiZlWu6I7MSlSSmaDWzrpR/g6MExObqYqFE0nBWAW2CFhWOwNtOPr3XNI3zcJf9BUoVGV0Xa5
 jA+3g+NX8GTey/ZyHYbAn9A0QQtA3sh49zDhl/B/W8ag8aIWoQ+DpveqxVgYtaJSUp9VBLFlo
 8Sgr0pwj0vfQJ66/+Vg+RuW7Qjd99hvfJcKnkPXRR7D/nB+SePMT6GSfcC2SVywpcRJvQESip
 MADeaXHWVwT2TEQvySrXgIE4awCXoilj+MdjIdQSM6TPX0awBHSbqhF4l0+imF1sgqSZdDeT2
 3KBDc4QJHFHKLE5CwD1zWkGrs0+gMsjofkdhLnLW38+GSPgw0RD9NCP4bBjNwA6X3I8fjlxK4
 tuF7UYGRUReOsjCIojQvjXgFrs700t4XgASJ7s+lSmmT59uozabLkiengU5ekiTYX84dspV/m
 ofvrgdweOEZ/EAQCIBk0a+F0qGbZigUs3jmh2jAMqo7u14JM23S8E0kf6c4+iBJofmt/Y//aT
 WWrTnGwK6Eb4JfdCCJS0uF2Qjt15nEhzDFuOxpo//w==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 15/03/2023 à 08:57, Bernhard Beschow a écrit :
> + qemu-trivial
> 
> Am 15. März 2023 07:25:52 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>> During build the kernel-doc script complains about the following issue:
>>
>>   src/docs/../include/exec/memory.h:1741: warning: Function parameter or member 'n' not described in 'memory_region_unmap_iommu_notifier_range'
>>   src/docs/../include/exec/memory.h:1741: warning: Excess function parameter 'notifier' description in 'memory_region_unmap_iommu_notifier_range'
>>
>> Settle on "notifier" for consistency with other memory functions.
>>
>> Fixes: 7caebbf9ea53
>>        ("memory: introduce memory_region_unmap_iommu_notifier_range()")
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>> include/exec/memory.h | 2 +-
>> softmmu/memory.c      | 8 ++++----
>> 2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 6fa0b071f0..15ade918ba 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>>   *
>>   * @notifier: the notifier to be notified
>>   */
>> -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
>> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);
>>
>>
>> /**
>> diff --git a/softmmu/memory.c b/softmmu/memory.c
>> index 4699ba55ec..5305aca7ca 100644
>> --- a/softmmu/memory.c
>> +++ b/softmmu/memory.c
>> @@ -1996,17 +1996,17 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>>      }
>> }
>>
>> -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n)
>> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier)
>> {
>>      IOMMUTLBEvent event;
>>
>>      event.type = IOMMU_NOTIFIER_UNMAP;
>>      event.entry.target_as = &address_space_memory;
>> -    event.entry.iova = n->start;
>> +    event.entry.iova = notifier->start;
>>      event.entry.perm = IOMMU_NONE;
>> -    event.entry.addr_mask = n->end - n->start;
>> +    event.entry.addr_mask = notifier->end - notifier->start;
>>
>> -    memory_region_notify_iommu_one(n, &event);
>> +    memory_region_notify_iommu_one(notifier, &event);
>> }
>>
>> void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


