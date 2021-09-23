Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391D41587C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 08:54:41 +0200 (CEST)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTIcx-0003dK-8g
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 02:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTIby-0002xL-GE
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 02:53:38 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:44145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTIbw-00046L-Ll
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 02:53:38 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MBjA4-1mYlj303H2-00CDkr; Thu, 23 Sep 2021 08:53:13 +0200
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
 <1631866380-31017-18-git-send-email-gaosong@loongson.cn>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v6 17/21] LoongArch Linux User Emulation
Message-ID: <559cd34a-723d-f7e7-261a-014218e054c1@vivier.eu>
Date: Thu, 23 Sep 2021 08:53:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1631866380-31017-18-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:N+PfXcAStLhT25+BoWvogvH6VK+OZe7168hxV6/6n9uB8aFYHhV
 l5Vg9yoEnbRaT9KQurIZRMKgN2lFCXoApujmZ3mAgSePHIk4uDFE9V2mPUWmDnIcKswYidI
 Z/m9NMCZLSsjxLLMOW9QhwwZBGTSj4CkJgUixr0IXxLEuFvhcTzq2DXlvt60T6m0eISh6QV
 MXke474Ln0nZoIeJUhoQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GOnasfbaCjE=:kSze7BrIqZ4nBMstCElkia
 akNVHatFVHfaou4T12vXrxWBJOHwoff/gi99nutw4JIRw6OVmTRIDvV/wsUgYSWLVpxBOJx43
 D+MQhtQ/ycR1+vs1ePPI7tL8Tk/4Sx2+SWNTR3/1wDTIyqSZEp4YtpIVzKFhFsc0e6/u4c8hO
 DxITnID40TSzhs2bPzzcj10/ysjMGcUiuthjP77/M8CqzXyy70ML96qvzK4Av2k4KXcF/z9xb
 o0wabbASpy+9i2AJDBSmG/TxQornXi0dfQFvNk8/QSoYlzJtCY7Qjr8MdWLnrev7d/X7WTtWe
 LoeaxH4qiWLc0iv8p9zIjBbmoZrO+DwknKwpJjiiOo2E3AibFMiqRKeeljxLjUGpCAsAqMSMm
 tX9DDKmEjVaRfqNOS8Gi3maMw55VeaszGp0wvOS+lSB76M2l4plF2eXuJ/Ggbp5IhTBM4OQEn
 OKYKKs74qAFqMaYobW/RoI17prDgRkEL+qHZnZEh8JE8KpTpSyai6iZMPFs/3RCd9bxZXO2nA
 o9brVpEeny5Umrg5mEedU22ZTfrtkrPljpA0pr+Ev+KiJgQX9KCSpgXQ93nDafCqt0RvPT7Fk
 cjiVqTIJZUfoDvZESH9FuTDYkg/WCSjcOTht5F4Td9n1ARwEmCTd40flur7sRnUvq0E456zoO
 DaDfcz50pwymoyPWTLtp/tSjy62ItLZ/uifLUezdjKJ2E/38XG+fzpteXb35TIPWHUhG5umI2
 +RCW86QcJzqxxyhluUic52xdcpkWoIx5kRQT/Q==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, f4bug@amsat.org, peterx@redhat.com,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 10:12, Song Gao a écrit :
> Implementation of linux user emulation for LoongArch.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
> ---
>  accel/tcg/user-exec.c                      |  15 ++
>  configure                                  |   5 +
>  include/elf.h                              |   2 +
>  linux-user/elfload.c                       |  58 ++++++
>  linux-user/host/loongarch/hostdep.h        |  11 +
>  linux-user/loongarch64/cpu_loop.c          |  97 +++++++++
>  linux-user/loongarch64/signal.c            | 162 +++++++++++++++
>  linux-user/loongarch64/sockbits.h          |   1 +
>  linux-user/loongarch64/syscall_nr.h        | 312 +++++++++++++++++++++++++++++
>  linux-user/loongarch64/target_cpu.h        |  35 ++++
>  linux-user/loongarch64/target_elf.h        |  14 ++
>  linux-user/loongarch64/target_errno_defs.h |   7 +
>  linux-user/loongarch64/target_fcntl.h      |  12 ++
>  linux-user/loongarch64/target_signal.h     |  30 +++
>  linux-user/loongarch64/target_structs.h    |  49 +++++
>  linux-user/loongarch64/target_syscall.h    |  46 +++++
>  linux-user/loongarch64/termbits.h          |   1 +
>  linux-user/syscall_defs.h                  |  10 +-
>  18 files changed, 863 insertions(+), 4 deletions(-)
>  create mode 100644 linux-user/host/loongarch/hostdep.h
>  create mode 100644 linux-user/loongarch64/cpu_loop.c
>  create mode 100644 linux-user/loongarch64/signal.c
>  create mode 100644 linux-user/loongarch64/sockbits.h
>  create mode 100644 linux-user/loongarch64/syscall_nr.h
>  create mode 100644 linux-user/loongarch64/target_cpu.h
>  create mode 100644 linux-user/loongarch64/target_elf.h
>  create mode 100644 linux-user/loongarch64/target_errno_defs.h
>  create mode 100644 linux-user/loongarch64/target_fcntl.h
>  create mode 100644 linux-user/loongarch64/target_signal.h
>  create mode 100644 linux-user/loongarch64/target_structs.h
>  create mode 100644 linux-user/loongarch64/target_syscall.h
>  create mode 100644 linux-user/loongarch64/termbits.h
> 
...

> diff --git a/linux-user/loongarch64/syscall_nr.h b/linux-user/loongarch64/syscall_nr.h
> new file mode 100644
> index 0000000..8fbf287
> --- /dev/null
> +++ b/linux-user/loongarch64/syscall_nr.h
> @@ -0,0 +1,312 @@
> +/*
> + * This file contains the system call numbers.
> + * Do not modify.
> + * This file is generated by scripts/gensyscalls.sh
> + */

Where are the changes to scripts/gensyscalls.sh?

You need to add something like:

generate_syscall_nr loongarch 64 "$output/linux-user/loongarch64/syscall_nr.h"


Thanks,
Laurent

