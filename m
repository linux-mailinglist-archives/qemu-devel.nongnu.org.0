Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E573B7B32
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:11:05 +0200 (CEST)
Received: from localhost ([::1]:60096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOkq-0003qA-Nr
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lyOjB-0002S4-7O
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:09:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44898 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lyOj7-00016A-8O
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:09:21 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX0A3xNtgnY4aAA--.9994S3;
 Wed, 30 Jun 2021 09:09:12 +0800 (CST)
Subject: Re: [PATCH 01/20] target/loongarch: Add README
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
 <877dicrkd3.fsf@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <f3df7ec8-b77b-ce34-9e3d-9bf59518d961@loongson.cn>
Date: Wed, 30 Jun 2021 09:09:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <877dicrkd3.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX0A3xNtgnY4aAA--.9994S3
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWkurWUtF1fZF4UKw1fCrg_yoW8Zryfp3
 WfuFyftF4UGrsrJ34Sg3yaqFn8Xr4xKr17X3W29ry8Crsxtw1vvFnYgwnxWF9rZw1FkFW0
 vr95C34UuF45Z37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
 CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_
 JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY
 0VAS07AlzVAYIcxG8wCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaV
 Av8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
 0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUUU==
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, qemu-devel@nongnu.org,
 alistair.francis@wdc.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Alex,

On 06/29/2021 07:13 PM, Alex Bennée wrote:
> 
> Song Gao <gaosong@loongson.cn> writes:
> 
>> This patch give an introduction to the LoongArch target.
>>
>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>> ---
>>  MAINTAINERS             |  5 +++++
>>  target/loongarch/README | 16 ++++++++++++++++
>>  2 files changed, 21 insertions(+)
>>  create mode 100644 target/loongarch/README
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3ff56f5..f207805 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -209,6 +209,11 @@ F: disas/hppa.c
>>  F: hw/net/*i82596*
>>  F: include/hw/net/lasi_82596.h
>>  
>> +LoongArch TCG CPUS
>> +M: Song Gao <gaosong@loongson.cn>
>> +S: Maintained
>> +F: target/loongarch/
>> +
>>  M68K TCG CPUs
>>  M: Laurent Vivier <laurent@vivier.eu>
>>  S: Maintained
>> diff --git a/target/loongarch/README b/target/loongarch/README
>> new file mode 100644
>> index 0000000..0addfc7
>> --- /dev/null
>> +++ b/target/loongarch/README
>> @@ -0,0 +1,16 @@
>> +LoongArch is the general processor architecture of Loongson.
>> +
>> +The following versions of the LoongArch core are supported
>> +    core: 3A5000
>> +
>> https://github.com/loongson/LoongArch-Documentation/releases/download/LoongArch-Vol1-v3/LoongArch-Vol1-v1.00-EN.pdf
> 
> This part, perhaps slightly expanded is probably better aimed at
> docs/system/target-loongarch.rst so it can be included in the generated
> manual. Bonus points for something along the lines of
> docs/system/arm/versatile.rst where you give a quick breakdown of the
> kernel config and an example command line.
> 
>> +
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
> 
This is a good suggestion， I‘ll do it.

thanks.


