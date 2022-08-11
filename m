Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B45D58F829
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 09:13:45 +0200 (CEST)
Received: from localhost ([::1]:54408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM2Nz-0006N6-IE
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 03:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oM2J2-0001mU-Nv; Thu, 11 Aug 2022 03:08:38 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oM2Iz-0005n3-QS; Thu, 11 Aug 2022 03:08:36 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M3Hr55sDNzjXjN;
 Thu, 11 Aug 2022 15:05:09 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 11 Aug 2022 15:08:22 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 11 Aug 2022 15:08:21 +0800
Subject: Re: [PATCH v6 24/24] target/arm: Define neoverse-n1
To: Peter Maydell <peter.maydell@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
 <20220506180242.216785-25-richard.henderson@linaro.org>
 <1d915529-cd32-82b3-42ad-4d202d3590d8@huawei.com>
 <CAFEAcA-FQ3W78c=kwzZZ=wCuCbPWO=9vxG7ge4wnEZR6qBGHVA@mail.gmail.com>
Message-ID: <448f3df1-a306-86a5-cd32-01f403e12b39@huawei.com>
Date: Thu, 11 Aug 2022 15:08:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-FQ3W78c=kwzZZ=wCuCbPWO=9vxG7ge4wnEZR6qBGHVA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>

On 2022/8/11 0:47, Peter Maydell wrote:
> On Wed, 10 Aug 2022 at 14:14, Zenghui Yu <yuzenghui@huawei.com> wrote:
>> The r4p1 TRM says that the Neoverse N1 core supports SPE (the value
>> of ID_AA64DFR0.PMSVer is 0b0001) but do we really support SPE
>> emulation in QEMU?
>>
>> The guest immediately received an unexpected exception (with EC==0,
>> at EFI stage) when I tried to boot it using something like:
>>
>> /path/to/qemu-system-aarch64 \
>> -M virt,gic-version=3,virtualization=on \
>> -cpu neoverse-n1 -accel tcg \
>> -bios QEMU_EFI.fd [...]
>>
>> and QEMU shouted that "read access to unsupported AArch64 system
>> register op0:3 op1:0 crn:9 crm:10 op2:7", which told us that the
>> guest attempted to read the PMBIDR_EL1 register.
> 
> No, we don't emulate SPE. We should probably not advertise it
> (we might do a no-op implementation eventually).
> 
> What guest is this ?

I guess basically anything that starts playing with SPE. I used Linux
and both stable-5.15 and mainline kernel can't boot.

Zenghui

