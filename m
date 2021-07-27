Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BDF3D6B9D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 03:47:45 +0200 (CEST)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8CC7-0001Kn-Lj
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 21:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m8CB5-0000ew-E8
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 21:46:39 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37800 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m8CB3-0006cZ-3N
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 21:46:39 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0F1Zf9gpUwkAA--.23511S3; 
 Tue, 27 Jul 2021 09:46:30 +0800 (CST)
Subject: Re: [PATCH v2 12/22] target/loongarch: Add fixed point extra
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-13-git-send-email-gaosong@loongson.cn>
 <7a500d72-7d16-1a02-2ede-5e07f1383812@linaro.org>
 <a08adb9a-67fe-b8aa-4b72-a3b3548f4945@loongson.cn>
 <67b93a73-466b-cbb6-89ce-1b1908d74898@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <2c73b8c8-960f-d169-9887-bdcc5de5f681@loongson.cn>
Date: Tue, 27 Jul 2021 09:46:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <67b93a73-466b-cbb6-89ce-1b1908d74898@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0F1Zf9gpUwkAA--.23511S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1DuF4rJw13Aw47CFW3ZFb_yoWDAFb_Xr
 WUur1DWryvy3yUtF1kt398Z3ZrCr10y34Utw4Yv34jk343XF95GF15K3s5ZanrGay7AF1U
 CwnIq3W3Wry5WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbhkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY
 0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaV
 Av8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
 0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard.

On 07/27/2021 12:42 AM, Richard Henderson wrote:
> On 7/26/21 2:57 AM, Song Gao wrote:
>>
>> Hi, Richard.
>>
>> On 07/23/2021 01:12 PM, Richard Henderson wrote:
>>> On 7/20/21 11:53 PM, Song Gao wrote:
>>>> +target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
>>>> +{
>>>> +    target_ulong r = 0;
>>>> +
>>>> +    switch (rj) {
>>>> +    case 0:
>>>> +        r = env->CSR_MCSR0 & 0xffffffff;
>>>> +        break;
>>>> +    case 1:
>>>> +        r = (env->CSR_MCSR0 & 0xffffffff00000000) >> 32;
>>>> +        break;
>>>
>>> Why do you represent all of these as high and low portions of a 64-bit internal value, when the manual describes them as 32-bit values?
>>>
>> This method can reduce variables on env.
> 
> The number of variables may increase, but the memory consumed -- which is the metric that is more important -- is still the same.
> 
> Also, it is much less confusing to match the description in the manual.
> 
OK.

Thanks
Song Gao.
> 
> r~


