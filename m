Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FDC2330FD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 13:32:49 +0200 (CEST)
Received: from localhost ([::1]:60632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k16no-0003A8-OV
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 07:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <likaige@loongson.cn>)
 id 1k16j5-0005jZ-7X; Thu, 30 Jul 2020 07:27:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39854 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <likaige@loongson.cn>)
 id 1k16iy-0005Gb-CC; Thu, 30 Jul 2020 07:27:54 -0400
Received: from [10.130.0.69] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKMWrriJfc4MCAA--.476S3;
 Thu, 30 Jul 2020 19:27:39 +0800 (CST)
Subject: Re: [PATCH 2/2] target/arm: Fix compile error.
To: Peter Maydell <peter.maydell@linaro.org>
References: <1596074182-4920-1-git-send-email-likaige@loongson.cn>
 <1596074182-4920-2-git-send-email-likaige@loongson.cn>
 <CAFEAcA_ZgrkcpwYZD-stZGDDjhTgMOSLx--9KHPnxfbKz58s7g@mail.gmail.com>
 <25c0ba1a-088d-c932-1f17-030211af5d4f@loongson.cn>
 <CAFEAcA_uy0dpxQ07S=THCBaMx2R0-xaM_BUn8OxLkOwR9LJdWQ@mail.gmail.com>
From: Kaige Li <likaige@loongson.cn>
Message-ID: <b52213cb-1caf-75b9-7783-ca531af44e43@loongson.cn>
Date: Thu, 30 Jul 2020 19:27:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_uy0dpxQ07S=THCBaMx2R0-xaM_BUn8OxLkOwR9LJdWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxKMWrriJfc4MCAA--.476S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1DCr1DAw17JF43WF4xtFb_yoW8Xr1xpF
 WxGa1DKF4UXryrGrs2y34rX3Wjy3y5Kr18Za1ktrnaqr4qyr1YqrZrGrWakFWqqF1UA3yj
 gay7Z3y3W395AaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvSb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
 c2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
 ZEXa7IU0wL05UUUUU==
X-CM-SenderInfo: 5olntxtjh6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=likaige@loongson.cn;
 helo=loongson.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 07:18:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/30/2020 07:21 PM, Peter Maydell wrote:

> On Thu, 30 Jul 2020 at 12:19, Kaige Li <likaige@loongson.cn> wrote:
>> On 07/30/2020 04:44 PM, Peter Maydell wrote:
>>
>>> On Thu, 30 Jul 2020 at 02:56, Kaige Li <likaige@loongson.cn> wrote:
>>>> When I compile qemu with such as:
>>>>
>>>> git clone https://git.qemu.org/git/qemu.git
>>>> cd qemu
>>>> git submodule init
>>>> git submodule update --recursive
>>>> ./configure
>>>> make
>>>>
>>>> There is error log:
>>>>
>>>> /home/LiKaige/qemu/target/arm/translate-a64.c: In function ‘disas_ldst’:
>>>> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: ‘fn’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>>        fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
>>>>        ^
>>>> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: ‘fn’ was declared here
>>>>        AtomicThreeOpFn *fn;
>>>>                         ^
>>>> cc1: all warnings being treated as errors
>>>>
>>>> So, add an initiallization value for fn to fix this.
>>>>
>>>> Signed-off-by: Kaige Li <likaige@loongson.cn>
>>> What compiler version is this ?
>> It's the latest version: v5.1.0-rc2, but VERSION shows that is 5.0.92.
>> Commit id is 5772f2b1fc5d00e7e04e01fa28e9081d6550440a
> I asked for the compiler version, not the QEMU version :-)
> Clang, gcc, OSX clang, something else, and which version number?
Sorry for that. Gcc version is 4.9.4.
> -- PMM


