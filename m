Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A117BCD9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 13:35:45 +0100 (CET)
Received: from localhost ([::1]:35966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jACCf-0001GL-0z
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 07:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1jACBu-0000p3-0v
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 07:34:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1jACBs-00017f-Sr
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 07:34:57 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36128)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1jACBs-00015Z-K1
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 07:34:56 -0500
Received: by mail-wm1-x341.google.com with SMTP id i14so2209465wmb.1
 for <qemu-devel@nongnu.org>; Fri, 06 Mar 2020 04:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kUlsMwlmCQk4iHGg5lbNH7d38qWNbFdaW1hhlQuhgyw=;
 b=DxwEpsCVoKxGqtIG6dn/CF9p9v5ItRYT8MgQpOMTY9es/nxdJdCmqnaV42GpM0Ukj6
 u38OqRww4zYSsEcsREnlV81bVNdH38vUPFYI0ZvV/ofNEMuagHs5pNc5F3E9aDhjPcHw
 2WFW3tTCKQKB3EXfK1WoMEljC4XaJ2mDKnPeD4OtFYl++yIwwBpkQW4MzvZcfkXaZpjj
 hZgEYZpPeAk647PPyEUOMQOWB94iuxQ/lbYDbxvYRzYJ20JO90QIfs17YJbU3bS0b541
 tdJ+BIW88XtGJIA0YkoFm3d3PrCZN6Cm8f7XXYftkiLbCtcC58d7aClPK/KGIXO3+T8y
 dsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kUlsMwlmCQk4iHGg5lbNH7d38qWNbFdaW1hhlQuhgyw=;
 b=UvBfsLRMxX5EkJxc6vWfgOkEJcOMgs3Cmckp5PiKp0jZGjdXeSnFjIg0sMqXVP06Il
 ma57cSVE6qcBPuWRdCCGWtxA4H+3U+IJxS6aCk1dm1+gWezbGpTlHbf0BMysVyr2EtEn
 N6IJP0LSN3csUi861cubZQEP4aIogm6JUvNEHzWlWi0PnOcFxW4M8RTWR0Q89GPD5eeb
 +xpvo+00aXN7J/L62V+OuW1SVMZKZhrX1Bmdy5tuh0YrvD/G6AWpPrF9yqIWkysuiMmj
 bk0AtaMO9acTwpz8v0HXPfKQoK8tg1y+66+J6B06TgWoVqiFMi1nFqPJEHQQOW70v+sq
 Q1iw==
X-Gm-Message-State: ANhLgQ2uC29sT186HKlrUPzN8UakLdou8hOud/b3Wdsg0HiyS08gmN42
 I/FQ99KIXsVH2dVm11JsPBA=
X-Google-Smtp-Source: ADFU+vt/tcOlAMc201cQlHyrblMfnGCWcnPxtbuGNaq3VngOBs7jkj0Xn652GOvmTmR0CIOBmPOtrQ==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr1818834wmj.64.1583498095307; 
 Fri, 06 Mar 2020 04:34:55 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id w22sm14111605wmk.34.2020.03.06.04.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 04:34:54 -0800 (PST)
Date: Fri, 6 Mar 2020 12:34:53 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Sebastien Boeuf <sebastien.boeuf@intel.com>
Subject: Re: [PATCH v2] docs: Update vhost-user spec regarding backend
 program conventions
Message-ID: <20200306123453.GI1335569@stefanha-x1.localdomain>
References: <20200224182454.24610-1-sebastien.boeuf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LYw3s/afESlflPpp"
Content-Disposition: inline
In-Reply-To: <20200224182454.24610-1-sebastien.boeuf@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: marcandre.lureau@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LYw3s/afESlflPpp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 07:24:54PM +0100, Sebastien Boeuf wrote:
> The vhost-user specification is not clearly stating the expected
> behavior from a backend program whenever the client disconnects.
>=20
> This patch addresses the issue by defining the default behavior and
> proposing an alternative through a command line option.
>=20
> By default, a backend program will terminate whenever the client
> disconnects, unless told otherwise through the newly introduced
> option --keep-listening.
>=20
> Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/interop/vhost-user.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Perhaps --keep-listening should be optional?

If the maintainers are happy with the patch as is then so am I:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--LYw3s/afESlflPpp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5iQ20ACgkQnKSrs4Gr
c8g0yQgAnpZI0JILRPH9+fTmLy3LF3D7EOQJlKS/pIAupAktq2w7O9swDtxXMVTm
WuDM++AzuNNZJl85z9mYUqC+Ls6Uys5lu3h9uxRqfknF5eQOtZ4ufFCMjtpWxyY5
nLnqEtDKU7Pz7Nkhf/AazZsSvPxe/51MFeEE4By+gzV+7bU/Sp9FAlOpgo6yGzIP
tF+fSO1ngPTdWay6CSy1lt+We50Fsx8s14oDUYce/9EGZOqIXPTdzaHbEW64/8XM
uPCfQZYbMNriIY6AndNRy8XyItrLRUza8JjhLpNwX7EtPDevtcoozZHd3jvL3apQ
1lY/HSWQN+jZGiouQ+aVk2E0s7D/uA==
=qyNc
-----END PGP SIGNATURE-----

--LYw3s/afESlflPpp--

