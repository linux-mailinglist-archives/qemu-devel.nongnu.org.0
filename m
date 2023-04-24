Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D306EC3BF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 04:43:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqm9o-0003DK-4F; Sun, 23 Apr 2023 22:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pqm9l-0003DB-7j
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 22:42:21 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pqm9i-0002zP-PA
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 22:42:20 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0Vgm1PXq_1682304126; 
Received: from 30.221.99.72(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vgm1PXq_1682304126) by smtp.aliyun-inc.com;
 Mon, 24 Apr 2023 10:42:07 +0800
Content-Type: multipart/alternative;
 boundary="------------bLBv7rCiaTqbkdyk231U5msr"
Message-ID: <2aad730d-b14e-80c6-4aa8-71eb652cb803@linux.alibaba.com>
Date: Mon, 24 Apr 2023 10:42:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/riscv/virt: Add a second UART for secure world
To: Yong Li <yong.li@intel.com>, qemu-devel@nongnu.org
References: <20230424010132.3334748-1-yong.li@intel.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230424010132.3334748-1-yong.li@intel.com>
Received-SPF: pass client-ip=115.124.30.133;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-133.freemail.mail.aliyun.com
X-Spam_score_int: -120
X-Spam_score: -12.1
X-Spam_bar: ------------
X-Spam_report: (-12.1 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
--------------bLBv7rCiaTqbkdyk231U5msr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/4/24 9:01, Yong Li wrote:
> The virt machine can have two UARTs and the second UART
> can be used when host secure-mode support is enabled.
>
> Signed-off-by: Yong Li<yong.li@intel.com>
> Cc: "Zhiwei Liu"<zhiwei_liu@linux.alibaba.com>

Should  cc other Maintainers and Reviewers. Get the list by running the 
script

./scripts/get_maintainer.pl yours.patch

> ---
>   hw/riscv/virt.c         | 4 ++++
>   include/hw/riscv/virt.h | 2 ++
>   2 files changed, 6 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b38b41e685..02475e1678 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
>       [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
>       [VIRT_UART0] =        { 0x10000000,         0x100 },
>       [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
> +    [VIRT_UART1] =        { 0x10002000,         0x100 },

Can we move it a position adjacent to the VIRT_UART0, such as 0x10000100?

Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
>       [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>       [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
> @@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
>       serial_mm_init(system_memory, memmap[VIRT_UART0].base,
>           0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
>           serial_hd(0), DEVICE_LITTLE_ENDIAN);
> +    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
> +        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
> +        serial_hd(1), DEVICE_LITTLE_ENDIAN);
>   
>       sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>           qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e5c474b26e..8d2f8f225d 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -74,6 +74,7 @@ enum {
>       VIRT_APLIC_S,
>       VIRT_UART0,
>       VIRT_VIRTIO,
> +    VIRT_UART1,
>       VIRT_FW_CFG,
>       VIRT_IMSIC_M,
>       VIRT_IMSIC_S,
> @@ -88,6 +89,7 @@ enum {
>   enum {
>       UART0_IRQ = 10,
>       RTC_IRQ = 11,
> +    UART1_IRQ = 12,
>       VIRTIO_IRQ = 1, /* 1 to 8 */
>       VIRTIO_COUNT = 8,
>       PCIE_IRQ = 0x20, /* 32 to 35 */
--------------bLBv7rCiaTqbkdyk231U5msr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/4/24 9:01, Yong Li wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230424010132.3334748-1-yong.li@intel.com">
      <pre class="moz-quote-pre" wrap="">The virt machine can have two UARTs and the second UART
can be used when host secure-mode support is enabled.

Signed-off-by: Yong Li <a class="moz-txt-link-rfc2396E" href="mailto:yong.li@intel.com">&lt;yong.li@intel.com&gt;</a>
Cc: "Zhiwei Liu" <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com">&lt;zhiwei_liu@linux.alibaba.com&gt;</a></pre>
    </blockquote>
    <p>Should  cc other Maintainers and Reviewers. Get the list by
      running the script</p>
    <p>./scripts/get_maintainer.pl yours.patch<br>
    </p>
    <blockquote type="cite"
      cite="mid:20230424010132.3334748-1-yong.li@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 hw/riscv/virt.c         | 4 ++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b38b41e685..02475e1678 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =        { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
+    [VIRT_UART1] =        { 0x10002000,         0x100 },</pre>
    </blockquote>
    <p>Can we move it a position adjacent to the VIRT_UART0, such as
      0x10000100<span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">?
</span></p>
    <p>Otherwise,</p>
    <p>Reviewed-by: LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com">&lt;zhiwei_liu@linux.alibaba.com&gt;</a></p>
    <p>Zhiwei</p>
    <p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></p>
    <p><span style="color: rgb(51, 51, 51); font-family: PingFangSC-Regular; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></p>
    <blockquote type="cite"
      cite="mid:20230424010132.3334748-1-yong.li@intel.com">
      <pre class="moz-quote-pre" wrap="">
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
@@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
+        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
+        serial_hd(1), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
         qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..8d2f8f225d 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -74,6 +74,7 @@ enum {
     VIRT_APLIC_S,
     VIRT_UART0,
     VIRT_VIRTIO,
+    VIRT_UART1,
     VIRT_FW_CFG,
     VIRT_IMSIC_M,
     VIRT_IMSIC_S,
@@ -88,6 +89,7 @@ enum {
 enum {
     UART0_IRQ = 10,
     RTC_IRQ = 11,
+    UART1_IRQ = 12,
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
</pre>
    </blockquote>
  </body>
</html>

--------------bLBv7rCiaTqbkdyk231U5msr--

