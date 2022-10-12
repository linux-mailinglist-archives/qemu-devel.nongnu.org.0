Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D185FC00E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 07:08:18 +0200 (CEST)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiTyb-00009E-0J
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 01:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiTui-000566-9L
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 01:04:16 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiTug-0007NL-LH
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 01:04:16 -0400
Received: by mail-pl1-x634.google.com with SMTP id c20so5638749plc.5
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ro3GPRTym5Lmpira4+tBf8Eafdf5B2Dif0HUxPI6FLg=;
 b=VvGt1lajixJ+m3JQgWL9AmpsOjhKTpc2ywzYvUPLh0+wYLTHTslGLzHxvJPZMabdXe
 5oKn20GY76F6qWN7mfKquOxhZ8zw389T59VaXQoNnNE3XnE2qDzI9krVY23omM+BzjtL
 bjHEKG5YX3TW9Goz66Me4wtcGyGBxsnxsUM4cLFmJqpevMDvZpruV5QPjhnKWQ681YDq
 am0wQdYVJr+oOPhcP/f056Swieq+8pC66NMPTYk6lyMg1cUoNOJCnSvFGY0vHs7U04bx
 aA9sqo8yKmKdQIVm5IZeMYXDXHKyxtgH27ORWhLXrECPhwqBZdBpK75+yOrWNaYk38+H
 9ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ro3GPRTym5Lmpira4+tBf8Eafdf5B2Dif0HUxPI6FLg=;
 b=D4Rj+6pmqIAXVkj09+ng79GZO1C153mCFXHW6TWf5HO07d3DMDA2HR85WJWqKHMLA9
 DkqUvxJyrBWyVwD1EEPuhOtvkXPVMJO26AblmLKnWqs7qaXDVy93Hvhc+SqZmXEL8AZW
 dQ4udBglT3WRUR+599GL6tZGZYMiaie4SRq04yLTCTTDZoqmVhtYBuEFkMu7DSUshUML
 2pnQPQE2Gkk6sOD1uXwidV5VlmnhmG2LyQS2Ry/MXqhZChb09Y/d1qOxoRzON/nnBD5+
 CXwW/irgkqhvexxwfcMEDCxSNWU6GKxKFpBTc60++cCTak4bgqO30AZ9Sx9HBDVqhMum
 CTZA==
X-Gm-Message-State: ACrzQf0zea0AEgxmw2gYdN2RBcGjvXEx8hUvjS3ZkkfvcFalB7yWjp4g
 wNSeZmP2q66LGcbUSsZbg2GjKIdmRFAzOD65Qto=
X-Google-Smtp-Source: AMsMyM6P/rs9MttV//2k4wKlqBt4lCIraE6VkZtvRukTsXnlY6xkl1PaOE/XLHj39XBJqL1UGLUQQeZSt6661X9Ydzo=
X-Received: by 2002:a17:90b:3843:b0:20d:54f2:a78d with SMTP id
 nl3-20020a17090b384300b0020d54f2a78dmr3071393pjb.85.1665551052585; Tue, 11
 Oct 2022 22:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221011204645.1160916-1-Jason@zx2c4.com>
 <20221011204645.1160916-2-Jason@zx2c4.com>
In-Reply-To: <20221011204645.1160916-2-Jason@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Oct 2022 15:03:45 +1000
Message-ID: <CAKmqyKPSCi_SnshewHE0MxmOQBu1R4YWgGZFXr-4HvtWK3XXvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] device-tree: add re-randomization helper function
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 6:57 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Several
> architectures require this functionality, so export a function for
> injecting a new seed into the given FDT.
>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/sysemu/device_tree.h |  9 +++++++++
>  softmmu/device_tree.c        | 21 +++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..d552f324b6 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -196,6 +196,15 @@ int qemu_fdt_setprop_sized_cells_from_array(void *fdt,
>                                                  qdt_tmp);                 \
>      })
>
> +
> +/**
> + * qemu_fdt_randomize_seeds:
> + * @fdt: device tree blob
> + *
> + * Re-randomize all "rng-seed" properties with new seeds.
> + */
> +void qemu_fdt_randomize_seeds(void *fdt);
> +
>  #define FDT_PCI_RANGE_RELOCATABLE          0x80000000
>  #define FDT_PCI_RANGE_PREFETCHABLE         0x40000000
>  #define FDT_PCI_RANGE_ALIASED              0x20000000
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 6ca3fad285..d986c7b7b3 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -22,6 +22,7 @@
>  #include "qemu/option.h"
>  #include "qemu/bswap.h"
>  #include "qemu/cutils.h"
> +#include "qemu/guest-random.h"
>  #include "sysemu/device_tree.h"
>  #include "hw/loader.h"
>  #include "hw/boards.h"
> @@ -643,3 +644,23 @@ out:
>      g_free(propcells);
>      return ret;
>  }
> +
> +void qemu_fdt_randomize_seeds(void *fdt)
> +{
> +    int noffset, poffset, len;
> +    const char *name;
> +    uint8_t *data;
> +
> +    for (noffset = fdt_next_node(fdt, 0, NULL);
> +         noffset >= 0;
> +         noffset = fdt_next_node(fdt, noffset, NULL)) {
> +        for (poffset = fdt_first_property_offset(fdt, noffset);
> +             poffset >= 0;
> +             poffset = fdt_next_property_offset(fdt, poffset)) {
> +            data = (uint8_t *)fdt_getprop_by_offset(fdt, poffset, &name, &len);
> +            if (!data || strcmp(name, "rng-seed"))
> +                continue;
> +            qemu_guest_getrandom_nofail(data, len);
> +        }
> +    }
> +}
> --
> 2.37.3
>
>

