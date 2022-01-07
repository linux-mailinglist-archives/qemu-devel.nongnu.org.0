Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3235C487457
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:57:35 +0100 (CET)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5l42-0002yF-72
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:57:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5l28-0001x7-HU
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:55:40 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:49155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5l1s-000755-Su
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:55:25 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MvazO-1mD66c0ffq-00sf9Z; Fri, 07 Jan 2022 09:55:08 +0100
Message-ID: <58171f63-7599-edd2-020e-69586ae0d7c8@vivier.eu>
Date: Fri, 7 Jan 2022 09:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220106122247.771454-1-laurent@vivier.eu>
 <11cea729-2dc1-6985-0c17-8dca37618002@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] q800: fix segfault with invalid MacROM
In-Reply-To: <11cea729-2dc1-6985-0c17-8dca37618002@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:np6daZUJnBzpbqRwfVL1F3e89UWBnw2i2RNgku+K9YjbH7FrgV8
 TvSXBRZW5Xk3zttn0PVDa5mhX1WgRrOeUOiiilFKNdyJo0EbAU/FBVEwkJMsU7LUjPZXkSE
 XQbt9tDBN6WtPcKFXT5rkg1vgYtr3XV7BJwkV5iQtTiJJzuRXRga6PgxzRnBkHmFNQigSJd
 Y9vOaK5izrq5r7YjFlDRA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PHJy+BM5nvU=:vSsQ9ThF5egL50pZ1l5hWm
 v5p9/yquehamDoj14xSIevI8OSUK3R06dp3QoIiqyjYjakj8TKXSYuiCJADAxh12SYP/hNPxd
 sl1/0iqKQ7YgF/3zkWJ0338UKDpPgN0zRtW/jQNfuBl7QXYlSkQlTYpVAW6fwk2S1EECW5YH9
 4XDF3QqrKAwKdUXpnWHxKO3Vw2mCxzz0XbgoaAaxumCvazZqDn5mlDfULkDyVl46PsxEQtFwv
 NmyOdmHNHEOzndb/XrR1xM9eHBJYzjTHudRgOwb5qkLk8g58/95IJt0RiiX8vdNt8HXeiyfc+
 eXoNwumJb1bWnPSpLnK49V1twOAU6FZs6l246KnX27GtpV62PT27sjKTHMQxde9Ri1S3j8Q87
 QUb4HM0IZAty1xK8YB2peqiDYTkrjNR5eDF1r/mApTVWOFkVvyo9z7az8e7OXDzhuvmwZ3qIX
 alGJmdbqKhaY5wqBp3g23trbbkbMLc2WgDgNZ4a/yiTA6hqaopPlDyoX/2Sn8Dq3IC6Ee82+N
 FR64IFFVonFREpL6pt90dFjYwBFFXKjMSDHLPkF/HKRfsH0lF+XyjBybrzXVXmMb1+Lbw9c+n
 bVqzff025A5adFPuB/QKUQrPawPTwptDbXTzPP7ar4dxlJ4HeJ0oz3lL3m5BucDYyUv+Oyc71
 r8OPLrjjS5LlWPEfUe5+9ncJVcNjUA167c8RthTXXp8NZ8kFp3cL0isNqdN3yxVh9ZWQ=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/01/2022 à 09:15, Mark Cave-Ayland a écrit :
> On 06/01/2022 12:22, Laurent Vivier wrote:
> 
>> "qemu-system-m68k -M q800 -bios /dev/null" crahses with a segfault
>> in q800_init().
>> This happens because the code doesn't check that rom_ptr() returned
>> a non-NULL pointer .
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   hw/m68k/q800.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
>> index e4c7c9b88ad0..6261716c8f7e 100644
>> --- a/hw/m68k/q800.c
>> +++ b/hw/m68k/q800.c
>> @@ -672,10 +672,16 @@ static void q800_init(MachineState *machine)
>>           /* Remove qtest_enabled() check once firmware files are in the tree */
>>           if (!qtest_enabled()) {
>> -            if (bios_size < 0 || bios_size > MACROM_SIZE) {
>> +            if (bios_size == -1) {
>>                   error_report("could not load MacROM '%s'", bios_name);
>>                   exit(1);
>>               }
>> +            if (bios_size != MACROM_SIZE) {
>> +                error_report("Invalid size for MacROM '%s': %d bytes,"
>> +                             " expected %d bytes", bios_name, bios_size,
>> +                             MACROM_SIZE);
>> +                exit(1);
>> +            }
>>               ptr = rom_ptr(MACROM_ADDR, MACROM_SIZE);
>>               stl_phys(cs->as, 0, ldl_p(ptr));    /* reset initial SP */
> 
> The patch does fix the issue, but it seems a little odd that you can't use -bios path/to/m68k-binary 
> to boot with an arbitrary sized binary which could be useful for reproducers such as 
> https://gitlab.com/qemu-project/qemu/-/issues/360.
> 
> How easy would it be to add the extra rom_ptr() NULL check instead?
> 

I was thinking that a smaller binary can be padded to 1 MB for use because on a real hardware the 
size of the ROM cannot be arbitrary.

But it seems reasonable to check only for the NULL pointer rather than the size, I'm going to send a v2.

Thanks,
Laurent

