Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B773A91B7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 08:12:24 +0200 (CEST)
Received: from localhost ([::1]:57494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltOml-00068p-9S
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 02:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ltOld-0005BB-Oa
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 02:11:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45824
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ltOlb-0000xD-8z
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 02:11:13 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ltOl6-0009kP-VA; Wed, 16 Jun 2021 07:10:45 +0100
To: Finn Thain <fthain@fastmail.com.au>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
 <20a706c7-9b44-13cc-b294-1ee0f3cff6bb@amsat.org>
 <2a2fff87-6e6f-3362-24e3-760f1aea4573@ilande.co.uk>
 <17f0917-de30-6771-26d0-7a10214221ca@nippy.intranet>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <38512250-86bb-7cbd-caca-9bc0378e54e8@ilande.co.uk>
Date: Wed, 16 Jun 2021 07:10:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <17f0917-de30-6771-26d0-7a10214221ca@nippy.intranet>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/5] dp8393x: fixes for MacOS toolbox ROM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
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
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hpoussin@reactos.org, aurelien@aurel32.net,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/2021 04:09, Finn Thain wrote:

> On Mon, 14 Jun 2021, Mark Cave-Ayland wrote:
> 
>> On 14/06/2021 06:36, Philippe Mathieu-Daudé wrote:
>>
>>> Cc'ing Finn & Laurent.
>>>
>>> On 6/13/21 6:37 PM, Mark Cave-Ayland wrote:
>>>> Here is the next set of patches from my attempts to boot MacOS under
>>>> QEMU's Q800 machine related to the Sonic network adapter.
>>>>
>>>> Patches 1 and 2 sort out checkpatch and convert from DPRINTF macros
>>>> to trace-events.
>>>>
>>>> Patch 3 fixes the PROM checksum and MAC address storage format as
>>>> found by stepping through the MacOS toolbox.
>>>>
>>>> Patch 4 ensures that the CPU loads/stores are correctly converted to
>>>> 16-bit accesses for the network card and patch 5 fixes a bug when
>>>> selecting the index specified for CAM entries.
>>>>
>>>> NOTE TO MIPS MAINTAINERS:
>>>>
>>>> - The Sonic network adapter is used as part of the MIPS jazz machine, however
>>>>     I don't have a working kernel and system to test it with. Any
>>>>     pointers to test images would be appreciated.
>>>>
>>>> - The changes to the PROM checksum in patch 3 were determined by stepping
>>>>     through the MacOS toolbox, and is different from the existing
>>>>     algorithm. Has the current PROM checksum algorithm been validated
>>>>     on a MIPS guest or was it just a guess? It might be that 2
>>>>     different algorithms are needed for the Q800 vs. Jazz machine.
>>>>
>>>> - My current guess is the jazzsonic driver is broken since the last set of
>>>>     dp8393x changes as the MIPS jazz machine does not set the "big_endian"
>>>>     property on the dp8393x device. I'd expect that the following diff would
>>>>     be needed, but I can't confirm this without a suitable test image.
>>>>
>>>> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
>>>> index 1e1cf8154e..1df67035aa 100644
>>>> --- a/hw/mips/jazz.c
>>>> +++ b/hw/mips/jazz.c
>>>> @@ -280,6 +280,7 @@ static void mips_jazz_init(MachineState *machine,
>>>>                dev = qdev_new("dp8393x");
>>>>                qdev_set_nic_properties(dev, nd);
>>>>                qdev_prop_set_uint8(dev, "it_shift", 2);
>>>> +             qdev_prop_set_bit(dev, "big_endian", true);
>>>>                object_property_set_link(OBJECT(dev), "dma_mr",
>>>>                                         OBJECT(rc4030_dma_mr), &error_abort);
>>>>                sysbus = SYS_BUS_DEVICE(dev);
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>>
>>>> [q800-macos-upstream patchset series: 3]
>>>>
>>>> Mark Cave-Ayland (5):
>>>>     dp8393x: checkpatch fixes
>>>>     dp8393x: convert to trace-events
>>>>     dp8393x: fix PROM checksum and MAC address storage
>>>>     dp8393x: don't force 32-bit register access
>>>>     dp8393x: fix CAM descriptor entry index
>>>>
>>>>    hw/net/dp8393x.c    | 332 ++++++++++++++++++++++++--------------------
>>>>    hw/net/trace-events |  17 +++
>>>>    2 files changed, 198 insertions(+), 151 deletions(-)
>>
>> Just to add that I've done a large amount of testing on the q800 machine
>> with Linux/MacOS so I'm happy that these patches do the right thing
>> there.
>>
>> The part I'm struggling with is testing against MIPS jazz since I don't
>> have a Linux test image to hand, and there is no documentation in the
>> original commit message as to where the existing PROM checksum algorithm
>> came from.
>>
>> Hervé, can you provide some more information on this? It looks like it
>> was introduced in one of your commits:
>>
>> commit 89ae0ff9b73ee74c9ba707a09a07ad77b9fdccb4
>> Author: Hervé Poussineau <hpoussin@reactos.org>
>> Date:   Wed Jun 3 22:45:46 2015 +0200
>>
>>      net/dp8393x: add PROM to store MAC address
>>
>>      Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>      Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
>>      Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
>>      Signed-off-by: Leon Alrae <leon.alrae@imgtec.com>
>>
> 
> With "qemu-system-mips -M magnum ..." I was able to boot both Linux and
> NetBSD. That was after commit 89ae0ff9b7 ("net/dp8393x: add PROM to store
> MAC address"). But that's not to say that the MAC address was decoded
> correctly.
> 
> Please see,
> https://lore.kernel.org/qemu-devel/alpine.LNX.2.21.1.1912241504560.11@nippy.intranet/
> 
> The Linux/mips (jazzsonic) testing that I did back in 2019 used a custom
> busybox initramfs. The NetBSD/mips testing used the official CD ISO image.
> I will look into reviving those test harnesses because I think patch 4/5
> and the proposed big-endian flag will need some regression testing.

Thanks for the reference - I've just discovered from the link above something I 
hadn't realised which is that -M magnum is present on both qemu-system-mips64 *AND* 
qemu-system-mips64el indicating that the endian needs to be set accordingly. 
Fortunately it should be possible to use a similar solution as to that used for the 
malta machine i.e.:


diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1e1cf8154e..16b32d2b2c 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -124,7 +124,7 @@ static void mips_jazz_init(MachineState *machine,
  {
      MemoryRegion *address_space = get_system_memory();
      char *filename;
-    int bios_size, n;
+    int bios_size, n, big_endian;
      Clock *cpuclk;
      MIPSCPU *cpu;
      MIPSCPUClass *mcc;
@@ -155,6 +155,12 @@ static void mips_jazz_init(MachineState *machine,
          [JAZZ_PICA61] = {33333333, 4},
      };

+#ifdef TARGET_WORDS_BIGENDIAN
+    big_endian = 1;
+#else
+    big_endian = 0;
+#endif
+
      if (machine->ram_size > 256 * MiB) {
          error_report("RAM size more than 256Mb is not supported");
          exit(EXIT_FAILURE);
@@ -280,6 +286,7 @@ static void mips_jazz_init(MachineState *machine,
              dev = qdev_new("dp8393x");
              qdev_set_nic_properties(dev, nd);
              qdev_prop_set_uint8(dev, "it_shift", 2);
+            qdev_prop_set_bit(dev, "big_endian", big_endian);
              object_property_set_link(OBJECT(dev), "dma_mr",
                                       OBJECT(rc4030_dma_mr), &error_abort);
              sysbus = SYS_BUS_DEVICE(dev);


If you have bootable images available for -M magnum under qemu-system-mips64 and 
qemu-system-mips64el, is it possible to make them available to others for testing?


ATB,

Mark.

