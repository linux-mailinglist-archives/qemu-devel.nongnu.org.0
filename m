Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2E5446881
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 19:36:42 +0100 (CET)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj44v-0007T2-NB
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 14:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mj41D-00065c-NL
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:32:51 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mj41A-0000Sh-F9
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 14:32:51 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MeTkC-1m8uJl3seK-00aR6o; Fri, 05 Nov 2021 19:32:46 +0100
Message-ID: <3f1bcc4e-2b53-8f54-e927-d52aef76a9c6@vivier.eu>
Date: Fri, 5 Nov 2021 19:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] macfb: fix a memory leak (CID 1465231)
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211105165254.3544369-1-laurent@vivier.eu>
 <CAFEAcA_ma2f6UfMSSJwssVjdZHQzO2LQfK2KROfv11Mec0WWsg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAFEAcA_ma2f6UfMSSJwssVjdZHQzO2LQfK2KROfv11Mec0WWsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:m7IVJAZbYzaQnwyksnMcpWGPFvjduPPJ+DnVeQWCeqfrcj6vWzK
 WiKfyt8vYW2isnUmZkneffoe0z7JGcpxtxGr18HANFfayDKXWOPGye7Chjhsz1DmG9ahZrr
 0o4mYU6taaWQW4PeXkMflg+LgrF/mrbWJNbH/2xzCRkvyhtvv5UkaXwtGQliLFon+QGCv1w
 wWgEKmH6Sex/sY0CRuBLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DE9/BQELNWc=:kDdUzqMNls8TQuf8m0UqX0
 cRi0XImxH2ARplkGvCwz/UZTU/Aim085LUt36pzJlJ3iU9UgY9XDMF2dsfFpDoeOVF0cj+Prb
 glUBvteLqtFW+y9baClXPe5mmfTKoHFVpj6vHlUH6DVwlNYlsVtzJmap46MP/uS6bp3Gps+eX
 CCAiYlDGJ9smmypHicIgy0txaBxgv/JTYFVrr5UzXJh9AEY56j/f/5S/b74pz4mYFeFnRFsRA
 lcLRSwuh1R02W8x7J328QstoNkU/JVD1n7/F/5gAKdzQiIQeQqrEXh1DTS+cbFuP46emiZEpq
 73mGKM8AptudxbaT1z2laHzA6/V7vVtKbLLbjCKbb+eTCNVDtnbZwfcd+PH6WJqufYg3KNggt
 SyFIOUWyClQ2pDrSeZ8Devx8cYaBmmCX3fDwGKUa3gm15EzfNTwSXPhiLj9Lle2YM0AXeq0hN
 /l7PHeYtyrfc7Zh3LHy7EPsPuJLiAKGdP/2QIvWUaHtjuLgwCBVNDQ7jXAzw7L5DLsdhltNF+
 XMYE7NAeeO4vh/JGjiC9w6zsOu6t6t7eaUXedHEdeP+Wa3atRfSnrvVhxGXIdW9GD3qpOYaTU
 wjvrR3X/yOJ+NgSkpqQMcc/AqCqFVTEHrZrTE8uaIoak3XgaZH01YUkQRuLVg6ZoIjL6xzetk
 KHhYlawvXAmEiKZX1vvdE1Vm/zUPTBQmkf+W+6aTMFbXasYCMdEe7evu8tffZ2Pk9Txo=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/11/2021 à 18:01, Peter Maydell a écrit :
> On Fri, 5 Nov 2021 at 16:52, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Rewrite the function using g_string_append_printf() rather than
>> g_strdup_printf()/g_strconcat().
>>
>> Fixes: df8abbbadf74 ("macfb: add common monitor modes supported by the MacOS toolbox ROM")
>> Cc: mark.cave-ayland@ilande.co.uk
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   hw/display/macfb.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index 4b352eb89c3f..277d3e663331 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -440,21 +440,18 @@ static MacFbMode *macfb_find_mode(MacfbDisplayType display_type,
>>
>>   static gchar *macfb_mode_list(void)
>>   {
>> -    gchar *list = NULL;
>> -    gchar *mode;
>> +    GString *list = g_string_new("");
>>       MacFbMode *macfb_mode;
>>       int i;
>>
>>       for (i = 0; i < ARRAY_SIZE(macfb_mode_table); i++) {
>>           macfb_mode = &macfb_mode_table[i];
>>
>> -        mode = g_strdup_printf("    %dx%dx%d\n", macfb_mode->width,
>> +        g_string_append_printf(list, "    %dx%dx%d\n", macfb_mode->width,
>>                                  macfb_mode->height, macfb_mode->depth);
>> -        list = g_strconcat(mode, list, NULL);
>> -        g_free(mode);
>>       }
>>
>> -    return list;
>> +    return g_string_free(list, FALSE);
> 
> This reverses the order compared to the old code (which prepends
> 'mode' to the 'list' string it is building up). Does that matter ?
> 

Not at all. Perhaps it's even better like that as we have lower resolutions first.

It was done like that to be able to pass list set to NULL (first parameter must not be NULL).

Thanks,
Laurent


