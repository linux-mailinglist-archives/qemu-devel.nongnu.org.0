Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B071A32ECDA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:15:04 +0100 (CET)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBEJ-0003sU-6c
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIBBZ-0001fK-On
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:12:09 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIBBY-000736-4n
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:12:09 -0500
Received: by mail-wr1-x432.google.com with SMTP id h98so2205674wrh.11
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9G5ExXIIdR7+Pf/JqZifmowB6DsOXh1JAVF7791UQ3o=;
 b=MGkGp5eAtDZZxL6MULORwXQqTEOInEp7YGaWPLitZkAvThWRFYxOQgQkY4zxCmWc36
 HS2u6aT6cryXxpIV7BONITEXlnT6/eRZst3X/PCRSO9pIxwwlukGh1ayXw2Ere6bAdP+
 Q+oLe4tqqMSD8H06Q2IFMbgBVhRHmtS6t8EqnPS8t+WqTqKSoUjjvWSjU8WrQnedThc8
 LDvl4m0X8yufUloSawC4yIW/n6byp9yRxPhXWudBQBB7sl9utr8x+4S/nTphqFEB1PfJ
 P/YTdDEhYfx54xN0WIgdpVAGS/aAcqVlhdSdxgilrMIRdySuAd81oIDl/aUvDKiCO4N1
 KjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9G5ExXIIdR7+Pf/JqZifmowB6DsOXh1JAVF7791UQ3o=;
 b=RnCa5LWLD9Q9oizfealwo26AIsAwMgJD50QByThSA0rSkpYoiSpM4n3TB9lee53KKs
 lR8SXew9WzRPlm8AU1bHLjVlDCrCEbnU/IeuJ0yAvgnvWBp4T3img53snDfS6Fg32i/b
 4hytjm1WB1e3KFNWGf8c+5eQPVjMmI33UH0lDynJRD4ic+2u3Bp/3CGC2sM3upJD3zi9
 WG85Gia55CsbZpMrUrjNo+zbVS1ggOwxeSssU1OMpD8O9zzC9CkfNwX11gFwK3EBawua
 HBspISq+QDFzjl12I3ryQSPEy7ka9WCpH0YNswaQV9E3hEPRDTNRPNI+MA18A4u32Sfm
 Jdcw==
X-Gm-Message-State: AOAM530/Bau/b/zUF7/VsNoOIh9YNv+bz4wvLyHvd+itwl6OInUvB6mM
 pVkVpT4mjX4doSoKj/71Qve7Rg==
X-Google-Smtp-Source: ABdhPJxWEdkZZ/C2BO8VAfTT3+Edw36S8LIZ0ilpFaGRcxPRX0MZAihPbYy6JmuPI8hqm5tLm51LIw==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr9465336wrq.69.1614953526586;
 Fri, 05 Mar 2021 06:12:06 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j125sm4571450wmb.44.2021.03.05.06.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 06:12:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA1A71FF7E;
 Fri,  5 Mar 2021 14:12:04 +0000 (GMT)
References: <20210303094919.x6wnlh6qulx72fz6@titan.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Ivan A. Melnikov" <iv@altlinux.org>
Subject: Re: [PATCH] linux-user: Adjust pgd_find_hole_fallback result with
 guest_loaddr
Date: Fri, 05 Mar 2021 14:03:43 +0000
In-reply-to: <20210303094919.x6wnlh6qulx72fz6@titan.localdomain>
Message-ID: <87eegtg05n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ivan A. Melnikov <iv@altlinux.org> writes:

> While pgd_find_hole_fallback returns the beginning of the
> hole found, pgb_find_hole returns guest_base, which
> is somewhat different as the binary qemu-user is loading
> usually has non-zero load address.
>
> Failing to take this into account leads to random crashes
> if the hole is "just big enough", but not bigger:
> in that case, important mappings (e.g. parts of qemu-user
> itself) may be replaced with the binary it is loading
> (e.g. the guest elf interpreter).
>
> This patch also fixes the return type of pgd_find_hole_fallback:
> it returns -1 if no hole is found, so a signed return type
> should be used.

I don't think it should. For one thing the type is preserved as
uintptr_t all the way up the call chain so just changing it here doesn't
help much. -1 is really just a quick way of saying all bits are set
which is the one "fail" value we check for. The address space is big
enough we could theoretically return a chunk of space that otherwise has
the top bit set.

>
> Downstream issue (in Russian): https://bugzilla.altlinux.org/39141
> Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
> ---
>  linux-user/elfload.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index bab4237e90..acd510532c 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -2205,9 +2205,11 @@ static void pgb_have_guest_base(const char *image_=
name, abi_ulong guest_loaddr,
>   * /proc/self/map. It can potentially take a very long time as we can
>   * only dumbly iterate up the host address space seeing if the
>   * allocation would work.
> + *
> + * Returns the start addres of the hole found, or -1 if no hole found.
>   */
> -static uintptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t =
brk,
> -                                        long align, uintptr_t offset)
> +static intptr_t pgd_find_hole_fallback(uintptr_t guest_size, uintptr_t b=
rk,
> +                                       long align, uintptr_t offset)
>  {
>      uintptr_t base;
>=20=20
> @@ -2235,7 +2237,7 @@ static uintptr_t pgd_find_hole_fallback(uintptr_t g=
uest_size, uintptr_t brk,
>                  munmap((void *) align_start, guest_size);
>                  if (MAP_FIXED_NOREPLACE !=3D 0 ||
>                      mmap_start =3D=3D (void *) align_start) {
> -                    return (uintptr_t) mmap_start + offset;
> +                    return (intptr_t) mmap_start + offset;
>                  }
>              }
>              base +=3D qemu_host_page_size;
> @@ -2259,7 +2261,8 @@ static uintptr_t pgb_find_hole(uintptr_t guest_load=
dr, uintptr_t guest_size,
>      brk =3D (uintptr_t)sbrk(0);
>=20=20
>      if (!maps) {
> -        return pgd_find_hole_fallback(guest_size, brk, align, offset);
> +        ret =3D pgd_find_hole_fallback(guest_size, brk, align, offset);
> +        return (ret > guest_loaddr) ? (ret - guest_loaddr) : -1;

So I think we just want:

    return ret =3D=3D -1 ? -1 : (ret - guest_loaddr);

do we have a test case that triggers this?

>      }
>=20=20
>      /* The first hole is before the first map entry. */


--=20
Alex Benn=C3=A9e

