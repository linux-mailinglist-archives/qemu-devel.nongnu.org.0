Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F775E77AF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:54:20 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obfNz-0005oD-Jl
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1obf27-0008PU-Uu
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:31:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42798 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1obf25-00033y-GW
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 05:31:43 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxnmv0fC1jLZogAA--.42824S3; 
 Fri, 23 Sep 2022 17:31:32 +0800 (CST)
Subject: Re: [PATCH v1 1/3] hw/loongarch: Add memmap for LoongArch virt machine
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn
References: <20220923032907.1728700-1-yangxiaojuan@loongson.cn>
 <20220923032907.1728700-2-yangxiaojuan@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <88601911-01e5-dce4-c88b-2c57512ed40a@loongson.cn>
Date: Fri, 23 Sep 2022 17:31:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220923032907.1728700-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Bxnmv0fC1jLZogAA--.42824S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XF1ftw4UKFWkCF1fXw1kZrb_yoWftwb_Cr
 y8Gr93Kw4UJryUta4kAr48ZFyUua9ruw47Ka17Ca1fZ34xJr15Xw1jkw48X3Wfur1jvFn5
 A3WYqr1DAa95KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280
 aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07
 x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18
 McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7
 I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
 73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-1.893, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


ÔÚ 2022/9/23 ÉÏÎç11:29, Xiaojuan Yang Ð´µÀ:
> +#define VIRT_PCI_IO_OFFSET       0x4000
> +static MemMapEntry virt_memmap[] = {
> +    [VIRT_LOWDDR] =       {        0x0,    0x10000000 },
> +    [VIRT_PCH] =          { 0x10000000,        0x1000 },
> +    [VIRT_PM] =           { 0x10080000,         0x100 },
> +    [VIRT_RTC] =          { 0x100D0100,         0x100 },
> +    [VIRT_ACPI_GED] =     { 0x100E0000,         0x100 },
> +    [VIRT_ISA_IO] =       { 0x18000000,        0x4000 },
> +    [VIRT_PCI_IO] =       { 0x18004000,        0xC000 },
> +    [VIRT_BIOS]   =       { 0x1C000000,      0x400000 },
> +    [VIRT_FDT]    =       { 0x1C400000,      0x100000 },
> +    [VIRT_FW_CFG] =       { 0x1E020000,          0x18 },
> +    [VIRT_UART]   =       { 0x1FE001E0,         0x100 },
> +    [VIRT_PCI_CFG] =      { 0x20000000,     0x8000000 },
> +    [VIRT_MSI]     =      { 0x2FF00000,        0x1000 },
> +    [VIRT_PCI_MEM] =      { 0x40000000,    0x40000000 },
> +    [VIRT_HIGHDDR] =      { 0x90000000,           0x0 },
> +    [VIRT_PLATFORM_BUS] = { 0x16000000,     0x2000000 },
> +};
> +

put VIRT_PLATFORM_BUS after VIRT_ACPI_GED.

Otherwise.
Reviewed-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao


