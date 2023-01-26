Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953067D185
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 17:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL54q-0002VK-IQ; Thu, 26 Jan 2023 11:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL54c-0002V2-8c
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:26:04 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL54Y-0008AJ-P4
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 11:26:01 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MhlbM-1ohMX32x2u-00dmPC; Thu, 26 Jan 2023 17:25:53 +0100
Message-ID: <16e8f5c4-45c7-de0f-f53d-2fe4549fff7e@vivier.eu>
Date: Thu, 26 Jan 2023 17:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: fr
To: Helge Deller <deller@gmx.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
References: <20221223100107.17303-1-deller@gmx.de>
 <5780556e-ef12-408d-7f8b-9104314cf9f4@linaro.org>
 <69357647-288c-a032-27f9-2912c6483418@gmx.de>
 <5a06e9f8-f7ea-1dbf-d44b-b9d134d3c400@linaro.org>
 <f66e5330-99fe-db9f-13eb-d3501c65cf17@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: Improve strace output of personality() and
 sysinfo()
In-Reply-To: <f66e5330-99fe-db9f-13eb-d3501c65cf17@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BQn31vLbYL+2U3GGexxmBaTraVUcmVk2duEP+VHy3amMACTjVKY
 XSDhmPyGVZvwnfzTsg9z3ksFahaK8fF6DjVoUJhVMncneRQoJlVIa5jV1wma7GVvFfHlDJ+
 55b97m2tnp9tLbgdY3wSdwAUyFBK/lFlN7DSGGewGZ+TSDBG2pIHuWZ1oBn95cdkbnKKptM
 NwgGB7b0tEWflNoVN9OGg==
UI-OutboundReport: notjunk:1;M01:P0:aQu3qieOjxo=;qaqr2wsna6gevBMqX0AF42P0Xgm
 NkuXl1mAnje9Eu6rWeFEyluTGg4y4d9GRRLI2izuPIWIc5oHWSv3NdlewWqCK5tpOiLD8Uubv
 9WzWrzbpt0736a8cbjBY1cI0SFUOhIb/S1Bw4KEznXQuXq1aF9bRPbRp8XiIzfIZxavZauC8d
 U9LqSuqaYGPFFoAXXB7cwQX9WMuUWbjMZYpzAeswYCd8NPRSNRE9cpgsbdY/CMRJmFyOkhPgx
 OHy1MgqNzdFz6vVej0sJ64KoYk4SRfRp5SGNXWv4S+iarIyWmniBOA7wCcSx8E4jHdlPMCEDM
 AbqCI0xOiE2QpxZdYNxZaWpAkrymeuK0gbovJW/NV3D468Ad6pjqlNax+Ql5JD/I3MC5iyS9M
 0PJ2eCyWRha0ZyuW93O8h2fXapoxmt5lwXLTi1pKRLt+iyDkGuGyzzWteXw3MzF4y3nh7JdvO
 Ly+Tx6UDrEYQqHciylZsJxaXobAnkPpYrXsG2KrvolMlHK6qxh6TkgMWh58GGvLlIWJVPDH+p
 Nwh7FrcZi97bug8XlpQtO3JECMa6kY29AftQPHf/6/FmKTwicHCU2yRhZAnUr2ctZ5dFgmwhx
 K084x2rd7cHIOwMf6j4ForCAYpqV7VVePO3OIwHDZiJ2If7HvHOWs53EkeuOpF+ss1Vx1gIbA
 HiuOsGZB+jDgQERY4i9A8tAb22b+eyCod40V0YL/YQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 23/12/2022 à 13:27, Helge Deller a écrit :
> On 12/23/22 12:01, Philippe Mathieu-Daudé wrote:
>> On 23/12/22 11:53, Helge Deller wrote:
>>> On 12/23/22 11:50, Philippe Mathieu-Daudé wrote:
>>>> On 23/12/22 11:01, Helge Deller wrote:
>>>>> Make the strace look nicer for those two syscalls.
>>>>>
>>>>> Signed-off-by: Helge Deller <deller@gmx.de>
>>>>> ---
>>>>>   linux-user/strace.list | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/linux-user/strace.list b/linux-user/strace.list
>>>>> index f9254725a1..909298099e 100644
>>>>> --- a/linux-user/strace.list
>>>>> +++ b/linux-user/strace.list
>>>>> @@ -1043,7 +1043,7 @@
>>>>>   { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
>>>>>   #endif
>>>>>   #ifdef TARGET_NR_personality
>>>>> -{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
>>>>> +{ TARGET_NR_personality, "personality" , "%s(%p)", NULL, print_syscall_ret_addr },
>>>>
>>>> Shouldn't this be:
>>>>
>>>>     { TARGET_NR_personality, "personality" , "%s(%u)", NULL, NULL },
>>>
>>> Basically yes, but...
>>> it's a bitmap, so printing it as hex value (similiar to a pointer)
>>> is easier to read/analyze.
>>
>> Oh, good point. Then "%s(0x"TARGET_ABI_FMT_lx")" is self-explicit.
> 
> Hmm ... I don't see that as any benefit for the user and the output is the same.
> 

I agree with Philippe for this part, it's not a pointer, don't use %p.

Thanks,
Laurent




