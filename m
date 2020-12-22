Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CA2DA886
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 08:30:50 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp4nJ-000144-R9
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 02:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kp4lD-0008Lp-Kg
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 02:28:39 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kp4l5-0002rd-1x
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 02:28:39 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cw8wv4jzLzhsVV;
 Tue, 15 Dec 2020 15:27:43 +0800 (CST)
Received: from [10.174.186.51] (10.174.186.51) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 15:28:05 +0800
Subject: Re: [PATCH v3 00/18] Support Multifd for RDMA migration
From: Zheng Chuan <zhengchuan@huawei.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1602908748-43335-1-git-send-email-zhengchuan@huawei.com>
 <2ea09ca2cc8c494390b506877f6e5e2c@huawei.com>
 <d9a87b5a-f524-fd79-6e11-f95430a4c29f@huawei.com>
 <20201023190214.GR3038@work-vm>
 <64f2dcf4-8ccd-e8d3-f279-7170b1fadf92@huawei.com>
Message-ID: <9e8ba8e6-b027-7291-3305-b993cac881f9@huawei.com>
Date: Tue, 15 Dec 2020 15:28:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <64f2dcf4-8ccd-e8d3-f279-7170b1fadf92@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhengchuan@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: yubihong <yubihong@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Xiexiangyou <xiexiangyou@huawei.com>,
 "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "wanghao \(O\)" <wanghao232@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Dave.

Since qemu 6.0 is open and some patches of this series have been reviewed, might you have time to continue reviewing rest of them ?

On 2020/10/25 10:29, Zheng Chuan wrote:
> 
> 
> On 2020/10/24 3:02, Dr. David Alan Gilbert wrote:
>> * Zheng Chuan (zhengchuan@huawei.com) wrote:
>>>
>>>
>>> On 2020/10/21 17:25, Zhanghailiang wrote:
>>>> Hi zhengchuan,
>>>>
>>>>> -----Original Message-----
>>>>> From: zhengchuan
>>>>> Sent: Saturday, October 17, 2020 12:26 PM
>>>>> To: quintela@redhat.com; dgilbert@redhat.com
>>>>> Cc: Zhanghailiang <zhang.zhanghailiang@huawei.com>; Chenzhendong (alex)
>>>>> <alex.chen@huawei.com>; Xiexiangyou <xiexiangyou@huawei.com>; wanghao
>>>>> (O) <wanghao232@huawei.com>; yubihong <yubihong@huawei.com>;
>>>>> fengzhimin1@huawei.com; qemu-devel@nongnu.org
>>>>> Subject: [PATCH v3 00/18] Support Multifd for RDMA migration
>>>>>
>>>>> Now I continue to support multifd for RDMA migration based on my colleague
>>>>> zhiming's work:)
>>>>>
>>>>> The previous RFC patches is listed below:
>>>>> v1:
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg669455.html
>>>>> v2:
>>>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg679188.html
>>>>>
>>>>> As descried in previous RFC, the RDMA bandwidth is not fully utilized for over
>>>>> 25Gigabit NIC because of single channel for RDMA migration.
>>>>> This patch series is going to support multifd for RDMA migration based on multifd
>>>>> framework.
>>>>>
>>>>> Comparsion is between origion and multifd RDMA migration is re-tested for v3.
>>>>> The VM specifications for migration are as follows:
>>>>> - VM use 4k page;
>>>>> - the number of VCPU is 4;
>>>>> - the total memory is 16Gigabit;
>>>>> - use 'mempress' tool to pressurize VM(mempress 8000 500);
>>>>> - use 25Gigabit network card to migrate;
>>>>>
>>>>> For origin RDMA and MultiRDMA migration, the total migration times of VM are
>>>>> as follows:
>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++
>>>>> |             | NOT rdma-pin-all | rdma-pin-all |
>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++
>>>>> | origin RDMA |       26 s       |     29 s     |
>>>>> -------------------------------------------------
>>>>> |  MultiRDMA  |       16 s       |     17 s     |
>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>
>>>>> Test the multifd RDMA migration like this:
>>>>> virsh migrate --live --multiFd --migrateuri
>>>>
>>>> There is no option '--multiFd' for virsh commands, It seems that, we added this private option for internal usage.
>>>> It's better to provide testing method by using qemu commands.
>>>>
>>>>
>>> Hi, Hailiang
>>> Yes, it should be, will update in V4.
>>>
>>> Also, Ping.
>>>
>>> Dave, Juan.
>>>
>>> Any suggestion and comment about this series? Hope this feature could catch up with qemu 5.2.
>>
>> It's a bit close; I'm not sure if I'll have time to review it on Monday
>> before the pull.
>>
>> Dave
>>
> Yes, it is.
> Then we may wait for next merge window after fully review:)
> 
>>>> Thanks.
>>>>
>>>>> rdma://192.168.1.100 [VM] --listen-address 0.0.0.0
>>>>> qemu+tcp://192.168.1.100/system --verbose
>>>>>
>>>>> v2 -> v3:
>>>>>     create multifd ops for both tcp and rdma
>>>>>     do not export rdma to avoid multifd code in mess
>>>>>     fix build issue for non-rdma
>>>>>     fix some codestyle and buggy code
>>>>>
>>>>> Chuan Zheng (18):
>>>>>   migration/rdma: add the 'migrate_use_rdma_pin_all' function
>>>>>   migration/rdma: judge whether or not the RDMA is used for migration
>>>>>   migration/rdma: create multifd_setup_ops for Tx/Rx thread
>>>>>   migration/rdma: add multifd_setup_ops for rdma
>>>>>   migration/rdma: do not need sync main for rdma
>>>>>   migration/rdma: export MultiFDSendParams/MultiFDRecvParams
>>>>>   migration/rdma: add rdma field into multifd send/recv param
>>>>>   migration/rdma: export getQIOChannel to get QIOchannel in rdma
>>>>>   migration/rdma: add multifd_rdma_load_setup() to setup multifd rdma
>>>>>   migration/rdma: Create the multifd recv channels for RDMA
>>>>>   migration/rdma: record host_port for multifd RDMA
>>>>>   migration/rdma: Create the multifd send channels for RDMA
>>>>>   migration/rdma: Add the function for dynamic page registration
>>>>>   migration/rdma: register memory for multifd RDMA channels
>>>>>   migration/rdma: only register the memory for multifd channels
>>>>>   migration/rdma: add rdma_channel into Migrationstate field
>>>>>   migration/rdma: send data for both rdma-pin-all and NOT rdma-pin-all
>>>>>     mode
>>>>>   migration/rdma: RDMA cleanup for multifd migration
>>>>>
>>>>>  migration/migration.c |  24 +++
>>>>>  migration/migration.h |  11 ++
>>>>>  migration/multifd.c   |  97 +++++++++-
>>>>>  migration/multifd.h   |  24 +++
>>>>>  migration/qemu-file.c |   5 +
>>>>>  migration/qemu-file.h |   1 +
>>>>>  migration/rdma.c      | 503
>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>  7 files changed, 653 insertions(+), 12 deletions(-)
>>>>>
>>>>> --
>>>>> 1.8.3.1
>>>>
>>>> .
>>>>
>>>
>>> -- 
>>> Regards.
>>> Chuan
>>>
> 

-- 
Regards.
Chuan

