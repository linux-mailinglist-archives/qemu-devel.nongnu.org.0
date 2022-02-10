Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806254B1352
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:44:46 +0100 (CET)
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICYn-0001vo-Jf
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAEp-0002Eq-S4
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:16:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nIAEm-00013i-LY
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644502551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2uHV7ca9C7ZzmTLALC4N4/LjpLEHKv8omVJYvPbh0IY=;
 b=RRLtbmipqcmUBYgcZS0/1ShHCwaupBrBqLL47wkd5hvHY5WUdTk+7ha1FjyGqyy/zdoAjQ
 xfbEowJIvG7BbzF2quSPNCSTSX19T8Fp3Bq9+pBttDHiKYVNV1QdB5eTpdb+gKEdDRPWRF
 ZQPewqlmlGAdJ7GRMRKi6j3LON6Ka3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-hBzXTxfePzm-dzlAaydzJw-1; Thu, 10 Feb 2022 09:15:50 -0500
X-MC-Unique: hBzXTxfePzm-dzlAaydzJw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 894D3802930;
 Thu, 10 Feb 2022 14:15:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75AC47DE56;
 Thu, 10 Feb 2022 14:14:28 +0000 (UTC)
Date: Thu, 10 Feb 2022 14:14:27 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 1/6] block/io.c: fix bdrv_child_cb_drained_begin
 invocations from a coroutine
Message-ID: <YgUdwwueaal86y3v@stefanha-x1.localdomain>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TQVbyvEXMzLFs4XR"
Content-Disposition: inline
In-Reply-To: <20220208153655.1251658-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--TQVbyvEXMzLFs4XR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:36:50AM -0500, Emanuele Giuseppe Esposito wrote:
> Using bdrv_do_drained_begin_quiesce() in bdrv_child_cb_drained_begin()
> is not a good idea: the callback might be called when running
> a drain in a coroutine, and bdrv_drained_begin_poll() does not
> handle that case, resulting in assertion failure.
>=20
> Instead, bdrv_do_drained_begin with no recursion and poll
> will accomplish the same thing (invoking bdrv_do_drained_begin_quiesce)
> but will firstly check if we are already in a coroutine, and exit
> from that via bdrv_co_yield_to_drain().
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block.c                  | 2 +-
>  block/io.c               | 7 ++++++-
>  include/block/block-io.h | 8 +++++---
>  3 files changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--TQVbyvEXMzLFs4XR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIFHcMACgkQnKSrs4Gr
c8g3HQf+L5c/ES9wONS5ajFDyBzeo7Q6M6IORvQNKRhQulmR8oc72PP3lUJOQSiJ
b6PiF5V+gcVLTdL68T9W2Kgh6pSsZk0+rsxQSk1oPWDkqi+AV/lWvfn2f2jbjuMP
fqPGNOjixv6Hbt+k4pw+SIBsdu96lRZOZd+46p5ioclxaSqukkOKNYKgFCV0iE6T
WB/9KoeAsH09G76D9hhIfhw9fySQQX1t8lA46SGHHlDmqdzPasFR/KpKnD02F65q
15Qe/3sMNyX1sTysjKRvZkVJYlLWjc8eFDk4OKQzh+KaHbzeJLCFZIkmz1KuMbVL
N7E6uQ5ZJQZj4hnNi5C3DQvVdyN8/Q==
=s29h
-----END PGP SIGNATURE-----

--TQVbyvEXMzLFs4XR--


