Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A78D469CBE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 16:22:49 +0100 (CET)
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muFpI-0005FZ-4b
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 10:22:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muFnW-0003kb-W8
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:20:59 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:37381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1muFnU-0006fv-8B
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 10:20:58 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8E5CE20B45;
 Mon,  6 Dec 2021 15:20:52 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 16:20:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00593ee7186-942d-46b1-9787-2a74bda58b06,
 4EE5CA355A73348BB336A65EF5ADB9B11F7CB924) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5e290b81-e3ac-4032-3f7c-99f6cd3d8121@kaod.org>
Date: Mon, 6 Dec 2021 16:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/15] ppc/ppc405: Update U-Boot board information for
 hotfoot
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-16-clg@kaod.org>
 <370b0897-b87f-bcb8-ccaf-8212dbf8d23c@amsat.org>
 <656054f1-5ec0-bf37-7da3-4fb7a6565282@kaod.org>
 <bd87c534-7b64-ff37-f795-bdfd04fceed5@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <bd87c534-7b64-ff37-f795-bdfd04fceed5@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a9441dd1-83e6-4219-88fd-89bf46e463a4
X-Ovh-Tracer-Id: 3050062849736018796
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedutedufeeufeefvdejieeiffelgeetgfeltdfhleeuveeiteegkeeuvdfftdetheenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.076,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/6/21 14:40, Thomas Huth wrote:
> On 06/12/2021 14.37, Cédric Le Goater wrote:
>> On 12/6/21 14:27, Philippe Mathieu-Daudé wrote:
>>> On 12/6/21 11:37, Cédric Le Goater wrote:
>>>> When support for the ESTeem 195E (PPC405EP) SBC (hotfoot) board was
>>>> added to Linux, a different layout of U-Boot board information was
>>>> introduced because the FW of these boards was an ancient U-Boot
>>>> without dual ethernet support [1].
>>>>
>>>> Change the QEMU PPC405 board information to match the hotfoot board
>>>> and let the ref405ep machine boot from Linux directly. Only the CPU
>>>> frequency is required.
>>>>
>>>> This is brutal force. We could possibly add a machine option or a
>>>> ref405ep machine class to update the board information accordingly.
>>>>
>>>> A similar change would be required in U-Boot. The alternative is to
>>>> change Linux.
>>>>
>>>> [1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html
>>>>
>>>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   hw/ppc/ppc405_uc.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 45 insertions(+)
>>>>
>>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>>> index ec97b22bd019..649bb2b0daf5 100644
>>>> --- a/hw/ppc/ppc405_uc.c
>>>> +++ b/hw/ppc/ppc405_uc.c
>>>> @@ -41,6 +41,49 @@
>>>>   #include "qapi/error.h"
>>>>   #include "trace.h"
>>>> +/*
>>>> + * Linux hotfoot board information based on a production bootloader
>>>> + * (u-boot 1.2.0.x) plus changes not upstream.
>>>> + *
>>>> + * https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html
>>>> + */
>>>> +struct linux_hotfoot_bd_info {
>>>> +    long unsigned int          bi_memstart;          /*     0     4 */
>>>> +    long unsigned int          bi_memsize;           /*     4     4 */
>>>> +    long unsigned int          bi_flashstart;        /*     8     4 */
>>>> +    long unsigned int          bi_flashsize;         /*    12     4 */
>>>> +    long unsigned int          bi_flashoffset;       /*    16     4 */
>>>> +    long unsigned int          bi_sramstart;         /*    20     4 */
>>>> +    long unsigned int          bi_sramsize;          /*    24     4 */
>>>> +    long unsigned int          bi_bootflags;         /*    28     4 */
>>>> +    long unsigned int          bi_ip_addr;           /*    32     4 */
>>>> +    unsigned char              bi_enetaddr[6];       /*    36     6 */
>>>> +    unsigned char              bi_enet1addr[6];      /*    42     6 */
>>>> +    short unsigned int         bi_ethspeed;          /*    48     2 */
>>>> +    long unsigned int          bi_intfreq;           /*    52     4 */
>>>> +    long unsigned int          bi_busfreq;           /*    56     4 */
>>>> +    long unsigned int          bi_baudrate;          /*    60     4 */
>>>> +    unsigned char              bi_s_version[4];      /*    64     4 */
>>>> +    unsigned char              bi_r_version[32];     /*    68    32 */
>>>> +    unsigned int               bi_procfreq;          /*   100     4 */
>>>> +    unsigned int               bi_plb_busfreq;       /*   104     4 */
>>>> +    unsigned int               bi_pci_busfreq;       /*   108     4 */
>>>> +    unsigned char              bi_pci_enetaddr[6];   /*   112     6 */
>>>> +    unsigned int               bi_pllouta_freq;      /*   120     4 */
>>>> +    int                        bi_phynum[2];         /*   124     8 */
>>>> +    int                        bi_phymode[2];        /*   132     8 */
>>>> +    unsigned int               bi_opbfreq;           /*   140     4 */
>>>> +    int                        bi_iic_fast[2];       /*   144     8 */
>>>> +};
>>>
>>> Why not use <stdint.h> types?
>>
>> sure.
>>
>> I am waiting for some feedback on this hack updating the in-memory
>> board information. I have the feeling that a new 405 machine
>> is required for this kernel :/
> 
> Yeah, it feels rather wrong to bend the ref405ep machine to match the hotfoot expectations of the kernel this way ... maybe it would be better to add an abstract qemu405 machine to the kernel?

Yes. I prepared that but then I realized that the QEMU board information
layout assigned (luckily) the CPU clock to 33 Mhz and not 0 like U-Boot
did. This structure is completely out of sync :/

Anyhow, the ref405ep machine can boot with a hotfoot Linux kernel without
having to patch the board information. We might merge a ref405ep-hotfoot
machine for the sake of clarity since it is a small and well contained
extension and the machine boots faster.

We still have a user space issue when forking processes. But that's
Christophe's turf.

Thanks,

C.
  

