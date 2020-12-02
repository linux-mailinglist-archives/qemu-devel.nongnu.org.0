Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E802CBF76
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:23:03 +0100 (CET)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkT26-0000kv-Mc
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT0G-0007hJ-6h
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT0E-00035I-KP
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606918865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8hm++9p/dO5Ue2mwQMQs7lSZfEfxn+UNKwMKZbzbfkY=;
 b=XGJinBcQzS+r1KAYVExkwJ/8bHR8wsuwGkv9kEViFP3TyLRAVRXWv/c2vAJ3AnDLUZDjD6
 Z0ALLD6nbR+ppCz4YtWUqtdvCvjLAW0tSGF2kwcC1/UxxlYotAAQ92dKU57uJNRywZGSPL
 4finYXp749irg8XpYlPMoHXhAkmtj9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-xL4O4nXANDGDav1cOVaohA-1; Wed, 02 Dec 2020 09:21:03 -0500
X-MC-Unique: xL4O4nXANDGDav1cOVaohA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80A3A9CDA0
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 14:21:02 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B76F25D705;
 Wed,  2 Dec 2020 14:20:55 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:20:54 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 4/8] libvhost-user: drop qemu/osdep.h dependency
Message-ID: <20201202142054.GF655829@stefanha-x1.localdomain>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
 <20201125100640.366523-5-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201125100640.366523-5-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z0eOaCaDLjvTGF2l"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 02:06:36PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  contrib/libvhost-user/libvhost-user-glib.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/HosYACgkQnKSrs4Gr
c8gqIgf/UUFKApfpQS2vk7RgnPlVEAiOBrGI+nyko9nStX5MmXsQ+IWZvyRd6NGH
jvIbxQFo1I99LafmGJ4kjBB3UgdJno3UeDcv/OY/20TGwemI8TU070Y3qw6RHH81
fvfppNOxc5eHeJEOL4H7IVXe5xyhmBVKCpSDQS9YLlkNeMQI9DRV0GHYUxZ0RH2Z
URPZNwj3ho5Ah71e+RCn3kRkB6WR35yCezH6kgy7RmkxFjkokN5vy9w8eHCemjD4
WZsNR9bT4MiD0xl8+7vNG430PjRZMnq7MuxpHRKLczOYmMEv0yFQEKZpX5H7bf7V
6pBqHhhMry7gWcAOQB7S1DGnCpZTAA==
=mpjh
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--


