Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3E8597E06
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 07:23:58 +0200 (CEST)
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOY0a-0000Qn-PY
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 01:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1oOXz1-0007VR-W7
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 01:22:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45316 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1oOXyz-0003Er-6y
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 01:22:19 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxrmt+zP1iDaMDAA--.5804S3; 
 Thu, 18 Aug 2022 13:22:06 +0800 (CST)
Message-ID: <b5fe0e53-72fe-cb01-15e4-ed7773756d7e@loongson.cn>
Date: Thu, 18 Aug 2022 13:22:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 gaosong <gaosong@loongson.cn>, chen huacai <zltjiangshi@gmail.com>
Cc: qemu-level <qemu-devel@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, WANG Xuerui <git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
 <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
 <CABDp7VrhdgGG5WP7Bm5G2KmUytZ17GTDA3kYO6RPMcB5FyUo9Q@mail.gmail.com>
 <2382c1cd-6318-34a2-35e8-addc751f6aeb@loongson.cn>
 <a5fde3dc-0fd4-8739-82b1-d94781637169@xen0n.name>
 <ac55b78a-602a-e875-5bf0-c5040d7de2a1@linaro.org>
 <daca3a69-08b3-be35-04b2-e6fcfe8207cd@xen0n.name>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <daca3a69-08b3-be35-04b2-e6fcfe8207cd@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxrmt+zP1iDaMDAA--.5804S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXFW5Gw18tw4UJr1kZryDGFg_yoW5Cw13pF
 yfKw4ftrs7tFZ7Aan7Zws7Zr45ArZ7Jay5Wwn8Cr93u3y5uF1Sqr4jyw4Fvay7ArWxWw1j
 qFWjgrWkG3WkZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
 9x0JUdHUDUUUUU=
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



在 2022/8/18 10:31, WANG Xuerui 写道:
> On 2022/8/17 21:26, Richard Henderson wrote:
>> On 8/17/22 04:10, WANG Xuerui wrote:
>>>  From my own experiences, different use cases care about different aspects of the CPU, and that IMO is an argument in favor of providing both (high-fidelity models named after actual product model names, and virtual models named after ISA levels). But before we have truly high-fidelity models I think we should start with the virtual ones first. And don't pretend the currently implemented model is LA464 -- the kernel change I've linked to [1] implies the opposite.
>>
>> No, it simply pointed to a bug in qemu that could have been fixed.
>>
>> The trouble with inventing virtual models is that no one knows what they mean.  Targeting real hardware is better, because we have a documented standard.
>>
> Hmm, I've looked up more context and it is indeed reasonable to generally name the QEMU models after real existing models. But in this case we could face a problem with Loongson's nomenclature: all of Loongson 3A5000, 3C5000 and 3C5000L are LA464, yet they should be distinguishable software-side by checking the model name CSR. But with only one CPU model that is LA464, currently this CSR is hard-coded to read "3A5000", and this can hurt IMO. And when we finally add LA264 and LA364 they would be identical ISA-level-wise, again the only differentiator is the model name CSR.
We will add LA264 later, there are some small different features with LA464, such as virtual/physical address width, unaligned address access, vector fpu width etc.
 

> And by "not high-fidelity", I mean some of the features present on real HW might never get implemented, or actually implementable, like the DVFS mechanism needed by cpufreq. And I believe Bibo wouldn't have to change the kernel if it's not needed after all to run the unmodified upstream kernel on top of qemu-system-loongarch64. (I would of course accept, and learn something along the way, if this turns out not to be the case though.)
qemu does not emulation actual voltage/freq function,  cpu freq 2000MHZ in qemu is not real freq, it is only function emulation rather than timing emulation.

regards
bibo,mao 

> Lastly, the "ISA level" I proposed is not arbitrarily made up; it's direct reference to the ISA manual revision. Each time the ISA gets some addition/revision the ISA manual has to be updated, and currently the manual's revision is the only reliable source of said information. (Loongson has a history of naming cores badly, like with the MIPS 3B1500 and 3A4000, both were "GS464V"; and 3A5000 was originally GS464V too, even though the insn encodings and some semantics have been entirely different.)
> 
> In conclusion, I'd accept the micro-architecture naming if the model CSR behavior could be sorted out, otherwise I'd personally prefer real model names if ISA level naming is not going to fly. This is not a strong objection to the current way of doing things though, more like some minor but anyway needed discussion that happened a bit late. Sorry for not chiming in earlier during the review process.


