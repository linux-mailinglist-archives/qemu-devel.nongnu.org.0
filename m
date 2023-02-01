Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA0686061
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:13:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN65k-0004EK-Ex; Wed, 01 Feb 2023 00:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN65e-0004DL-RM; Wed, 01 Feb 2023 00:55:27 -0500
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pN65H-0007po-P9; Wed, 01 Feb 2023 00:55:24 -0500
Received: by mail-lf1-f53.google.com with SMTP id br9so27679402lfb.4;
 Tue, 31 Jan 2023 21:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jy/3VJ6ByaKePTJMPfX1Sbdhsb/WD/wHU4m5TmHIZuA=;
 b=g8ZG3G9ww4bsLRBoSuRUHnUi66Wim24bMtekKBBQlOWajzy8Ut541qHdlvQZGjr1Eh
 pbBFokKR2d8s3vlRhLNgsh/TplRclcgnrMTqYttxVxxo2SBdaGPisR0LzXpcxSfm+RXa
 O3bUKJNOiDydrEX4fs0TDFaSRxor4/C70jGrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jy/3VJ6ByaKePTJMPfX1Sbdhsb/WD/wHU4m5TmHIZuA=;
 b=jZycGauSNpXVZz8Dfh11/+H/zGv43uRxauaaPTw5Tsq8/RhlrnBcMboxxEZA3HmkiO
 9BsJrZP0EFILND6JxNXAmvnpTxW/c6myOYxegN7sAYq7Pj6TXp7ht4QlADjElahVOOm1
 gTNNd0yylBDCZ7S11Y4R7ldx+oIVDggnYP1cgyveKvb3ADEJZJy8Qzm32rKdsQzT11mX
 CTNLiMnVD4L+5Ua2VjTBAWJ9+mGVFBUMptWq99Vn9sBtD4Ka471xiXGgvXt4aPGqKXBh
 MnzIAMk6gElW01NMZG/xau3eoIRgBu8gB2a2/mJ2nMyXwA7y/2UArvb83GfAU0I9KLZ7
 O1WA==
X-Gm-Message-State: AO0yUKXiHGy2jfOdR2mCaFMEsVMKtgImgt8S2kGc9MBygTRITfWF0YSD
 CZkdiGdA13PkmO4QYpn9NUsysyTfnQKihDY+yC6o4C/H
X-Google-Smtp-Source: AK7set8SWXiXCQOsLyUyDmp+WJzZDGFJkVyPw9WkFNLykRR7qOPDMdqP4JTwWm/+0e13KNkDt/jBny/wtt2C1Ujaj8w=
X-Received: by 2002:a17:907:204c:b0:885:2313:c8b5 with SMTP id
 pg12-20020a170907204c00b008852313c8b5mr285788ejb.201.1675230416722; Tue, 31
 Jan 2023 21:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-5-clg@kaod.org>
In-Reply-To: <20230119123449.531826-5-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Feb 2023 05:46:44 +0000
Message-ID: <CACPK8XccDp8gJW93rVqKOkutBqqBkd+km0ZGGBtsnuUWMVEC_A@mail.gmail.com>
Subject: Re: [PATCH 04/25] avocado/boot_linux_console.py: Update ast2600 test
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.53; envelope-from=joel.stan@gmail.com;
 helo=mail-lf1-f53.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, 19 Jan 2023 at 12:35, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> Update the test_arm_ast2600_debian test to
>
>  - the latest Debian kernel

Would you like a newer version of this patch that uses the latest kernel?

>  - use the Rainier machine instead of Tacoma
>
> Both of which contains support for more hardware and thus exercises more
> of the hardware Qemu models.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Message-Id: <20220607011938.1676459-1-joel@jms.id.au>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  tests/avocado/boot_linux_console.py | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_lin=
ux_console.py
> index 8c1d981586..f3a1d00be9 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -1098,18 +1098,18 @@ def test_arm_vexpressa9(self):
>      def test_arm_ast2600_debian(self):
>          """
>          :avocado: tags=3Darch:arm
> -        :avocado: tags=3Dmachine:tacoma-bmc
> +        :avocado: tags=3Dmachine:rainier-bmc
>          """
>          deb_url =3D ('http://snapshot.debian.org/archive/debian/'
> -                   '20210302T203551Z/'
> +                   '20220606T211338Z/'
>                     'pool/main/l/linux/'
> -                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
> -        deb_hash =3D 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f6=
18cb8976f1e09e'
> +                   'linux-image-5.17.0-2-armmp_5.17.6-1%2Bb1_armhf.deb')
> +        deb_hash =3D '8acb2b4439faedc2f3ed4bdb2847ad4f6e0491f73debaeb7f6=
60c8abe4dcdc0e'
>          deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash,
>                                      algorithm=3D'sha256')
> -        kernel_path =3D self.extract_from_deb(deb_path, '/boot/vmlinuz-5=
.10.0-3-armmp')
> +        kernel_path =3D self.extract_from_deb(deb_path, '/boot/vmlinuz-5=
.17.0-2-armmp')
>          dtb_path =3D self.extract_from_deb(deb_path,
> -                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-taco=
ma.dtb')
> +                '/usr/lib/linux-image-5.17.0-2-armmp/aspeed-bmc-ibm-rain=
ier.dtb')
>
>          self.vm.set_console()
>          self.vm.add_args('-kernel', kernel_path,
> --
> 2.39.0
>

