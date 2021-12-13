Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CFC472CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 14:14:50 +0100 (CET)
Received: from localhost ([::1]:52022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwlAH-0002KC-42
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 08:14:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwl5r-0000AU-IM
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:10:16 -0500
Received: from [2a00:1450:4864:20::433] (port=42505
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mwl5p-0004Ge-1k
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 08:10:15 -0500
Received: by mail-wr1-x433.google.com with SMTP id c4so26921450wrd.9
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 05:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DHEyCZg48UrwPi0ihkPz6OcXQI31mvQYmOCTlLbcTuU=;
 b=owC5aGTMmQp5SfqNaCqAtPYX3RXQPpK/u5eejgqjSFFslSWw5pVTasYUIipXV60PDe
 jd8p2ng44m2mPycyzeANQBTKXF5wXe+CkP+Snjt+DRfWcLQ5kKI5QxXNRYpC81k+/Wl1
 UDguJBsS/dSomhvYPEzGc+P3PLVvscxsJjRsL825ZlLGc930fuZX6PgyFWlBIUjDDTfY
 Dp1t4NJglERi+8BpZVyetW308jN8sK9WgFA8Wu9Dk94anjINC6vXmpv78hUeR8/wCF1e
 i2qxTxTVo6vws0qpB312ANBXy7lA8AoRz6sj927T7eCLy7m9lQw71QMkDZVy1Zca2ZqA
 It7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DHEyCZg48UrwPi0ihkPz6OcXQI31mvQYmOCTlLbcTuU=;
 b=QK3VmYzE2V/wI1dNGRIL1C8emquLNTd4Qcyfe1tXKFirA0KKPPM+6sRTIdXrE6UQIT
 D006cx8bYYC/803i9b7xQBQbA0A+tGfj8jKuSDIK9hgrLoJar93BTD/t31I29wpghd2m
 IfOWaOMoNrCR5N/ru7fttH8EIaIaCX5Z8oduNQYBERtmqCFZPCitQCKTpu7abdSzE7kT
 tFzAWicCKmCbZ3yQYbdVF+UgSTDdvOxvs4SGoQAABKXFceK+CDnt3RWKXRwMIqTEH/2i
 Q+RMwjlxHK9oBCY40aGo3omFAcWWJ/7saM3xmQ4yxwNki8HnwK/DR3UPWLvRIGi2xQjx
 yftw==
X-Gm-Message-State: AOAM530PAjoGey7khOkv8NT2D6UvCcSw/ebmYIRRvfAldvXPmZK24p17
 EmJ1pj0wx2p6IXKBFmTSxuS/Dg==
X-Google-Smtp-Source: ABdhPJztqGVeYmq561CKD07wXeeWHk3VW8FTucYTYVU7Z83RNazIcjy79Dc9Kf9EceyjdoRUxb6w9g==
X-Received: by 2002:a5d:6dc3:: with SMTP id d3mr32143764wrz.159.1639401011152; 
 Mon, 13 Dec 2021 05:10:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p8sm10623113wrx.25.2021.12.13.05.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 05:10:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C707C1FF96;
 Mon, 13 Dec 2021 13:10:09 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-14-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 13/26] hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
Date: Mon, 13 Dec 2021 13:08:42 +0000
In-reply-to: <20211211191135.1764649-14-peter.maydell@linaro.org>
Message-ID: <87lf0olkge.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Use FIELD macros to handle CTEs, rather than ad-hoc mask-and-shift.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/gicv3_internal.h | 3 ++-
>  hw/intc/arm_gicv3_its.c  | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 14e8ef68e02..1eeb99035da 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -403,7 +403,8 @@ FIELD(DTE, ITTADDR, 6, 44)
>   * Valid =3D 1 bit, RDBase =3D 16 bits
>   */
>  #define GITS_CTE_SIZE                 (0x8ULL)
> -#define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_=
LENGTH)
> +FIELD(CTE, VALID, 0, 1)
> +FIELD(CTE, RDBASE, 1, RDBASE_PROCNUM_LENGTH)
>=20=20
>  /* Special interrupt IDs */
>  #define INTID_SECURE 1020
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index d6637229479..ab6ce09dbc2 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -104,7 +104,7 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, =
uint64_t *cte,
>                                        MEMTXATTRS_UNSPECIFIED, res);
>      }
>=20=20
> -    return (*cte & TABLE_ENTRY_VALID_MASK) !=3D 0;
> +    return FIELD_EX64(*cte, CTE, VALID);
>  }
>=20=20
>  static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> @@ -308,7 +308,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
>           * Current implementation only supports rdbase =3D=3D procnum
>           * Hence rdbase physical address is ignored
>           */
> -        rdbase =3D (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
> +        rdbase =3D FIELD_EX64(cte, CTE, RDBASE);
>=20=20
>          if (rdbase >=3D s->gicv3->num_cpu) {
>              return result;
> @@ -426,7 +426,8 @@ static bool update_cte(GICv3ITSState *s, uint16_t ici=
d, bool valid,
>=20=20
>      if (valid) {
>          /* add mapping entry to collection table */
> -        cte =3D (valid & TABLE_ENTRY_VALID_MASK) | (rdbase << 1ULL);
> +        cte =3D FIELD_DP64(cte, CTE, VALID, 1);
> +        cte =3D FIELD_DP64(cte, CTE, RDBASE, rdbase);

I almost flagged this until I realised the double deposit are additive
and the same as the bare |

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

