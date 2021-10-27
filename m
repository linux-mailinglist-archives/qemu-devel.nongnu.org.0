Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD19643D6FE
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:54:45 +0200 (CEST)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfroh-00088i-A8
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfrds-0006kE-5V
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:43:32 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:46835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfrdp-0005Hb-M4
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:43:31 -0400
Received: by mail-il1-x129.google.com with SMTP id w10so4634695ilc.13
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vdYpaoFV3ixw53O/F8MKUVwP7C7IKMd3ySSc9QJ5lh8=;
 b=aj60QX+IoaO/RUHlDC2EU18Kdimkn7f/w49O18DV5peI3JH89BIbXTe1Pp5B2uafxh
 bfO3+uvq9pNOR9qnVSKh3Dwj+XJr2gvTMxnjEYhfKaLGol2sAqhgWk53iI07U2laro1u
 a1wQsIQruhvigiESJAh+dU1293t24m+XRR44W15Sf6s4EGjtdWtHRqbumj2F/Mez7P7I
 GnP993tdvaFwxCs1greYA+P2kl1d9y/CIDJup+dPa2d4bqh8oGFgIR0QckQeUgTT3GaV
 CaRUWDfCA7+XdftpEWp3hz0Nr5e7zYEWYZiCWsy2/x/0ZAkTuWA8X4Gbacn73rkWHyR+
 R+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vdYpaoFV3ixw53O/F8MKUVwP7C7IKMd3ySSc9QJ5lh8=;
 b=69bQQ9uO7LXgvNuYyWKkTae86ty9j86uPGtMQL9+OdU9nAsmTtvQlDXPV5obzlSyN2
 GpMHBT/2UD3cduQPvS7y8lqPu36yzGcNQyu8FpcTeNCXxQtTFKHn8cUeqmRXm6gxQFJb
 5oe/6BuoRaF/vBhxaYrJ2wSaAR3tNI/QexQTGl9yVS/IzVV3CU1LI3xdUxmkpD2pFt5U
 g/UjiWWrN2Asscc6oAwwDFCqOwPv6UObKS4fPdJcnW61IEvd/mq7AyBtQCCAIxjdyXQw
 QuZPycdIqFCAt+JDvENwooQPneesmNpABEYCOHLjZxn7bvydCtBZDP0oiXgHu/yp+e+v
 hhVg==
X-Gm-Message-State: AOAM53202IOcbaVGfRJuNlowW4JyKUENLtWtH4gIt7U4XhC/AFocJ6AT
 y5vyyghN0PWztPp9W3WtQRCjlK9eIPX7qqY5gZM=
X-Google-Smtp-Source: ABdhPJzzITasdMmXDa+qe/BjXxzlwFPI3kqRRq+ZcMwbkxE8tLsCiY8UcQb7WseYD0i08wrBvpvu71tXvO88Hgu0/qA=
X-Received: by 2002:a05:6e02:1b81:: with SMTP id
 h1mr461219ili.290.1635374607659; 
 Wed, 27 Oct 2021 15:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211026140311.158151-1-damien.hedde@greensocs.com>
In-Reply-To: <20211026140311.158151-1-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 Oct 2021 08:43:01 +1000
Message-ID: <CAKmqyKN7Kr--szF5tgWxfemznvWHg+iBWMMiVy009e+4V2S32w@mail.gmail.com>
Subject: Re: [PATCH v2] generic-loader: check that binary file target location
 exists
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 12:03 AM Damien Hedde
<damien.hedde@greensocs.com> wrote:
>
> When loading a binary file, we only check if it is smaller than the
> ram_size. It does not really check if the file will be loaded at an
> existing location (if there is nothing at the target address, it will
> "fail" silently later). It prevents loading a binary blob bigger than
> ram_size too even if the target location is big enough.
>
> Replace this check by looking for the target memory region size and
> prevent loading a bigger file than the available space.
>
> Get rid of "hw/boards.h" include, since we needed it only to access
> `current_machine`.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Hi,
>
> This is an updated version implementing what we discussed in v1.
>
> This can be tested easily, eg, using opentitan machine which has a 64K ram
> located at 0x10000000.
>
> the following works (we a blob corresponding to the whole ram)
> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x10000000,file=blob.bin
>
> but this command fails because we load a blob which is too big
> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x10001000,file=blob.bin
> | qemu-system-riscv32: -device loader,addr=0x10001000,file=blob.bin: Cannot load specified image blob.bin
>
> and this command fails too (we load a blob at an unmapped location)
> | $ dd bs=1K count=64 if=/dev/zero of=blob.bin
> | $ qemu-system-riscv32 -display none -M opentitan -device loader,addr=0x0,file=blob.bin
> | qemu-system-riscv32: -device loader,addr=0x0,file=blob.bin: Address 0x0 does not exists
>
> Thanks,
> Damien
>
> v2:
>  + instead of disabling the ram_size check, look for the target
>
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01077.html
>
> See also the original discussion about generic-loader:
> https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04668.html
> https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg04681.html
> ---
>  hw/core/generic-loader.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index d14f932eea..88d3f9fd56 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -34,7 +34,6 @@
>  #include "hw/core/cpu.h"
>  #include "sysemu/dma.h"
>  #include "sysemu/reset.h"
> -#include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
> @@ -153,8 +152,23 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
>          }
>
>          if (size < 0 || s->force_raw) {
> -            /* Default to the maximum size being the machine's ram size */
> -            size = load_image_targphys_as(s->file, s->addr, current_machine->ram_size, as);
> +            MemoryRegion *root = as ? as->root : get_system_memory();
> +            MemoryRegionSection mrs;
> +            uint64_t avail = 0;
> +
> +            mrs = memory_region_find(root, s->addr, 1);
> +
> +            if (mrs.mr) {
> +                avail = int128_get64(mrs.mr->size) - mrs.offset_within_region;
> +                memory_region_unref(mrs.mr);
> +            } else {
> +                error_setg(errp, "Address 0x%" PRIx64 " does not exists",
> +                           s->addr);
> +                return;
> +            }
> +
> +            /* Limit the file size to the memory region space */
> +            size = load_image_targphys_as(s->file, s->addr, avail, as);
>          } else {
>              s->addr = entry;
>          }
> --
> 2.33.0
>

