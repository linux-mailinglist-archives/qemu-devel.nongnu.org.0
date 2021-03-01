Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12388328AA2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:21:04 +0100 (CET)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGnAF-0001Mh-2h
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGn8i-0000q9-5l
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:19:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lGn8f-0002wq-UO
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614622762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSt+8RrLCm2xkS5Sd6syvpA2asSyqw/PpjxpBRFpLkg=;
 b=i1/6edlUeiM9dR75MYTb1F8i380ERnP3x+FL1PsxHLrp9Bzoo8BYwsZf8cq0oZC+995XjH
 vSyV3378T6F/WmyFqnPT/VPaUg3K9loO6Es3/XbuIfpGnoSTqU9Cy4kcPDktEqLC3/T8zK
 LnSCkZjfwVnbqXqoDGzfEcw/0w3xWOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-l7xnz2MdMvCG424A5ID-tg-1; Mon, 01 Mar 2021 13:19:21 -0500
X-MC-Unique: l7xnz2MdMvCG424A5ID-tg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1218A835E24;
 Mon,  1 Mar 2021 18:19:20 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7F3C10013D7;
 Mon,  1 Mar 2021 18:19:19 +0000 (UTC)
Date: Mon, 1 Mar 2021 18:19:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] docs: show how to spawn qemu-storage-daemon with
 fd passing
Message-ID: <YD0wJhKgAg19Y8+1@stefanha-x1.localdomain>
References: <20210301171107.134100-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301171107.134100-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gN8JGcTIYxEBBm/1"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gN8JGcTIYxEBBm/1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 01, 2021 at 05:11:05PM +0000, Stefan Hajnoczi wrote:
> Add an example of how to spawn qemu-storage-daemon with fd passing. This
> approach eliminates the need to busy wait for the QMP, NBD, or vhost-user
> socket to become available.
>=20
> v2:
>  * Use /var/run/qmp.sock instead of /tmp/qmp-$PID.sock to prevent securit=
y
>    issues with world-writeable directories [Rich, Daniel]
>  * Add Patch 2 to fix insecure examples in the documentation [Rich, Danie=
l]
>=20
> Stefan Hajnoczi (2):
>   docs: show how to spawn qemu-storage-daemon with fd passing
>   docs: replace insecure /tmp examples in qsd docs
>=20
>  docs/tools/qemu-storage-daemon.rst | 44 ++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 5 deletions(-)

Obsoleted by v3.

Stefan

--gN8JGcTIYxEBBm/1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA9MCYACgkQnKSrs4Gr
c8hzrwf/cMB9jZBjk4kh2ZJgDZbB9R5Acsch8LUUqc+GTm9Gr47DtMTrHKL1g0MQ
MMYn6ToMFWL4D6YgQgSANIwwc0DJaf0l8iDaLpoCXHdXHSa3h/o4iUuoTDRL29h8
F5srKMv4uwQml9K3HuO9RQQ+XnrqJTcFgkw81b6VCm2SLUntx3Hy2UwCY5Aw+0+L
8eSBzEOnKu6qxdJwPd9sumgPnl0BDimTIgJgTnta6gbHL6OUIyD7+BdawC7VpjF0
JBNYL6Bs3ZvHkmad7gqrTFOGVgSeYBVR5o+g6A5lsSpZdjqYH7NIN+zfY+xyCc1J
jrdeyyn8OoVf2RFRAhlYePGvKGyo+g==
=87NE
-----END PGP SIGNATURE-----

--gN8JGcTIYxEBBm/1--


