Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84AE699E91
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 22:02:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSlNU-0007iz-BQ; Thu, 16 Feb 2023 16:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pSlNR-0007hZ-JB
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:01:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pSlNP-0004IK-Mc
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 16:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676581258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+tBQMhQblsoOADzxGqV+XcekNYFKTGUFJshid3YfGPs=;
 b=bNhHWMCLzS6OGHF26XO50W4FTZWvZ5wdD4oU9EX542F07Mql5jva5w31D/fEalTYn4zt/B
 ZKdDCmbo14VUwLtnzSxojnC1jdUSkIgKHC1PFQFLWeAb+f1zl9vUmoSLfxuFn3uPAjoa6D
 SrrSJGmPkWtk/7k1cH5yHrSYTrw4Et4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-uHYRTv2qPAucDIWDYItaEw-1; Thu, 16 Feb 2023 16:00:54 -0500
X-MC-Unique: uHYRTv2qPAucDIWDYItaEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D7B85A588;
 Thu, 16 Feb 2023 21:00:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4772F1121314;
 Thu, 16 Feb 2023 21:00:53 +0000 (UTC)
Date: Thu, 16 Feb 2023 16:00:51 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 yc-core@yandex-team.ru, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <Y+6Zgy7JgABed+RO@fedora>
References: <0d57cc40-693b-b36c-a135-fdac60dd00ec@yandex-team.ru>
 <CAJSP0QUXB0kgsCSsmi8dpnJFYho2cR_2Liep=pGmp6WzDZ_7pw@mail.gmail.com>
 <d6bf0b9a-a167-817d-2c17-c2e472961155@yandex-team.ru>
 <CAJSP0QXXe6KgLN2PJvi-5GqcELhUKJPB2pUARL2ktO9TQYAq=g@mail.gmail.com>
 <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru>
 <87h6w5ea1m.fsf@secure.mitica>
 <ed9832ec-eaf0-68a4-b7c1-9f1691ab149e@yandex-team.ru>
 <874js4v151.fsf@secure.mitica>
 <626f6e7c-07e4-4aa7-3cce-b96d9fd96d33@yandex-team.ru>
 <87mt5ly03z.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nyKNCi8hOw9wwgQO"
Content-Disposition: inline
In-Reply-To: <87mt5ly03z.fsf@secure.mitica>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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


--nyKNCi8hOw9wwgQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 10, 2023 at 05:08:16PM +0100, Juan Quintela wrote:
> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> > On 02/02/2023 11:59, Juan Quintela wrote:
> >> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> >>> On 01/02/2023 16:26, Juan Quintela wrote:
> >>>> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> >>>>> On 19/01/2023 18:02, Stefan Hajnoczi wrote:
> >>>>>> On Thu, 19 Jan 2023 at 10:29, Anton Kuchin <antonkuchin@yandex-tea=
m.ru> wrote:
> >>>>>>> On 19/01/2023 16:30, Stefan Hajnoczi wrote:
> >>>>>>>> On Thu, 19 Jan 2023 at 07:43, Anton Kuchin <antonkuchin@yandex-t=
eam.ru> wrote:
> >>>>>>>>> On 18/01/2023 17:52, Stefan Hajnoczi wrote:
> >>>>>>>>>> On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex=
-team.ru> wrote:
> >>>> Once told that, I think that you are making your live harder in the
> >>>> future when you add the other migratable devices.
> >>>>
> >>>> static const VMStateDescription vuf_vmstate =3D {
> >>>>       .name =3D "vhost-user-fs",
> >>>>       .minimum_version_id =3D 0,
> >>>>       .version_id =3D 0,
> >>>>       .fields =3D (VMStateField[]) {
> >>>>           VMSTATE_INT8(migration_type, struct VHostUserFS),
> >>>>           VMSTATE_VIRTIO_DEVICE,
> >>>>           VMSTATE_END_OF_LIST()
> >>>>       },
> >>>>       .pre_save =3D vhost_user_fs_pre_save,
> >>>>       .subsections =3D (const VMStateDescription*[]) {
> >>>>           &vmstate_vhost_user_fs_internal_sub,
> >>>>           NULL
> >>>>       }
> >>>> };
> >>>>
> >>>> And you are done.
> >>>>
> >>>> I will propose to use a property to set migration_type, but I didn't
> >>>> want to write the code right now.
> >
> > I have a little problem with implementation here and need an advice:
> >
> > Can we make this property adjustable at runtime after device was realiz=
ed?
> > There is a statement in qemu wiki [1] that makes me think this is possi=
ble
> > but I couldn't find any code for it or example in other devices.
> >> "Properties are, by default, locked while the device is
> >   realized. Exceptions
> >> can be made by the devices themselves in order to implement a way
> >   for a user
> >> to interact with a device while it is realized."
> >
> > Or is your idea just to set this property once at construction and keep=
 it
> > constant for device lifetime?
> >
> > [1] https://wiki.qemu.org/Features/QOM
>=20
> I have no clue here.  Markus?  Stefan?

Sorry for the late reply. Yes, QOM properties can be set after realize
(e.g. using the qom-set command).

The set() callback can return an error, so some properties are
implemented to refuse updates when ->realize is true.

Stefan

--nyKNCi8hOw9wwgQO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPumYMACgkQnKSrs4Gr
c8h6+gf/Xm3DQUOYtCY4IS1GB6hMp0BIP3zfOfyPBh/CVlDtME0ngqYlOrBqxYZ6
wWEXSyTyHwxhGMK7TkNt0JofrNHdQegdvwqXZOtpoLmxcVjCkohHa6Dh3K8H9q/f
JcPdxz6+PPHzf293Rbo7XalCqYveWAPX+geTWRQDwLsaYksnv23UlXzkyqZQ2fyD
8MzRc3AILX9kwTZwWYRCUGEt9HubeE1jnu3tXp4cmAyvWOd4ap/d7dAMguZZlV8C
J7omECt5rZx5GLVdf5N8l9J/H6mUyXdGRppfsCAon3/yeSDwyNiRVsbpUQOaYqM5
iYsbZRqzkoZH9bnFp0l7wKk01WbkOA==
=bGPP
-----END PGP SIGNATURE-----

--nyKNCi8hOw9wwgQO--


