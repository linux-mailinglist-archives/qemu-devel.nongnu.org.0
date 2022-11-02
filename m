Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E752D615D32
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 08:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq8Yr-00055k-20; Wed, 02 Nov 2022 03:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1oq8Yn-00055F-6H
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:53:18 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1oq8Yk-0005Bj-T2
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:53:16 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N2Jyj5QBzzHvCp;
 Wed,  2 Nov 2022 15:52:45 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 15:53:02 +0800
Subject: Re: [PATCH v4 5/6] tests: acpi: aarch64: Add topology test for aarch64
To: Yicong Yang <yangyicong@huawei.com>
CC: <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <yangyicong@hisilicon.com>, <prime.zeng@huawei.com>,
 <hesham.almatary@huawei.com>, <ionela.voinescu@arm.com>,
 <darren@os.amperecomputing.com>, <mst@redhat.com>,
 <peter.maydell@linaro.org>, <imammedo@redhat.com>, <ani@anisinha.ca>,
 <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20221101071048.29553-1-yangyicong@huawei.com>
 <20221101071048.29553-6-yangyicong@huawei.com>
Message-ID: <73fa3587-9d85-0264-36f1-bb612b32593c@huawei.com>
Date: Wed, 2 Nov 2022 15:53:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20221101071048.29553-6-yangyicong@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
> Add test for aarch64's ACPI topology building for all the supported
> levels.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   tests/qtest/bios-tables-test.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index e6096e7f73..37befe570b 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1533,6 +1533,24 @@ static void test_acpi_virt_tcg(void)
>       free_test_data(&data);
>   }
>   
> +static void test_acpi_virt_tcg_topology(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .variant = ".topology",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
> +    free_test_data(&data);
> +}
> +
>   static void test_acpi_q35_viot(void)
>   {
>       test_data data = {
> @@ -1864,6 +1882,7 @@ int main(int argc, char *argv[])
>       } else if (strcmp(arch, "aarch64") == 0) {
>           if (has_tcg) {
>               qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +            qtest_add_func("acpi/virt/topology", test_acpi_virt_tcg_topology);
>               qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>               qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>               qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan

