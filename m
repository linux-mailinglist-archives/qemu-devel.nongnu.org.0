Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662C66267B1
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 08:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otl57-0005Sn-I8; Sat, 12 Nov 2022 02:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1otl55-0005ST-Ln
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:37:35 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1otl53-0003io-7e
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 02:37:35 -0500
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N8S4k46RjzJnc0;
 Sat, 12 Nov 2022 15:34:14 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 12 Nov 2022 15:37:18 +0800
Message-ID: <46ab844b-1dbc-2793-c89d-ffe3c6a95c2f@huawei.com>
Date: Sat, 12 Nov 2022 15:37:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8 4/5] vdpa-dev: mark the device as unmigratable
To: Stefano Garzarella <sgarzare@redhat.com>
CC: <stefanha@redhat.com>, <mst@redhat.com>, <jasowang@redhat.com>,
 <cohuck@redhat.com>, <pbonzini@redhat.com>, <arei.gonglei@huawei.com>,
 <yechuan@huawei.com>, <huangzhichao@huawei.com>, <qemu-devel@nongnu.org>,
 <xiehong@huawei.com>
References: <20221108004157.1112-1-longpeng2@huawei.com>
 <20221108004157.1112-5-longpeng2@huawei.com>
 <20221108084658.nurokqjcc3lmieet@sgarzare-redhat>
In-Reply-To: <20221108084658.nurokqjcc3lmieet@sgarzare-redhat>
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



在 2022/11/8 16:46, Stefano Garzarella 写道:
> On Tue, Nov 08, 2022 at 08:41:56AM +0800, Longpeng(Mike) wrote:
>> From: Longpeng <longpeng2@huawei.com>
>>
>> The generic vDPA device doesn't support migration currently, so
>> mark it as unmigratable temporarily.
>>
>> Signed-off-by: Longpeng <longpeng2@huawei.com>
>> ---
>> hw/virtio/vdpa-dev.c | 1 +
>> 1 file changed, 1 insertion(+)
> 
> Is there a particular reason why we don't squash this change in the 
> second patch of this series where we add the hw/virtio/vdpa-dev.c file?
> 
No, just want to make it noticeable.

> Anyway, this change LGTM:
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 
Thanks.

>>
>> diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
>> index 2885d06cbe..62d83d3423 100644
>> --- a/hw/virtio/vdpa-dev.c
>> +++ b/hw/virtio/vdpa-dev.c
>> @@ -327,6 +327,7 @@ static Property vhost_vdpa_device_properties[] = {
>>
>> static const VMStateDescription vmstate_vhost_vdpa_device = {
>>     .name = "vhost-vdpa-device",
>> +    .unmigratable = 1,
>>     .minimum_version_id = 1,
>>     .version_id = 1,
>>     .fields = (VMStateField[]) {
>> -- 
>> 2.23.0
>>
> 
> .

