Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DD04592AF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 17:09:11 +0100 (CET)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpBsU-0001eD-DN
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 11:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mpBrf-0000Jq-8y
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 11:08:19 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:33887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mpBrc-0001S4-NF
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 11:08:19 -0500
Received: from [192.168.100.1] ([82.142.2.234]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlbPO-1mO8pi3ZPW-00incg; Mon, 22 Nov 2021 17:08:04 +0100
Message-ID: <e98f76e6-d754-4d80-180c-6614eb813787@vivier.eu>
Date: Mon, 22 Nov 2021 17:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2 0/2] linux-user: Create a common
 rewind_if_in_safe_syscall
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>
References: <20211122131200.229286-1-richard.henderson@linaro.org>
 <38b341b4-1aae-91b5-9f4c-aa451a6f4157@vivier.eu>
 <336a43f3-2d24-8848-16b5-a241d995d492@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <336a43f3-2d24-8848-16b5-a241d995d492@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:onVZxu+AHaT3hFzEYk3pelTOytqUMhUlHcgK2pqduQZDQtUpJzj
 FsRKk8jmPcnI1p+v418jeWfrJ/nM6mxN4iokaxbeku27t9xBxJpu2eSU+xYIjT1g91ewep+
 NPeiauv41g7y2C+Rl82hulyFKNty+1fxfmqTWdt4LMJAJ6KhOf0TWkMzeKEGE4LcBfFX6LD
 lnTW/RquRNTjAKMBh1PAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tb0Q5aNGICc=:ehJHEyleAIRJfHVpzssQ8s
 Yn3RbKVZmHzZIPVOt04G1PHjbD5lznJ8cmutb3ttMstMdCdMjTuG1bWFSPnO+fJ8LLgPwDJZM
 m2ndfVvL7g3/Ck4IHVtXYEmrd6RcwMKKLP92+9gJAzfzUV8vgXH6pjJNHCRag3FOyvah2IMi4
 Bzm6m33dywoPaLQgqfxiAoze96n8eQ2WqqBfn7I1MTo/4mVeiJZFDDX6bRHypuYgr7+NErfIR
 SRc+xltLKrydUJTW9LU0jf+CBctrTLgo5BWO3zHmzMLXrdDN2WySRJ+u803HJM3P4qDMH6s6B
 +gdj+slLoyHExpgx0rdY9L/uWuEa9fSacw/+4jVht+AYSjnh3u35+5Dx3Z6h/0rc2/CFCYTXB
 zfEyb6/zuZhrdsjMiP6ESRmewPxZ6CjcmXo2w9L4l8yEnDJVe23IsWGOtIJA1ukErWdo+FxG0
 g8D5qjIHdMX8oj3uFWqU0T+t1HvgF3NhqvgZXBlrFgruHbGSWqcFBrUqwk12PmA2I8rVpoPYA
 McU1orlx8eo1jlu2QyyI5C3RPuhexT7LZt+1DzVNYK00JLbhcKlaiYuZpExKgLhVPPQGrkp3f
 Iq5OySl951Bu2Vi/VEpwUv8pKePQzZzLGFjLURiVnKqcfsDRJAPXhOk6E6O/G5lbknv3lSwED
 GgN+TJvhz0qvvPtz7EXT31NHwpTSTX9Ri98HJ4mTCyhtetC9hUh6QQ8VXTMdWJ6ddIeg=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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
Cc: raj.khem@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/11/2021 à 16:50, Richard Henderson a écrit :
> On 11/22/21 4:43 PM, Laurent Vivier wrote:
>> Hi,
>>
>> Le 22/11/2021 à 14:11, Richard Henderson a écrit :
>>> This is a re-packaging of two of Warner's patches that
>>> fix a build issue on aarch64 using musl:
>>>
>>> https://lore.kernel.org/qemu-devel/20211108194230.1836262-1-raj.khem@gmail.com/
>>>
>>>
>>> r~
>>>
>>>
>>> Warner Losh (2):
>>>    linux-user: Add host_signal_set_pc to set pc in mcontext
>>>    linux-user/signal.c: Create a common rewind_if_in_safe_syscall
>>>
>>>   linux-user/host/aarch64/host-signal.h |  5 +++++
>>>   linux-user/host/aarch64/hostdep.h     | 20 --------------------
>>>   linux-user/host/alpha/host-signal.h   |  5 +++++
>>>   linux-user/host/arm/host-signal.h     |  5 +++++
>>>   linux-user/host/arm/hostdep.h         | 20 --------------------
>>>   linux-user/host/i386/host-signal.h    |  5 +++++
>>>   linux-user/host/i386/hostdep.h        | 20 --------------------
>>>   linux-user/host/mips/host-signal.h    |  5 +++++
>>>   linux-user/host/ppc/host-signal.h     |  5 +++++
>>>   linux-user/host/ppc64/hostdep.h       | 20 --------------------
>>>   linux-user/host/riscv/host-signal.h   |  5 +++++
>>>   linux-user/host/riscv/hostdep.h       | 20 --------------------
>>>   linux-user/host/s390/host-signal.h    |  5 +++++
>>>   linux-user/host/s390x/hostdep.h       | 20 --------------------
>>>   linux-user/host/sparc/host-signal.h   |  9 +++++++++
>>>   linux-user/host/x86_64/host-signal.h  |  5 +++++
>>>   linux-user/host/x86_64/hostdep.h      | 20 --------------------
>>>   linux-user/safe-syscall.h             |  3 +++
>>>   linux-user/signal.c                   | 15 ++++++++++++---
>>>   19 files changed, 69 insertions(+), 143 deletions(-)
>>>
>>
>> Richard, will you take this series via one of your branches or do you want I send a linux-user 
>> pull request for it?
> 
> I have nothing pending myself, but I can send this if you'd like.  I mostly wanted your ack on it.

Acked-by: Laurent Vivier <laurent@vivier.eu>

Thanks,
Laurent


