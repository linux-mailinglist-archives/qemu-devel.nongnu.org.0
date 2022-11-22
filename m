Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F5633AC4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 12:08:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxR7U-00041Y-Fx; Tue, 22 Nov 2022 06:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oxR7K-0003zf-Fe
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:07:07 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oxR7G-0006ad-9D
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 06:07:05 -0500
Received: from loongson.cn (unknown [114.250.136.113])
 by gateway (Coremail) with SMTP id _____8Dx9vBLrXxjbAMAAA--.92S3;
 Tue, 22 Nov 2022 19:06:51 +0800 (CST)
Received: from [192.168.199.220] (unknown [114.250.136.113])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxLuJJrXxjKxgYAA--.63119S3; 
 Tue, 22 Nov 2022 19:06:49 +0800 (CST)
Message-ID: <658e2368-ed78-fa01-6030-877883c7e93e@loongson.cn>
Date: Tue, 22 Nov 2022 19:06:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/loongarch: Add default stdout uart in fdt
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn
References: <20221115114923.3372414-1-yangxiaojuan@loongson.cn>
From: "gaosong@loongson.cn" <gaosong@loongson.cn>
In-Reply-To: <20221115114923.3372414-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxLuJJrXxjKxgYAA--.63119S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw1xCryUJFWDKF1kJr4fZrb_yoW8Jw1UpF
 WxCa1DWay8Xr1DurZ2g345ZF1fArnrury2qr47ur40kr9xX3s3Xr4Iv392yFy8Z34rJa4j
 vFs5Wryqg3WIgrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
 0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
 AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
 8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UWHqcUUUUU=
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


在 2022/11/15 19:49, Xiaojuan Yang 写道:
> Add "chosen" subnode into LoongArch fdt, and set it's
> "stdout-path" prop to uart node.
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/virt.c | 2 ++
>   1 file changed, 2 insertions(+)
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 5e4c2790bf..b59c07972a 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -69,6 +69,7 @@ static void fdt_add_uart_node(LoongArchMachineState *lams)
>       qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "ns16550a");
>       qemu_fdt_setprop_cells(ms->fdt, nodename, "reg", 0x0, base, 0x0, size);
>       qemu_fdt_setprop_cell(ms->fdt, nodename, "clock-frequency", 100000000);
> +    qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", nodename);
>       g_free(nodename);
>   }
>   
> @@ -87,6 +88,7 @@ static void create_fdt(LoongArchMachineState *lams)
>                               "linux,dummy-loongson3");
>       qemu_fdt_setprop_cell(ms->fdt, "/", "#address-cells", 0x2);
>       qemu_fdt_setprop_cell(ms->fdt, "/", "#size-cells", 0x2);
> +    qemu_fdt_add_subnode(ms->fdt, "/chosen");
>   }
>   
>   static void fdt_add_cpu_nodes(const LoongArchMachineState *lams)


