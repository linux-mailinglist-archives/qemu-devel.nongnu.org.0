Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA326786D5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 20:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK2pK-0007Xl-DQ; Mon, 23 Jan 2023 14:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK2pG-0007XX-Gl
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK2pE-0003KF-PF
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 14:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674503391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GoYV+dDN8XvExiHpG00ebYAvptacyqb8i8xpvK0/RtY=;
 b=gGNDPhuU2boClxXu1RPhEKbHkB5iDfMWdulGULcDbPII+lH8VKC/cix/3kIfVyTbXooeMR
 R2Ek6jCXKCeOWvH9OCnJL8utDlWkIt5znufUv+iddQqngeumxcY3vq+xNbT0JxRrzesShx
 F3jSEu8yy2L+km4vBgPbfYPbxkIYzSk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-Y9D23saXMAWGFMdLgZ1Cxg-1; Mon, 23 Jan 2023 14:49:45 -0500
X-MC-Unique: Y9D23saXMAWGFMdLgZ1Cxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B7D0101A55E;
 Mon, 23 Jan 2023 19:49:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 609CC2166B32;
 Mon, 23 Jan 2023 19:49:40 +0000 (UTC)
Date: Mon, 23 Jan 2023 14:49:39 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <Y87k0wBnHuf5Oktp@fedora>
References: <f9993404-f8b8-7a23-37f8-530313783466@yandex-team.ru>
 <20230120085534-mutt-send-email-mst@kernel.org>
 <703d527f-de92-090c-6ce1-af0dec7de033@yandex-team.ru>
 <20230122030455-mutt-send-email-mst@kernel.org>
 <b7de3adc-cba7-09eb-ea93-f4bfb91bea9e@yandex-team.ru>
 <20230122093903-mutt-send-email-mst@kernel.org>
 <70c0f00a-7828-3ccf-c2ea-49aeef8693e9@yandex-team.ru>
 <20230122111618-mutt-send-email-mst@kernel.org>
 <CAJSP0QXnKGrX3WuSJxe7pLctcueW1AkEc_KUsHGucaDq=VJZkg@mail.gmail.com>
 <21b87a0d-99b1-2755-00de-d1201d85a63e@yandex-team.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2T541naaH7nRO+Kw"
Content-Disposition: inline
In-Reply-To: <21b87a0d-99b1-2755-00de-d1201d85a63e@yandex-team.ru>
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


--2T541naaH7nRO+Kw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 05:52:17PM +0200, Anton Kuchin wrote:
>=20
> On 23/01/2023 16:09, Stefan Hajnoczi wrote:
> > On Sun, 22 Jan 2023 at 11:18, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > On Sun, Jan 22, 2023 at 06:09:40PM +0200, Anton Kuchin wrote:
> > > > On 22/01/2023 16:46, Michael S. Tsirkin wrote:
> > > > > On Sun, Jan 22, 2023 at 02:36:04PM +0200, Anton Kuchin wrote:
> > > > > > > > This flag should be set when qemu don't need to worry about=
 any
> > > > > > > > external state stored in vhost-user daemons during migratio=
n:
> > > > > > > > don't fail migration, just pack generic virtio device state=
s to
> > > > > > > > migration stream and orchestrator guarantees that the rest =
of the
> > > > > > > > state will be present at the destination to restore full co=
ntext and
> > > > > > > > continue running.
> > > > > > > Sorry  I still do not get it.  So fundamentally, why do we ne=
ed this property?
> > > > > > > vhost-user-fs is not created by default that we'd then need o=
pt-in to
> > > > > > > the special "migrateable" case.
> > > > > > > That's why I said it might make some sense as a device proper=
ty as qemu
> > > > > > > tracks whether device is unplugged for us.
> > > > > > >=20
> > > > > > > But as written, if you are going to teach the orchestrator ab=
out
> > > > > > > vhost-user-fs and its special needs, just teach it when to mi=
grate and
> > > > > > > where not to migrate.
> > > > > > >=20
> > > > > > > Either we describe the special situation to qemu and let qemu
> > > > > > > make an intelligent decision whether to allow migration,
> > > > > > > or we trust the orchestrator. And if it's the latter, then 'm=
igrate'
> > > > > > > already says orchestrator decided to migrate.
> > > > > > The problem I'm trying to solve is that most of vhost-user devi=
ces
> > > > > > now block migration in qemu. And this makes sense since qemu ca=
n't
> > > > > > extract and transfer backend daemon state. But this prevents us=
 from
> > > > > > updating qemu executable via local migration. So this flag is
> > > > > > intended more as a safety check that says "I know what I'm doin=
g".
> > > > > >=20
> > > > > > I agree that it is not really necessary if we trust the orchest=
rator
> > > > > > to request migration only when the migration can be performed i=
n a
> > > > > > safe way. But changing the current behavior of vhost-user-fs fr=
om
> > > > > > "always blocks migration" to "migrates partial state whenever
> > > > > > orchestrator requests it" seems a little  dangerous and can be
> > > > > > misinterpreted as full support for migration in all cases.
> > > > > It's not really different from block is it? orchestrator has to a=
rrange
> > > > > for backend migration. I think we just assumed there's no use-cas=
e where
> > > > > this is practical for vhost-user-fs so we blocked it.
> > > > > But in any case it's orchestrator's responsibility.
> > > > Yes, you are right. So do you think we should just drop the blocker
> > > > without adding a new flag?
> > > I'd be inclined to. I am curious what do dgilbert and stefanha think =
though.
> > If the migration blocker is removed, what happens when a user attempts
> > to migrate with a management tool and/or vhost-user-fs server
> > implementation that don't support migration?
>=20
> There will be no matching fuse-session in destination endpoint so all
> requests to this fs will fail until it is remounted from guest to
> send new FUSE_INIT message that does session setup.

The point of the migration blocker is to prevent breaking running
guests. Situations where a migration completes but results in a broken
guest are problematic for users (especially when they are not logged in
to guests and able to fix them interactively).

If a command-line option is set to override the blocker, that's fine.
But there needs to be a blocker by default if external knowledge is
required to decide whether or not it's safe to migrate.

> >=20
> > Anton: Can you explain how stateless migration will work on the
> > vhost-user-fs back-end side? Is it reusing vhost-user reconnect
> > functionality or introducing a new mode for stateless migration? I
> > guess the vhost-user-fs back-end implementation is required to
> > implement VHOST_F_LOG_ALL so dirty memory can be tracked and drain all
> > in-flight requests when vrings are stopped?
>=20
> It reuses existing vhost-user reconnect code to resubmit inflight
> requests.
> Sure, backend needs to support this feature - presence of required
> features is checked by generic vhost and vhost-user code during init
> and if something is missing migration blocker is assigned to the
> device (not a static one in vmstate that I remove in this patch, but
> other per-device kind of blocker).

This is not enough detail. Please post the QEMU patches before we commit
to a user-visible vhost-user-fs command-line parameter.

I think what you're trying is a new approach that can be made to work.
However, both vhost-user and migration are fragile and you have not
explained how it will work. I don't have confidence in merging this
incrementally because I'm afraid of committing to user-visible or
vhost-user protocol behavior that turns out to be broken just a little
while later.

The kind of detail I was hoping to hear was, for example, how
vhost_user_blk_device_realize() blocks and tries to reconnect 3 times.
Does this approach work for stateless migration? The destination QEMU is
launched before the source QEMU disconnects from the vhost-user UNIX
domain socket, so I guess the destination QEMU cannot connect in the
current version of vhost-user reconnect as implemented by QEMU's
vhost-user-blk device. Have you come up with a new handover protocol?

Stefan

--2T541naaH7nRO+Kw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPO5NIACgkQnKSrs4Gr
c8hsKQf5AZO1/SZQ9qT/dACjViSYwF+ZB+zFCHHigghzdPjVEGDZL3rqIHZBoDCB
UcKmRB1PRLLWNNs2pzr02spEl9pY7e0y0dXZBcWxBhrj6J4zzMt8WvfGjuKNNRlf
z/lhaZA4pwtJpt/zF0zhTM22R0BhF8mix7D4kUXZoCaIQerd94VLfbiQu8SKQzcq
b2sptH3iDeAgOH+PiltIdM1S2DZGDTl/aYxkJK6xEC9RkFcnPFK/xdPQMpUtgzGO
NzuGi9D0AtJ3ayV62qZ+gwenC6bLHs2CiBOXHaNlOMHxjqMRGuy8/xQ3p8Bd9xHA
Cv4TIuOAZJGN1i+JJmaiPtK39j4BDg==
=Rmvd
-----END PGP SIGNATURE-----

--2T541naaH7nRO+Kw--


