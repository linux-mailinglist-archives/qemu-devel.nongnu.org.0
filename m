Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87764B6A5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 14:57:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55h8-0000uZ-0i; Tue, 13 Dec 2022 08:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p55h3-0000r9-Bm
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:51:39 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p55h1-0008DP-Fj
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 08:51:36 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso3657573pjt.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 05:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F1lIA09NAE9d9SsQ4BNpuKSFBf1ECvgdOF9Sj0DG1g4=;
 b=kQko6Z/isWI4VLd5gh5MuXXb6u926HvhIoKSyaARM3xf6Fv6W8iSyXJ6edLv2yeWkx
 nPrEc6tAgrCRxxm7yBx8S6aPGblx6fJVU1C442d0etZZHh4M4bSGw0fhHdsEMGMc4w2g
 4e7asE5YxAj7PI5i34w50MBa3wZnzJY8oI1U8X3fBXwYRdqrEVbUL8S5jzxvJ3WYkc5J
 c/jNJ8r2ChDbLxG4JRy3sbkx89fG4YQGDN9gb/HX5uBQlN2VMOZY3hRkNeWd+4wBhNA6
 JmmfhUw5Mal4f6mJHvnSZcSOby5vmU3U3dzLynC+zBxPLnPn8qxJDF81fKFHaPwTbQ5P
 r3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F1lIA09NAE9d9SsQ4BNpuKSFBf1ECvgdOF9Sj0DG1g4=;
 b=dn/yrR0R5ZEfgo5fHcM5ePR++qmwWfT0lwEorLhCByHSG4++JahIILh5Ogjopdcdkc
 3PNysDpODrSH2RWfecpYVilirZrzCFNHgKAs4Y9yPT/c7EJS90XHl8qgu3OWPCLvCm24
 lFHxN0ow1ZDi+D6fKvv0eEgum+dCOrhhFAV64vfJ0/5QHBjjAe1NCN1jW0sadX3yOFuR
 imeW2vxVc1+968w2/lonP8+ZQVSicEu74ZQgoM8QGXMuo517eZ9GYJepdoxbfGvdCYv+
 MajT0ht5eOH8y9KtHaw7yl9LcQJEc0JUP2cjl0DNqs3muCmT38FmaPQegxzkorVX1D60
 YHOg==
X-Gm-Message-State: ANoB5pk7umLFRh7WaZ3I/tzulF4hUZ6wnP+9X1JJ5OVaRDHLB5VFF+uu
 8uersUZAt8aCLItDCdQm2xQVYtRVxF4tKRW1BHkCNg==
X-Google-Smtp-Source: AA0mqf7uylvX7hXfgqEMnxiqUXJ5epz2GYKQLkGME/2PHmp3aZuDO1wEt1+YDBXOUE359QlWPMu5Q3fee0B+LCT3sT0=
X-Received: by 2002:a17:90b:3c05:b0:219:e2f1:81ad with SMTP id
 pb5-20020a17090b3c0500b00219e2f181admr338851pjb.19.1670939492906; Tue, 13 Dec
 2022 05:51:32 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
In-Reply-To: <20221213125218.39868-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 13:51:21 +0000
Message-ID: <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> The tswap64() calls introduced in commit 4be21d561d ("pseries:
> savevm support for pseries machine") are used to store the HTAB
> in the migration stream (see savevm_htab_handlers) and are in
> big-endian format.

I think they're reading the run-time spapr->htab data structure
(some of which is stuck onto the wire as a stream-of-bytes buffer
and some of which is not). But either way, it's a target-endian
data structure, because the code in hw/ppc/spapr_softmmu.c which
reads and writes entries in it is using ldq_p() and stq_p(),
and the current in-tree version of these macros is doing a
"read host 64-bit and convert to/from target endianness wih tswap64".

>  #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
> -#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_V=
ALID)
> -#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_H=
PTE_DIRTY)
> -#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D tswap64(~HPTE64_=
V_HPTE_DIRTY))
> -#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D tswap64(HPTE64_V=
_HPTE_DIRTY))
> +#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64=
_V_VALID)
> +#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64=
_V_HPTE_DIRTY)
> +#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D cpu_to_be64(~HPT=
E64_V_HPTE_DIRTY))
> +#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D cpu_to_be64(HPTE=
64_V_HPTE_DIRTY))

This means we now have one file that's accessing this data structure
as "this is target-endian", and one file that's accessing it as
"this is big-endian". It happens that that ends up meaning the same
thing because PPC is always TARGET_BIG_ENDIAN, but it seems a bit
inconsistent.

We should decide whether we're thinking of the data structure
as target-endian or big-endian and change all the accessors
appropriately (or none of them -- currently we're completely
consistent about treating it as "target endian", I think).

I also think that "cast a pointer into a byte-array to uint64_t*
and then dereference it" is less preferable than using ldq_p()
and stq_p(), but that's arguably a separate thing.

thanks
-- PMM

