Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659F534C65
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:17:16 +0200 (CEST)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9cJ-0006Gt-6c
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9BC-0000RN-To
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nu9BA-0004uc-GG
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653554951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3O3T/Og3aDdxLxZkBuCgajBnMz0PDBvz3bLux7BcqC0=;
 b=XTBS3QBaGLWmvYbvkV8/IjKMZDn8QRKFLYRoceIpFRdlcxpORENdMlIJrqmrLB3mcIu9WT
 nJQGe1fkJeeow5nH2K+2sH34xBlWqrUJT2jp5juX25GMkPOjBIiddT38Jmee57/qDWcxoG
 6h1A33ySw3jCnjc29wbTNSQBQN1EF+E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-us8qgKG8OPmtUwns0ZjWBw-1; Thu, 26 May 2022 04:49:07 -0400
X-MC-Unique: us8qgKG8OPmtUwns0ZjWBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E59C53C02195;
 Thu, 26 May 2022 08:49:05 +0000 (UTC)
Received: from localhost (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F4AAC15E71;
 Thu, 26 May 2022 08:49:04 +0000 (UTC)
Date: Thu, 26 May 2022 09:49:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 03/10] block: Make bdrv_{pread,pwrite}() return 0 on
 success
Message-ID: <Yo8+/7yXkXaWRlC2@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-4-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lYgEbzkKX6rubSWd"
Content-Disposition: inline
In-Reply-To: <20220519144841.784780-4-afaria@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--lYgEbzkKX6rubSWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 03:48:33PM +0100, Alberto Faria wrote:
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 5493e6b847..d5a1e8bc43 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -113,7 +113,7 @@ static ssize_t qcow2_crypto_hdr_read_func(QCryptoBloc=
k *block, size_t offset,
>          error_setg_errno(errp, -ret, "Could not read encryption header");
>          return -1;
>      }
> -    return ret;
> +    return buflen;
>  }
> =20
> =20
> @@ -174,7 +174,7 @@ static ssize_t qcow2_crypto_hdr_write_func(QCryptoBlo=
ck *block, size_t offset,
>          error_setg_errno(errp, -ret, "Could not read encryption header");
>          return -1;
>      }
> -    return ret;
> +    return buflen;
>  }

I think block/crypto.c's read_func and write_func could be converted to
0 (success) and -errno (failure) in the same way. Callers don't handle
cases where the return value !=3D buflen or failure.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--lYgEbzkKX6rubSWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKPPv8ACgkQnKSrs4Gr
c8iM4gf/Rnxna553o2KyK+D9WgUnnUAQZZ9c/6rp99H6TWsSgWDY29LKOhN1oO0J
I73PWzdqloE+LPhne2wH9zxPAPRZTVe1BomhYZWhpy5f9FGjmkCkO8rusfNioILZ
7TwGJJnHzfqpi7+cEJgJir2oqTWpwzIrXaDuJvVszF6KBOAs3DBi51kVbwl6CpTF
A3SFbTDt/pE5q122AT2X/DXifLvRq+zIoa7Di4m8baD7ReoMKwJEzjaO2vMkseGP
TN1ta18JYgM1OBDsDENkYRqOFOM8cE//17Ap8MJ0Q1WxMgfcxNIboC0sSx5a8sgg
ZpP3QcdQz/dzoP7Twga/dp9MsUQ0EA==
=D7Ps
-----END PGP SIGNATURE-----

--lYgEbzkKX6rubSWd--


