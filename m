Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61C678A07
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 22:57:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK4o2-0004nl-Eo; Mon, 23 Jan 2023 16:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK4o0-0004nO-Di
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 16:56:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK4ny-00064o-LC
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 16:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674511001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HDJy22W4PuWuRO/O2Vx9dS09Kk/HBWgBXsgGohIWF7M=;
 b=GeB/C3wePkxQsZefirC94RTZNhlfjBCNvmrC92yp6RSYRZAqHdqPHPby69y2aOhQsN/0je
 NXIoTZEdFRIHbxjxd9/nO7EDG39K+k7wpuMj97r6IDqv/zU9Xa50tmuOoUKI9L9FjwjQVa
 pL6Qr/lteP1JJ+r7mI+DM11P9ejTwrE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-I5ds5wEBOG23-E7WaUhpCw-1; Mon, 23 Jan 2023 16:56:37 -0500
X-MC-Unique: I5ds5wEBOG23-E7WaUhpCw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5045B886461;
 Mon, 23 Jan 2023 21:56:37 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B32C0492B02;
 Mon, 23 Jan 2023 21:56:36 +0000 (UTC)
Date: Mon, 23 Jan 2023 16:56:34 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <Y88Cknp1XwN8rGHA@fedora>
References: <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
 <20230122030455-mutt-send-email-mst@kernel.org>
 <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
 <20230122093903-mutt-send-email-mst@kernel.org>
 <70c0f00a-7828-3ccf-c2ea-49aeef8693e9@yandex-team.ru>
 <20230122111618-mutt-send-email-mst@kernel.org>
 <CAJSP0QXnKGrX3WuSJxe7pLctcueW1AkEc_KUsHGucaDq=VJZkg@mail.gmail.com>
 <21b87a0d-99b1-2755-00de-d1201d85a63e@yandex-team.ru>
 <Y87k0wBnHuf5Oktp@fedora>
 <20230123155228-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z50+DLanrM9+xm5R"
Content-Disposition: inline
In-Reply-To: <20230123155228-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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


--Z50+DLanrM9+xm5R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 04:00:50PM -0500, Michael S. Tsirkin wrote:
> On Mon, Jan 23, 2023 at 02:49:39PM -0500, Stefan Hajnoczi wrote:
> > The point of the migration blocker is to prevent breaking running
> > guests. Situations where a migration completes but results in a broken
> > guest are problematic for users (especially when they are not logged in
> > to guests and able to fix them interactively).
>=20
> I thought it's the reverse - we block when we are sure it can't work.
> If we are not sure we should leave policy to orchestrators.
>=20
> You can always get into situations like this with stateful storage (as
> opposed to RO one).  For example, naively scp the backend file then
> start migration. Will seem to work but corrupts the disk (I didn't try,
> for sure with raw but what about qcow2?)

You're right that ultimately QEMU cannot verify that the destination
will 100% work. Who knows if the destination is even a real QEMU or just
a process that throws away the migration stream? :)

> > If a command-line option is set to override the blocker, that's fine.
> > But there needs to be a blocker by default if external knowledge is
> > required to decide whether or not it's safe to migrate.
>=20
> If all the command line says is "I want migration to work" then
> that's more like shifting the blame than helping users.
> They just learn this one weird trick and it seems to work
> until it doesn't.  Then we are like "we told you only to set this
> flag if you are sure" and they are like "well I was sure".

What I'm getting at is that this is a breaking change. Previously the
management tool didn't need to be aware of vhost-user-fs migration
support. QEMU would reject migrations. We cannot start allowing them
because management tools may depend on QEMU's migration blocker.

If management tools need to be aware now then the safe way to introduce
this is via a parameter that new management tools must explicitly pass
to QEMU.

Anton's same host migration case is valid but the majority of users
migrate between hosts and that case is not supported yet. Most of the
time vhost-user-fs migration won't work. Let's not break existing
management tools and vhost-user-fs back-ends.

Stefan

--Z50+DLanrM9+xm5R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPPApIACgkQnKSrs4Gr
c8ixywf/eRBpkuEQnmrV3XXvPbY0Ms6YXmXTSC8kMtyT7MocFtl09uP0DIvbEcq2
81JbuI9gSPTQKAT9Ybx6CfpwlXdV5iPuSHYSQ+orSpVQwuw7H4Lqy/RWVHfYRzz4
7U5+/BOl8d9xvs8aHZsQdddMr3qtUgrDO8EM5OG7fLAjIOyQPaMs9lmeuHILOZTz
tyvvlm805fD8diK7sskdJsOPVGiqW5du5BMH95T3MTZlLpXepB0rylapEqbfL4Qw
x0z9bAo3OAsJ+hINz8O3JVEy4mgZjZKm+kKy83Uxr3MTwy1MIw+OlTOBmHs4bVKN
5vORO2KVCRZ00foKSavmltOxJD697A==
=pWJc
-----END PGP SIGNATURE-----

--Z50+DLanrM9+xm5R--


