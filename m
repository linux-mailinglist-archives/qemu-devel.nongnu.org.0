Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E88596B41
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 10:19:52 +0200 (CEST)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOEHH-0003Kc-Ce
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 04:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oOE9F-0007wK-Ch
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:11:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51334 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oOE9C-00084s-KE
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 04:11:33 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxReKoovxi4igDAA--.16584S3; 
 Wed, 17 Aug 2022 16:11:20 +0800 (CST)
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
To: chen huacai <zltjiangshi@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: WANG Xuerui <i.qemu@xen0n.name>, qemu-level <qemu-devel@nongnu.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 maobibo <maobibo@loongson.cn>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
 <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
 <CABDp7VrhdgGG5WP7Bm5G2KmUytZ17GTDA3kYO6RPMcB5FyUo9Q@mail.gmail.com>
From: gaosong <gaosong@loongson.cn>
Message-ID: <2382c1cd-6318-34a2-35e8-addc751f6aeb@loongson.cn>
Date: Wed, 17 Aug 2022 16:11:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CABDp7VrhdgGG5WP7Bm5G2KmUytZ17GTDA3kYO6RPMcB5FyUo9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxReKoovxi4igDAA--.16584S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4kJw48Zw4rCrWxKF43Awb_yoW8urWUpF
 W3ta1fKFs7JrnrCan2yws3Zr1SyF1xJr45XF98Xr92yr98ZryfWr4xKF4j9Fy2q3s7XanF
 vFWUK3yfAF1rZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl
 42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUq38nUUUUU=
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


在 2022/8/17 上午10:36, chen huacai 写道:
> Hi, Richard and Xuerui,
>
> On Mon, Aug 15, 2022 at 4:54 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 8/14/22 09:55, WANG Xuerui wrote:
>>> From: WANG Xuerui <git@xen0n.name>
>>>
>>> The only LoongArch CPU implemented is modeled after the Loongson 3A5000,
>>> but it is not the real thing, ...
>> The 3A5000 is the SoC, as far as I could find, and the documentation of that says the core
>> is named the la464.
>>
>>
>>> In general, high-fidelity models can and should be named after the real
>>> hardware model, while generic emulation-oriented models should be named
>>> after ISA levels.
>> This wasn't intended to be a generic emulation model, as far as I know.  There are missing
>> features, but presumably those would eventually be filled in.
>>
>>
>>> For now, the best reference for LoongArch ISA levels
>>> is the revision number of the LoongArch ISA Manual, of which v1.00 is
>>> still the latest. (v1.01 and v1.02 are minor revisions without
>>> substantive change.)
>>>
>>> As defined by various specs, the vendor and model names are also
>>> reflected in respective CSRs, and are 8 bytes long. So, rename "la464"
>>> to "qemu64-v1.00", with "QEMU64" as vendor name and "v1.00" as model
>>> name.
>> Eh, I suppose.  I'm not really keen on this though, as I would presume there will be
>> eventual forward progress on completing the real cpu model.  We simply won't give any
>> compatibility guarantees for loongarch until we are ready to do so.
> In my opinion, real cpu name (Loongson-3A5000, Loongson-3A6000, etc.)
> and generic qemu emulated name (qemu64-v1.00, qemu64-v2.00, vx.xx is
> the ISA level, I found this style is used for x86) are both
> acceptable. But la464 is not a good cpu name, because la264 and la464
> are in the same ISA level, while la664 will be in a new level.
I think that 'la264' , 'la464' and 'la664'  are  cpu core name. used 
them as cpu type is more suitable.
Although la264 and la464 are in the same ISA level,   but the features 
should be different.

Thanks.
Song Gao
> Huacai
>
>>
>> r~
>>
>


