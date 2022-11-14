Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52878628E6D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:32:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouik0-0004iD-MU; Mon, 14 Nov 2022 18:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouieh-00025D-DV
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:19 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oud2C-0005ij-Cc
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 12:14:15 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y203so11616698pfb.4
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 09:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJ9l+d1aRgpOMO2nAcnnCUv3qIZRS/gsAPq+8z7qaeo=;
 b=A3RFZPrfUSaZ9DyJfQdx1hDKzQ1/iLSPk22NxNWf8aNhxhe+vbnUj4otzlqBpx/G/n
 hXsvxeCG4KpYYVkhj78HCUmzGS0KoxyBf6x1CMxBSa7g2iAGWL3hxpETfz4ohTyoYn03
 SdM8TGIuFWRGyVgbjpWjy6NqSiRhXQv0Uf4WgE9xU/ayqHfn5Fy284wpnSc4dn0+l1VH
 UQVcn6Q0MTEbpVWAn+tEded02khb6TBg7Jk482L3QL9I42fXeh/MzcljxJ/povl7mq+u
 WpCHECcyyHPi4x1NnEWzrHQqA3mzzQHn1YkxO6ExvMm/FMbYXyx8j61Cm/Y2lxEXd0Za
 Q5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJ9l+d1aRgpOMO2nAcnnCUv3qIZRS/gsAPq+8z7qaeo=;
 b=Tzo3AkwcbSZhQT7ZpZmVE0AvNsPN/2BO0GS+XvGpcL32XU8Gf07sRk69hQtWB44zkc
 JbSLfUFct+ZBDZpiryfrw8nq68UIvsBYpYCfHqG+AlYwDAXN7D4cDvvr/bP+z48yoL+o
 2+MV+IHQenTQg7ZuXJLfaSUtq8bYnL1LNomxEqMvJIY23/jES+D0PZJxE71majtzY0y/
 +gOq26tX3Ef2DacKsXwje/NiKN7C/TQDoup32PbAR5maWD9ivV7sQlO918ZptwrqosN7
 dwirvr5YssYT3v8EaiOjt1lNHdbpPj/zi+eBBegGfThwmB9D/550vB9EtAq4Ir24gNqf
 Ld1w==
X-Gm-Message-State: ANoB5pm18owN5WbTTqn52nM0Ah7I4f7OvfzY75NVur4fsByiJzV2vnYP
 PBx9yzZFy1sJ39E+uHhHFvNgmu++x8hfNVdyEgAE8A==
X-Google-Smtp-Source: AA0mqf5vnljD9uiOANznwIhxnS080lLpcTvysbEg+liJ4Pw/MowsI2r5mg6r6/FpYCUH0Gr2c3YohkBJtR0dN+X54eE=
X-Received: by 2002:a05:6a00:4199:b0:56b:bb06:7dd5 with SMTP id
 ca25-20020a056a00419900b0056bbb067dd5mr14921916pfb.3.1668446050270; Mon, 14
 Nov 2022 09:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-4-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221023153659.121138-4-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 17:13:59 +0000
Message-ID: <CAFEAcA_H30n-BSL6eKpCOHmOqGA6Gd+7Nz8D4acfmG_vPXV3WQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] target/arm: Make stage_2_format for cache
 attributes optional
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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

On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> The v8R PMSAv8 has a two-stage MPU translation process, but, unlike
> VMSAv8, the stage 2 attributes are in the same format as the stage 1
> attributes (8-bit MAIR format). Rather than converting the MAIR
> format to the format used for VMSA stage 2 (bits [5:2] of a VMSA
> stage 2 descriptor) and then converting back to do the attribute
> combination, allow combined_attrs_nofwb() to accept s2 attributes
> that are already in the MAIR format.
>
> We move the assert() to combined_attrs_fwb(), because that function
> really does require a VMSA stage 2 attribute format. (We will never
> get there for v8R, because PMSAv8 does not implement FEAT_S2FWB.)
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/ptw.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 2ddfc028ab..db50715fa7 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2105,7 +2105,11 @@ static uint8_t combined_attrs_nofwb(CPUARMState *e=
nv,
>  {
>      uint8_t s1lo, s2lo, s1hi, s2hi, s2_mair_attrs, ret_attrs;
>
> -    s2_mair_attrs =3D convert_stage2_attrs(env, s2.attrs);
> +    if (s2.is_s2_format) {
> +        s2_mair_attrs =3D convert_stage2_attrs(env, s2.attrs);
> +    } else {
> +        s2_mair_attrs =3D s2.attrs;
> +    }

You'll find when you next rebase that this needs adjustment,
because after a recent refactoring, this function no longer gets
passed the env but instead is passed the effective HCR_EL2 value.

>
>      s1lo =3D extract32(s1.attrs, 0, 4);
>      s2lo =3D extract32(s2_mair_attrs, 0, 4);
> @@ -2163,6 +2167,8 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t at=
tr)
>  static uint8_t combined_attrs_fwb(CPUARMState *env,
>                                    ARMCacheAttrs s1, ARMCacheAttrs s2)
>  {
> +    assert(s2.is_s2_format && !s1.is_s2_format);
> +
>      switch (s2.attrs) {
>      case 7:
>          /* Use stage 1 attributes */
> @@ -2212,7 +2218,6 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState=
 *env,
>      ARMCacheAttrs ret;
>      bool tagged =3D false;
>
> -    assert(s2.is_s2_format && !s1.is_s2_format);

I think we should still assert(!s1.is_s2_format) here.

>      ret.is_s2_format =3D false;
>
>      if (s1.attrs =3D=3D 0xf0) {
> --
> 2.34.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

