Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C26F62A4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 03:28:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puNkr-0003Gd-Cd; Wed, 03 May 2023 21:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puNkl-0003GN-1W
 for qemu-devel@nongnu.org; Wed, 03 May 2023 21:27:30 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puNki-0000pK-Bh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 21:27:26 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8AxFunmCVNkIlgEAA--.7054S3;
 Thu, 04 May 2023 09:27:02 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxFLXjCVNksARJAA--.4441S3; 
 Thu, 04 May 2023 09:26:59 +0800 (CST)
Subject: Re: [RFC PATCH v4 00/44] Add LoongArch LSX instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <8a821169-6dc3-ab82-bd32-990b0f9a8c98@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <b6243a8d-8ef6-7609-b71c-fd3cddb69d67@loongson.cn>
Date: Thu, 4 May 2023 09:26:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8a821169-6dc3-ab82-bd32-990b0f9a8c98@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxFLXjCVNksARJAA--.4441S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ww4rJr45urWruw15WFW3KFg_yoW8Wry7pF
 Z29Fy5tFs3Cr95WrWxG3Z8Zr40yw13GasFqF1rGa4I9F45AF9Fqr40qw1jqF9xJw4xCrW2
 vF18tw1rZF43JrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1wL05UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.28,
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


在 2023/5/2 上午2:43, Richard Henderson 写道:
> On 4/25/23 08:02, Song Gao wrote:
>> Hi,
>>
>> This series adds LoongArch LSX instructions, Since the LoongArch
>> Vol2 is not open, So we use 'RFC' title.
>>
>> I'm not sure when the manual will be open.
>> After these patches are reviewed, how about merging them?
>>
>> About test:
>> V2 we use RISU test the LoongArch LSX instructions.
>>
>> QEMU:
>> https://github.com/loongson/qemu/tree/tcg-old-abi-support-lsx
>> RISU:
>>      https://github.com/loongson/risu/tree/loongarch-suport-lsx
>>
>> Build test:
>> make docker-test-build@fedora-i386-cross
>>
>> The following patches need to be reviewed:
>>    0001-target-loongarch-Add-LSX-data-type-VReg.patch
>>    0014-target-loongarch-Implement-vmul-vmuh-vmulw-ev-od.patch
>>    0030-target-loongarch-Implement-vpcnt.patch
>> 0034-target-loongarch-Implement-LSX-fpu-fcvt-instructions.patch
>>    0037-target-loongarch-Implement-vbitsel-vset.patch
>>    0041-target-loongarch-Implement-vld-vst.patch
>>
>> V4:
>>    - R-b and rebase;
>>    - Migrate the upper half lsx regs;
>>    - Remove tcg_gen_mulus2_*;
>>    - Vsetallnez use !do_match2;
>>    - Use tcg_gen_concat_i64_i128/tcg_gen_extr_i128_i64 to replace
>>      TCGV128_LOW(val)/TCGV128_High(val);
>
> One minor nit, everything reviewed!  Congratulations.
>
Thank you for your guidance and review.

Since all patches are reviewed, how about drop 'RFC' on v5?
I am  really not sure When the Vol2 will be open.

Thanks.
Song Gao


