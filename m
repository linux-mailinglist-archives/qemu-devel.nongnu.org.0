Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB166136D7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:48:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUDW-000799-QR; Mon, 31 Oct 2022 08:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1opUDL-00077N-PT
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:48:28 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1opUDJ-0001Gv-Od
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:48:27 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N1CW31mx4zVjDQ;
 Mon, 31 Oct 2022 20:43:27 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 20:48:21 +0800
CC: <yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>, <hesham.almatary@huawei.com>, 
 <ionela.voinescu@arm.com>, <darren@os.amperecomputing.com>, Peter Maydell
 <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 2/5] tests: virt: update expected ACPI tables for virt
 test
To: "Michael S. Tsirkin" <mst@redhat.com>, "wangyanan (Y)"
 <wangyanan55@huawei.com>
References: <20221031090523.34146-1-yangyicong@huawei.com>
 <20221031090523.34146-3-yangyicong@huawei.com>
 <83fe31fe-0755-7e22-9e10-7eebd938fbbd@huawei.com>
 <20221031083006-mutt-send-email-mst@kernel.org>
Message-ID: <786b3283-2c33-e298-3f4c-458c1948e468@huawei.com>
Date: Mon, 31 Oct 2022 20:48:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221031083006-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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

Hi Michael and Yanan,

On 2022/10/31 20:30, Michael S. Tsirkin wrote:
> On Mon, Oct 31, 2022 at 07:21:31PM +0800, wangyanan (Y) wrote:
>> Hi Yicong,
>>
>> On 2022/10/31 17:05, Yicong Yang wrote:
>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> Update the ACPI tables according to the acpi aml_build change.
>> We may also need the disassembled context of the table change
> 
> and it's not a "maybe need". We do need it.
> 

Got it. Let me check and attach these diff informations for all the
test table changes in this series. Thanks for the guidance!

Thanks.

>> in the commit message, for review.
>>
>> For your reference: see patch 6 in [1]:
>> https://patchew.org/QEMU/20220107083232.16256-1-wangyanan55@huawei.com/
>>
>> Thanks,
>> Yanan
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>> ---
>>>   tests/data/acpi/virt/PPTT                   | Bin 96 -> 76 bytes
>>>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>>>   2 files changed, 1 deletion(-)
>>>
>>> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
>>> index f56ea63b369a604877374ad696c396e796ab1c83..7a1258ecf123555b24462c98ccbb76b4ac1d0c2b 100644
>>> GIT binary patch
>>> delta 32
>>> fcmYfB;R*-{3GrcIU|?D?k;`ae01J-_kOKn%ZFdCM
>>>
>>> delta 53
>>> pcmeZC;0g!`2}xjJU|{l?$YrDgWH5jU5Ca567#O&Klm(arApowi1QY-O
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>>> index cb143a55a6..dfb8523c8b 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> @@ -1,2 +1 @@
>>>   /* List of comma-separated changed AML files to ignore */
>>> -"tests/data/acpi/virt/PPTT",
> 
> .
> 

