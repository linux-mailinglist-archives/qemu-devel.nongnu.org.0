Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46887183FA3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 04:26:40 +0100 (CET)
Received: from localhost ([::1]:53236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCay7-0007Xx-Ct
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 23:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1jCaxK-00073V-On
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 23:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1jCaxJ-0003EQ-Ms
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 23:25:50 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:44372 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1jCaxH-0002zc-BW; Thu, 12 Mar 2020 23:25:47 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F40B1C7ED93B429C1D3E;
 Fri, 13 Mar 2020 11:25:39 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 13 Mar 2020 11:25:32 +0800
Subject: Re: [PATCH] migration/throttle: Add throttle-trig-thres migration
 parameter
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200224023142.39360-1-zhukeqian1@huawei.com>
 <20200312180735.GL3211@work-vm>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <66e1b7b4-1563-ef23-2dbf-a19311f3ec1d@huawei.com>
Date: Fri, 13 Mar 2020 11:25:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200312180735.GL3211@work-vm>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dr. David,

On 2020/3/13 2:07, Dr. David Alan Gilbert wrote:
> * Keqian Zhu (zhukeqian1@huawei.com) wrote:
>> Currently, if the bytes_dirty_period is more than the 50% of
>> bytes_xfer_period, we start or increase throttling.
>>
>> If we make this percentage higher, then we can tolerate higher
>> dirty rate during migration, which means less impact on guest.
>> The side effect of higher percentage is longer migration time.
>> We can make this parameter configurable to switch between mig-
>> ration time first or guest performance first.
>>
>> The default value is 50 and valid range is 1 to 100.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> 
> Apologies for the delay.
It is not late, no worries ;).
> This looks fine now; so
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> and I'll queue it.
Thanks.
> I think we could do with a better description than the current one if we
> can find it:
> 
>  The ratio of bytes_dirty_period and bytes_xfer_period
>  to trigger throttling. It is expressed as percentage.
> 
> assumes people understand what those bytes*period mean.
> 
> Still, until we do:
> 
> Queued for migration
> 
[...]
>> -- 
>> 2.19.1
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 
> .
> 
Thanks,
Keqian


