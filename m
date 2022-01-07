Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF548752A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 11:04:21 +0100 (CET)
Received: from localhost ([::1]:35406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5m6d-0000Q1-RD
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 05:04:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5m2p-0007zq-7Q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:00:26 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:56407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5m2n-00058k-82
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 05:00:22 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McpeM-1mXGIx1jec-00ZuBi; Fri, 07 Jan 2022 11:00:13 +0100
Message-ID: <0974436c-47cd-6a44-45d2-d318a89e972c@vivier.eu>
Date: Fri, 7 Jan 2022 11:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] q800: fix segfault with invalid MacROM
Content-Language: fr
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20220106122247.771454-1-laurent@vivier.eu>
 <11cea729-2dc1-6985-0c17-8dca37618002@ilande.co.uk>
 <58171f63-7599-edd2-020e-69586ae0d7c8@vivier.eu>
 <11f45045-52fe-ae2a-a986-a19c1cce6247@eik.bme.hu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <11f45045-52fe-ae2a-a986-a19c1cce6247@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2DJZ1N5vmM1sCVScHXudxnbIC5cWXRmJWohBc4lf7dLkveuG5S/
 7OwMy186EhegDTc+1lh+GopeM9s4ObggdN9vwwM7PDKWK0GbbKKaid5pxVN7hbbXJaiBXeI
 Xl8PJXRpmegEoRcxutgjVoLMRqQpXulMfkI8vBNvzhsJhf5w4IGfNj+jyJfzdd2wudKTcpu
 ki+YSbWZGVwE+ubJrdHHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P39cpFLL+7E=:mFB4QyrdfszljUe9/dQTTI
 SDPoxH05fn3Ih/3cVGItL6ygblCU/lb4r+LgQ4GdB03So2CCXo9ml5gZxDwpIdwDceb5+WFmH
 hoYibPWyMrh8p+DmB9o1XLRbR4bo/udDmYSFdHCpe4CCquzkus0pmhs8qau+pPCEtvGPGOCBQ
 ZiOofXuLZpgmWjt6G4+R8WpeBcE3S3pyyVlygkv/iRojZ+GUMEXX0X57qCmQAVWSPu/XXmu3D
 L46qm7z0X2BQFqdbKtc+OpWZEsgE+slDZt4Poy1E1Yozl8Re+w/ygFBZBZOwxB0JLNugofX1Q
 EkuufsLDQi7QYOCFl65fM6G5R2XpflOa99wUqODrnccliv62BfJq0FBeuTabkvdgXLNyXv0Jr
 CAonxMmkbpk3DWYxL7wKcHCe8wEnvuwiwUvryengRbBEBMepWM4w3lfvrTmRNElA3sz2iCIt9
 ewPMf8uClf46vyhZpfRiibXoRyHfAVNXkpYvQEvcrpteon4OnVKut7nm1ZEBQim+Pwgx/e1ic
 TQVOBk9BuRBgG3I9mQIFnudx6n2pTAZhNYMuX4Omu33bc5WRrIeFOKNVt4z60qDH/RVD5n2To
 NTy4wdayfhJt5uYE8A5LMqCDf6zsUDXZt+IpgqqBNf/RANm6bam5wDrk2NCBmHmWR+mCHfO41
 5g7vpYX8lokLPEfFpB4ox4sguruq9W+DDQj2nVXk6yg19ulK9byZ0X+PIgViA+XMOsFA=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/01/2022 à 10:47, BALATON Zoltan a écrit :
> On Fri, 7 Jan 2022, Laurent Vivier wrote:
>> Le 07/01/2022 à 09:15, Mark Cave-Ayland a écrit :
>>> On 06/01/2022 12:22, Laurent Vivier wrote:
>>>
>>>> "qemu-system-m68k -M q800 -bios /dev/null" crahses with a segfault
>>>> in q800_init().
>>>> This happens because the code doesn't check that rom_ptr() returned
>>>> a non-NULL pointer .
>>>>
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
>>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>>> ---
>>>>   hw/m68k/q800.c | 8 +++++++-
>>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>>>> index e4c7c9b88ad0..6261716c8f7e 100644
>>>> --- a/hw/m68k/q800.c
>>>> +++ b/hw/m68k/q800.c
>>>> @@ -672,10 +672,16 @@ static void q800_init(MachineState *machine)
>>>>           /* Remove qtest_enabled() check once firmware files are in the tree */
>>>>           if (!qtest_enabled()) {
>>>> -            if (bios_size < 0 || bios_size > MACROM_SIZE) {
>>>> +            if (bios_size == -1) {
>>>>                   error_report("could not load MacROM '%s'", bios_name);
>>>>                   exit(1);
>>>>               }
>>>> +            if (bios_size != MACROM_SIZE) {
>>>> +                error_report("Invalid size for MacROM '%s': %d bytes,"
>>>> +                             " expected %d bytes", bios_name, bios_size,
>>>> +                             MACROM_SIZE);
>>>> +                exit(1);
>>>> +            }
>>>>               ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
>>>>               stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
>>>
>>> The patch does fix the issue, but it seems a little odd that you can't use -bios 
>>> path/to/m68k-binary to boot with an arbitrary sized binary which could be useful for reproducers 
>>> such as https://gitlab.com/qemu-project/qemu/-/issues/360.
>>>
>>> How easy would it be to add the extra rom_ptr() NULL check instead?
>>>
>>
>> I was thinking that a smaller binary can be padded to 1 MB for use because on a real hardware the 
>> size of the ROM cannot be arbitrary.
>>
>> But it seems reasonable to check only for the NULL pointer rather than the size, I'm going to send 
>> a v2.
> 
> Instead of adding !rom_ptr as well, isn't it enough to change to
> bios_size <= 0 in the existing check?
>

I agree. And to change rom_ptr(MACROM_ADDR, MACROM_SIZE) to rom_ptr(MACROM_ADDR, bios_size)

Thanks,
Laurent

