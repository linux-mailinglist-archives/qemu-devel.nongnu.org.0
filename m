Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AF52E08BA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:27:03 +0100 (CET)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kresg-0006Ka-3h
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:27:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kreqU-0005MK-Kl
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:24:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kreqS-000870-Hj
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608632683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VoLE+3ntGgagTDaie0WLPKJ3KP1Axyh/KLc0WciPQlU=;
 b=PB2r27UHOjK/XPoFvOWw7g/oq5QXXLboGGtVTkh7G9tYFqx3Yr1U0CKLwvswXAMwOmnJQw
 pYlen2kkXMOyM7xHGA5Elgw91kQ4HRrmpmkxREMYlWxmzWzwiiiB1nopu5dwU/Bf+ePhK0
 Uq2gXCrvS2p7r6Nl5doIW5i2k9G+QDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-kbtSm4WXN6e7KCHj_ucTow-1; Tue, 22 Dec 2020 05:24:40 -0500
X-MC-Unique: kbtSm4WXN6e7KCHj_ucTow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E877801AA5;
 Tue, 22 Dec 2020 10:24:38 +0000 (UTC)
Received: from localhost (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB3536E707;
 Tue, 22 Dec 2020 10:24:27 +0000 (UTC)
Date: Tue, 22 Dec 2020 10:24:26 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v14 RESEND 08/21] multi-process: add qio channel write
 function
Message-ID: <20201222102426.GB105660@stefanha-x1.localdomain>
References: <cover.1608263017.git.elena.ufimtseva@oracle.com>
 <5c5ef9d87f35255e626055af353fbc62517773ca.1608263018.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <5c5ef9d87f35255e626055af353fbc62517773ca.1608263018.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 pbonzini@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2020 at 09:40:38PM -0800, elena.ufimtseva@oracle.com wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>=20
> Adds qio_channel_writev_full_all() to transmit both data and FDs.
> Refactors existing code to use this function.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/io/channel.h | 25 +++++++++++++++++++++++++
>  io/channel.c         | 17 ++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/hyVoACgkQnKSrs4Gr
c8gBvAf/dDvd7cr+6dFi0NiPG2gJeltVCgK6ERL5iulpLoJbi+W6BUIU/28qB2GC
xzuyvRZZS18qL5seW7eOldBpQ5/wMdy8R9XXSJFc27m6JBhYVVXSW1X+bRlx5ZMG
IR3KRjCKjdv4TwX0N6DEZl9HziNwaXt+WIGFELMSKw1cBIdOgGB6gkTz2ZvceC9J
ByyfePUqJ1VVSJlYArI4URw02TuZ02XYmMjC0xqHdkxj4mw67s6UKmRfiIjqO5yi
ql2nYgih2BwzcYpyESM4dE9X/6Mt8OylQiwhsfKEOGV7aHN5I8aI6J7ld46m7D9u
G/OXc4m+nHrNcpcwaODDGSiVOcX/Cw==
=YyJI
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--


