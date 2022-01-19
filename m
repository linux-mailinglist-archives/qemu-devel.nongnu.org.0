Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 600F0493F16
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:32:19 +0100 (CET)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEok-0003yF-GS
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:32:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nAEQX-0002YT-FZ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:07:19 -0500
Received: from [2a00:1450:4864:20::32d] (port=38872
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nAEQV-0005KV-Gb
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:07:16 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso8963437wmb.3
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zD0YBpWVOQguxgq7jcrT73XpdJIrNKm0e2CDo0nDZQQ=;
 b=Gg+OYtyg/bsjm76GbPrXFPV0eCtT5gWl4TiRSJRaVONly8J/rtgFKl3NiVk6yioXlW
 +VzupiqPvjppW1tD5VoVuo94qiQTJ0fw8krc+WJC5CXpIIuX3G5WYL+b9/4z6rgV17gR
 TsSkKaHWyl60zzZeops2s+zBZEuiJF7Etf5uCRl5ZgpVCLrWS/aYcqDAenCDoAHMguBX
 Re3RgAJs8+FDE1aBeCCsnbmF6TBCFGvtynTV/tyCKm/9oZVPl2eudQOCPVQqu5KZn48L
 u6d/jhP+wqFv7xWp6uNnt7mjyd7UgdBqEkQaYcSwxkCS5+nlpF3ShRrLYR8rdsUO45IJ
 6bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zD0YBpWVOQguxgq7jcrT73XpdJIrNKm0e2CDo0nDZQQ=;
 b=Eak7RdSlIW0xrMFqXcn0h205hhv+U2aFeMFrH84n3iEGOeVzQQgVC2qmYMAFB3ci1F
 Hmq/pX+IDqiLCCVMSZo6AFYc9eiCs4ANoKdNq5uIVMRIBu0aKJcoepSzRltbJwrKRZ42
 7Q3xw6iS92S1HZPI3k/Pm77VTvy5oBdo1mbn6POX85G3P8idpb7/rtrbHSPiIsega7rv
 NXTGUMmtmsfBVytJQfdAy9wUVZ0icj/pcMtKDa06nJby+X8OwfSvw4xZBOXgl3+9OTjm
 XAACvlFQ11ZtYz7v90H4EredG7dI+EkRKqouPPGKMkyR1wy6lKA8xl0QPdPLLugOXGwa
 V2lg==
X-Gm-Message-State: AOAM530eBeHNkPv8JSyjbKcykEOuXi6sILW50L4A9wDDKdlr15++h9Is
 EpAmKCrIqIjRCdh1fux27cw=
X-Google-Smtp-Source: ABdhPJz2JSVH9LAtkDbUdz4OeRs7geNJdd7sYsj34VWteF2Vb02dl+CgFMtRmFuwvqJ+Q5v/pAzsvg==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr2039260wrw.510.1642612032235; 
 Wed, 19 Jan 2022 09:07:12 -0800 (PST)
Received: from localhost (109.9.90.146.dyn.plus.net. [146.90.9.109])
 by smtp.gmail.com with ESMTPSA id o33sm11194550wms.3.2022.01.19.09.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 09:07:11 -0800 (PST)
Date: Wed, 19 Jan 2022 17:07:09 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH] drop libxml2 checks since libxml is not actually used
 (for parallels)
Message-ID: <YehFPYS3mMrgI1p2@stefanha-x1.localdomain>
References: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JgudJeX5xUFKxVvE"
Content-Disposition: inline
In-Reply-To: <20220119090423.149315-1-mjt@msgid.tls.msk.ru>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--JgudJeX5xUFKxVvE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 12:04:23PM +0300, Michael Tokarev wrote:
> [This is a trivial patch, but due to the number of files it touches
> I'm not using qemu-trivial@ route.]
>=20
> For a long time, we assumed that libxml2 is neecessary for parallels
> block format support (block/parallels*). However, this format actually
> does not use libxml. Since this is the only user of libxml2 in while
> qemu tree, we can drop all libxml2 checks and dependencies too.
>=20
> It is even more: --enable-parallels configure option was the only
> option which was silently ignored when it's (fake) dependency
> (libxml2) isn't installed.
>=20
> Drop all mentions of libxml2.
>=20
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  .cirrus.yml                                     | 1 -
>  .gitlab-ci.d/cirrus/freebsd-12.vars             | 2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars             | 2 +-
>  .gitlab-ci.d/cirrus/macos-11.vars               | 2 +-
>  .gitlab-ci.d/windows.yml                        | 2 --
>  block/meson.build                               | 3 +--
>  meson.build                                     | 6 ------
>  meson_options.txt                               | 2 --
>  scripts/ci/org.centos/stream/8/x86_64/configure | 1 -
>  scripts/coverity-scan/coverity-scan.docker      | 1 -
>  scripts/coverity-scan/run-coverity-scan         | 2 +-
>  tests/docker/dockerfiles/alpine.docker          | 1 -
>  tests/docker/dockerfiles/centos8.docker         | 1 -
>  tests/docker/dockerfiles/fedora.docker          | 1 -
>  tests/docker/dockerfiles/opensuse-leap.docker   | 1 -
>  tests/docker/dockerfiles/ubuntu1804.docker      | 1 -
>  tests/docker/dockerfiles/ubuntu2004.docker      | 1 -
>  17 files changed, 5 insertions(+), 25 deletions(-)

Nice cleanup.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JgudJeX5xUFKxVvE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHoRT0ACgkQnKSrs4Gr
c8iecgf+K3iV9F7txUxsTit6AEV0U6H2kurVzzdg5XNtv6Hc1VGOAEGAni5K0jJ2
4/SSndDkDZ+VAUGKcqim7Hx7/UOQr7Bd0Mfv3FszjKG3BO7nOHgHeD9xF9pk15BH
n0gCr/TvbfB5pqzrt+1l4+xApTAYVK8Ril54Z7CW65ns1gx6NrAA9oPFn/FPs7pl
20uqbER3KyJ180vZSDRyxL9xAvuKasYzKEs4RHGTmT77mrFHYatNqgBrYeWPMR2Y
gJiQ9FMEvtX/TLHHx+LiHrV0WmrIM/SNqP7HFKVB5KsiXpTltNjBcVKG9EbecMJs
TEM6zVs0iNTOeMa2naQp0BYyuy8npA==
=eduH
-----END PGP SIGNATURE-----

--JgudJeX5xUFKxVvE--

