Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEAE433933
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 16:49:54 +0200 (CEST)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqR6-0008CR-1Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 10:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mcq2U-0005Wq-Hn; Tue, 19 Oct 2021 10:24:26 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:40171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mcq2O-000298-MF; Tue, 19 Oct 2021 10:24:23 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYbbP2Kzyz9sSn;
 Tue, 19 Oct 2021 16:24:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOuRB4rMcFZ8; Tue, 19 Oct 2021 16:24:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYbbJ2Gf3z9sSg;
 Tue, 19 Oct 2021 16:24:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F2A038B7F5;
 Tue, 19 Oct 2021 16:24:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RpcmviqqUJvJ; Tue, 19 Oct 2021 16:24:11 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.83])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E4A8B8B7F2;
 Tue, 19 Oct 2021 16:24:09 +0200 (CEST)
Subject: Re: Deprecate the ppc405 boards in QEMU?
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
 <262b6af0-b5c5-1d28-2f48-7a021c5cd0b9@csgroup.eu>
 <a3d28088-2012-9450-5491-1de77d962da7@eik.bme.hu>
 <d8c9661e-4439-b3f8-48d8-b6f659e862c8@csgroup.eu>
Message-ID: <5491ed41-7328-3949-12ad-1a94f0f525d1@csgroup.eu>
Date: Tue, 19 Oct 2021 16:24:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d8c9661e-4439-b3f8-48d8-b6f659e862c8@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=93.17.235.10;
 envelope-from=christophe.leroy@csgroup.eu; helo=pegase2.c-s.fr
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 19/10/2021 à 15:44, Christophe Leroy a écrit :
> 
> 
> Le 19/10/2021 à 14:38, BALATON Zoltan a écrit :
>> On Tue, 19 Oct 2021, Christophe Leroy wrote:
>>> Le 19/10/2021 à 13:11, Thomas Huth a écrit :
>>>> On 19/10/2021 12.07, BALATON Zoltan wrote:
>>>>> On Tue, 19 Oct 2021, Christophe Leroy wrote:
>>>>>> Le 19/10/2021 à 11:39, Thomas Huth a écrit :
>>>>>>> On 19/10/2021 11.31, Christophe Leroy wrote:
>>>>>>>> Le 11/10/2021 à 15:24, Thomas Huth a écrit :
>>>>>>>>> On 11/10/2021 11.20, David Gibson wrote:
>>>>>>>>>> On Mon, Oct 11, 2021 at 10:10:36AM +0200, Thomas Huth wrote:
>>>>>>>>>>> On 06/10/2021 09.25, Thomas Huth wrote:
>>>>>>>>>>>> On 05/10/2021 23.53, BALATON Zoltan wrote:
>>>>>>>>>>>> [...]
>>>>>>>>>>>>> Maybe these 405 boards in QEMU ran with modified firmware 
>>>>>>>>>>>>> where the
>>>>>>>>>>>>> memory detection was patched out but it seems to detect the 
>>>>>>>>>>>>> RAM so I
>>>>>>>>>>>>> wonder where it gets that from. Maybe by reading the SDRAM
>>>>>>>>>>>>> controller DCRs ppc4xx_sdram_init() sets up. Then I'm not 
>>>>>>>>>>>>> sure what
>>>>>>>>>>>>> it needs the SPD for, I forgot how this worked on sam460ex. 
>>>>>>>>>>>>> Maybe
>>>>>>>>>>>>> for the speed calibration, so could be it detects ram by 
>>>>>>>>>>>>> reading
>>>>>>>>>>>>> DCRs then tries to get SPD data and that's where it stops 
>>>>>>>>>>>>> as i2c is
>>>>>>>>>>>>> not emulated on taihu. This could be confirmed by checking 
>>>>>>>>>>>>> what it
>>>>>>>>>>>>> pokes with -d guest_errors that shows accesses to missing 
>>>>>>>>>>>>> devices
>>>>>>>>>>>>> but don't know where 405 has the i2c controller and if it's 
>>>>>>>>>>>>> the same
>>>>>>>>>>>>> as newer SoCs. If so that could be reused and an i2c bus 
>>>>>>>>>>>>> could be
>>>>>>>>>>>>> added with the SPD data like in sam460ex to make u-boot 
>>>>>>>>>>>>> happy or you
>>>>>>>>>>>>> could skip this in u-boot.
>>>>>>>>>>>>
>>>>>>>>>>>> FWIW, I've just tried the latter (skipping the sdram init in 
>>>>>>>>>>>> u-boot),
>>>>>>>>>>>> and indeed, I can get to the u-boot prompt now.
>>>>>>>>>>> [...]> I've also attached the patch with my modifications to 
>>>>>>>>>>> u-boot.
>>>>>>>>>>>
>>>>>>>>>>> FYI, the changes can now be found on this branch here:
>>>>>>>>>>>
>>>>>>>>>>>   https://gitlab.com/huth/u-boot/-/commits/taihu
>>>>>>>>>>>
>>>>>>>>>>> I also added a gitlab-CI file, so you can now download the 
>>>>>>>>>>> u-boot.bin as an
>>>>>>>>>>> artifact from the corresponding pipeline, e.g.:
>>>>>>>>>>>
>>>>>>>>>>>   https://gitlab.com/huth/u-boot/-/jobs/1667201028
>>>>>>>>>>
>>>>>>>>>> Thanks.
>>>>>>>>>>
>>>>>>>>>> Are you going to send a v2 of your proposed deprecation patches?
>>>>>>>>>
>>>>>>>>> No, since there was interest in keeping the 405 boards for 
>>>>>>>>> testing the 405 code in the Linux kernel, and since there is 
>>>>>>>>> now a way to do at least some very basic testing of these 
>>>>>>>>> boards (with the u-boot firmware), I don't plan to respin the 
>>>>>>>>> deprecation patch. I just sent a patch for adding the boards to 
>>>>>>>>> our CI instead:
>>>>>>>>>
>>>>>>>>>   https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg02072.html 
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>> I have downloaded your u-boot.bin and tried it with both QEMU 
>>>>>>>> 5.2.0 and mainline, and I get:
>>>>>>>>
>>>>>>>> ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: 
>>>>>>>> assertion failed: (qemu_mutex_iothread_locked())
>>>>>>>> Bail out! 
>>>>>>>> ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: 
>>>>>>>> assertion failed: (qemu_mutex_iothread_locked())
>>>>>>>> Abandon (core dumped)
>>>>>>>>
>>>>>>>> I see in the mail history that you got that problem as well at 
>>>>>>>> some point. How did you fix it ?
>>>>>>>
>>>>>>> You need this patch here to fix this issue:
>>>>>>>
>>>>>>>   https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg01019.html 
>>>>>>>
>>>>>>>   ("hw/ppc: Fix iothread locking in the 405 code")
>>>>>>>
>>>>>>
>>>>>> Thank you.
>>>>>>
>>>>>> Is there anything special to do then in order to boot a Linux 
>>>>>> kernel ?
>>>>>>
>>>>>> I build the uImage for ppc40x_defconfig
>>>>>>
>>>>>> I use the following command, but it does nothing, it stays in 
>>>>>> uboot prompt as when I don't get a kernel argument
>>>>>>
>>>>>>     ~/qemu/build/qemu-system-ppc -M taihu -bios 
>>>>>> ~/Téléchargements/u-boot.bin -serial null -serial mon:stdio 
>>>>>> -kernel arch/powerpc/boot/uImage
>>>>>
>>>>> I'm not sure using -bios and -kernel together makes sense, it 
>>>>> probably starts u-boot in this case and you have to load and start 
>>>>> the kernel from u-boot as you'd notmally do on a real machine. 
>>>>> Alternatively you could use -kernel instead of -bios which then 
>>>>> loads a kernel and starts it directly but not sure if it needs a 
>>>>> firmware to work.
>>>>>
>>>>> Ot I could be completely wrong as I don't know this machine and 
>>>>> haven't tried it.
>>>>
>>>> Actually, these 405 machines are quite weird. They refuse to boot 
>>>> without bios image, so you currently need the firmware image for sure.
>>>>
>>>> OTOH, when you look at the ref405ep_init() function, it seems that 
>>>> at least the ref405ep machine was once supposed to start a kernel 
>>>> directly:
>>>>
>>>>          env->nip = KERNEL_LOAD_ADDR;
>>>>
>>>> ... however, this does not seem to work anymore, the initial NIP is 
>>>> always reset to the firmware entry when the board resets. Not sure 
>>>> if/how this ever used worked ...
>>>>
>>>
>>> On the e500 we use both -bios and -kernel:
>>>
>>>     qemu-system-ppc64 -nographic -M ppce500 -cpu e5500 -m 1G -bios 
>>> u-boot-e500 -kernel ./arch/powerpc/boot/uImage  -initrd 
>>> ./qemu/rootfs.cpio.gz -append noreboot -s
>>>
>>>
>>> Uboot for e500 has the following environment:
>>>
>>>     => printenv
>>>     bootcmd=test -n "$qemu_kernel_addr" && bootm $qemu_kernel_addr - 
>>> $fdt_addr_r
>>>     fdt_addr_r=e8000000
>>>     qemu_kernel_addr=2000000
>>>     stderr=serial
>>>     stdin=serial
>>>     stdout=serial
>>>
>>>     Environment size: 164/8188 bytes
>>
>> The -bios and -kernel options are handled by the machine code so these 
>> work differently on every machine depending on what they decide to do 
>> for these.
>>
>>> I think I need to findout where QEMU loads the kernel when using 
>>> TAIHU machine.
>>
>> Look in qemu/hw/ppc/ppc405_boards.c it has
>> #define KERNEL_LOAD_ADDR 0x00000000
>> but it does not seem to do anything with a kernel other than loading 
>> it. I don't see anything that would start the kernel. I think this 
>> board is probably unfinished, if you want to use it you may need to 
>> implement some stuff in it. Also try using -d unimp,guest_errors 
>> options to see errors when something goes wrong otherwise you may not 
>> get much feedback.
>>
> 
> There is something:
> 
> => bootm 0
> Wrong Image Format for bootm command
> ERROR: can't get kernel image!
> 
> => md 0
> 00000000: 00000000 b497aae1 616e9207 003227a4    '..V....an...2'.
> 00000010: 00000000 00000000 ee36255f 05070201    .........6%_....
> 00000020: 4c696e75 782d352e 31352e30 2d726335    Linux-5.15.0-rc5
> 00000030: 2d303232 32342d67 61336330 30376164    -02224-ga3c007ad
> 00000040: 1f8b0800 00000000 0203ec5c 0f7013e7    ...........\.p..
> 
> => mw.l 0 0x27051956
> 
> => bootm 0
> ## Booting kernel from Legacy Image at 00000000 ...
>     Image Name:   Linux-5.15.0-rc5-02224-ga3c007ad
>     Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>     Data Size:    3286948 Bytes = 3.1 MiB
>     Load Address: 00000000
>     Entry Point:  00000000
>     Verifying Checksum ... Bad Data CRC
> ERROR: can't get kernel image!
> 
> 
> So we have something but it seems it gets overwritten by stuff.
> 
> Anyway loading a uImage at 0 is just bad because it is a gzipped image 
> that should get gunzipped at address 0.
> 
> Or should we just copy the raw kernel at 0 and jump to the entry point ? 
> But then we also need a device tree somewhere.
> 

If I change KERNEL_LOAD_ADDR to 0x1000000, I can bootm at that address, 
and it seems it properly decompress the kernel:

=> bootm 0x1000000
## Booting kernel from Legacy Image at 01000000 ...
    Image Name:   Linux-5.15.0-rc5-02224-ga3c007ad
    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
    Data Size:    3296789 Bytes = 3.1 MiB
    Load Address: 00000000
    Entry Point:  00000000
    Verifying Checksum ... OK
    Uncompressing Kernel Image ... OK


And it initialises the MMU properly.

Then it gets stuck because there is no devicetree.

(gdb) bt
#0  0xc00094cc in udelay ()
#1  0xc0025d34 in panic ()
#2  0xc06415a0 in early_init_devtree ()
#3  0xc0641da8 in machine_init ()
#4  0xc0002200 in start_here ()

Christophe

