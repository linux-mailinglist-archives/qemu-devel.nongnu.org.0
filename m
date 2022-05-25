Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABE553344C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 02:29:02 +0200 (CEST)
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntetZ-0001dO-7i
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 20:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ntes0-0000vb-VL
 for qemu-devel@nongnu.org; Tue, 24 May 2022 20:27:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35520 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nterx-0004XP-MP
 for qemu-devel@nongnu.org; Tue, 24 May 2022 20:27:24 -0400
Received: from [192.168.199.219] (unknown [114.250.136.244])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxn+bfd41itq4AAA--.5597S3;
 Wed, 25 May 2022 08:27:11 +0800 (CST)
Message-ID: <a55d4b74-163f-9643-f971-ba7e118312a7@loongson.cn>
Date: Wed, 25 May 2022 08:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 00/43] Add LoongArch softmmu support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
 <3fce1517-2d55-0bce-eb7b-1bfbdcc7af22@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
In-Reply-To: <3fce1517-2d55-0bce-eb7b-1bfbdcc7af22@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxn+bfd41itq4AAA--.5597S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFyfZry7urW3Jw47Xr1xAFb_yoW8XFWrpF
 Z3Aa9xtFs8Jw4vk3srKr90qF1Yyw1rGF93J3W5Ka40gF4UXF98Xr109FWvqas29w1rGFy7
 uFyFqw1fJ3W5J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVAFwVWDMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
 87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
 ZFpf9x0JU3DG5UUUUU=
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Richard

在 2022/5/25 6:32, Richard Henderson 写道:
> On 5/24/22 01:17, Xiaojuan Yang wrote:
>> Hi All,
>>
>> As this series only supports running binary files in ELF format, and
>> does not depend on BIOS and kernel file. so this series are changed 
>> from RFC to patch vX.
>>
>>
>> The manual:
>>    - 
>> https://github.com/loongson/LoongArch-Documentation/releases/tag/2022.03.17
>>
>> Old series:
>>    - 
>> https://patchew.org/QEMU/20220328125749.2918087-1-yangxiaojuan@loongson.cn/
>>    - 
>> https://patchew.org/QEMU/20220106094200.1801206-1-gaosong@loongson.cn/
>>
>> Need review patches:
>>    - 0034-hw-intc-Add-LoongArch-extioi-interrupt-controller-EI.patch
>>    - 0038-hw-loongarch-Add-LoongArch-ls7a-rtc-device-support.patch
>>
>> This patch need ACPI maintainers review:
>>    - 0040-hw-loongarch-Add-LoongArch-ls7a-acpi-device-support.patch
>>
>> Thanks.
>> Xiaojuan
>>
>> -----
>> v5:
>>    - Fixed loongarch extioi device emulation.
>>    - Fixed loongarch rtc device emulation.
>>    - Fixed 'make docker-test-build' error.
>
> I had been tempted to accept the patch set as is, and let subsequent 
> development happen on mainline, but this patch set does not compile, 
> with obvious syntax errors.
>
> When the syntax errors are fixed, it does not pass "make check".
>
> How can you have tested this?
>
It `s my mistake.  I just tested   `IMAGES='fedora-i386-cross'  make 
docker-test-build `,  I will correct it in v6.

Thanks.
Xiaojuan


