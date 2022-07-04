Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EF7564C3E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 05:58:56 +0200 (CEST)
Received: from localhost ([::1]:38448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8DEc-00058T-Lo
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 23:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o8DDL-0004N8-Bj
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 23:57:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53120 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o8DDI-0007Yq-Pe
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 23:57:35 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX+MgZcJitcwHAA--.23851S3; 
 Mon, 04 Jul 2022 11:57:21 +0800 (CST)
Subject: Re: [PATCH v21 00/13] Add LoongArch linux-user emulation support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220703085913.772936-1-richard.henderson@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <12cd505b-aeb2-d111-bbe8-1cfd1a7a55b5@loongson.cn>
Date: Mon, 4 Jul 2022 11:57:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220703085913.772936-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxX+MgZcJitcwHAA--.23851S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy3Ww4rZryxXrWkAFWxXrb_yoWrJryDp3
 yfur1fGw4rJrZ7JFyqqa45Z3Z5XF17Wr4ag3WSqry8CrWIkr18Zwn5Kas3Wa45Z3W0gFWj
 grykAw1UWF4UXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
 cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
 AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
 6F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14
 v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80
 ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x07beAp5UUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi, Richard

On 2022/7/3 下午4:59, Richard Henderson wrote:
> Hi.  This is Song Gao's v20 [1], with patch 2 extensively rewritten
> so that it handles lock_user properly.  It compiles, but I need
> to update the docker image we produced last year so that I can
> properly test this.
>
> In the meantime, Song, can you please test this?
>
Yes, I can,   but which test do you mean?
Test linxu-user with docker image?  like : 
https://wiki.qemu.org/Testing/DockerBuild#linux-user_Docker_targets

I had done test case 'make check'  and 'make check-tcg'.

Thanks
Song Gao
> r~
>
> [1] https://lore.kernel.org/qemu-devel/20220624031049.1716097-1-gaosong@loongson.cn/
>
> Song Gao (13):
>    linux-user: Add LoongArch generic header files
>    linux-user: Add LoongArch signal support
>    linux-user: Add LoongArch elf support
>    linux-user: Add LoongArch syscall support
>    linux-user: Add LoongArch cpu_loop support
>    scripts: add loongarch64 binfmt config
>    target/loongarch: remove badaddr from CPULoongArch
>    target/loongarch: Fix missing update CSR_BADV
>    target/loongarch: Fix helper_asrtle_d/asrtgt_d raise wrong exception
>    target/loongarch: remove unused include hw/loader.h
>    target/loongarch: Adjust functions and structure to support user-mode
>    default-configs: Add loongarch linux-user support
>    target/loongarch: Update README
>
>   configs/targets/loongarch64-linux-user.mak    |   3 +
>   linux-user/loongarch64/sockbits.h             |  11 +
>   linux-user/loongarch64/syscall_nr.h           | 312 ++++++++++++++++
>   linux-user/loongarch64/target_cpu.h           |  34 ++
>   linux-user/loongarch64/target_elf.h           |  12 +
>   linux-user/loongarch64/target_errno_defs.h    |  12 +
>   linux-user/loongarch64/target_fcntl.h         |  11 +
>   linux-user/loongarch64/target_prctl.h         |   1 +
>   linux-user/loongarch64/target_resource.h      |  11 +
>   linux-user/loongarch64/target_signal.h        |  13 +
>   linux-user/loongarch64/target_structs.h       |  11 +
>   linux-user/loongarch64/target_syscall.h       |  48 +++
>   linux-user/loongarch64/termbits.h             |  11 +
>   linux-user/syscall_defs.h                     |   6 +-
>   target/loongarch/cpu.h                        |   8 +-
>   target/loongarch/helper.h                     |   2 +
>   target/loongarch/internals.h                  |   2 +
>   linux-user/elfload.c                          |  91 +++++
>   linux-user/loongarch64/cpu_loop.c             |  96 +++++
>   linux-user/loongarch64/signal.c               | 335 ++++++++++++++++++
>   target/loongarch/cpu.c                        |  34 +-
>   target/loongarch/gdbstub.c                    |   2 +-
>   target/loongarch/op_helper.c                  |  10 +-
>   .../insn_trans/trans_privileged.c.inc         |  36 ++
>   scripts/gensyscalls.sh                        |   2 +
>   scripts/qemu-binfmt-conf.sh                   |   6 +-
>   target/loongarch/README                       |  39 +-
>   27 files changed, 1144 insertions(+), 15 deletions(-)
>   create mode 100644 configs/targets/loongarch64-linux-user.mak
>   create mode 100644 linux-user/loongarch64/sockbits.h
>   create mode 100644 linux-user/loongarch64/syscall_nr.h
>   create mode 100644 linux-user/loongarch64/target_cpu.h
>   create mode 100644 linux-user/loongarch64/target_elf.h
>   create mode 100644 linux-user/loongarch64/target_errno_defs.h
>   create mode 100644 linux-user/loongarch64/target_fcntl.h
>   create mode 100644 linux-user/loongarch64/target_prctl.h
>   create mode 100644 linux-user/loongarch64/target_resource.h
>   create mode 100644 linux-user/loongarch64/target_signal.h
>   create mode 100644 linux-user/loongarch64/target_structs.h
>   create mode 100644 linux-user/loongarch64/target_syscall.h
>   create mode 100644 linux-user/loongarch64/termbits.h
>   create mode 100644 linux-user/loongarch64/cpu_loop.c
>   create mode 100644 linux-user/loongarch64/signal.c
>


