Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C9469E91A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 21:47:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUZWP-0006Xb-UL; Tue, 21 Feb 2023 15:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUZWG-0006OX-RK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 15:45:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUZWE-0001iR-Tk
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 15:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677012345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6u2pkiyW1Z3v6Y/wc4iWofmC/bNNfVL0bi09g3p2EM=;
 b=d0tdEptMcwL3yCYrx4CaYn7Mhe1E8RW9eYL1v0fu8PqBhA5QSfmCUhUmamXCFf+NZSv28m
 0r1CXq/s/Y9USQ1IA0iOZR1g134fkOk00UpPkgd4eihldlDZBbX8igmLQdDUZoPTGBfUJ2
 wPydVTNgtJoTJ2Qoqvpgg7IkZ1Sm3W0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-n0MN3A2BOfq78Wx8XMQT8g-1; Tue, 21 Feb 2023 15:45:41 -0500
X-MC-Unique: n0MN3A2BOfq78Wx8XMQT8g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D7A5857A81;
 Tue, 21 Feb 2023 20:45:41 +0000 (UTC)
Received: from localhost (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D5CD492B04;
 Tue, 21 Feb 2023 20:45:39 +0000 (UTC)
Date: Tue, 21 Feb 2023 15:45:38 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <Y/UtctcE2Zz6fN/m@fedora>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1cajONYwFAWKaZxB"
Content-Disposition: inline
In-Reply-To: <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--1cajONYwFAWKaZxB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2023 at 07:00:38PM +0200, Anton Kuchin wrote:
> Migration of vhost-user-fs device requires transfer of FUSE internal state
> from backend. There is no standard way to do it now so by default migrati=
on
> must be blocked. But if this state can be externally transferred by
> orchestrator give it an option to explicitly allow migration.
>=20
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>  hw/core/qdev-properties-system.c    | 10 +++++++++
>  hw/virtio/vhost-user-fs.c           | 32 ++++++++++++++++++++++++++++-
>  include/hw/qdev-properties-system.h |  1 +
>  include/hw/virtio/vhost-user-fs.h   |  2 ++
>  qapi/migration.json                 | 16 +++++++++++++++
>  5 files changed, 60 insertions(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--1cajONYwFAWKaZxB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP1LXIACgkQnKSrs4Gr
c8ivrwgAt5GdQxjyi0fVLBoBkgHZheMzo79D9gVii15uTadRD01uNa0S5w6gjfEk
IgYeiEXydei/COYYX7HjUcd3jRezxIfVPQALNp5aqnylOnBar1+a/Bc7GzpsIJM0
0KrJco5zRmKV8fP7Yvd++QJkilhqKNsrJqaJ3cbAbVkdC/lBnJfHqtzwdb2zMKsH
xtS7KX+l3FBt8SHwdMAodKVr6u3UnjltP+K0os0agHu8kt8DRW4blHl1UlIBNU4F
XaaD0iOBBdH6Zak4rD7ZLC5IfOa0AXkVP2KdCRR6yS+OoKNes+kcleV/Nc2W2FlC
x1jF0TWf6AwMw4VtBZwCbtJX3VCNGQ==
=ZmWd
-----END PGP SIGNATURE-----

--1cajONYwFAWKaZxB--


