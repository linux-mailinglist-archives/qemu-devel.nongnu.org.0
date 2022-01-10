Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D1489788
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:33:01 +0100 (CET)
Received: from localhost ([::1]:48690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6sv6-0002vv-1m
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:33:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6soV-0004eW-4B
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:26:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n6soT-0005w4-H4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:26:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641813967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R9AkSbndyo5UVWPQsPMYd8N/14MoWkTFthwnkqtDWoM=;
 b=Rj5TgNZhCYOy7dn2uQ/URdj7HtckeQidTzNKQqd2ulb0rdCzg7jPfZXLdDNbLHZ6grOq5E
 GaWpk55kMbSnrOdHSi8y8qWU2Be0emyBuVIGHHDDb+gbEjg66jn3ONDFRJDLZKa0MqpVW8
 eGWVX9Fl0yIC68uKpDH/Pij01Dv2Swk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-bknd2FdhPkaZg0ilIP5ajg-1; Mon, 10 Jan 2022 06:26:03 -0500
X-MC-Unique: bknd2FdhPkaZg0ilIP5ajg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 819051898291;
 Mon, 10 Jan 2022 11:26:02 +0000 (UTC)
Received: from localhost (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 611502B4B1;
 Mon, 10 Jan 2022 11:25:32 +0000 (UTC)
Date: Mon, 10 Jan 2022 11:25:31 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v2 5/5] libvhost-user: handle removal of identical regions
Message-ID: <YdwXq06Zz+cXdaTZ@stefanha-x1.localdomain>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-6-raphael.norwitz@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220106064717.7477-6-raphael.norwitz@nutanix.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uBB4Hy0t/Ttpy34C"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--uBB4Hy0t/Ttpy34C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 06:47:36AM +0000, Raphael Norwitz wrote:
> Today if QEMU (or any other VMM) has sent multiple copies of the same
> region to a libvhost-user based backend and then attempts to remove the
> region, only one instance of the region will be removed, leaving stale
> copies of the region in dev->regions[].
>=20
> This change resolves this by having vu_rem_mem_reg() iterate through all
> regions in dev->regions[] and delete all matching regions.
>=20
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 26 ++++++++++++-----------
>  1 file changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--uBB4Hy0t/Ttpy34C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHcF6oACgkQnKSrs4Gr
c8gxIAgAkz4HV4ILPF6QQDrGE1sEasFPAkqekV798c8gg2KbNTlV+bI5MTTDsmNk
DqIjVInIBHY0d3SEsmWriWZqpLOLsdC1OlOEHtFYjcvZpMbTMQP12jbE5w1HdsMM
GFHN8hks/nqhEtj/HUCYdpdrxhMFYwQUvMdd7zAxsbzsAIOFor7+VRW3GHq/NQib
WgfWAF0k2899MP2FRBC1xgDcPPyMXllGNnzhxOAAjbOIAUnvBhHabfYZRMoc1F1r
Wvtj5NHreuNFhpQdFrirN1eWx9YDoD0mSUVWDD+ekjFrW+mjRQUBfjbhP83sIpd6
j5MVKIznVco6If666R5apFJniy8PMw==
=4S9M
-----END PGP SIGNATURE-----

--uBB4Hy0t/Ttpy34C--


