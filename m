Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F655C01B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:14:57 +0200 (CEST)
Received: from localhost ([::1]:34208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68FE-0003yh-Qd
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1o6876-00030k-9Q
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:06:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57872 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1o6872-0005tG-3j
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:06:32 -0400
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_0+S0rpinGFhAA--.7317S3;
 Tue, 28 Jun 2022 18:06:10 +0800 (CST)
Message-ID: <9fd7c47f-76bb-31ca-8bda-785134c0c767@loongson.cn>
Date: Tue, 28 Jun 2022 18:06:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Can legacy vga memory base address be defined different with
 architectures
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org
Cc: qemu-devel@nongnu.org
References: <dcca81c1-4675-edb9-a6f8-f97dc9860192@loongson.cn>
 <5c307343-49cc-a506-b960-315822ebf11b@linaro.org>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <5c307343-49cc-a506-b960-315822ebf11b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_0+S0rpinGFhAA--.7317S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr4DGw4rJw48ZF4fCFW7Arb_yoWxZwb_Z3
 9rCa1Dtr47ZFW2kayayr45Gry2g3ykAF12vF4agrs3GF4rA3Waq34Igrs8W34DWrWrKFn8
 Cr4vqa45ury3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxkYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
 02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v2
 6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
 PpnJUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
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



在 2022/6/28 16:21, Richard Henderson 写道:
> On 6/28/22 12:12, maobibo wrote:
>> Hi Philippe,
>>
>>      In file include/hw/pci/pci.h, the macro QEMU_PCI_VGA_MEM_BASE is defined as 0xa0000, which represents legacy VGA memory base address. I want to know whether it should be the same for all architectures, or does this vga mmio space exist on arm64/riscv physical machines with pci host bridges?
> 
> This is x86 only.

I see. On aarch64 virt platform, "virtio-gpu-pci" video card is used rather than "virtio-vga", there is no such legacy pci vga memory space with "virtio-gpu-pci" video card. I will check code, and thanks for your explanation. 

regards
bibo, mao 
> 
> 
> r~


