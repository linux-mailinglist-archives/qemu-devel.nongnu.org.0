Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEBB3D265D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:03:02 +0200 (CEST)
Received: from localhost ([::1]:54414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aE1-00013H-7l
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6aBS-0006n0-MD
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:00:23 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6aBP-0003f5-Pu
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:00:22 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GVwTD5Ht1z1CMM1;
 Thu, 22 Jul 2021 22:54:24 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 23:00:13 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 23:00:12 +0800
Subject: Re: [PATCH for-6.1 0/1] machine: Disallow specifying topology
 parameters as zero
To: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210722021512.2600-1-wangyanan55@huawei.com>
 <87y29y7uon.fsf@redhat.com> <20210722133759.db2kjcoucf6rsz4o@gator>
 <672e17d7-bfcc-8022-044a-54a482e3c5ee@redhat.com>
 <93fb73cb-86e7-dc22-cd37-2d61718927e0@huawei.com>
 <333c63ff-4ccd-9346-1d02-e1316ec365b0@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0e158749-a579-154e-40bd-b8800c327f86@huawei.com>
Date: Thu, 22 Jul 2021 23:00:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <333c63ff-4ccd-9346-1d02-e1316ec365b0@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/22 22:38, Paolo Bonzini wrote:
> On 22/07/21 16:12, wangyanan (Y) wrote:
>> The smp_parse and pc_smp_parse are going to be converted into a
>> generic parser, and the added sanity-check in this patch will also be
>> tested in an unit test. So is it probably better to keep the check in 
>> the
>> parser instead of the caller? The duplication will be eliminated anyway
>> when there is one single parser.
>>
>> But I can also implement the check in machine_set_smp as you mentioned
>> if it's more reasonable and preferred. :)
>
> Yes, I would prefer to avoid having duplicate code.  There are some 
> common checks already in machine_set_smp, e.g. comparing ms->smp.cpus 
> against mc->min_cpus and mc->max_cpus.
>
>
Ok, I will send a v2.

Thanks,
Yanan
.


