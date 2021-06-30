Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43A13B7B6C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 04:00:18 +0200 (CEST)
Received: from localhost ([::1]:36770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyPWT-0004Vv-JS
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 22:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lyPVh-0003qP-0k
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:59:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58302 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lyPVb-0001zA-0n
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:59:28 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT0Hxz9tgEpMaAA--.32160S3; 
 Wed, 30 Jun 2021 09:59:15 +0800 (CST)
Subject: Re: [PATCH 20/20] target/loongarch: Add linux-user emulation support
To: Peter Maydell <peter.maydell@linaro.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-21-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <4faedfef-82d6-5647-2f42-f05b92834d65@loongson.cn>
Date: Wed, 30 Jun 2021 09:59:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_swZQG=XCGN4U4XfqrvK2poJw33oEC-5NDFtU3dT1ZuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxT0Hxz9tgEpMaAA--.32160S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4rCF47Kr4fKr1UJFW5KFg_yoW8ZF1kp3
 4rCr1Fgr4rJrZrJ3Waq34UXFn5Xrn7WFnrWa4ftry8ArWruFyjvr1DWFy0g3W3Xw18KFWF
 qFykK34UWF4DXFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBl1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
 kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
 6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
 vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0
 c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1s
 IEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
 42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
 C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Bibo Mao <maobibo@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, yangxiaojuan@loongson.cn,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Peter,

On 06/29/2021 09:42 PM, Peter Maydell wrote:
> On Mon, 28 Jun 2021 at 13:05, Song Gao <gaosong@loongson.cn> wrote:
>>
>> Add files to linux-user/loongarch64
>> Add file to default-configs
>> Add loongarch to target/meson.build
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  MAINTAINERS                                        |   1 +
>>  default-configs/targets/loongarch64-linux-user.mak |   4 +
>>  include/elf.h                                      |   2 +
>>  linux-user/elfload.c                               |  58 ++++
>>  linux-user/loongarch64/cpu_loop.c                  | 177 ++++++++++++
>>  linux-user/loongarch64/signal.c                    | 193 +++++++++++++
>>  linux-user/loongarch64/sockbits.h                  |   1 +
>>  linux-user/loongarch64/syscall_nr.h                | 307 +++++++++++++++++++++
>>  linux-user/loongarch64/target_cpu.h                |  36 +++
>>  linux-user/loongarch64/target_elf.h                |  14 +
>>  linux-user/loongarch64/target_fcntl.h              |  12 +
>>  linux-user/loongarch64/target_signal.h             |  28 ++
>>  linux-user/loongarch64/target_structs.h            |  49 ++++
>>  linux-user/loongarch64/target_syscall.h            |  46 +++
>>  linux-user/loongarch64/termbits.h                  | 229 +++++++++++++++
>>  linux-user/syscall_defs.h                          |   8 +-
>>  meson.build                                        |   2 +-
>>  qapi/machine-target.json                           |   4 +-
>>  target/loongarch/meson.build                       |  19 ++
>>  target/meson.build                                 |   1 +
>>  20 files changed, 1185 insertions(+), 6 deletions(-)
> 
> This is a massive patch that would benefit from being split up
> into multiple smaller patches.
> 
> I'm told by a kernel developer that loongarch hasn't yet been
> accepted into the Linux kernel mainline. Until it has been, the
> syscall ABI for it is not yet stable, so we won't be able to take
> the linux-user patches for it yet. (We have been burned in the
> past by taking linux-user architecture support patches without
> realizing they weren't for a stable ABI, and then being out of
> sync with the eventual upstream kernel ABI that was accepted.)
> 
> We can certainly do code review in the meantime, though.
> 
> thanks
> -- PMM
> 
Accept, I can divide this patch into 2 or 3 smaller patches.

thanks 


