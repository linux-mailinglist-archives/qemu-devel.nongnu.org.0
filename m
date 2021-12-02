Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D614466A67
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 20:25:17 +0100 (CET)
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msrhj-0000jW-Vf
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 14:25:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msrcU-0005Bd-UC
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:19:50 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1msrcP-0006fN-EJ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 14:19:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6463221DEB;
 Thu,  2 Dec 2021 19:19:42 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 2 Dec
 2021 20:19:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b5ab9945-9f4c-4410-b037-4f12b0a8f747,
 45319FC7E3E8DDF80F86AAE333D8EDC97449234B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8d21273b-0b81-5041-cfc4-704307aa37cc@kaod.org>
Date: Thu, 2 Dec 2021 20:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] hw/ppc/ppc405_boards: Change kernel load address
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20211202191446.1292125-1-clg@kaod.org>
 <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d8119266-e6f1-969c-d440-d511951178f6@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 69eb8efe-fce1-4646-a330-62a37277d13a
X-Ovh-Tracer-Id: 2039567683788311401
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgdduvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.3,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 20:17, Thomas Huth wrote:
> On 02/12/2021 20.14, Cédric Le Goater wrote:
>> The default addresses to load the kernel, fdt, initrd of AMCC boards
>> in U-Boot v2015.10 are :
>>
>>     "kernel_addr_r=1000000\0"
>>     "fdt_addr_r=1800000\0"
>>     "ramdisk_addr_r=1900000\0"
>>
>> The taihu is one of these boards, the ref405ep is not but we don't
>> have much information on it and both boards have a very similar
>> address space layout. Change the kernel load address to match U-Boot
>> expectations and fix loading.
> 
> You could additionally mention that U-Boot corrupts the kernel if it gets loaded to address 0.

True. The first word is overwritten with zeros. I looked for it
in the code but could not find the reason.

Thanks,

C.

> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/ppc/ppc405_boards.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 972a7a4a3e5d..b4249f4626e6 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -45,7 +45,7 @@
>>   #define BIOS_FILENAME "ppc405_rom.bin"
>>   #define BIOS_SIZE (2 * MiB)
>> -#define KERNEL_LOAD_ADDR 0x00000000
>> +#define KERNEL_LOAD_ADDR 0x01000000
>>   #define INITRD_LOAD_ADDR 0x01800000
>>   #define USE_FLASH_BIOS
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


