Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E54BEB94
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 21:07:18 +0100 (CET)
Received: from localhost ([::1]:45524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMExp-0007xu-Cr
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 15:07:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nMEwH-0006w9-Qd
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 15:05:41 -0500
Received: from [2a00:1450:4864:20::32b] (port=35446
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nMEwF-00011z-UZ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 15:05:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so155306wml.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 12:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jKiVDjAdytrRCsOGelpBXe87wHWfDLyTZ41WUfxsQEs=;
 b=qUKXOoyailxY4ACYWlYvkUfa2Er1fI9ImRHgSmYm5DwfPBH215nwWgCq7oqEVtcPMS
 LTKKRyZDdIf/fnNl+uj+6slV6EACdiGVTeOWEofOds9036eEfF2xZ/4HPxJKa090JYC/
 HuKpgx7/5e0YGVE4nTppskNzCo0eCXL4/9Gdy7MI2TIWG7MejuARX1YO7q/X4Izsia77
 bh/3HxuAjo3CW2xPH+EJCztMrJety/Yq8J1ft2RGQ5JaJtDzCdVPDmOhUopf54YCu7Yv
 +MeUgFEwC09z/lzGcGgWaoa2SZQ/0sA5mIQcK5U88bdw8i26x0dzNdTuCVMHS6608kmm
 yD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jKiVDjAdytrRCsOGelpBXe87wHWfDLyTZ41WUfxsQEs=;
 b=N/KMsOd1geXBRH+9q25qT2WFRrSgbGUK1c58WbpN/UylVHEjLUeGiqF/Eorude2t4h
 bx/imhyImNxLfEro8aY4xcUwDu0i8TmyezZu82XreP/q8y2VWZN8tovlknULgAGQOMU5
 Syhjno/uNRWJwhfBLxJ0Kbh3RAlng/LkbjcAy9E3bUx262gPTx5kf5qa5A0NFnIN+uJS
 pyPV1in/TZqZ90OXRbAIGIgv5Fr/wEnVbYp/qRaGtlceZ4Icr2ZmX+ahem5rgKeKRJFq
 sZLzKIH6PckK4/UR5FWr3BQ0Cl4enPQGvLQzqvizKTuiy4fbVYVP8IyaZ4uF70Ig3HFW
 MdVA==
X-Gm-Message-State: AOAM531jfXn9Qw2+N1RB4mzKqzsBptxpuUUmuoy+P9ZO5Dl8kZ8JB/p1
 DbQqoDuO8S4++Euyxmlwg9W/wX12EOhyvA==
X-Google-Smtp-Source: ABdhPJzc19YrU2GKbK2boZolP+qJ5yFbvlgKlKyLbaWjT67/2JS0HdNbKJ1iNi8HLHpuSCPVmil46Q==
X-Received: by 2002:a05:600c:2301:b0:37b:de9e:226d with SMTP id
 1-20020a05600c230100b0037bde9e226dmr529513wmo.78.1645473937155; 
 Mon, 21 Feb 2022 12:05:37 -0800 (PST)
Received: from ?IPV6:2a10:800a:bb8:1:6510:42ac:bb55:9590?
 ([2a10:800a:bb8:1:6510:42ac:bb55:9590])
 by smtp.gmail.com with ESMTPSA id l5sm390104wmq.7.2022.02.21.12.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:05:36 -0800 (PST)
Message-ID: <7755c7a6-6922-2834-2d93-979c39cb9aba@gmail.com>
Date: Mon, 21 Feb 2022 22:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220221191323.617323-1-liavalb@gmail.com>
 <20220221191323.617323-3-liavalb@gmail.com>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220221191323.617323-3-liavalb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=liavalb@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: ani@anisinha.ca, imammedo@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ebd47aa26f..5dc625b8d8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -192,6 +192,11 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>               .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>           },
>       };
> +    if (isa_check_device_existence("i8042")) {
> +        /* Indicates if i8042 is present or not */
> +        fadt.iapc_boot_arch = (1 << 1);
> +    }
> +
Looking into this, it seems I messed up with the spaces here. So, I 
could fix this and send a v3, but want to see if there are other 
comments as well so we can get them fixed and this patch merged (or at 
least in a pull request) before the soft feature freeze in 8.3.2022 :)

