Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C63158A626
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 08:52:42 +0200 (CEST)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJrCK-00014O-Hd
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 02:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJr87-0007eh-Oj
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 02:48:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44700 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJr7u-0007VR-Lh
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 02:48:11 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxsM8UvexidI8HAA--.27482S3; 
 Fri, 05 Aug 2022 14:47:58 +0800 (CST)
Subject: Re: [PATCH] target/loongarch: Fix macros SET_FPU_* in cpu.h
To: Qi Hu <huqi@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20220804132450.314329-1-huqi@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <21883abd-b037-04a6-88a7-5fdf58f1b86e@loongson.cn>
Date: Fri, 5 Aug 2022 14:47:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220804132450.314329-1-huqi@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9BxsM8UvexidI8HAA--.27482S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy5Cr4rKFyDZF1rJFW7CFg_yoW8XFyDpr
 s7CF1rtw4FyF4Ikw1fAayYywnxXrWIkws7WFn7G3y7G3ZxWa4kuryFg3WIqryUXw1fJFW8
 Xr1UZ34rKFs8CrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
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

Cc: Richard

Apply to 7.1?

On 2022/8/4 下午9:24, Qi Hu wrote:
> The macros SET_FPU_* are used to set corresponding bits of fcsr.
> Unfortunately it forgets to set the result and it causes fcsr's
> "CAUSE" never being updated. This patch is to fix this bug.
>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>   target/loongarch/cpu.h | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)

Reviewed-by:  Song Gao <gaosong@loongson.cn>

> diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
> index a36349df83..dce999aaac 100644
> --- a/target/loongarch/cpu.h
> +++ b/target/loongarch/cpu.h
> @@ -47,11 +47,23 @@ FIELD(FCSR0, FLAGS, 16, 5)
>   FIELD(FCSR0, CAUSE, 24, 5)
>   
>   #define GET_FP_CAUSE(REG)      FIELD_EX32(REG, FCSR0, CAUSE)
> -#define SET_FP_CAUSE(REG, V)   FIELD_DP32(REG, FCSR0, CAUSE, V)
> +#define SET_FP_CAUSE(REG, V) \
> +    do { \
> +        (REG) = FIELD_DP32(REG, FCSR0, CAUSE, V); \
> +    } while (0)
> +
>   #define GET_FP_ENABLES(REG)    FIELD_EX32(REG, FCSR0, ENABLES)
> -#define SET_FP_ENABLES(REG, V) FIELD_DP32(REG, FCSR0, ENABLES, V)
> +#define SET_FP_ENABLES(REG, V) \
> +    do { \
> +        (REG) = FIELD_DP32(REG, FCSR0, ENABLES, V); \
> +    } while (0)
> +
>   #define GET_FP_FLAGS(REG)      FIELD_EX32(REG, FCSR0, FLAGS)
> -#define SET_FP_FLAGS(REG, V)   FIELD_DP32(REG, FCSR0, FLAGS, V)
> +#define SET_FP_FLAGS(REG, V) \
> +    do { \
> +        (REG) = FIELD_DP32(REG, FCSR0, FLAGS, V); \
> +    } while (0)
> +
>   #define UPDATE_FP_FLAGS(REG, V) \
>       do { \
>           (REG) |= FIELD_DP32(0, FCSR0, FLAGS, V); \


