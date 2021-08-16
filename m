Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD763ED1B6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 12:12:40 +0200 (CEST)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZbj-00088K-Ku
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 06:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFZad-0007I8-AZ; Mon, 16 Aug 2021 06:11:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFZab-0008G3-Gh; Mon, 16 Aug 2021 06:11:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f5so22709396wrm.13;
 Mon, 16 Aug 2021 03:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zmK/0INcZ4OYGl5/kL8qk5Ju1gDY98mxowwjAiORDZk=;
 b=mugKs2J3KtvC7h28RN+yyZcyMd5W8LP8nvi6oSIz3OqQf6x2m5BB5exBV8X5IqDsoF
 uGEsNbB2WPTE+437JYAjTysH2oOrH5XZSV9OjcX/KknfopDMhVAJsfWe7LFGxmxQyHQL
 qmcylHVGYkCBRsBkAr6AtjI0fjbniYNoADPveWHcmj/Pl8tu2oUcSzpC3TdZQltZ+WTZ
 LXLVNqiV5Oqz2BMfLSaZgDSVTNSZoS9T3oeS/Nlmy0ifJlnbr8enc44T/mhMIwjyeFvz
 GJ6T4qk6doKFMW+zAGEH1htfv6DwIDlbm87w0sDVqQ4aapmSKLUafardxDdtO1XjAaDv
 ZZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zmK/0INcZ4OYGl5/kL8qk5Ju1gDY98mxowwjAiORDZk=;
 b=bQ9iJELyaDhZqJtkkslZ+v7YaGLdF0Wg4T3IEEfk2AvHWy20rY7ocj/mPfCIJrs9iE
 FEBnN2fF1hZw0FIYyM6mCRsqDNj4ySY6yd90akI0YfotI+GxFqpinp9q26WRNfHPEcsk
 MFzBMHQhnL4TU13GV1R87d5b1M/SYUulCAoqi2xCGpLe0Nt4LJtAQaN5LrFjvCFHDYoq
 LTbsFppQWLM1oD/Ytm22flU17REwlPg0RR3n+7ALoL6kMPdpp4jjrbvmV+6RzQ9W5x+w
 vBjF+PlBYYpUDmN8NMX7uR8LXs0/nxRwbyH9ZIXf9rHmuutWn4qdLxw+JhXOdk7lP82L
 TJMw==
X-Gm-Message-State: AOAM532ky3Yt9BOI9VYyxr+qWYesfIZiuRbA1rbN4GKq+5wPZ5+G9r5l
 TS/VGVIH5mb9LY0ycICOtJQ=
X-Google-Smtp-Source: ABdhPJzwC1DAFuUUspqFpj5H7jYSXEl5OvIhdNOdyYbXHRNz8jlMcMY7tdG0WMpZZWqBNtN/RjfTJQ==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr18328659wrr.28.1629108686950; 
 Mon, 16 Aug 2021 03:11:26 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n3sm10674673wmi.0.2021.08.16.03.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 03:11:26 -0700 (PDT)
Subject: Re: [PATCH] hw: ppc: sam460ex: Disable Ethernet devicetree nodes
To: David Gibson <david@gibson.dropbear.id.au>,
 Guenter Roeck <linux@roeck-us.net>
References: <20210816025915.213093-1-linux@roeck-us.net>
 <YRn6d/Vb10JTmZ18@yekko>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b94ce36e-218a-008f-0063-8b99c3e658ef@amsat.org>
Date: Mon, 16 Aug 2021 12:11:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRn6d/Vb10JTmZ18@yekko>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 7:41 AM, David Gibson wrote:
> On Sun, Aug 15, 2021 at 07:59:15PM -0700, Guenter Roeck wrote:
>> IBM EMAC Ethernet controllers are not emulated by qemu. If they are
>> enabled in devicetree files, they are instantiated in Linux but
>> obviously won't work. Disable associated devicetree nodes to prevent
>> unpredictable behavior.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> I'll wait for Zoltan's opinion on this, but this sort of thing is why
> I was always pretty dubious about qemu *loading* a dtb file, rather
> than generating a dt internally.

Hmm interesting point.

>> ---
>>  hw/ppc/sam460ex.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
>> index 0737234d66..feb356e625 100644
>> --- a/hw/ppc/sam460ex.c
>> +++ b/hw/ppc/sam460ex.c
>> @@ -194,6 +194,14 @@ static int sam460ex_load_device_tree(hwaddr addr,
>>          _FDT(fdt_nop_node(fdt, offset));
>>      }
>>  
>> +    /* Ethernet interfaces are not emulated */
>> +    offset = fdt_node_offset_by_compatible(fdt, -1, "ibm,emac-460ex");
>> +    while (offset >= 0) {
>> +        _FDT(fdt_setprop_string(fdt, offset, "status", "disabled"));
>> +        offset = fdt_node_offset_by_compatible(fdt, offset, "ibm,emac-460ex");
>> +    }

Oh, I didn't know about appending 'status=disabled'.

FWIW I'm carrying this patch to boot Linux on the raspi4
(but I prefer your way):

-- >8 --
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun Oct 18 22:39:19 2020 +0200

    hw/arm/raspi: Remove unsupported raspi4 peripherals from device tree

    Kludge when using Linux kernels to reach userland.
    No device in DT -> no hardware initialization.

    Linux 5.9 uses the RPI_FIRMWARE_GET_CLOCKS so we now need to
    implement that feature too. Look like a cat and mouse game...

    Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 6a793766840..93eb6591ee8 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -25,6 +25,7 @@
 #include "hw/arm/boot.h"
 #include "sysemu/sysemu.h"
 #include "qom/object.h"
+#include <libfdt.h>

 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for
ATAGS */
 #define MVBAR_ADDR      0x400 /* secure vectors */
@@ -200,6 +201,29 @@ static void reset_secondary(ARMCPU *cpu, const
struct arm_boot_info *info)
     cpu_set_pc(cs, info->smp_loader_start);
 }

+static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
+{
+    int offset;
+
+    offset = fdt_node_offset_by_compatible(fdt, -1, "brcm,genet-v5");
+    if (offset >= 0) {
+        /* FIXME we shouldn't nop the parent */
+        offset = fdt_parent_offset(fdt, offset);
+        if (offset >= 0) {
+            if (!fdt_nop_node(fdt, offset)) {
+                warn_report("dtc: bcm2838-genet removed!");
+            }
+        }
+    }
+
+    offset = fdt_node_offset_by_compatible(fdt, -1,
"brcm,avs-tmon-bcm2838");
+    if (offset >= 0) {
+        if (!fdt_nop_node(fdt, offset)) {
+            warn_report("dtc: bcm2838-tmon removed!");
+        }
+    }
+}
+
 static void setup_boot(MachineState *machine, RaspiProcessorId
processor_id,
                        size_t ram_size)
 {
@@ -234,6 +258,9 @@ static void setup_boot(MachineState *machine,
RaspiProcessorId processor_id,
         }
         s->binfo.secondary_cpu_reset_hook = reset_secondary;
     }
+    if (processor_id >= PROCESSOR_ID_BCM2838) {
+        s->binfo.modify_dtb = raspi4_modify_dtb;
+    }

     /* If the user specified a "firmware" image (e.g. UEFI), we bypass
      * the normal Linux boot process
---

