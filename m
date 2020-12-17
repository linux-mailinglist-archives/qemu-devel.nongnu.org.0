Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF62DD9BA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 21:17:51 +0100 (CET)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpzie-0005VE-ND
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 15:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpzgL-0004Lc-Gb
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:15:25 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:40645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpzgE-0004Wf-I1
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 15:15:25 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTw02-1kggGg1FoI-00R49C; Thu, 17 Dec 2020 21:14:56 +0100
Subject: Re: [PATCH 2/4] linux-user/mips64: Support o32 ABI syscalls
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201119161710.1985083-1-f4bug@amsat.org>
 <20201119161710.1985083-3-f4bug@amsat.org>
 <a081586a-c136-3766-6c28-9c054b24e84b@vivier.eu>
 <e1e6feeb-3bb3-d628-a87f-3696e9809d01@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ee6c277f-45ff-16f0-970c-100d355abd6b@vivier.eu>
Date: Thu, 17 Dec 2020 21:14:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e1e6feeb-3bb3-d628-a87f-3696e9809d01@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NScEaSIEsbi6feE3r3Y9lhpkHpf+uHnbDWlBrHXZEJv4K7LVG1D
 JNSruIMXJV7BtBXyzQDxXtoR03QIP+peU+mHeVOZdKUCOZPsxx6Mbj7QH8UBRqxfc8rMose
 aAE2KMReaoKwGf51NnP8blmgLi26haPaZt/tQUEqA2yWapM6L8SmY2J/9WXgDGbQmejrCS5
 eLwBS9jjn+5JidVk/xAWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A6nAADJ5Fbk=:ZN7qWU8avQS+NKvj4FVLkz
 I62bABTwGg1wDKI2jNjwO+G1CVQOjDgdjXwm8eCgbW3OMngfIEE5CKwucpdFOIypzhkJQcrr7
 3xVfCT5lOtRhXsmGDm34ZHKsnVWPd/r5RXbncxgSqU1U/UqmEi5v/Eye6fCtHasQQcw5q9C+U
 LZwdWcOReVDGdZ9VW2q9eHnytMxyd1B/3lqDnmr4kcGG0J1fORBGBgJzXjANlIB3SYO5CDSTp
 oKAbtGgW0wwGjsrFN/iB3KkZ+9ZJHBiofVQh81hL9k5S1kp7NHV95G1ouvRHUVRtBuEw3iiI+
 VNonM0XQNzw8nN4t2AxKfGFcC52lZ9YRKt4Eq00QoOyO+4PfS986K5wPsKCooDXkHyxQrpaWx
 UmC5B7Fth7+K6zjJ1xLYBJY9oVE6PCwduViz+/b7EbGmOYTxA1/SjoF0EHwyC9TwpkNRjR+XI
 Du2M0X9fgA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W. Rozycki" <macro@linux-mips.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/12/2020 à 17:10, Philippe Mathieu-Daudé a écrit :
> On 12/17/20 11:40 AM, Laurent Vivier wrote:
>> Le 19/11/2020 à 17:17, Philippe Mathieu-Daudé a écrit :
>>> o32 ABI syscalls start at offset 4000.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  linux-user/mips64/syscall_nr.h | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/linux-user/mips64/syscall_nr.h b/linux-user/mips64/syscall_nr.h
>>> index 672f2fa51cb..6579421fa63 100644
>>> --- a/linux-user/mips64/syscall_nr.h
>>> +++ b/linux-user/mips64/syscall_nr.h
>>> @@ -1,4 +1,7 @@
>>> -#ifdef TARGET_ABI_MIPSN32
>>> +#if defined(TARGET_ABI_MIPSO32)
>>> +#define TARGET_SYSCALL_OFFSET 4000
>>
>> The value of the offset is hardcoded in linux-user/mips/meson.build, so either you remove
>> TARGET_SYSCALL_OFFSET here or you update meson.build to use it.
> 
> I don't understand what this Meson rule does, as this
> doesn't work without this patch...

Yes, you're right, this is hardcoded in mips directory, not in mips64 directory.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

