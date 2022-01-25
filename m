Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD0649B771
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:18:48 +0100 (CET)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNap-0006IW-Co
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:18:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCNWH-0003Ij-CU
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:14:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCNWE-000774-Lc
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643123641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yg00PNfcumK5FF3EbIyhsG10qDyuLwzPXMaEAo61EOk=;
 b=QItc5mzW+Haww6UOz4hVPSDFMA3S0iddXvp2TwmyF0fq1YWYwLTYw87x2G3wgKFYfL4qTx
 LLEXzErKmH9daPZxUVBxgN1pkAsVOapnvRLSTLMA7HxuL1BEMMm7f4eoeMfIJe9TgOD2PV
 gjEJXF+xlcU9t4zvn9+XZ3uTNRKqhAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-aXX0MhWPMbiB_CMgpHQ-CA-1; Tue, 25 Jan 2022 10:13:58 -0500
X-MC-Unique: aXX0MhWPMbiB_CMgpHQ-CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54B63835B50;
 Tue, 25 Jan 2022 15:13:55 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C51287BB4E;
 Tue, 25 Jan 2022 15:13:54 +0000 (UTC)
Date: Tue, 25 Jan 2022 15:13:53 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 13/18] vfio-user: handle PCI config space accesses
Message-ID: <YfATsShK4BH7sMB8@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <173c5b40a781d2b1b604bbd169c0989a8e35753b.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jd+UVW94Vwe6Wp8K"
Content-Disposition: inline
In-Reply-To: <173c5b40a781d2b1b604bbd169c0989a8e35753b.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--jd+UVW94Vwe6Wp8K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:42:02PM -0500, Jagannathan Raman wrote:
> Define and register handlers for PCI config space accesses
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 45 +++++++++++++++++++++++++++++++++++++++
>  hw/remote/trace-events    |  2 ++
>  2 files changed, 47 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--jd+UVW94Vwe6Wp8K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHwE7EACgkQnKSrs4Gr
c8gzYQgAu4/D9TeR7S+lLIWuJQrMrB9y9KSbKbm6XZGkxfCPYB22t6I/ZNcTR7Qw
OE//Polw18LQfGVIG4rh/4iAkQ062Niu+uHmfhA8Py+zGvqbsOIkdQkBhrhG4i04
8z/S6GfmNdMg9nKaTuvHU8rbq7QM2BV8Pg7fgecuSnSjrtrff2E+yCnl7c7U/2/+
bnWXJ35eFJaIa/6ff7Crj5FcQwMxLmTWkfmc3TU3kPJ6xdGrdwF+bLv+E/lkf9XX
p0/jHbJvjWMO8nWw4H7dACZKmbM9jYJ0jnjLyeVJhrZufr1xPlQaYpjln8HKFrFp
3O8OPs3qR9GWojYdZ08wO/PY0+Zv/Q==
=XpWn
-----END PGP SIGNATURE-----

--jd+UVW94Vwe6Wp8K--


