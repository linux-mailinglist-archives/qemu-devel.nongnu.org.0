Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0AA5EBE1C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:16:03 +0200 (CEST)
Received: from localhost ([::1]:35176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6h8-00077s-5a
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6di-0001n1-6W
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:12:31 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:50379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6de-0000cz-Id
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:12:29 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MZCvh-1ohnZX2Rjl-00V5Gu; Tue, 27 Sep 2022 11:12:22 +0200
Message-ID: <75faec85-72a0-9045-981e-2d8421b25257@vivier.eu>
Date: Tue, 27 Sep 2022 11:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 00/12] linux-user: Add more syscalls, enhance tracing &
 logging enhancements
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <3fe34e9b-d82d-7d30-b477-f870bdb3e88d@vivier.eu>
 <27ebaa4d-eaa2-0590-92f1-679fd4178485@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <27ebaa4d-eaa2-0590-92f1-679fd4178485@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Py585droJ8DzbiC2V4OHjP84FFweMJ59v7RJG0BFSQEUXytSzVz
 FYWqwngqZNjRa50ABBNhbpcaCrXcQaB/jvQnay0JI7IvG9hcK7ZDVZkjR+NP/7pJy4EkEHz
 R4v+O5Zv98/7QhhHrfT52IpHDshoylWXfeCDKW1IpuB5DmXxmlL6z95FEW8f7FDFH61R+/h
 Uo8dprkHw32s2Q3RisPaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TPyspAuRXoA=:tUBghEggFFxu+bKG9VwZzt
 ky0aiiL1XF6D/Hxt46Zm8APiL0gS/nxljCBn2YMbkr4TK3I2TUfDipvhKA5tZ+iitTN2MXS0w
 L5YagymtCRXxzIz3g7CQLy6TTN+zt0vzRkeQrXT2HTO8GUVsoGkqJI6UQ79hnWGAHsxaqo8X+
 YQtMN7Mz03C4BYib8dPo7zj4J5BY+nC+MSOIyg4+CiLbEkSK5CV2ZFgYTsndYJwNlj0zj+shD
 JYdMuh95zC7v4yI066MyeKJm4vRX6jj+tZaWURqRjo+rPB61l8DPXNpNurzZdOhXC8NBgkCC3
 fT1DAIwQ56sFaUzb3mst2/HM2q6wHgwbKscrgvs7oZzA2GWPoRfgj5WkxVJj1ZuQlQ/IYumqx
 L2pcEq/CXRVCt5OoAXDJrlnYlBQXdy03hFImq1/Ru7QL8M6NNL0wf8hWELUH3TpHjrdr1rIOZ
 YsWXI9NGAtBMmtGfLY+We+RWM0rOqS7Fxuvc2Fc2zKtfPn5IgVkmBW7wev4571EfjoNokEQmd
 WR4gTWLSYmOrE5sw/oVVUPTajtpBeRAnOxp3/I/r4u610g8WUL+OSx3v+fnLiQQphRlQqkz1L
 1fGOj3Akhdy/RBmY3TDyTdMxvZdMjB6ayauCmIfzhOIo/qiQW399A4eyXN+KodeZUUTevK2KI
 zDIMinYU24NZuku9ZQpVx/nLAvO4PpP3pdyCbuZy+E36H4UTAKvD5YfNQVXQwwJdbvIC3lPps
 qXR1zjmgMFJ+sTHuzbHTkijp08lSMF4WBr1l6PSAtWl/rauAAGBSlnWl2k8gHTI4NyoA6DGi2
 R3AV90P
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/09/2022 à 10:56, Helge Deller a écrit :
> On 9/27/22 09:32, Laurent Vivier wrote:
>> Le 18/09/2022 à 21:45, Helge Deller a écrit :
>>> Here is a bunch of patches for linux-user.
>>>
>>> Most of them add missing syscalls and enhance the tracing/logging.
>>> Some of the patches are target-hppa specific.
>>> I've tested those on productive hppa debian buildd servers (running qemu-user).
>>>
>>> Thanks!
>>> Helge
>>>
>>> Changes to v2:
>>> - Fix build of close_range() and pidfd_*() patches on older Linux
>>>    distributions (noticed by Stefan Hajnoczi)
>>>
>>> Changes to v1:
>>> - Dropped the faccessat2() syscall patch in favour of Richard's patch
>>> - Various changes to the "missing signals in strace output" patch based on
>>>    Richard's feedback, e.g. static arrays, fixed usage of _NSIG, fix build when
>>>    TARGET_SIGIOT does not exist
>>> - Use FUTEX_CMD_MASK in "Show timespec on strace for futex" patch
>>>    unconditionally and turn into a switch statement - as suggested by Richard
>>>
>>> Helge Deller (12):
>>>    linux-user: Add missing signals in strace output
>>>    linux-user: Add missing clock_gettime64() syscall strace
>>>    linux-user: Add pidfd_open(), pidfd_send_signal() and pidfd_getfd()
>>>      syscalls
>>>    linux-user: Log failing executable in EXCP_DUMP()
>>>    linux-user/hppa: Use EXCP_DUMP() to show enhanced debug info
>>>    linux-user/hppa: Dump IIR on register dump
>>>    linux-user: Fix strace of chmod() if mode == 0
>>>    linux-user/hppa: Set TASK_UNMAPPED_BASE to 0xfa000000 for hppa arch
>>>    linux-user: Add strace for clock_nanosleep()
>>>    linux-user: Show timespec on strace for futex()
>>>    linux-user: Add close_range() syscall
>>>    linux-user: Add parameters of getrandom() syscall for strace
>>>
>>>   linux-user/cpu_loop-common.h |   2 +
>>>   linux-user/hppa/cpu_loop.c   |   6 +-
>>>   linux-user/mmap.c            |   4 +
>>>   linux-user/signal-common.h   |  46 ++++++++++++
>>>   linux-user/signal.c          |  37 +--------
>>>   linux-user/strace.c          | 142 ++++++++++++++++++++++++++++++-----
>>>   linux-user/strace.list       |  21 +++++-
>>>   linux-user/syscall.c         |  50 ++++++++++++
>>>   target/hppa/helper.c         |   6 +-
>>>   9 files changed, 255 insertions(+), 59 deletions(-)
>>>
>>
>> Series applied to my linux-user-for-7.2 branch,
>> except PATCH 11 and 12 that have comments.
> 
> Thank you !!
> I'll send updated versions for patches 11 and 12 asap.
> Btw, where can I find your linux-user-for-7.2 branch?
> It would help me to diff the new patches against this branch...
> 

https://gitlab.com/laurent_vivier/qemu/-/commits/linux-user-for-7.2/

But I can update and remove some patches if they appear to be broken when I test them.

Thanks,
Laurent

