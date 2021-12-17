Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E29E4792B9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 18:20:26 +0100 (CET)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myGu9-00087X-6w
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 12:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1myGry-0007Ct-Qr
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:18:10 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:59859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1myGrw-00078d-Nm
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:18:10 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D41FA1FE10;
 Fri, 17 Dec 2021 17:18:05 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 17 Dec
 2021 18:18:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002fad74080-7f44-4cba-89e8-1cbca4d74928,
 277755725B32849AD4052F723BD6C67625B53A02) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <25f46261-6dd4-e1e5-cc68-c5a56243858c@kaod.org>
Date: Fri, 17 Dec 2021 18:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/15] ppc/ppc405: decade cleanup
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211206103712.1866296-1-clg@kaod.org>
 <880aa46a-97cb-ad79-b72e-f8276692d750@kaod.org>
 <b3345770-21e2-39f2-8fe2-e9963886e680@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b3345770-21e2-39f2-8fe2-e9963886e680@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: db92f7f2-1a97-49b8-8f15-5f4fc66d7b0a
X-Ovh-Tracer-Id: 14289077193929886569
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeekfeehfedvfeehgfejleevkeehieelheduveekfedvhfelteeivdfftddukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 17:36, Christophe Leroy wrote:
> 
> 
> Le 15/12/2021 à 17:49, Cédric Le Goater a écrit :
>> On 12/6/21 11:36, Cédric Le Goater wrote:
>>> Hello,
>>>
>>> The goal of these changes is to refresh the QEMU ref405ep machine and
>>> enable boot from a Linux kernel without relying on a U-Boot firmware.
>>> The reason for doing so is that we are unable to find a "ppc405_rom.bin"
>>> firmware image or a flash image for the 405EP machines.
>>>
>>> Thomas fought is way through on a v2015.10 U-Boot and taihu defconfig
>>> and provided a compatible image available here :
>>>
>>>    https://gitlab.com/huth/u-boot/-/tree/taihu/
>>>
>>> With this image, QEMU reaches the U-Boot prompt (with a simple
>>> workaround in the SDRAM).
>>>
>>> On the Linux side, the only available 405EP CPU board is the one for
>>> the ESTeem 195E (PPC405EP) SBC (hotfoot). It was added in 2009. The
>>> board information structure in Linux, in U-Boot and in QEMU are not in
>>> sync and the hotfoot board also adds its own flavor because the FW was
>>> an ancient U-Boot without dual ethernet support [1].
>>>
>>> For this kernel to be loaded by the U-Boot image provided by Thomas,
>>> we either need to modify U-Boot or Linux. The same question arise for
>>> QEMU, see the last patch of this series which is controversial. Please
>>> advise !
>>
>> Applied patch 1-14 to ppc-next.
>>
>> I kept the hotfoot hack for later. We need to fix user space first.
>>
> 
> 
> Don't know if this is the reason of our problems but I think there is
> something to investigate around timer interrupts:
> 
> 
> / # cat /proc/interrupts
>              CPU0
>    16:         68       UIC   1 Level     serial
> LOC:          0   Local timer interrupts for timer event device
> LOC:          0   Local timer interrupts for others
> SPU:          0   Spurious interrupts
> PMI:          0   Performance monitoring interrupts
> MCE:          0   Machine check exceptions
> 
> Any idea what the problem can be ? How does QEMU generates timer
> interrupts ?

Indeed.

With some extra QEMU traces (-trace ppc4* -trace ppc_decr*), we can see :

ppc40x_timers_init frequency 33333333
ppc405_gpio_init offet 0xef600700
ppc4xx_gpt_init offet 0xef600000
ppc405ep_clocks_compute FBMUL 0xa 10
ppc405ep_clocks_compute FWDA 0x5 3
ppc405ep_clocks_compute CCDV 0x0 1
ppc405ep_clocks_compute CBDV 0x2 3
ppc405ep_clocks_compute OPDV 0x1 2
ppc405ep_clocks_compute EPDV 0x0 2
ppc405ep_clocks_compute MPDV 0x0 1
ppc405ep_clocks_compute PPDV 0x2 3
ppc405ep_clocks_compute U0DIV 0x46 70
ppc405ep_clocks_compute U1DIV 0x46 70
ppc405ep_clocks_setup Setup PPC405EP clocks - sysclk 33333333 VCO 999999990 PLL out 333333330 Hz
CPU 333333330 PLB 111111110 OPB 55555555 EBC 55555555 MAL 111111110 PCI 37037036 UART0 4761904 UART1 4761904

ppc40x_set_tb_clk new frequency 333333330

   ...

   clocksource: timebase mult[7800000] shift[24] registered
ppc40x_store_pit val 0x7fffffff
ppc4xx_pit_stop
ppc40x_store_pit val 0x82355
ppc4xx_pit_stop
   pid_max: default: 32768 minimum: 301


decrementer timer seems stop and so no decrementer exception. I suppose
this routine is in cause :


static void start_stop_pit (CPUPPCState *env, ppc_tb_t *tb_env, int is_excp)
{
     ppc40x_timer_t *ppc40x_timer;
     uint64_t now, next;

     ppc40x_timer = tb_env->opaque;
     if (ppc40x_timer->pit_reload <= 1 ||
         !((env->spr[SPR_40x_TCR] >> 26) & 0x1) ||
         (is_excp && !((env->spr[SPR_40x_TCR] >> 22) & 0x1))) {
         /* Stop PIT */
         trace_ppc4xx_pit_stop();
         timer_del(tb_env->decr_timer);
     } else {
         trace_ppc4xx_pit_start(ppc40x_timer->pit_reload);
         now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         next = now + muldiv64(ppc40x_timer->pit_reload,
                               NANOSECONDS_PER_SECOND, tb_env->decr_freq);
         if (is_excp)
             next += tb_env->decr_next - now;
         if (next == now)
             next++;
         timer_mod(tb_env->decr_timer, next);
         tb_env->decr_next = next;
     }
}


C.

