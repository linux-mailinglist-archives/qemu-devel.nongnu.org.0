Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9204EB2A6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 19:25:48 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZFbG-0007g1-Km
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 13:25:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZFZQ-0006hz-GM
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 13:23:52 -0400
Received: from [2607:f8b0:4864:20::b31] (port=43740
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZFZN-0002TD-Rq
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 13:23:52 -0400
Received: by mail-yb1-xb31.google.com with SMTP id v35so32714713ybi.10
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iorf93V5jUZjrp9jYg17LkNdBcpp4HCcM5vL0uY7Kwo=;
 b=nu694tXEn/T+mxLT/qkGf6vRqKQM4rXlcJSa7ainAzmIYqgyGwGBBTDw8bWNLUQH+D
 hmzSr+oDcH2GvWOIl5ZyCEz0OWqkos2uInccyah5tsxPlEUU6nCpmQvJU5Insu9FVaRx
 VdbIGHycyk8NuW+dIe9VcN6HMxqvLWWvuqfZriCiHB5HSb318diyQ9y84psE8YOd2xX3
 mEGpjKrEQfCG3Sw7biIevFEBX6aEn30GG95RV5y7aFmrgqAVCajCk/RCWZaOV0RJcfEZ
 1Tziizu5egCCvDCkbfo5gdl205h5pJzn/VBjIYPeJC/CZ61maTnm0IhY/jOzv/W9C9nt
 823g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iorf93V5jUZjrp9jYg17LkNdBcpp4HCcM5vL0uY7Kwo=;
 b=5KHorCfQEkwDt1N3l2Vjpd/zTdrvQpyxldvhqRfK0e7wjwsDXQQ589aYlh5fd9xcY/
 NWloi4UF7Uf/fLldc4nSj6LzGDzoiPt4Hylf3kyalnVL/OAeblrb34ONwR/gP1JTryxh
 oC02mphyKksKAj/iMeU+jWOMKrBaqtgOL53YzqwSaJy1dyD5SAqi9/nAq+e0Flx6MGH+
 qbKdcFBIqNblPESKju0sMgH+GlxR6vGkYR4asC89iP0WajOAYcFhdHF+M+NQa3NJUEYl
 jzjaMOewkId6aJXitoSf2/0juKkFYJw1g8btvJmARtf8n4XC2r6mn1hDSTxb5JNEh6Qp
 4FSQ==
X-Gm-Message-State: AOAM5301j/awZyUvYsEZF+OS4ks9pqtvwuENCmlWIKoGAMpY8f8kHQew
 xQp/Ujvosa8dp1bPpE/kJFPfom7/KmqWo4ligvsWKg==
X-Google-Smtp-Source: ABdhPJw8sJCYpaUAsbOjcypwp/Ff4aLOKTXZbwjH6dYkn5H0t/CVK1z0o3BKXHPzJljcb6+WhGDFoBqLgrdewDELVjU=
X-Received: by 2002:a25:d8c3:0:b0:633:c81f:737d with SMTP id
 p186-20020a25d8c3000000b00633c81f737dmr27976614ybg.193.1648574628643; Tue, 29
 Mar 2022 10:23:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-5-marcandre.lureau@redhat.com>
 <CAFEAcA-g=XaURutqWd6okRHb3-pz3SegaxRMG5j2s+PThQHdGQ@mail.gmail.com>
 <fa67e24a-1e6c-a3b7-0db1-ea2be261dfa3@gmail.com>
In-Reply-To: <fa67e24a-1e6c-a3b7-0db1-ea2be261dfa3@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2022 17:23:34 +0000
Message-ID: <CAFEAcA-uqw8FmqkpMLJT9-hbdmWi+7L8Nq5JBpKc6_yK2G=W1Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] intc/exynos4210_gic: fix format-overflow warning
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 at 18:08, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 28/3/22 11:15, Peter Maydell wrote:
> > On Mon, 28 Mar 2022 at 09:48, <marcandre.lureau@redhat.com> wrote:
> >>
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >>   hw/intc/exynos4210_gic.c | 9 +++------
> >>   1 file changed, 3 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> >> index bc73d1f11524..5b6f4330a5f3 100644
> >> --- a/hw/intc/exynos4210_gic.c
> >> +++ b/hw/intc/exynos4210_gic.c
> >> @@ -289,10 +289,6 @@ static void exynos4210_gic_realize(DeviceState *d=
ev, Error **errp)
> >>       Object *obj =3D OBJECT(dev);
> >>       Exynos4210GicState *s =3D EXYNOS4210_GIC(obj);
> >>       SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> >> -    const char cpu_prefix[] =3D "exynos4210-gic-alias_cpu";
> >> -    const char dist_prefix[] =3D "exynos4210-gic-alias_dist";
> >> -    char cpu_alias_name[sizeof(cpu_prefix) + 3];
> >> -    char dist_alias_name[sizeof(cpu_prefix) + 3];
> >>       SysBusDevice *gicbusdev;
> >>       uint32_t n =3D s->num_cpu;
> >>       uint32_t i;
> >> @@ -322,8 +318,10 @@ static void exynos4210_gic_realize(DeviceState *d=
ev, Error **errp)
> >>        */
> >>       assert(n <=3D EXYNOS4210_NCPUS);
> >>       for (i =3D 0; i < n; i++) {
> >> +        g_autofree char *cpu_alias_name =3D g_strdup_printf("exynos42=
10-gic-alias_cpu%x", i);
> >> +        g_autofree char *dist_alias_name =3D g_strdup_printf("exynos4=
210-gic-alias_dist%x", i);
>
> Dubious '%x' format... Maybe change to '%u'?

Makes no difference given that EXYNOS4210_NCPUS is 2, but I guess so.

-- PMM

