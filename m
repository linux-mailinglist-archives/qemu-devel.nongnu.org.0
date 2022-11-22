Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B4B633AC6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 12:09:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxR9Q-0005Tl-F3; Tue, 22 Nov 2022 06:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oxR9F-0005RK-K2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:09:06 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oxR97-0007u3-4D
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:08:59 -0500
Received: from loongson.cn (unknown [114.250.136.113])
 by gateway (Coremail) with SMTP id _____8AxTevGrXxjigMAAA--.42S3;
 Tue, 22 Nov 2022 19:08:54 +0800 (CST)
Received: from [192.168.199.220] (unknown [114.250.136.113])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxLuLGrXxjURgYAA--.63123S3; 
 Tue, 22 Nov 2022 19:08:54 +0800 (CST)
Message-ID: <dd9e2e6c-0d89-5d25-4f34-6d28d578bc7f@loongson.cn>
Date: Tue, 22 Nov 2022 19:08:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/loongarch: Fix setprop_sized method in fdt rtc node.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn
References: <20221116040300.3459818-1-yangxiaojuan@loongson.cn>
From: "gaosong@loongson.cn" <gaosong@loongson.cn>
In-Reply-To: <20221116040300.3459818-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxLuLGrXxjURgYAA--.63123S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7GF13Xr17AFy7uFyUJF1rCrg_yoWfuFX_uF
 42yw10gF4DJwn3WanIqry3trW7ta48JFn8C3Z3Wr4xZ3W5t3y5GF4aga1Uur1aqrWUZrZx
 C3y8WrWFyrs5WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
 xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
 47kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
 AFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
 6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
 xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04
 k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
 MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
 1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l
 IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8wNVDUUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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


在 2022/11/16 12:03, Xiaojuan Yang 写道:
> Fix setprop_sized method in fdt rtc node.
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index b9c18ee517..958be74fa1 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -53,7 +53,7 @@ static void fdt_add_rtc_node(LoongArchMachineState *lams)
>       nodename = g_strdup_printf("/rtc@%" PRIx64, base);
>       qemu_fdt_add_subnode(ms->fdt, nodename);
>       qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "loongson,ls7a-rtc");
> -    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 0x0, base, size);
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 2, base, 2, size);
>       g_free(nodename);
>   }
>   


