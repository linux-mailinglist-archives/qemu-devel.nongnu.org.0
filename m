Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A8370654
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:11:56 +0200 (CEST)
Received: from localhost ([::1]:57138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lckjC-0000BL-Og
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lckhj-0007yw-5z
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:10:23 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:55577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lckhh-0004uK-A3
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:10:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.31])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id C06F513FD21;
 Sat,  1 May 2021 08:10:17 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 1 May 2021
 10:10:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00307e7d3f5-c09f-4ac7-a51d-9ecfefe26d52,
 FA617379B3376A315B5D78BD2AA444FEBCB316FA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PULL 00/18] aspeed queue
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430163309.4182922-1-clg@kaod.org>
 <CAFEAcA9qz1SLh5Ws7C-xUqvnCJWfFyjjwc8STj4mdUxmCw0spw@mail.gmail.com>
 <CAFEAcA_2fuec2KiY=ayUf6e1y-nEuBtdU4KwL5un_mgaBaXrcw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <36a3ed52-cc42-f6a7-69f9-821212ea4635@kaod.org>
Date: Sat, 1 May 2021 10:10:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_2fuec2KiY=ayUf6e1y-nEuBtdU4KwL5un_mgaBaXrcw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 04937c39-50b8-419c-910b-23780b534e69
X-Ovh-Tracer-Id: 930274801105996765
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddvjedgudefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhudffveehudetjedtiedtheffjeegffeitdfhfeefhedtgfehfeevvddtvdelffenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/1/21 12:18 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 23:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Same thing is also a build failure on 32-bit hosts (where the types
>> are genuinely different sizes):
>>
>> ../../hw/misc/aspeed_hace.c: In function 'do_hash_operation':
>> ../../hw/misc/aspeed_hace.c:128:49: error: passing argument 3 of
>> 'address_space_map' from incompatible pointer type
>> [-Werror=incompatible-pointer-types]
>>                                                  &iov[i].iov_len, false,
>>                                                  ^
>> In file included from /home/peter.maydell/qemu/include/hw/sysbus.h:7:0,
>>                  from /home/peter.maydell/qemu/include/hw/misc/aspeed_hace.h:12,
>>                  from ../../hw/misc/aspeed_hace.c:14:
>> /home/peter.maydell/qemu/include/exec/memory.h:2438:7: note: expected
>> 'hwaddr * {aka long long unsigned int *}' but argument is of type
>> 'size_t * {aka unsigned int *}'
>>  void *address_space_map(AddressSpace *as, hwaddr addr,
>>        ^~~~~~~~~~~~~~~~~
> 
> If you like you can repro this on the gitlab CI where we have
> cross-build jobs for the 32-bit targets, eg:
> https://gitlab.com/qemu-project/qemu/-/jobs/1227559504

Yes. It is time for me to migrate. I will send a fixed v2
when this is done.

Thanks,

C. 

