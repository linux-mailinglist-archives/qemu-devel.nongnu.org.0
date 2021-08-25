Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8193F7269
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:57:25 +0200 (CEST)
Received: from localhost ([::1]:36306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpeu-000763-22
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mIpeA-0006IC-9Z
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:56:38 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1mIpe7-0003Q3-6D
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:56:37 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gvh9N1d9Dzbh7m;
 Wed, 25 Aug 2021 17:52:40 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 17:56:30 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 25 Aug 2021 17:56:29 +0800
Subject: Re: [PATCH 2/5] msix: simplfy the conditional in
 msix_set/unset_vector_notifiers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <alex.williamson@redhat.com>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, 
 <pbonzini@redhat.com>
References: <20210825075620.2607-1-longpeng2@huawei.com>
 <20210825075620.2607-3-longpeng2@huawei.com>
 <e8e4e346-4235-8830-139c-2a4ad9cd1faf@redhat.com>
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Message-ID: <d57bda19-02e9-39f8-0be7-f91880ff7dfa@huawei.com>
Date: Wed, 25 Aug 2021 17:56:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8e4e346-4235-8830-139c-2a4ad9cd1faf@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.305,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: arei.gonglei@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/8/25 17:52, Philippe Mathieu-Daudé 写道:
> On 8/25/21 9:56 AM, Longpeng(Mike) wrote:
>> 'msix_function_masked' is kept pace with the device's config,
>> we can use it to replace the complex conditional in
>> msix_set/unset_vector_notifiers.
> 
> Typo 'simplfy' -> 'simplify' in this/previous patch subject.
> Ok.

>> poll_notifier should be reset to NULL in the error path in
>> msix_set_vector_notifiers, fix it incidentally.
> 
> I'd rather see this fix in a different patch, being
> unrelated to the msix_function_masked optimization.
>
Ok, will split in next version. Thanks.

>> Signed-off-by: Longpeng(Mike) <longpeng2@huawei.com>
>> ---
>>  hw/pci/msix.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
>> index ae9331c..8057709 100644
>> --- a/hw/pci/msix.c
>> +++ b/hw/pci/msix.c
>> @@ -592,8 +592,7 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>>      dev->msix_vector_release_notifier = release_notifier;
>>      dev->msix_vector_poll_notifier = poll_notifier;
>>  
>> -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
>> -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
>> +    if (!dev->msix_function_masked) {
>>          for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>>              ret = msix_set_notifier_for_vector(dev, vector);
>>              if (ret < 0) {
>> @@ -612,6 +611,7 @@ undo:
>>      }
>>      dev->msix_vector_use_notifier = NULL;
>>      dev->msix_vector_release_notifier = NULL;
>> +    dev->msix_vector_poll_notifier = NULL;
>>      return ret;
>>  }
>>  
>> @@ -622,8 +622,7 @@ void msix_unset_vector_notifiers(PCIDevice *dev)
>>      assert(dev->msix_vector_use_notifier &&
>>             dev->msix_vector_release_notifier);
>>  
>> -    if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
>> -        (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
>> +    if (!dev->msix_function_masked) {
>>          for (vector = 0; vector < dev->msix_entries_nr; vector++) {
>>              msix_unset_notifier_for_vector(dev, vector);
>>          }
>>
> 
> .
> 

