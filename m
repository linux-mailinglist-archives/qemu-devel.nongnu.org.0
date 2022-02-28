Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237504C72A0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:27:16 +0100 (CET)
Received: from localhost ([::1]:50104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOjnm-0003Hd-Mr
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:27:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOjm3-0001wh-Ew
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 12:25:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nOjly-0002bi-5u
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 12:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646069121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vMRWVv6TNn0pEX8CGLkJ9UXRt3rPCkRZEhbg8W5JZ+0=;
 b=KZHfPiSqL2m1Euks0GtuAgsYomIslEBuuFpUQnfsKnmaOnOD8uFeBRv4YEjBOb34nIgH+s
 VbKXZS8Q7SszX55g7xm3ejWetP38mAOYNCrRKUblcGQRy0PiNRr3HDRxgOU3auYXmyKKs/
 Sub5zM9A0q2jpez//hDp1rf7hVO2coA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-LUqYyvR0MCWxpqvjBpQH9w-1; Mon, 28 Feb 2022 12:25:17 -0500
X-MC-Unique: LUqYyvR0MCWxpqvjBpQH9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50B531006AA5;
 Mon, 28 Feb 2022 17:25:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9694F3480B;
 Mon, 28 Feb 2022 17:24:40 +0000 (UTC)
Date: Mon, 28 Feb 2022 17:24:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: What is the correct way to handle the VirtIO config space in
 vhost-user?
Message-ID: <Yh0FV+0SfdPugRRX@stefanha-x1.localdomain>
References: <87ee3q3mos.fsf@linaro.org> <87a6ee3l5e.fsf@linaro.org>
 <YhzWMMLTZY1e24Uh@stefanha-x1.localdomain>
 <87mtiblzsc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KoqIJ9asIaRGbUtN"
Content-Disposition: inline
In-Reply-To: <87mtiblzsc.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KoqIJ9asIaRGbUtN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 04:16:43PM +0000, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > [[PGP Signed Part:Undecided]]
> > On Fri, Feb 25, 2022 at 05:32:43PM +0000, Alex Benn=E9e wrote:
> >>=20
> >> [Apologies to CC list for repost due to fat fingering the mailing list=
 address]
> >>=20
> <snip>
> >>=20
> >> (aside: this continues my QOM confusion about when things should be in=
 a
> >> class or instance init, up until this point I hadn't needed it in my
> >> stub).
> >
> > Class init is a one-time per-class initializer function. It is mostly
> > used for setting up callbacks/overridden methods from the base class.
> >
> > Instance init is like an object constructor in object-oriented
> > programming.
>=20
> I phrased my statement poorly. What I meant to say is I sometimes find
> QEMUs approach to using class over instance initialisation inconsistent.
> I think I understand the "policy" as use class init until there is a
> case where you can't (e.g. having individual control of each instance of
> a device).
>=20
> > This is not a .get_config() method, it's a VIRTIO configuration change
> > notification handler. The vhost-user-blk device server ("slave") sends
> > this notification to notify the driver that configuration space contents
> > have been updated (e.g. the disk was resized).
>=20
> So this should come in the initial vhost-user set of handshake messages
> if the VHOST_USER_PROTOCOL_F_CONFIG is negotiated between the master and
> slave? I guess without this protocol feature vhost-user can't support
> writeable config spaces?

The VHOST_USER_PROTOCOL_F_CONFIG vhost-user protocol feature bit
enables:
1. VHOST_USER_GET_CONFIG - reading configuration space
2. VHOST_USER_SET_CONFIG - writing configuration space
3. VHOST_USER_SLAVE_CONFIG_CHANGE_MSG - change notifications

If the vhost-user server is supposed to participate in configuration
space accesses/notifications, then it needs to implement
VHOST_USER_PROTOCOL_F_CONFIG.

QEMU's vhost-user-blk assumes the vhost-user server supports
VHOST_USER_PROTOCOL_F_CONFIG. It's an optional vhost-user protocol
feature but the virtio-blk device relies on configuration space
(otherwise QEMU's --device vhost-user-blk wouldn't know the capacity of
the disk). vhost_user_blk_realize_connect() sends VHOST_USER_GET_CONFIG
to fetch the configuration space contents when the device is
instantiated.

Some vhost-user device types don't need VHOST_USER_PROTOCOL_F_CONFIG. In
that case QEMU's --device vhost-user-FOO implements .get/set_config()
itself. virtio-net is an example where this is the case.

> > QEMU fetches the new
> > config space contents from the device and then forwards the notification
> > to the guest.
> >
> > The .get_config() method for vhost-user-blk.c is:
> >
> >   static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t =
*config)
> >   {
> >       VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> >  =20
> >       /* Our num_queues overrides the device backend */
> >       virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
> >  =20
> >       memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
> >   }
> >
> > vhost_user_blk_update_config() is simple, it copies out s->blkcfg.
> >
> >> Although this seems to miss the ability to "set" a config - although
> >> that seems confusing anyway, surely the guest only ever reads the conf=
ig
> >> space?
> >
> > VIRTIO allows the driver to write to the config space. This is used to
> > toggle the disk write cache on the virtio-blk device, for example.
> >
> >> So my question is which approach is the correct one? Is one a legacy
> >> approach or is it "depends on what you are doing"?
> >
> > Yes, it depends on whether the device sends configuration space change
> > notifications or not. If not, a traditional .get_config() like
> > vhost-user-gpu can be used. If yes, then caching the configuration space
> > contents like vhost-user-blk is convenient.
>=20
> Is there any feature flag for this in the VirtIO spec? I had a look and
> couldn't see an obvious common one. Does it basically come down to the
> verbiage in the Device configure layout section for any given device?

The contents of the configuration space are device-specific, so there is
no generic feature flag. Many devices don't update the configuration
space and therefore don't send change notifications. The details are
documented for each device type (e.g. "if the driver negotiated the
VIRTIO_CONSOLE_F_SIZE feature, a configuration change notification
indicates that the updated size can be read from the configuration
fields").

I just noticed that VIRTIO does not specify that the virtio-blk capacity
field can change. The spec is incomplete and I will send a patch for
that.

Stefan

--KoqIJ9asIaRGbUtN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIdBVcACgkQnKSrs4Gr
c8gSlwgAwOSbZRexO0e4AZ3JBLNCZSMeqQHL+hHhdxYSNG26BhMKLz9b5C8ww1vh
/LR4gplzXAzSuaqjbiGUPMzZnP/GZQ4YtkLHoI+UJKMcr/0ue2LvSJes7J7x7cT+
YHJaR/d0vdSbAFZPeKxg6BenEKoc54EL3fBO0iQ7OAhv7TMLYfV/evN2RIxqqPbX
QUVVKxbGJ5ms+Nv+c38307yTdMUNwYdxbXUsFwa7kEGfopNxtHy1KJDQtW3pNmnU
5gYOSvDRpXwQVfFdLSpyIrkeOTsrNkv7zeAqGX/fHKQUicP3KF9ZDX34rMyNrGfO
WGBhi5GD3RbJ6atrQ523uCuMpsC9fQ==
=gdT6
-----END PGP SIGNATURE-----

--KoqIJ9asIaRGbUtN--


