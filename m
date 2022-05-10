Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7ED520B8D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 04:55:38 +0200 (CEST)
Received: from localhost ([::1]:51902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noG2D-0004Oh-Gj
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 22:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1noG1J-0003jU-UB
 for qemu-devel@nongnu.org; Mon, 09 May 2022 22:54:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37010 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1noG1H-0002k2-7o
 for qemu-devel@nongnu.org; Mon, 09 May 2022 22:54:41 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGtnl03liOJQPAA--.58097S3; 
 Tue, 10 May 2022 10:54:30 +0800 (CST)
Message-ID: <2dc9050b-00b2-e571-b553-f1d49c0d9a4a@loongson.cn>
Date: Tue, 10 May 2022 10:54:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 34/43] hw/intc: Add LoongArch extioi interrupt
 controller(EIOINTC)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-35-yangxiaojuan@loongson.cn>
 <c6b58ba0-38c4-6542-86d1-eb1f14a12121@linaro.org>
 <707db6c2-49f2-2ca2-7025-0cf401f11c60@loongson.cn>
 <e514e333-b458-517f-66f7-f3fd0a0c5bad@linaro.org>
 <CAFEAcA8y-ZVeEHDXUv2bAwKL9EumTmrJ-Xz1r23C7Lm0yajBdQ@mail.gmail.com>
 <402096bf-2a89-311e-6174-eac63b78f74a@linaro.org>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <402096bf-2a89-311e-6174-eac63b78f74a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGtnl03liOJQPAA--.58097S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4xZF43Wr1rKw48KrWDCFg_yoW5Jr13pr
 ZFka1Ikr4qyrn7Aws7Xan5XF98AFs3Jry3Z34DAry8C3s8uryftFWjka95uFyUZr1xZ3Wj
 vrWYkwn7WFWqyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
 IFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
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



在 2022/5/10 02:25, Richard Henderson 写道:
> On 5/9/22 13:04, Peter Maydell wrote:
>> On Mon, 9 May 2022 at 18:56, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> I'm not 100% sure how this "Other configuration control register" should be handled, but
>>> definitely not like this.
>>>
>>> I see you're putting control of this register into loongarch_qemu_read in
>>> target/loongarch/cpu.c.  Which, I suppose is fair, because this is documented as part of
>>> the 3A5000 cpu documentation.  But then you split out all of the devices which are *also*
>>> documented as part of the cpu into the board configuration.
>>>
>>> This reminds me of the memory-mapped interface that the armv7m cpu has with its own
>>> registers.  I believe that you need to model this similarly, where you will have a device
>>> that represents the cpu, and then instantiates all of the devices that are listed in the
>>> Loongson 3A5000 TRM -- call this ls3a to match the ls7a name you have for the 7A1000
>>> bridge device.
>>>
>>> When there is a write to the ls3a "Other function configuration register", the ls3a will
>>> need to communicate the changes to the various bits to its various sub-devices.  I do not
>>> think it unreasonable to have direct function calls between the components.
>>>
>>> Peter, do you have any advice from the armv7m side?
>>
>> Nothing concrete. I'm not sure that we'd structure the armv7m stuff the way
>> we have now if we were writing it from scratch, but it's functional enough.
>> (In particular, if MMIO regions were part of Device rather than SysBusDevice
>> then I'd be tempted to suggest that CPUs with MMIO-mapped registers should
>> directly own their MemoryRegions for them. But they aren't, so we can't do
>> that.)
> 
> Having thought about this a little more, I believe that these registers are part of the "cpu package", because they are shared between the 4 cpu cores within the package.  Thus their current placement attached to LoongArchCPU -- as well as the current placement of address_space_iocsr -- is incorrect.

The extioi hardware design is not friend to software developer, local cpu INTC
is mixed with board INTC with extioi/iocsr. Local cpu INTC registers should be banked,
address space is space for local cpu review point.

how about put address_space_iocsr as board rather than percpu since there is no concept
of "cpu package".

regards
bibo, mao
> 
> 
> r~


