Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE644B945D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 00:15:21 +0100 (CET)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKTW4-0007vg-5H
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 18:15:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKTUI-000742-OA
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:13:30 -0500
Received: from [2607:f8b0:4864:20::432] (port=39615
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKTUG-0007mS-RK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 18:13:30 -0500
Received: by mail-pf1-x432.google.com with SMTP id m22so3449073pfk.6
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 15:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d1S6fPeIqaAQRMYlwl2pKw7Am66k2GXvx1Ix04Ho/cQ=;
 b=GyT0qP1rC62C6X5zl0CF2miwNrBleNih2iDSGaN5d4OKWvuY9KoA37EyMkTrq7WUgC
 ZPEkHz7immvA6GLxa33uOa78jbjOK1OI2LMJL6iVfWXLbs81w7SiJE0YDKebDxAx5tuK
 7obeBWpoHS88GhkY3OhCLefNJ6FYOeMYVOaPeM3LJn3Uzbi0sHgsgUuooWLic2dujgb4
 9vkCsANu2ZOicMTgbp41IslV30YfyHLxme7+mxUjHzX8KsNaj9KlTOn2bPbwUdwuYYQX
 9PrY2R/oQ6s0/k1qZXxVJFfgCwMnN0j+B9NMMP9ajWDr8PeFBMLREVcKeTDlnJh6/bu2
 Lpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d1S6fPeIqaAQRMYlwl2pKw7Am66k2GXvx1Ix04Ho/cQ=;
 b=XJ2k+Pxe2aVkl25MyAxChccG5r4haWKXvcff+7VMJJyTcrl5IauiQpPVb4MEDl+CL0
 w1npSSwsRUiQdUYTPAbJMFG5m+6Ct9xv6UBca3vuO+GOogj7sXaLBhqJTH/zY8eWIYwB
 oCFLYARCYT+57Vxo3bV0/VqlAocT14OuJGvo+zg45E1fQ06xPhh1OUSPu2jgaOPOViJt
 wlJuH2TsmRQJcklYXTtJ3KNj78lpqurXJkZQN/elw+sAzvAv6JRZe+5qjKZeM+A8IYs4
 qLvvwtUiAsaRlAXGTC1aP1q9JAGMw0AiXIJbXg3GT//TLyPY0e0DuHgcm5rXM3itl4QJ
 kUvw==
X-Gm-Message-State: AOAM533qNg63lxi8PNq1AlU0hyqASW0Siiq8QAZrj9ze2vbGnW2FhwCF
 uMkCz4O4QVjZmlmkXi8jtNo=
X-Google-Smtp-Source: ABdhPJygdO8e3G3Gw9gtyZqpxbnJDB9j9FK/Z5rbgp7N0d/5aJ4J994amhiYJWezgysF8lPZ3pNC2A==
X-Received: by 2002:a63:575d:0:b0:373:a27e:7c67 with SMTP id
 h29-20020a63575d000000b00373a27e7c67mr143716pgm.558.1645053207571; 
 Wed, 16 Feb 2022 15:13:27 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id b14sm33567945pfl.75.2022.02.16.15.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 15:13:26 -0800 (PST)
Message-ID: <2449b26e-2471-9791-2070-14aa14f44cd8@amsat.org>
Date: Thu, 17 Feb 2022 00:13:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 7/7] hw/mips/gt64xxx_pci: Resolve gt64120_register()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Aurelien Jarno
 <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220216224519.157233-1-shentey@gmail.com>
 <20220216224519.157233-8-shentey@gmail.com>
In-Reply-To: <20220216224519.157233-8-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 16/2/22 23:45, Bernhard Beschow wrote:
> Now that gt64120_register() lost its pic parameter, there is an
> opportunity to remove it. gt64120_register() is old style by wrapping
> qdev API, and the new style is to use qdev directly. So take the
> opportunity and modernize the code.
> 
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/mips/gt64xxx_pci.c  | 21 ++++-----------------
>   hw/mips/malta.c        | 13 ++++++++-----
>   include/hw/mips/mips.h |  3 ---
>   3 files changed, 12 insertions(+), 25 deletions(-)

>   static void gt64120_pci_realize(PCIDevice *d, Error **errp)
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 13254dbc89..16fdaed3db 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -38,6 +38,7 @@
>   #include "hw/mips/mips.h"
>   #include "hw/mips/cpudevs.h"
>   #include "hw/pci/pci.h"
> +#include "hw/pci/pci_host.h"
>   #include "qemu/log.h"
>   #include "hw/mips/bios.h"
>   #include "hw/ide.h"
> @@ -1230,7 +1231,7 @@ void mips_malta_init(MachineState *machine)
>       const size_t smbus_eeprom_size = 8 * 256;
>       uint8_t *smbus_eeprom_buf = g_malloc0(smbus_eeprom_size);
>       uint64_t kernel_entry, bootloader_run_addr;
> -    PCIBus *pci_bus;
> +    PCIHostState *phb;
>       ISABus *isa_bus;
>       qemu_irq cbus_irq, i8259_irq;
>       I2CBus *smbus;
> @@ -1390,7 +1391,9 @@ void mips_malta_init(MachineState *machine)
>       stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
>   
>       /* Northbridge */
> -    pci_bus = gt64120_register();
> +    dev = qdev_new("gt64120");
> +    phb = PCI_HOST_BRIDGE(dev);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

Nice cleanup!

I might move the phb assignation afther the realize() for clarity
(usually we only set qdev properties between qdev_new and the
realize).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


