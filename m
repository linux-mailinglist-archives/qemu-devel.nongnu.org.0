Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51EA60C12C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 03:41:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on8oj-0007UZ-An; Mon, 24 Oct 2022 21:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on8of-0007Lw-To
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:33:19 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1on8oY-0005L0-6S
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 21:33:11 -0400
Received: by mail-pg1-x531.google.com with SMTP id h185so10167661pgc.10
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 18:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tyhckos3cCbzyobScOCNfdyP4cr2bq99arGlmjmAXBs=;
 b=ddgtZx396T/+ZukGlifdx60Eg3OvtDh3MkqO1tn6JKyqBp80v8Z7oHW0MGN3WZhKbx
 xcQCDvlIz1x8VChrCxm+jvsMdDeTmZhe/9BKRwFFlr7XzugeQQSZ+5SRF0u18EmqpBdF
 gLYOXl+eyEJiQJnJhuqC4mDO5NQ/6IdUMA+Wq76/v7yROAeX3/Q0AMHRy1GP6pLXkn+d
 7n32xMpqBu69dpNBdrR+OhyopIlQMo2ogiqdGX5DbNeXAcOlOdQVLyMinzpFXHQezWZH
 AxA897MG/nbSoKsZVd5L83NlnP+Lt0cDNBnfmuYXMvNPixbJ6SrTKu2DnUIKIW5PU3+N
 CEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tyhckos3cCbzyobScOCNfdyP4cr2bq99arGlmjmAXBs=;
 b=diJj83LBti2GC0lbBj9WdAyJgTMco03s/cisv1sbQ/UUdU6cp4f7vbL+hxkAVxv8Vb
 XADZtS6CrAGDhT5jkU7Oe61jnPUWZ5NP4LA5svQqZH2467+xVc7r5pxajzmM4/1kdk+x
 Spt1QwTuWzfwdwSnbydXzK8VPJsCYbUZOYIgwWfA9JXtP9HvrSmKzAIx9HH+4vvyt5B0
 4lEzECFHw/Or65GPvdEmYIFM5cAnOKYjAe1TUcM5ItSZIzt0cpPHHSQi/v8Wyybbvlm4
 bhyS0REChDnOYIZ7R2kMOjdB8BlFsyIxj6hoASzoFo+9rVHEOBsyyXVUnQhnuFUl39y6
 DmuQ==
X-Gm-Message-State: ACrzQf12FrlMJxLQxcg+d4K2yoh25/C4FSpjjL9/XFeZl2nWQJ7IDR+O
 NNBI0XiYBTPqfPhm7OJpOPacGWFT3Qg5tyNXsbfychUHi+uPpw==
X-Google-Smtp-Source: AMsMyM6hCzNuWZd1JtDEaDYaBc4aMHMO/iCP8jL770GXSRCMjvc5VlQx+L7+bN1WgLzsid/LrZJfBtmpb3BBgy5KPII=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr30459872pgi.406.1666661588803; Mon, 24
 Oct 2022 18:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-3-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-3-Jason@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 25 Oct 2022 11:32:42 +1000
Message-ID: <CAKmqyKOiHH6Kj9vmWKwmwKK=Fij+a8Ogapa3CY+Yz5uYY5is9Q@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] device-tree: add re-randomization helper function
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 richard.henderson@linaro.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 10:51 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
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
> index e7c5441f56..ca5339beae 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -197,6 +197,15 @@ int qemu_fdt_setprop_sized_cells_from_array(void *fdt,
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
> index ce74f3d48d..30aa3aea9f 100644
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
> @@ -680,3 +681,23 @@ void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
>
>      info_report("dtb dumped to %s", filename);
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
> 2.38.1
>
>

