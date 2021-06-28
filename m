Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31323B694C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 21:49:51 +0200 (CEST)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxxGQ-0006Ez-7M
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 15:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxxFc-0005Mr-3s
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 15:49:00 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxxFV-0002U1-KQ
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 15:48:58 -0400
Received: by mail-ej1-x630.google.com with SMTP id v20so13367528eji.10
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 12:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xDJV9JWzwK2+wQoOTCATHcYzNEtTWMGbBkjQrsgzQvE=;
 b=zhjLMKnKQMlokFYJdAnZI0fSW/Lhy06pNBFhyaf1ElQu9p7vMGsNVf/gCPQKS1/swL
 nbLAuz5oUke6jVA8BSiHTsWiWv8DOJI8VU2OlSd9pXzOPxHSarPusNpqBczuP6tn8ZdT
 fOs3wSF4MG0LeZZZ3Xpe5NaSxKL9gyXPYxlEdWqZivTpBS3GPdm7tVK6l9/FMYP/Rn1M
 3s88USEOBHUNxqWZ+I54XPm7V9d1ADPcHYJ/1od8jX3OlEzOUHwOJuMpkzMQjmFX9tS/
 4QcOtssIsK6MFY51K5JiZwuYmADrKIJK/KMO/iNqKs8oUl9GQkGqQ7eV8ISXeJkbXjx3
 UBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xDJV9JWzwK2+wQoOTCATHcYzNEtTWMGbBkjQrsgzQvE=;
 b=nz7rPpqeBWAjrRNvv9rYGfI7K1P0OfVWWCsNWPUMyylA0LnbjeHBqpEkeAs614qI5X
 qGTGg62bT99Etd7efVseQvpCv3M/dEJ9KDuBv/2HmuqdK5QBFC49xL6IcVj1zcL5sJVs
 A54nobPb4/zTD9VN1VqTrCJwfBkWqkWEbBpwKe1YcXsR0cCV3LncyB8Gw2tvoJZx3Lga
 D6KDf2YCi4eYBTAxSofKM2nJRp1fegH/dX13m/GHYFmq12Gh6rDfz5/AChbAsEzuShTQ
 U4EoPoCKrRhLjyghCw6kcw3mMdYYffxkTI9FnTNesD1xC5N74IE2eEvWbD8Wy93epopB
 +NmA==
X-Gm-Message-State: AOAM531L1ZUi1B4785AmfjNlcBtKnbyNVU78O9y4TWlY85JBaUPBrmQ5
 fraJzOf936ClIN+LlqFBCNfJmRjxgfICgr6LniOURQ==
X-Google-Smtp-Source: ABdhPJyjdXuA9RCzrsvzMxNHPE73DBrPAnHEkgFiL67rcPBUv16+cVezqO4uwS31SDAg7bB44ByTwA0pzX+JvxhS0F4=
X-Received: by 2002:a17:906:a38d:: with SMTP id
 k13mr26534758ejz.250.1624909731126; 
 Mon, 28 Jun 2021 12:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210623134756.30930-1-alex.bennee@linaro.org>
 <20210623134756.30930-2-alex.bennee@linaro.org>
In-Reply-To: <20210623134756.30930-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 20:48:13 +0100
Message-ID: <CAFEAcA8TCTEBnjibsUTyqRXL0tWXGUih-TATNLHuWW-5=VQHLA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Strauss <astrauss11@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Jun 2021 at 14:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The previous numbers were a guess at best and rather arbitrary without
> taking into account anything that might be loaded. Instead of using
> guesses based on the state of registers implement a new function that:
>
>  a) scans the MemoryRegions for the largest RAM block
>  b) iterates through all "ROM" blobs looking for the biggest gap
>
> The "ROM" blobs include all code loaded via -kernel and the various
> -device loader techniques.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Andrew Strauss <astrauss11@gmail.com>
> Cc: Keith Packard <keithp@keithp.com>
> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>

> @@ -349,4 +349,20 @@ int rom_add_option(const char *file, int32_t bootind=
ex);
>   * overflow on real hardware too. */
>  #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
>
> +/**
> + * rom_find_largest_gap_between: return highest address of ROM in region
> + *
> + * This function is used to find the highest ROM address (or loaded
> + * blob) so we can advise where true heap memory may be.

This doc comment doesn't match the function name or implementation.
You probably want something like:

rom_find_largest_gap_between: return largest gap between ROMs in given rang=
e

Given a range of addresses, this function finds the largest
contiguous subrange which has no ROMs loaded to it. That is,
it finds the biggest gap which is free for use for other things.

> + *
> + * Returns: RomGap, describing the largest section not intersected by
> + * a ROM region.
> + */
> +typedef struct RomGap {
> +    hwaddr base;
> +    size_t size;
> +} RomGap;

I suspect if we ever run the doc-generator on this header it
would get confused by the doc comment not coming immediately
before the function prototype it is documenting.

> +RomGap rom_find_largest_gap_between(hwaddr base, size_t size);
> +
>  #endif
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 5b34869a54..d4893fa8d8 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1310,6 +1310,80 @@ static Rom *find_rom(hwaddr addr, size_t size)
>      return NULL;
>  }
>
> +typedef struct RomSec {
> +    hwaddr base;
> +    int se; /* start/end flag */
> +} RomSec;
> +
> +
> +static gint sort_secs(gconstpointer a, gconstpointer b)
> +{
> +    RomSec *ra =3D (RomSec *) a;
> +    RomSec *rb =3D (RomSec *) b;

/*
 * Sort into address order. We break ties between rom-startpoints
 * and rom-endpoints in favour of the startpoint, by sorting the 0->1
 * transition before the 1->0 transition. Either way round would
 * work, but this way saves a little work later by avoiding
 * dealing with "gaps" of 0 length.
 */

> +
> +    if (ra->base =3D=3D rb->base) {
> +        return ra->se > rb->se ? -1 : 1;
> +    }
> +    return ra->base > rb->base ? 1 : -1;

This has forgotten the "equality" case, which you will
see if two blobs start at the same address (at least in
theory; at the moment the rom blob loader will try to
reject overlaps, though it might not do so forever).

> +}
> +
> +RomGap rom_find_largest_gap_between(hwaddr base, size_t size)
> +{
> +    Rom *rom;
> +    RomSec *cand;
> +    RomGap res =3D {0, 0};
> +    hwaddr gapstart =3D base;
> +    GList *it, *secs =3D NULL;
> +    int count =3D 0;
> +
> +    QTAILQ_FOREACH(rom, &roms, next) {
> +        /* ignore real rom blobs */

They're all real rom blobs (arguably a fw_file blob is less real!). Maybe
  /* Ignore blobs being loaded to special places */
?

> +        if (rom->mr || rom->fw_file) {
> +            continue;
> +        }
> +        /* ignore anything finishing bellow base */

"below"

> +        if (rom->addr + rom->romsize < base) {

  <=3D
(we can ignore a rom that's 0x1000, size 0x1000 if our range starts at 0x20=
00,
because it covers [0x1000..0x1fff])

> +            continue;
> +        }
> +        /* ignore anything starting above the region */
> +        if (rom->addr > base + size) {

 >=3D
(if our region is 0x1000, size 0x1000, we can ignore a rom starting at 0x20=
00)

> +            continue;
> +        }
> +
> +        /* Save the start and end of each relevant ROM */
> +        cand =3D g_new(RomSec, 1);
> +        cand->base =3D rom->addr;

  cand->base =3D MAX(rom->addr, base);

(otherwise you can get exciting special cases like
"cand->base - gapstart" being negative in the loop below)

> +        cand->se =3D 1;
> +        secs =3D g_list_append(secs, cand);

The glib docs
https://developer.gnome.org/glib/stable/glib-Doubly-Linked-Lists.html#g-lis=
t-append
say that g_list_append() has to traverse the entire list to find the
tail in order to append the new item, making this algorithm
accidentally-quadratic. Since we're about to sort the list, we don't
care about its order now and can use g_list_prepend() instead.

> +
> +        if (rom->addr + rom->romsize < base + size) {
> +            cand =3D g_new(RomSec, 1);
> +            cand->base =3D rom->addr + rom->romsize;
> +            cand->se =3D -1;
> +            secs =3D g_list_append(secs, cand);
> +        }
> +    }

We need to append a sentinel to the list to avoid having
to special case for "the big gap goes all the way to the end
of the range":
     cand =3D g_new(RomSec, 1);
     cand->base =3D base + size;
     cand->se =3D 1;
     secs =3D g_list_prepend(secs, cand);

(Maybe a helper function so you can write
   add_romsec_to_list(secs, base, se);
rather than having variants on these four lines in three places?)

> +
> +    secs =3D g_list_sort(secs, sort_secs);
> +

I would favour initializing gapstart here, just because this
tail end of the function is the only place where it's used, and
it makes the algorithm a bit easier to understand if you don't
have to look 30 lines back up the function to see what its
initial value is.

> +    for (it =3D g_list_first(secs); it; it =3D g_list_next(it)) {
> +        cand =3D (RomSec *) it->data;
> +        if (count =3D=3D 0 && count + cand->se =3D=3D 1) {
> +            size_t gap =3D cand->base - gapstart;
> +            if (gap > res.size) {
> +                res.base =3D gapstart;
> +                res.size =3D gap;
> +            }
> +        } else if (count =3D=3D 1 && count + cand->se =3D=3D 0) {
> +            gapstart =3D cand->base;
> +        }
> +        count +=3D cand->se;
> +    }
> +
> +    g_list_free_full(secs, g_free);
> +    return res;
> +}

> +static LayoutInfo common_semi_find_bases(CPUState *cs)
>  {
> -    MemoryRegion *subregion;
> +    FlatView *fv;
> +    LayoutInfo info =3D { 0, 0, 0, 0 };
> +
> +    RCU_READ_LOCK_GUARD();
> +
> +    fv =3D address_space_to_flatview(cs->as);
> +    flatview_for_each_range(fv, find_ram_cb, &info);
>
>      /*
> -     * Find the chunk of R/W memory containing the address.  This is
> -     * used for the SYS_HEAPINFO semihosting call, which should
> -     * probably be using information from the loaded application.
> +     * If we have found the RAM lets iterate through the ROM blobs to
> +     * workout the best place for the remainder of RAM and split it
> +     * equally between stack and heap.
>       */
> -    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
> -                   subregions_link) {
> -        if (subregion->ram && !subregion->readonly) {
> -            Int128 top128 =3D int128_add(int128_make64(subregion->addr),
> -                                       subregion->size);
> -            Int128 addr128 =3D int128_make64(addr);
> -            if (subregion->addr <=3D addr && int128_lt(addr128, top128))=
 {
> -                return subregion->addr;
> -            }
> -        }
> +    if (info.rambase && info.ramsize) {
> +        RomGap gap =3D rom_find_largest_gap_between(info.rambase, info.r=
amsize);
> +        info.heapbase =3D gap.base;
> +        info.heaplimit =3D gap.base + gap.size;
>      }

You don't want to ignore info.rambase =3D=3D 0 -- it could well be that
the RAM in the system starts at address zero. It's only size of 0
that would indicate we failed entirely to find any RAM.

thanks
-- PMM

