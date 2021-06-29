Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE53B6ECD
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 09:35:05 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly8Gu-0002Wy-BU
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 03:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ly8Fd-0001og-4H
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:33:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51862 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ly8FZ-0003w6-Fa
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 03:33:44 -0400
Received: from localhost.localdomain (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr0LMzNpg3C4aAA--.31870S3; 
 Tue, 29 Jun 2021 15:33:33 +0800 (CST)
Subject: Re: [PATCH 01/20] target/loongarch: Add README
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
 <f97feb5c-42ef-2ce0-a8c9-4ecc32222841@amsat.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <eb6dba3c-3bc1-f419-d909-c4d96de88247@loongson.cn>
Date: Tue, 29 Jun 2021 15:33:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <f97feb5c-42ef-2ce0-a8c9-4ecc32222841@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr0LMzNpg3C4aAA--.31870S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW3Cw1rXFy5Jw1UXw4kCrg_yoW8WF4fp3
 WfuF1ftF48GrsrJr9ag34aqFn0qr4fKr17Wa129ry8Crsxtr1kZF1vqwnIkF9rXw1rGrW0
 vrn5Cw1j9F45Z37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
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
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On 06/29/2021 02:40 AM, Philippe Mathieu-Daudé wrote:
> On 6/28/21 2:04 PM, Song Gao wrote:
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
>> +    https://github.com/loongson/LoongArch-Documentation/releases/download/LoongArch-Vol1-v3/LoongArch-Vol1-v1.00-EN.pdf
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
> No qemu/ prefix.
> OK, We'll do it. 

thanks


