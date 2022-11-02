Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9D615D13
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 08:42:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8OD-00022h-R3; Wed, 02 Nov 2022 03:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1oq8OC-00022Y-9J
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:42:20 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1oq8OA-0008AZ-DY
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:42:19 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N2JkB1Gm4zHvPZ;
 Wed,  2 Nov 2022 15:41:54 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 15:42:12 +0800
Subject: Re: [PATCH v4 4/6] tests: acpi: Add and whitelist *.topology blobs
To: Yicong Yang <yangyicong@huawei.com>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>, <mst@redhat.com>,
 <peter.maydell@linaro.org>, <imammedo@redhat.com>, <ani@anisinha.ca>,
 <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20221101071048.29553-1-yangyicong@huawei.com>
 <20221101071048.29553-5-yangyicong@huawei.com>
Message-ID: <410d5712-629d-2df3-91fe-bdb1dafada21@huawei.com>
Date: Wed, 2 Nov 2022 15:42:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20221101071048.29553-5-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2022/11/1 15:10, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Add and whitelist *.topology blobs, prepares for the aarch64's ACPI
> topology building test.
>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
> ---
>   tests/data/acpi/virt/APIC.topology          | 0
>   tests/data/acpi/virt/DSDT.topology          | 0
>   tests/data/acpi/virt/PPTT.topology          | 0
>   tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>   4 files changed, 3 insertions(+)
>   create mode 100644 tests/data/acpi/virt/APIC.topology
>   create mode 100644 tests/data/acpi/virt/DSDT.topology
>   create mode 100644 tests/data/acpi/virt/PPTT.topology
>
> diff --git a/tests/data/acpi/virt/APIC.topology b/tests/data/acpi/virt/APIC.topology
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/DSDT.topology b/tests/data/acpi/virt/DSDT.topology
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/PPTT.topology b/tests/data/acpi/virt/PPTT.topology
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..90f53f9c1d 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>   /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/APIC.topology",
> +"tests/data/acpi/virt/DSDT.topology",
> +"tests/data/acpi/virt/PPTT.topology",


