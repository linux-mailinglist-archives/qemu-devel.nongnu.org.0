Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB60B4C5F66
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:18:51 +0100 (CET)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORsQ-0006PX-RV
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORqm-0005Tu-4L; Sun, 27 Feb 2022 17:17:08 -0500
Received: from [2607:f8b0:4864:20::532] (port=46919
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORqk-0002KG-CT; Sun, 27 Feb 2022 17:17:07 -0500
Received: by mail-pg1-x532.google.com with SMTP id o23so9813252pgk.13;
 Sun, 27 Feb 2022 14:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=esVmBGsfpVcKz9KNWkdtHiCgwbI6OpnZo4iqoMKrLNY=;
 b=Kjq47I7bvvYBOn+Z+8YuqJRFoI6ncszVL/VuvF4fYcMB4rjVvSyGea0FjmCZcZUuRe
 0IgAWJTXULfelMioVGeDxyXnXs0IB81rviKCXWiyoK+1KWfCKaiUq3Dn+FzA1zuTtX5Q
 acOUdNl7Kvp73l2Y3KIGwLHP3PXHMzgDUAZ/jOkNsP/Im0lhgUEJ5ad4FX3rq64fJMDZ
 2LE9TmzkTBKOL0JqrvuJ22yX210xy/NpbE862yEc5+SWyjjSOamaHVZekgGz1Ox+zcyb
 Z/WKPA+Nnm6lVgW5y+xaksO+pvwAkjthcucvXZJAA+o/xfq7/fRiokY5xkyzrToiSxHX
 84vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=esVmBGsfpVcKz9KNWkdtHiCgwbI6OpnZo4iqoMKrLNY=;
 b=jSVG4rR2DwImJIB2UeCD4vhKUP4DnW2Ftljm6btkmam6vYEZ7+rdFaY0Cn+MK0v72c
 Wis4v6E6RwPc6++IfyFQvIWop819CYENRUUNEt20eaNqCEBL5dhAIuhOoiRop8Bp4pQm
 sQfphaCB7R6+Yb5ifJDdpwLdPg8kSxlq52EJ99ucKclmpm4GbToHwQBprYSf1KrZT0cN
 BTCa7yTBFnNG1TRUHQ6HwHyT6FkO3NW7Ma1okjb6M7zwL04tEdgDEDUJ2JH90e91QadI
 HPBID+MROzIWpNtU7ZSJUFazp5bOsoShAoI7qvT5yGPr0ltx9GXpKew7RIe/wV0pC8V5
 PUgQ==
X-Gm-Message-State: AOAM533nP+hSpPMTYZgeWnieZeF/d0MX1A6lyXFSFANTQCUYbO9laXCe
 +P8DmNvizOaHsieqFCRDYo8=
X-Google-Smtp-Source: ABdhPJzrGw5J8xkLVDdT0CyaZN6pJKtKS/damjSONYUv0VBupFYWpepoalrreN94e0Lw0wB0hmKi5A==
X-Received: by 2002:a63:9351:0:b0:375:8d1a:4766 with SMTP id
 w17-20020a639351000000b003758d1a4766mr14158945pgm.102.1646000224711; 
 Sun, 27 Feb 2022 14:17:04 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 g21-20020a17090a7d1500b001b968e82819sm14800852pjl.10.2022.02.27.14.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:17:04 -0800 (PST)
Message-ID: <5c0787e4-7271-93d4-1a82-d2ad1f29aaca@gmail.com>
Date: Sun, 27 Feb 2022 23:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 05/22] hw/ppc/pnv: Determine ns16550's IRQ number from
 QOM property
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222193446.156717-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "open list:PowerNV Non-Virt..." <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 20:34, Bernhard Beschow wrote:
> Determine the IRQ number in the same way as for isa-ipmi-bt. This resolves
> the last usage of ISADevice::isairq[] which allows it to be removed.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ppc/pnv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 837146a2fb..1e9f6b0690 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -380,9 +380,12 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
>           cpu_to_be32(io_base),
>           cpu_to_be32(8)
>       };
> +    uint32_t irq;
>       char *name;
>       int node;
>   
> +    irq = object_property_get_int(OBJECT(d), "irq", &error_fatal);

object_property_get_[u]int(), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>       name = g_strdup_printf("%s@i%x", qdev_fw_name(DEVICE(d)), io_base);
>       node = fdt_add_subnode(fdt, lpc_off, name);
>       _FDT(node);
> @@ -394,7 +397,7 @@ static void pnv_dt_serial(ISADevice *d, void *fdt, int lpc_off)
>   
>       _FDT((fdt_setprop_cell(fdt, node, "clock-frequency", 1843200)));
>       _FDT((fdt_setprop_cell(fdt, node, "current-speed", 115200)));
> -    _FDT((fdt_setprop_cell(fdt, node, "interrupts", d->isairq[0])));
> +    _FDT((fdt_setprop_cell(fdt, node, "interrupts", irq)));
>       _FDT((fdt_setprop_cell(fdt, node, "interrupt-parent",
>                              fdt_get_phandle(fdt, lpc_off))));
>   


