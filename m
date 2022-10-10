Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DEF5F9BCB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:23:47 +0200 (CEST)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohp0k-0006ml-3B
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1ohopp-0004Ow-0g
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:12:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47604 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1ohopl-00015N-7r
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:12:27 -0400
Received: from [192.168.124.2] (unknown [36.5.191.229])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxTWvy4UNjMfkpAA--.24681S3; 
 Mon, 10 Oct 2022 17:12:19 +0800 (CST)
Message-ID: <3bf46f47-f0c9-64d9-7e61-cb8ac520ce1a@loongson.cn>
Date: Mon, 10 Oct 2022 17:12:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 0/2] Add memmap and fix bugs for LoongArch
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, f4bug@amsat.org, peter.maydell@linaro.org
References: <20220930095139.867115-1-yangxiaojuan@loongson.cn>
From: gaosong <gaosong@loongson.cn>
In-Reply-To: <20220930095139.867115-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxTWvy4UNjMfkpAA--.24681S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr47GF17Wr1DXFWDXF1DKFg_yoW8Ww4rpr
 Wa9FZ3Kr4UJrZaqFn3Ka45WF98Zws7Ja48Xa43K34v9F4Duryjqry0gryrZa4UW3s3Ja42
 qwnYy34DC3W5ZrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
 JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_
 GFWl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUOOzVUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.934,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/9/30 17:51, Xiaojuan Yang 写道:
> This series add memmap table and fix extioi, ipi device
> emulation for LoongArch virt machine.
>
> Changes for v4:
> Add 'reviewed-by' tag in fixing ipi patch, and other changes
> are the same as v3.
> 1. Remove the memmap table patch in this series, it
>     will apply until we have more than one machinestate.
> 2. Using MemTxAttrs' requester_type and requester_id
>     to get current cpu index in loongarch extioi regs
>     emulation.
>     This patch based on:
>     20220927141504.3886314-1-alex.bennee@linaro.org
> 3. Rewrite the commit message of fixing ipi patch, and
>     add reviewed by tag in the patch.
>
> Changes for v3:
> 1. Remove the memmap table patch in this series, it
>     will apply until we have more than one machinestate.
> 2. Using MemTxAttrs' requester_type and requester_id
>     to get current cpu index in loongarch extioi regs
>     emulation.
>     This patch based on:
>     20220927141504.3886314-1-alex.bennee@linaro.org
> 3. Rewrite the commit message of fixing ipi patch, and
>     this patch has been reviewed.
>
> Changes for v2:
> 1. Adjust the position of 'PLATFORM' element in memmap table
>
> Changes for v1:
> 1. Add memmap table for LoongArch virt machine
> 2. Fix LoongArch extioi function
> 3. Fix LoongArch ipi device emulation
>
> Xiaojuan Yang (2):
>    hw/intc: Fix LoongArch extioi function
>    hw/intc: Fix LoongArch ipi device emulation
>
>   hw/intc/loongarch_extioi.c      | 51 +++++++++++++++++++--------------
>   hw/intc/loongarch_ipi.c         |  1 -
>   hw/intc/trace-events            |  2 +-
>   target/loongarch/iocsr_helper.c | 16 +++++------
>   4 files changed, 38 insertions(+), 32 deletions(-)
Applied to loongarch-next.

Thanks.
Song Gao


