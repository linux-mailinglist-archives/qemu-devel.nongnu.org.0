Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AC572B30
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 04:08:11 +0200 (CEST)
Received: from localhost ([::1]:50076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBRnO-000178-Nh
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 22:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oBRlc-0006HI-8S
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 22:06:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57250 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oBRlY-0005Df-QH
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 22:06:19 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9OTKM5iqJQaAA--.17826S3; 
 Wed, 13 Jul 2022 10:06:13 +0800 (CST)
Subject: Re: loongarch missing tests/qtest/machine-none-test.c support
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: XiaoJuan Yang <yangxiaojuan@loongson.cn>
References: <CAFEAcA-79gwhLNia6=E7-WtQXo9nV7U=zwy=97dT_g8+vCDpHQ@mail.gmail.com>
From: gaosong <gaosong@loongson.cn>
Message-ID: <141d4f0a-9381-22fc-7777-186b5f20476d@loongson.cn>
Date: Wed, 13 Jul 2022 10:06:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-79gwhLNia6=E7-WtQXo9nV7U=zwy=97dT_g8+vCDpHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9Dxz9OTKM5iqJQaAA--.17826S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1DuFyrtF43Cw18KF45Jrb_yoW3tFbEvF
 W7ArsxAr4xG3yUJw1jvr93Xa4xJ3WrZF93AFWkAw40kw1IqF1rJrsYgws0y34a9Fn3Wrsa
 qw4jkFW5Aa45AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUba8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE
 -syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
 6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
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

HI, Peter

On 2022/7/12 下午11:32, Peter Maydell wrote:
> The tests/qtest/machine-none-test has a cpus_map[] array which needs
> to be updated to list a CPU that will work with the 'none' machine type
> for the longarch64 target. This results in a warning message during
> 'make check':
>
> $ QTEST_QEMU_BINARY=qemu-system-loongarch64 ./tests/qtest/machine-none-test
> # random seed: R02Sb57df3405339b14ef8e45e32fb787d3d
> 1..1
> # Start of loongarch64 tests
> # Start of machine tests
> # Start of none tests
> WARNING: cpu name for target 'loongarch64' isn't defined, add it to cpus_map
> ok 1 /loongarch64/machine/none/cpu_option
> # End of none tests
> # End of machine tests
> # End of loongarch64 tests
>
> Could somebody update the test appropriately, please?
I had send a patch to fix this.

Thanks.
Song Gao


