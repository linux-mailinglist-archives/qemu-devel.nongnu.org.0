Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7389668604B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN66H-0004GG-0c; Wed, 01 Feb 2023 00:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN667-0004FU-IX; Wed, 01 Feb 2023 00:55:56 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN65x-00086b-VW; Wed, 01 Feb 2023 00:55:54 -0500
Received: by mail-lf1-x129.google.com with SMTP id j17so27704355lfr.3;
 Tue, 31 Jan 2023 21:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Me0V4ryWo4TJGqTg2ekzlN/c35e1c+tYe+k7RBitiNU=;
 b=VwJlwMReZngm/cBO0e3oAxZjSYW2yrv7CASKMP3SHKvMG/dj/LwDEau+Zf7bGvEXNr
 nqGOtjsKA0Mr3ep76nM3ULPWsPiY2hJYHmbaS8RzwQW8v8G78PcY1UCd69rjK7LRirWV
 R7bStcW03uJuW5I+Q8jB71e0l9zRBxFAUi0KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Me0V4ryWo4TJGqTg2ekzlN/c35e1c+tYe+k7RBitiNU=;
 b=thyQyEnqIjsyFrjh9aSJLoZhMWmBxPqhgj/sS1dlNaKxtzXB9Td2aGx4ojWIz0/1ZS
 KyifNy7tcGPgwF1L69647LebhVZ00GW/LCAe0C1MOZfobU4PYXV2v2hMOP9Y7aKGsIar
 iCPxD+tUIWSzSl1B+cJBs/hM6ukikMg/2kV6fA+258hey3Th3I+52NDFKsNZBJJxxZKt
 mYL4+wTy4tiXQxARuma+oV+k1R58sn/NQ4Hj9BArfklNjQybVNPsUOfwZ4B1orUCzFM0
 r9jtpqey9qe5XMyhvjlQSqFDb+rNiqh9GW4n6XRi1e+oV0hgZgjJdG9QK3mUTq/r3iRe
 0kYA==
X-Gm-Message-State: AO0yUKVuj1ofdbJuGiyraXsoVLl8kss7US09XwsH0ZLuUQ8C+QHjae0/
 QpRNHAZIy+A9MKLxC1+GTVq3v1L0lCzr35bsUcnUNJs1
X-Google-Smtp-Source: AK7set9YpP3uhysZOA496vVJ2ceuQgyTn/bIn7HpWL+AXnwo1Y0PplsFU+yLMOUmC6Y3r2lLFkmiyBk9AjqoBuFP+Bg=
X-Received: by 2002:a17:907:2391:b0:87f:5802:fd72 with SMTP id
 vf17-20020a170907239100b0087f5802fd72mr298381ejb.237.1675230462898; Tue, 31
 Jan 2023 21:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-7-clg@kaod.org>
In-Reply-To: <20230119123449.531826-7-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:47:29 +0000
Message-ID: <CACPK8XejKOcegJZGbWqOOwMnOWsdODOANsPDK9CgkqO5=VrKVQ@mail.gmail.com>
Subject: Re: [PATCH 06/25] tests/avocado/machine_aspeed.py: update buildroot
 tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=joel.stan@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 19 Jan 2023 at 12:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Use buildroot 2022.11 based images plus some customization :
>
>   - Linux version is bumped to 6.0.9 and kernel is built with a custom
>     config similar to what OpenBMC provides.
>   - U-Boot is switched to the one provided by OpenBMC for better support.
>   - defconfigs includes more target tools for dev.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  tests/avocado/machine_aspeed.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspe=
ed.py
> index 1fc385e1c8..773b1ff3a9 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -123,8 +123,8 @@ def test_arm_ast2500_evb_buildroot(self):
>          """
>
>          image_url =3D ('https://github.com/legoater/qemu-aspeed-boot/raw=
/master/'
> -                     'images/ast2500-evb/buildroot-2022.05/flash.img')
> -        image_hash =3D ('549db6e9d8cdaf4367af21c36385a68bb465779c18b5e37=
094fc7343decccd3f')
> +                     'images/ast2500-evb/buildroot-2022.11-2-g15d3648df9=
/flash.img')
> +        image_hash =3D ('f96d11db521fe7a2787745e9e391225deeeec3318ee0fc0=
7c8b799b8833dd474')
>          image_path =3D self.fetch_asset(image_url, asset_hash=3Dimage_ha=
sh,
>                                        algorithm=3D'sha256')
>
> @@ -151,8 +151,8 @@ def test_arm_ast2600_evb_buildroot(self):
>          """
>
>          image_url =3D ('https://github.com/legoater/qemu-aspeed-boot/raw=
/master/'
> -                     'images/ast2600-evb/buildroot-2022.05/flash.img')
> -        image_hash =3D ('6cc9e7d128fd4fa1fd01c883af67593cae8072c3239a0b8=
b6ace857f3538a92d')
> +                     'images/ast2600-evb/buildroot-2022.11-2-g15d3648df9=
/flash.img')
> +        image_hash =3D ('e598d86e5ea79671ca8b59212a326c911bc8bea728dec1a=
1f5390d717a28bb8b')
>          image_path =3D self.fetch_asset(image_url, asset_hash=3Dimage_ha=
sh,
>                                        algorithm=3D'sha256')
>
> --
> 2.39.0
>
>

