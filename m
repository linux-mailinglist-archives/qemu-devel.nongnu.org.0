Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F258C35168A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 18:01:34 +0200 (CEST)
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRzlF-00025E-Pj
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 12:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRziM-00016g-1y
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:58:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lRziK-0003Rj-E4
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 11:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617292711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z7fZ4mYX1xdJq1wWIUc9WlU1JGFzAzZy/nl7j2FVC1U=;
 b=MaGflkDqC1Qo4+PBwcuAdeKvWHtjonDEqwR0zSPeFgKyVXtXZ2UPVUOKvjYYVNz6C2YexR
 l8e0G+/gZQl11ObXXt/s0cY3mJeJ7lRYPIVKvSJo8ncK5csNEK6wmtDXhiXRT7CX05aorH
 pn7IXPTi3PMHBWucnAna0kouu6ZEofY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-_N8QtG5kNiGWThDYOfX2cg-1; Thu, 01 Apr 2021 11:58:26 -0400
X-MC-Unique: _N8QtG5kNiGWThDYOfX2cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43BFF8189C8;
 Thu,  1 Apr 2021 15:58:25 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B99396F130;
 Thu,  1 Apr 2021 15:58:24 +0000 (UTC)
Date: Thu, 1 Apr 2021 16:58:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v3 2/2] block: Add backend_defaults property
Message-ID: <YGXtn1Jdp+Kju1tq@stefanha-x1.localdomain>
References: <20210310153916.64256-1-akihiko.odaki@gmail.com>
 <20210310153916.64256-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210310153916.64256-2-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hlKAtftNIgAp2zKm"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Konstantin Nazarov <mail@knazarov.com>,
 John Snow <jsnow@redhat.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--hlKAtftNIgAp2zKm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 12:39:16AM +0900, Akihiko Odaki wrote:
> backend_defaults property allow users to control if default block
> properties should be decided with backend information.
>=20
> If it is off, any backend information will be discarded, which is
> suitable if you plan to perform live migration to a different disk backen=
d.
>=20
> If it is on, a block device may utilize backend information more
> aggressively.
>=20
> By default, it is auto, which uses backend information from physical
> devices and ignores one from file. It is consistent with the older
> versions, and should be aligned with the user expectation that a file
> backend is more independent of host than a physical device backend.

Can BlockLimits pdiscard_alignment and opt_transfer be used instead of
adding discard_granularity and opt_io fields to BlockSizes? They seem to
do the same thing except the QEMU block layer currently uses BlockLimits
values internally to ensure that requests are suitable for the host
device.

--hlKAtftNIgAp2zKm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBl7Z8ACgkQnKSrs4Gr
c8jfHQgAttgkBCVaOgpimuUOQ2AYHimDpaEOWtgqYrrLHKwnHTXX1SdR/UBZGX+I
ClSomVcrH62WWkWUO+Kv2CsDzp0yVVBaDdrFobEriIVYjMha/JtRtkkD84Ca1r9Z
6ojDCi+LJaInN3TIyySw08NgM8EQf3urA+AtDSghOt9H4uItswz0vdojSllTv8nY
4DeT4W+icH71nhBnmWLnNVHkVsJbb8zbDVKY683WFilpw+IL2E+aK+gmRu8VJ/Q8
toyEx/qC1iF2WVXBrZvKokwvsHbar4k1/fc5wLze4yDMaR5vsKZ1/qJSBOHVAoJC
V1reAmvjVei5hrHkthmk4ku3M35ICA==
=0KoV
-----END PGP SIGNATURE-----

--hlKAtftNIgAp2zKm--


