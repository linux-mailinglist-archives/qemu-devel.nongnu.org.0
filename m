Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764713DC3C0
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:08:40 +0200 (CEST)
Received: from localhost ([::1]:45322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9iAp-00084N-1M
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m9iA1-0007NC-O1
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:07:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m9i9y-0000l0-Sk
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:07:49 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GcDHD1tXszZvyd;
 Sat, 31 Jul 2021 14:04:08 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 31 Jul 2021 14:07:38 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 31 Jul 2021 14:07:37 +0800
Subject: Re: [PATCH V5 17/25] vfio-pci: cpr part 2
To: Steven Sistare <steven.sistare@oracle.com>, Alex Williamson
 <alex.williamson@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-18-git-send-email-steven.sistare@oracle.com>
 <20210716145133.4aa3f341.alex.williamson@redhat.com>
 <be26577b-8df6-a8b5-fe06-ea33552aa472@oracle.com>
 <20210719121021.6babb9ff.alex.williamson@redhat.com>
 <2f85af36-5d64-99b0-5165-ceb73087d247@oracle.com>
 <93e7660d-6d89-8d35-b415-88ccb7e6d7fc@huawei.com>
 <27ebf9ff-4a1c-db2c-6be7-d8092283e810@oracle.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <fef3f637-bb6c-8358-61ec-aea90a34f93d@huawei.com>
Date: Sat, 31 Jul 2021 14:07:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <27ebf9ff-4a1c-db2c-6be7-d8092283e810@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhengchuan@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.125,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Xiexiangyou <xiexiangyou@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, Markus
 Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2021/7/30 20:52, Steven Sistare wrote:
> On 7/28/2021 12:56 AM, Zheng Chuan wrote:
>> On 2021/7/20 2:38, Steven Sistare wrote:
>>> On 7/19/2021 2:10 PM, Alex Williamson wrote:
>>>> On Mon, 19 Jul 2021 13:44:08 -0400
>>>> Steven Sistare <steven.sistare@oracle.com> wrote:
>>>>
>>>>> On 7/16/2021 4:51 PM, Alex Williamson wrote:
>>>>>> On Wed,  7 Jul 2021 10:20:26 -0700
>>>>>> Steve Sistare <steven.sistare@oracle.com> wrote:
>>>>>>   
>>>>>>> Finish cpr for vfio-pci by preserving eventfd's and vector state.
>>>>>>>
>>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>>>>> ---
>>>>>>>  hw/vfio/pci.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>>>>>>  1 file changed, 116 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>>>>> index 0f5c542..07bd360 100644
>>>>>>> --- a/hw/vfio/pci.c
>>>>>>> +++ b/hw/vfio/pci.c  
>>>>>> ...  
>>>>>>> @@ -3295,14 +3329,91 @@ static void vfio_merge_config(VFIOPCIDevice  
>>>>>> *vdev)  
>>>>>>>      g_free(phys_config);
>>>>>>>  }
>>>>>>>  
>>>>>>> +static int vfio_pci_pre_save(void *opaque)
>>>>>>> +{
>>>>>>> +    VFIOPCIDevice *vdev = opaque;
>>>>>>> +    PCIDevice *pdev = &vdev->pdev;
>>>>>>> +    int i;
>>>>>>> +
>>>>>>> +    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
>>>>>>> +        error_report("%s: cpr does not support vfio-pci INTX",
>>>>>>> +                     vdev->vbasedev.name);
>>>>>>> +    }  
>>>>>>
>>>>>> You're not only not supporting INTx, but devices that support INTx, so
>>>>>> this only works on VFs.  Why?  Is this just out of scope or is there
>>>>>> something fundamentally difficult about it?
>>>>>>
>>>>>> This makes me suspect there's a gap in INTx routing setup if it's more
>>>>>> than just another eventfd to store and setup.  If we hot-add a device
>>>>>> using INTx after cpr restart, are we going to find problems?  Thanks,  
>>>>>
>>>>> It could be supported, but requires more code (several event fd's plus other state in VFIOINTx
>>>>> to save and restore) for a case that does not seem very useful (a directly assigned device that
>>>>> only supports INTx ?). 
>>>>
>>>> It's not testing that the device *only* supports INTx, it's testing
>>>> that the device supports INTx _at_all_.  That effectively means this
>>>> excludes anything other than an SR-IOV VF.  There are plenty of valid
>>>> and useful cases of assigning PFs, most of which support INTx even if
>>>> we don't expect that's their primary operational mode.  Thanks,
>>>
>>> OK, I'll look into it.  If this proves problematic, how do you feel about deferring
>>> INTx support to a later patch?
>>>
>> I am curious about that does cpr restart mode work for GPU passthrough?
> 
> It should work for any vfio device (after I fix the INTX limitation), but I have not tested
> a GPU yet.
> 
> - Steve
> .
Yes, The GPU may switch frequently between INTX and MSI, and cpr should support both of them:)
Thanks.
> 

-- 
Regards.
Chuan

