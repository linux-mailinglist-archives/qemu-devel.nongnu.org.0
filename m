Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18B34A842
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:40:10 +0100 (CET)
Received: from localhost ([::1]:45642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmh7-0000G7-AX
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lPmdX-0006RR-JN
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:36:30 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:40363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lPmdV-00063v-2a
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:36:27 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M4b5s-1lPEfb1TRG-001fKS; Fri, 26 Mar 2021 14:36:21 +0100
Subject: Re: [PATCH] linux-user: allow NULL msg in recvfrom
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFNex=Ddc_9Sta2W+_a90Qg7hCidMhxuqmGuggygfWWCzZdBhQ@mail.gmail.com>
 <74ee406f-f503-a66e-80d6-989b2c8ed4aa@vivier.eu>
 <CAFEAcA8Buc1PnX0CcCYr2w6p0PTJxOtNT1nJWZDitOA6jdQp9w@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0e658b47-d12c-398d-5caa-78723d8f1422@vivier.eu>
Date: Fri, 26 Mar 2021 14:36:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Buc1PnX0CcCYr2w6p0PTJxOtNT1nJWZDitOA6jdQp9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fi6VHPltlBGhv0MZzdo62UOEULawg0d71UMetW423IE8dVp/LUj
 enmVAJenml9Qrl8rljVfcEnRP4dDFpHcIRBONqmjT2ZRv55Pg412lhiMprlOFkhDAgx3ymb
 lHOkp7NWZWZgWBXKdvn8qw8vaBzSB6/s7Gnutb0h+tEMH+eUWnq4UyEyGawO6XcapjJCogg
 zyiuod1cVt9haMM9EQz7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wm6QqqF6BQ8=:EtkKtSRX7UDDnEQtHy4Qo4
 3ympsyit5UaND9aoX+93onhfO2I5RfmlFhc+0daN23dOuZFJj9BIC63UNTghWiKcLF1/ImMmt
 y3DhT28MqazOt5x5h2yXhL9qqFLnriBVWuiFMBcTFm70/0Y8Emy8EWBGa5skIbW2qJ41DrySg
 rUnUWgp71vHnVVjdjxRdeFfjLxJG+OHNSFlpC8keZwgRoiKRDvCcnpCVKeLxbcTV/zu/qNnmF
 qijz0w+3E5aOPdQkXqdeDuLX5qtqev5I0ZVs7R66mWWg+VgVJ16eoh/DJSBTGeLzYg5tltTLt
 NlsG/YOo1ERpCdnn27TkNMMp29+vuxoX8zix4dEcBrSunWQ4lWCCR9D+VUmaQEmDWB+QTqcJH
 zCTKYcG8M+Iy0BTs/QxBjJXAN6RGXw9Qa6SMqwIXmCXjI+SmRSs6yBkuryOukQ55OeFRr4k+2
 KEjsfJr8avDoHXUSuXHIXCfrMTdPTrFhia6dnKLKEGt68vxp+f4T
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Zach Reizner <zachr@google.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/03/2021 à 14:28, Peter Maydell a écrit :
> On Fri, 26 Mar 2021 at 13:24, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> Le 26/03/2021 à 05:05, Zach Reizner a écrit :
>>> The kernel allows a NULL msg in recvfrom so that he size of the next
>>> message may be queried before allocating a correctly sized buffer. This
>>> change allows the syscall translator to pass along the NULL msg pointer
>>> instead of returning early with EFAULT.
>>>
>>> Signed-off-by: Zach Reizner <zachr@google.com>
>>> ---
>>>  linux-user/syscall.c | 2 --
>>>  1 file changed, 2 deletions(-)
>>>
>>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>>> index 1e508576c7..332544b43c 100644
>>> --- a/linux-user/syscall.c
>>> +++ b/linux-user/syscall.c
>>> @@ -3680,8 +3680,6 @@ static abi_long do_recvfrom(int fd, abi_ulong
>>> msg, size_t len, int flags,
>>>      abi_long ret;
>>>
>>>      host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
>>> -    if (!host_msg)
>>> -        return -TARGET_EFAULT;
>>>      if (target_addr) {
>>>          if (get_user_u32(addrlen, target_addrlen)) {
>>>              ret = -TARGET_EFAULT;
>>>
>>
>> Applied to my linux-user-for-6.0 branch
> 
> Doesn't this mean we'll now incorrectly treat "guest passed
> a bad address" the same as "guest passed NULL" ? lock_user()
> returns NULL for errors, so if you need to handle NULL input
> specially you want something like
> 
>    if (!msg) {
>        host_msg = NULL;
>    } else {
>        host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
>        if (!host_msg) {
>            return -TARGET_EFAULT;
>        }
>    }
> 
> I think ?

Yes, you're right.

Zach, could you update your patch?

Thanks,
Laurent


