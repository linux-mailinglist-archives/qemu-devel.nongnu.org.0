Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645CC30DFAE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:26:40 +0100 (CET)
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7KzH-0000c9-FG
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7Kqk-0002K3-NT
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7Kqb-0001tG-QC
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OVaMKxyZ4OtmLLQO8EE/oX/ZtSka7TsLBOeNat5PAY8=;
 b=BR+Do/cX+cGz0FPnvi+A5UnFo3qvbj3Q5DefkU5e25QEF/js1JBBFNqcfNZGQ1gxadHLfs
 LiA5S2g9Iz5D5ljf4gMTqbwTNW6JCB+RNfDYnKGYXAxEWWnydEkAKukWUNi0EQNZ1KVwfh
 UMNpenLq2vE12LHhNsoYy1kgFrSzDZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-t0KSQtHeNLaYSIslgrcaxg-1; Wed, 03 Feb 2021 11:17:37 -0500
X-MC-Unique: t0KSQtHeNLaYSIslgrcaxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77494802B56
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 16:17:36 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D85472161;
 Wed,  3 Feb 2021 16:17:32 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:17:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 7/8] trace/simple: pass iter to st_write_event_mapping
Message-ID: <20210203161732.GD241524@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-8-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-8-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:27PM +0100, Gerd Hoffmann wrote:
> Pass an iter to st_write_event_mapping, so the function can interate
> different things depending on how we initialize the iter.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  trace/simple.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAazJwACgkQnKSrs4Gr
c8ij+QgAqcVDqTWvBadiIiCsLxZCzcoiwMh4V6z9XE8c7CNNibgOOm32h8d85MsV
VRKCFF4lg6ig9kMk8mGDOh1TbiCgcV7Sx1ruQgMFR2/VhUyvu2zdoUKBX2LvdzJo
fF+aa1f0v3KE0rJFYUA0jGDO7WxG2y4GotJzYf2tGSrmYA/jSwrt+03ocLvdpZkH
sjOlZExoy5qwmM4aKYJhXhK9ok/FX2K3i5TcJttWRCNpsIEAmLSAyGBCIUEP8/Ld
TWi9+tt0h9kzwiesAT/sjfgXomd1Gsx6jeBfCkU25VQoj7L2TqSrAuh+yXknyzUC
rwzcRPmJMd2uE/aYkRQKwl2WrZv53w==
=y/im
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--


