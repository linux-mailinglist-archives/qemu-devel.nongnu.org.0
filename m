Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D073E43D17E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:14:22 +0200 (CEST)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoNR-0001gC-UI
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnb9-0004us-Ty
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:24:31 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <trini@konsulko.com>)
 id 1mfnb7-0007xk-LM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:24:26 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id gh1so2368602qvb.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i3PqeSwvORPW64N5rSRhRFy6u3dQ5OS0tfUXC1Z29YM=;
 b=ttAOoyZPEXTLoTTFvEC2JYuxqoNQzzjcJGqZ6abegplKBi7dOX90bGlIoNTGuifLpC
 gn/WhO/H/a41v187XtCL3vciGSNsvGE/o/F85XGFIrLyR9KvpgHgVY/VkmSlAidA8sGI
 fggulJL5LNiE9bQiCBP+u9coePqq8mlAAOuhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i3PqeSwvORPW64N5rSRhRFy6u3dQ5OS0tfUXC1Z29YM=;
 b=iSzRbho0wvuGYa2qn7RTZmJH1OsqPPcaBCjBsfoCVeGY4VzTxoruPImjPVeU4EoS9t
 KAFxppeYtPQVFdE1Bk8Vb6QpGwV3Tt8O6yVI73iuf6xq6NSHPA4zjm4iduwQm6dLaVHY
 e+1n4PFpQ8KNtsXkS3UV2+j8U2qK5O9fel1XF5qvKHj2rlSSD1E1EfxECLd765bORzT5
 Avaj3fId3I9HSdxtInP/qlJYWhkboQyjI1RBG+6LTwHFH4H92GjiF7+Go3XUqEP75ZnH
 xduNts6V3RndCig9eYFFm/nJ76WPE/qC2CBe4w4PoefRZtlU8+d/nhcROYeOFXAZpJsB
 RoMg==
X-Gm-Message-State: AOAM531dbYtqXChB8EESjCuXcWWoPeuykpcC1jOtoY5eSUwb1yGv2pr6
 dhZL4qGxkLkIymQSVC4JKJGYTw==
X-Google-Smtp-Source: ABdhPJyL4t82et49CruwxB//CA/mAy+CHt1WAZ8brVTW8FIYYRWKApIghSI/f9mMafvewDPizRXuFQ==
X-Received: by 2002:a05:6214:1d21:: with SMTP id
 f1mr20384209qvd.6.1635359063925; 
 Wed, 27 Oct 2021 11:24:23 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id x22sm545170qkp.103.2021.10.27.11.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:24:23 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:24:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
Message-ID: <20211027182421.GG8284@bill-the-cat>
References: <20211026002344.405160-1-sjg@chromium.org>
 <CAHFG_=WdKL-WcaNJxwqMRHBgVQZy9SRz11mYDKJifXEnQyQSXg@mail.gmail.com>
 <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NG5rUlMnWRrIcOiS"
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0MGr+2tcSziB8DWXZPmv6Q=9ecs_6RK=N20n3-XJiL5w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=trini@konsulko.com; helo=mail-qv1-xf2d.google.com
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Jerry Van Baren <vanbaren@cideas.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Alexander Graf <agraf@csgraf.de>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Matthias Brugger <mbrugger@suse.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NG5rUlMnWRrIcOiS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 08:08:19AM -0600, Simon Glass wrote:

[snip]
> But trying to do any driver / core work for a board where you don't
> have the devicetree is currently not possible. The devicetree is a
> core component and being unable to modify it is simply not practical.
> We are talking here about an option that can be enabled or disabled.
> In my case I am able to disable it locally and do my development work.

This certainly is an area where it's easier to work on arm32 platforms,
where we aren't getting the DT passed in, than arm64, where we almost
certainly are.

--=20
Tom

--NG5rUlMnWRrIcOiS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF5mVUACgkQFHw5/5Y0
tyyc0gv9F0z11YfEAGTfYBFUJxuS9gPwgw4pJhfuv/AEVqYspyg3H+tByYqJnG+I
KLV8SKMQyiEPRjvQ5KQgHdNjozJTweGZxiCINlUx3HVWBhfu+Nuq/IVnKdhtwWtS
1dsSb0njdziY2+K1xHHbZ4aa2B9/EyoDC9sctJyQPICpUnPrG5uM4zHKicbqzemq
JA8iICTyYJj089ZDu3TfkRNwElEHbC3CdOwstk3E06bFL0e8i4kXndxyqFfT7V/7
CI7mtTtkCQkWYYxv6T/VJdqJKXZ4Ejk1PZ8qT6S/8cVkY8R5xPQwNunKkJYq7P/q
7XukKZzPVbEXEI9rwdVqZQljiablfgqiLBAgwq3UHU35TdMBoFZKm94M9lzM+oJ3
lgRpaaz2e7MbAV3V7c1P8IXKVj9mkhFWnLvCVYgesHQmC2UlcJnVgiBK+TPoiYlw
JT+FeLuH25kPSTXz29OzV8G8CG2YfyvACdLcTgzqnjNZwkdryZr/qhko/OVUbrrA
nWU6N30v
=XLvc
-----END PGP SIGNATURE-----

--NG5rUlMnWRrIcOiS--

