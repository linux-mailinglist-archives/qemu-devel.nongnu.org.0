Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F20A64F34A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:41:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IR2-0004xa-Vs; Fri, 16 Dec 2022 16:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IQx-0004u3-TI
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:40:00 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IQo-0007lA-VL
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:39:59 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so3632354pjj.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M34ulhpWVhreOtEad3y2TK+SkftUd/2KIT68iSexyiU=;
 b=Pn0+n1uXfjCz5NS6D1Lb/13zr2B3LdcwpAAApikElI2af17avnbXKz5x3gTVCUPWYC
 Z85um+sam7ozaAoCQBe8hsXbgx5L2l76Bd4IeuIejQmAPZb818jud2/A7XdG7XxByRdh
 tyd+Qf/krAw2NiO5aTSDSJx3cWMmRZRG+a5HgoThuE/l5+n1kwTCW0CKBCzc7HweZkZF
 kadoxsH5Psa5dWULyu0Se7aCH6e0hJcYet0WEcXwwWl8IMP0YJ9Etvf2Vpx94NmTGHnS
 Z5CPpQYS5KeSytFFoakFag5X4e4eUS2HuCcLRVT3PJARavkuxFCT9ciyQgxi9fYM+Ck9
 cfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M34ulhpWVhreOtEad3y2TK+SkftUd/2KIT68iSexyiU=;
 b=opFs5FE2vcqxouoLUvM9cSBcm0rZK7dw3C9rFskJMCWBQaqEz+O1TeF0dInYTSUbkZ
 ummxC5SZfvmkrhYXlPJrU8G5a1UACHpGMma1GNXZBRygUjHsTj8YMuIxyftwoRqVn7bo
 k4oGLvbKwqX1Mvg5cjxJRDmCKzTKGUmZ0lqF6hOLPHPWzD5dOfW7liIslficx8RY0Wbv
 ngny4g+9g0pJKuWitTRQvk4r8ohgwT6dB7mvxfqvoVDu2bjYVKklpnoX1QqKcEh1AbGV
 RdV6BYPkS+MwBzSKf7VmVJ088GpIeafemgDWke+T4fJeo97dcatL8L0Q8Cx7M5+Uqwx1
 Jl9w==
X-Gm-Message-State: AFqh2kobs/3fhyF3Fbt5WDE0BfiWUlrBlCJOWYSprMXGlsDAR2SYqF/w
 D1Cu7w3h3OW0wnJ/Y4mjIt/P1xQ0c5kF0yFtUS0KtA==
X-Google-Smtp-Source: AMrXdXs16EIwuDAEJFTHeQ2mGaO1GBnsvtbM5ouPgkShXqaL6DLGMZMvS16X3wCTFt+HSy0E17jqVXlF+Nr4RABK6yU=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr1223544pjb.19.1671226772055; Fri, 16
 Dec 2022 13:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
In-Reply-To: <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 21:39:19 +0000
Message-ID: <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by
 cpu_to_be64(HPTE)
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 16 Dec 2022 at 19:11, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 12/13/22 10:51, Peter Maydell wrote:
> > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> The tswap64() calls introduced in commit 4be21d561d ("pseries:
> >> savevm support for pseries machine") are used to store the HTAB
> >> in the migration stream (see savevm_htab_handlers) and are in
> >> big-endian format.
> >
> > I think they're reading the run-time spapr->htab data structure
> > (some of which is stuck onto the wire as a stream-of-bytes buffer
> > and some of which is not). But either way, it's a target-endian
> > data structure, because the code in hw/ppc/spapr_softmmu.c which
> > reads and writes entries in it is using ldq_p() and stq_p(),
> > and the current in-tree version of these macros is doing a
> > "read host 64-bit and convert to/from target endianness wih tswap64".
> >
> >>   #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) *=
 2))
> >> -#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_=
V_VALID)
> >> -#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_=
V_HPTE_DIRTY)
> >> -#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D tswap64(~HPTE=
64_V_HPTE_DIRTY))
> >> -#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D tswap64(HPTE6=
4_V_HPTE_DIRTY))
> >> +#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPT=
E64_V_VALID)
> >> +#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPT=
E64_V_HPTE_DIRTY)
> >> +#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D cpu_to_be64(~=
HPTE64_V_HPTE_DIRTY))
> >> +#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D cpu_to_be64(H=
PTE64_V_HPTE_DIRTY))
> >
> > This means we now have one file that's accessing this data structure
> > as "this is target-endian", and one file that's accessing it as
> > "this is big-endian". It happens that that ends up meaning the same
> > thing because PPC is always TARGET_BIG_ENDIAN, but it seems a bit
> > inconsistent.
> >
> > We should decide whether we're thinking of the data structure
> > as target-endian or big-endian and change all the accessors
> > appropriately (or none of them -- currently we're completely
> > consistent about treating it as "target endian", I think).
>
> Yes, most if not all accesses are being handled as "target endian", even
> though the target is always big endian.
>
> IIUC the idea behind Phil's cleanups is exactly to replace uses of
> "target-something" if the endianess of the host is irrelevant, which
> is the case for ppc64. We would then change the semantics of the code
> gradually to make it consistent again.

I would be happier if we just did all the functions that read and
write this byte array at once -- there are not many of them.

thanks
-- PMM

