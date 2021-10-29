Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBA043F778
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:49:13 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLhQ-0000Gj-0U
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mgLO2-0003xa-Nv
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:29:12 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mgLNy-000574-NL
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 02:29:09 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HgXX63BgBz1DHx7;
 Fri, 29 Oct 2021 14:27:02 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 29 Oct 2021 14:28:59 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 29 Oct 2021 14:28:58 +0800
Subject: Re: [PATCH v3 0/2] hw/core/machine: Add an unit test for smp_parse
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20211026034659.22040-1-wangyanan55@huawei.com>
 <91def190-d563-e463-7915-525d67631194@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <aff7ec09-ec31-bf4f-b36c-67329f1fa02d@huawei.com>
Date: Fri, 29 Oct 2021 14:28:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <91def190-d563-e463-7915-525d67631194@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.847,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/10/28 22:44, Philippe Mathieu-Daudé wrote:
> On 10/26/21 05:46, Yanan Wang wrote:
>> Hi,
>>
>> This is v3 which introduces an unit test for generic smp_parse.
>>
>> We have had enough discussions about what kind of SMP configurations
>> by the user should be considered valid and what should be invalid.
>> Since we have finished optimizing the SMP parsing code, then this
>> test normatively listed all the possible valid/invalid configurations
>> that the user can provide. This can be a testing tool when we
>> introduce new topology members and need to touch the parsing code.
>>
>> For your reference, some related discussion is here:
>> https://lore.kernel.org/qemu-devel/YOxf+sxzUSJdbY+j@redhat.com/
>>
>> Changelog:
>> v2->v3:
>> - add Andrew's R-b for PATCH #1
>> - drop an unused macro definition in PATCH #2
>> - v2: https://lore.kernel.org/qemu-devel/20211013074119.23028-1-wangyanan55@huawei.com/
>>
>> v1->v2:
>> - split smp_parse out into a separate .c file instead of a header (patch #1)
>> - dropped an unnecessary function and add Andrew's R-b (patch #2)
>> - v1: https://lore.kernel.org/qemu-devel/20211010103954.20644-1-wangyanan55@huawei.com/
>>
>> Yanan Wang (2):
>>    hw/core/machine: Split out the smp parsing code
>>    tests/unit: Add an unit test for smp parsing
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
Thank you for the testing/review and the help of v4 respin.

Thanks,
Yanan
.

