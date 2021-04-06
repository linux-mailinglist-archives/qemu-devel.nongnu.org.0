Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527D3554DE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 15:21:36 +0200 (CEST)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTleA-0006nG-Rs
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 09:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lTlcp-0006C1-Pt
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:20:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lTlcm-0003ll-ND
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:20:11 -0400
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FF7PF0vhRzRZGd;
 Tue,  6 Apr 2021 21:17:53 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml406-hub.china.huawei.com (10.3.17.50) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 6 Apr 2021 21:19:52 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 6 Apr 2021 21:19:53 +0800
Subject: Re: [PATCH v4 0/2] Some modification about ram_save_host_page()
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: David Edmondson <dme@dme.org>, Peter Xu <peterx@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Alexey Romko
 <nevilad@yahoo.com>, "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
Message-ID: <7e722b03-c6d4-4246-bcb6-d8393fa07a49@huawei.com>
Date: Tue, 6 Apr 2021 21:19:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316125716.1243-1-jiangkunkun@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com, Keqian
 Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping,

Hi David Alan Gilbert,
Will this series be picked up soon, or is there any other work for me to do?

Best Regards,
Kunkun Jiang

On 2021/3/16 20:57, Kunkun Jiang wrote:
> Hi all,
>
> This series include patches as below:
> Patch 1:
> - reduce unnecessary rate limiting in ram_save_host_page()
>
> Patch 2:
> - optimized ram_save_host_page() by using migration_bitmap_find_dirty() to find
> dirty pages
>
> History:
>
> v3 -> v4:
> - Remove the modification to ram_save_host_page() comment [Peter Xu]
> - Remove the renaming of tmppages
>
> v2 -> v3:
> - Reduce unnecessary rate limiting if nothing is sent in the current iteration [David Edmondson]
> - Invert the body of the loop in ram_save_host_page() [David Edmondson]
>
> v1 -> v2:
> - Modify ram_save_host_page() comment [David Edmondson]
> - Remove 'goto' [David Edmondson]
>
> Kunkun Jiang (2):
>    migration/ram: Reduce unnecessary rate limiting
>    migration/ram: Optimize ram_save_host_page()
>
>   migration/ram.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)
>


