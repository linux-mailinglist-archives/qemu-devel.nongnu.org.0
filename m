Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7728167BAFA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 20:47:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKlip-0005cl-Qe; Wed, 25 Jan 2023 14:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKlin-0005cc-4f
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 14:46:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pKlii-0002NU-6S
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 14:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674675965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uNr88SPLYYvo3iE3N0wzTOEQEswp1GT/mJbLFPKrOTo=;
 b=CDTX7xeYNi2cmB4DL4kU4wKb/rrWNuao2aW0BL7fzooLF7nKwcOWeT37SlJrfe+1/ijEe8
 uYr0cqPQ+OdRjuhKxpbxX3pVxL3YTNsZ0ZaXwTmSlwIj396B40cXohTOYzs9FJvSIOOfwd
 vhosRThtF6NgxfENcDiX1RQVGqaywfc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-mUJoueHcNE-BVFENXRQgpQ-1; Wed, 25 Jan 2023 14:46:03 -0500
X-MC-Unique: mUJoueHcNE-BVFENXRQgpQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 453333804073;
 Wed, 25 Jan 2023 19:46:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 971F12166B26;
 Wed, 25 Jan 2023 19:46:02 +0000 (UTC)
Date: Wed, 25 Jan 2023 14:46:00 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <Y9GG+EXX03TAvWDS@fedora>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ygiLBLz14JAm0xgO"
Content-Disposition: inline
In-Reply-To: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--ygiLBLz14JAm0xgO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 15, 2023 at 07:09:03PM +0200, Anton Kuchin wrote:
> Now any vhost-user-fs device makes VM unmigratable, that also prevents
> qemu update without stopping the VM. In most cases that makes sense
> because qemu has no way to transfer FUSE session state.
>=20
> But we can give an option to orchestrator to override this if it can
> guarantee that state will be preserved (e.g. it uses migration to
> update qemu and dst will run on the same host as src and use the same
> socket endpoints).
>=20
> This patch keeps default behavior that prevents migration with such devic=
es
> but adds migration capability 'vhost-user-fs' to explicitly allow migrati=
on.
>=20
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>  hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
>  qapi/migration.json       |  7 ++++++-
>  2 files changed, 30 insertions(+), 2 deletions(-)

Hi Anton,
Sorry for holding up your work with the discussions that we had. I still
feel it's important to agree on command-line and/or vhost-user protocol
changes that will be able to support non-migratable, stateless
migration/reconnect, and stateful migration vhost-user-fs back-ends. All
three will exist.

As a next step, could you share your code that implements the QEMU side
of stateless migration?

I think that will make it clearer whether a command-line option
(migration capability or per-device) is sufficient or whether the
vhost-user protocol needs to be extended.

If the vhost-user protocol is extended then maybe no user-visible
changes are necessary. QEMU will know if the vhost-user-fs backend
supports migration and which type of migration. It can block migration
in cases where it's not possible.

Thanks,
Stefan

--ygiLBLz14JAm0xgO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPRhvgACgkQnKSrs4Gr
c8izOgf/byjN54t5uv1VugMSLblTq6dHpjGJDpdmjIb7QjBk/VTe57XFhBOp4VEg
mlDNTVHBc4lU0NHize5dueoW8wUMKT+gQq8Tb6O5VabHZA1NJVQ2TOrlwWt4Q6bn
eS3IAIRB+4JoFPlYzJMa9MhkEjbnlJ6yYpVvuo8tNfTOMCHdirDiBWx/P43F0X2W
6TNkpr56+NixIO5E0wfnKPfkiS083h9PqVYFy7WH6debjBM+IRyBSaRSaLpgJRHt
a8D4rjb+XFxW71qFFMK3XWa/8sy2MfLCW2oPC1Zc137ItjqxaxRwqiZKsrU79GLi
WuQcgk2e7RYTUbLRfJXdbrH27j0N8g==
=VwlJ
-----END PGP SIGNATURE-----

--ygiLBLz14JAm0xgO--


