Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5CF30885A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:39:20 +0100 (CET)
Received: from localhost ([::1]:42718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S7T-0005Rt-JI
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5RjU-0007tV-FC; Fri, 29 Jan 2021 06:14:32 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:50761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5RjS-0004NS-0W; Fri, 29 Jan 2021 06:14:32 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5D6C8805D623;
 Fri, 29 Jan 2021 12:14:25 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 29 Jan
 2021 12:14:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001aabfd1d5-c43e-4e34-92b5-404485feb48c,
 1047C7D7CBF627F9D51619F8EB187DD3EDDBAFD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] pnv/ppc: Set default RAM size to 1 GB
To: Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210129092936.769412-1-clg@kaod.org>
 <efcf457d-8390-4352-6180-ac9fd6d78b24@redhat.com>
 <20210129111115.52d1d862@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e5f6547e-2589-7c95-f229-2059bc60f522@kaod.org>
Date: Fri, 29 Jan 2021 12:14:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129111115.52d1d862@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7dc88a48-9e64-405c-aa4f-13ccf77cad7a
X-Ovh-Tracer-Id: 17154492458986146598
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 11:11 AM, Greg Kurz wrote:
> On Fri, 29 Jan 2021 10:39:12 +0100
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 1/29/21 10:29 AM, Cédric Le Goater wrote:
>>> Any value below will result in a skiboot crash :
>>>
>>>     [    0.034949905,3] MEM: Partial overlap detected between regions:
>>>     [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] (new)
>>>     [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x38400000]
>>>     [    0.034980367,3] Out of memory adding skiboot reserved areas
>>>     [    0.035074945,3] ***********************************************
>>>     [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
>>>     [    0.035104247,3]     .
>>>     [    0.035108025,3]      .
>>>     [    0.035111651,3]       .
>>>     [    0.035115231,3]         OO__)
>>>     [    0.035119198,3]        <"__/
>>>     [    0.035122980,3]         ^ ^
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/ppc/pnv.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>>> index 50810df83815..70ce12f6dc73 100644
>>> --- a/hw/ppc/pnv.c
>>> +++ b/hw/ppc/pnv.c
>>> @@ -1994,7 +1994,7 @@ static void pnv_machine_class_init(ObjectClass *oc, void *data)
>>>       * RAM defaults to less than 2048 for 32-bit hosts, and large
>>>       * enough to fit the maximum initrd size at it's load address
>>>       */
>>> -    mc->default_ram_size = INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
>>> +    mc->default_ram_size = 1 * GiB;
>>
>> Maybe also just in case add before the definitions:
>>
>>   QEMU_BUILD_BUG_ON(INITRD_LOAD_ADDR + INITRD_MAX_SIZE > 1 * GiB);
>>
> 
> or
> 
>     mc->default_ram_size = MAX(1 * GiB, INITRD_LOAD_ADDR + INITRD_MAX_SIZE)


The memory layout of the PowerNV machine is defined as :

  #define KERNEL_LOAD_BASE	((void *)0x20000000)
  #define KERNEL_LOAD_SIZE	0x08000000

  #define INITRAMFS_LOAD_BASE	KERNEL_LOAD_BASE + KERNEL_LOAD_SIZE
  #define INITRAMFS_LOAD_SIZE	0x08000000

  #define SKIBOOT_BASE		0x30000000

  /* bunch of areas: head, console buffers, TCEs, etc  */
  #define SKIBOOT_SIZE		0x01c10000
  #define CPU_STACKS_BASE	(SKIBOOT_BASE + SKIBOOT_SIZE)

  #define STACK_SHIFT		15
  #define STACK_SIZE		(1 << STACK_SHIFT)

The overall size of the CPU stacks is (max PIR + 1) * 32K and the 
machine easily reaches 800MB of minimum required RAM.

I don't remember where INITRD_LOAD_ADDR + INITRD_MAX_SIZE came from
but it is a bit bogus.

For now, I will send a v2 with a stronger check similar to what other 
machines do. May be we should consider adding a 'min_ram_size' in
MachineClass. 

Thanks,

C. 

