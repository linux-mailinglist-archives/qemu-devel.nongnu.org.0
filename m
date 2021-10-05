Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F4423318
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 23:55:02 +0200 (CEST)
Received: from localhost ([::1]:48120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXsOr-0000b5-38
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 17:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXsNT-00087P-R4; Tue, 05 Oct 2021 17:53:35 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:17358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXsNQ-0001Bc-LE; Tue, 05 Oct 2021 17:53:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 861047462D3;
 Tue,  5 Oct 2021 23:53:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4F569745953; Tue,  5 Oct 2021 23:53:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4C5677457EE;
 Tue,  5 Oct 2021 23:53:26 +0200 (CEST)
Date: Tue, 5 Oct 2021 23:53:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU?
In-Reply-To: <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
Message-ID: <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1608973684-1633470806=:46203"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1608973684-1633470806=:46203
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 5 Oct 2021, Thomas Huth wrote:
> On 05/10/2021 14.17, BALATON Zoltan wrote:
>> On Tue, 5 Oct 2021, Thomas Huth wrote:
>>> On 05/10/2021 10.07, Thomas Huth wrote:
>>>> On 05/10/2021 10.05, Alexey Kardashevskiy wrote:
>>> [...]
>>>>> What is so special about taihu?
>>>> 
>>>> taihu is the other 405 board defined in hw/ppc/ppc405_boards.c (which I 
>>>> suggested to deprecate now)
>>> 
>>> I've now also played with the u-boot sources a little bit, and with some 
>>> bit of tweaking, it's indeed possible to compile the old taihu board 
>>> there. However, it does not really work with QEMU anymore, it immediately 
>>> triggers an assert():
>>> 
>>> $ qemu-system-ppc -M taihu -bios u-boot.bin -serial null -serial mon:stdio
>>> **
>>> ERROR:accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion failed: 
>>> (qemu_mutex_iothread_locked())
>>> Aborted (core dumped)
>> 
>> Maybe it's similar to this: 2025fc6766ab25501e0041c564c44bb0f7389774 The 
>> helper_load_dcr() and helper_store_dcr() in target/ppc/timebase_helper.c 
>> seem to lock/unlock the iothread but I'm not sure if that's necessary. Also 
>> not sure why this does not happen with 460ex but that maybe uses different 
>> code.
>
> It's rather the other way round, the locking is missing here instead. I can 
> get the serial output with the current QEMU when I add the following patch 
> (not sure whether that's the right spot, though):
>
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index f5d012f860..bb57f1c9ed 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -336,6 +336,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
> {
>     PowerPCCPU *cpu = env_archcpu(env);
>
> +    qemu_mutex_lock_iothread();
> +
>     switch ((val >> 28) & 0x3) {
>     case 0x0:
>         /* No action */
> @@ -353,6 +355,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
>         ppc40x_system_reset(cpu);
>         break;
>     }
> +
> +    qemu_mutex_unlock_iothread();
> }
>
> /* PowerPC 40x internal IRQ controller */
>
>
>>> Going back to QEMU v2.3.0, I can see at least a little bit of output, but 
>>> it then also triggers an assert() during DRAM initialization:
>>> 
>>> $ qemu-system-ppc -M taihu -bios u-boot.bin -serial null -serial mon:stdio
>>> 
>>> Reset PowerPC core
>>> 
>>> U-Boot 2014.10-rc2-00123-g461be2f96e-dirty (Oct 05 2021 - 10:02:56)
>>> 
>>> CPU:   AMCC PowerPC 405EP Rev. B at 770 MHz (PLB=256 OPB=128 EBC=128)
>>>       I2C boot EEPROM disabled
>>>       Internal PCI arbiter enabled
>>>       16 KiB I-Cache 16 KiB D-Cache
>>> Board: Taihu - AMCC PPC405EP Evaluation Board
>>> I2C:   ready
>>> DRAM:  qemu-system-ppc: memory.c:1693: memory_region_del_subregion: 
>>> Assertion `subregion->container == mr' failed.
>>> Aborted (core dumped)

The assert can be avoided with this patch:

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 980c48944f..3a4a094772 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -169,7 +170,8 @@ static target_ulong sdram_size (uint32_t bcr)
  static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
                            uint32_t bcr, int enabled)
  {
-    if (sdram->bcr[i] & 0x00000001) {
+    if (sdram->bcr[i] & 0x00000001 &&
+        memory_region_is_mapped(&sdram->containers[i])) {
          /* Unmap RAM */
  #ifdef DEBUG_SDRAM
          printf("%s: unmap RAM area " TARGET_FMT_plx " " TARGET_FMT_lx "\n",
@@ -220,8 +222,7 @@ static void sdram_unmap_bcr (ppc4xx_sdram_t *sdram)
          printf("%s: Unmap RAM area " TARGET_FMT_plx " " TARGET_FMT_lx "\n",
                 __func__, sdram_base(sdram->bcr[i]), sdram_size(sdram->bcr[i]));
  #endif
-        memory_region_del_subregion(get_system_memory(),
-                                    &sdram->ram_memories[i]);
+        sdram_set_bcr(sdram, i, 0x00000000, 0);
      }
  }


which then detects 128MiB RAM but leaves the controller disabled and thus 
RAM unmapped then it does not continue (not sure if because of disabled 
SDRAM controller or some other reason). I get this with #define DEBUG_SDRAM:

Board: Taihu - AMCC PPC405EP Evaluation Board
I2C:   ready
DRAM:  dcr_write_sdram: enable SDRAM controller
sdram_set_bcr: Map RAM area 0000000000000000 04000000
sdram_set_bcr: Map RAM area 0000000004000000 04000000
dcr_write_sdram: disable SDRAM controller
sdram_unmap_bcr: Unmap RAM area 0000000000000000 04000000
sdram_set_bcr: unmap RAM area 0000000000000000 04000000
sdram_unmap_bcr: Unmap RAM area 0000000004000000 04000000
sdram_set_bcr: unmap RAM area 0000000004000000 04000000
dcr_write_sdram: enable SDRAM controller
sdram_set_bcr: Map RAM area 0000000000000000 04000000
sdram_set_bcr: Map RAM area 0000000004000000 04000000
sdram_set_bcr: unmap RAM area 0000000004000000 04000000
dcr_write_sdram: disable SDRAM controller
sdram_unmap_bcr: Unmap RAM area 0000000000000000 04000000
sdram_set_bcr: unmap RAM area 0000000000000000 04000000
sdram_unmap_bcr: Unmap RAM area 0000000000000000 00400000
128 MiB

If this is simliar to the sam460ex u-boot then AFAIR that looks for SPD 
data from memory modules and sets up RAM according to those at this point 
(probably the same here as there's an i2c init before DRAM) then also runs 
some speed calibration routine that may need more registers emulated for 
the SDRAM controller. We have very similar code for the PPC440 based 460ex 
in ppc440_uc that I think I've copied from this and modified to work with 
the sam460ex u-boot. This could be cleaned up to share common code more 
but these may have slightly different registers and the bcr value is 
different too which is dependent on the supported memory sizes that are 
different between the two SoCs.

Maybe these 405 boards in QEMU ran with modified firmware where the memory 
detection was patched out but it seems to detect the RAM so I wonder where 
it gets that from. Maybe by reading the SDRAM controller DCRs 
ppc4xx_sdram_init() sets up. Then I'm not sure what it needs the SPD for, 
I forgot how this worked on sam460ex. Maybe for the speed calibration, so 
could be it detects ram by reading DCRs then tries to get SPD data and 
that's where it stops as i2c is not emulated on taihu. This could be 
confirmed by checking what it pokes with -d guest_errors that shows 
accesses to missing devices but don't know where 405 has the i2c 
controller and if it's the same as newer SoCs. If so that could be reused 
and an i2c bus could be added with the SPD data like in sam460ex to make 
u-boot happy or you could skip this in u-boot.

Regards,
BALATON Zoltan
--3866299591-1608973684-1633470806=:46203--

