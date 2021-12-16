Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2C84773F6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:09:45 +0100 (CET)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrS4-0000xj-Ul
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mxrPD-0007AI-15; Thu, 16 Dec 2021 09:06:47 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mxrP0-0004RQ-8m; Thu, 16 Dec 2021 09:06:46 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JFDNZ5D0BzZdVC;
 Thu, 16 Dec 2021 22:03:26 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 22:06:27 +0800
Subject: Re: [PATCH v4 03/10] hw/core/machine: Wrap target specific parameters
 together
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric Blake
 <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
 <20211121122502.9844-4-wangyanan55@huawei.com>
 <7c4f8cdf-2a8c-35a6-a425-c549de34c9b6@redhat.com>
Message-ID: <b93e9f94-4276-59b2-3a17-31ffc71620db@huawei.com>
Date: Thu, 16 Dec 2021 22:06:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7c4f8cdf-2a8c-35a6-a425-c549de34c9b6@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.034,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>

Hi,

On 2021/12/16 21:23, Philippe Mathieu-Daudé wrote:
> On 11/21/21 13:24, Yanan Wang wrote:
>> Wrap the CPU target specific parameters together into a single
>> variable, so that we don't need to update the other lines but
>> a single line when new topology parameters are introduced.
> Where new params are introduced? Not in this series apparently.
The commit message may not clearly express what I mean.
A new parameter "clusters" is added in patch #2, and now we have
specific dies and clusters, I tried to wrap these two parameters together
so that the code lines can be shorter and look more concise.

If it's thought not that necessary to do this change, I will get rid of this
patch of course.

Thanks,
Yanan
>
>> No functional change intended.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine-smp.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
> .


