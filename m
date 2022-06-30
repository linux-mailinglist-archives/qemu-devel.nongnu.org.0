Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DED1561B09
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 15:10:36 +0200 (CEST)
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6twI-0004es-7r
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 09:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o6trw-0001Sk-S9
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:06:04 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54322 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o6trn-0007U2-Rr
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 09:06:04 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD9ujn71iYWdmAA--.17018S3; 
 Thu, 30 Jun 2022 21:05:44 +0800 (CST)
Subject: Re: [PATCH v20 00/13] Add LoongArch linux-user emulation support
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu
References: <20220624031049.1716097-1-gaosong@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <2f7f76d2-4d36-057e-e699-c96e0fb3dd01@loongson.cn>
Date: Thu, 30 Jun 2022 21:05:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220624031049.1716097-1-gaosong@loongson.cn>
Content-Type: multipart/alternative;
 boundary="------------A258979D347B8CB0DCF8D1D2"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxD9ujn71iYWdmAA--.17018S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGr1kGw4fZr1rtw1kAw1fWFg_yoWrAF4Upr
 Wfur1fGw48GrZ7Jr1qqa45uFn5X3W7Wr4a93WSqry8CryIyry8uwn3KF9xWa43Z3WrKryj
 qr9Yyw1UWF4UXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
 cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
 AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
 6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
 0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv
 7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx8Gjc
 xK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF04k20xvY
 0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
 IFyTuYvjxUqFksDUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

This is a multi-part message in MIME format.
--------------A258979D347B8CB0DCF8D1D2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Richard

On 2022/6/24 上午11:10, Song Gao wrote:
> Hi All,
>
> This series adds support linux-user emulation.
> As the LoongArch kernel had merged into 5.19-rc1,
> you can see the latest kernel at https://kernel.org
>
> Need review patch:
>
>    0002-linux-user-Add-LoongArch-signal-support.patch
>
> V20:
>    - Update signal.c, we should't set sc_extcontext[0] on
>      setup_sigcontext;
>
> V19:
>    - Update signal.c, add fpu info, fpu_context and end info to
>      target_rt_sigframe.
>
> V18:
>    - Update signal.c, add set fpu_context'magic, update parse_extcontext()
>      and remove some cast.
>
> V17:
>    - Split v16 patch7 to  patch7-11, and fix some bugs for system-mode;
>    - Update signal.c, add parse_extcontext();
>    - Add get_elf_hwcap(), and ELF_PLATFORM.
>
> V16:
>    - Update signal.c;
>    - Update helper_rdtime_d();
>    - Update scripts/gensyscalls.sh, fixed a warning.
>
> v15:
>    - Rebase;
>    - Update README;
>    - Adjust some functions and structure to support user-mode;
>    - Update syscall;
>    - Update target_sigcontext;
>
> Old series:
>     - https://patchew.org/QEMU/20220623085526.1678168-1-gaosong@loongson.cn/
>
> Test:
>     make check  && make check-tcg  &&  run LoongArch bash
>
> Thanks.
> Song Gao
>
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

Sorry for disturbing you,   Should we need some changes or tests with 
this series?

Thanks.
Song Gao
>   configs/targets/loongarch64-linux-user.mak    |   3 +
>   linux-user/elfload.c                          |  91 +++++
>   linux-user/loongarch64/cpu_loop.c             |  96 ++++++
>   linux-user/loongarch64/signal.c               | 326 ++++++++++++++++++
>   linux-user/loongarch64/sockbits.h             |  11 +
>   linux-user/loongarch64/syscall_nr.h           | 312 +++++++++++++++++
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
>   scripts/gensyscalls.sh                        |   2 +
>   scripts/qemu-binfmt-conf.sh                   |   6 +-
>   target/loongarch/README                       |  39 ++-
>   target/loongarch/cpu.c                        |  34 +-
>   target/loongarch/cpu.h                        |   8 +-
>   target/loongarch/gdbstub.c                    |   2 +-
>   target/loongarch/helper.h                     |   2 +
>   .../insn_trans/trans_privileged.c.inc         |  36 ++
>   target/loongarch/internals.h                  |   2 +
>   target/loongarch/op_helper.c                  |  10 +-
>   27 files changed, 1135 insertions(+), 15 deletions(-)
>   create mode 100644 configs/targets/loongarch64-linux-user.mak
>   create mode 100644 linux-user/loongarch64/cpu_loop.c
>   create mode 100644 linux-user/loongarch64/signal.c
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
>

--------------A258979D347B8CB0DCF8D1D2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi, Richard<br>
    </p>
    <div class="moz-cite-prefix">On 2022/6/24 上午11:10, Song Gao wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220624031049.1716097-1-gaosong@loongson.cn">
      <pre class="moz-quote-pre" wrap="">Hi All,

This series adds support linux-user emulation.
As the LoongArch kernel had merged into 5.19-rc1,
you can see the latest kernel at <a class="moz-txt-link-freetext" href="https://kernel.org">https://kernel.org</a>

Need review patch:

  0002-linux-user-Add-LoongArch-signal-support.patch

V20:
  - Update signal.c, we should't set sc_extcontext[0] on
    setup_sigcontext;

V19:
  - Update signal.c, add fpu info, fpu_context and end info to
    target_rt_sigframe.

V18:
  - Update signal.c, add set fpu_context'magic, update parse_extcontext()
    and remove some cast.

V17:
  - Split v16 patch7 to  patch7-11, and fix some bugs for system-mode;
  - Update signal.c, add parse_extcontext();
  - Add get_elf_hwcap(), and ELF_PLATFORM.

V16:
  - Update signal.c;
  - Update helper_rdtime_d();
  - Update scripts/gensyscalls.sh, fixed a warning.

v15:
  - Rebase;
  - Update README;
  - Adjust some functions and structure to support user-mode;
  - Update syscall;
  - Update target_sigcontext;

Old series:
   - <a class="moz-txt-link-freetext" href="https://patchew.org/QEMU/20220623085526.1678168-1-gaosong@loongson.cn/">https://patchew.org/QEMU/20220623085526.1678168-1-gaosong@loongson.cn/</a>

Test:
   make check  &amp;&amp; make check-tcg  &amp;&amp;  run LoongArch bash

Thanks.
Song Gao


Song Gao (13):
  linux-user: Add LoongArch generic header files
  linux-user: Add LoongArch signal support
  linux-user: Add LoongArch elf support
  linux-user: Add LoongArch syscall support
  linux-user: Add LoongArch cpu_loop support
  scripts: add loongarch64 binfmt config
  target/loongarch: remove badaddr from CPULoongArch
  target/loongarch: Fix missing update CSR_BADV
  target/loongarch: Fix helper_asrtle_d/asrtgt_d raise wrong exception
  target/loongarch: remove unused include hw/loader.h
  target/loongarch: Adjust functions and structure to support user-mode
  default-configs: Add loongarch linux-user support
  target/loongarch: Update README
</pre>
    </blockquote>
    <p>Sorry for disturbing you,   Should we need some changes or tests
      with this series?  </p>
    <span style="color: rgb(69, 69, 69); font-family: &quot;Times New
      Roman&quot;; font-size: 18.6667px; font-style: normal;
      font-variant-ligatures: normal; font-variant-caps: normal;
      font-weight: 400; letter-spacing: normal; orphans: 2; text-align:
      justify; text-indent: 0px; text-transform: none; white-space:
      normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:
      0px; background-color: rgb(255, 255, 255);
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span>Thanks. <br>
    Song Gao<br>
    <blockquote type="cite"
      cite="mid:20220624031049.1716097-1-gaosong@loongson.cn">
      <pre class="moz-quote-pre" wrap="">
 configs/targets/loongarch64-linux-user.mak    |   3 +
 linux-user/elfload.c                          |  91 +++++
 linux-user/loongarch64/cpu_loop.c             |  96 ++++++
 linux-user/loongarch64/signal.c               | 326 ++++++++++++++++++
 linux-user/loongarch64/sockbits.h             |  11 +
 linux-user/loongarch64/syscall_nr.h           | 312 +++++++++++++++++
 linux-user/loongarch64/target_cpu.h           |  34 ++
 linux-user/loongarch64/target_elf.h           |  12 +
 linux-user/loongarch64/target_errno_defs.h    |  12 +
 linux-user/loongarch64/target_fcntl.h         |  11 +
 linux-user/loongarch64/target_prctl.h         |   1 +
 linux-user/loongarch64/target_resource.h      |  11 +
 linux-user/loongarch64/target_signal.h        |  13 +
 linux-user/loongarch64/target_structs.h       |  11 +
 linux-user/loongarch64/target_syscall.h       |  48 +++
 linux-user/loongarch64/termbits.h             |  11 +
 linux-user/syscall_defs.h                     |   6 +-
 scripts/gensyscalls.sh                        |   2 +
 scripts/qemu-binfmt-conf.sh                   |   6 +-
 target/loongarch/README                       |  39 ++-
 target/loongarch/cpu.c                        |  34 +-
 target/loongarch/cpu.h                        |   8 +-
 target/loongarch/gdbstub.c                    |   2 +-
 target/loongarch/helper.h                     |   2 +
 .../insn_trans/trans_privileged.c.inc         |  36 ++
 target/loongarch/internals.h                  |   2 +
 target/loongarch/op_helper.c                  |  10 +-
 27 files changed, 1135 insertions(+), 15 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_prctl.h
 create mode 100644 linux-user/loongarch64/target_resource.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h

</pre>
    </blockquote>
  </body>
</html>

--------------A258979D347B8CB0DCF8D1D2--


