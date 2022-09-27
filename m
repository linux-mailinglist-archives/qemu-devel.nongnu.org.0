Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A8A5EC619
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:30:37 +0200 (CEST)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBbY-0003UW-Hl
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odA4a-0005aV-Sc
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:52:37 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odA4Z-0007oY-6V
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:52:28 -0400
Received: by mail-ej1-x636.google.com with SMTP id dv25so20414435ejb.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=kSFqzC/V1l45rnKEH5dadxX/eM2BHVMT08IGxL0uEDI=;
 b=fT8nfoiIXvbm7rdk/Q/OGJjL+wBf2xgBPrPrAgI6dwX1joYSagOhXXpqMJlTMOXgGH
 iIki+4gQZJxF7yXqxCkYV4PQGTMCOL/zpDo45iyBX3ExYFhG5anHjMGlyu5itvQ9Ol+z
 ebMjQjfOnUwsS+AlqtGkSCdI/h4p+6jT1EGWTGKKBmQl2ol1pgDtv/BvYKE8x+ppoaj9
 7x90w+qGuJnjHm2nBVZzkq1O2+XddbLr4j/bo/nMUcd312QabCC0TbI26yAJYKCkwujB
 vmW3TJx9ozmm0qHLEWYS977Z49fcrq/fszLZ7iHoIq+u3LduWr+yOf9RuAYnC42Zi4d/
 QSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kSFqzC/V1l45rnKEH5dadxX/eM2BHVMT08IGxL0uEDI=;
 b=T7nGbJ/tdsIhDEe1gbIf3BmZ3RHJeN2QpYV7c9N9Of+2NWpVRn4sREt7FJU0KUPIyJ
 5AyPbGFewGhiGLmolh7dxggeP8J9Xbv1zfC4UXLN7js9ipJUYzINQD41oVQZa+ydflQn
 qCbUtzJVY0uasJYigGgKcYu8NgVpK11rM4Z6ep4aR8uCpq8yW/xVFpdjJp3e+4BZ0iBE
 sVtqLe/LT3n4BbcNpCnC3Shjftd2qSwCVR1d27s28pWx9baOdNir5huZIsUM4tb1fzaA
 3lrbtaJMx9afF8T9Xwt0n1k43jKYsK0V8VnWMq4A3dpHsLpcAf6vc/CmXmgBmEaixwx/
 8TUA==
X-Gm-Message-State: ACrzQf0oemM1UMapkbqF9xaMWudpsWPnMxiz2US6GPC70ZgP7kPa6Uek
 16OYmDfDO+iQyd0lnzP1XN9VyS1NLvFZB1VavkwVIA==
X-Google-Smtp-Source: AMsMyM4EbpsZ40C1KPklldLIEzt/T7eSnAyU8oOFfw7QorTV6hfLbvc01cnzYvt6kkHpyHJBKGVB6biuyoxjOiqUZOc=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr21933578ejb.609.1664283145630; Tue, 27
 Sep 2022 05:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220820141914.217399-1-tobias.roehmel@rwth-aachen.de>
 <20220820141914.217399-5-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20220820141914.217399-5-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 13:52:14 +0100
Message-ID: <CAFEAcA_WPA=eN51p8FEbXaiD6G=Yvn2jG4wiSt+Fj2YUoAcQ+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] target/arm: Make stage_2_format for cache
 attributes optional
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Aug 2022 at 15:19, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> The Cortex-R52 has a 2 stage MPU translation process but doesn't have the
> FEAT_S2FWB feature. This makes it neccessary to allow for the old cache
> attribut combination. This is facilitated by changing the control path
> of combine_cacheattrs instead of failing if the second cache attributes
> struct is not in that format.

I see what you mean but I think I would phrase it differently:

The v8R PMSAv8 has a two-stage MPU translation process, but, unlike
VMSAv8, the stage 2 attributes are in the same format as the stage 1
attributes (8-bit MAIR format). Rather than converting the MAIR
format to the format used for VMSA stage 2 (bits [5:2] of a VMSA
stage 2 descriptor) and then converting back to do the attribute
combination, allow combined_attrs_nofwb() to accept s2 attributes
that are already in the MAIR format.

We move the assert() to combined_attrs_fwb(), because that function
really does require a VMSA stage 2 attribute format. (We will never
get there for v8R, because PMSAv8 does not implement FEAT_S2FWB.)

> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/ptw.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 4d97a24808..8b037c1f55 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2108,7 +2108,11 @@ static uint8_t combined_attrs_nofwb(CPUARMState *e=
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
>
>      s1lo =3D extract32(s1.attrs, 0, 4);
>      s2lo =3D extract32(s2_mair_attrs, 0, 4);
> @@ -2166,6 +2170,8 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t at=
tr)
>  static uint8_t combined_attrs_fwb(CPUARMState *env,
>                                    ARMCacheAttrs s1, ARMCacheAttrs s2)
>  {
> +    assert(s2.is_s2_format && !s1.is_s2_format);
> +
>      switch (s2.attrs) {
>      case 7:
>          /* Use stage 1 attributes */
> @@ -2215,7 +2221,6 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState=
 *env,
>      ARMCacheAttrs ret;
>      bool tagged =3D false;
>
> -    assert(s2.is_s2_format && !s1.is_s2_format);
>      ret.is_s2_format =3D false;
>
>      if (s1.attrs =3D=3D 0xf0) {

With the commit message tweaks,

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

