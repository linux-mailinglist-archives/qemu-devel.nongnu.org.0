Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7CC4EBE14
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:52:14 +0200 (CEST)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUzs-0008D9-SA
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:52:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nZUjC-00060N-IL
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:34:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39168 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nZUjA-0003uP-0J
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:34:58 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxXxM1JERiUuoSAA--.20232S3; 
 Wed, 30 Mar 2022 17:34:45 +0800 (CST)
Subject: Re: [RFC PATCH v7 00/29] Add LoongArch softmmu support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <306d867f-42b8-bf40-0fdf-7fe996542fb7@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <eff99931-6bdc-741a-e6c0-562562fcd813@loongson.cn>
Date: Wed, 30 Mar 2022 17:34:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <306d867f-42b8-bf40-0fdf-7fe996542fb7@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxXxM1JERiUuoSAA--.20232S3
X-Coremail-Antispam: 1UD129KBjvJXoW7XrWDJr1DKF4DGw48GrW5GFg_yoW8JF45pF
 W09FWakrs8C3ykA3s2g3y8ur1jv3yrGFnxJa13trykZFsrZasavr409FWFgw17u3y8WFW2
 qFWruw18u3WDXrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUva14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
 026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
 JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
 vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyT
 uYvjfUozVbDUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard.

On 2022/3/29 上午2:13, Richard Henderson wrote:
> On 3/28/22 06:57, Xiaojuan Yang wrote:
>> This series patch add softmmu support for LoongArch.
>> The latest kernel:
>>    * https://github.com/loongson/linux/tree/loongarch-next
>> The latest uefi:
>>    * https://github.com/loongson/edk2
>>    * https://github.com/loongson/edk2-platforms
>> The manual:
>>    * 
>> https://github.com/loongson/LoongArch-Documentation/releases/tag/2021.10.11
>>
>> You can get LoongArch qemu series like this:
>>     git clone https://github.com/loongson/qemu.git
>>     git checkout tcg-dev
>
> I strongly suggest that you rebase *without* the patches for 
> linux-user/loongarch64/.
> If you do not do this, you will be stalled until your linux kernel 
> patches are merged.
>
> Testing this rebase locally, there is only a minor patch conflict in
>
>     target/loongarch: Add LoongArch interrupt and exception handle
>
> which suggests that the EXCP_* names be removed from
>
>     target/loongarch: Add core definition
>
> The EXCCODE_* names be introduced early instead, and all of the uses 
> updated.
>
OK,  Thanks for your advice,  We will send a new series after solving 
all problems.

Thanks.
Xiaojuan
>
> r~


