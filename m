Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A654B7946
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:29:13 +0100 (CET)
Received: from localhost ([::1]:50418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5Nn-0003ba-OV
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:29:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5Mf-0002ie-UO
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:28:02 -0500
Received: from [2a00:1450:4864:20::32e] (port=54010
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5Md-0000Ci-Qa
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:28:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n8so65525wms.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 13:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6qFJaQMy1Mp3x+eN5HPTrrshRZWsfwxyWNZq/IaXYQM=;
 b=m2zqYZC4qc8XLotrnOxsRnFXf1HAlTXyoSVSRXVVLKrdH7wnHpAEvNp8HcWQGG6kx5
 A1mGhFOxzuIGU/y8KoD0lpJmJ5Xw2V8D8RQ2yocNLsBazjj8VZKzezr2viE5DcX/sOO4
 tgjTxrKwhKo5e8jLAejG4UQ/EN/hIl5BM3F94vQYsCu4bN8X9AqBsi1EmKCJY5MCt1rw
 AejnCaDlZWtNodN1aH/VGCx65btwzVLjQIt3fxT2tJBxR//WaPkAaiIZnBUAXRWJJ+dT
 NVLmMapf23eK97TfnKc4GaB3ZNpyfmcSEswJgasFUNLIdeXwN2NyxmbJeXNhYpiHx6Qr
 AH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6qFJaQMy1Mp3x+eN5HPTrrshRZWsfwxyWNZq/IaXYQM=;
 b=kizVLHfbvcnJatUGH8xJIZEBtTnGLlEMcZxy62WEs+eU3KN3qcpeEZf3USjy8mMvKU
 MwexD3+kbRccSfU47fOoCxLxPuMqHCufgAXXmR/Sys9xfSvqqY59/cdYoFi/MRBuFbQg
 lcxhbOotU5f7CmAYnhMjdaZaPtSYAEd1dVOGhNSQd6D/3H40rtljXP1ZBIQ6ydebjOGI
 xERo4SH0USwvC/muHQ52M1WEmdFCoTrKHDB50arm95U+8aSaVaWUk9uyQ+CBe5kWUNJ3
 fLjvtzU3z6hTTotoGhsK77OpQpNW5yfT7+t0y+uhxmGUsZCCZ3ZFO7MMzogV55O3SHn4
 Xdtw==
X-Gm-Message-State: AOAM5309ULTRcKJwfsaSmLwbOHGGVVulPhAc4WsYFCNuC7dWdziN3HKy
 m4Tvip7BUq0/KDQDG0NnSy/xYpR567zrldIqW1rHzg==
X-Google-Smtp-Source: ABdhPJx5IXoinLidUvLLjSWyntDOIJR98dkbcDFAKnNiUmFBSFVb7NtKOpvndD4gNPwghupu+x8o0PEgYAtZW20kLBI=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr695075wmf.133.1644960478033; 
 Tue, 15 Feb 2022 13:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
In-Reply-To: <20220210113021.3799514-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:27:47 +0000
Message-ID: <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm@nongnu.org,
 Andrew Strauss <astrauss11@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
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
>


> +/*
> + * Sort into address order. We break ties between rom-startpoints
> + * and rom-endpoints in favour of the startpoint, by sorting the 0->1
> + * transition before the 1->0 transition. Either way round would
> + * work, but this way saves a little work later by avoiding
> + * dealing with "gaps" of 0 length.
> + */
> +static gint sort_secs(gconstpointer a, gconstpointer b)
> +{
> +    RomSec *ra =3D (RomSec *) a;
> +    RomSec *rb =3D (RomSec *) b;
> +
> +    if (ra->base =3D=3D rb->base) {
> +        return ra->se - rb->se;
> +    }
> +    return ra->base > rb->base ? 1 : -1;
> +}

This sort comparator still doesn't report the equality
case as actually equal.

>      /*
> -     * Find the chunk of R/W memory containing the address.  This is
> -     * used for the SYS_HEAPINFO semihosting call, which should
> -     * probably be using information from the loaded application.
> +     * If we have found the RAM lets iterate through the ROM blobs to
> +     * workout the best place for the remainder of RAM and split it

"work out"

> +     * equally between stack and heap.
>       */

> @@ -1201,12 +1205,15 @@ target_ulong do_common_semihosting(CPUState *cs)
>              retvals[2] =3D ts->stack_base;
>              retvals[3] =3D 0; /* Stack limit.  */
>  #else
> -            limit =3D current_machine->ram_size;
> -            /* TODO: Make this use the limit of the loaded application. =
 */
> -            retvals[0] =3D rambase + limit / 2;
> -            retvals[1] =3D rambase + limit;
> -            retvals[2] =3D rambase + limit; /* Stack base */
> -            retvals[3] =3D rambase; /* Stack limit.  */
> +            /*
> +             * Reporting 0 indicates we couldn't calculate the real
> +             * values which should force most software to fall back to
> +             * using information it has.
> +             */

What is this comment referring to? We aren't obviously
reporting 0 here...

> +            retvals[0] =3D info.heapbase;  /* Heap Base */
> +            retvals[1] =3D info.heaplimit; /* Heap Limit */
> +            retvals[2] =3D info.heaplimit; /* Stack base */
> +            retvals[3] =3D info.heapbase;  /* Stack limit.  */
>  #endif
>
>              for (i =3D 0; i < ARRAY_SIZE(retvals); i++) {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

