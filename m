Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8D269C2C8
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 22:56:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTrdq-00059u-4D; Sun, 19 Feb 2023 16:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pTrdo-00059Q-Sp
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 16:54:40 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pTrdm-0001In-UF
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 16:54:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bp28so1101867wrb.2
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 13:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oFkFr02y53GCIRULW9tdmuEmyYEVbr3sCsiAjw0Qtv8=;
 b=eLh0L4VT2IDp6pdhtD2r+IkhvIpVdHmJI9+i+3bhHd4C9xMsNAj1SjElpMfcwaqv1D
 7ARrPS2eqtJZ6TRWzoXqilM0xE2aSYLwSMQnNy3dyBX9GMFs0nn0fK75yyxnQZcIWlkE
 XxnHBmp4jXlzUelggBf71X7Cm1lnoLeSRXEsufmvlQQvtfEEKI5WTo1dAgLRBURVNfaC
 /aEW6vS7rKRUOM8rWY6HzPnLIjZ5ypjMwYFiLbsYmYK+ydLRB6vb8fKHlqpvanL+y+Z1
 S5MDH1KBnrk/DrqenDYRdzUOsP08axdKDuBaRaTrOlE/IG9eqTD3fi1WE8usJ3fcMnly
 V8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oFkFr02y53GCIRULW9tdmuEmyYEVbr3sCsiAjw0Qtv8=;
 b=MNxeJrLnJAJRVCUsIjuhTgzlY55I88NEbkf8zKBZvNvbGsQNw4YZbfo0VdyOyTFYFy
 v5bTS3mPSeP1jVCseie6gOiJlKmqGULUyrEzBD1bo8iUL/nIBsVWn4pzBt0zs0Z6UIxk
 dw3roYevlJZbND7U7ED1cJ2RSL1ziweNx6SUxkdJSCS/szj9DAqo3+Z1EdSYnQcZBKwz
 YXl0BCrMVq1vYWhs/+FFWRAauWd3/T2ZFFLWaYstS4lurFxyan0KtwO2pTLFz32+wNxB
 qPOLY99SD1mly0izuRzVGOweyL83HkHKond45KaC93RTNXsBSOOI4h+c9K7KjeAWgYnR
 Gmng==
X-Gm-Message-State: AO0yUKVPemS5qUb+qAlSWPyO+MVo1NNwGFntzXTo0h6eL/eDEpX9kJ8U
 6ypvL9GmEN+R7nBRwnRfFFcVFA==
X-Google-Smtp-Source: AK7set/UbrfZdqatBRM0uwMJC5eRVSH5ozvdOuCv+dN/sgsie+RkrOk5RKDDJwtSg6coFS5NUjKYPA==
X-Received: by 2002:adf:f147:0:b0:2c5:c4c9:515a with SMTP id
 y7-20020adff147000000b002c5c4c9515amr742902wro.51.1676843677198; 
 Sun, 19 Feb 2023 13:54:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e29-20020a5d595d000000b002c558869934sm4438835wri.81.2023.02.19.13.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 13:54:36 -0800 (PST)
Message-ID: <666316cf-6f1e-8f62-dab7-8b0da698faa7@linaro.org>
Date: Sun, 19 Feb 2023 22:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/18] hw/ide/piix: Ensure IDE output IRQs are wired at
 realization
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Bernhard Beschow <shentey@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "reviewer:Incompatible changes"
 <libvir-list@redhat.com>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-8-philmd@linaro.org>
 <CAG4p6K6zMEMT07qDzPyEgc1F+FPp-AHyhgZWRhYAaJsfOUZD=g@mail.gmail.com>
 <0350214d-fd70-4d24-8db8-66185f5d6780@linaro.org>
Content-Language: en-US
In-Reply-To: <0350214d-fd70-4d24-8db8-66185f5d6780@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

+Daniel, Igor, Marcel & libvirt

On 16/2/23 16:33, Philippe Mathieu-Daudé wrote:
> On 16/2/23 15:43, Bernhard Beschow wrote:
>>
>>
>> On Wed, Feb 15, 2023 at 5:20 PM Philippe Mathieu-Daudé 
>> <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
>>
>>     Ensure both IDE output IRQ lines are wired.
>>
>>     We can remove the last use of isa_get_irq(NULL).
>>
>>     Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org
>>     <mailto:philmd@linaro.org>>
>>     ---
>>       hw/ide/piix.c | 13 ++++++++-----
>>       1 file changed, 8 insertions(+), 5 deletions(-)
>>
>>     diff --git a/hw/ide/piix.c b/hw/ide/piix.c
>>     index 9d876dd4a7..b75a4ddcca 100644
>>     --- a/hw/ide/piix.c
>>     +++ b/hw/ide/piix.c
>>     @@ -133,14 +133,17 @@ static bool pci_piix_init_bus(PCIIDEState *d,
>>     unsigned i, Error **errp)
>>           static const struct {
>>               int iobase;
>>               int iobase2;
>>     -        int isairq;
>>           } port_info[] = {
>>     -        {0x1f0, 0x3f6, 14},
>>     -        {0x170, 0x376, 15},
>>     +        {0x1f0, 0x3f6},
>>     +        {0x170, 0x376},
>>           };
>>           int ret;
>>
>>     -    qemu_irq irq_out = d->irq[i] ? : isa_get_irq(NULL,
>>     port_info[i].isairq);
>>     +    if (!d->irq[i]) {
>>     +        error_setg(errp, "output IDE IRQ %u not connected", i);
>>     +        return false;
>>     +    }
>>     +
>>           ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
>>           ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
>>                                 port_info[i].iobase2);
>>     @@ -149,7 +152,7 @@ static bool pci_piix_init_bus(PCIIDEState *d,
>>     unsigned i, Error **errp)
>>                                object_get_typename(OBJECT(d)), i);
>>               return false;
>>           }
>>     -    ide_bus_init_output_irq(&d->bus[i], irq_out);
>>     +    ide_bus_init_output_irq(&d->bus[i], d->irq[i]);
>>
>>           bmdma_init(&d->bus[i], &d->bmdma[i], d);
>>           d->bmdma[i].bus = &d->bus[i];
>>     --     2.38.1
>>
>>
>> This now breaks user-created  piix3-ide:
>>
>>    qemu-system-x86_64 -M q35 -device piix3-ide
>>
>> Results in:
>>
>>    qemu-system-x86_64: -device piix3-ide: output IDE IRQ 0 not connected
> 
> Thank you for this real-life-impossible-but-exists-in-QEMU test-case!

Do we really want to maintain this Frankenstein use case?

1/ Q35 comes with a PCIe bus on which sits a ICH chipset, which already
    contains a AHCI function exposing multiple IDE buses.
    What is the point on using an older tech?

2/ Why can we plug a PCI function on a PCIe bridge without using a
    pcie-pci-bridge?

3/ Chipsets come as a whole. Software drivers might expect all PCI
    functions working (Linux considering each function individually
    is not the norm)


I get your use case working with the following diff [*]:

-- >8 --
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 74e2f4288d..cb1628963a 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -140,8 +140,19 @@ static bool pci_piix_init_bus(PCIIDEState *d, 
unsigned i, Error **errp)
      };

      if (!d->irq[i]) {
-        error_setg(errp, "output IDE IRQ %u not connected", i);
-        return false;
+        if (DEVICE_GET_CLASS(d)->user_creatable) {
+            /* Returns NULL unless there is exactly one ISA bus */
+            Object *isabus = object_resolve_path_type("", TYPE_ISA_BUS, 
NULL);
+
+            if (!isabus) {
+                error_setg(errp, "Unable to find a single ISA bus");
+                return false;
+            }
+            d->irq[i] = isa_bus_get_irq(ISA_BUS(isabus), 14 + i);
+        } else {
+            error_setg(errp, "output IDE IRQ %u not connected", i);
+            return false;
+        }
      }

      ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
@@ -201,6 +212,13 @@ static void piix3_ide_class_init(ObjectClass 
*klass, void *data)
      k->class_id = PCI_CLASS_STORAGE_IDE;
      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
      dc->hotpluggable = false;
+    /*
+     * This function is part of a Super I/O chip and shouldn't be user
+     * creatable. However QEMU accepts impossible hardware setups such
+     * plugging a PIIX IDE function on a ICH ISA bridge.
+     * Keep this Frankenstein (ab)use working.
+     */
+    dc->user_creatable = true;
  }

  static const TypeInfo piix3_ide_info = {
@@ -224,6 +242,8 @@ static void piix4_ide_class_init(ObjectClass *klass, 
void *data)
      k->class_id = PCI_CLASS_STORAGE_IDE;
      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
      dc->hotpluggable = false;
+    /* Reason: Part of a Super I/O chip */
+    dc->user_creatable = false;
  }
---

But the hardware really looks Frankenstein now:

(qemu) info qom-tree
/machine (pc-q35-8.0-machine)
   /peripheral-anon (container)
     /device[0] (piix3-ide)
       /bmdma[0] (memory-region)
       /bmdma[1] (memory-region)
       /bus master container[0] (memory-region)
       /bus master[0] (memory-region)
       /ide.6 (IDE)
       /ide.7 (IDE)
       /ide[0] (memory-region)
       /ide[1] (memory-region)
       /ide[2] (memory-region)
       /ide[3] (memory-region)
       /piix-bmdma-container[0] (memory-region)
       /piix-bmdma[0] (memory-region)
       /piix-bmdma[1] (memory-region)
   /q35 (q35-pcihost)
   /unattached (container)
     /device[17] (ich9-ahci)
       /ahci-idp[0] (memory-region)
       /ahci[0] (memory-region)
       /bus master container[0] (memory-region)
       /bus master[0] (memory-region)
       /ide.0 (IDE)
       /ide.1 (IDE)
       /ide.2 (IDE)
       /ide.3 (IDE)
       /ide.4 (IDE)
       /ide.5 (IDE)
     /device[2] (ICH9-LPC)
       /bus master container[0] (memory-region)
       /bus master[0] (memory-region)
       /ich9-pm[0] (memory-region)
       /isa.0 (ISA)

I guess the diff [*] is acceptable as a kludge, but we might consider
deprecating such use.

Paolo, Michael & libvirt folks, what do you think?

Regards,

Phil.

