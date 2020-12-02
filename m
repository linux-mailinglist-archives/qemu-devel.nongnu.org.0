Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E38C2CBFB8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:31:37 +0100 (CET)
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkTAO-0001sr-3Y
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT8N-0000j5-PF
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:29:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT8M-00042m-AJ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606919369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VzrR2qgcOW3ZTogmGln9T6Ashisy6wSxN+kyP3Xb6QY=;
 b=JhG8PNT3PHbk+uIUNrE5jxzXzJrA+3AVvSAlxdza4EuszIw47WOmMG9NYbWYKl11ofnUjL
 XMC5DL90dO2h3RSKBLZiZGLsaTeAFZWAtuTXb/jQgibEdipw8sPgmnb8+oK9MLmFOXvQv+
 rrJ0BuQjBFcga6Lo9DMDfD/b7kMNqe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-HLxcsvcLOHybONPV9DK5fg-1; Wed, 02 Dec 2020 09:29:24 -0500
X-MC-Unique: HLxcsvcLOHybONPV9DK5fg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3035B1922035
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 14:29:23 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A69C81042A48;
 Wed,  2 Dec 2020 14:28:56 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:28:55 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 8/8] .gitlab-ci: add build-libvhost-user
Message-ID: <20201202142855.GJ655829@stefanha-x1.localdomain>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
 <20201125100640.366523-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201125100640.366523-9-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6J7GEvtanOfV9oXA"
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

--6J7GEvtanOfV9oXA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 02:06:40PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  .gitlab-ci.yml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--6J7GEvtanOfV9oXA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/HpKYACgkQnKSrs4Gr
c8hVOgf/QNPoalGQZ6FABx7XE8kDzLV5Ohbg96nlXVEgUoxc/XY3TgChbvow7DeS
SzTzN/82cIcDKw+nR9Cxv+W49U5OvAGYqWaVBGYC3U8ZfILli0HaRDFaxOzEKxKX
MT9bNOY8/WBcEEfXcMmtP5ZkODIDtvNyjMzpsTYAEEIr4wyDM6DW3mVN2MKg6R74
8ftg9/N/q06Vv15aKI5P0AX+jhUyy7eUqjyYy5tJlwCfQPYqLbUTBiBH2zIGhcQs
M+Zm5/lfGNUrnkxgA6+dwXe/hdy01Y+gdPpcb4pscGU4tNneG8WDlpLo5CKZBL17
ko7o5NrkmuFdRVwYH1Ojd0FN5D13CQ==
=1PX+
-----END PGP SIGNATURE-----

--6J7GEvtanOfV9oXA--


