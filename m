Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0DA409CAD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 21:08:51 +0200 (CEST)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPrJx-0008GM-RY
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 15:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mPrIl-0007bu-Rm
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 15:07:35 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:46659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mPrIj-00040S-Ro
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 15:07:35 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDhpZ-1mF6aI2k6B-00ApCZ; Mon, 13 Sep 2021 21:07:25 +0200
Subject: Re: [PATCH v2 0/9] linux-user: split internals out of qemu.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4ee29d45-72c8-4b9f-f485-77075aa292c2@vivier.eu>
Date: Mon, 13 Sep 2021 21:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Y3c82ZhokAYZbJOxD6+clTdhx8wmJxDD23FjgTt/3esdpYbQ1ac
 UUP25n47Ljjbu4S7ymv9hCcQY7tGY1Uu/X+Escq3E57D+hwtSLGtxnRAZBOfTybdo/wGqBC
 zj4lQSCeFQ1Rl6coLIp9u8cuRZofWC+UNjB/bZtTVmymzw23RCvIzhunymG4wItOYSL+/S/
 XrGkTPeM2cIHTgzD50rMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:squnKau4BYQ=:nDbwqXfwWzPNjssAoCFTWr
 Ri7mYen/8EZZXjbSHeDGIhD8iC3kNtAszdZpaj+9bclwA+Jq9VvboNlrqUKD0rrz2erhiaWHP
 yMkNIoyFMGz+e072XUBGoIoJPAokc4w5zZ6w2h8p7P7yiD6xV+7Co1/fPM4IxG/XrZ3m3Rf19
 g5xakfuSeinDSrLJgM7E6dtuM6GxYwY1fPe5wPw36bDv/oWglqIZwNHVxvrb7gez1E6ISGNBe
 K48Q/v6XSqdgpqHT/8atiy+femSMlmH1tG6QaJr031MdTntbjHWuCw4TYhB8N6EIS5J8mwtWc
 riMpKLo6wekPIGn14nnfDrW2U6hNtsQi778u2c+Zhy1sPfpTfP9mCtJJaMXwA0PRqmn99vKNb
 NVP9TxK+e2/RxGKakZ695mbGM9+S12xhvtwt1JT1tfng8Wy/lHo2cyUJOorVrlJyKpiLED+xw
 b9Kx7jWQWPB0ExHt7euv5umJORsKdgfEHD+PZQ+ZZidnIfnk9/0KOHhdOqSYZkWja4IWx9R2O
 7Jwpzqti1ZV/jsVncH06RzcARfQRpntJSxWwZrRxBbOgnc/o+WMn5UqvHbHF/tAba8e8vz9dQ
 0QVQsCN12FL6+JmkzWjKVVWRiYlWb92O5SaUibaIC8ZSbj8raQE+l4DHQNPIv86dhXjUGAX5x
 Mr8yBgsYdxy+SsEShuaauLhiQE74mFsN3/7dzyy9TRhXd6MeBorrDgq+RANIVefVlC4yDIfyW
 fGaNvQSGlk5L8vfnwbWydVwx73F9cnIQ9HLEiA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/09/2021 à 17:43, Peter Maydell a écrit :
> linux-user/qemu.h is an awkward header, for two reasons:
>  (1) its name suggests it's a rather common generic header,
>      but it's actually specific to the usermode emulators
>  (2) it is a mix of:
>    * lots of things internal to the implementation of linux-user
>    * functions that a few files outside linux-user want
>      (mostly the user-access functions like lock_user,
>      get/put_user_*, etc, and also the TaskStruct definition)
> 
> This patchset tries to clean it up a bit by at least splitting
> most of the "just internal to linux-user" parts out of qemu.h
> and putting them in a handful of different .h files that are
> then included by the linux-user files that need them.
> 
> I think the ideal would probably be to eventually junk
> qemu.h entirely and have a few separate headers specifically
> for the bits that non-linux-user code needs (eg a 'user-access.h'
> for the get/put_user stuff), perhaps located somewhere that
> means we don't need to put linux-user/ on the include path.
> But that's awkward as it needs interaction with bsd-user too.
> So this much cleanup seemed like a reasonable start...
> 
> Changes v1->v2:
>  * rebased
>  * fixed a few minor niggles spotted in v1 during review
>  * use existing signal-common.h rather than creating a new
>    header for signal-related functions
> 
> Patches still needing review: 3, 4, 5, 7
> 
> thanks
> -- PMM
> 
> Peter Maydell (9):
>   linux-user: Fix coding style nits in qemu.h
>   linux-user: Split strace prototypes into strace.h
>   linux-user: Split signal-related prototypes into signal-common.h
>   linux-user: Split loader-related prototypes into loader.h
>   linux-user: Split mmap prototypes into user-mmap.h
>   linux-user: Split safe-syscall macro into its own header
>   linux-user: Split linux-user internals out of qemu.h
>   linux-user: Don't include gdbstub.h in qemu.h
>   linux-user: Drop unneeded includes from qemu.h
> 
>  linux-user/loader.h              |  59 +++++
>  linux-user/qemu.h                | 429 ++-----------------------------
>  linux-user/safe-syscall.h        | 154 +++++++++++
>  linux-user/signal-common.h       |  36 +++
>  linux-user/strace.h              |  38 +++
>  linux-user/user-internals.h      | 186 ++++++++++++++
>  linux-user/user-mmap.h           |  34 +++
>  gdbstub.c                        |   2 +-
>  linux-user/aarch64/cpu_loop.c    |   2 +
>  linux-user/aarch64/signal.c      |   1 +
>  linux-user/alpha/cpu_loop.c      |   2 +
>  linux-user/alpha/signal.c        |   1 +
>  linux-user/arm/cpu_loop.c        |   2 +
>  linux-user/arm/signal.c          |   1 +
>  linux-user/cris/cpu_loop.c       |   2 +
>  linux-user/cris/signal.c         |   1 +
>  linux-user/elfload.c             |   3 +
>  linux-user/exit.c                |   2 +
>  linux-user/fd-trans.c            |   2 +
>  linux-user/flatload.c            |   3 +
>  linux-user/hexagon/cpu_loop.c    |   2 +
>  linux-user/hexagon/signal.c      |   1 +
>  linux-user/hppa/cpu_loop.c       |   2 +
>  linux-user/hppa/signal.c         |   1 +
>  linux-user/i386/cpu_loop.c       |   3 +
>  linux-user/i386/signal.c         |   1 +
>  linux-user/linuxload.c           |   2 +
>  linux-user/m68k/cpu_loop.c       |   2 +
>  linux-user/m68k/signal.c         |   1 +
>  linux-user/main.c                |   5 +
>  linux-user/microblaze/cpu_loop.c |   2 +
>  linux-user/microblaze/signal.c   |   1 +
>  linux-user/mips/cpu_loop.c       |   2 +
>  linux-user/mips/signal.c         |   1 +
>  linux-user/mmap.c                |   2 +
>  linux-user/nios2/cpu_loop.c      |   2 +
>  linux-user/nios2/signal.c        |   1 +
>  linux-user/openrisc/cpu_loop.c   |   2 +
>  linux-user/openrisc/signal.c     |   1 +
>  linux-user/ppc/cpu_loop.c        |   2 +
>  linux-user/ppc/signal.c          |   1 +
>  linux-user/riscv/cpu_loop.c      |   2 +
>  linux-user/riscv/signal.c        |   1 +
>  linux-user/s390x/cpu_loop.c      |   2 +
>  linux-user/s390x/signal.c        |   1 +
>  linux-user/semihost.c            |   1 +
>  linux-user/sh4/cpu_loop.c        |   2 +
>  linux-user/sh4/signal.c          |   1 +
>  linux-user/signal.c              |   5 +
>  linux-user/sparc/cpu_loop.c      |   2 +
>  linux-user/sparc/signal.c        |   1 +
>  linux-user/strace.c              |   3 +
>  linux-user/syscall.c             |   6 +
>  linux-user/uaccess.c             |   1 +
>  linux-user/uname.c               |   1 +
>  linux-user/vm86.c                |   1 +
>  linux-user/xtensa/cpu_loop.c     |   2 +
>  linux-user/xtensa/signal.c       |   1 +
>  semihosting/arm-compat-semi.c    |   2 +-
>  target/m68k/m68k-semi.c          |   2 +-
>  target/nios2/nios2-semi.c        |   2 +-
>  thunk.c                          |   1 +
>  62 files changed, 620 insertions(+), 417 deletions(-)
>  create mode 100644 linux-user/loader.h
>  create mode 100644 linux-user/safe-syscall.h
>  create mode 100644 linux-user/strace.h
>  create mode 100644 linux-user/user-internals.h
>  create mode 100644 linux-user/user-mmap.h
> 

Applied to my linux-user-for-6.2 branch.

Thanks,
Laurent

