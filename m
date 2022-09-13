Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9414D5B6D66
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 14:37:48 +0200 (CEST)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY5Af-0003rh-JC
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 08:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oY55H-0007xo-Di
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 08:32:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36604 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oY55E-0003LI-KQ
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 08:32:11 -0400
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bx32s9eCBjESUYAA--.23021S3; 
 Tue, 13 Sep 2022 20:31:57 +0800 (CST)
Subject: Re: [PATCH v1 0/9] Fix bugs and improve functions for LoongArch
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, imammedo@redhat.com
References: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
From: gaosong <gaosong@loongson.cn>
Message-ID: <40e809bf-2f30-6780-7b9c-f53b698d0d4d@loongson.cn>
Date: Tue, 13 Sep 2022 20:31:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220908094623.73051-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf8Bx32s9eCBjESUYAA--.23021S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4ruF13uF1ftF4fGFWfZrb_yoW8WFyfpF
 W3Zr1ayr4rJrnFy3s3t3sI9rn5Arn7Cr17XFnrtry8CrW7AryFvFn2y3s8Za4UG34xJFWj
 vr1Fkw18WF4UZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 ACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE-syl
 42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.628, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


ÔÚ 2022/9/8 ÏÂÎç5:46, Xiaojuan Yang Ð´µÀ:
> These patches integrate all previous patches, including
> '[PATCH v1 0/2] Add mem hotplug and improve acpi dsdt (26 Aug )',
> '[PATCH v1] hw/loongarch: Fix acpi ged irq number in dsdt table (19
> Aug)',
> '[PATCH v1 0/6] Add funtions for LoongArch virt machine (11 Aug)'.
> As none of the patches has not been reviewed, so we integrate them for
> more convenient reviewing.
>
> Changes for v1:
> 1. Remove vga device when loongarch init
> 2. Support fw_cfg dma function
> 3. Add interrupt information to FDT table
> 4. Add platform bus support
> 5. Add hotplug handler for machine
> 6. Add RAMFB to dynamic_sysbus_devices list
> 7. Fix acpi ged irq number in dsdt table
> 8. Support memory hotplug
> 9. Improve acpi dsdt table
>
> Xiaojuan Yang (9):
>    hw/loongarch: Remove vga device when loongarch init
>    hw/loongarch: Support fw_cfg dma function
>    hw/loongarch: Add interrupt information to FDT table
>    hw/loongarch: Add platform bus support
>    hw/loongarch: Add hotplug handler for machine
>    hw/loongarch: Add RAMFB to dynamic_sysbus_devices list
>    hw/loongarch: Fix acpi ged irq number in dsdt table
>    hw/loongarch: Support memory hotplug
>    hw/loongarch: Improve acpi dsdt table
>
>   hw/loongarch/Kconfig        |   5 +-
>   hw/loongarch/acpi-build.c   | 191 ++++++++-------------------------
>   hw/loongarch/fw_cfg.c       |   3 +-
>   hw/loongarch/virt.c         | 205 +++++++++++++++++++++++++++++++++++-
>   include/hw/loongarch/virt.h |   2 +
>   include/hw/pci-host/ls7a.h  |   5 +
>   6 files changed, 259 insertions(+), 152 deletions(-)
>
This series.

Acked-by: Song Gao <gaosong@loongson.cn>

Thanks.
Song Gao


