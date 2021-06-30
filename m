Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F3B3B7B37
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:23:26 +0200 (CEST)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOwn-0002qF-Nf
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lyOvh-0001zw-FC
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:22:17 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49306 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lyOvd-0001SL-Vx
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:22:17 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT0M9x9tgbI8aAA--.10030S3; 
 Wed, 30 Jun 2021 09:22:07 +0800 (CST)
Subject: Re: [PATCH 01/20] target/loongarch: Add README
To: Peter Maydell <peter.maydell@linaro.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
 <CAFEAcA_i7TozS=VP+5KzWxcsmDRTqX1aGeKky_iGzSC8AtxTGw@mail.gmail.com>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <0d9d4105-938b-717f-16e9-6a945617c90c@loongson.cn>
Date: Wed, 30 Jun 2021 09:22:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_i7TozS=VP+5KzWxcsmDRTqX1aGeKky_iGzSC8AtxTGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT0M9x9tgbI8aAA--.10030S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtFyUCrWrGry5tFy7Ar4ktFb_yoWkXwb_ZF
 W3AF4DC3yUA3W8Wa1vqFZxAF15Kan5XF98AF92qrWkJ348JFs8Jas5tFyF9FySqrZ3Zrn8
 Xw4vqw1fur17ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbakFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE
 -syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_
 WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
 IYCTnIWIevJa73UjIFyTuYvjfUF9a9DUUUU
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Bibo Mao <maobibo@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Peter,

On 06/29/2021 07:52 PM, Peter Maydell wrote:
> On Mon, 28 Jun 2021 at 13:04, Song Gao <gaosong@loongson.cn> wrote:
>>
>> This patch give an introduction to the LoongArch target.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
> 
>> +There are several code directories
>> +
>> +    1 qemu/target/loongarch
>> +        This is the instruction emulation directory
>> +    2 qemu/linux-user/loongarch64
>> +        Linux-user simulation
>> +    3 qemu/hw/loongarch
>> +        System simulation
>> +    4 qemu/tests/tcg/loongarch
>> +        Linux-user test
> 
> This isn't particularly specific to loongarch -- it's how
> all QEMU targets are structured. So I'm not sure you need
> to document it in an loongarch-specific README.
> 
> thanks
> -- PMM
> 

This part is redundant， I'll change it as Alex suggests.

> 
> This part, perhaps slightly expanded is probably better aimed at
> docs/system/target-loongarch.rst so it can be included in the generated
> manual. Bonus points for something along the lines of
> docs/system/arm/versatile.rst where you give a quick breakdown of the
> kernel config and an example command line.
> 

thanks


