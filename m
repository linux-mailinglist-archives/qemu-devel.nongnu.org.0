Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ED6E7272
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 14:14:45 +0100 (CET)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP4r6-0001oO-1U
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 09:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1iP4L5-0000kd-H3
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:41:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1iP4L4-0007ps-32
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:41:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2256 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1iP4L3-0007h6-NL
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:41:38 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id ADC7014647A3AEC2E8FD
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 20:41:32 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Mon, 28 Oct 2019
 20:41:30 +0800
Subject: Re: [PATCH v20 0/5] Add ARMv8 RAS virtualization support in QEMU
To: <qemu-devel@nongnu.org>
References: <20191026032447.20088-1-zhengxiang9@huawei.com>
 <20191027061450-mutt-send-email-mst@kernel.org>
 <6c44268a-2676-3fa1-226d-29877b21dbea@huawei.com>
 <20191028042645-mutt-send-email-mst@kernel.org>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <aa71ba17-1599-2d4f-6de1-0ce64ce36032@huawei.com>
Date: Mon, 28 Oct 2019 20:41:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20191028042645-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael,

On 2019/10/28 16:28, Michael S. Tsirkin wrote:
>> Got it, Thanks for the Reviewed-by from Michael.
>>
>> Hi Michael,
>>   According to discussion with QEMU community, I finished and developed the whole ARM RAS virtualization solution, and introduce the ARM APEI table in the first time.
>> For the newly created files, which are mainly about ARM APEI/GHES part,I would like to maintain them. If you agree it, whether I can add new maintainers[1]? thanks a lot.
>>
>>
>> [1]:
>> +ARM APEI Subsystem
>> +M: Dongjiu Geng <gengdongjiu@huawei.com>
>> +M: Xiang zheng <zhengxiang9@huawei.com>
>> +L: qemu-arm@nongnu.org
>> +S: Maintained
>> +F: hw/acpi/acpi_ghes.c
>> +F: include/hw/acpi/acpi_ghes.h
>> +F: docs/specs/acpi_hest_ghes.rst
>>
> I think for now you want to be a designated reviewer.  So I'd use an R:
> tag.

 Thanks for the reply.
 I want to be a maintainer for my newly created files, so whether I can use M: tag. I would like to contribute some times to maintain that, thanks.

> 
>>>


