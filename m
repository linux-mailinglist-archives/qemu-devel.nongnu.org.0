Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18D308905
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:20:43 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SlR-0002nh-8N
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l5Sib-00015z-Kp
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:17:41 -0500
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l5SiZ-0005VV-F4
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:17:41 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id BA28F25FDD5;
 Fri, 29 Jan 2021 13:17:35 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 29 Jan
 2021 13:17:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001de346a69-3a77-437e-81c0-4286539890f1,
 1047C7D7CBF627F9D51619F8EB187DD3EDDBAFD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2] ppc/pnv: Set default RAM size to 1 GB
To: Greg Kurz <groug@kaod.org>
References: <20210129111719.790692-1-clg@kaod.org>
 <20210129124115.750432da@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <704b35e9-2a8e-e14c-05cc-85f6e5f603bb@kaod.org>
Date: Fri, 29 Jan 2021 13:17:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129124115.750432da@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e646add9-f463-4222-9c5e-c49e0278d87b
X-Ovh-Tracer-Id: 18221282621075131299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgdefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 12:41 PM, Greg Kurz wrote:
> On Fri, 29 Jan 2021 12:17:19 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> The memory layout of the PowerNV machine is defined as :
>>
>>   #define KERNEL_LOAD_BASE	((void *)0x20000000)
>>   #define KERNEL_LOAD_SIZE	0x08000000
>>
>>   #define INITRAMFS_LOAD_BASE	KERNEL_LOAD_BASE + KERNEL_LOAD_SIZE
>>   #define INITRAMFS_LOAD_SIZE	0x08000000
>>
>>   #define SKIBOOT_BASE		0x30000000
>>   #define SKIBOOT_SIZE		0x01c10000
>>
>>   #define CPU_STACKS_BASE	(SKIBOOT_BASE + SKIBOOT_SIZE)
>>   #define STACK_SHIFT		15
>>   #define STACK_SIZE		(1 << STACK_SHIFT)
>>
>> The overall size of the CPU stacks is (max PIR + 1) * 32K and the
>> machine easily reaches 800MB of minimum required RAM.
>>
>> Any value below will result in a skiboot crash :
>>
>>     [    0.034949905,3] MEM: Partial overlap detected between regions:
>>     [    0.034959039,3] MEM: ibm,firmware-stacks [0x31c10000-0x3a450000] (new)
>>     [    0.034968576,3] MEM: ibm,firmware-allocs-memory@0 [0x31c10000-0x38400000]
>>     [    0.034980367,3] Out of memory adding skiboot reserved areas
>>     [    0.035074945,3] ***********************************************
>>     [    0.035093627,3] < assert failed at core/mem_region.c:1129 >
>>     [    0.035104247,3]     .
>>     [    0.035108025,3]      .
>>     [    0.035111651,3]       .
>>     [    0.035115231,3]         OO__)
>>     [    0.035119198,3]        <"__/
>>     [    0.035122980,3]         ^ ^
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/ppc/pnv.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>> index 50810df83815..77af846cdfea 100644
>> --- a/hw/ppc/pnv.c
>> +++ b/hw/ppc/pnv.c
>> @@ -21,6 +21,7 @@
>>  #include "qemu-common.h"
>>  #include "qemu/datadir.h"
>>  #include "qemu/units.h"
>> +#include "qemu/cutils.h"
>>  #include "qapi/error.h"
>>  #include "sysemu/qtest.h"
>>  #include "sysemu/sysemu.h"
>> @@ -725,8 +726,11 @@ static void pnv_init(MachineState *machine)
>>      DeviceState *dev;
>>  
>>      /* allocate RAM */
>> -    if (machine->ram_size < (1 * GiB)) {
>> -        warn_report("skiboot may not work with < 1GB of RAM");
>> +    if (machine->ram_size < mc->default_ram_size) {
>> +        char *sz = size_to_str(mc->default_ram_size);
>> +        error_report("Invalid RAM size, should be bigger than %s", sz);
>> +        g_free(sz);
> 
> FWIW you could even not call g_free() at all since this is an
> exit path and this code is unlikely to be reused differently,
> or stay clean and tag 'sz' with g_autofree as recommended in
> CODING_STYLE.

Indeed. I copied that part from another machine and it should
disappear if we introduce a 'min_ram_size' MachineClass attribute.

> Anyway, this is definitely an improvement so:
> 
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks,

C.

 
>> +        exit(EXIT_FAILURE);
>>      }
>>      memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>>  
>> @@ -1994,7 +1998,7 @@ static void pnv_machine_class_init(ObjectClass *oc, void *data)
>>       * RAM defaults to less than 2048 for 32-bit hosts, and large
>>       * enough to fit the maximum initrd size at it's load address
>>       */
>> -    mc->default_ram_size = INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
>> +    mc->default_ram_size = 1 * GiB;
>>      mc->default_ram_id = "pnv.ram";
>>      ispc->print_info = pnv_pic_print_info;
>>      nc->nmi_monitor_handler = pnv_nmi;
> 


