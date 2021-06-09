Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7456B3A171F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 16:24:07 +0200 (CEST)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqz7m-0002Uj-F5
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 10:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lqz6h-0001Md-GK
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:22:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lqz6e-0006bp-Lb
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:22:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id l2so25732216wrw.6
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 07:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1IwoLoTOmpxNC3IUSZ/54v5NeHp4bXWFTcm6LYPhDu8=;
 b=sCt7xgnrFt1B3ggBBC17BjQcoy6jOOOXv7wSHp1OT7QDYQrd0AcEmvX0oKgEINxSjJ
 qqhJl1wZeEx9E3rswli2yvntUUXk5zGIv47PSWZr062kLDtsr2qaryKYW8rGXMVKU/4m
 eMSszzf2xvRabcw6TnTs2fi6cp3tS5mFrIYdpvO3uOitUw6B2Ea1J0rh1VKyKv8fkWLD
 0s8DR7K/o+VRcBdXI7lawCf19opxmVkxqh956fam7+aho7HvpvBsxOXUVn53zcWzQPD1
 bq5sWBYYVj9fq69UGm0otmxj/tudUfUz61MRBGglzxy4vsaOKXPLaKAQl181BhzK45ij
 J0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1IwoLoTOmpxNC3IUSZ/54v5NeHp4bXWFTcm6LYPhDu8=;
 b=LVG+nci6sbpHi/8YRO8zYYE1KWU+mLBLreWs0il+YzzgXTtcetrf99CiaSRE5z/tyB
 0qFxX7zQqswnLHs1Od4Jqpraoli4xKzGYPeuKy6CMrUCCZJWsBP9i1KxrdT/v9/mHvs8
 KcI8UJHEvq4KxcthEYncloOHJAL87jYYjjii/2aSfCqUoI/rQypjn+ZtMZHtpCzRKjpy
 j3G6Vneew4R8H44s7ciFxx/9NeSFn4xiIPwPdEtlL/QrZ50+3Ww10/o8VWVYOEETGTYv
 R5QL69khzfvzbIJVixKmBrz3LFCNV+AzyCyvxp9xUnk+dTTcYUucaGyxfaaorEF2qGu8
 tBgA==
X-Gm-Message-State: AOAM532Xg6J4C/j7ZX01oGn6EGBL3hGa+Hel0vHMk5+heGZ51nFekg/d
 NK+cq+u5BBs0lZurPKLrG8w=
X-Google-Smtp-Source: ABdhPJzDmmw/v/N6+EiaJk+/R4NUsGlo2jOtUovGxof10FrGKyAENCdToUtBaKBBv1kAfVftJxMk4Q==
X-Received: by 2002:a05:6000:1089:: with SMTP id
 y9mr56191wrw.412.1623248574253; 
 Wed, 09 Jun 2021 07:22:54 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id l16sm4572902wmq.28.2021.06.09.07.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 07:22:53 -0700 (PDT)
Date: Wed, 9 Jun 2021 15:22:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <YMDOu7JpA4liSHCg@stefanha-x1.localdomain>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RpAYOqC8R2AkYX95"
Content-Disposition: inline
In-Reply-To: <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=stefanha@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RpAYOqC8R2AkYX95
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 08:29:53AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 6/8/21 5:14 AM, Cleber Rosa wrote:
> Sponsors usually expect some advertising to thanks them, and often
> regular reports on how their resources are used, else they might not
> renew their offer. Who should care to keep the relationship with
> sponsors?

Most sponsors I've encountered did not ask for advertising. Either they
have an interest in test coverage because they ship QEMU to customers
or they provide resources to open source projects and leave all the
detail up to us (they don't need test reports).

But in any case it's easy to have a page on the wiki or website listing
sponsors.

There needs to be a point of contact. Someone who answers questions and
coordinates with sponsors.

Stefan

--RpAYOqC8R2AkYX95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDAzrsACgkQnKSrs4Gr
c8jw8ggAxXCNtcqDcYScP0PfofnTPRap+arBiPkv5hLEpvc0F1d15zjWp68tmAas
OiDfRTnSq9f17UeO6T/6W2Z5Z99ssiLZi6+1m04/8+m9VQEuZDuZYQFQRsZwtTSg
XqMExalZS6RDERUAX3YkLAwIsYNfyHk6DFgR4N68Y61yNX+DUBDkSPkaqIQ/vh6/
0AFFIQTvFywg/zM1F6t6gubqLJvSETL2om/NM2iu/tMr5HaQAerlGVbfUHP1P+Pc
/LsVBSX5cOmgC28rXWcH0m3EylchrvAzrTq8LvuaaQsyiyPEbVzIRQ/mCOolPQph
7Rf+ajeo8EWaTfiWGu+KROXKbe17Dg==
=mgb0
-----END PGP SIGNATURE-----

--RpAYOqC8R2AkYX95--

