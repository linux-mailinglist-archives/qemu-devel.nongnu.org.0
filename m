Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5613D2548
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:13:58 +0200 (CEST)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZSX-0007Tx-M6
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6ZRP-00067t-I4
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:12:47 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6ZRJ-0005wq-CR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:12:47 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GVvQC3Zytz1CMZC;
 Thu, 22 Jul 2021 22:06:43 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 22:12:31 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 22:12:31 +0800
Subject: Re: [PATCH for-6.1 0/1] machine: Disallow specifying topology
 parameters as zero
To: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210722021512.2600-1-wangyanan55@huawei.com>
 <87y29y7uon.fsf@redhat.com> <20210722133759.db2kjcoucf6rsz4o@gator>
 <672e17d7-bfcc-8022-044a-54a482e3c5ee@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <93fb73cb-86e7-dc22-cd37-2d61718927e0@huawei.com>
Date: Thu, 22 Jul 2021 22:12:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <672e17d7-bfcc-8022-044a-54a482e3c5ee@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
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

On 2021/7/22 21:55, Paolo Bonzini wrote:
> On 22/07/21 15:37, Andrew Jones wrote:
>> This doesn't mention zero inputs and even implies non-zero inputs.
>>
>> I'm not sure if we need to worry about the odd command line that used 
>> zero
>> for some parameters. What do you think?
>
> I think I agree as well, however the patch that Yanan sent has 
> unnecessary duplication between smp_parse and pc_smp_parse. 
> machine_set_smp is a better place to implement this kind of check.
>
The smp_parse and pc_smp_parse are going to be converted into a
generic parser, and the added sanity-check in this patch will also be
tested in an unit test. So is it probably better to keep the check in the
parser instead of the caller? The duplication will be eliminated anyway
when there is one single parser.

But I can also implement the check in machine_set_smp as you mentioned
if it's more reasonable and preferred. :)

Thanks,
Yanan
.


