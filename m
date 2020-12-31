Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F542E7E9C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 08:38:31 +0100 (CET)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kusXW-00045p-Pd
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 02:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kusVE-0002lj-UA
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 02:36:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kusVD-0003f7-2Z
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 02:36:08 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D60L8132Gzj1Y2;
 Thu, 31 Dec 2020 15:35:12 +0800 (CST)
Received: from [10.174.184.155] (10.174.184.155) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 15:35:51 +0800
Subject: Re: [PATCH v3 6/8] Kconfig: Enable PXB for ARM_VIRT by default
To: Igor Mammedov <imammedo@redhat.com>
References: <20201223090836.9075-1-cenjiahui@huawei.com>
 <20201223090836.9075-7-cenjiahui@huawei.com>
 <20201229145052.38834f73@redhat.com>
From: Jiahui Cen <cenjiahui@huawei.com>
Message-ID: <37403e5e-f688-11ef-7432-0f12faee074f@huawei.com>
Date: Thu, 31 Dec 2020 15:35:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201229145052.38834f73@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=cenjiahui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/12/29 21:50, Igor Mammedov wrote:
> On Wed, 23 Dec 2020 17:08:34 +0800
> Jiahui Cen <cenjiahui@huawei.com> wrote:
> subj
> s/by default//
> s/enable/compile/
> 
>> PXB is now supported on ARM, so let's enable it by default.
> s/it by default/for arm_virt machine/
> s/enable/compile/

Thanks for your review.
I will fix them in the next patches.

Thanks,
Jiahui

>>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>  hw/pci-bridge/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/pci-bridge/Kconfig b/hw/pci-bridge/Kconfig
>> index a51ec716f5..f8df4315ba 100644
>> --- a/hw/pci-bridge/Kconfig
>> +++ b/hw/pci-bridge/Kconfig
>> @@ -5,7 +5,7 @@ config PCIE_PORT
>>  
>>  config PXB
>>      bool
>> -    default y if Q35
>> +    default y if Q35 || ARM_VIRT
>>  
>>  config XIO3130
>>      bool
> 
> .
> 

