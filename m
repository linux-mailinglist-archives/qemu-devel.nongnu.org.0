Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0250B6136C8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:46:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUBI-0005Nt-7w; Mon, 31 Oct 2022 08:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1opUB7-0005Mi-NY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:46:09 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1opUB5-0000bd-1S
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:46:09 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N1CSK0Ss4zVjGj;
 Mon, 31 Oct 2022 20:41:05 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 20:45:59 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>, <hesham.almatary@huawei.com>, 
 <ionela.voinescu@arm.com>, <darren@os.amperecomputing.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Igor
 Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 4/5] tests: acpi: aarch64: add topology test for aarch64
To: "wangyanan (Y)" <wangyanan55@huawei.com>
References: <20221031090523.34146-1-yangyicong@huawei.com>
 <20221031090523.34146-5-yangyicong@huawei.com>
 <4214d66a-7d74-2aa4-cfcd-7af26eb92bcd@huawei.com>
Message-ID: <8afd54ec-9b9b-1d2b-878e-ec1acb6fbf2b@huawei.com>
Date: Mon, 31 Oct 2022 20:45:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <4214d66a-7d74-2aa4-cfcd-7af26eb92bcd@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/10/31 19:48, wangyanan (Y) wrote:
> Hi Yicong,
> 
> On 2022/10/31 17:05, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Add test for aarch64's ACPI topology building for all the supported
>> levels.
>>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>> ---
>>   tests/qtest/bios-tables-test.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index e6096e7f73..099b723444 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -1533,6 +1533,27 @@ static void test_acpi_virt_tcg(void)
>>       free_test_data(&data);
>>   }
>>   +static void test_acpi_virt_tcg_topology(void)
>> +{
>> +    test_data data = {
>> +        .machine = "virt",
>> +        .variant = ".topology",
>> +        .tcg_only = true,
>> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
>> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
>> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
>> +        .ram_start = 0x40000000ULL,
>> +        .scan_len = 128ULL * 1024 * 1024,
>> +    };
>> +
>> +    data.smbios_cpu_max_speed = 2900;
>> +    data.smbios_cpu_curr_speed = 2700;
> I'm not sure. But why do we need this two lines?
> Can we keep the test as simple as test_acpi_virt_tcg_numamem
> and avoid unrelated parts.
> 

I guess it's because my silly copy and paste... will make it simpler.

> Thanks,
> Yanan
>> +    test_acpi_one("-cpu cortex-a57 "
>> +                  "-smbios type=4,max-speed=2900,current-speed=2700 "
>> +                  "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>> +    free_test_data(&data);
>> +}
>> +
>>   static void test_acpi_q35_viot(void)
>>   {
>>       test_data data = {
>> @@ -1864,6 +1885,7 @@ int main(int argc, char *argv[])
>>       } else if (strcmp(arch, "aarch64") == 0) {
>>           if (has_tcg) {
>>               qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>> +            qtest_add_func("acpi/virt/topology", test_acpi_virt_tcg_topology);
>>               qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>>               qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>>               qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> 
> .

