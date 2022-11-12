Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173436267B4
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 08:40:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otl7Q-0006Ke-3e; Sat, 12 Nov 2022 02:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1otl7C-0006K9-4S
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:39:46 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1otl7A-00048o-Cv
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:39:45 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N8S7S1vw3zJnZ7;
 Sat, 12 Nov 2022 15:36:36 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 15:39:39 +0800
Message-ID: <946d149f-37e9-0a52-8840-84527de344b7@huawei.com>
Date: Sat, 12 Nov 2022 15:39:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8 5/5] docs: Add generic vhost-vdpa device documentation
To: Stefano Garzarella <sgarzare@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, <stefanha@redhat.com>, <mst@redhat.com>, 
 <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 <xiehong@huawei.com>
References: <20221108004157.1112-1-longpeng2@huawei.com>
 <20221108004157.1112-6-longpeng2@huawei.com>
 <CACGkMEtPpegJ+GbUseq4Y4=Y6De+trDZ5Ks8UqnTcsyVVPvnaw@mail.gmail.com>
 <1f9235a3-237f-aa89-f558-838b3f85caae@huawei.com>
 <20221108084242.ad7aqvhvhpam7vs5@sgarzare-redhat>
In-Reply-To: <20221108084242.ad7aqvhvhpam7vs5@sgarzare-redhat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=longpeng2@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2022/11/8 16:42, Stefano Garzarella 写道:
> On Tue, Nov 08, 2022 at 11:30:53AM +0800, Longpeng (Mike, Cloud 
> Infrastructure Service Product Dept.) wrote:
>>
>>
>> 在 2022/11/8 10:42, Jason Wang 写道:
>>> On Tue, Nov 8, 2022 at 8:42 AM Longpeng(Mike) <longpeng2@huawei.com> 
>>> wrote:
>>>>
>>>> From: Longpeng <longpeng2@huawei.com>
>>>>
>>>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>>>> ---
>>>>  docs/system/devices/vhost-vdpa-device.rst | 43 +++++++++++++++++++++++
>>>>  1 file changed, 43 insertions(+)
>>>>  create mode 100644 docs/system/devices/vhost-vdpa-device.rst
>>>>
>>>> diff --git a/docs/system/devices/vhost-vdpa-device.rst 
>>>> b/docs/system/devices/vhost-vdpa-device.rst
>>>> new file mode 100644
>>>> index 0000000000..b758c4fce6
>>>> --- /dev/null
>>>> +++ b/docs/system/devices/vhost-vdpa-device.rst
>>>
>>> If the doc is for a general vhost-vDPA device, we'd better have a 
>>> better name?
>>>
>>
>> How about general-vhost-vdpa-device.rst?
>>
> 
> I would leave vhost-vdpa as the prefix, how about 
> vhost-vdpa-generic-device.rst?
> 
Okay, will do in next version, thanks.

> Thanks,
> Stefano
> 
> .

