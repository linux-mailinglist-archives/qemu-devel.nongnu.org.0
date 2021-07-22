Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991DE3D2261
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 13:02:54 +0200 (CEST)
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6WTd-0002Ar-MQ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 07:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6WQw-0008Rc-Rz
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:00:06 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6WQp-0003Nc-Vu
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 07:00:06 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GVqBP5DPQz7xKJ;
 Thu, 22 Jul 2021 18:56:13 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 18:59:53 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 18:59:53 +0800
Subject: Re: [PATCH for-6.1 0/1] machine: Disallow specifying topology
 parameters as zero
To: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>
References: <20210722021512.2600-1-wangyanan55@huawei.com>
 <87y29y7uon.fsf@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <ee4bc77f-cd2b-f2ff-1f43-82a23aea1735@huawei.com>
Date: Thu, 22 Jul 2021 18:59:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87y29y7uon.fsf@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/22 14:02, Cornelia Huck wrote:
> On Thu, Jul 22 2021, Yanan Wang <wangyanan55@huawei.com> wrote:
>
>> In the SMP configuration, we should either specify a topology
>> parameter with a reasonable value (equal to or greater than 1)
>> or just leave it omitted and QEMU will calculate its value.
>> Configurations which explicitly specify the topology parameters
>> as zero like "sockets=0" are meaningless, so disallow them.
>>
>> However; the commit 1e63fe685804d
>> (machine: pass QAPI struct to mc->smp_parse) has documented that
>> '0' has the same semantics as omitting a parameter in the qapi
>> comment for SMPConfiguration. So this patch fixes the doc and
>> also adds the corresponding sanity check in the smp parsers.
> Are we expecting any real users to have used that 'parameter=0'
> behaviour? I expect that libvirt and other management software already
> did the right thing; unfortunately, sometimes weird configuration lines
> tend to persist in search results.
I think there may not any users who have already used a configuration
with explicit "parameter=0", instead it should have been just omitted.
Yes, libvirt now rejects "parameter=0" when parsing XML, but we now
still allows "parameter=0" in the direct QEMU cmdlines. If we hope to
disallow this kind of config thoroughly, we'd better also have a sanity
check in QEMU.

Thanks,
Yanan
>> This patch originly comes form [1], and it was suggested that
>> this patch fixing the doc should be sent for 6.1 to avoid a
>> deprecation process in the future.
>>
>> [1] https://lore.kernel.org/qemu-devel/YPWsThPiZa3mF+zp@redhat.com/
>>
>> Yanan Wang (1):
>>    machine: Disallow specifying topology parameters as zero
>>
>>   hw/core/machine.c | 30 ++++++++++++++++++++++--------
>>   hw/i386/pc.c      | 33 ++++++++++++++++++++++++---------
>>   qapi/machine.json |  6 +++---
>>   3 files changed; 49 insertions(+); 20 deletions(-)
> .


