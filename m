Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B9162EBE4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovr24-0005l7-O7; Thu, 17 Nov 2022 21:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1ovr22-0005jd-Db
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:23:06 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1ovr1z-0002pW-GS
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:23:06 -0500
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8Dxfbd97HZjnH0IAA--.19011S3;
 Fri, 18 Nov 2022 10:22:53 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxFld87HZjo0cWAA--.40210S3; 
 Fri, 18 Nov 2022 10:22:52 +0800 (CST)
Subject: Re: [PATCH] hw/loongarch: Add cfi01 pflash device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221115115645.3372746-1-yangxiaojuan@loongson.cn>
 <2f381d06-842f-ac8b-085c-0419675a4872@linaro.org>
From: yangxiaojuan <yangxiaojuan@loongson.cn>
Message-ID: <0b8e14a9-fec5-7e82-0566-27af1ed85693@loongson.cn>
Date: Fri, 18 Nov 2022 10:22:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2f381d06-842f-ac8b-085c-0419675a4872@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------771D9A4AC2CAA123C332B6BD"
Content-Language: en-US
X-CM-TRANSID: AQAAf8BxFld87HZjo0cWAA--.40210S3
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXFW3Kw13Wr18Gr1fZFyUtrb_yoW5Gry7pF
 y8CFnYgrWkGFs7Gr13X3W3WFy5Jrs7G3W7Xr1xZFy8AF1UGr1vqry0vws0gFyUXrs5Jr1I
 qFyktr95u3W5X3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUb4AYFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJw
 A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l
 57IF6xkI12xvs2x26I8E6xACxx1lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14
 v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCjr7xvwVCIw2I0I7xG
 6c02F41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7IU1Au4UUUUUU==
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------771D9A4AC2CAA123C332B6BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/11/15 下午8:10, Philippe Mathieu-Daudé 写道:
> On 15/11/22 12:56, Xiaojuan Yang wrote:
>> Add cfi01 pflash device for LoongArch virt machine
>
> So the subject prefix should be "hw/loongarch/virt:".
>
>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>> ---
>>   hw/loongarch/Kconfig        |   1 +
>>   hw/loongarch/acpi-build.c   |  39 +++++++++++
>>   hw/loongarch/virt.c         | 130 +++++++++++++++++++++++++++++++++---
>>   include/hw/loongarch/virt.h |   7 ++
>>   4 files changed, 168 insertions(+), 9 deletions(-)
>
>>   static bool memhp_type_supported(DeviceState *dev)
>> diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
>> index 45c383f5a7..4ec4a7b4fe 100644
>> --- a/include/hw/loongarch/virt.h
>> +++ b/include/hw/loongarch/virt.h
>> @@ -12,6 +12,7 @@
>>   #include "hw/boards.h"
>>   #include "qemu/queue.h"
>>   #include "hw/intc/loongarch_ipi.h"
>> +#include "hw/block/flash.h"
>>     #define LOONGARCH_MAX_VCPUS     4
>>   @@ -20,6 +21,11 @@
>>   #define VIRT_FWCFG_BASE         0x1e020000UL
>>   #define VIRT_BIOS_BASE          0x1c000000UL
>>   #define VIRT_BIOS_SIZE          (4 * MiB)
>> +#define VIRT_FLASH_SECTOR_SIZE  (128 * KiB)
>> +#define VIRT_FLASH0_BASE        VIRT_BIOS_BASE
>> +#define VIRT_FLASH0_SIZE        (4 * MiB)
>> +#define VIRT_FLASH1_BASE        (VIRT_FLASH0_BASE + VIRT_FLASH0_SIZE)
>> +#define VIRT_FLASH1_SIZE        (4 * MiB)
>>     #define VIRT_LOWMEM_BASE        0
>>   #define VIRT_LOWMEM_SIZE        0x10000000
>> @@ -48,6 +54,7 @@ struct LoongArchMachineState {
>>       int          fdt_size;
>>       DeviceState *platform_bus_dev;
>>       PCIBus       *pci_bus;
>> +    PFlashCFI01  *flash[2];
>>   };
>
> Since you are starting a virtual machine from scratch, you should take
> the opportunity to learn from other early mistakes. X86 ended that way
> due to 1/ old firmwares back-compability and 2/ QEMU pflash block
> protections not being implemented. IIUC if we were starting with a
> UEFI firmware today, the layout design (still using QEMU) would be
> to map the CODE area in a dumb ROM device, and the VARSTORE area
> in a PFlash device. Since Virt machines don't need to use Capsule
> update, having the CODE area in ROM drastically simplifies the design
> and maintainance.
>
Thanks, we will  use only one pflash to save the VARS.bin, and use -bios 
to load the CODE.bin.

Thanks.
XiaoJuan

--------------771D9A4AC2CAA123C332B6BD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/11/15 下午8:10, Philippe
      Mathieu-Daudé 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2f381d06-842f-ac8b-085c-0419675a4872@linaro.org">On
      15/11/22 12:56, Xiaojuan Yang wrote:
      <br>
      <blockquote type="cite">Add cfi01 pflash device for LoongArch virt
        machine
        <br>
      </blockquote>
      <br>
      So the subject prefix should be "hw/loongarch/virt:".
      <br>
      <br>
      <blockquote type="cite">Signed-off-by: Xiaojuan Yang
        <a class="moz-txt-link-rfc2396E" href="mailto:yangxiaojuan@loongson.cn">&lt;yangxiaojuan@loongson.cn&gt;</a>
        <br>
        ---
        <br>
          hw/loongarch/Kconfig        |   1 +
        <br>
          hw/loongarch/acpi-build.c   |  39 +++++++++++
        <br>
          hw/loongarch/virt.c         | 130
        +++++++++++++++++++++++++++++++++---
        <br>
          include/hw/loongarch/virt.h |   7 ++
        <br>
          4 files changed, 168 insertions(+), 9 deletions(-)
        <br>
      </blockquote>
      <br>
      <blockquote type="cite">  static bool
        memhp_type_supported(DeviceState *dev)
        <br>
        diff --git a/include/hw/loongarch/virt.h
        b/include/hw/loongarch/virt.h
        <br>
        index 45c383f5a7..4ec4a7b4fe 100644
        <br>
        --- a/include/hw/loongarch/virt.h
        <br>
        +++ b/include/hw/loongarch/virt.h
        <br>
        @@ -12,6 +12,7 @@
        <br>
          #include "hw/boards.h"
        <br>
          #include "qemu/queue.h"
        <br>
          #include "hw/intc/loongarch_ipi.h"
        <br>
        +#include "hw/block/flash.h"
        <br>
            #define LOONGARCH_MAX_VCPUS     4
        <br>
          @@ -20,6 +21,11 @@
        <br>
          #define VIRT_FWCFG_BASE         0x1e020000UL
        <br>
          #define VIRT_BIOS_BASE          0x1c000000UL
        <br>
          #define VIRT_BIOS_SIZE          (4 * MiB)
        <br>
        +#define VIRT_FLASH_SECTOR_SIZE  (128 * KiB)
        <br>
        +#define VIRT_FLASH0_BASE        VIRT_BIOS_BASE
        <br>
        +#define VIRT_FLASH0_SIZE        (4 * MiB)
        <br>
        +#define VIRT_FLASH1_BASE        (VIRT_FLASH0_BASE +
        VIRT_FLASH0_SIZE)
        <br>
        +#define VIRT_FLASH1_SIZE        (4 * MiB)
        <br>
            #define VIRT_LOWMEM_BASE        0
        <br>
          #define VIRT_LOWMEM_SIZE        0x10000000
        <br>
        @@ -48,6 +54,7 @@ struct LoongArchMachineState {
        <br>
              int          fdt_size;
        <br>
              DeviceState *platform_bus_dev;
        <br>
              PCIBus       *pci_bus;
        <br>
        +    PFlashCFI01  *flash[2];
        <br>
          };
        <br>
      </blockquote>
      <br>
      Since you are starting a virtual machine from scratch, you should
      take
      <br>
      the opportunity to learn from other early mistakes. X86 ended that
      way
      <br>
      due to 1/ old firmwares back-compability and 2/ QEMU pflash block
      <br>
      protections not being implemented. IIUC if we were starting with a
      <br>
      UEFI firmware today, the layout design (still using QEMU) would be
      <br>
      to map the CODE area in a dumb ROM device, and the VARSTORE area
      <br>
      in a PFlash device. Since Virt machines don't need to use Capsule
      <br>
      update, having the CODE area in ROM drastically simplifies the
      design
      <br>
      and maintainance.
      <br>
      <br>
    </blockquote>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Thanks, we will  use only one pflash to
      save the VARS.bin, and use -bios to load the CODE.bin. </span><br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;"></span><br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">Thanks.</span><br>
    <span style="color: rgb(0, 0, 0); font-family: SimSun; font-size:
      14px; font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-weight: 400; letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      text-decoration-thickness: initial; text-decoration-style:
      initial; text-decoration-color: initial; display: inline
      !important; float: none;">XiaoJuan</span>
  </body>
</html>

--------------771D9A4AC2CAA123C332B6BD--


