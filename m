Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C237146B336
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 07:50:45 +0100 (CET)
Received: from localhost ([::1]:51282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muUJI-000158-JV
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 01:50:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muUFF-0007od-QI
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 01:46:34 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:39655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muUFC-0003E4-Im
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 01:46:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8C6C3D0419F4;
 Tue,  7 Dec 2021 07:46:27 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 07:46:26 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ec26df0e-99dc-4713-b5e0-1b1035a01cd7,
 D5B34436B48CBBE29FDE786D5871FA4E32D79878) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <aed70b41-3ff9-8254-9874-4e7b9682dcaf@kaod.org>
Date: Tue, 7 Dec 2021 07:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/15] ppc/ppc405: Add some address space definitions
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-8-clg@kaod.org>
 <e3178117-dfbc-c778-b48b-587bb3ce5167@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e3178117-dfbc-c778-b48b-587bb3ce5167@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f30d287c-1bd2-482b-ae86-02ef5c456ca1
X-Ovh-Tracer-Id: 235031606327020396
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeeggdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.44,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 16:05, BALATON Zoltan wrote:
> On Mon, 6 Dec 2021, Cédric Le Goater wrote:
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405.h        |  7 +++++++
>> hw/ppc/ppc405_boards.c | 16 +++++++---------
>> 2 files changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index ad5f4026b5db..ea48c3626908 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -27,6 +27,13 @@
>>
>> #include "hw/ppc/ppc4xx.h"
>>
>> +#define PPC405EP_SDRAM_BASE 0x00000000
>> +#define PPC405EP_NVRAM_BASE 0xF0000000
>> +#define PPC405EP_FPGA_BASE  0xF0300000
>> +#define PPC405EP_SRAM_BASE  0xFFF00000
>> +#define PPC405EP_SRAM_SIZE  (512 * KiB)
>> +#define PPC405EP_FLASH_BASE 0xFFF80000
> 
> Are these specific to the 405EP SoC itself or the board? 

yes.

> Maybe it's better to put these in the board .c file and get rid of the ppc405.h later if there are no 405 specific parts needed. 

Not yet. But I am moving to the ppc405_uc.c file parts related to
the board information and ppc405_uc.c is really 405 specific. See
other patches.

> It's currently included also by 440 machines because it has some functions re-used by them 

Indeed in hw/ppc/sam460ex.c:

	ppc405_ebc_init(env)

> but those may be gone when QOM-ifying these eventually 

QOM-ifying the 405 devices should be straight forward for most.
We can do a few to cleanup the dependencies like above. All models
will need a CPU link for the dcr handlers.

> or could be moved to a ppc4xx.h instead. 

yes. that would be fine but not necessary if we QOM-ify some parts.

> I've tried to make a distinction between 405, 440 and 4xx parts (the latter common to both) when adding sam460ex but did not finish this clean up completely.

I have a little patch removing all the printfs I will send soon.
Then we can move some code around.

I put some efforts on the 405 because it has been dead for so long
and at some point we need to identify dead code. It's alive now,
4.16 boots, we could even add PCI and network but first, user space
needs some care.

Thanks,

C.
  

