Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB3E403C43
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:07:10 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzAL-0006qw-OA
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNz86-0005T7-Ch
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:04:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNz84-0002zn-Qt
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631113485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qe+Fvox/Y6hysJn2de5feHP0lwIaNK4c3YlaHGiqSzo=;
 b=ZUpiuQtwXWQZ64sOS5oBr25gu/f1aIANAIJZVNgR6LM4oBK8nVzUd+qEmNAy8ZKDQvm3Ho
 CelAtcKoYp7eLz7cpkPSigSYL9Zq6T0B/61wk2DjOZP565WIoXxmHOUrmIv91/Sg+Ix9pZ
 USmqGDdBIrcIIsYpltl0HebYVFtJAzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-A_p2xqGhMYi2DTfn-CHF0w-1; Wed, 08 Sep 2021 11:04:44 -0400
X-MC-Unique: A_p2xqGhMYi2DTfn-CHF0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BAFB111ED65
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 15:04:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB6A87F0C8;
 Wed,  8 Sep 2021 15:04:08 +0000 (UTC)
Date: Wed, 8 Sep 2021 16:04:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 0/2] iothread: cleanup after adding a new parameter to
 IOThread
Message-ID: <YTjQ5yT+q6FL3F5J@stefanha-x1.localdomain>
References: <20210727145936.147032-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210727145936.147032-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZrP/KZ05g7MT6yyx"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ZrP/KZ05g7MT6yyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 04:59:34PM +0200, Stefano Garzarella wrote:
> We recently added a new parameter (aio-max-batch) to IOThread.
> This series cleans up the code a bit, no functional changes.
>=20
> Stefano Garzarella (2):
>   iothread: rename PollParamInfo to IOThreadParamInfo
>   iothread: use IOThreadParamInfo in iothread_[set|get]_param()
>=20
>  iothread.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> --=20
> 2.31.1
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--ZrP/KZ05g7MT6yyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE40OcACgkQnKSrs4Gr
c8gjHAgAqoFz8TTlsW4Ed+Kap0c35SOXtCETXN8KwXeg6fVwnw02oYgfzdy6C1ON
3OZm1MTOtZk8425IAI0t2n5WVw6dm56YwlLSvEP4LVlraIIbUH44RFO7g4vP1ZSo
6mIrG3Ii//SF/+D3U+T2KnjCd/5ZzH9XojVQA6I4AitWHQgovuioxa2qbN+AYTKf
JxwlVGG0R1OmSPGJMIiJ6IsgsvpX8fiEaMEjcIms5retA/3VQMbnHVktQwBr8z9i
O158wMy9KoKtMpeOPlfjuh+fRFQflsTTz60uPqilXYTvgPw62tQcXZPItv0vxckV
+AysksBfuFeTelYpRLyUZxEyy/M4lQ==
=vcPr
-----END PGP SIGNATURE-----

--ZrP/KZ05g7MT6yyx--


