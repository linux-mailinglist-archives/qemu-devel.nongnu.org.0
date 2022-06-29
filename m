Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DE5604FD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 17:56:30 +0200 (CEST)
Received: from localhost ([::1]:50660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6a3J-0006z8-Bn
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 11:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6a1R-0005kz-7P
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:54:33 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:57855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6a1O-00048g-CC
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 11:54:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 743C3112A5541;
 Wed, 29 Jun 2022 17:54:18 +0200 (CEST)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 17:54:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0023478675c-440c-4b1f-b544-736c4e1bfce6,
 74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8072cd96-a032-55f2-0417-1989a7bbeca0@kaod.org>
Date: Wed, 29 Jun 2022 17:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 12/14] aspeed: Make aspeed_board_init_flashes public
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>
References: <20220623102617.2164175-1-pdel@fb.com>
 <20220623102617.2164175-13-pdel@fb.com>
 <e5f51f14-fe75-0d55-6588-a3ca2565f760@kaod.org>
 <EC44C0BD-7BC0-4BDE-9A41-CB1EAA90EC87@fb.com>
 <e07ec4fe-6968-b19a-e649-298a9aaccba5@kaod.org>
 <07128acf-329a-f372-c48c-0c3cb498d3d0@kaod.org> <87zghvh7rt.fsf@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87zghvh7rt.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2f0b3297-9582-42e1-99e7-6c1b329f450b
X-Ovh-Tracer-Id: 8478589249587612478
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/22 16:14, Alex Bennée wrote:
> 
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 6/24/22 18:50, Cédric Le Goater wrote:
>>> On 6/23/22 20:43, Peter Delevoryas wrote:
>>>>
>>>>
>>>>> On Jun 23, 2022, at 8:09 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>>>>
>>>>> On 6/23/22 12:26, Peter Delevoryas wrote:
>>>>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>>>>
>>>>> Let's start simple without flash support. We should be able to
>>>>> load FW blobs in each CPU address space using loader devices.
>>>>
>>>> Actually, I was unable to do this, perhaps because the fb OpenBMC
>>>> boot sequence is a little weird. I specifically _needed_ to have
>>>> a flash device which maps the firmware in at 0x2000_0000, because
>>>> the fb OpenBMC U-Boot SPL jumps to that address to start executing
>>>> from flash? I think this is also why fb OpenBMC machines can be so slow.
>>>>
>>>> $ ./build/qemu-system-arm -machine fby35 \
>>>>       -device loader,file=fby35.mtd,addr=0,cpu-num=0 -nographic \
>>>>       -d int -drive file=fby35.mtd,format=raw,if=mtd
>>> Ideally we should be booting from the flash device directly using
>>> the machine option '-M ast2600-evb,execute-in-place=true' like HW
>>> does. Instructions are fetched using SPI transfers. But the amount
>>> of code generated is tremendous.
> 
> Yeah because there is a potential race when reading from HW so we throw
> away TB's after executing them because we have no way of knowing if it
> has changed under our feet. See 873d64ac30 (accel/tcg: re-factor non-RAM
> execution code) which cleaned up this handling.
> 
>>> See some profiling below for a
>>> run which barely reaches DRAM training in U-Boot.
>>
>> Some more profiling on both ast2500 and ast2600 machines shows :
>>
>>
>> * ast2600-evb,execute-in-place=true :
>>
>> Type               Object  Call site                Wait Time (s)         Count  Average (us)
>> ---------------------------------------------------------------------------------------------
>> BQL mutex  0x564dc03922e0  accel/tcg/cputlb.c:1365       14.21443
>> 32909927          0.43
> 
> This is unavoidable as a HW access needs the BQL held so we will go
> through this cycle every executed instruction.
> 
> Did I miss why the flash contents are not mapped into the physical
> address space? Isn't that how it appear to the processor?


There are two modes :
  
         if (ASPEED_MACHINE(machine)->mmio_exec) {
             memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
                                      &fl->mmio, 0, size);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                         boot_rom);
         } else {
             memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
                                    size, &error_abort);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                         boot_rom);
             write_boot_rom(drive0, FIRMWARE_ADDR, size, &error_abort);
         }

The default boot mode uses the ROM. No issue.

The "execute-in-place=true" option creates an alias on the region of
the flash contents and each instruction is then fetched from the flash
drive with SPI transactions.

With old FW images, using an older U-boot, the machine boots in a couple
of seconds. See the profiling below for a witherspoon-bmc machine using
U-Boot 2016.07.

   qemu-system-arm -M witherspoon-bmc,execute-in-place=true  -drive file=./flash-witherspoon-bmc,format=raw,if=mtd -drive file=./flash-witherspoon-bmc2,format=raw,if=mtd -nographic -nodefaults -snapshot -serial mon:stdio -enable-sync-profile
   ...
   U-Boot 2016.07-00040-g8425e96e2e27-dirty (Jun 24 2022 - 23:21:57 +0200)
   
          Watchdog enabled
   DRAM:  496 MiB
   Flash: 32 MiB
   In:    serial
   Out:   serial
   Err:   serial
   Net:
   (qemu) info sync-profile
   Type               Object  Call site                Wait Time (s)         Count  Average (us)
   ---------------------------------------------------------------------------------------------
   BQL mutex  0x56189610b2e0  accel/tcg/cputlb.c:1365        0.25311      12346237          0.02
   condvar    0x5618970cf220  softmmu/cpus.c:423             0.05506             2      27530.78
   BQL mutex  0x56189610b2e0  util/rcu.c:269                 0.04709             2      23544.26
   condvar    0x561896d0fc78  util/thread-pool.c:90          0.01340            83        161.47
   condvar    0x56189610b240  softmmu/cpus.c:571             0.00005             1         54.93
   condvar    0x56189610b280  softmmu/cpus.c:642             0.00003             1         32.88
   BQL mutex  0x56189610b2e0  util/main-loop.c:318           0.00003            34          0.76
   mutex      0x561896eade00  tcg/region.c:204               0.00002           995          0.02
   rec_mutex  [           2]  util/async.c:682               0.00002           493          0.03
   mutex      [           2]  chardev/char.c:118             0.00001           404          0.03
   ---------------------------------------------------------------------------------------------


However, with recent U-boots, it takes quite a while to reach DRAM training.
Close to a minute. See the profiling below for an ast2500-evb machine using
U-Boot 2019.04.

  qemu-system-arm -M ast2500-evb,execute-in-place=true  -net nic,macaddr=C0:FF:EE:00:00:03,netdev=net0  -drive file=./flash-ast2500-evb,format=raw,if=mtd  -nographic -nodefaults -snapshot -serial mon:stdio  -enable-sync-profile
   qemu-system-arm: warning: Aspeed iBT has no chardev backend
   qemu-system-arm: warning: nic ftgmac100.1 has no peer
   QEMU 7.0.50 monitor - type 'help' for more information
   
   U-Boot 2019.04-00080-g6ca27db3f97b-dirty (Jun 24 2022 - 23:22:03 +0200)
   
   SOC : AST2500-A1
   RST : Power On
   LPC Mode : SIO:Enable : SuperIO-2e
   Eth : MAC0: RGMII, , MAC1: RGMII,
   Model: AST2500 EVB
   DRAM:  448 MiB (capacity:512 MiB, VGA:64 MiB, ECC:off)
   MMC:   sdhci_slot0@100: 0, sdhci_slot1@200: 1
   Loading Environment from SPI Flash... SF: Detected mx25l25635e with page size 256 Bytes, erase size 64 KiB, total 32 MiB
   *** Warning - bad CRC, using default environment
   
   In:    serial@1e784000
   Out:   serial@1e784000
   Err:   serial@1e784000
   Net:   eth0: ethernet@1e660000
   Warning: ethernet@1e680000 (eth1) using random MAC address - 4a:e5:9a:4a:c7:c5
   , eth1: ethernet@1e680000
   Hit any key to stop autoboot:  2
   (qemu) info sync-profile
   Type               Object  Call site                Wait Time (s)         Count  Average (us)
   ---------------------------------------------------------------------------------------------
   condvar    0x561f10c9ef88  util/thread-pool.c:90         10.01196            28     357570.00
   BQL mutex  0x561f102362e0  accel/tcg/cputlb.c:1365        0.29496      14248621          0.02
   condvar    0x561f110325a0  softmmu/cpus.c:423             0.02231             2      11152.57
   BQL mutex  0x561f102362e0  util/rcu.c:269                 0.01447             4       3618.60
   condvar    0x561f10236240  softmmu/cpus.c:571             0.00010             1        102.19
   mutex      0x561f10e9f1c0  tcg/region.c:204               0.00007          3052          0.02
   mutex      [           2]  chardev/char.c:118             0.00003          1486          0.02
   condvar    0x561f10236280  softmmu/cpus.c:642             0.00003             1         29.38
   BQL mutex  0x561f102362e0  accel/tcg/cputlb.c:1426        0.00002           973          0.02
   BQL mutex  0x561f102362e0  util/main-loop.c:318           0.00001            34          0.41
   ---------------------------------------------------------------------------------------------
   

Something in the layout of the FW is making a big difference. One
that could be relevant is that the recent versions are using a device
tree.

There might be no good solution to this issue but I fail to analyze
it correctly. Is there a way to collect information on the usage of
Translation Blocks ?

Thanks,

C.

