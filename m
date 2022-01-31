Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A410B4A3E61
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:55:41 +0100 (CET)
Received: from localhost ([::1]:45686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nERXI-00073h-8G
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:55:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nERO4-0003tl-1J; Mon, 31 Jan 2022 02:46:12 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nERNb-0000hG-DL; Mon, 31 Jan 2022 02:45:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 03713DB2298B;
 Mon, 31 Jan 2022 08:45:35 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 08:45:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006562598d1-200e-4348-82ed-e96e318ace24,
 4E4406098780EA2DD5F77ED28C3E8FA94DEDF1FC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <20d584f8-54e4-e9ad-b125-77b25067532f@kaod.org>
Date: Mon, 31 Jan 2022 08:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/ppc/vof: Add missing includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20220122003104.84391-1-f4bug@amsat.org>
 <cac5809d-87d0-28dc-8681-e2b8c92a9534@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <cac5809d-87d0-28dc-8681-e2b8c92a9534@amsat.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3be00d90-cff8-4eb1-86df-8fda12cea897
X-Ovh-Tracer-Id: 10637220845159091052
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgedtgdduuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/30/22 20:38, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-trivial@
>

It is queued in ppc-7.0. I should send a PR today or tomorrow.

Thanks,

C.

> On 22/1/22 01:31, Philippe Mathieu-Daudé wrote:
>> vof.h requires "qom/object.h" for DECLARE_CLASS_CHECKERS(),
>> "exec/memory.h" for address_space_read/write(),
>> "exec/address-spaces.h" for address_space_memory
>> and more importantly "cpu.h" for target_ulong.
>>
>> vof.c doesn't need "exec/ram_addr.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/ppc/vof.c         | 1 -
>>   include/hw/ppc/vof.h | 5 +++++
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
>> index 73adc44ec2..2b63a62875 100644
>> --- a/hw/ppc/vof.c
>> +++ b/hw/ppc/vof.c
>> @@ -16,7 +16,6 @@
>>   #include "qemu/units.h"
>>   #include "qemu/log.h"
>>   #include "qapi/error.h"
>> -#include "exec/ram_addr.h"
>>   #include "exec/address-spaces.h"
>>   #include "hw/ppc/vof.h"
>>   #include "hw/ppc/fdt.h"
>> diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
>> index 97fdef758b..f8c0effcaf 100644
>> --- a/include/hw/ppc/vof.h
>> +++ b/include/hw/ppc/vof.h
>> @@ -6,6 +6,11 @@
>>   #ifndef HW_VOF_H
>>   #define HW_VOF_H
>> +#include "qom/object.h"
>> +#include "exec/address-spaces.h"
>> +#include "exec/memory.h"
>> +#include "cpu.h"
>> +
>>   typedef struct Vof {
>>       uint64_t top_addr; /* copied from rma_size */
>>       GArray *claimed; /* array of SpaprOfClaimed */
> 


