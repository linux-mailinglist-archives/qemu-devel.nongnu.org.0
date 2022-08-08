Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74958BEAB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 03:24:59 +0200 (CEST)
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKrVq-0004mK-2U
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 21:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oKrUI-0003RJ-F7
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 21:23:22 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45810 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oKrUF-0005dd-UU
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 21:23:22 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxfyN0ZfBi5rYJAA--.3018S3;
 Mon, 08 Aug 2022 09:23:06 +0800 (CST)
Subject: Re: [PATCH] target/loongarch: Remove cpu_fcsr0
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Qi Hu <huqi@loongson.cn>, Feiyang Chen <chenfeiyang@loongson.cn>
References: <20220806170800.373219-1-richard.henderson@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <d64f8f83-465d-0ecc-b7c0-e00c1c75d1f4@loongson.cn>
Date: Mon, 8 Aug 2022 09:23:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220806170800.373219-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxfyN0ZfBi5rYJAA--.3018S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw17urW3Kr17tFWDZry5urg_yoWDWrbEgF
 yxtrykur4kuFW0ka4Fga95Ja4UGrW8Ca4Y9F1qgFWfG34SqFs8Jr4qva1kZanIvF4rXrsI
 yFZ7tFWfC34UZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm
 -wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
 3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
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


On 2022/8/7 上午1:08, Richard Henderson wrote:
> All of the fpu operations are defined with TCG_CALL_NO_WG, but they
> all modify FCSR0.  The most efficient way to fix this is to remove
> cpu_fcsr0, and instead use explicit load and store operations for the
> two instructions that manipulate that value.
>
> Cc: Qi Hu<huqi@loongson.cn>
> Cc: Song Gao<gaosong@loongson.cn>
> Reported-by: Feiyang Chen<chenfeiyang@loongson.cn>
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/loongarch/helper.h                    |  2 +-
>   target/loongarch/fpu_helper.c                |  4 +--
>   target/loongarch/translate.c                 |  3 --
>   tests/tcg/loongarch64/test_fcsr.c            | 15 +++++++++
>   target/loongarch/insn_trans/trans_fmov.c.inc | 33 ++++++++++----------
>   tests/tcg/loongarch64/Makefile.target        |  1 +
>   6 files changed, 36 insertions(+), 22 deletions(-)
>   create mode 100644 tests/tcg/loongarch64/test_fcsr.c
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao


