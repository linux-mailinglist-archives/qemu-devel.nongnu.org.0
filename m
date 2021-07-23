Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D983D3178
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 03:58:49 +0200 (CEST)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6kSe-0004WY-V3
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 21:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6kRJ-0003qx-T6
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 21:57:25 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6kRH-0006TB-A1
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 21:57:25 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GWC4j6gclz7x8g;
 Fri, 23 Jul 2021 09:52:37 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 09:57:15 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 09:57:15 +0800
Subject: Re: [PATCH for-6.1 v2] machine: Disallow specifying topology
 parameters as zero
To: Cleber Rosa <crosa@redhat.com>
References: <20210722154326.1464-1-wangyanan55@huawei.com>
 <20210722154326.1464-2-wangyanan55@huawei.com>
 <874kcm0ywx.fsf@p50.localhost.localdomain>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <38c23728-e2b4-cbd2-450f-ed4c95c7fba4@huawei.com>
Date: Fri, 23 Jul 2021 09:57:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <874kcm0ywx.fsf@p50.localhost.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,

On 2021/7/23 6:25, Cleber Rosa wrote:
> Yanan Wang writes:
>
>> In the SMP configuration, we should either specify a topology
>> parameter with a reasonable value (equal to or greater than 1)
>> or just leave it omitted and QEMU will calculate its value.
>> Configurations which explicitly specify the topology parameters
>> as zero like "sockets=0" are meaningless, so disallow them.
>>
>> However, the commit 1e63fe685804d
>> (machine: pass QAPI struct to mc->smp_parse) has documented that
>> '0' has the same semantics as omitting a parameter in the qapi
>> comment for SMPConfiguration. So this patch fixes the doc and
>> also adds the corresponding sanity check in the smp parsers.
>>
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine.c | 14 ++++++++++++++
>>   qapi/machine.json |  6 +++---
>>   qemu-options.hx   | 12 +++++++-----
>>   3 files changed, 24 insertions(+), 8 deletions(-)
> Hi Yanan,
>
> This looks somewhat similar to this very old patch of mine:
>
>     https://mail.gnu.org/archive/html/qemu-devel/2020-10/msg03039.html
>
> I'm putting a reference here because I believe the test can be salvaged
> and slightly adapted for this patch of yours.
>
> Let me know if I can help anyhow.
>
Thanks for this.
I was introducing an unit test for the smp parsing in [1], in which all
possible valid and invalid smp configs were covered, and actually the
"parameter=0" stuff was also covered. You can have a look, and
suggestions are welcome. I'm not sure we need two different tests
for the same part. :)

[1] 
https://lore.kernel.org/qemu-devel/20210719032043.25416-12-wangyanan55@huawei.com/

Thanks,
Yanan
.


