Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F00613132
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 08:30:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opPE6-0007UO-J0; Mon, 31 Oct 2022 03:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1opPE4-0007NZ-4T
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:28:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1opPE0-00039d-9g
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:28:50 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N14Pz3WttzVjM1;
 Mon, 31 Oct 2022 15:23:35 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 15:28:29 +0800
CC: <yangyicong@hisilicon.com>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <ani@anisinha.ca>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>, <hesham.almatary@huawei.com>, 
 <ionela.voinescu@arm.com>, <darren@os.amperecomputing.com>
Subject: Re: [PATCH v2 2/4] tests: virt: update expected ACPI tables for virt
 test
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20221027032613.18377-1-yangyicong@huawei.com>
 <20221027032613.18377-3-yangyicong@huawei.com>
 <20221029035311-mutt-send-email-mst@kernel.org>
Message-ID: <f90fdf08-1845-5374-d12a-8c29c345c593@huawei.com>
Date: Mon, 31 Oct 2022 15:28:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221029035311-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangyicong@huawei.com; helo=szxga02-in.huawei.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/10/29 15:53, Michael S. Tsirkin wrote:
> On Thu, Oct 27, 2022 at 11:26:11AM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Update the ACPI tables according to the acpi aml_build change.
>>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> 
> OK nice but if patch 1 is applied alone that will break make check
> won't it? And this means the patchset breaks git bisect.
> Pls look at top of tests/qtest/bios-tables-test.c to see
> how to organize a patchset changing expected tables.
> 

Will follow the guidance and correctly mentioned the changes in
tests/qtest/bios-tables-test-allowed-diff.h. So is the rest patches
in the series.

Thanks.

> 
>> ---
>>  tests/data/acpi/virt/PPTT | Bin 96 -> 76 bytes
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>
>> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
>> index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
>> GIT binary patch
>> delta 32
>> fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM
>>
>> delta 53
>> pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O
>>
>> -- 
>> 2.24.0
> 
> .
> 

