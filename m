Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1178433335
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:08:19 +0200 (CEST)
Received: from localhost ([::1]:35820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcm2c-0003Ma-QK
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcm1U-0001Gr-Tc; Tue, 19 Oct 2021 06:07:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:33964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcm1R-0001pn-Sf; Tue, 19 Oct 2021 06:07:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4B6E4756040;
 Tue, 19 Oct 2021 12:07:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 14319756036; Tue, 19 Oct 2021 12:07:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 125A3755FE6;
 Tue, 19 Oct 2021 12:07:00 +0200 (CEST)
Date: Tue, 19 Oct 2021 12:07:00 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Deprecate the ppc405 boards in QEMU?
In-Reply-To: <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
Message-ID: <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com>
 <YWQB1FMhQfmqRYxN@yekko> <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-647044434-1634637876=:37773"
Content-ID: <739b7217-6fe6-7a2f-83d-929b03bb832@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-647044434-1634637876=:37773
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <87b9a9db-b18f-243a-2e83-8d8dd21d846@eik.bme.hu>

On Tue, 19 Oct 2021, Christophe Leroy wrote:
> Le 19/10/2021 à 11:39, Thomas Huth a écrit :
>> On 19/10/2021 11.31, Christophe Leroy wrote:
>>> Le 11/10/2021 à 15:24, Thomas Huth a écrit :
>>>> On 11/10/2021 11.20, David Gibson wrote:
>>>>> On Mon, Oct 11, 2021 at 10:10:36AM +0200, Thomas Huth wrote:
>>>>>> On 06/10/2021 09.25, Thomas Huth wrote:
>>>>>>> On 05/10/2021 23.53, BALATON Zoltan wrote:
>>>>>>> [...]
>>>>>>>> Maybe these 405 boards in QEMU ran with modified firmware where the
>>>>>>>> memory detection was patched out but it seems to detect the RAM so I
>>>>>>>> wonder where it gets that from. Maybe by reading the SDRAM
>>>>>>>> controller DCRs ppc4xx_sdram_init() sets up. Then I'm not sure what
>>>>>>>> it needs the SPD for, I forgot how this worked on sam460ex. Maybe
>>>>>>>> for the speed calibration, so could be it detects ram by reading
>>>>>>>> DCRs then tries to get SPD data and that's where it stops as i2c is
>>>>>>>> not emulated on taihu. This could be confirmed by checking what it
>>>>>>>> pokes with -d guest_errors that shows accesses to missing devices
>>>>>>>> but don't know where 405 has the i2c controller and if it's the same
>>>>>>>> as newer SoCs. If so that could be reused and an i2c bus could be
>>>>>>>> added with the SPD data like in sam460ex to make u-boot happy or you
>>>>>>>> could skip this in u-boot.
>>>>>>> 
>>>>>>> FWIW, I've just tried the latter (skipping the sdram init in u-boot),
>>>>>>> and indeed, I can get to the u-boot prompt now.
>>>>>> [...]> I've also attached the patch with my modifications to u-boot.
>>>>>> 
>>>>>> FYI, the changes can now be found on this branch here:
>>>>>> 
>>>>>>   https://gitlab.com/huth/u-boot/-/commits/taihu
>>>>>> 
>>>>>> I also added a gitlab-CI file, so you can now download the u-boot.bin 
>>>>>> as an
>>>>>> artifact from the corresponding pipeline, e.g.:
>>>>>> 
>>>>>>   https://gitlab.com/huth/u-boot/-/jobs/1667201028
>>>>> 
>>>>> Thanks.
>>>>> 
>>>>> Are you going to send a v2 of your proposed deprecation patches?
>>>> 
>>>> No, since there was interest in keeping the 405 boards for testing the 
>>>> 405 code in the Linux kernel, and since there is now a way to do at least 
>>>> some very basic testing of these boards (with the u-boot firmware), I 
>>>> don't plan to respin the deprecation patch. I just sent a patch for 
>>>> adding the boards to our CI instead:
>>>> 
>>>>   https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg02072.html
>>>> 
>>> 
>>> I have downloaded your u-boot.bin and tried it with both QEMU 5.2.0 and 
>>> mainline, and I get:
>>> 
>>> ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion 
>>> failed: (qemu_mutex_iothread_locked())
>>> Bail out! ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: 
>>> assertion failed: (qemu_mutex_iothread_locked())
>>> Abandon (core dumped)
>>> 
>>> I see in the mail history that you got that problem as well at some point. 
>>> How did you fix it ?
>> 
>> You need this patch here to fix this issue:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg01019.html
>>   ("hw/ppc: Fix iothread locking in the 405 code")
>> 
>
> Thank you.
>
> Is there anything special to do then in order to boot a Linux kernel ?
>
> I build the uImage for ppc40x_defconfig
>
> I use the following command, but it does nothing, it stays in uboot prompt as 
> when I don't get a kernel argument
>
> 	~/qemu/build/qemu-system-ppc -M taihu -bios 
> ~/Téléchargements/u-boot.bin -serial null -serial mon:stdio -kernel 
> arch/powerpc/boot/uImage

I'm not sure using -bios and -kernel together makes sense, it probably 
starts u-boot in this case and you have to load and start the kernel from 
u-boot as you'd notmally do on a real machine. Alternatively you could use 
-kernel instead of -bios which then loads a kernel and starts it directly 
but not sure if it needs a firmware to work.

Ot I could be completely wrong as I don't know this machine and haven't 
tried it.

Regards,
BALATON Zoltan
--3866299591-647044434-1634637876=:37773--

