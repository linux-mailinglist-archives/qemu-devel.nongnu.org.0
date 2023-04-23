Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDCA6EBD90
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 09:01:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqTh3-0006CS-Nf; Sun, 23 Apr 2023 02:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaotianrui@loongson.cn>)
 id 1pqTh0-0006C7-AR
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 02:59:26 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhaotianrui@loongson.cn>) id 1pqTgw-0002tW-Vv
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 02:59:25 -0400
Received: from loongson.cn (unknown [10.20.42.120])
 by gateway (Coremail) with SMTP id _____8AxYcw+10Rk1_IgAA--.51494S3;
 Sun, 23 Apr 2023 14:59:10 +0800 (CST)
Received: from [10.20.42.120] (unknown [10.20.42.120])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxeb0910RkMHk2AA--.64904S3; 
 Sun, 23 Apr 2023 14:59:10 +0800 (CST)
Subject: Re: [PATCH RFC v1 01/10] linux-headers: Add KVM headers for loongarch
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, gaosong@loongson.cn
References: <20230420093606.3366969-1-zhaotianrui@loongson.cn>
 <20230420093606.3366969-2-zhaotianrui@loongson.cn>
 <87bkji51e2.fsf@redhat.com>
 <202d559e-a244-6855-949b-59ed55470ec0@loongson.cn>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, maobibo@loongson.cn
From: Tianrui Zhao <zhaotianrui@loongson.cn>
Message-ID: <44d0900e-e103-8392-109e-54f28cd0168a@loongson.cn>
Date: Sun, 23 Apr 2023 14:59:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <202d559e-a244-6855-949b-59ed55470ec0@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxeb0910RkMHk2AA--.64904S3
X-CM-SenderInfo: p2kd03xldq233l6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvdXoWrKr4xAFyxKw4DAF4fAF47Jwb_yoWkArbEvw
 4xA34DK398G3Z5ta4Ut3WYgFya9ay0ywn0vFyYqFnxGrn5trW7Zr4Ik3yxu3Z8tr48uFs8
 Jr95Jw1rArnrXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 x7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
 xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=zhaotianrui@loongson.cn; helo=loongson.cn
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.047,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2023年04月20日 20:59, Tianrui Zhao 写道:
>
>
> 在 2023年04月20日 17:49, Cornelia Huck 写道:
>> On Thu, Apr 20 2023, Tianrui Zhao <zhaotianrui@loongson.cn> wrote:
>>
>>> Add asm-loongarch/kvm.h for loongarch KVM, and update
>>> the linux/kvm.h about loongarch part. The structures in
>>> the header are used as kvm_ioctl arguments.
>> Just a procedural note: It's probably best to explicitly mark this as a
>> placeholder patch until you can replace it with a full headers update.
> Thanks, I will mark this as a placeholder patch until it can be merged.
>
> Thanks
> Tianrui Zhao
I will use update-linux-headers.sh to generate the kvm related headers 
until the linux kvm patches are accepted. And now this patch is only a 
placeholder to show some kvm structures and macros for reviewers.

Thanks
Tianrui Zhao
>>
>>> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
>>> ---
>>>   linux-headers/asm-loongarch/kvm.h | 99 
>>> +++++++++++++++++++++++++++++++
>>>   linux-headers/linux/kvm.h         |  9 +++
>>>   2 files changed, 108 insertions(+)
>>>   create mode 100644 linux-headers/asm-loongarch/kvm.h
>


