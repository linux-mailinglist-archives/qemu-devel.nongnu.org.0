Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF0276FDB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 13:26:17 +0200 (CEST)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLPOC-0006Ha-Tr
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 07:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLPI5-0006R6-Ow
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 07:19:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kLPI4-00044t-0w
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 07:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600946394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aAY4HH0vLkFMVDa7/70urJ4jfZ+B/7TCwT5TQDTeqbo=;
 b=EN8IUmcDy/EsHOLVHjl/83KnZeyRGePKWE/DPbdayLOUKRLlu4s05+r1q9wVk/TOPdBSBm
 UWn4Ya5p8QmpnEBJZs2sqruayk0YghRmJXtWx7X77eYZ37wAHlT5JLsp7oiQj+kxQVYhI/
 CpODppv6ssOD+Vi48UEBANtC00CdktU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-pFgwJ8pFMR20AoPt5CXE0Q-1; Thu, 24 Sep 2020 07:19:51 -0400
X-MC-Unique: pFgwJ8pFMR20AoPt5CXE0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A51E10082EA;
 Thu, 24 Sep 2020 11:19:50 +0000 (UTC)
Received: from localhost (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9876F60CCC;
 Thu, 24 Sep 2020 11:19:49 +0000 (UTC)
Date: Thu, 24 Sep 2020 12:19:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v8 1/7] block: return error-code from bdrv_invalidate_cache
Message-ID: <20200924111948.GT62770@stefanha-x1.localdomain>
References: <20200915164411.20590-1-vsementsov@virtuozzo.com>
 <20200915164411.20590-2-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20200915164411.20590-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MET8MpPxp2u2c48q"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 crosa@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MET8MpPxp2u2c48q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2020 at 07:44:05PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> This is the only coroutine wrapper from block.c and block/io.c which
> doesn't return a value, so let's convert it to the common behavior, to
> simplify moving to generated coroutine wrappers in a further commit.
>=20
> Also, bdrv_invalidate_cache is a void function, returning error only
> through **errp parameter, which is considered to be bad practice, as
> it forces callers to define and propagate local_err variable, so
> conversion is good anyway.
>=20
> This patch leaves the conversion of .bdrv_co_invalidate_cache() driver
> callbacks and bdrv_invalidate_cache_all() for another day.
>=20
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  include/block/block.h |  2 +-
>  block.c               | 32 ++++++++++++++++++--------------
>  2 files changed, 19 insertions(+), 15 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--MET8MpPxp2u2c48q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl9sgNQACgkQnKSrs4Gr
c8is6gf8Dq+g+SdmHl+WQO8jLOo21zQu2avqOflYhxog5ksLCIrXHnnU9dus48/G
lXkeOzA7Bzp68zKe6tG/bIGwD447DSW25Kr6T1TWkD+OFs2Ro1OuzV0oE5fmJWNS
1uoioP4EEbxAN96ZNuVu2sLuItFiZlGQBKOMNoLKhLj0d46jynXDz3090KkF6u+R
sOZWQZ6+DOy6xh2fWJ7bLFn5qRg+0sfCg2SLDrmhpVpLVtawlyhYwRX4K7GNVhOk
sSaAbX0GnpST+4ZBttTpQfjw32S5PdgFqZ04ougWA6o5swpM63dchdBjmNKTtgD5
TVsScIhYwRTuMg34lZhvy8k+ilre4Q==
=2miv
-----END PGP SIGNATURE-----

--MET8MpPxp2u2c48q--


