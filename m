Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7216425AF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 10:22:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p27e6-0001PS-5s; Mon, 05 Dec 2022 04:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p27dv-0001PC-0c
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:20:07 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p27ds-0007Ax-2W
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 04:20:06 -0500
Received: from loongson.cn (unknown [123.123.223.32])
 by gateway (Coremail) with SMTP id _____8AxDOu2t41jgD0DAA--.7469S3;
 Mon, 05 Dec 2022 17:19:51 +0800 (CST)
Received: from [192.168.199.220] (unknown [123.123.223.32])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx_1e0t41jPd0lAA--.27793S3; 
 Mon, 05 Dec 2022 17:19:48 +0800 (CST)
Message-ID: <72f22429-d51c-b2b8-49c6-59ba7df17ea7@loongson.cn>
Date: Mon, 5 Dec 2022 17:19:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PULL for 7.2-rc4 0/1] loongarch for 7.2-rc4 patch
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221202102550.4107344-1-gaosong@loongson.cn>
 <6fe3e752-a39d-38f9-e573-437547d19179@linaro.org>
From: "gaosong@loongson.cn" <gaosong@loongson.cn>
In-Reply-To: <6fe3e752-a39d-38f9-e573-437547d19179@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_1e0t41jPd0lAA--.27793S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ww4xAF1UCr17GryDArW5ZFb_yoW8GFyxpr
 93CFy3Cr18Grn7Jr13J34DJrW5tr1xJw17XF17tFy8GF4UAr1jqr1rXr1vgryUt3y8Gr10
 qr1rKw1UWF45Jr7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
 e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
 0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
 aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
 xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
 xVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
 C2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_
 JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
 WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBI
 daVFxhVjvjDU0xZFpf9x07jjwZcUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.258,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2022/12/5 15:24, Philippe Mathieu-Daudé 写道:
> On 2/12/22 11:25, Song Gao wrote:
>> The following changes since commit 
>> c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
>>
>>    Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221202
>>
>> for you to fetch changes up to 14dccc8ea6ece7ee63273144fb55e4770a05e0fd:
>>
>>    hw/loongarch/virt: Add cfi01 pflash device (2022-12-02 18:03:05 
>> +0800)
>>
>> ----------------------------------------------------------------
>> pull for 7.2-rc4
>>
>> We need this patch.
>
> FTR this is not a security/regression fix, but a mere feature.
>
> Certainly not justified for a rc4 IMO.
>
We hope LoongArch 7.2 version support pflash,
otherwise the subsequent BIOS support pflash may qemu 7.2 does not support.

Thanks.
Song Gao
>> ----------------------------------------------------------------
>> Xiaojuan Yang (1):
>>        hw/loongarch/virt: Add cfi01 pflash device
>>
>>   hw/loongarch/Kconfig        |  1 +
>>   hw/loongarch/acpi-build.c   | 18 +++++++++++++
>>   hw/loongarch/virt.c         | 62 
>> +++++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/loongarch/virt.h |  5 ++++
>>   4 files changed, 86 insertions(+)
>>
>>


